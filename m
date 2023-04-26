Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA8BC7618E
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Apr 2023 12:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R52N9ULvrHOjN3ZN+uCpOAZjrU32JwunoPCdpbTkcqM=; b=WZROw1Y4FQlk+O
	TX0+hrQ9YOYlBnj6L9g0uC2w+GX/OngxJdcByAfyG4KJf9qwVgbu6oIFIP4CkoFhtPwBPMW7vadab
	MiwEZKsiNBNGbLtUbzNn6Sc9mMkBmmNrioJJWGA62MCL9Z0JltJPEIN5mXGCSI8v5qbtbj8n6StYL
	RGeLn83Y1Us9sOofciSpnFjcJVKn685r+F4vqoVPxZ3A4Yhw7+i8FS6qx1rFv50wrE/x9Cb0UnqVt
	nTVy2tOMnxEKP3sX/XcoAgzcvSZsrsoIGXG7V2njVipSoY4zx/x3589oWxnm+e4aNgJwffE3rWct/
	+mXG6t1O1Tg3RZKXKBKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1preXJ-003xYV-0T;
	Wed, 26 Apr 2023 12:46:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1preXF-003xX9-1X;
	Wed, 26 Apr 2023 12:46:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id A64BD63650;
	Wed, 26 Apr 2023 12:46:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C02C2C433EF;
	Wed, 26 Apr 2023 12:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1682513172;
	bh=6wRdWp5ZpsEcT/z2Q3IrFU3hpwPCXkjls4+igISayBY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=WR9mzrdB0a2QcQSr2cebEYy0+rSZZIT2UeeZJtYZ2cjuRYbyexcANkIpYHj0Ch7fA
	 n7nsTIEmrWi8JwBlVqWlU/BQI8GFplCoJzV/cwAv6T+sExWOfO8ze9h8//BJ/7nLj1
	 yu3c0qEMOJ+UVVg8pNMZRM4EK9CKTdyUnj2HTk3aQ/YSzh08lwyxNSL3rMgqMQlzbz
	 G+JUuuIngQtA8VGGSM2lFI6BfGa5n7vd6yCjClg/6T8g0SUBUZrMyGKLpKxsPA+bhh
	 HqWFmOqcFHef0hnau22g7/dLnnRSnXY8cK55AXGKS5iiX0avqfTLz4uAamqGO2+nd3
	 rfgHJp4PWdd8w==
Message-ID: <d1051856-1177-b5b8-6761-28da80a3cb7c@kernel.org>
Date: Wed, 26 Apr 2023 15:46:04 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v5 7/7] riscv: dts: starfive: Add USB dts configuration
 for JH7110
Content-Language: en-US
To: Minda Chen <minda.chen@starfivetech.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Conor Dooley <conor@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Pawel Laszczak <pawell@cadence.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Peter Chen <peter.chen@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-usb@vger.kernel.org,
 linux-riscv@lists.infradead.org, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Mason Huo <mason.huo@starfivetech.com>
References: <20230420110052.3182-1-minda.chen@starfivetech.com>
 <20230420110052.3182-8-minda.chen@starfivetech.com>
 <3f2baded-c5d6-7d94-00f3-6d8fb24262c4@kernel.org>
 <4b0220ac-23bf-4206-eba2-2842a216bb24@starfivetech.com>
From: Roger Quadros <rogerq@kernel.org>
In-Reply-To: <4b0220ac-23bf-4206-eba2-2842a216bb24@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230426_054613_588190_EF017121 
X-CRM114-Status: GOOD (  23.50  )
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

SGkgTWluZGEsCgpPbiAyNi8wNC8yMDIzIDE0OjA1LCBNaW5kYSBDaGVuIHdyb3RlOgo+IAo+IAo+
IE9uIDIwMjMvNC8yNCAyMjo1MywgUm9nZXIgUXVhZHJvcyB3cm90ZToKPj4KPj4KPj4gT24gMjAv
MDQvMjAyMyAxNDowMCwgTWluZGEgQ2hlbiB3cm90ZToKPj4+IEFkZCBVU0Igd3JhcHBlciBsYXll
ciBhbmQgQ2FkZW5jZSBVU0IzIGNvbnRyb2xsZXIgZHRzCj4+PiBjb25maWd1cmF0aW9uIGZvciBT
dGFyRml2ZSBKSDcxMTAgU29DIGFuZCBWaXNpb25GaXZlMgo+Pj4gQm9hcmQuCj4+PiBVU0IgY29u
dHJvbGxlciBjb25uZWN0IHRvIFBIWSwgVGhlIFBIWSBkdHMgY29uZmlndXJhdGlvbgo+Pj4gYXJl
IGFsc28gYWRkZWQuCj4+Pgo+Pj4gU2lnbmVkLW9mZi1ieTogTWluZGEgQ2hlbiA8bWluZGEuY2hl
bkBzdGFyZml2ZXRlY2guY29tPgo+Pj4gLS0tCj4+PiAgLi4uL2poNzExMC1zdGFyZml2ZS12aXNp
b25maXZlLTIuZHRzaSAgICAgICAgIHwgIDcgKysrCj4+PiAgYXJjaC9yaXNjdi9ib290L2R0cy9z
dGFyZml2ZS9qaDcxMTAuZHRzaSAgICAgIHwgNDQgKysrKysrKysrKysrKysrKysrKwo+Pj4gIDIg
ZmlsZXMgY2hhbmdlZCwgNTEgaW5zZXJ0aW9ucygrKQo+Pj4KPj4+IGRpZmYgLS1naXQgYS9hcmNo
L3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRz
aSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZp
dmUtMi5kdHNpCj4+PiBpbmRleCAxMTU1Yjk3YjU5M2QuLmZhOTdlYmZkOTNhZCAxMDA2NDQKPj4+
IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lv
bmZpdmUtMi5kdHNpCj4+PiArKysgYi9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzEx
MC1zdGFyZml2ZS12aXNpb25maXZlLTIuZHRzaQo+Pj4gQEAgLTIyMSwzICsyMjEsMTAgQEAKPj4+
ICAJcGluY3RybC0wID0gPCZ1YXJ0MF9waW5zPjsKPj4+ICAJc3RhdHVzID0gIm9rYXkiOwo+Pj4g
IH07Cj4+PiArCj4+PiArJnVzYjAgewo+Pj4gKwlwaHlzID0gPCZ1c2JwaHkwPjsKPj4+ICsJcGh5
LW5hbWVzID0gInVzYjIiOwo+Pj4gKwlkcl9tb2RlID0gInBlcmlwaGVyYWwiOwo+Pj4gKwlzdGF0
dXMgPSAib2theSI7Cj4+PiArfTsKPj4+IGRpZmYgLS1naXQgYS9hcmNoL3Jpc2N2L2Jvb3QvZHRz
L3N0YXJmaXZlL2poNzExMC5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9qaDcx
MTAuZHRzaQo+Pj4gaW5kZXggMjljZDc5OGI2NzMyLi5lZWUzOTVlMTljZGIgMTAwNjQ0Cj4+PiAt
LS0gYS9hcmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpCj4+PiArKysgYi9h
cmNoL3Jpc2N2L2Jvb3QvZHRzL3N0YXJmaXZlL2poNzExMC5kdHNpCj4+PiBAQCAtMzY2LDYgKzM2
Niw1MCBAQAo+Pj4gIAkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+PiAgCQl9Owo+Pj4gIAo+Pj4g
KwkJdXNiMDogdXNiQDEwMTAwMDAwIHsKPj4+ICsJCQljb21wYXRpYmxlID0gInN0YXJmaXZlLGpo
NzExMC11c2IiOwo+Pj4gKwkJCXJlZyA9IDwweDAgMHgxMDEwMDAwMCAweDAgMHgxMDAwMD4sCj4+
PiArCQkJICAgICAgPDB4MCAweDEwMTEwMDAwIDB4MCAweDEwMDAwPiwKPj4+ICsJCQkgICAgICA8
MHgwIDB4MTAxMjAwMDAgMHgwIDB4MTAwMDA+Owo+Pj4gKwkJCXJlZy1uYW1lcyA9ICJvdGciLCAi
eGhjaSIsICJkZXYiOwo+Pj4gKwkJCWludGVycnVwdHMgPSA8MTAwPiwgPDEwOD4sIDwxMTA+Owo+
Pj4gKwkJCWludGVycnVwdC1uYW1lcyA9ICJob3N0IiwgInBlcmlwaGVyYWwiLCAib3RnIjsKPj4+
ICsJCQljbG9ja3MgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfTFBNPiwKPj4+ICsJCQkJ
IDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9TVEI+LAo+Pj4gKwkJCQkgPCZzdGdjcmcgSkg3
MTEwX1NUR0NMS19VU0IwX0FQQj4sCj4+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VT
QjBfQVhJPiwKPj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9VVE1JX0FQQj47
Cj4+PiArCQkJY2xvY2stbmFtZXMgPSAibHBtIiwgInN0YiIsICJhcGIiLCAiYXhpIiwgInV0bWlf
YXBiIjsKPj4+ICsJCQlyZXNldHMgPSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfUFdSVVA+
LAo+Pj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR1JTVF9VU0IwX0FQQj4sCj4+PiArCQkJCSA8
JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfQVhJPiwKPj4+ICsJCQkJIDwmc3RnY3JnIEpINzEx
MF9TVEdSU1RfVVNCMF9VVE1JX0FQQj47Cj4+PiArCQkJcmVzZXQtbmFtZXMgPSAicHdydXAiLCAi
YXBiIiwgImF4aSIsICJ1dG1pX2FwYiI7Cj4+Cj4+IEFsbCB0aGlzIGNhbiByZWFsbHkgYmUgImNk
bnMsdXNiMyIgbm9kZS4gVGhlIGNkbnMsdXNiMyBkcml2ZXIgc2hvdWxkCj4+IGRvIHJlc2V0IGFu
ZCBjbG9ja3MgaW5pdCBhcyBpdCBpcyBnZW5lcmljLgo+Pgo+IEJ1dCBJIGNhbid0IGZpbmQgY2xv
Y2sgYW5kIHJlc2V0IGluaXQgaW4gQ2FkZW5jZSBjb2RlcyB3aGlsZSBkd2MgdXNiMyBjYW4gZmlu
ZC4gCj4gSXQgbG9va3Mgb25seSBpZiBjbG9ja3MgYW5kIHJlc2V0IGdlbmVyaWMgaW5pdCBjb2Rl
cyByZXF1aXJlZCB0byBiZSBhZGRlZCBpbiAgQ2FkZW5jZSBjb2RlcyB0byBzdXBwb3J0IGdlbmVy
aWMgY2xvY2sgYW5kIHJlc2V0IGluaXQuCj4+PiArCQkJc3RhcmZpdmUsc3RnLXN5c2NvbiA9IDwm
c3RnX3N5c2NvbiAweDQ+Owo+Pj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+Cj4+IE9ubHkg
dGhlIHN5c2NvbiBoYW5kbGluZyBsb29rcyBzdGFyZml2ZSBzcGVjaWZpYyBzbyBvbmx5IHRoYXQg
aGFuZGxpbmcKPj4gc2hvdWxkIGJlIGRvbmUgaW4gc3RhcmZpdmUgVVNCIGRyaXZlci4KPj4KPj4g
VGhpcyBub2RlIHNob3VsZCBsb29rIGxpa2UgdGhpcwo+Pgo+PiAgCj4+IAlzdGFyZml2ZS11c2JA
NCB7Cj4+IAkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtdXNiIjsKPj4gCQlzdGFyZml2
ZSxzdGctc3lzY29uID0gPCZzdGdfc3lzY29uIDB4ND47Cj4+Cj4+IAkJdXNiMDogdXNiQDEwMTAw
MDAwIHsKPj4gCQkJY29tcGF0aWJsZSA9ICJjZG5zLHVzYjMiOwo+PiAJCQlyZWcgPSA8MHgwIDB4
MTAxMDAwMDAgMHgwIDB4MTAwMDA+LAo+PiAJCQkgICAgICA8MHgwIDB4MTAxMTAwMDAgMHgwIDB4
MTAwMDA+LAo+PiAJCQkgICAgICA8MHgwIDB4MTAxMjAwMDAgMHgwIDB4MTAwMDA+Owo+PiAJCQly
ZWctbmFtZXMgPSAib3RnIiwgInhoY2kiLCAiZGV2IjsKPj4gCQkJaW50ZXJydXB0cyA9IDwxMDA+
LCA8MTA4PiwgPDExMD47Cj4+IAkJCWludGVycnVwdC1uYW1lcyA9ICJob3N0IiwgInBlcmlwaGVy
YWwiLCAib3RnIjsKPj4gCQkJY2xvY2tzID0gPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX0xQ
TT4sCj4+IAkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX1NUQj4sCj4+IAkJCQkgPCZz
dGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX0FQQj4sCj4+IAkJCQkgPCZzdGdjcmcgSkg3MTEwX1NU
R0NMS19VU0IwX0FYST4sCj4+IAkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR0NMS19VU0IwX1VUTUlf
QVBCPjsKPj4gCQkJY2xvY2stbmFtZXMgPSAibHBtIiwgInN0YiIsICJhcGIiLCAiYXhpIiwgInV0
bWlfYXBiIjsKPj4gCQkJcmVzZXRzID0gPCZzdGdjcmcgSkg3MTEwX1NUR1JTVF9VU0IwX1BXUlVQ
PiwKPj4gCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfQVBCPiwKPj4gCQkJCSA8JnN0
Z2NyZyBKSDcxMTBfU1RHUlNUX1VTQjBfQVhJPiwKPj4gCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RH
UlNUX1VTQjBfVVRNSV9BUEI+Owo+PiAJCQlyZXNldC1uYW1lcyA9ICJwd3J1cCIsICJhcGIiLCAi
YXhpIiwgInV0bWlfYXBiIjsKPj4gCQkJc3RhcmZpdmUsc3RnLXN5c2NvbiA9IDwmc3RnX3N5c2Nv
biAweDQ+Owo+PiAJCQlzdGF0dXMgPSAiZGlzYWJsZWQiOwo+PiAJCX07Cj4+IAl9Cj4+PiBJbiBz
dGFyZmlmZS11c2IgZHJpdmVyIHlvdSBjYW4gdXNlIG9mX3BsYXRmb3JtX2RlZmF1bHRfcG9wdWxh
dGUoKQo+PiB0byBjcmVhdGUgdGhlIGNkbnMsdXNiMyBjaGlsZCBmb3IgeW91Lgo+Pgo+IEJ1dCBh
Y3R1YWxseSB0aGUgdGhlIHN5c2NvbiBpcyBub3QgYmVsb25nIHRvIFVTQi4gQmVsb3cgaXMgUm9i
J3MgcHJldmlvdXMgY29tbWVudHMuIEkgYW0gZm9sbG93IFJvYidzIGNvbW1lbnRzIHRvIGNoYW5n
ZSB0aGlzLgoKTWFuYWdpbmcgdGhlc2Ugc3lzY29uIHJlZ2lzdGVycyBjYW5ub3QgYmUgZG9uZSBp
biBjZG5zLHVzYjMgZHJpdmVyLgpTbyB5b3UgZGVmaW5pdGVseSBuZWVkIGEgd3JhcHBlciBkcml2
ZXIgZm9yIHRoYXQuCgo+ICAKPiAgIFRoaXMgcGF0dGVybiBvZiBVU0Igd3JhcHBlciBhbmQgdGhl
biBhICJnZW5lcmljIiBJUCBub2RlIGlzIGRpc2NvdXJhZ2VkIGlmIGl0IGlzIGp1c3QgY2xvY2tz
LCByZXNldHMsIHBvd2VyLWRvbWFpbnMsIGV0Yy4gSU9XLCB1bmxlc3MgdGhlcmUncyBhbiBhY3R1
YWwgd3JhcHBlciBoL3cgYmxvY2sgd2l0aCBpdHMgb3duIHJlZ2lzdGVycywgdGhlbiBkb24ndCBk
byB0aGlzIHNwbGl0LiAKPiAgIE1lcmdlIGl0IGFsbCBpbnRvIGEgc2luZ2xlIG5vZGUuCj4gCj4g
Um9iIGFuZCBSb2dlcnMKPiAgIENvdWxkIHlvdSBkZXNpZ24gd2hldGhlciBtZXJnZSB0aGUgdXNi
IG5vZGVz77yfIAo+IGR0LWJpbmRpbmfvvIxVU0IgY29kZXMgYXJlIGRpZmZlcmVudCBpbiB0d28g
Y2FzZS4KPiAgCgpUaGVyZSBzaG91bGQgaWRlYWxseSBiZSBvbmx5IG9uZSBVU0Igbm9kZSBhbmQg
dGhhdCBzaG91bGQgdXNlICJjZG5zLHVzYjMiIGNvbXBhdGlibGUuCkNsb2NrcywgcmVzZXRzIGFu
ZCBwb3dlci1kb21haW4gaGFuZGxpbmcgc2hvdWxkIGJlIGRvbmUgaW4gY2Rucyx1c2IzIGRyaXZl
ci4KCkJ1dCBzaW5jZSB5b3UgYWxzbyBuZWVkIHRvIG1hbmFnZSBzb21lIHN5c2NvbiByZWdpc3Rl
cnMgImNkc24sdXNiMyIgZHJpdmVyIGlzIG5vdApzdWZmaWNpZW50IGZvciB5b3UuCgpJIHdpbGwg
bGVhdmUgdGhlIERULWJpbmRpbmcgcXVlc3Rpb24gZm9yIHRoaXMgY2FzZSB0byBSb2IuCgpjaGVl
cnMsCi1yb2dlcgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5v
cmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNj
dgo=
