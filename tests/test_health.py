import requests

def test_service_responds():
    response = requests.get("http://localhost:5000/health")
    assert response.status_code == 200

