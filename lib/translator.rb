require 'yaml'
require 'pry'

def load_library(emoticons)
  emotes = YAML.load_file(emoticons)
  final_emoticons = {}

  final_emoticons["english"] = {}
  final_emoticons["japanese"] = {}

  emotes.each do |english_word, description|
    final_emoticons["english"][description.first] = description.last
    final_emoticons["japanese"][description.last] = english_word
  end
  final_emoticons
end

def get_japanese_emoticon(emoticons, path)
  final_emoticons = load_library(emoticons)
  results = final_emoticons["english"][path]
  if results == nil
    results = "Sorry, that emoticon was not found"
  end
  results
end

def get_english_meaning(emoticons, path)
  final_emoticons = load_library(emoticons)
  results = final_emoticons["japanese"][path]
  if results == nil
    results = "Sorry, that emoticon was not found"
  end
  results
end
