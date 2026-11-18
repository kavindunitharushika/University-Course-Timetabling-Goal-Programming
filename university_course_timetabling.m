% University Course Timetabling Using Goal Programming
% Transcribed and reformatted from 12948-casestudy.pdf, pp. 15-16.
% IMPORTANT: This is a report-based transcription, NOT a verified solver.
% The report's model contains limitations: Z3 and Z4 are set to zero,
% the stated priorities do not match the listed weights, and the
% room-capacity/assignment constraints may make the problem infeasible.
% Requires MATLAB Optimization Toolbox.

n = 20; % Number of courses
m = 12; % Number of time slots
courses = arrayfun(@(i) sprintf('c%d', i), 1:n, 'UniformOutput', false);
slots = arrayfun(@(j) sprintf('s%d', j), 1:m, 'UniformOutput', false);

% Faculty preferences (Pij), as given in the report
P = [
    1 0 0 0 0 1 0 0 0 0 0 1;
    0 0 1 0 0 0 0 1 0 0 0 0;
    0 1 0 0 0 0 0 0 0 0 1 0;
    0 0 0 0 0 0 1 0 0 0 0 0;
    0 0 0 1 0 0 0 1 0 0 0 0;
    0 1 0 0 1 0 0 0 0 1 0;
    0 0 0 1 0 0 1 0 0 1 0 0;
    0 0 1 0 0 1 0 0 0 0 1 0;
    1 0 0 1 1 0 0 0 0 0 0 0;
    0 1 0 0 0 0 0 1 0 0 0 0;
    0 0 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 0 1 0 1 0 0 0 1;
    0 0 1 0 0 0 0 0 0 0 0 0;
    0 0 0 0 1 0 1 0 1 0 0 0;
    1 0 0 0 1 0 1 0 0 0 0 1;
    0 1 0 0 0 0 0 0 0 1 0 0;
    0 0 0 0 1 0 0 0 1 0 0 0;
    1 0 0 0 0 0 1 0 0 0 0 1;
    1 1 0 0 0 1 0 0 0 0 0 0;
    0 0 0 1 0 0 1 0 0 0 0 0
];

rooms = 6;
room_capacity = [80 60 100 50 75 30];
enrollment = [100 58 85 30 50 80 75 45 100 30 60 80 90 50 75 90 55 35 85 70];

w1 = 5; w2 = 3; w3 = 2; w4 = 1;
x = optimvar('x', n, m, 'Type', 'integer', 'LowerBound', 0, 'UpperBound', 1);

Z1 = sum(sum((x - P).^2));
Z2 = 0;
for j = 1:m
    assigned_courses = x(:, j);
    total_enrollment_in_slot = sum(enrollment' .* assigned_courses);
    Z2 = Z2 + (room_capacity(mod(j-1, rooms) + 1) - total_enrollment_in_slot)^2;
end
Z3 = 0; % Placeholder in original report
Z4 = 0; % Placeholder in original report
Z = w1*Z1 + w2*Z2 + w3*Z3 + w4*Z4;

% Reformatted as named optimization constraints for MATLAB's problem-based API.
problem = optimproblem('Objective', Z);
capacityConstraints = optimconstr(m, 1);
for j = 1:m
    capacityConstraints(j) = sum(enrollment' .* x(:, j)) <= room_capacity(mod(j-1, rooms) + 1);
end
problem.Constraints.capacity = capacityConstraints;
problem.Constraints.oneSlotPerCourse = sum(x, 2) == 1;

% The report's printed result has several courses in multiple slots,
% contradicting the one-slot-per-course constraint above.
[sol, fval, exitflag, output] = solve(problem);
if exitflag > 0
    timetable = double(sol.x > 0.5);
    disp('Course Timetable (rows: courses; columns: time slots):');
    disp(array2table(timetable, 'VariableNames', slots, 'RowNames', courses));
    fprintf('Objective value: %.6f\n', fval);
else
    warning('No confirmed feasible solution was returned. Review model assumptions.');
    disp(output);
end
