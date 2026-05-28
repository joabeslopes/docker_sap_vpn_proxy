const SAP_IP_QAS = Deno.env.get("SAP_IP_QAS");

const httpClient = Deno.createHttpClient({
  proxy: { url: "socks5://openconnect:1080" }
});

const req = await fetch(`http://${SAP_IP_QAS}:8000/route`, {
  client: httpClient,
  method: "POST",
  headers: {
    "Content-Type": "application/json",
  },
  body: JSON.stringify({})
});

const dados = await req.text();
console.log(dados);
