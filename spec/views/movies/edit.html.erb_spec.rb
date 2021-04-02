require 'rails_helper'

RSpec.describe "movies/edit", type: :view do
  before(:each) do
    @movie = assign(:movie, Movie.create!(
      title: "MyString",
      text: "",
      ratings: "",
      category: 1
    ))
  end

  it "renders the edit movie form" do
    render

    assert_select "form[action=?][method=?]", movie_path(@movie), "post" do

      assert_select "input[name=?]", "movie[title]"

      assert_select "input[name=?]", "movie[text]"

      assert_select "input[name=?]", "movie[ratings]"

      assert_select "input[name=?]", "movie[category]"
    end
  end
end
