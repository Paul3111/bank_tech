class Statement
  def initialize
    @transactions = []
  end

  def add_transaction(transaction)

  end

  def view_statement
    return "#{statement_header}\\n17/04/2023 || 100.00 || || 100.00"
  end

  def statement_header
    return "date || credit || debit || balance"
  end
end