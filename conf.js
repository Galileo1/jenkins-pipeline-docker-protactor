// conf.js
exports.config = {
  framework: 'jasmine',
//  seleniumAddress: 'http://127.0.0.1:4444/wd/hub',
  specs: ['**/**.js'],
  capabilities: {
    browserName: 'chrome',
    chromeOptions: {
      args: [ "--headless", "--disable-gpu", "--window-size=800x600","--disable-dev-shm-usage","--no-sandbox" ]
    }
  },
  jasmineNodeOpts: {
    showColors: true,
  }
};
