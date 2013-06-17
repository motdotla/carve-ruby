# Carve.io Ruby Bindings

This gem is a wrapper for [Carve.io](http://carve.io)'s API.

## Installation

Add this line to your application's Gemfile:

    gem 'carve'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install carve

Then in your application initialize the gem:

    $ Carve.secret_api_key = "your_secret_api_key"

Alternatively, you can simply set the environment variables CARVE_SECRET_API_KEY on your machine. The rubygem will read it automatically so that you can skip the initialization.

## Usage

### Create Document

    $ Carve::Document.create(:url => "https://www.signature.io/pdfs/sign-below.pdf")

Replace the url with a url of the PDF or Microsoft Word file you choose.

### Retrieve Document

    $ Carve::Document.retrieve("id_of_document")

### Retrieve Document Pages

    $ Carve::Document.pages("id_of_document")

### List Events

```bash
$ Carve::Event.all
$ Carve::Event.all(:type => "document.done", :count => 100)
```

## Contributing

0. Add your application configuration to your .env file in the root of this project

```bash
$ echo "CARVE_SECRET_API_KEY=yourkey" > .env
```

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. export CARVE_SECRET_API_KEY="your_test_secret_api_key"
5. Commit your changes (`git commit -am 'Add some feature'`)
6. Push to the branch (`git push origin my-new-feature`)
7. Create new Pull Request
