require "test_helper"

class StudentScoresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get student_scores_new_url
    assert_response :success
  end

  test "should get create" do
    get student_scores_create_url
    assert_response :success
  end
end
