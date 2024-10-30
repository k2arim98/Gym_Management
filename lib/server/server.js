const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const { Pool } = require('pg');
const bcrypt = require('bcrypt');

const app = express();
const port = 3000;

const pool = new Pool({
  user: 'YOUR_USER_NAME',
  host: 'localhost',
  database: 'DB_NAME',
  password: 'YOUR_PASSWORD',
  port: 5432,
});

app.use(bodyParser.json());
app.use(cors());

const createUser = async (fullName, email, password) => {
  const hashedPassword = await bcrypt.hash(password, 10); // Hash the password
  const res = await pool.query(
    'INSERT INTO users (full_name, email, password) VALUES ($1, $2, $3) RETURNING *',
    [fullName, email, hashedPassword]
  );
  return res.rows[0];
};

app.post('/register', async (req, res) => {
  try {
    const { full_name, email, password } = req.body;
    const newUser = await createUser(full_name, email, password);
    res.status(201).json(newUser);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

app.post('/login', async (req, res) => {
    try {
      const { email, password } = req.body;
      const userRes = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
      
      if (userRes.rows.length === 0) {
        return res.status(400).json({ message: 'User not found' });
      }
  
      const user = userRes.rows[0];
      const isPasswordMatch = await bcrypt.compare(password, user.password);
  
      if (!isPasswordMatch) {
        return res.status(400).json({ message: 'Invalid password' });
      }
  
      res.status(200).json({ message: 'Login successful', user });
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal server error' });
    }
  });
  app.get('/user/:email', async (req, res) => {
    try {
      const { email } = req.params;
      const userRes = await pool.query('SELECT * FROM users WHERE email = $1', [email]);
  
      if (userRes.rows.length === 0) {
        return res.status(404).json({ message: 'User not found' });
      }
  
      const user = userRes.rows[0];
      res.status(200).json(user);
    } catch (error) {
      console.error(error);
      res.status(500).json({ message: 'Internal server error' });
    }
  });
  

app.get('/users', async (req, res) => {
  try {
    const res = await pool.query('SELECT * FROM users');
    res.status(200).json(res.rows);
  } catch (error) {
    console.error(error);
    res.status(500).json({ message: 'Internal server error' });
  }
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
