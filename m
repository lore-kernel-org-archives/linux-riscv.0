Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44173C77B60
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 11:06:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1jRwRwpEl7WcfurtoMrNpFtoGDlqgURJEhzqnI4MRkM=; b=HmAaDWbmBOpjOu
	7nglQTogVAUXwvdltng8apC9XxdkpLcpoSIOnbqMLhcRo/gCgRSV5zZcvx/3kE5rNV634u5Z7FYQf
	AnDW6u0ip/SjJaDSqPCuROCxQJowVpwi7RAJOhmDeRl/ZAeoAvtWwQsJznn6dLJrerzxdu1LM1oQx
	c1aoe3dtgtdS6paS+xZ6CPZGTrMofKUbI8WeJuRLYUfkcTb2dpfUuAqIYFfTHQoaBYMjKp/IBHKSe
	Eg70aLvUahte6bap0kmP8vjkyKAcc7id/ac0fsqB9aUqye5L2RQL3wIZ7kNmgl2kNYp6esZ69ZIAR
	ksn6CNGVtySjhPROHA7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcyI-003iTd-2L;
	Wed, 26 Apr 2023 11:06:02 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1prcyE-003iLU-1R;
	Wed, 26 Apr 2023 11:06:01 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4A83424E1D2;
	Wed, 26 Apr 2023 19:05:09 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Apr
 2023 19:05:09 +0800
Received: from [192.168.125.108] (113.72.145.137) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 26 Apr
 2023 19:05:08 +0800
Message-ID: <4b0220ac-23bf-4206-eba2-2842a216bb24@starfivetech.com>
Date: Wed, 26 Apr 2023 19:05:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 7/7] riscv: dts: starfive: Add USB dts configuration
 for JH7110
Content-Language: en-US
To: Roger Quadros <rogerq@kernel.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Conor Dooley <conor@kernel.org>, "Vinod
 Koul" <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Chen
	<peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	"Mason Huo" <mason.huo@starfivetech.com>
References: <20230420110052.3182-1-minda.chen@starfivetech.com>
 <20230420110052.3182-8-minda.chen@starfivetech.com>
 <3f2baded-c5d6-7d94-00f3-6d8fb24262c4@kernel.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <3f2baded-c5d6-7d94-00f3-6d8fb24262c4@kernel.org>
X-Originating-IP: [113.72.145.137]
X-ClientProxiedBy: EXCAS065.cuchost.com (172.16.6.25) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_040558_817410_171024DB 
X-CRM114-Status: GOOD (  16.25  )
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

CgpPbiAyMDIzLzQvMjQgMjI6NTMsIFJvZ2VyIFF1YWRyb3Mgd3JvdGU6Cj4gCj4gCj4gT24gMjAv
MDQvMjAyMyAxNDowMCwgTWluZGEgQ2hlbiB3cm90ZToKPj4gQWRkIFVTQiB3cmFwcGVyIGxheWVy
IGFuZCBDYWRlbmNlIFVTQjMgY29udHJvbGxlciBkdHMKPj4gY29uZmlndXJhdGlvbiBmb3IgU3Rh
ckZpdmUgSkg3MTEwIFNvQyBhbmQgVmlzaW9uRml2ZTIKPj4gQm9hcmQuCj4+IFVTQiBjb250cm9s
bGVyIGNvbm5lY3QgdG8gUEhZLCBUaGUgUEhZIGR0cyBjb25maWd1cmF0aW9uCj4+IGFyZSBhbHNv
IGFkZGVkLgo+PiAKPj4gU2lnbmVkLW9mZi1ieTogTWluZGEgQ2hlbiA8bWluZGEuY2hlbkBzdGFy
Zml2ZXRlY2guY29tPgo+PiAtLS0KPj4gIC4uLi9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0y
LmR0c2kgICAgICAgICB8ICA3ICsrKwo+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAuZHRzaSAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKwo+PiAgMiBmaWxlcyBjaGFu
Z2VkLCA1MSBpbnNlcnRpb25zKCspCj4+IAo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290
L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kgYi9hcmNoL3Jp
c2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+
PiBpbmRleCAxMTU1Yjk3YjU5M2QuLmZhOTdlYmZkOTNhZCAxMDA2NDQKPj4gLS0tIGEvYXJjaC9y
aXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kK
Pj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAtc3RhcmZpdmUtdmlz
aW9uZml2ZS0yLmR0c2kKPj4gQEAgLTIyMSwzICsyMjEsMTAgQEAKPj4gIAlwaW5jdHJsLTAgPSA8
JnVhcnQwX3BpbnM+Owo+PiAgCXN0YXR1cyA9ICJva2F5IjsKPj4gIH07Cj4+ICsKPj4gKyZ1c2Iw
IHsKPj4gKwlwaHlzID0gPCZ1c2JwaHkwPjsKPj4gKwlwaHktbmFtZXMgPSAidXNiMiI7Cj4+ICsJ
ZHJfbW9kZSA9ICJwZXJpcGhlcmFsIjsKPj4gKwlzdGF0dXMgPSAib2theSI7Cj4+ICt9Owo+PiBk
aWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaSBiL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kKPj4gaW5kZXggMjljZDc5OGI2
NzMyLi5lZWUzOTVlMTljZGIgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTEwLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAuZHRzaQo+PiBAQCAtMzY2LDYgKzM2Niw1MCBAQAo+PiAgCQkJc3RhdHVzID0gImRpc2Fi
bGVkIjsKPj4gIAkJfTsKPj4gIAo+PiArCQl1c2IwOiB1c2JAMTAxMDAwMDAgewo+PiArCQkJY29t
cGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtdXNiIjsKPj4gKwkJCXJlZyA9IDwweDAgMHgxMDEw
MDAwMCAweDAgMHgxMDAwMD4sCj4+ICsJCQkgICAgICA8MHgwIDB4MTAxMTAwMDAgMHgwIDB4MTAw
MDA+LAo+PiArCQkJICAgICAgPDB4MCAweDEwMTIwMDAwIDB4MCAweDEwMDAwPjsKPj4gKwkJCXJl
Zy1uYW1lcyA9ICJvdGciLCAieGhjaSIsICJkZXYiOwo+PiArCQkJaW50ZXJydXB0cyA9IDwxMDA+
LCA8MTA4PiwgPDExMD47Cj4+ICsJCQlpbnRlcnJ1cHQtbmFtZXMgPSAiaG9zdCIsICJwZXJpcGhl
cmFsIiwgIm90ZyI7Cj4+ICsJCQljbG9ja3MgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBf
TFBNPiwKPj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX1NUQj4sCj4+ICsJCQkJ
IDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9BUEI+LAo+PiArCQkJCSA8JnN0Z2NyZyBKSDcx
MTBfU1RHQ0xLX1VTQjBfQVhJPiwKPj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0Iw
X1VUTUlfQVBCPjsKPj4gKwkJCWNsb2NrLW5hbWVzID0gImxwbSIsICJzdGIiLCAiYXBiIiwgImF4
aSIsICJ1dG1pX2FwYiI7Cj4+ICsJCQlyZXNldHMgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VT
QjBfUFdSVVA+LAo+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfQVBCPiwKPj4g
KwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR1JTVF9VU0IwX0FYST4sCj4+ICsJCQkJIDwmc3RnY3Jn
IEpINzExMF9TVEdSU1RfVVNCMF9VVE1JX0FQQj47Cj4+ICsJCQlyZXNldC1uYW1lcyA9ICJwd3J1
cCIsICJhcGIiLCAiYXhpIiwgInV0bWlfYXBiIjsKPiAKPiBBbGwgdGhpcyBjYW4gcmVhbGx5IGJl
ICJjZG5zLHVzYjMiIG5vZGUuIFRoZSBjZG5zLHVzYjMgZHJpdmVyIHNob3VsZAo+IGRvIHJlc2V0
IGFuZCBjbG9ja3MgaW5pdCBhcyBpdCBpcyBnZW5lcmljLgo+IApCdXQgSSBjYW4ndCBmaW5kIGNs
b2NrIGFuZCByZXNldCBpbml0IGluIENhZGVuY2UgY29kZXMgd2hpbGUgZHdjIHVzYjMgY2FuIGZp
bmQuIApJdCBsb29rcyBvbmx5IGlmIGNsb2NrcyBhbmQgcmVzZXQgZ2VuZXJpYyBpbml0IGNvZGVz
IHJlcXVpcmVkIHRvIGJlIGFkZGVkIGluICBDYWRlbmNlIGNvZGVzIHRvIHN1cHBvcnQgZ2VuZXJp
YyBjbG9jayBhbmQgcmVzZXQgaW5pdC4KPj4gKwkJCXN0YXJmaXZlLHN0Zy1zeXNjb24gPSA8JnN0
Z19zeXNjb24gMHg0PjsKPj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gCj4gT25seSB0aGUg
c3lzY29uIGhhbmRsaW5nIGxvb2tzIHN0YXJmaXZlIHNwZWNpZmljIHNvIG9ubHkgdGhhdCBoYW5k
bGluZwo+IHNob3VsZCBiZSBkb25lIGluIHN0YXJmaXZlIFVTQiBkcml2ZXIuCj4gCj4gVGhpcyBu
b2RlIHNob3VsZCBsb29rIGxpa2UgdGhpcwo+IAo+ICAKPiAJc3RhcmZpdmUtdXNiQDQgewo+IAkJ
Y29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtdXNiIjsKPiAJCXN0YXJmaXZlLHN0Zy1zeXNj
b24gPSA8JnN0Z19zeXNjb24gMHg0PjsKPiAKPiAJCXVzYjA6IHVzYkAxMDEwMDAwMCB7Cj4gCQkJ
Y29tcGF0aWJsZSA9ICJjZG5zLHVzYjMiOwo+IAkJCXJlZyA9IDwweDAgMHgxMDEwMDAwMCAweDAg
MHgxMDAwMD4sCj4gCQkJICAgICAgPDB4MCAweDEwMTEwMDAwIDB4MCAweDEwMDAwPiwKPiAJCQkg
ICAgICA8MHgwIDB4MTAxMjAwMDAgMHgwIDB4MTAwMDA+Owo+IAkJCXJlZy1uYW1lcyA9ICJvdGci
LCAieGhjaSIsICJkZXYiOwo+IAkJCWludGVycnVwdHMgPSA8MTAwPiwgPDEwOD4sIDwxMTA+Owo+
IAkJCWludGVycnVwdC1uYW1lcyA9ICJob3N0IiwgInBlcmlwaGVyYWwiLCAib3RnIjsKPiAJCQlj
bG9ja3MgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfTFBNPiwKPiAJCQkJIDwmc3RnY3Jn
IEpINzExMF9TVEdDTEtfVVNCMF9TVEI+LAo+IAkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19V
U0IwX0FQQj4sCj4gCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfQVhJPiwKPiAJCQkJ
IDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9VVE1JX0FQQj47Cj4gCQkJY2xvY2stbmFtZXMg
PSAibHBtIiwgInN0YiIsICJhcGIiLCAiYXhpIiwgInV0bWlfYXBiIjsKPiAJCQlyZXNldHMgPSA8
JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfUFdSVVA+LAo+IAkJCQkgPCZzdGdjcmcgSkg3MTEw
X1NUR1JTVF9VU0IwX0FQQj4sCj4gCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfQVhJ
PiwKPiAJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9VVE1JX0FQQj47Cj4gCQkJcmVz
ZXQtbmFtZXMgPSAicHdydXAiLCAiYXBiIiwgImF4aSIsICJ1dG1pX2FwYiI7Cj4gCQkJc3RhcmZp
dmUsc3RnLXN5c2NvbiA9IDwmc3RnX3N5c2NvbiAweDQ+Owo+IAkJCXN0YXR1cyA9ICJkaXNhYmxl
ZCI7Cj4gCQl9Owo+IAl9Cj4+IEluIHN0YXJmaWZlLXVzYiBkcml2ZXIgeW91IGNhbiB1c2Ugb2Zf
cGxhdGZvcm1fZGVmYXVsdF9wb3B1bGF0ZSgpCj4gdG8gY3JlYXRlIHRoZSBjZG5zLHVzYjMgY2hp
bGQgZm9yIHlvdS4KPiAKQnV0IGFjdHVhbGx5IHRoZSB0aGUgc3lzY29uIGlzIG5vdCBiZWxvbmcg
dG8gVVNCLiBCZWxvdyBpcyBSb2IncyBwcmV2aW91cyBjb21tZW50cy4gSSBhbSBmb2xsb3cgUm9i
J3MgY29tbWVudHMgdG8gY2hhbmdlIHRoaXMuCiAKICBUaGlzIHBhdHRlcm4gb2YgVVNCIHdyYXBw
ZXIgYW5kIHRoZW4gYSAiZ2VuZXJpYyIgSVAgbm9kZSBpcyBkaXNjb3VyYWdlZCBpZiBpdCBpcyBq
dXN0IGNsb2NrcywgcmVzZXRzLCBwb3dlci1kb21haW5zLCBldGMuIElPVywgdW5sZXNzIHRoZXJl
J3MgYW4gYWN0dWFsIHdyYXBwZXIgaC93IGJsb2NrIHdpdGggaXRzIG93biByZWdpc3RlcnMsIHRo
ZW4gZG9uJ3QgZG8gdGhpcyBzcGxpdC4gCiAgTWVyZ2UgaXQgYWxsIGludG8gYSBzaW5nbGUgbm9k
ZS4KClJvYiBhbmQgUm9nZXJzCiAgQ291bGQgeW91IGRlc2lnbiB3aGV0aGVyIG1lcmdlIHRoZSB1
c2Igbm9kZXPvvJ8gCmR0LWJpbmRpbmfvvIxVU0IgY29kZXMgYXJlIGRpZmZlcmVudCBpbiB0d28g
Y2FzZS4KIAo+PiArCQl9Owo+PiArCj4+ICsJCXVzYnBoeTA6IHBoeUAxMDIwMDAwMCB7Cj4+ICsJ
CQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC11c2ItcGh5IjsKPj4gKwkJCXJlZyA9IDww
eDAgMHgxMDIwMDAwMCAweDAgMHgxMDAwMD47Cj4+ICsJCQljbG9ja3MgPSA8JnN5c2NyZyBKSDcx
MTBfU1lTQ0xLX1VTQl8xMjVNPiwKPj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0Iw
X0FQUF8xMjU+Owo+PiArCQkJY2xvY2stbmFtZXMgPSAiMTI1bSIsICJhcHBfMTI1bSI7Cj4+ICsJ
CQkjcGh5LWNlbGxzID0gPDA+Owo+PiArCQl9Owo+PiArCj4+ICsJCXBjaWVwaHkwOiBwaHlAMTAy
MTAwMDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtcGNpZS1waHkiOwo+
PiArCQkJcmVnID0gPDB4MCAweDEwMjEwMDAwIDB4MCAweDEwMDAwPjsKPj4gKwkJCSNwaHktY2Vs
bHMgPSA8MD47Cj4+ICsJCX07Cj4+ICsKPj4gKwkJcGNpZXBoeTE6IHBoeUAxMDIyMDAwMCB7Cj4+
ICsJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpoNzExMC1wY2llLXBoeSI7Cj4+ICsJCQlyZWcg
PSA8MHgwIDB4MTAyMjAwMDAgMHgwIDB4MTAwMDA+Owo+PiArCQkJI3BoeS1jZWxscyA9IDwwPjsK
Pj4gKwkJfTsKPj4gKwo+PiAgCQlzdGdjcmc6IGNsb2NrLWNvbnRyb2xsZXJAMTAyMzAwMDAgewo+
PiAgCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtc3RnY3JnIjsKPj4gIAkJCXJlZyA9
IDwweDAgMHgxMDIzMDAwMCAweDAgMHgxMDAwMD47Cj4gCj4gY2hlZXJzLAo+IC1yb2dlcgoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
