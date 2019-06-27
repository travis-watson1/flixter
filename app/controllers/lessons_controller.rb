class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :require_authorized_for_current_course, only: [:show]

  def show
  end

  private

  def require_authorized_for_current_course
    if current_lesson.section.course.user != current_user
      redirect_to course_path(current_course), alert: 'You are not enrolled in this course.'
    end
  end

  helper_method :current_lesson
  def current_lesson
      @current_lesson ||= Lesson.find(params[:id])
  end

  helper_method :current_course
  def current_course
    @current_course ||= Course.find(params[:id])
  end

  def course_params
      params.require(:course).permit(:title, :description, :cost, :image)
  end
end


