Package.describe({
  summary: "Meteor forms"
});

Package.on_use(function (api) {
  //1api.use([''], 'client');

  api.use('coffeescript', 'client');
  api.use('templating', 'client');
  api.use('handlebars', 'client');
  api.use('underscore', 'client');
  api.use('jquery', 'client');

  if (typeof api.export != 'undefined') {
    api.export('Form');
  }

  api.add_files("handlebars_helpers.coffee", "client");
  api.add_files("form.html", "client");
  api.add_files("form.coffee", "client");
});