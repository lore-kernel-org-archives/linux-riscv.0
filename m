Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7D9C6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 12:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6EMqV1mTjE4JlJheNIejtCD+IaO1rKqmSCc/Q1jEv0=; b=fMT5XmEizVIMZz
	oVVUX8Rz+G4qn3yULpvZCZcjCTArnscytcExB9Z0DaBoM6jABxMrIsWfBVA6ZSYGQUrf4LCYvJDvU
	C07BYh8sFRAFZXmD1MlByTKHTQxhJfRBmbG5KDA4r9YRwsWgZZZGoA6yJ4YyO7e2kioTLHB3EdBQU
	RQZd/kHV8Goz5QdZiD5JPk1Pi8EKxf51cUTps/BIJv2p2FudtfVXe2LoAbrj6avfa46KGz25gZOoU
	sjS0H62EAafg7g/HfxM48t+By7O9G1CYg/p1PcYSAdb6WjSs4GFgGDpA793gy4sNdtSGVRQRf5cuz
	53mgyyz38jMJ/Y/5Cj/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebE5-00CLiC-2P;
	Tue, 21 Mar 2023 12:36:29 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pebDz-00CLfH-2n;
	Tue, 21 Mar 2023 12:36:27 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id E093424E30A;
	Tue, 21 Mar 2023 20:36:00 +0800 (CST)
Received: from EXMBX171.cuchost.com (172.16.6.91) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 20:36:00 +0800
Received: from [192.168.125.108] (183.27.97.64) by EXMBX171.cuchost.com
 (172.16.6.91) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 21 Mar
 2023 20:35:59 +0800
Message-ID: <2311a888-8861-ade6-d46f-caff4fc3ec73@starfivetech.com>
Date: Tue, 21 Mar 2023 20:35:59 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v3 5/5] dts: usb: add StarFive JH7110 USB dts
 configuration.
Content-Language: en-US
To: Rob Herring <robh@kernel.org>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>, Conor Dooley
	<conor@kernel.org>, Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
	<kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Pawel Laszczak <pawell@cadence.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Peter Chen <peter.chen@kernel.org>, "Roger
 Quadros" <rogerq@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-phy@lists.infradead.org>, <linux-usb@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
References: <20230315104411.73614-1-minda.chen@starfivetech.com>
 <20230315104411.73614-6-minda.chen@starfivetech.com>
 <20230320153419.GB1713196-robh@kernel.org>
From: Minda Chen <minda.chen@starfivetech.com>
In-Reply-To: <20230320153419.GB1713196-robh@kernel.org>
X-Originating-IP: [183.27.97.64]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX171.cuchost.com
 (172.16.6.91)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_053624_343593_D9224846 
X-CRM114-Status: GOOD (  16.95  )
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

CgpPbiAyMDIzLzMvMjAgMjM6MzQsIFJvYiBIZXJyaW5nIHdyb3RlOgo+IE9uIFdlZCwgTWFyIDE1
LCAyMDIzIGF0IDA2OjQ0OjExUE0gKzA4MDAsIE1pbmRhIENoZW4gd3JvdGU6Cj4+IFVTQiBHbHVl
IGxheWVyIGFuZCBDYWRlbmNlIFVTQiBzdWJub2RlIGNvbmZpZ3VyYXRpb24sCj4+IGFsc28gaW5j
bHVkZXMgVVNCIGFuZCBQQ0llIHBoeSBkdHMgY29uZmlndXJhdGlvbi4KPj4gCj4+IFNpZ25lZC1v
ZmYtYnk6IE1pbmRhIENoZW4gPG1pbmRhLmNoZW5Ac3RhcmZpdmV0ZWNoLmNvbT4KPj4gLS0tCj4+
ICAuLi4vamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpICAgICAgICAgfCAgNyArKysK
Pj4gIGFyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kgICAgICB8IDU0ICsr
KysrKysrKysrKysrKysrKysKPj4gIDIgZmlsZXMgY2hhbmdlZCwgNjEgaW5zZXJ0aW9ucygrKQo+
PiAKPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0
YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFyZml2ZS9q
aDcxMTAtc3RhcmZpdmUtdmlzaW9uZml2ZS0yLmR0c2kKPj4gaW5kZXggYTEzMmRlYmI5YjUzLi5j
NjQ0NzZhZWJjMWEgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUv
amg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpCj4+IEBAIC0y
MzYsMyArMjM2LDEwIEBACj4+ICAJcGluY3RybC0wID0gPCZ1YXJ0MF9waW5zPjsKPj4gIAlzdGF0
dXMgPSAib2theSI7Cj4+ICB9Owo+PiArCj4+ICsmdXNiMCB7Cj4+ICsJc3RhdHVzID0gIm9rYXki
Owo+PiArCXVzYmRyZF9jZG5zMzogdXNiQDAgewo+PiArCQlkcl9tb2RlID0gInBlcmlwaGVyYWwi
Owo+PiArCX07Cj4+ICt9Owo+PiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAuZHRzaSBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0
c2kKPj4gaW5kZXggZjcwYTRlZDQ3ZWI0Li4xNzcyMmZkMWJlNjIgMTAwNjQ0Cj4+IC0tLSBhL2Fy
Y2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLmR0c2kKPj4gKysrIGIvYXJjaC9yaXNj
di9ib290L2R0cy9zdGFyZml2ZS9qaDcxMTAuZHRzaQo+PiBAQCAtMzYyLDYgKzM2Miw2MCBAQAo+
PiAgCQkJc3RhdHVzID0gImRpc2FibGVkIjsKPj4gIAkJfTsKPj4gIAo+PiArCQl1c2IwOiB1c2JA
MTAxMDAwMDAgewo+PiArCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtdXNiIjsKPj4g
KwkJCWNsb2NrcyA9IDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9MUE0+LAo+PiArCQkJCSA8
JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfU1RCPiwKPj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEw
X1NUR0NMS19VU0IwX0FQQj4sCj4+ICsJCQkJIDwmc3RnY3JnIEpINzExMF9TVEdDTEtfVVNCMF9B
WEk+LAo+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VTQjBfVVRNSV9BUEI+Owo+PiAr
CQkJY2xvY2stbmFtZXMgPSAibHBtIiwgInN0YiIsICJhcGIiLCAiYXhpIiwgInV0bWlfYXBiIjsK
Pj4gKwkJCXJlc2V0cyA9IDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9QV1JVUD4sCj4+ICsJ
CQkJIDwmc3RnY3JnIEpINzExMF9TVEdSU1RfVVNCMF9BUEI+LAo+PiArCQkJCSA8JnN0Z2NyZyBK
SDcxMTBfU1RHUlNUX1VTQjBfQVhJPiwKPj4gKwkJCQkgPCZzdGdjcmcgSkg3MTEwX1NUR1JTVF9V
U0IwX1VUTUlfQVBCPjsKPj4gKwkJCXN0YXJmaXZlLHN0Zy1zeXNjb24gPSA8JnN0Z19zeXNjb24g
MHg0IDB4YzQgMHgxNDggMHgxZjQ+Owo+PiArCQkJc3RhcmZpdmUsc3lzLXN5c2NvbiA9IDwmc3lz
X3N5c2NvbiAweDE4PjsKPj4gKwkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4+ICsJCQkjYWRkcmVz
cy1jZWxscyA9IDwxPjsKPj4gKwkJCSNzaXplLWNlbGxzID0gPDE+Owo+PiArCQkJcmFuZ2VzID0g
PDB4MCAweDAgMHgxMDEwMDAwMCAweDEwMDAwMD47Cj4+ICsKPj4gKwkJCXVzYmRyZF9jZG5zMzog
dXNiQDAgewo+PiArCQkJCWNvbXBhdGlibGUgPSAiY2Rucyx1c2IzIjsKPiAKPiBUaGlzIHBhdHRl
cm4gb2YgVVNCIHdyYXBwZXIgYW5kIHRoZW4gYSAiZ2VuZXJpYyIgSVAgbm9kZSBpcyBkaXNjb3Vy
YWdlZCAKPiBpZiBpdCBpcyBqdXN0IGNsb2NrcywgcmVzZXRzLCBwb3dlci1kb21haW5zLCBldGMu
IElPVywgdW5sZXNzIHRoZXJlJ3MgYW4gCj4gYWN0dWFsIHdyYXBwZXIgaC93IGJsb2NrIHdpdGgg
aXRzIG93biByZWdpc3RlcnMsIHRoZW4gZG9uJ3QgZG8gdGhpcyAKPiBzcGxpdC4gTWVyZ2UgaXQg
YWxsIGludG8gYSBzaW5nbGUgbm9kZS4KPiAKSSBhbSBhZnJhaWQgaXQgaXMgZGlmZmljdWx0IHRv
IG1lcmdlIGluIG9uZSBzaW5nbGUgbm9kZS4gCgoxLklmIGNhZGVuY2UzIHVzYiBkZXZpY2UgaXMg
c3RpbGwgdGhlIHN1YiBkZXZpY2UuIEFsbCB0aGUgZHRzIHNldHRpbmcgYXJlIGluClN0YXJGaXZl
IG5vZGUuIFRoaXMgY2FuIG5vdCB3b3JrLgpTdGFyRml2ZSBkcml2ZXIgY29kZSBVc2luZyBwbGF0
Zm9ybV9kZXZpY2VfYWRkIGdlbmVyYXRlIGNhZGVuYzMgdXNiIHBsYXRmb3JtIGRldmljZS4gCkV2
ZW4gSU8gbWVtb3J5IHNwYWNlIHNldHRpbmcgY2FuIGJlIHBhc3NlZCB0byBjYWRlbmNlMyBVU0Is
IFBIWSBzZXR0aW5nIGNhbiBub3QgYmUgcGFzc2VkLgpGb3IgdGhlIFBIWSBkcml2ZXIgdXNpbmcg
ZHRzIG5vdy4gQnV0IGluIHRoaXMgY2FzZSwgQ2FkZW5jZTMgVVNCIG5vIGR0cyBjb25maWd1cmUu
CgoyLiBKdXN0IG9uZSBVU0IgQ2FkZW5jZSBwbGF0Zm9ybSBkZXZpY2UuCk1heWJlIHRoaXMgY2Fu
IHdvcmsuIEJ1dCBDYWRlbmNlIFVTQiBkcml2ZXIgY29kZSBjZG5zMy1wbGF0LmMgcmVxdWlyZWQg
dG8gY2hhbmdlZC4KCkhpIFBldGVyIFBhd2VsIGFuZCBSb2dlcgogICBUaGVyZSBpcyBhICJwbGF0
Zm9ybV9zdXNwZW5kIiBmdW5jdGlvbiBwb2ludGVyIGluICJzdHJ1Y3QgY2RuczNfcGxhdGZvcm1f
ZGF0YSLvvIwKICAgQWRkICJwbGF0Zm9ybV9pbml0IiBhbmQgInBsYXRmb3JtX2V4aXQiIGZvciBv
dXIgSkg3MTEwIHBsYXRmb3JtLiBNYXliZSBpdCBjYW4gd29yay4KICAgSXMgaXQgT0s/ICAgCj4+
ICsJCQkJcmVnID0gPDB4MCAweDEwMDAwPiwKPj4gKwkJCQkgICAgICA8MHgxMDAwMCAweDEwMDAw
PiwKPj4gKwkJCQkgICAgICA8MHgyMDAwMCAweDEwMDAwPjsKPj4gKwkJCQlyZWctbmFtZXMgPSAi
b3RnIiwgInhoY2kiLCAiZGV2IjsKPj4gKwkJCQlpbnRlcnJ1cHRzID0gPDEwMD4sIDwxMDg+LCA8
MTEwPjsKPj4gKwkJCQlpbnRlcnJ1cHQtbmFtZXMgPSAiaG9zdCIsICJwZXJpcGhlcmFsIiwgIm90
ZyI7Cj4+ICsJCQkJcGh5cyA9IDwmdXNicGh5MD47Cj4+ICsJCQkJcGh5LW5hbWVzID0gImNkbnMz
LHVzYjItcGh5IjsKPiAKPiBObyBuZWVkIGZvciAqLW5hbWVzIHdoZW4gdGhlcmUgaXMgb25seSAx
IGVudHJ5LiBOYW1lcyBhcmUgbG9jYWwgdG8gdGhlIAo+IGRldmljZSBhbmQgb25seSB0byBkaXN0
aW5ndWlzaCBlbnRyaWVzLCBzbyAndXNiMicgd291bGQgYmUgc3VmZmljaWVudCAKPiBoZXJlLgo+
IApUaGUgUEhZIG5hbWUgJ2NkbnMzLHVzYjItcGh5JyAgaXMgZGVmaW5lZCBpbiBjYWRlbmNlMyB1
c2IgZHJpdmVyIGNvZGUuCkNhZGVuY2UgVVNCMyBkcml2ZXIgY29kZSB1c2luZyB0aGlzIG5hbWUg
dG8gZ2V0IFBIWSBpbnN0YW5jZS4KQW5kIGFsbCB0aGUgUEhZIG9wcyB1c2VkIGluIENhZGVuY2Uz
IFVTQiBzdWIgZGV2aWNlLiAKPj4gKwkJCQltYXhpbXVtLXNwZWVkID0gInN1cGVyLXNwZWVkIjsK
Pj4gKwkJCX07Cj4+ICsJCX07Cj4+ICsKPj4gKwkJdXNicGh5MDogcGh5QDEwMjAwMDAwIHsKPj4g
KwkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwLXVzYi1waHkiOwo+PiArCQkJcmVnID0g
PDB4MCAweDEwMjAwMDAwIDB4MCAweDEwMDAwPjsKPj4gKwkJCWNsb2NrcyA9IDwmc3lzY3JnIEpI
NzExMF9TWVNDTEtfVVNCXzEyNU0+LAo+PiArCQkJCSA8JnN0Z2NyZyBKSDcxMTBfU1RHQ0xLX1VT
QjBfQVBQXzEyNT47Cj4+ICsJCQljbG9jay1uYW1lcyA9ICIxMjVtIiwgImFwcF8xMjUiOwo+PiAr
CQkJI3BoeS1jZWxscyA9IDwwPjsKPj4gKwkJfTsKPj4gKwo+PiArCQlwY2llcGh5MDogcGh5QDEw
MjEwMDAwIHsKPj4gKwkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwLXBjaWUtcGh5IjsK
Pj4gKwkJCXJlZyA9IDwweDAgMHgxMDIxMDAwMCAweDAgMHgxMDAwMD47Cj4+ICsJCQkjcGh5LWNl
bGxzID0gPDA+Owo+PiArCQl9Owo+PiArCj4+ICsJCXBjaWVwaHkxOiBwaHlAMTAyMjAwMDAgewo+
PiArCQkJY29tcGF0aWJsZSA9ICJzdGFyZml2ZSxqaDcxMTAtcGNpZS1waHkiOwo+PiArCQkJcmVn
ID0gPDB4MCAweDEwMjIwMDAwIDB4MCAweDEwMDAwPjsKPj4gKwkJCSNwaHktY2VsbHMgPSA8MD47
Cj4+ICsJCX07Cj4+ICsKPj4gIAkJc3RnY3JnOiBjbG9jay1jb250cm9sbGVyQDEwMjMwMDAwIHsK
Pj4gIAkJCWNvbXBhdGlibGUgPSAic3RhcmZpdmUsamg3MTEwLXN0Z2NyZyI7Cj4+ICAJCQlyZWcg
PSA8MHgwIDB4MTAyMzAwMDAgMHgwIDB4MTAwMDA+Owo+PiAtLSAKPj4gMi4xNy4xCj4+IAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3Yg
bWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3Rz
LmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
