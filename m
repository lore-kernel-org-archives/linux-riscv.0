Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A151C4167B
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 10:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=H58CN7vOH4XN7A9bPf4+pFg8JNvBnOlvZ4X+9U1ulCw=; b=bnZNtXDGq49uAY
	LE0ngI5hlujN2jv7G90n23yF0bZ+OBwqpuSUTavKkuLucEsO+TDEUqUEf0NGCk6BhckkIdUFIXsUf
	sNUn4VG30vY0A3k8MEN6d/bTEXAJ4Tud+nBNJ0/siImDMN21peztvTdVS2Z6hsHdDCVx5/6jgWc7u
	fpif0AQaAN6VePC8YRQudjcQSKSyWcBS74fi0/VIV0iFZ3t72PsJ8ZAQfbpWG8ItHI49vL4xq0T8q
	2H+THci4h16dj0XtN6hEW8ShhX32SDuriBy1pVffnxzgc0GTVhe/NYDmArO32Jk+TEabImL7zEiAd
	a4NG8iifV6/0J5/oALCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzdX-00BGYZ-2G;
	Tue, 12 Dec 2023 10:05:11 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCzdU-00BGVC-18
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 10:05:10 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id CC56924E252;
	Tue, 12 Dec 2023 18:04:29 +0800 (CST)
Received: from EXMBX064.cuchost.com (172.16.6.64) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 18:04:29 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX064.cuchost.com
 (172.16.6.64) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 18:04:29 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 18:04:29 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 05/16] dt-bindings: clock: Add StarFive JH8100 System
 clock and reset generator
Thread-Topic: [PATCH v1 05/16] dt-bindings: clock: Add StarFive JH8100 System
 clock and reset generator
Thread-Index: AQHaKDp4JclXcVkKt02w6zhm85IHbbCfKBKAgAW3QzD///ifgIAAnJVw
Date: Tue, 12 Dec 2023 10:04:29 +0000
Message-ID: <7d9736fcdbf14092a2f9747a1a27f478@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-6-jeeheng.sia@starfivetech.com>
 <1ebb4733-0f1d-46ea-b399-34af7df088ac@linaro.org>
 <090f2d44fc8b4113b5b5e002d15b0675@EXMBX066.cuchost.com>
 <7585685b-151f-46fd-bb57-29000b916e1e@linaro.org>
In-Reply-To: <7585685b-151f-46fd-bb57-29000b916e1e@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [175.136.135.142]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231212_020508_713953_246ABBD8 
X-CRM114-Status: GOOD (  13.62  )
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogS3J6eXN6dG9mIEtvemxv
d3NraSA8a3J6eXN6dG9mLmtvemxvd3NraUBsaW5hcm8ub3JnPg0KPiBTZW50OiBUdWVzZGF5LCBE
ZWNlbWJlciAxMiwgMjAyMyA0OjQzIFBNDQo+IFRvOiBKZWVIZW5nIFNpYSA8amVlaGVuZy5zaWFA
c3RhcmZpdmV0ZWNoLmNvbT47IGtlcm5lbEBlc21pbC5kazsgY29ub3JAa2VybmVsLm9yZzsgcm9i
aCtkdEBrZXJuZWwub3JnOw0KPiBrcnp5c3p0b2Yua296bG93c2tpK2R0QGxpbmFyby5vcmc7IHBh
dWwud2FsbXNsZXlAc2lmaXZlLmNvbTsgcGFsbWVyQGRhYmJlbHQuY29tOyBhb3VAZWVjcy5iZXJr
ZWxleS5lZHU7DQo+IG10dXJxdWV0dGVAYmF5bGlicmUuY29tOyBzYm95ZEBrZXJuZWwub3JnOyBw
LnphYmVsQHBlbmd1dHJvbml4LmRlOyBlbWlsLnJlbm5lci5iZXJ0aGluZ0BjYW5vbmljYWwuY29t
OyBIYWwgRmVuZw0KPiA8aGFsLmZlbmdAc3RhcmZpdmV0ZWNoLmNvbT47IFhpbmd5dSBXdSA8eGlu
Z3l1Lnd1QHN0YXJmaXZldGVjaC5jb20+DQo+IENjOiBsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnOyBkZXZpY2V0cmVlQHZnZXIua2VybmVsLm9yZzsgbGludXgta2VybmVsQHZnZXIua2Vy
bmVsLm9yZzsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgTGV5Zm9vbiBUYW4NCj4gPGxleWZv
b24udGFuQHN0YXJmaXZldGVjaC5jb20+DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjEgMDUvMTZd
IGR0LWJpbmRpbmdzOiBjbG9jazogQWRkIFN0YXJGaXZlIEpIODEwMCBTeXN0ZW0gY2xvY2sgYW5k
IHJlc2V0IGdlbmVyYXRvcg0KPiANCj4gT24gMTIvMTIvMjAyMyAwMzo0NywgSmVlSGVuZyBTaWEg
d3JvdGU6DQo+ID4+PiArI2RlZmluZSBTWVNDUkdfQ0xLX05ORV9JQ0dfRU4JCQkJCQkxMDgNCj4g
Pj4+ICsNCj4gPj4+ICsjZGVmaW5lIFNZU0NSR19DTEtfRU5ECQkJCQkJCTEwOQ0KPiA+Pg0KPiA+
PiBEcm9wIGZyb20gYmluZGluZyBoZWFkZXIuDQo+ID4gRG8geW91IG1lYW4gZG9u4oCZdCBkZWZp
bmUgdGhlIG51bWJlciBvZiBjbGsgaW4gdGhlIGhlYWRlcj8NCj4gDQo+IFllcw0KPiANCj4gPiBJ
J2xsIGhhdmUgdG8gZGVmaW5lDQo+ID4gSXQgaW4gdGhlIGRyaXZlciB0aGVuLi4NCj4gDQo+IEFu
ZCB0aGlzIGlzIGEgcHJvYmxlbSBiZWNhdXNlPw0KTm9wZSwgbm90IGEgcHJvYmxlbS4NCj4gDQo+
IA0KPiBCZXN0IHJlZ2FyZHMsDQo+IEtyenlzenRvZg0KDQpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
