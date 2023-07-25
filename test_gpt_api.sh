curl -X POST "http://localhost:5090/user/query/" \
    --insecure \
     -H "Content-Type: application/json" \
     -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2ODMyMzIzMzIsImV4cCI6MTcxNDc2ODMzMiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkVtYWlsIjoib2xvZi5tb3JpeWFAZ21haWwuY29tIn0.wiCYSwwQGuDwkC56a4uNYvnWUxWIgETmB4T0U_hE4Bg" \
     -d '{"message":"Why is rust the best language?"}'


# Test /user/history/{page} endpoint
curl -X GET --insecure "http://localhost:5090/user/history/0" \
     -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2ODMyMzIzMzIsImV4cCI6MTcxNDc2ODMzMiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkVtYWlsIjoib2xvZi5tb3JpeWFAZ21haWwuY29tIn0.wiCYSwwQGuDwkC56a4uNYvnWUxWIgETmB4T0U_hE4Bg" 

# Test /user/context/{page} endpoint
curl -X GET --insecure "http://localhost:5090/user/context/0" \
     -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2ODMyMzIzMzIsImV4cCI6MTcxNDc2ODMzMiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkVtYWlsIjoib2xvZi5tb3JpeWFAZ21haWwuY29tIn0.wiCYSwwQGuDwkC56a4uNYvnWUxWIgETmB4T0U_hE4Bg" 

# Test /user/system/ endpoint
curl -X GET --insecure "http://localhost:5090/user/system/" \
     -H "Authorization: Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJPbmxpbmUgSldUIEJ1aWxkZXIiLCJpYXQiOjE2ODMyMzIzMzIsImV4cCI6MTcxNDc2ODMzMiwiYXVkIjoid3d3LmV4YW1wbGUuY29tIiwic3ViIjoianJvY2tldEBleGFtcGxlLmNvbSIsIkVtYWlsIjoib2xvZi5tb3JpeWFAZ21haWwuY29tIn0.wiCYSwwQGuDwkC56a4uNYvnWUxWIgETmB4T0U_hE4Bg" 

