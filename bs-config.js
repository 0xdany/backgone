module.exports = {
  proxy: "http://localhost:8080",
  files: ["views/**/*.ejs", "public/styles/**/*.css", "public/**/*.html", "public/**/*.js"],
  reloadDelay: 1000,
  port: 8081,
};
