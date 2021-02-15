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

def get_japanese_emoticon(path, emoticon)
  final_emojis = load_library(path)
  final_emojis.each do |key, description|
    if description[:english] == emoticon
      return key
    end
  end
end

def get_english_meaning(path, emoticon)
  final_emojis = load_library(path)
  final_emojis.each do |key, description|
    if description[:japanese] == emoticon
      return key
    else emoticon = "Sorry, that emoticon was not found"
    end
  end
end
