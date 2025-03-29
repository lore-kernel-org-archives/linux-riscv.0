Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44B68C36008
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Mar 2025 09:54:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:To:From:Subject:Message-ID:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BuyetxkCmXJAV1Uw3b2iTXIKWQeI5bquTC+B3FdmQa0=; b=STakL3pqUzLLmI
	Z78yuGuIHU2I4qCoq48t1+5W9NK2qsN85pwLaU6VyNGfdGtIa7r0zZ6MPPXEVRUGdiTKofk6dNBFR
	Hz9Eit7ZaPT2KwKxBe7vVjsbEABYVmq+2TImVcNyp77vwNaZGehjeT1XqZaEHsRBLkAtgRGPaT0r5
	ake0sCysPXJ+QEPHuEuZp1GH7mJ8qriJ5B151bKS0UvaLzHmZ3jS7K7zjUzR07R1CKkposfLi8reS
	LBzLRnymWQqUMk3u0olgeCojWA9Kf9USZvcHNBaqIQMQ/YHEHel+n910soAmsbCoJU5+b5APSUBsZ
	RQUDcyaKDa1AeAtteWiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tySt2-0000000F0Fe-3BKW;
	Sat, 29 Mar 2025 09:53:56 +0000
Received: from polaris.svanheule.net ([2a00:c98:2060:a004:1::200])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tySsz-0000000F0El-1zPR
	for linux-riscv@lists.infradead.org;
	Sat, 29 Mar 2025 09:53:55 +0000
Received: from [192.168.90.187] (unknown [94.110.49.146])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sander@svanheule.net)
	by polaris.svanheule.net (Postfix) with ESMTPSA id B3CA15DACBF;
	Sat, 29 Mar 2025 10:53:45 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=svanheule.net;
	s=mail1707; t=1743242026;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dH9+6RQdoDLhFzbAWFEt6un7a5fTJ8/Aw42J7tuTQSc=;
	b=rwwxVMWs4hmFUXR5Td3TjP/acvp3cAlIDH0WpWA3tkqqv42r4ZU2uzI+Dr6NRRnaj1VyWq
	YwQR+xbW0wQSsvZosFiVGmjRy2nhd6qBObzIqS67Wxefh8OC8WU8ptWfvzKnxOtoFlevj2
	ka1d+rX8A8qDhkJOAty9gQUkKorj6txt8Ueq/WryT0xIHhPEunesc1MvNdSWtgHzpXo7e4
	dnewaHqKAPgTeDxcfjAXVudN8K87bSuCfGxKE3nxk5zQtfDJHOfXRruuKO3IDSpaC6gtj6
	OA9GO7oUv7v5Q84NRb5lYQJHYmneUNWPdixJ09rcyHD2BZMfa7NhU3C/hYsIdw==
Message-ID: <27075369f1d53f840965a09601e10b130f622d16.camel@svanheule.net>
Subject: Re: [PATCH] dt-bindings: gpio: Correct indentation and style in DTS
 example
From: Sander Vanheule <sander@svanheule.net>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Linus Walleij	
 <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>,
  Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea
 <claudiu.beznea@tuxon.dev>, Shawn Guo	 <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Paul Walmsley	
 <paul.walmsley@sifive.com>, Samuel Holland <samuel.holland@sifive.com>, 
 Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>, Shubhrajyoti Datta
 <shubhrajyoti.datta@amd.com>, Srinivas Neeli	 <srinivas.neeli@amd.com>,
 Michal Simek <michal.simek@amd.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Manikandan
 Muralidharan	 <manikandan.m@microchip.com>, Maxime Ripard
 <mripard@kernel.org>, Laurent Pinchart
 <laurent.pinchart+renesas@ideasonboard.com>, Bert Vermeulen
 <bert@biot.com>, 	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-renesas-soc@vger.kernel.org
Date: Sat, 29 Mar 2025 10:53:45 +0100
In-Reply-To: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
References: <20250324125326.82270-1-krzysztof.kozlowski@linaro.org>
User-Agent: Evolution 3.54.3 (3.54.3-1.fc41) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_025353_896175_AD97309E 
X-CRM114-Status: GOOD (  13.10  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

SGkgS3J5c3p0b2YsCgpPbiBNb24sIDIwMjUtMDMtMjQgYXQgMTM6NTMgKzAxMDAsIEtyenlzenRv
ZiBLb3psb3dza2kgd3JvdGU6Cj4gRFRTIGV4YW1wbGUgaW4gdGhlIGJpbmRpbmdzIHNob3VsZCBi
ZSBpbmRlbnRlZCB3aXRoIDItIG9yIDQtc3BhY2VzIGFuZAo+IGFsaWduZWQgd2l0aCBvcGVuaW5n
ICctIHwnLCBzbyBjb3JyZWN0IGFueSBkaWZmZXJlbmNlcyBsaWtlIDMtc3BhY2VzIG9yCj4gbWl4
dHVyZXMgMi0gYW5kIDQtc3BhY2VzIGluIG9uZSBiaW5kaW5nLsKgIFdoaWxlIHJlLWluZGVudGlu
ZywgZHJvcAo+IHVudXNlZCBsYWJlbHMuCj4gCj4gTm8gZnVuY3Rpb25hbCBjaGFuZ2VzIGhlcmUs
IGJ1dCBzYXZlcyBzb21lIGNvbW1lbnRzIGR1cmluZyByZXZpZXdzIG9mCj4gbmV3IHBhdGNoZXMg
YnVpbHQgb24gZXhpc3RpbmcgY29kZS4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBLcnp5c3p0b2YgS296
bG93c2tpIDxrcnp5c3p0b2Yua296bG93c2tpQGxpbmFyby5vcmc+Cj4gLS0tCj4gwqAuLi4vYmlu
ZGluZ3MvZ3Bpby9hdG1lbCxhdDkxcm05MjAwLWdwaW8ueWFtbMKgIHwgMTYgKystLS0KPiDCoC4u
Li9iaW5kaW5ncy9ncGlvL2ZhaXJjaGlsZCw3NGhjNTk1LnlhbWzCoMKgwqDCoMKgIHwgMjAgKysr
LS0tCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL2dwaW8tbXhzLnlhbWzCoMKgwqAg
fCA3MCArKysrKysrKystLS0tLS0tLS0tCj4gwqAuLi4vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlv
L254cCxwY2Y4NTc1LnlhbWwgfCAyNCArKystLS0tCj4gwqAuLi4vYmluZGluZ3MvZ3Bpby9yZWFs
dGVrLG90dG8tZ3Bpby55YW1swqDCoMKgwqDCoCB8wqAgOCArLS0KPiDCoC4uLi9iaW5kaW5ncy9n
cGlvL3JlbmVzYXMsZW0tZ2lvLnlhbWzCoMKgwqDCoMKgwqDCoMKgIHwgMjAgKysrLS0tCj4gwqAu
Li4vYmluZGluZ3MvZ3Bpby9yZW5lc2FzLHJjYXItZ3Bpby55YW1swqDCoMKgwqDCoCB8IDI0ICsr
Ky0tLS0KPiDCoC4uLi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vc2lmaXZlLGdwaW8ueWFtbCB8
wqAgNiArLQo+IMKgLi4uL2JpbmRpbmdzL2dwaW8vdG9zaGliYSxncGlvLXZpc2NvbnRpLnlhbWzC
oCB8IDI0ICsrKy0tLS0KPiDCoC4uLi9iaW5kaW5ncy9ncGlvL3hsbngsZ3Bpby14aWxpbngueWFt
bMKgwqDCoMKgwqDCoCB8IDQ4ICsrKysrKy0tLS0tLS0KPiDCoDEwIGZpbGVzIGNoYW5nZWQsIDEz
MCBpbnNlcnRpb25zKCspLCAxMzAgZGVsZXRpb25zKC0pCj4gCj4gZGlmZiAtLWdpdCBhL0RvY3Vt
ZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3JlYWx0ZWssb3R0by1ncGlvLnlhbWwK
PiBiL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9ncGlvL3JlYWx0ZWssb3R0by1n
cGlvLnlhbWwKPiBpbmRleCAzOWZkOTU5YzQ1ZDIuLjcyODA5OWM2NTgyNCAxMDA2NDQKPiAtLS0g
YS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvZ3Bpby9yZWFsdGVrLG90dG8tZ3Bp
by55YW1sCj4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2dwaW8vcmVh
bHRlayxvdHRvLWdwaW8ueWFtbAo+IEBAIC04MSw3ICs4MSw3IEBAIGRlcGVuZGVuY2llczoKPiDC
oAo+IMKgZXhhbXBsZXM6Cj4gwqDCoCAtIHwKPiAtwqDCoMKgwqDCoCBncGlvQDM1MDAgewo+ICvC
oMKgwqAgZ3Bpb0AzNTAwIHsKPiDCoMKgwqDCoMKgwqDCoMKgIGNvbXBhdGlibGUgPSAicmVhbHRl
ayxydGw4MzgwLWdwaW8iLCAicmVhbHRlayxvdHRvLWdwaW8iOwo+IMKgwqDCoMKgwqDCoMKgwqAg
cmVnID0gPDB4MzUwMCAweDFjPjsKPiDCoMKgwqDCoMKgwqDCoMKgIGdwaW8tY29udHJvbGxlcjsK
PiBAQCAtOTEsOSArOTEsOSBAQCBleGFtcGxlczoKPiDCoMKgwqDCoMKgwqDCoMKgICNpbnRlcnJ1
cHQtY2VsbHMgPSA8Mj47Cj4gwqDCoMKgwqDCoMKgwqDCoCBpbnRlcnJ1cHQtcGFyZW50ID0gPCZy
dGxpbnRjPjsKPiDCoMKgwqDCoMKgwqDCoMKgIGludGVycnVwdHMgPSA8MjM+Owo+IC3CoMKgwqDC
oMKgIH07Cj4gK8KgwqDCoCB9Owo+IMKgwqAgLSB8Cj4gLcKgwqDCoMKgwqAgZ3Bpb0AzMzAwIHsK
PiArwqDCoMKgIGdwaW9AMzMwMCB7Cj4gwqDCoMKgwqDCoMKgwqDCoCBjb21wYXRpYmxlID0gInJl
YWx0ZWsscnRsOTMwMC1ncGlvIiwgInJlYWx0ZWssb3R0by1ncGlvIjsKPiDCoMKgwqDCoMKgwqDC
oMKgIHJlZyA9IDwweDMzMDAgMHgxYz4sIDwweDMzMzggMHg4PjsKPiDCoMKgwqDCoMKgwqDCoMKg
IGdwaW8tY29udHJvbGxlcjsKPiBAQCAtMTAzLDYgKzEwMyw2IEBAIGV4YW1wbGVzOgo+IMKgwqDC
oMKgwqDCoMKgwqAgI2ludGVycnVwdC1jZWxscyA9IDwyPjsKPiDCoMKgwqDCoMKgwqDCoMKgIGlu
dGVycnVwdC1wYXJlbnQgPSA8JnJ0bGludGM+Owo+IMKgwqDCoMKgwqDCoMKgwqAgaW50ZXJydXB0
cyA9IDwxMz47Cj4gLcKgwqDCoMKgwqAgfTsKPiArwqDCoMKgIH07Cj4gwqAKPiDCoC4uLgoKRldJ
VwoKUmV2aWV3ZWQtYnk6IFNhbmRlciBWYW5oZXVsZSA8c2FuZGVyQHN2YW5oZXVsZS5uZXQ+CgpU
aGFua3MhCgpCZXN0LApTYW5kZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
