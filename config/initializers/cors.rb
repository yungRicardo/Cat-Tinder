# config/initializers/cors.rb

Rails.application.config.middleware.insert_before 0, Rack::Cors do
   allow do
      origins '*'  # Adjust this to allow specific domains or keep '*' for public APIs

      resource '*',
         headers: :any,
         methods: [:get, :post, :put, :patch, :delete, :options, :head]
   end
end
