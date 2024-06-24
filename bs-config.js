module.exports = {
  proxy: "http://localhost:3000",
  files: ["views/**/*.ejs", "public/styles/**/*.css", "public/**/*.html", "public/**/*.js"],
  reloadDelay: 1000,
  port: 3001,
};
