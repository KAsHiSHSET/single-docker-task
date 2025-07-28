module.exports = {
  apps: [
    {
      name: "app",
      script: "app.js",
      watch: true,
      instances: 1,
      exec_mode: "fork",
    },
  ],
};