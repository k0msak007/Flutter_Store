require("dotenv").config();

const express = require("express");
const Mongoose = require("mongoose");
const authRouter = require("./routes/auth");
const bannerRouter = require("./routes/banner");
const categoryRouter = require("./routes/category");

const PORT = 3000;

const app = express();
const Db = process.env.DB;

app.use(express.json());
app.use(authRouter);
app.use(bannerRouter);
app.use(categoryRouter);

Mongoose.connect(Db).then(() => {
  console.log("Database connected");
});

app.listen(PORT, "0.0.0.0", () => {
  console.log(`Server running on port ${PORT}`);
});
