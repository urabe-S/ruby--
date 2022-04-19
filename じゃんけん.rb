puts "『じゃんけん』『あっち向いてほい』を行います"

def atchimuite
  puts "\nじゃんけん…"
  puts "\n《選択して数字を入力してください》\n [0]ぐー\n [1]ちょき\n [2]ぱー"

  #じゃんけんメソッド
  def janken 
    #ユーザーがコマンド入力
    player_hand = gets.to_i
    program_hand = rand(3)
    janken_hands = ["ぐー","ちょき","ぱー"]

    #じゃんけんの結果表示
    puts "\nぽん！"
    puts "---------------------------------------"

    puts "【あなた】#{janken_hands[player_hand]}"
    puts "【相手】#{janken_hands[program_hand]}"

    #じゃんけん結果（勝敗）
    if player_hand == program_hand
      puts "---------------------------------------"

      puts "\nあいこで…"
      puts "\n《選択して数字を入力してください》\n [0]ぐー\n [1]ちょき\n [2]ぱー"
      return true
    elsif (player_hand == 0 && program_hand == 1) || (player_hand == 1 && program_hand == 2) || (player_hand == 2 && program_hand == 0)
      puts "じゃんけんはあなたの勝ちです" 
      puts "---------------------------------------"

      @janken_result = "win"
      return false
    else
      puts "じゃんけんはあなたの負けです"
      puts "---------------------------------------"

      @janken_result = "lose"
      return false
    end
  end

  #while文で1回目のjankenを実行するための初期値
  next_janken = true
  #あいこの場合はじゃんけんやり直し
  while next_janken
  next_janken = janken
  end


  #あっち向いてほいだけの繰り返しはない
  #繰り返すのはじゃんけんから
  puts "あっち向いて…"
  if @janken_result == "win"
    puts "\n《指を指す方向を選択して、数字を入力してください》\n [0]上\n [1]下\n [2]左 \n [3]右"
  elsif @janken_result == "lose"
    puts "\n《顔を向ける方向を選択して、数字を入力してください》\n [0]上\n [1]下\n [2]左 \n [3]右"
  end

  #ユーザーがコマンド入力
  player_direction = gets.to_i
  program_direction = rand(4)
  direction = ["上","下","左","右"]

  #あっち向いてほいの結果表示
  puts "\nほい！"
  puts "---------------------------------------"
  puts "【あなた】#{direction[player_direction]}"
  puts "【相手】#{direction[program_direction]}"

  #あっち向いてほいの結果(勝敗)
  if player_direction != program_direction
    puts "▲勝敗がつかなかったので、やり直しです▲"
    puts "---------------------------------------"

    return true
  elsif 
    @janken_result == "win" && player_direction == program_direction
    puts "◎◎あなたの勝ちです◎◎"
    puts "---------------------------------------"

    return false
  elsif @janken_result == "lose" && player_direction == program_direction
    puts "××あなたの負けです××"
    puts "---------------------------------------"

    return false
  end
end

#while文で1回目のatchimuiteを実行するための初期値
next_atchimuite = true
#あっち向いてほいの勝敗が決まらなければじゃんけんから繰り返し
#決まれば終了
while next_atchimuite
  next_atchimuite = atchimuite
end