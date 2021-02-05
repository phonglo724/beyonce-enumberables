require 'pry'

beyonceHash = {
    hits: [
      { title: 'bootylicious', group: true, group_name: 'destinysChild', hair: ['straight', 'blonde', 'pink tips'], signature_look: 'fedora with yellow feather', video_theme: 'dressing room dance', best_line: 'Move your body up and down, make your booty touch the ground', fierceness: 7, formation: false, dancers: 20
      },
      { title: 'singleLadies', group: false, group_name: 'none', hair: ['honey brown', 'half up, half down'], signature_look: 'black bodysuit and legs for days', video_theme: 'single ladies dance', best_line: 'if you like it then you should\'ve put a ring on it', fierceness: 10, formation: true, dancers: 2 
      },
      { title: 'letMeUpgradeYou', group: false, group_name: 'none', hair: ['beaded bun', 'wet hair', 'honey brown', 'waves'], signature_look: 'flapper dress and bodysuit', video_theme: 'decadence, water, gold beads and pearls', best_line: 'I could do for you what Martin did for the people', fierceness: 10, formation: true, dancers: 5 
      },
      { title: 'sorry', group: false, group_name: 'none', hair: ['braids', 'bun', 'blonde', 'waves', 'bob'], signature_look: 'braided crown with gold bikini top', video_theme: 'party bus and Serena Williams in bodysuit', best_line: 'Boi bye', fierceness: 10, formation: false, dancers: 1 
      },
      { title: 'sayMyName', group: true, group_name: 'destinysChild', hair: ['blonde', 'curly', 'braid', 'pony tail'], signature_look: 'none', video_theme: 'color blocked scenes with group', best_line: 'say my name, say my name', fierceness: 7, formation: true, dancers: 6 
      },
      { title: 'feelingMyself', group: true, group_name: 'Nicki Minaj featuring Beyonce', hair: ['blonde', 'waves'], signature_look: 'sporty bodysuit', video_theme: 'Coachella music festival', best_line: 'Im felling myself', fierceness: 9, formation: false, dancers: 0 
      }
    ],
    movies: [
      { title: 'Austin Power\'s Goldmember', year: 2002, rating: 5},
      { title: 'Dreamgirls', year: 2006, rating: 7},
      { title: 'Obsessed', year: 2009, rating: 6},
      { title: 'Cadillac Records', year: 2008, rating: 8},
      { title: 'Life is But a Dream', year: 2013, rating: 6},
      { title: 'The Pink Panther', year: 2006, rating: 4},
      { title: 'Epic', year: 2013, rating: 7},
      { title: 'The Fighting Temptations', year: 2003, rating: 5}
    ]
  };

# 1. puts all the songs
def songs hash
  hash[:hits].each do |song|
    puts song
  end
end 

# 2. puts all the movies
def movies hash 
  hash[:movies].each do |movies|
    puts movies 
  end
end

# 3. create an array with a list of all of Beyonce's hit song titles
def song_titles hash
  hash[:hits].map do |song|
    song[:title]
  end
end

def song_titles hash 
  hash[:hits].reduce([]) do |new_array, songs|
    new_array << songs[:title]
  end
end

# 4. create an array with a list of all of Beyonce's fierceness ratings
def fierceness_ratings hash 
  hash[:hits].map do |song|
    song[:fierceness]
  end
end

# 5. give me all the songs where Beyonce is wearing a bodysuit or a bodysuit is part of the video theme
def bodysuit_songs hash 
  hash[:hits].filter do |song|
    song[:signature_look].include?("bodysuit") || song[:video_theme].include?("bodysuit")
  end
end

# 6. create an array with all of the songs where Beyonce's fierceness is greater than or equal to 8
def greater_than_8_fierceness hash 
  hash[:hits].filter do |song|
    if song[:fierceness] >= 8
      song[:title]
    end
  end
end

# 7. create an array with all of the movies Beyonce made in 2006 and after
def movies_in_2006_and_after hash 
  hash[:movies].filter do |movie|
    if movie[:year] >= 2006
      movie[:title]
    end
  end
end

# 8. find all the hit songs where beyonce was in a group
def group_hit_songs hash 
  hash[:hits].find_all do |song|
    if song[:group] == true
      song[:title]
    end
  end
end 

# 9. find a hit song where Beyonce's hair is blonde
def blonde_hit_songs hash 
  hash[:hits].find_all do |song|
    if song[:hair].include?("blonde")
      song[:title]
    end
  end
end

# 10. find the hit song sorry
def sorry_song hash 
  hash[:hits].find do |song|
    song[:title] == 'sorry'
  end
end

# 11. find all hit songs where Beyonce's fierceness rating is 10
def hit_songs_with_fierceness_10 hash 
  hash[:hits].find_all do |song|
    if song[:fierceness] == 10
      song[:title]
    end
  end
end

# 12. sum up Beyonces fierceness value for all of her hit songs
def total_fierceness hash 
  fierceness_ratings(hash).reduce(:+) # this is our helper method
  #or
  fierceness_ratings(hash).sum # this is our helper method
  #or
  hash[:hits].reduce(0) do |sum, current_song| #sum is the value of your accumulator
    sum + current_song[:fierceness] # this iterates over every song, adds the fierceness to the sum.
  end
end

# 13. get the average fierceness value for all of her hit songs
def average_fierceness hash
  hash[:hits].reduce(0) do |sum, current_song|
    sum + current_song[:fierceness].to_f 
  end
  binding.pry
end
#=> 8.83

# 14. sum up Beyonces rating value for all of her movies
def sum_movie_rating hash 
  hash[:movies].reduce(0) do |sum, movie|
    sum + movie[:rating]
  end
end


# 15. get the average rating value for all of her movies
def average_rating_movies hash
  # hash[:movies].reduce(0) do | sum, movie |
  #   sum_value = sum + movie[:rating]
  #   sum_value / movie[:movies]
  # end
end 

  hash[:movies].inject(&:+) / hash.size # & is a block and : means assigning and + means sum
#=> 6

# 16. sum up the total number of dancers in all of the hit song videos
def sum_dancers hash
  hash[:hits].reduce(0) do |sum, dancers|
    sum + dancers[:dancers]
  end
end

# 17. create an array of beyonces hairstyles without repeats
def hairstyles hash 
  hash[:hits].reduce([]) do |new_array, hair|
    new_array + hair[:hair]
  end.uniq # uniq is added to on the end of 'end' to have .uniq run through the entire array of hair styles
end

# 18. create an object where the properties are song names and the value is an object which contains that fierceness and average fierceness
# 19. create an object where the properties are movie names and the value is an object which contains that rating and average rating
# 20. create a hash with beyonces hairstyles with a tally of each hairstyle ie { 'blonde': 3, ect.}  

binding.pry
0