require 'yaml'
require 'pry'

def load_library(emoticons)
  emotes = YAML.load_file(emoticons)
  final_emoticons = {}

  final_emoticons["get_emoticon"] = {}
  final_emoticons["get_meaning"] = {}

  emotes.each do |english_word, description|
    final_emoticons["get_emoticon"][description.first] = description.last
    final_emoticons["get_meaning"][description.last] = english_word
  end
  final_emoticons
end

def get_japanese_emoticon(emoticons, path)
  final_emoticons = load_library(emoticons)
  results = final_emoticons["get_emoticon"][path]
  if results == nil
    results = "Sorry, that emoticon was not found"
  end
  results
end

def get_english_meaning(emoticons, path)
  final_emoticons = load_library(emoticons)
  results = final_emoticons["get_meaning"][path]
  if results == nil
    results = "Sorry, that emoticon was not found"
  end
  results
end
