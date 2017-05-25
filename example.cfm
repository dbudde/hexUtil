<cfsetting enablecfoutputonly="true" />
<cfscript>
	hexUtil = new hexUtil();
	hexValues = [];
	decimalValues = [];
	isHexValues = [];

	hexValues.append({"input": 0, "result": hexUtil.decimalToHex(0)});
	hexValues.append({"input": 9, "result": hexUtil.decimalToHex(9)});
	hexValues.append({"input": 10, "result": hexUtil.decimalToHex(10)});
	hexValues.append({"input": 15, "result": hexUtil.decimalToHex(15)});
	hexValues.append({"input": 25, "result": hexUtil.decimalToHex(25)});


	for (i = 1000; i <= 5000; i += 250)
	{
		hexValues.append({"input": i, "result": hexUtil.decimalToHex(i)});
	}


	for (pair in hexValues)
	{
		decimalValues.append({"input": pair.result, "result": hexUtil.hexToDecimal(pair.result)});
	}


	isHexValues.append({"input": "FF2233", "isHex": hexUtil.isHex("FF2233")});
	isHexValues.append({"input": "FG2233", "isHex": hexUtil.isHex("FG2233")});
	isHexValues.append({"input": "111111", "isHex": hexUtil.isHex("111111")});

	value = replace(createUUID(), "-", "", "all");
	value2 = encrypt(value, generateSecretKey("aes"));
	value3 = encrypt(value, generateSecretKey("aes"), "aes", "base64");
	value4 = encrypt(value, generateSecretKey("aes"), "aes", "hex");

	isHexValues.append({"input": value, "isHex": hexUtil.isHex(value)});
	isHexValues.append({"input": value2, "isHex": hexUtil.isHex(value2)});
	isHexValues.append({"input": value3, "isHex": hexUtil.isHex(value3)});
	isHexValues.append({"input": value4, "isHex": hexUtil.isHex(value4)});
</cfscript>
<cfsetting enablecfoutputonly="false" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Hexadecimal Example</title>
	<style>
		div.col {
			float: left;
			margin-left: 1%;
			padding: 10px;
		}	
	</style>
</head>
<body>
	<div class="col" style="width: 20%;">
		<h3>Decimals Converted to Hexadecimal</h3>
		<cfdump var="#hexValues#" />
	</div>
	<div class="col" style="width: 20%;">
		<h3>Hexadecimal Converted to Decimals</h3>
		<cfdump var="#decimalValues#" />
	</div>
	<div class="col" style="width: 37%;">
		<h3>Is Hexadecimal Tests</h3>
		<cfdump var="#isHexValues#" />
	</div>
</body>
</html>