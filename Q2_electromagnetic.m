clear; % پاکسازی متغیرهای قبلی

% دریافت سیستم مختصات ورودی از کاربر
disp('Enter the coordinate system of the input coordinate');
coordinateSystem = input(' (r, c, or s)... \n > ','s');

% تنظیم سیستم مختصات مستطیلی به عنوان پیش فرض اگر ورودی خالی باشد
if isempty(coordinateSystem)
    coordinateSystem = 'r';
end

% محاسبه مختصات دیگر بر اساس سیستم مختصات انتخابی
if coordinateSystem == 'r'
    % محاسبه مختصات استوانه‌ای
    disp('Enter the rectangular coordinate in the');
    rectangularCoordinate = input('format [x y z]... \n > ');
    
    % تنظیم مقدار پیش فرض برای مختصات مستطیلی اگر ورودی خالی باشد
    if isempty(rectangularCoordinate)
        rectangularCoordinate = [0 0 0];
    end
    
    % محاسبه مختصات استوانه‌ای
    disp('Cylindrical coordinates [rho phi(rad) z]:');
    cylindricalCoordinate = [sqrt(rectangularCoordinate(1)^2 + rectangularCoordinate(2)^2) atan2(rectangularCoordinate(2), rectangularCoordinate(1)) rectangularCoordinate(3)];
    disp(cylindricalCoordinate);
    
    % محاسبه مختصات کروی
    disp('Spherical coordinates [r phi(rad) theta(rad)]:');
    sphericalCoordinate = [norm(rectangularCoordinate) atan2(rectangularCoordinate(2), rectangularCoordinate(1)) acos(rectangularCoordinate(3)/norm(rectangularCoordinate))];
    disp(sphericalCoordinate);
    
elseif coordinateSystem == 'c'
    % محاسبه مختصات مستطیلی
    disp('Enter the cylindrical coordinate in the format');
    cylindricalCoordinate = input('[rho phi z]... \n > ');
    
    % تنظیم مقدار پیش فرض برای مختصات استوانه‌ای اگر ورودی خالی باشد
    if isempty(cylindricalCoordinate)
        cylindricalCoordinate = [0 0 0];
    end
    
    % محاسبه مختصات مستطیلی
    disp('Rectangular coordinates [x y z]:');
    rectangularCoordinate = [cylindricalCoordinate(1)*cos(cylindricalCoordinate(2)) cylindricalCoordinate(1)*sin(cylindricalCoordinate(2)) cylindricalCoordinate(3)];
    disp(rectangularCoordinate);
    
    % محاسبه مختصات کروی
    disp('Spherical coordinates [r phi(rad) theta(rad)]:');
    sphericalCoordinate = [sqrt(cylindricalCoordinate(1)^2 + cylindricalCoordinate(3)^2) cylindricalCoordinate(2) cylindricalCoordinate(3)*cos(cylindricalCoordinate(3))];
    disp(sphericalCoordinate
