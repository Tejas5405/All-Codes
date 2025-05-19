<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Factorial Calculator</title>
    <style>
        body { font-family: Arial, sans-serif; }
        h1 { color: #333; }
        form { margin-bottom: 20px; }
        input[type="number"] { width: 100px; }
    </style>
</head>
<body>
    <h1>Factorial Calculator</h1>
    <form method="post">
        Enter a non-negative number: 
        <input type="number" name="number" min="0" required>
        <input type="submit" value="Calculate">
    </form>

    <%
        String numberStr = request.getParameter("number");

        if (numberStr != null && !numberStr.isEmpty()) {
            try {
                int number = Integer.parseInt(numberStr);
                if (number < 0) {
                    out.println("<h2>Please enter a non-negative number.</h2>");
                } else {
                    long factorial = 1; 
                    for (int i = 1; i <= number; i++) {
                        factorial *= i;
                    }
                    out.println("<h2>Factorial of " + number + " is " + factorial + "</h2>");
                }
            } catch (NumberFormatException e) {
                out.println("<h2>Invalid input. Please enter a valid non-negative integer.</h2>");
            }
        }
    %>
</body>
</html>
