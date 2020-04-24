import express = require("express");
import mustacheExpress = require("mustache-express");
import path = require("path");

const app = express();
app.engine("html", mustacheExpress());
app.set("view engine", "html");
app.set("views", path.join(__dirname, "../views"));
app.use("/static", express.static(path.join(__dirname, "../static")));

app.get("/", (_, res) => res.render("index"));

app.listen(3000, () => console.log("racerr.io WebGL client service started."));
