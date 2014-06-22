middleman-inliner
=================

Provides helper to Inline JS/CSS in Middleman for performance.


```slim
= stylesheet_inline_tag "normalize", "all"
= javascript_inline_tag "all"

// Then all JS/CSS will be compressed and inlined.
```

Install
=======

- `gem 'middleman-inliner'` then `bundle`

- In your `config.rb`, put following

```ruby
activate :inliner
```

- Replace your `stylesheet_link_tag` and `javascript_include_tag` to `stylesheet_inline_tag` and `inline_javascript_inline_tag`

To Speed your website
=====================

Following preference are recommended.

```ruby
activate :inliner
configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :gzip
  activate :minify_html
end
```

Deploy it to S3 and distribute with CloudFront is the fastest (and easiest) way.

See https://github.com/fredjean/middleman-s3_sync