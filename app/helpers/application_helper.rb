module ApplicationHelper
	def eligible_students(camp)
		Student.below_rating(camp.curriculum.max_rating).at_or_above_rating(camp.curriculum.max_rating).active.alphabetical.all
	end

	def eligible_unregistered_students(camp)
		eligible = eligible_students(camp)
		registered_students = camp.students
		eligible_unregistered = eligible - registered_students
	end	
end
