  # coding: utf-8
  require 'io/console'

  def intro()
    puts "##############################\nA simple reaction game for two players"
    puts "##############################\n\nHOW TO PLAY:\nPlayer 1 presses button A in the keyboard and Player 2 button L.\nMay the quicker player win. \n"
    puts "Of course, you can also just test your own reaction time."
    puts "--------------------------------------------------------------------------------\nStart game by writing y and pressing Enter. The game will start in 3–6 seconds.\nStart game? (y)\n"
    puts "--------------------------------------------------------------------------------"
    input = gets.chomp!
    return input
  end

  def askForRematch()
    puts "\n\n(y + Enter for rematch!)\n"
    rematch = gets.chomp!
  end

  def returnTime(t1, ch)
    t2 = Time.now
    delta = t2 - t1 # in seconds
    if(ch == "l") then
      player = "2"
    else
      player = "1"
    end
    puts "\n------[WINNER]------\n"
    puts "Player #{player} (#{delta} s)"
  end

  def startGame
    continue = true
    puts "\nStarting a new game in 4–6 seconds..."
    startCount = Random.new.rand(1..4)
    startCount.downto(1) do |i|
      puts "X"
      sleep 1
    end
    randVal = Random.new.rand(1..3)
    randVal.downto(1) do |i|
      sleep 1
    end
    puts "NOW!"
    t1 = Time.now
    while((ch = $stdin.getch()) and continue) do
      case(ch)
      when 'q' then exit
      when 'a', 'l' then
      returnTime(t1, ch)
      if(askForRematch() == "y") then
        startGame()
      else
        exit!
      end
    end
    end
  end

  if((intro() == "y")) then
    startGame()
  else
    exit!
  end