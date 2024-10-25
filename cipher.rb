

def cipher(message, rot)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  rot_alph = "abcdefghijklmnopqrstuvwxyz"
  specials = "!,?."
  encrypted_message = ""

  count = 0
  while count < rot
    last_letter = rot_alph.slice!(alphabet.length - 1)
    rot_alph.prepend(last_letter)
    count += 1
  end

  message.each_char do |char|
    # get index of original alphabet
    index = alphabet.index(char.downcase)

    # immediately check if char is a space
    if char == " "
      encrypted_message << " "
    elsif specials.include?(char)
      encrypted_message << char
    elsif char == char.upcase
      # find the letter of that index on the rot_alph
      rot_letter = rot_alph[index]
      encrypted_message << rot_letter.upcase
    else
      # find the letter of that index on the rot_alph
      rot_letter = rot_alph[index]
      encrypted_message << rot_letter
    end
  end
  puts encrypted_message
end

count = 0
while count < 10
  random_rot = rand(0...25)
  puts "Rotation: #{random_rot}"
  cipher("There once was a man who sailed the sea, where nothing else is left to see.", random_rot)
  count += 1
end
