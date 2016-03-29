

class Employee
	attr_reader :name, :email
	def initialize name, email
		@name = name
		@email = email
	end
end



class Peasant < Employee 
	def initialize name, email, hours, hourly_salary
		@name = name
		@email = email
		@hours = hours
		@hourly_salary = hourly_salary
	end	
	def calculate_salary
		total_salary = @hours * @hourly_salary * 4
		return total_salary
	end
end



class Fixed < Employee
	def initialize name, email, salary
		@name = name
		@email = email
		@salary = salary
	end
	def calculate_salary
		total_salary = @salary / 12
		return total_salary
	end
end


class Ted < Employee
	def initialize name, email, salary, hours, hourly_salary
		@name = name
		@email = email
		@salary = salary
		# Be careful! These are weekly hours.
		@hours = hours
		@hourly_salary = hourly_salary
	end
	def calculate_salary
		if @hours > 40
			total_salary = (@hours - 40) * @hourly_salary  * 4 + @salary / 12
		else 
			total_salary = @salary / 12
		return total_salary
		end
	end

end

class PayRoll

	def initialize employees
		@employees = employees
	end

	def payment employees
		@employees.each do |paid_employee|
			#Change print into put.
			print paid_employee.name
			print " : "
			puts (paid_employee.calculate_salary * 1.18).round(2) 
			end
	end


	def total_payment employees
		@employees.reduce(0) { |sum, paid_employee| sum + paid_employee.calculate_salary}
	end

	def notification employee
		if @employees.include?(employee) 
			puts "Payroll completed for #{employee.name}"
			puts "Message sent to #{employee.email}"
		end
	end



end



mario = Peasant.new("Mario", "mariobrassesco@gmail.com", 35, 100)
adria = Fixed.new("Adria", "adria@gmail.com", 100000)
ted = Ted.new("Ted", "ted@gmail.com", 40000, 45, 60)


employees = [mario, adria, ted]




payroll1 = PayRoll.new employees


payroll1.payment employees

print "Total: "
puts payroll1.total_payment employees

payroll1.notification mario


