require 'pry'

class CashRegister

    attr_accessor :total, :title, :discount, :quantity, :inventory, :last_transaction
    
    def initialize(discount=0)
        @total = 0
        @discount = discount
        @inventory = []
    end

    def add_item(title, price, quantity=1)
        @title = title
        @last_transaction = price * quantity
        @total += price * quantity
        x = 1
        while x <= quantity
            @inventory << @title
            x += 1
        end


    end

    def apply_discount
            if @discount > 0
                disc_inv = ((100 - @discount.to_f)/100)
                temp_total = @total * disc_inv
                @total = temp_total.to_i
                "After the discount, the total comes to $#{@total}."
            else
                "There is no discount to apply."
            end
    end

    def items
        @inventory
    end

    def void_last_transaction
        @total -= @last_transaction
    end
end