require 'rails_helper'

RSpec.describe "movies/index", type: :view do
  before(:each) do
    assign(:movies, [
      Movie.create!(
        title: "Title",
        text: "",
        ratings: "",
        category: 2
      ),
      Movie.create!(
        title: "Title",
        text: "",
        ratings: "",
        category: 2
      )
    ])
  end

  it "renders a list of movies" do
    render
    assert_select "tr>td", text: "Title".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: "".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
  end
end
