requirejs.config({
    paths: {
        'jquery': 'https://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min',
        'cs': 'plugins/cs',
        'order': 'plugins/order',
        'text': 'plugins/text'
    }
});

require([
    "jquery",
    "cs!admin/main"
    //"lib/bootstrap-alert",
    //"lib/bootstrap-button",
    //"lib/bootstrap-carousel",
    //"lib/bootstrap-collapse",
    //"lib/bootstrap-dropdown",
    //"lib/bootstrap-modal",
    //"lib/bootstrap-scrollspy",
    //"lib/bootstrap-tab",
    //"lib/bootstrap-transition",
    //"lib/bootstrap-typeahead",

    // popover extends tooltip so the order plugin must be used
    //"plugins/order!lib/bootstrap-tooltip",
    //"plugins/order!lib/bootstrap-popover"

], function(jQuery, App) {
        $ = jQuery;
        window.App = App;

    }
);
