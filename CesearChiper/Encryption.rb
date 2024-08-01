class CaesarCipher
  def initialize
  end

  def cipher(string, key)
    chipered = lambda do |x| 
      return x if x == ' '
      if (x.ord + key) > 122
        (x.ord - 26 + key).chr
      else
        (x.ord + key).chr
      end
    end
    string.chars.map { |char| chipered.call(char) }.join
  end

  def decipher(string, key)
    deciphe = lambda do |x| 
      return x if x == ' '
      if (x.ord - key) < 97
        (x.ord - key + 26).chr
      else
        (x.ord - key).chr
      end
    end
    string.chars.map { |char| deciphe.call(char) }.join
  end

  def main
    while true
      puts "What do you want to do?"
      puts "1. Encrypt"
      puts "2. Decrypt"
      puts "3. End/Exit"
      choice = gets.chomp

      case choice
      when "1"
        puts "Enter string you want to encrypt:"
        string = gets.chomp.downcase
        puts "Enter a key for encryption:"
        key = gets.chomp.to_i
        encrypted = cipher(string, key)
        puts "Encrypted: #{encrypted}"
      when "2"
        puts "Enter the string you want to decrypt:"
        string = gets.chomp.downcase
        puts "Enter the key for decryption:"
        key = gets.chomp.to_i
        decrypted = decipher(string, key)
        puts "Decrypted: #{decrypted}"
      when "3"
        puts "Exiting..."
        break
      else
        puts "Invalid choice. Please select 1, 2, or 3."
      end
    end
  end
end

cipher = CaesarCipher.new
cipher.main
