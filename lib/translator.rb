require 'yaml'
require 'pry'

def load_library(path)
  emotes = YAML.load_file(path)
  final_emoticons = {}

  final_emoticons["english"] = {}
  final_emoticons["japanese"] = {}

  emotes.each do |key, description|
    final_emoticons[key] = {}
    final_emoticons[key][:english] = description[0]
    final_emoticons[key][:japanese] = description[1]
  end
  final_emoticons
end

def get_japanese_emoticon(path, emoticons)
  final_emoticons = load_library(path)
  final_emoticons.each do |key, description|
    if description[:japanese] == emoticons
      return key
    end
  end
end

def get_english_meaning(path, emoticons)
  final_emoticons = load_library(path)
  final_emoticons.each do |key, description|
  end
end
