// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

Turbo.StreamActions.reset_form = function() {
  this.targetElements.forEach(form => form.reset())
}
