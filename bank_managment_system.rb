
$account_number_generator=1002

puts "WELCOME TO BANKING SYSTEM"
$accounts={1000 => {"name" => "sudhansh","mobile" => 7218341563,"balance" => 0}, 1001 => {"name" => "ramesh","mobile" => 8888888888,"balance" => 100}}

flag=true

#to check valid account number
def validate_account_number(acc_number)
  if $accounts[acc_number] == nil
    puts "⚠️ Account not found with account number #{acc_number} please check the number"
    return false
  end
  true
end

#to check valid balance input
def valid_balance(balance)
  if( balance.to_f < 0 )
    puts "⚠️  value cannot be negative value please try again"
    return false
  end
  if balance.match(/^*[.\d]*$/) == nil 
    puts "⚠️ only integer values are allowed please try again"
    return false
  end
  true
end

#function to add new account 
def add_acount
  retake_input = true
  puts "Enter account holder name"
  name = gets.chomp

  while retake_input
  
    retake_input = false
    
    puts "Enter account holder mobile number"
    mobile_no = gets.chomp#check mobile number using regular expressions  
    
    if mobile_no.match(/^\d{10}$/)==nil
      puts "⚠️ mobile number enterd is invalid only 10 numbers are allowed , please try again "
      retake_input=true
    end
    unless retake_input
      puts "Enter account holder's initial account balance"
      init_balance = gets.chomp
      retake_input = true unless valid_balance(init_balance)
    end
  end
  $accounts [ $account_number_generator ] = {"name" => name ,"mobile" => mobile_no , "balance" => init_balance.to_i}
  $account_number_generator += 1
  puts "✅ account added sucessfully with account number #{ $account_number_generator - 1 } and information as #{$accounts[ $account_number_generator - 1]}"
end


#function to add money to specifc account
def deposite_money
  puts " Enter account number to deposite money"
  acc_number = gets.chomp.to_i
  
  return unless validate_account_number(acc_number)
  
  puts "enter amount you want to deposite into account"
  balance = gets.chomp.to_i
  
  return unless is_valid_balance(balance)
  
  $accounts[ acc_number ][ "balance" ] = $accounts[acc_number]["balance"] + balance
  puts "✅ account deposited sucessfully ,updated account balance for account number #{acc_number} is #{$accounts[acc_number]["balance"]} ₹"
end

#function to withdraw money from account
def withdraw_money
  puts "Enter account number to withdraw money"
  acc_number = gets.chomp.to_i

  return unless validate_account_number(acc_number)

  puts "enter amount you want to withdraw into account"
  balance = gets.chomp.to_i
  return unless is_valid_balance(balance)
  
  if( balance > $accounts[ acc_number ][ "balance" ] )
    puts "⚠️  insufficent account balance,amount not debited please try again⚠️"
    puts "Amount present in your bank account - #{$accounts[acc_number]["balance"]}"
  else
    $accounts[acc_number]["balance"] = $accounts[acc_number]["balance"] - balance
    puts "✅ account debited sucessfully ,updated account balance for account number #{acc_number} is #{$accounts[acc_number]["balance"]} ₹"
  end
end

#function to check bank balance of the account
def check_balance
  puts "Enter account number to check the account balance"
  acc_number = gets.chomp.to_i
  return unless validate_account_number(acc_number)
  puts "balance avaible in account number #{acc_number} is #{$accounts[acc_number]["balance"]} ₹"  
end

#function to dispaly all the account details
def display_all_account_details
  puts "Account no \t name \t mobile number \t balance"
  $accounts.each {|k,v|
    puts "#{k} \t #{v["name"]} \t #{v["mobile"]} \t #{v["balance"]}"
  }
end

while true
  puts "****************************************"
  puts "enter 1 to add account"
  puts "enter 2 to deposite money "
  puts "enter 3 to withdraw money "
  puts "enter 4 to check balance"
  puts "enter 5 to check all the $accounts"
  puts "enter 6 to exit the program"
  puts

  ch=gets.chomp.to_i
  case ch
    when 1
      add_acount()
    when 2
      deposite_money()
    when 3 
      withdraw_money()
    when 4
      check_balance()
    when 5
      display_all_account_details()
    when 6
      break
    else
      puts "please enter the correct input"
  end
end
