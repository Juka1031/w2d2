require "employee"


class Startup
    attr_reader :name, :funding, :salaries, :employees
    def initialize(name, funding, salaries) #salary is a hash where key is title and salary is value 'title => salary
        @name = name
        @funding =funding
        @salaries = salaries
        @employees = [] #employee is an array of employee instances that have .name .title .earning calls
    end

    def valid_title?(title)
        return true if @salaries.keys.include?(title)
        false
    end

    def >(other_startup)
         return true if @funding > other_startup.funding
        false
    end

    def hire(hire_name, hire_title)
        if @salaries.keys.include?(hire_title)
            hire_name = Employee.new(hire_name, hire_title)
            @employees << hire_name
        else #title not valid
            raise TitleError "Invalid Title"
        end
    end

    def size
        @employees.length
    end
    
    def pay_employee(employee) #employee is just a variable that we have to keep in mind that we use instance classes on
        if self.funding > @salaries[employee.title]
            @funding -= @salaries[employee.title] #ask questinos HERE!!!!!!!!!!!!!
            employee.pay(@salaries[employee.title])
            
        else
            raise MoneyError "Not enough minerals"
        end

    end

    def payday
        @employees.each do |employee|
            pay_employee(employee)
        end
    end

    def average_salary
        sum = 0
        @employees.each do |employee|
            sum += @salaries[employee.title]
        end
        sum/@employees.length.to_f
    end

    def close
        @employees = []
        @funding = 0
    end

    def acquire(other_startup)
        @funding += other_startup.funding

        
        other_startup.salaries.each do |title2,salary2|
            if !@salaries.keys.include?(title2) #if the title does not exist in the acquiring startup
                @salaries[title2] = salary2
            end
        end
        
        @employees += other_startup.employees
        other_startup.close
    end


end
