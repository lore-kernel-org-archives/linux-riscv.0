Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AD53C6FD1F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Mar 2023 03:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XRL8ctO/ulMeuba770FTF67r/bS/UhAEXreRLtS0nJI=; b=v+hbpQCoufneqA
	ToVwY8SuVVfCvbG1LvI2+o/4WeHesCE7ovCXkMdO/TcKcuuKRpGq+O7uUcjXzY1SaSgPMS/uE3PeY
	H6AzP4tn8c9QQpearW9/FInc255+D3QVRG+Bp5lZ4CVl+CeEGHWkrljejXn9hzbEme/FU9jgCPmVj
	cguS0JX1Hqww5NOgGp6iKgtpbpKzXghNvkVbLrXYGQgqRyW8ycEQLzM2fAg9z3XgGqbHe4JnIxTes
	NSQMgrGmlBmfQqWztgBDbJDArG6ny6LiLRWRYdlvuJfutGMREs5W+ijSVhMXmrQFwgAoFBo3WfICh
	gcbutRYwiPe/PrGYZTcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYTO-0046Ev-ED; Mon, 13 Mar 2023 03:03:42 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pbYTJ-00462y-Dg
	for linux-riscv@lists.infradead.org; Mon, 13 Mar 2023 03:03:39 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 465AD24E3ED;
	Mon, 13 Mar 2023 11:03:06 +0800 (CST)
Received: from EXMBX172.cuchost.com (172.16.6.92) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:29:13 +0800
Received: from [192.168.125.74] (183.27.96.115) by EXMBX172.cuchost.com
 (172.16.6.92) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 13 Mar
 2023 10:29:12 +0800
Message-ID: <df2464d3-9e9e-c299-675d-0a3f69856361@starfivetech.com>
Date: Mon, 13 Mar 2023 10:29:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH v4 10/19] dt-bindings: clock: Add StarFive JH7110
 always-on clock and reset generator
Content-Language: en-US
To: Geert Uytterhoeven <geert@linux-m68k.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>
CC: <linux-clk@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Stephen Boyd <sboyd@kernel.org>, "Michael
 Turquette" <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Palmer
 Dabbelt" <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>, "Daniel
 Lezcano" <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>,
	Marc Zyngier <maz@kernel.org>, <linux-kernel@vger.kernel.org>
References: <20230221024645.127922-1-hal.feng@starfivetech.com>
 <20230221024645.127922-11-hal.feng@starfivetech.com>
 <dc88e0df-4e2f-d2b8-4ecb-514862d01c3c@linux-m68k.org>
From: Hal Feng <hal.feng@starfivetech.com>
In-Reply-To: <dc88e0df-4e2f-d2b8-4ecb-514862d01c3c@linux-m68k.org>
X-Originating-IP: [183.27.96.115]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX172.cuchost.com
 (172.16.6.92)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230312_200337_663850_53E94B8F 
X-CRM114-Status: GOOD (  10.89  )
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

T24gVGh1LCA5IE1hciAyMDIzIDE1OjIyOjU0ICswMTAwLCBHZWVydCBVeXR0ZXJob2V2ZW4gd3Jv
dGU6Cj4gwqDCoMKgwqBIaSBIYWwsIEVzbWlsLAo+IAo+IE9uIFR1ZSwgMjEgRmViIDIwMjMsIEhh
bCBGZW5nIHdyb3RlOgo+PiBGcm9tOiBFbWlsIFJlbm5lciBCZXJ0aGluZyA8a2VybmVsQGVzbWls
LmRrPgo+Pgo+PiBBZGQgYmluZGluZ3MgZm9yIHRoZSBhbHdheXMtb24gY2xvY2sgYW5kIHJlc2V0
IGdlbmVyYXRvciAoQU9OQ1JHKSBvbiB0aGUKPj4gSkg3MTEwIFJJU0MtViBTb0MgYnkgU3RhckZp
dmUgTHRkLgo+Pgo+PiBSZXZpZXdlZC1ieTogUm9iIEhlcnJpbmcgPHJvYmhAa2VybmVsLm9yZz4K
Pj4gU2lnbmVkLW9mZi1ieTogRW1pbCBSZW5uZXIgQmVydGhpbmcgPGtlcm5lbEBlc21pbC5kaz4K
Pj4gU2lnbmVkLW9mZi1ieTogSGFsIEZlbmcgPGhhbC5mZW5nQHN0YXJmaXZldGVjaC5jb20+Cj4g
Cj4gVGhhbmtzIGZvciB5b3VyIHBhdGNoIQo+IAo+PiAtLS0gL2Rldi9udWxsCj4+ICsrKyBiL0Rv
Y3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9jbG9jay9zdGFyZml2ZSxqaDcxMTAtYW9u
Y3JnLnlhbWwKPj4gQEAgLTAsMCArMSw3NiBAQAo+PiArIyBTUERYLUxpY2Vuc2UtSWRlbnRpZmll
cjogR1BMLTIuMC1vbmx5IE9SIEJTRC0yLUNsYXVzZQo+PiArJVlBTUwgMS4yCj4+ICstLS0KPj4g
KyRpZDogaHR0cDovL2RldmljZXRyZWUub3JnL3NjaGVtYXMvY2xvY2svc3RhcmZpdmUsamg3MTEw
LWFvbmNyZy55YW1sIwo+PiArJHNjaGVtYTogaHR0cDovL2RldmljZXRyZWUub3JnL21ldGEtc2No
ZW1hcy9jb3JlLnlhbWwjCj4+ICsKPj4gK3RpdGxlOiBTdGFyRml2ZSBKSDcxMTAgQWx3YXlzLU9u
IENsb2NrIGFuZCBSZXNldCBHZW5lcmF0b3IKPj4gKwo+PiArbWFpbnRhaW5lcnM6Cj4+ICvCoCAt
IEVtaWwgUmVubmVyIEJlcnRoaW5nIDxrZXJuZWxAZXNtaWwuZGs+Cj4+ICsKPiAKPiBUaGlzIGxh
Y2tzIGEgdG9wLWxldmVsICJkZXNjcmlwdGlvbiIgc2VjdGlvbiwgdG8gYW53ZXIgdGhlIHF1ZXN0
aW9uOgo+IFdoYXQgaXMgYW4gIkFsd2F5cy1PbiBDbG9jayBhbmQgUmVzZXQgR2VuZXJhdG9yIj8K
PiAKPiBUbyBtZSwgImFsd2F5cy1vbiIgc291bmRzIGxpa2UgaXQncyBjcml0aWNhbCwgYW5kIHRo
dXMgdGhlIGRyaXZlcgo+IG11c3QgYWx3YXlzIGJlIGJ1aWx0LWluPwoKQU9OIGlzIGEgcGFydCBv
ZiBKSDcxMTAgY2lyY3VpdCB3aGljaCBpcyBhbHdheXMgcG93ZXJlZCBvbiwgYnV0IHRoZQpBT04g
Y2xvY2tzIGNhbiBiZSB0dXJuZWQgb2ZmIGlmIG5vdCB1c2VkLiBUaGUgSkg3MTEwIGNhbiBib290
IHVwCnN1Y2Nlc3NmdWxseSB3aXRob3V0IHRoZSBBT04gY2xvY2sgZHJpdmVyLCBzbyBpdCdzIGZp
bmUgdG8gYnVpbGQgaXQKYXMgYSBtb2R1bGUuIFRoYW5rcy4KCkJlc3QgcmVnYXJkcywKSGFsCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
