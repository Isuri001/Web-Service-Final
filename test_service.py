import requests

try:
    response = requests.get('http://localhost:5000')
    print(f"Status Code: {response.status_code}")
    print(f"Response JSON: {response.json()}")

    # Assertions
    assert response.status_code == 200
    assert response.json()["message"] == "Coinbase Exchange Service Running"
except requests.exceptions.RequestException as e:
    print(f"Error: {e}")
except AssertionError:
    print("Assertion failed!")

