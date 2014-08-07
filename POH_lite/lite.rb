class Combinations < Array
  def initialize(n)
    for i in 0...2**n
      @comb = []
      for j in 0...n
        @comb[j] = ( (i % 2**(j+1) ) >= 2**j ) ? true : false
      end
      self.push(@comb)
    end
  end
end

Company = Struct.new(:nEngineers, :fee)

companies = []
nEngineersRequired = gets.to_i
nCompanies = gets.to_i

for idx in 0...nCompanies
  s = gets.split(" ")
  s0 = s[0].to_i
  s1 = s[1].to_i

  c = Company.new(s0, s1)
  companies.push(c)
end

combs = Combinations.new(nCompanies)

feeTotals = []
combs.each{|comb|
  nEngineersTotal = 0
  feeTotal = 0
  comb.each_with_index{|is_true, i|
    if is_true
      nEngineersTotal += companies[i].nEngineers
      feeTotal += companies[i].fee
    end
  }
  feeTotals.push(feeTotal) if nEngineersTotal >= nEngineersRequired
}

puts feeTotals.min
