input_array = File.readlines('input.txt')
output_file = File.open('./output.txt', 'w')

output_array = []

input_array.each do |element|
  words_array = element.split(' ')
  output = ''
  words_array.each do |word|
    if word[0] && word[-1] == '"'
      '\\' + word + '\\'
    elsif word[-1] == '\\n'
      word[0..-2]
    else
      word
    end
    output = '"' + words_array.join(' ') + '"'
  end

  output_array.push(output)
end

output_file.write(output_array.join(',')[0..-1])
