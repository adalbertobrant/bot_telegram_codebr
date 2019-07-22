require 'telegram_bot'
require 'pp'
require 'logger'

token = 'token a ser utilizado no telegram'

bot = TelegramBot.new(token: token)

bot.get_updates(fail_silently: true) do |message|
  puts "@#{message.from.username}: #{message.text}"
  command = message.get_command_for(bot)

  message.reply do |reply|
    case command
    when /start/i
      saudacoes = ['Olá !','Tudo Joia !', 'Beleza !', 'Como vai?! ','Oi !','Saudações !','Hello !', 'Hi !']
      reply.text = "#{saudacoes.sample} Seja Super bem Vindo ao Desafio Bot CodeBr. Nós te amamos muito #{message.from.first_name}. Digite /desafio para começar Brother. ."
    when /desafio/i
      string = [2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541]
      reply.text = "Bacana, brother coder Supremo #{message.from.first_name}.\n Agora vamos ao que interessa:\n Escreva um algoritmo que gere a sequência dos 100 primeiros números primos, nos envie a sua resposta para confirmação, desse jeito aqui: \n[2, 3, 5, 7, ...].\nOu seja a resposta tem que estar formatada com um espaço entre cada número, depois da vírgula.\n Precisa de ajuda, chama /ajuda, para dicas de como resolver o desafio."
      resp = message.text.to_s
      puts resp
    when /ajuda/i
      reply.text = "Link sobre números primos = https://pt.wikipedia.org/wiki/N%C3%BAmero_primo"
    #when /[2, 3, 5, 7, 11, 13, 17, 19, 23, 29, 31, 37, 41, 43, 47, 53, 59, 61, 67, 71, 73, 79, 83, 89, 97, 101, 103, 107, 109, 113, 127, 131, 137, 139, 149, 151, 157, 163, 167, 173, 179, 181, 191, 193, 197, 199, 211, 223, 227, 229, 233, 239, 241, 251, 257, 263, 269, 271, 277, 281, 283, 293, 307, 311, 313, 317, 331, 337, 347, 349, 353, 359, 367, 373, 379, 383, 389, 397, 401, 409, 419, 421, 431, 433, 439, 443, 449, 457, 461, 463, 467, 479, 487, 491, 499, 503, 509, 521, 523, 541]/i
     # reply.text = "Opa Parabéns #{message.from.first_name}.Muito bom, em breve novos desafios."
    when /hack/i
      reply.text = "Oi, você quer a resposta é isso?\nLer é obedecer aqui vai um link com a resposta em diferentes linguagens, OHHH Mestre Hacker Supremo #{message.from.first_name}\n Link = https://rosettacode.org/wiki/Category:Prime_Numbers"
    when /jesus/i
      reply.text = "Sim Jesus te Ama e eu também, esteja em oração pois o Fim do Mundo esta próximo\n Leia a Bíblia"
    when /satan/i
      reply.text = "Se arrependa, enquanto ah tempo pecador..."
    when /socorro/i
      reply.text = "When I was younger, so much younger than today yeah
Never needed anybodys help in anyway
Now those days are gone and I'm not so self assured
Now I find, I've changed my mind, I've opened up the doors
                    \n
Help me if you can I'm feeling down
And I do appreciate you being around
Oh help me get my feet back on the ground
Won't you please, please help me
\n
And now my life has changed in oh so many ways
My independence seems to vanish in the haze
Every now and then I feel so insecure
And now that I just need you like I never did before
\n
Oh help me if you can I'm feeling down
And I do appreciate you being around
Oh help me get my feet back on the ground
Won't you please, please help men
\n
When I was younger, so much younger than today
Never needed anybodys help in anyway
But now those days have gone and I'm not so self assured
Now I find, I've changed my mind, and opened up the doors
\n
So help me if you can I'm feeling downn
And I do appreciate you being around
Oh help me get my feet back on the ground
Won't you please, please help men
\n
Won't you please, please help me
Oh please, please
Won't you please help men
Help help help help
\n
Source: Musixmatch\n
\n
Songwriters: Paul Mccartney / John Lennon\n
"
    else
      reply.text = "Olá você deve digitar desafio, outras palavras ainda não foram assimiladas por nossos borgs_bots. Resistir é inútil"
    end
    puts "sending #{reply.text.inspect} to @#{message.from.username}"
    reply.send_with(bot)
  end
end
