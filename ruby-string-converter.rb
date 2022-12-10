require 'clipboard'

input_array = File.readlines('input.txt')
output_file = File.open('./output.txt', 'w')

output_array = []

input_array.each do |element|
  output = ''

  words_array = element.split(' ')

  words_array.each_with_index do |word, i|
    letter_array = word.split('')
    quote_indexes = letter_array.each_index.select { |index| letter_array[index]=='"'}

    quote_indexes.each do |index|
      letter_array[index] = '\"'
    end

    formatted_word = letter_array.join()

    if formatted_word[-2..-1] == '\n'
      formatted_word = formatted_word[0..-3]
    end

    words_array[i] = formatted_word 

    output = '"' + words_array.join(' ') + '"'
  end

  output_array.push(output)
end

final_output = output_array.join(',')[0..-1]
Clipboard.copy(final_output )
output_file.write(final_output)
