# Be sure to restart your server when you modify this file.

# Your secret key for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!
# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
React::Application.config.secret_token = "b460590d0d1e3593a29d9c8eaeee898b6ec033339041ef9e08f29bbd607bb04cceb65c6c511a26cef81803a3ad8eb1045354bcab298d8e52e8ffa82e5aafcd0d" #File.read(File.join(Rails.root, "config", "csrf_secret_token.txt")).strip
