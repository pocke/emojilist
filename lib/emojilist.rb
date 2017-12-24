require "emojilist/version"
require 'json'
require 'pathname'
require 'optparse'

module Emojilist
  class << self
    def run(argv)
      opt = ARGV.getopts('', 'ligature')
      p opt
      emoji.each do |e|
        next if !opt['ligature'] && e[:char].size != 1
        puts "#{e[:char]} #{e[:names].join(' ')} #{e[:keywords].join(' ')}"
      end

      0
    end

    private

    def emoji
      @emoji ||= JSON.parse(Pathname(__dir__)./('emojilist.json').read(encoding: Encoding::UTF_8), symbolize_names: true)
    end
  end
end
