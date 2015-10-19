var express    = require('express'),
    handlebars = require('express-handlebars');

(function initialize() {
    var app = express();

    // We'll be using handlebars for our template rendering
    app.engine('.hbs', handlebars({extname: '.hbs'}));
    app.set('view engine', '.hbs');

    app.get('/', function(req, res) {
        // Pass the secret to be rendered by the webpage
        // Note: SECRET_KEY is defined in .conjurenv
        res.render('index', {secret: process.env.SECRET_KEY});
    });

    // Port can be passed in as an arg, or default to 8080.
    var port = parseInt(process.argv[2]) || 8080;
    app.listen(port, function() {
        console.log('Listening on port', port);
    });
})();