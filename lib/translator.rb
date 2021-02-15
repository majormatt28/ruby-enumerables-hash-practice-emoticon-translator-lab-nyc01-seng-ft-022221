require 'yaml'
require 'pry'

def load_library(path)
  emotes = YAML.load_file(path)
  final_emoticons = {}

  final_emoticons["english"] = {}
  final_emoticons["japanese"] = {}

  emotes.each do |key, description|
    final_emoticons[key] = {}
    final_emoticons[key][:english] = " "
    final_emoticons[key][:japanese] = " "
  end
  final_emoticons
end

def get_japanese_emoticon(path, emoticons)
  final_emoticons = load_library(path)
  results = final_emoticons["english"][emoticons]
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
