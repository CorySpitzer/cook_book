require('spec_helper')

describe(Rating) do
  it { should belong_to(:recipe)}

  it('has a value between 0 and 5') do
    rating = Rating.new(value: 6)
    expect(rating.save).to(eq(false))
  end

  it('has a value that is an integer') do
    rating = Rating.new(value: 4.5)
    expect(rating.save).to(eq(false))
  end

end
