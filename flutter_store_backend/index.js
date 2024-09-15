require("dotenv").config();

const express = require("express");
const Mongoose = require("mongoose");

const PORT = 3000;

const app = express();
const Db = process.env.DB;

Mongoose.connect(Db).then(() => {
  console.log("Database connected");
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});
