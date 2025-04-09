
continue_game=true
hash_of_student_and_score={}


while continue_game
	
	array_of_word=["quick","insure","sudhansh","pune","aaaaaaaaaa"]
	number_of_attempts_of_each_player={}
	word = array_of_word.sample.split("")
	correct_number_guessed = Array.new(word.size, "_")
	chanches_left = 4
	flag = false
	charaters_not_present=""
	
	puts "Enter player name"
	player_name=gets.chomp
	
	
	j = 0
	while j<chanches_left do

	  #Taking input
	  puts "charaters which are not present in the words #{charaters_not_present}"
	  puts correct_number_guessed.join
	  puts "enter a charater"
	  input=gets.chomp
	  puts "*********************************************************************"

	  inputarr=input.split("")
	  puts
	  if(inputarr.size!=1)
	    puts "only one charater is allowed"
	  else
	    is_present=false
	    

	    word.each_with_index {|val, i| 
	      if(word[i]==inputarr[0])
		correct_number_guessed[i]=inputarr[0]
		is_present=true
	      end
	    }
	    
	    
	    if word.join==correct_number_guessed.join
	      flag=true
	      puts "Coangraulations you guessed it right"
	      puts
	      break
	    else
	      puts "you have left #{chanches_left-j} chanches"
	      puts
	    end
	    
	    #if input char is not present it will increase value of j and add char to charaters_not_present string
	    if(!is_present)
	      charaters_not_present=charaters_not_present.insert(0,inputarr[0])
	      j=j+1
	    else
		puts "it is present in the word"
		puts
	    end
	  end
	end

	if flag==false
	  puts "all the chanches are exausted "
	end
	
	hash_of_student_and_score[player_name]=chanches_left-j
	
	
	puts "do u want to play again ? (y/n)"
	play=gets.chomp
	continue_game=false if play.downcase=="n"
end
puts hash_of_student_and_score
puts "the person with the maxium score is -#{ hash_of_student_and_score.key(hash_of_student_and_score.values.max)}"

