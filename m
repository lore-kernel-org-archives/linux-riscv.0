Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06203E81810
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Sep 2023 03:16:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5/FS2EvrzhOkFduIHdEqKNceBmyV0tYXAK7BIBGBy4k=; b=HZS3SMuTnl2edo
	nXF78safRxFIPnow+6DGi72L9Hv/5nKLLFxrmZBe7XTYZNVsD5ICkThgbWi2pAWOKItuEe88CIcdr
	y0AxebypF56dE213eoQKHDij7bv6w0vl85kzsD8IcITeLzWcjl9ULlQL8X+HVeudGwBihgg2VaAj5
	QFnTjToVzwBIvrKyAcsW8ia1FY/h0ccSAng454FqD5zgFtYQsGc6XbuIkQgIfYgWIPzye+9bNnEDG
	KxXnq5jtBoY0MTAjerATgP1zDLqCFYbxgmzEHLIXCsoQdEPGQp6l8IgkpsZWYnkGC46KRUlV/31In
	BiPfoCKEXcE0l5BmsECA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qkyYJ-00FSWN-2J;
	Tue, 26 Sep 2023 03:15:59 +0000
Received: from sender4-op-o10.zoho.com ([136.143.188.10])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qkyYH-00FSVD-0O
	for linux-riscv@lists.infradead.org;
	Tue, 26 Sep 2023 03:15:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1695698137; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WVaSj846s5kVfCid4BzazZN5qETBeE3+qGpCglntM2DwKDW4CLO7xWlYTM5IqGfJqvkcpMPaFEzukPqcn7viuZOwVyyHF/lYTq1HwR0LneC9XbURT36l8aAsBYYV6p0vI1bqlzhGiBsVd7eGClQQB2XB2jEYlu6ydCguD3zIhxw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1695698137; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=KhI5QeS9PArzWK5Z9vvz4HtEovenQXgCmMyUThSuYlA=; 
	b=XHLK1ngh/pQjFZcJ0YKoIP3Qsnayx8RSLWJVQR5ztW4fNw6ZfyT8XBUkO6pgWC89ZPFaGtkSHWw5hF3BtR1R3TRN2CLtDeABKRbxkiaLRo3EJajw+xbkvS3Ws9RgBbaqElUCahdnSOhlpDjxhPbMeoVuG0Rws/kzAQLUzUltaqk=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1695698137;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=KhI5QeS9PArzWK5Z9vvz4HtEovenQXgCmMyUThSuYlA=;
	b=mP6rhCrJERuxPbH/UEN7gSJpjV/ppXL2KJw38qlvpwvVr8tiKdgPC3agkrYrXX94
	CuvQzZaPq5z3r+aC/t4Vktqwq1sWyTwex7fQ0kjLvFIVtSCPaVM7o2yaxNnJH+HcJVO
	k93z/SaMRrHpoIGo27Mtd8Ws5KnlIX4tmCsA2AxtS09lDRoMjhMBs/u5GnFTIgDUdr+
	yHJNsZta6W/Mhq4DWyJnGvoZ6n7C7+fg7J4WozghCA6vJOlFMfWE4r7OxnzRZYXtY20
	/a4347tNO4DiIUsMDTh+YLMbVuw7fJuM2GOTuAnbIykrcUnUdcyGGCFM/0yZhfJKWtg
	F3UMLiLRvg==
Received: from edelgard.fodlan.icenowy.me (120.85.96.110 [120.85.96.110]) by mx.zohomail.com
	with SMTPS id 169569813492220.156609859645982; Mon, 25 Sep 2023 20:15:34 -0700 (PDT)
Message-ID: <c80bf6710d8cc7a1c0d49d52ad6410d04c6a0858.camel@icenowy.me>
Subject: Re: [RFC v2 6/6] riscv: dts: thead: convert isa detection to new
 properties
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, Conor Dooley
 <conor.dooley@microchip.com>,  Rob Herring <robh+dt@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
 <conor+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Chen-Yu
 Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Daire McNamara
 <daire.mcnamara@microchip.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, Emil Renner
 Berthing <kernel@esmil.dk>, Jisheng Zhang <jszhang@kernel.org>, Guo Ren
 <guoren@kernel.org>,  Fu Wei <wefu@redhat.com>, Chen Wang
 <unicorn_wang@outlook.com>, devicetree@vger.kernel.org, 
 linux-sunxi@lists.linux.dev, linux-renesas-soc@vger.kernel.org
Date: Tue, 26 Sep 2023 11:15:27 +0800
In-Reply-To: <20230925-semantic-euphemism-f0c7e85ac317@spud>
References: <20230922081351.30239-2-conor@kernel.org>
	 <20230922081351.30239-8-conor@kernel.org>
	 <f3b8d0823150797bde975a09b1faf6d3826d1ea8.camel@icenowy.me>
	 <20230925-semantic-euphemism-f0c7e85ac317@spud>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230925_201557_237939_770A50D1 
X-CRM114-Status: GOOD (  20.91  )
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

5ZyoIDIwMjMtMDktMjXmmJ/mnJ/kuIDnmoQgMTY6NTkgKzAxMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBTdW4sIFNlcCAyNCwgMjAyMyBhdCAwNzoyMjozMEFNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjMtMDktMjLmmJ/mnJ/kupTnmoQgMDk6MTMgKzAxMDDv
vIxDb25vciBEb29sZXnlhpnpgZPvvJoKPiA+ID4gRnJvbTogQ29ub3IgRG9vbGV5IDxjb25vci5k
b29sZXlAbWljcm9jaGlwLmNvbT4KPiA+ID4gCj4gPiA+IENvbnZlcnQgdGhlIHRoMTUyMCBkZXZp
Y2V0cmVlcyB0byB1c2UgdGhlIG5ldyBwcm9wZXJ0aWVzCj4gPiA+ICJyaXNjdixpc2EtYmFzZSIg
JiAicmlzY3YsaXNhLWV4dGVuc2lvbnMiLgo+ID4gPiBGb3IgY29tcGF0aWJpbGl0eSB3aXRoIG90
aGVyIHByb2plY3RzLCAicmlzY3YsaXNhIiByZW1haW5zLgo+ID4gPiAKPiA+ID4gU2lnbmVkLW9m
Zi1ieTogQ29ub3IgRG9vbGV5IDxjb25vci5kb29sZXlAbWljcm9jaGlwLmNvbT4KPiA+ID4gLS0t
Cj4gPiA+IMKgYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaSB8IDEyICsrKysr
KysrKysrKwo+ID4gPiDCoDEgZmlsZSBjaGFuZ2VkLCAxMiBpbnNlcnRpb25zKCspCj4gPiA+IAo+
ID4gPiBkaWZmIC0tZ2l0IGEvYXJjaC9yaXNjdi9ib290L2R0cy90aGVhZC90aDE1MjAuZHRzaQo+
ID4gPiBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiA+ID4gaW5kZXgg
Y2U3MDgxODNiNmY2Li43MjNmNjU0ODcyNDYgMTAwNjQ0Cj4gPiA+IC0tLSBhL2FyY2gvcmlzY3Yv
Ym9vdC9kdHMvdGhlYWQvdGgxNTIwLmR0c2kKPiA+ID4gKysrIGIvYXJjaC9yaXNjdi9ib290L2R0
cy90aGVhZC90aDE1MjAuZHRzaQo+ID4gPiBAQCAtMjAsNiArMjAsOSBAQCBjOTEwXzA6IGNwdUAw
IHsKPiA+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
Y29tcGF0aWJsZSA9ICJ0aGVhZCxjOTEwIiwgInJpc2N2IjsKPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgZGV2aWNlX3R5cGUgPSAiY3B1IjsKPiA+
ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgcmlzY3Ys
aXNhID0gInJ2NjRpbWFmZGMiOwo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoHJpc2N2LGlzYS1iYXNlID0gInJ2NjRpIjsKPiA+ID4gK8KgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqByaXNjdixpc2EtZXh0ZW5zaW9u
cyA9ICJpIiwgIm0iLCAiYSIsCj4gPiA+ICJmIiwKPiA+ID4gImQiLCAiYyIsICJ6aWNudHIiLCAi
emljc3IiLAo+ID4gPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgICJ6aWZlbmNl
aSIsCj4gPiA+ICJ6aWhwbSI7Cj4gPiAKPiA+IFpmaCBpcyBzdXBwb3J0ZWQgYnkgVC1IZWFkIEM5
eHggd2l0aCBmbG9hdCB0b28uCj4gCj4gWW91IHNheSB4eCwgc28ganVzdCB0byBiZSBzdXJlOiBJ
cyBpdCBhbHdheXMgc3VwcG9ydGVkLCBvciBvbmx5IHdpdGgKPiBzb21lIGNvbmZpZyBmb3IgdGhl
IElQIChJIHdhbm5hIGtub3cgaWYgSSBuZWVkIHRvIGxvb2sgb3V0IGZvciBpdAo+IHdoaWxlCj4g
cmV2aWV3aW5nIG90aGVyIFNvQ3MgZXRjKT8KCkkgdGhpbmsgaXQncyBncm91cGVkIHdpdGggRkQu
Cgo+IEFsc28sIGRvIHlvdSBoYXZlIGEgbGluayB0byB0aGUgZG9jdW1lbnRhdGlvbiBmb3IgaXQ/
IEVuZ2xpc2ggaXMgdGhlCj4gb25seSByZWxldmFudCBsYW5ndWFnZSBJIHNwZWFrLCBzbyBpZiB0
aGUgZG9jIGlzIGluIENoaW5lc2UsIEknbGwKPiBuZWVkCj4gc29tZSBoZWxwIQoKU29ycnksIGJ1
dCBULUhlYWQncyBvZmZpY2lhbCBkb2N1bWVudCBbMV0gaXMgb25seSBpbiBDaGluZXNlLiBJbgph
ZGRpdGlvbiwgaW4gdGhpcyBkb2N1bWVudCBoYWxmLWZsb2F0IGlzIGxpc3RlZCBhcyBhICJULUhl
YWQKZXh0ZW5zaW9uIiwgYnV0IHRoZSBlbmNvZGluZyBtYXRjaGVzIFpmaC4gU2VlIDE1LjYgQXBw
ZW5kaXggQi02IEhhbGYKRmxvYXQgKDE1LjYg6ZmE5b2VIEItNiDmta7ngrnljYrnsr7luqbmjIfk
u6TmnK/or60pIC4KClsxXQpodHRwczovL2dpdGh1Yi5jb20vVC1oZWFkLVNlbWkvb3BlbmM5MTAv
YmxvYi9tYWluL2RvYy8lRTclOEUlODQlRTklOTMlODFDOTEwJUU3JTk0JUE4JUU2JTg4JUI3JUU2
JTg5JThCJUU1JTg2JThDLnBkZgoKPiAKPiA+IEluIGFkZGl0aW9uLCBzaG91bGQgWCBleHRlbnNp
b25zIGdldCBsaXN0ZWQgaGVyZT8KPiAKPiBZZXMsIGJ1dCBzb21lb25lIHdobyBjYXJlcyBhYm91
dCBkb2N1bWVudGluZyB0aGVzZSBleHRlbnNpb25zIHNob3VsZAo+IGRvCj4gaXQgOykKCldlbGwg
YXQgbGVhc3QgYSBidW5jaCBvZiBYdGhlYWQncyBhcmUgbm93IGRvY3VtZW50ZWQuCgpNYXliZSB0
aGV5IHdpbGwgZ2V0IGFwcGVuZGVkIGFmdGVyIHRoaXMgcGF0Y2hzZXQgZ2V0IGludHJvZHVjZWQu
CgpCeSB0aGUgd2F5LCBob3cgdG8gZGVhbCB3aXRoIHRoZSBkcmFmdCBWIG9mIEM5eHg/Cgo+IAo+
IFRoYW5rcywKPiBDb25vci4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5m
cmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xp
bnV4LXJpc2N2Cg==
