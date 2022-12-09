input_array = File.readlines("input.txt")
output_file = File.open("./output.txt", "w")

input_array.each do |element|
  # Remove the indexes from element if input has no newline chars
  output_file.write('"' + element[0..-2] + '",')
end
