const express = require("express");
const bcryptjs = require("bcryptjs");
const User = require("../models/user_models");
const jwt = require("jsonwebtoken");

const authRouter = express.Router();

authRouter.post("/api/signup", async (req, res) => {
  try {
    const { fullName, email, password } = req.body;

    const existingEmail = await User.findOne({ email });
    if (existingEmail) {
      return res
        .status(400)
        .json({ msg: "user with same email already exits" });
    } else {
      const salt = await bcryptjs.genSalt(10);
      const hashedPassword = await bcryptjs.hash(password, salt);
      var user = new User({
        email,
        password: hashedPassword,
        fullName,
      });

      user = await user.save();
      res.json({ user });
    }
  } catch (e) {
    console.error(e);
    res.status(500).json({ error: e.message });
  }
});

authRouter.post("/api/signin", async (req, res) => {
  try {
    const { email, password } = req.body;
    const findUser = await User.findOne({ email });
    if (!findUser) {
      return res.status(400).json({ msg: "User not found with this email" });
    } else {
      const isMatch = await bcryptjs.compare(password, findUser.password);
      if (!isMatch) {
        return res.status(400).json({ msg: "Incorrect Password" });
      } else {
        const token = jwt.sign({ id: findUser._id }, "passwordKey");

        const { password, ...userWithoutPassword } = findUser._doc;

        res.json({ token, ...userWithoutPassword });
      }
    }
  } catch (e) {
    res.status(500).json({ error: e.message });
  }
});

module.exports = authRouter;
