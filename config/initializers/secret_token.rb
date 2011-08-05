# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
React::Application.config.secret_token = "b408479c1ba01eccdcfe9ff49c5cd57d3a44fb9f64578acdccdd8f12efaf441bdaad6ead402c796d1ef75b62ffb72f8b777ddaee5427691a0962c143b5b93c57" #File.read(File.join(Rails.root, "config", "csrf_secret_token.txt")).strip
