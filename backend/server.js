/*const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();
const app = express();

// Middleware
app.use(express.json());
app.use(cors());

// MongoDB connection
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
}).then(() => console.log('✅ MongoDB connected'))
  .catch(err => console.log('❌ MongoDB connection error:', err));

// Routes
app.get('/', (req, res) => {
    res.send('🚀 Backend is running...');
});

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`✅ Server running on port ${PORT}`));
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth'); // import your auth routes

dotenv.config();
const app = express();


// Middleware
app.use(express.json());
app.use(cors());

// MongoDB connection
mongoose.connect(process.env.MONGO_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true,
})
.then(() => console.log('✅ MongoDB connected'))
.catch(err => console.log('❌ MongoDB connection error:', err));

// Routes
app.get('/', (req, res) => {
    res.send('🚀 Backend is running...');
});

// Mount Auth routes
app.use('/api/auth', authRoutes); // <-- Now /api/auth/register & /api/auth/login work

// Start server
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`✅ Server running on port ${PORT}`));
*/

// server.js
const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const dotenv = require('dotenv');
const authRoutes = require('./routes/auth'); // Import auth routes

// Load environment variables from .env
dotenv.config();

const app = express();

// ================= Middleware =================
app.use(express.json()); // Parse JSON bodies
app.use(cors());         // Enable CORS for all origins

// ================= MongoDB Connection =================
const mongoURI = process.env.MONGO_URI;
if (!mongoURI) {
    console.error('❌ MONGO_URI is not defined in .env');
    process.exit(1); // Stop server if URI is missing
}

mongoose.connect(mongoURI)
    .then(() => console.log('✅ MongoDB connected'))
    .catch(err => console.error('❌ MongoDB connection error:', err));

// ================= Routes =================
app.get('/', (req, res) => {
    res.send('🚀 Backend is running...');
});

// Mount auth routes
app.use('/api/auth', authRoutes); // /api/auth/register & /api/auth/login

// ================= Start Server =================
const PORT = process.env.PORT || 5000;
app.listen(PORT, () => console.log(`✅ Server running on port ${PORT}`));
//console.log('MONGO_URI:', process.env.MONGO_URI);
