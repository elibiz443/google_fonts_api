require 'httparty'
require_relative '../config/application'

class TrelloApi
  def board_name
    response = HTTParty.get('https://api.trello.com/1/boards/1XXZ1ZKd/name?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
    response["_value"]
  end

  def lists
    response = HTTParty.get('https://api.trello.com/1/boards/1XXZ1ZKd/lists?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
    response.collect{|data| data["name"]}
  end

  def list_ids
    response = HTTParty.get('https://api.trello.com/1/boards/1XXZ1ZKd/lists?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
    response.collect{|data| data["id"]}
  end

  def cards
    list_ids.each do |list_id|
      card_detail = HTTParty.get('https://api.trello.com/1/lists/' + list_id + '/cards?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token)
      puts card_detail.collect{|data| data["name"]}
    end
  end

  def add_card
    puts "List Number(Between 1-10):"
    list_number = (gets.chomp).to_i

    if list_number < 1 || list_number > 10
      puts "range between 1-10"
    else
      case list_number
      when 1
        list_id = list_ids[0]
      when 2
        list_id = list_ids[1]
      when 3
        list_id = list_ids[2]
      when 4
        list_id = list_ids[3]
      when 5
        list_id = list_ids[4]
      when 6
        list_id = list_ids[5]
      when 7
        list_id = list_ids[6]
      when 8
        list_id = list_ids[7]
      when 9
        list_id = list_ids[8]
      when 10
        list_id = list_ids[9]
      end

      puts "Card Name:"
      post_request = HTTParty.post('https://api.trello.com/1/cards?key=' + Application.new.trello_key + '&token=' + Application.new.trello_token + 
      '&idList=' + list_id + '&name=' + gets.chomp)
    end
  end
end

output = TrelloApi.new
# puts output.board_name
# puts output.lists
# puts output.list_ids
# output.cards
output.add_card
