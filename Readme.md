The project contains a minimal rails app with all the application code in a single file — `app.rb`.
Such setup is useful for small demos when generating the standard rails project with all
the bells and whistles is an overkill.

The project is an evolution of a single file Rails application, so everything but the `base.rb`, `app.rb` and `config.ru`
can be removed, and those three files can be merged into one.

Running the app for the first time (installs the missing gems from the inline gemfile):

    BUNDLE=yes rackup -p 3000

Running (use only one of those commands):

    rackup -p 3000             # no autoreloading
    shotgun -p 3000 config.ru  # reload using shotgun
    rerun -- rackup -p 3000    # reload using rerun

Running the database seeds:

    ruby seeds.rb

All the static files should be in teh `public`, views directly in the `views` folder, and the assets directly in the `assets` folder.
