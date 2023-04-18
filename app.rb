class Statement
  def initialize
    @transactions = []
  end

  def add_transaction()

  end

  def view_statement
    return 'date || credit || debit || balance\n10/01/2023 || 1000.00 || || 1000.00'
  end

  def statement_header
    return "date || credit || debit || balance\n"
  end
end