
$account_number_generator=1002

puts "WELCOME TO BANKING SYSTEM"
accounts={1000 => {"name" => "sudhansh","mobile" => 7218341563,"balance" => 0}, 1001 => {"name" => "ramesh","mobile" => 8888888888,"balance" => 100}}

flag=true

while flag
  puts "****************************************"
  puts "enter 1 to add account"
  puts "enter 2 to deposite money "
  puts "enter 3 to debit money "
  puts "enter 4 to check balance"
  puts "enter 5 to check all the accounts"
  puts "enter 6 to exit the program"
  puts
  
  ch=gets.chomp.to_i
  
  case ch
    when 1
      retake_input = true
      puts "Enter account holder name"
      name = gets.chomp
      while retake_input
      
        retake_input = false
        
        puts "Enter account holder mobile number"
        mobile_no = gets.chomp
        if ( mobile_no.to_i.to_s.size != 10 || mobile_no.to_i.to_s.size! = mobile_no.size )
          puts "⚠️ mobile number enterd is invalid only 10 numbers are allowed , please try again "
          retake_input=true
        end
        unless retake_input
          puts "Enter account holder's initial account balance"
          init_balance = gets.chomp.to_i
          if ( init_balance < 0 )
          puts "⚠️  value cannot be negative value"
            retake_input = true
          end
        end
      end
        
      accounts [ $account_number_generator ] = {"name" => name ,"mobile" => mobile_no , "balance" => init_balance}
      $account_number_generator += 1
      puts "✅ account added sucessfully with account number #{ $account_number_generator - 1 } and information as #{accounts[ $account_number_generator - 1]}"
      
      #add account
    when 2
      puts " Enter account number to deposite money"
      accnumber = gets.chomp.to_i
      
      if accounts[ accnumber ] == nil
        puts "⚠️ Account not found with account number #{accnumber} please check the number"
      else
        puts "enter amount you want to deposite into account"
        balance = gets.chomp.to_i
        
        if( init_balance < 0 )
        puts "⚠️  value cannot be negative value please try again"
          break ;
        end

        accounts[ accnumber ][ "balance" ] = accounts[accnumber]["balance"] + balance
        puts "✅ account deposited sucessfully ,updated account balance for account number #{accnumber} is #{accounts[accnumber]["balance"]} ₹"
      end
      #deposite money
    when 3 
      puts "Enter account number to withdraw money"
      accnumber = gets.chomp.to_i
      if accounts[accnumber] == nil
        puts "⚠️ Account not found with account number #{accnumber} please check the number"
      else
        puts "enter amount you want to withdraw into account"
        balance = gets.chomp.to_i
        
        if( init_balance < 0 )
          puts "⚠️  value cannot be negative value please try again"
          break;
          
        elsif( balance > accounts[ accnumber ][ "balance" ] )
          puts "⚠️  insufficent account balance,amount not debited please try again⚠️"
          puts "Amount present in your bank account - #{accounts[accnumber]["balance"]}"
          
        else
        
          accounts[accnumber]["balance"] = accounts[accnumber]["balance"] - balance
          puts "✅ account debited sucessfully ,updated account balance for account number #{accnumber} is #{accounts[accnumber]["balance"]} ₹"
        end
      end
      
      #withdraw money
    when 4
      puts "Enter account number to check the account balance"
      accnumber = gets.chomp.to_i
      if accounts[ accnumber ] == nil
        puts "⚠️ Account not found with account number #{accnumber} please check the number"
      else
        puts "fetching account balnce "
        puts "balance avaible in account number #{accnumber} is #{accounts[accnumber]["balance"]} ₹"
      end
      #check balance
    when 5
    puts "Account no \t name \t mobile number \t balance"
      accounts.each {|k,v|
        puts "#{k} \t #{v["name"]} \t #{v["mobile"]} \t #{v["balance"]}"
      }
    when 6
      flag=false
    else
      puts "please enter the correct input"
  end
end
