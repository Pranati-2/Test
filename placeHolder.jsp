<%@ taglib uri="http://www.springframework.org/tags/form" prefix="sf" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Place Your Cake Order</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .form-container {
            border: 2px solid #ddd;
            padding: 20px;
            border-radius: 10px;
            width: 50%;
            margin: auto;
        }
        h2 {
            text-align: center;
        }
        .form-section {
            margin-bottom: 20px;
        }
        .form-section label {
            font-weight: bold;
        }
        .form-section input[type="text"],
        .form-section select,
        .form-section input[type="radio"],
        .form-section input[type="checkbox"] {
            margin-top: 10px;
            margin-bottom: 10px;
        }
        .form-section input.error {
            border: 2px solid red;
        }
        .form-section input[type="text"],
        .form-section select {
            width: 100%;
            padding: 5px;
            box-sizing: border-box;
        }
        .form-section input[type="radio"] {
            margin-right: 5px;
        }
        .form-section .error-message {
            color: red;
            font-size: 12px;
        }
        button {
            display: block;
            margin: auto;
            padding: 10px 20px;
            background-color: #4CAF50;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        button:hover {
            background-color: #45a049;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Make Your Cake!</h2>
        <sf:form action="/placeOrder" method="post" modelAttribute="cakeOrder">
            <!-- Cake Size Section -->
            <div class="form-section">
                <label>Size of the Cake</label><br>
                <sf:radiobutton path="size" value="6"/> Round cake 6" - serves 8 people ($10)<br>
                <sf:radiobutton path="size" value="8"/> Round cake 8" - serves 12 people ($15)<br>
                <sf:radiobutton path="size" value="10"/> Round cake 10" - serves 16 people ($25)<br>
                <sf:radiobutton path="size" value="12"/> Round cake 12" - serves 30 people ($30)<br>
                <sf:errors path="size" cssClass="error-message"/>
            </div>

            <!-- Filling Flavor Section -->
            <div class="form-section">
                <label for="filling">Filling Flavor</label><br>
                <sf:select path="filling" id="filling">
                    <sf:option value="">None ($0)</sf:option>
                    <!-- Dynamic options from Controller -->
                    <c:forEach var="flavor" items="${fillingFlavors}">
                        <sf:option value="${flavor.id}">${flavor.name} (${flavor.price})</sf:option>
                    </c:forEach>
                </sf:select>
                <sf:errors path="filling" cssClass="error-message"/>
            </div>

            <!-- Additional Options -->
            <div class="form-section">
                <label>
                    <sf:checkbox path="candles" value="true"/> Include Candles ($5)
                </label><br>
                <label>
                    <sf:checkbox path="inscription" value="true"/> Include Inscription ($5)
                </label>
                <sf:input path="inscriptionText" placeholder="Enter Inscription" />
                <sf:errors path="inscriptionText" cssClass="error-message"/>
            </div>

            <!-- Contact Details Section -->
            <div class="form-section">
                <h3>Contact Details</h3>
                <label for="name">Name</label><br>
                <sf:input path="name" placeholder="Enter your name" id="name"/>
                <sf:errors path="name" cssClass="error-message"/><br>

                <label for="address">Address</label><br>
                <sf:input path="address" placeholder="Enter your address" id="address"/>
                <sf:errors path="address" cssClass="error-message"/><br>

                <label for="phone">Phone Number</label><br>
                <sf:input path="phone" placeholder="Enter your phone number" id="phone"/>
                <sf:errors path="phone" cssClass="error-message"/>
            </div>

            <button type="submit">Place Order</button>
        </sf:form>
    </div>
</body>
</html>
