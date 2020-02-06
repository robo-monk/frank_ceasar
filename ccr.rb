require 'sinatra'

get '/' do
  txt = params['txt']
  shft = params['shft']
  if txt.nil? || shft.nil?
    out = "-"
  else
    out = caesar_cipher(txt, shft)
  end
  erb :index, :locals => {:output => out}
end

def caesar_cipher (str, shift)
  upcases = ('A'..'Z').to_a
  downcases = ('a'..'z').to_a
  shift = shift.to_i
  encrypted = ''
  str.chars.map do |char|
    if(upcases.include?(char))
        encrypted += (((char.ord + shift - 65) % 26 ) + 65).chr
    elsif(downcases.include?(char))
        encrypted += (((char.ord + shift - 97) % 26) + 97).chr
    else
        encrypted += char
    end
  end 
  encrypted
end