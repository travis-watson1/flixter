class EnrollmentsController < ApplicationController
    def create
        current_user.enrollments.create(course: current_course)
        redirect_to course_path(current_course)
    end

    private

    def current_course
        @current_course ||= Course.find(params[:course_id])
    end
end
