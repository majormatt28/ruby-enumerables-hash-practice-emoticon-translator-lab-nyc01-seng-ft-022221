require 'yaml'
require 'pry'

def load_library(path)
  emotes = YAML.load_file(path)
  final_emoticons = {}

  final_emoticons["english"] = {}
  final_emoticons["japanese"] = {}

  emotes.each do |english_word, description|
    final_emoticons["english"][description.first] = description.last
    final_emoticons["japanese"][description.last] = english_word
  end
  final_emoticons
end

def get_japanese_emoticon(path, emoticons)
  final_emoticons = load_library(path)
  results = final_emoticons["english"][Emoticons]
  if results == nil
    results = "Sorry, that emoticon was not found"
  end
  results
end

def get_english_meaning(path, emoticons)
  final_emoticons = load_library(path)
  results = final_emoticons["japanese"][emoticons]
  if results == nil
    results = "Sorry, that emoticon was not found"
  end
  results
end
