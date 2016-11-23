# require modules here
require 'yaml'


def load_library(file)
  # code goes here
  meanings = YAML.load_file(file)
  library = {"get_emoticon"=>{}, "get_meaning"=>{}}
  meanings.each do |emotion, emoticons|
    english = emoticons[0]
    japanese = emoticons[1]
    library["get_meaning"][japanese] = emotion
    library["get_emoticon"][english] = japanese
  end
  library
end

def get_japanese_emoticon(file, emoticon)
  # code goes here
  japanese = load_library(file)["get_emoticon"][emoticon]
  if japanese != nil
    japanese
  else
    "Sorry, that emoticon was not found"
  end
end

def get_english_meaning(file, emoticon)
  # code goes here
  meaning = load_library(file)["get_meaning"][emoticon]
  if meaning != nil
    meaning
  else
    "Sorry, that emoticon was not found"
  end
end
