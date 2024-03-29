# Sample Maid rules file -- some ideas to get you started.
#
# To use, remove ".sample" from the filename, and modify as desired.  Test using:
#
#     maid clean -n
#
# **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing
# what they do, you might run into unwanted results!
#
# Don't forget, it's just Ruby!  You can define custom methods and use them below:
#
#     def magic(*)
#       # ...
#     end
#
# If you come up with some cool tools of your own, please send me a pull request on GitHub!  Also, please consider sharing your rules with others via [the wiki](https://github.com/benjaminoakes/maid/wiki).
#
# For more help on Maid:
#
# * Run `maid help`
# * Read the README, tutorial, and documentation at https://github.com/benjaminoakes/maid#maid
# * Ask me a question over email (hello@benjaminoakes.com) or Twitter (@benjaminoakes)
# * Check out how others are using Maid in [the Maid wiki](https://github.com/benjaminoakes/maid/wiki)

Maid.rules do
  # **NOTE:** It's recommended you just use this as a template; if you run these rules on your machine without knowing
  # what they do, you might run into unwanted results!

  # NOTE: Currently, only Mac OS X supports `downloaded_from`.
  rule 'Remove Temporary files from cylance' do
    dir('~/Downloads/Scan Me/*').each do |path|
      if 2.day.since?(accessed_at(path))
        remove(path)
      end
    end
  end

  rule 'Move video files out of Downloads' do
    dir('~/Downloads/*.{mkv,mp4,mov}').each do |file|
      if 2.day.since?(accessed_at(file))
        move(file, '~/Videos')
      end
    end
  end

  rule 'Move image files out of Downloads' do
    dir('~/Downloads/*.{jpg,jpeg,png,webp}').each do |file|
      if 2.day.since?(accessed_at(file))
        move(file, '~/Pictures')
      end
    end
  end

  rule 'Move package files to subdir in Downloads' do
    dir('~/Downloads/*.{deb}').each do |file|
      if 2.day.since?(accessed_at(file))
        move(file, '~/Downloads/Packages')
      end
    end
  end

  rule 'Move document files to out of Downloads' do
    dir('~/Downloads/*.{pdf,txt}').each do |file|
      if 2.day.since?(accessed_at(file))
        move(file, '~/Documents')
      end
    end
  end

end
