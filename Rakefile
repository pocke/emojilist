require "bundler/gem_tasks"
require 'json'
task :default => :spec


task :build_json do
  emojis = JSON.parse `curl https://raw.githubusercontent.com/Ranks/emojione/d56ef20055c49961f14867ef7ce0aec15ced2f7b/emoji.json`
  list = emojis.each.map do |code, emoji|
    names = [emoji['shortname'], *emoji['shortname_alternates']]
    keywords = emoji['keywords']
    char = code.split("-").map{|ch| ch.to_i(16).chr('UTF-8')}.join

    {char: char, names: names, keywords: keywords}
  end

  File.write('lib/emojilist.json', JSON.generate(list))
end
