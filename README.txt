JDBC(STUDENT DATA)

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Scanner;

public class student {

    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        Connection con = null;
        Scanner sc = new Scanner(System.in);

        // Step 1: Register driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Step 2: Establish connection
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/sy11", "root", "0803");
        System.out.println("Connection Established");

        while (true) {
            System.out.println("\nChoose an Operation");
            System.out.println("1. Insert a record");
            System.out.println("2. Update a record");
            System.out.println("3. Delete a record");
            System.out.println("4. Exit");
            int choice = sc.nextInt();

            switch (choice) {
                case 1:
                    // Insert operation
                    System.out.println("Enter the roll no:");
                    int roll = sc.nextInt();
                    System.out.println("Enter the name:");
                    String name = sc.next();
                    PreparedStatement pstmtInsert = con.prepareStatement("INSERT INTO student (roll, name) VALUES (?, ?)");
                    pstmtInsert.setInt(1, roll);
                    pstmtInsert.setString(2, name);
                    int rowsInserted = pstmtInsert.executeUpdate();
                    System.out.println(rowsInserted + " record(s) inserted.");
                    break;

                case 2:
                    // Update operation
                    System.out.println("Enter the roll no of the record to update:");
                    int rollToUpdate = sc.nextInt();
                    System.out.println("Enter the new name:");
                    String newName = sc.next();
                    PreparedStatement pstmtUpdate = con.prepareStatement("UPDATE student SET name = ? WHERE roll = ?");
                    pstmtUpdate.setString(1, newName);
                    pstmtUpdate.setInt(2, rollToUpdate);
                    int rowsUpdated = pstmtUpdate.executeUpdate();
                    System.out.println(rowsUpdated + " record(s) updated.");
                    break;

                case 3:
                    // Delete operation
                    System.out.println("Enter the roll no of the record to delete:");
                    int rollToDelete = sc.nextInt();
                    PreparedStatement pstmtDelete = con.prepareStatement("DELETE FROM student WHERE roll = ?");
                    pstmtDelete.setInt(1, rollToDelete);
                    int rowsDeleted = pstmtDelete.executeUpdate();
                    System.out.println(rowsDeleted + " record(s) deleted.");
                    break;

                case 4:
                    // Exit
                    System.out.println("Exiting...");
                    sc.close();
                    if (con != null) {
                        con.close();
                    }
                    return;

                default:
                    System.out.println("Invalid choice. Please try again.");
            }
        }
    }
}



--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SI

import java.awt.EventQueue;

import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JOptionPane;
import javax.swing.JTextField;
import java.awt.Font;
import javax.swing.JButton;
import java.awt.event.ActionListener;
import java.awt.event.ActionEvent;
import java.awt.Color;

public class SI {

	private JFrame frmSimpleInterestCalculator;
	private JTextField P;
	private JTextField R;
	private JTextField T;
	private JTextField SI;
	private JTextField F;
	private JTextField CI;

	/**
	 * Launch the application.
	 */
	public static void main(String[] args) {
		EventQueue.invokeLater(new Runnable() {
			public void run() {
				try {
					SI window = new SI();
					window.frmSimpleInterestCalculator.setVisible(true);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		});
	}

	/**
	 * Create the application.
	 */
	public SI() {
		initialize();
	}

	/**
	 * Initialize the contents of the frame.
	 */
	private void initialize() {
		frmSimpleInterestCalculator = new JFrame();
		frmSimpleInterestCalculator.getContentPane().setBackground(new Color(128, 255, 255));
		frmSimpleInterestCalculator.setTitle("Simple interest Calculator");
		frmSimpleInterestCalculator.setBounds(100, 100, 496, 374);
		frmSimpleInterestCalculator.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
		frmSimpleInterestCalculator.getContentPane().setLayout(null);
		
		JLabel lblNewLabel = new JLabel("Principal amount:");
		lblNewLabel.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 13));
		lblNewLabel.setBounds(10, 11, 158, 19);
		frmSimpleInterestCalculator.getContentPane().add(lblNewLabel);
		
		P = new JTextField();
		P.setBounds(129, 11, 86, 20);
		frmSimpleInterestCalculator.getContentPane().add(P);
		P.setColumns(10);
		
		JLabel lblNewLabel_1 = new JLabel("Rate of Interest:");
		lblNewLabel_1.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 13));
		lblNewLabel_1.setBounds(10, 41, 117, 14);
		frmSimpleInterestCalculator.getContentPane().add(lblNewLabel_1);
		
		R = new JTextField();
		R.setBounds(129, 39, 86, 20);
		frmSimpleInterestCalculator.getContentPane().add(R);
		R.setColumns(10);
		
		JLabel lblNewLabel_2 = new JLabel("Duration:");
		lblNewLabel_2.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 13));
		lblNewLabel_2.setBounds(10, 66, 117, 14);
		frmSimpleInterestCalculator.getContentPane().add(lblNewLabel_2);
		
		T = new JTextField();
		T.setBounds(129, 64, 86, 20);
		frmSimpleInterestCalculator.getContentPane().add(T);
		T.setColumns(10);
		
		JButton btnNewButton = new JButton("Calculate");
		btnNewButton.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
				Float p,r,t,si,f;
				double ci;
				try {
					p=Float.parseFloat(P.getText());
					r=Float.parseFloat(R.getText());
					t=Float.parseFloat(T.getText());
					si=p*r*t/100;
					f=p+si;
					ci=p*Math.pow((1+r/100),t);
					SI.setText(Float.toString(si));
					F.setText(Float.toString(f));
					CI.setText(Double.toString(ci));
				}catch(Exception e1) {
					JOptionPane.showMessageDialog(null,"Enter valid values");
				}
			}
		});
		btnNewButton.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 17));
		btnNewButton.setBounds(10, 110, 158, 30);
		frmSimpleInterestCalculator.getContentPane().add(btnNewButton);
		
		JLabel lblNewLabel_3 = new JLabel("Simple Interest:");
		lblNewLabel_3.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 15));
		lblNewLabel_3.setBounds(10, 166, 132, 19);
		frmSimpleInterestCalculator.getContentPane().add(lblNewLabel_3);
		
		SI = new JTextField();
		SI.setBounds(185, 167, 86, 20);
		frmSimpleInterestCalculator.getContentPane().add(SI);
		SI.setColumns(10);
		
		JLabel lblNewLabel_4 = new JLabel("Final Amount:");
		lblNewLabel_4.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 15));
		lblNewLabel_4.setBounds(10, 196, 117, 14);
		frmSimpleInterestCalculator.getContentPane().add(lblNewLabel_4);
		
		F = new JTextField();
		F.setBounds(185, 198, 86, 20);
		frmSimpleInterestCalculator.getContentPane().add(F);
		F.setColumns(10);
		
		JLabel lblNewLabel_5 = new JLabel("Compound Interest:");
		lblNewLabel_5.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 15));
		lblNewLabel_5.setBounds(10, 221, 158, 14);
		frmSimpleInterestCalculator.getContentPane().add(lblNewLabel_5);
		
	
		JButton btnNewButton_1 = new JButton("Clear");
		btnNewButton_1.addActionListener(new ActionListener() {
			public void actionPerformed(ActionEvent e) {
			}
		});
		btnNewButton_1.setFont(new Font("Tahoma", Font.BOLD | Font.ITALIC, 16));
		btnNewButton_1.setBounds(10, 270, 89, 23);
		frmSimpleInterestCalculator.getContentPane().add(btnNewButton_1);
			CI = new JTextField();
		CI.setBounds(185, 220, 86, 20);
		frmSimpleInterestCalculator.getContentPane().add(CI);
		CI.setColumns(10);
	}
}


--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

SERVELET

package pa1;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;


@WebServlet("/practical")
public class practical extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		double j =Double.parseDouble(req.getParameter("num1"));
		double l=Math.PI*j*j;
		
		res.setContentType("text/html");
		PrintWriter out=res.getWriter();
		 out.println("<html><body>");
	        out.println("<h2>Area of the Circle</h2>");
	        out.println("<p>Radius: " + j + "</p>");
	        out.println("<p>Area: " + l + "</p>");
	        out.println("</body></html>");
		
	}

}

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

JSP

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title>Factorial Calculator</title>
</head>
<body>
    <h2>Enter a Number to Calculate Factorial</h2>
    <form action="" method="post">
        <label for="number">Number:</label>
        <input type="number" name="number" required>
        <input type="submit" value="Calculate Factorial">
    </form>

    <%
        // Check if the form is submitted
        String numStr = request.getParameter("number");
        
        if (numStr != null && !numStr.isEmpty()) {
            int number = Integer.parseInt(numStr);
            long factorial = 1; // Using long for smaller numbers
            
            for (int i = 1; i <= number; i++) {
                factorial *= i;
            }
            
            out.println("<h3>The factorial of " + number + " is: " + factorial + "</h3>");
        }
    %>
</body>
</html>

--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

JAVA FX

import javafx.application.Application;
import javafx.stage.Stage;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.control.TextField;
import javafx.scene.layout.VBox;
import javafx.scene.layout.HBox;
import javafx.geometry.Pos;

public class CalculatorApp extends Application {
    @Override
    public void start(Stage primaryStage) {
        // Input fields
        TextField num1Field = new TextField();
        TextField num2Field = new TextField();
        Label resultLabel = new Label("Result will be shown here");

        // Buttons
        Button addButton = new Button("Add");
        Button subtractButton = new Button("Subtract");
        Button multiplyButton = new Button("Multiply");
        Button divideButton = new Button("Divide");

        // Button actions
        addButton.setOnAction(_ -> {
            double num1 = Double.parseDouble(num1Field.getText());
            double num2 = Double.parseDouble(num2Field.getText());
            double result = num1 + num2;
            resultLabel.setText("Result: " + result);
        });

        subtractButton.setOnAction(e -> {
            double num1 = Double.parseDouble(num1Field.getText());
            double num2 = Double.parseDouble(num2Field.getText());
            double result = num1 - num2;
            resultLabel.setText("Result: " + result);
        });

        multiplyButton.setOnAction(e -> {
            double num1 = Double.parseDouble(num1Field.getText());
            double num2 = Double.parseDouble(num2Field.getText());
            double result = num1 * num2;
            resultLabel.setText("Result: " + result);
        });

        divideButton.setOnAction(e -> {
            double num1 = Double.parseDouble(num1Field.getText());
            double num2 = Double.parseDouble(num2Field.getText());
            if (num2 != 0) {
                double result = num1 / num2;
                resultLabel.setText("Result: " + result);
            } else {
                resultLabel.setText("Cannot divide by zero!");
            }
        });

        // Layouts
        HBox buttonBox = new HBox(10, addButton, subtractButton, multiplyButton, divideButton);
        buttonBox.setAlignment(Pos.CENTER);

        VBox root = new VBox(10, num1Field, num2Field, buttonBox, resultLabel);
        root.setAlignment(Pos.CENTER);

        // Scene
        Scene scene = new Scene(root, 400, 300);
        primaryStage.setScene(scene);
        primaryStage.setTitle("Basic Calculator");
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}

