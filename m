Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03A55C83F04
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jul 2025 18:31:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tJJ0ksMnwFeKA2qiw2RRTDi/vJHQnvpIiGaccohLebk=; b=j7U173GYc2lpOb
	eZn3BRDvlh6vX7+yN4S3LgRfSU9oMdgijLiFmAwqnDBUIyQFpbf2iFycVzZUFEHLPrqU2jwWZltqx
	hdHJ33VOp5rXoze18D4ukqB3PRfZ3cwMqjTnjzJvjIjU9SbsoOJeYRVA1TUSZkbeZa093e8TBPgoJ
	2qPAgtKoiSjt6ns9PIqpTFiwho4vnpILVs2VUVOxPlxv9z0HLLVxs8zw1gkftXnMOlhLJCamjbnXq
	A9zuwEqBEn1xw9bCOTcVVZbl7THZrcgJtZ5M+x1OWDKTGVrD6ksfh9rbZFgN7kWUOAcu3d6/OLorV
	zoHonvL3uVeXT6eFM9Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWflL-00000006Knq-3XTD;
	Tue, 01 Jul 2025 18:31:23 +0000
Received: from out-174.mta0.migadu.com ([2001:41d0:1004:224b::ae])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWd1E-00000005uKp-3rrD
	for linux-riscv@lists.infradead.org;
	Tue, 01 Jul 2025 15:35:38 +0000
Message-ID: <fd88c994-c4f0-4ba1-bc8a-908cfb3b5498@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1751384121;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+INSP/GK6T+8bv6Vx93kwG7+YR+IlBFm0hRiAEEEXmI=;
	b=HZW+nI2MTAledHyxlbBKwh7aSa9Lm5EiIUfLAfvH9NMJgPJieoRCcoNNRHtX3e+mw71sFd
	4NOewdCxEfciPMKGTCz8e/Yg7H/3mHMEyWf20a0ZlW8cmuQ90oufqHW7gZk6d8Sw7M25gv
	TQpuKFw/O3FnJLya2Tl1WY3AHBRcnbc=
Date: Tue, 1 Jul 2025 11:35:10 -0400
MIME-Version: 1.0
Subject: Re: [PATCH net-next v2 05/18] net: macb: use BIT() macro for
 capability definitions
To: =?UTF-8?Q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Nicolas Ferre <nicolas.ferre@microchip.com>,
 Claudiu Beznea <claudiu.beznea@tuxon.dev>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Samuel Holland <samuel.holland@sifive.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>,
 Gregory CLEMENT <gregory.clement@bootlin.com>,
 Cyrille Pitchen <cyrille.pitchen@atmel.com>,
 Harini Katakam <harini.katakam@xilinx.com>,
 Rafal Ozieblo <rafalo@cadence.com>,
 Haavard Skinnemoen <hskinnemoen@atmel.com>, Jeff Garzik <jeff@garzik.org>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-mips@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Tawfik Bayouk <tawfik.bayouk@mobileye.com>, Andrew Lunn <andrew@lunn.ch>
References: <20250627-macb-v2-0-ff8207d0bb77@bootlin.com>
 <20250627-macb-v2-5-ff8207d0bb77@bootlin.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Sean Anderson <sean.anderson@linux.dev>
In-Reply-To: <20250627-macb-v2-5-ff8207d0bb77@bootlin.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_083537_101686_DA7D28AF 
X-CRM114-Status: GOOD (  11.68  )
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

T24gNi8yNy8yNSAwNTowOCwgVGjDqW8gTGVicnVuIHdyb3RlOgo+IFJlcGxhY2UgYWxsIGNhcGFi
aWxpdGllcyB2YWx1ZXMgYnkgY2FsbHMgdG8gdGhlIEJJVCgpIG1hY3JvLgo+IAo+IFJldmlld2Vk
LWJ5OiBBbmRyZXcgTHVubiA8YW5kcmV3QGx1bm4uY2g+Cj4gU2lnbmVkLW9mZi1ieTogVGjDqW8g
TGVicnVuIDx0aGVvLmxlYnJ1bkBib290bGluLmNvbT4KPiAtLS0KPiAgZHJpdmVycy9uZXQvZXRo
ZXJuZXQvY2FkZW5jZS9tYWNiLmggfCA0MCArKysrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0t
LS0tLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAyMCBpbnNlcnRpb25zKCspLCAyMCBkZWxldGlvbnMo
LSkKPiAKPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5jZS9tYWNiLmgg
Yi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAo+IGluZGV4IGM5YTVjOGJlYjJm
YTgxNjYxOTVkMWQ4M2YxODdkMmQwYzYyNjY4YTguLjNiNDNjYjk0NjhlMzYxODc1NGZmMmJjNmM1
ZjM2MDQ0N2JkZWVlZDAgMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9uZXQvZXRoZXJuZXQvY2FkZW5j
ZS9tYWNiLmgKPiArKysgYi9kcml2ZXJzL25ldC9ldGhlcm5ldC9jYWRlbmNlL21hY2IuaAo+IEBA
IC03MjcsMjYgKzcyNywyNiBAQAo+ICAjZGVmaW5lIE1BQ0JfTUFOX0M0NV9DT0RFCQkJMgo+ICAK
PiAgLyogQ2FwYWJpbGl0eSBtYXNrIGJpdHMgKi8KPiAtI2RlZmluZSBNQUNCX0NBUFNfSVNSX0NM
RUFSX09OX1dSSVRFCQkweDAwMDAwMDAxCj4gLSNkZWZpbmUgTUFDQl9DQVBTX1VTUklPX0hBU19D
TEtFTgkJMHgwMDAwMDAwMgo+IC0jZGVmaW5lIE1BQ0JfQ0FQU19VU1JJT19ERUZBVUxUX0lTX01J
SV9HTUlJCTB4MDAwMDAwMDQKPiAtI2RlZmluZSBNQUNCX0NBUFNfTk9fR0lHQUJJVF9IQUxGCQkw
eDAwMDAwMDA4Cj4gLSNkZWZpbmUgTUFDQl9DQVBTX1VTUklPX0RJU0FCTEVECQkweDAwMDAwMDEw
Cj4gLSNkZWZpbmUgTUFDQl9DQVBTX0pVTUJPCQkJCTB4MDAwMDAwMjAKPiAtI2RlZmluZSBNQUNC
X0NBUFNfR0VNX0hBU19QVFAJCQkweDAwMDAwMDQwCj4gLSNkZWZpbmUgTUFDQl9DQVBTX0JEX1JE
X1BSRUZFVENICQkweDAwMDAwMDgwCj4gLSNkZWZpbmUgTUFDQl9DQVBTX05FRURTX1JTVE9OVUJS
CQkweDAwMDAwMTAwCj4gLSNkZWZpbmUgTUFDQl9DQVBTX01JSU9OUkdNSUkJCQkweDAwMDAwMjAw
Cj4gLSNkZWZpbmUgTUFDQl9DQVBTX05FRURfVFNVQ0xLCQkJMHgwMDAwMDQwMAo+IC0jZGVmaW5l
IE1BQ0JfQ0FQU19RVUVVRV9ESVNBQkxFCQkJMHgwMDAwMDgwMAo+IC0jZGVmaW5lIE1BQ0JfQ0FQ
U19QQ1MJCQkJMHgwMTAwMDAwMAo+IC0jZGVmaW5lIE1BQ0JfQ0FQU19ISUdIX1NQRUVECQkJMHgw
MjAwMDAwMAo+IC0jZGVmaW5lIE1BQ0JfQ0FQU19DTEtfSFdfQ0hHCQkJMHgwNDAwMDAwMAo+IC0j
ZGVmaW5lIE1BQ0JfQ0FQU19NQUNCX0lTX0VNQUMJCQkweDA4MDAwMDAwCj4gLSNkZWZpbmUgTUFD
Ql9DQVBTX0ZJRk9fTU9ERQkJCTB4MTAwMDAwMDAKPiAtI2RlZmluZSBNQUNCX0NBUFNfR0lHQUJJ
VF9NT0RFX0FWQUlMQUJMRQkweDIwMDAwMDAwCj4gLSNkZWZpbmUgTUFDQl9DQVBTX1NHX0RJU0FC
TEVECQkJMHg0MDAwMDAwMAo+IC0jZGVmaW5lIE1BQ0JfQ0FQU19NQUNCX0lTX0dFTQkJCTB4ODAw
MDAwMDAKPiArI2RlZmluZSBNQUNCX0NBUFNfSVNSX0NMRUFSX09OX1dSSVRFCQlCSVQoMCkKPiAr
I2RlZmluZSBNQUNCX0NBUFNfVVNSSU9fSEFTX0NMS0VOCQlCSVQoMSkKPiArI2RlZmluZSBNQUNC
X0NBUFNfVVNSSU9fREVGQVVMVF9JU19NSUlfR01JSQlCSVQoMikKPiArI2RlZmluZSBNQUNCX0NB
UFNfTk9fR0lHQUJJVF9IQUxGCQlCSVQoMykKPiArI2RlZmluZSBNQUNCX0NBUFNfVVNSSU9fRElT
QUJMRUQJCUJJVCg0KQo+ICsjZGVmaW5lIE1BQ0JfQ0FQU19KVU1CTwkJCQlCSVQoNSkKPiArI2Rl
ZmluZSBNQUNCX0NBUFNfR0VNX0hBU19QVFAJCQlCSVQoNikKPiArI2RlZmluZSBNQUNCX0NBUFNf
QkRfUkRfUFJFRkVUQ0gJCUJJVCg3KQo+ICsjZGVmaW5lIE1BQ0JfQ0FQU19ORUVEU19SU1RPTlVC
UgkJQklUKDgpCj4gKyNkZWZpbmUgTUFDQl9DQVBTX01JSU9OUkdNSUkJCQlCSVQoOSkKPiArI2Rl
ZmluZSBNQUNCX0NBUFNfTkVFRF9UU1VDTEsJCQlCSVQoMTApCj4gKyNkZWZpbmUgTUFDQl9DQVBT
X1FVRVVFX0RJU0FCTEUJCQlCSVQoMTEpCj4gKyNkZWZpbmUgTUFDQl9DQVBTX1BDUwkJCQlCSVQo
MjQpCj4gKyNkZWZpbmUgTUFDQl9DQVBTX0hJR0hfU1BFRUQJCQlCSVQoMjUpCj4gKyNkZWZpbmUg
TUFDQl9DQVBTX0NMS19IV19DSEcJCQlCSVQoMjYpCj4gKyNkZWZpbmUgTUFDQl9DQVBTX01BQ0Jf
SVNfRU1BQwkJCUJJVCgyNykKPiArI2RlZmluZSBNQUNCX0NBUFNfRklGT19NT0RFCQkJQklUKDI4
KQo+ICsjZGVmaW5lIE1BQ0JfQ0FQU19HSUdBQklUX01PREVfQVZBSUxBQkxFCUJJVCgyOSkKPiAr
I2RlZmluZSBNQUNCX0NBUFNfU0dfRElTQUJMRUQJCQlCSVQoMzApCj4gKyNkZWZpbmUgTUFDQl9D
QVBTX01BQ0JfSVNfR0VNCQkJQklUKDMxKQo+ICAKPiAgLyogTFNPIHNldHRpbmdzICovCj4gICNk
ZWZpbmUgTUFDQl9MU09fVUZPX0VOQUJMRQkJCTB4MDEKPiAKClJldmlld2VkLWJ5OiBTZWFuIEFu
ZGVyc29uIDxzZWFuLmFuZGVyc29uQGxpbnV4LmRldj4KCkJ1dCBzaW5jZSB0aGVzZSBjYXBhYmls
aXRpZXMgZG9uJ3QgY29ycmVzcG9uZCB0byBoYXJkd2FyZSByZWdpc3RlcnMsIGNhbgp5b3UgYWRk
IGEgZm9sbG93LXVwIHBhdGNoIHRvIHJlbW92ZSB0aGUgZ2FwIGJldHdlZW4gUVVFVUVfRElTQUJM
RSBhbmQKUENTPwoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
