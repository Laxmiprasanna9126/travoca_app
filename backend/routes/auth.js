/*const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

const router = express.Router();

// REGISTER
router.post('/register', async (req, res) => {
    try {
        const { username, email, password } = req.body;

        // check existing user
        const existingUser = await User.findOne({ email });
        if (existingUser) return res.status(400).json({ msg: "User already exists" });

        // hash password
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // save user
        const newUser = new User({ username, email, password: hashedPassword });
        await newUser.save();

        res.json({ msg: "User registered successfully" });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// LOGIN
router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;

        const user = await User.findOne({ email });
        if (!user) return res.status(400).json({ msg: "User not found" });

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ msg: "Invalid credentials" });

        const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET, { expiresIn: "1h" });

        res.json({ token, user: { id: user._id, username: user.username, email: user.email } });
    } catch (err) {
        res.status(500).json({ error: err.message });
    }
});

// PROTECTED PROFILE
router.get('/profile', async (req, res) => {
    try {
        const token = req.headers['authorization'];
        if (!token) return res.status(401).json({ msg: "No token, authorization denied" });

        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        const user = await User.findById(decoded.id).select("-password");
        res.json(user);
    } catch (err) {
        res.status(500).json({ error: "Token is not valid" });
    }
});

module.exports = router;*/
const express = require('express');
const bcrypt = require('bcryptjs');
const jwt = require('jsonwebtoken');
const User = require('../models/User');

const router = express.Router();

// ================= REGISTER =================
router.post('/register', async (req, res) => {
    try {
        const { username, email, password } = req.body;

        if (!username || !email || !password) {
            return res.status(400).json({ msg: "Please enter all fields" });
        }

        // Check if user already exists
        const existingUser = await User.findOne({ email });
        if (existingUser) return res.status(400).json({ msg: "User already exists" });

        // Hash password
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(password, salt);

        // Create new user
        const newUser = new User({
            username,
            email,
            password: hashedPassword
        });
        await newUser.save();

        res.status(201).json({ msg: "User registered successfully" });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: err.message });
    }
});

// ================= LOGIN =================
router.post('/login', async (req, res) => {
    try {
        const { email, password } = req.body;

        if (!email || !password) return res.status(400).json({ msg: "Please enter all fields" });

        const user = await User.findOne({ email });
        if (!user) return res.status(400).json({ msg: "User not found" });

        const isMatch = await bcrypt.compare(password, user.password);
        if (!isMatch) return res.status(400).json({ msg: "Invalid credentials" });

        const token = jwt.sign(
            { id: user._id },
            process.env.JWT_SECRET,
            { expiresIn: "1h" }
        );

        res.json({
            token,
            user: {
                id: user._id,
                username: user.username,
                email: user.email
            }
        });
    } catch (err) {
        console.error(err);
        res.status(500).json({ error: err.message });
    }
});

// ================= PROFILE (Protected) =================
router.get('/profile', async (req, res) => {
    try {
        const token = req.headers['authorization'];
        if (!token) return res.status(401).json({ msg: "No token, authorization denied" });

        const decoded = jwt.verify(token, process.env.JWT_SECRET);
        const user = await User.findById(decoded.id).select("-password");
        if (!user) return res.status(404).json({ msg: "User not found" });

        res.json(user);
    } catch (err) {
        console.error(err);
        res.status(401).json({ error: "Token is not valid" });
    }
});

module.exports = router;

