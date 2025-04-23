Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4CEC369CB
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Apr 2025 17:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XPYPqvZBilsQuOPardYDyc9m+zwEEeXLjKCCfUH0p5Q=; b=U5mhebgsEphbHU
	1ubWQAUAJuoQFrA615GN9SlxDAmkmYpIR6lgk1+DZM4hyF6Xo+oAtWop5TFFRYVZE/ePACr1bOGKN
	QEXpikOyE0r9MGvndti85vChpmpQ19igzqkAO/iTOd/jWcZvo/mJApl+duwdM25TEoS2Pm2yz8nVU
	JMYjskK2yjLM6hlg6RbOtwIIXbv4zdp8Ch9IDQ5sDGj8shvabuMhN38/uDqq4/zcBr1BtYUTMs1BZ
	Gk/uwqqmQdKeU3CK1/PcWAkRpttFc1LLosJDRYf5vmcw/d/e6LBTRL3QMPxxGb9ERFMyvIHxzptda
	+ADBSBE+FDAvTEG8iuWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7e5R-0000000BIRK-2pOS;
	Wed, 23 Apr 2025 17:40:41 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7azG-0000000Ao8d-1svZ
	for linux-riscv@lists.infradead.org;
	Wed, 23 Apr 2025 14:22:08 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745418119; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ZDV+mpsgzh1T0Z7SwITf51hq64jkmPmYNt4ZPn0hf+9iQUFiOtzyQMPeXB87ELeh+mtm0UOI4jL2g1e/LMrwTzDC0BRsX75fwD0adNraebUpUKmFHW9gr7CgloAcfeoufKzEPsJjkocYEdjaYrgmGLmoOfPEbLhalr0b5sCzNPU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745418119; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9yB/Qq+BRZ2Phu3AIq9BfdJXrDlB28zaBQ+JFyqEXRQ=; 
	b=F5/MLn65UFcUWqfKpz3lDq0IhkS7oAIQyNKd2KZ5EU9HZHN+B9YFkSdfZyQmIXdM3Wz7VOf6+ZJCfWet4D+HuzGYUTSINMcFZ2hlkO9UxfYg1oiKMWGFCLuYV5pL+BIJEImgjBEJyHXXSNXmt48yYpxZd76A9sTv88MnprWaJ1s=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745418119;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=9yB/Qq+BRZ2Phu3AIq9BfdJXrDlB28zaBQ+JFyqEXRQ=;
	b=BCp7xZzUEkm77k0kl7WIn+l0ZF78PFghvUmTccTyk2NkPGAR5Mow55ts+gKKKQzO
	lRN2aPfzHc1aWe5MSAQDSLtrzwrnCdch6bRj126kI6Z+R9I2D3wtlAcVHvNROyzAyFi
	ITU2NmEE4IervwC6IboL3/0/bp5d59sP/fTsMJRApy/BaqBcsGExlTQOGzBaUavdYU5
	8zNNFQvUE5hPg+Qutt+DiVV3CiAV6x7MvaSromHkNvCcRZZp3Ih12fOAJf6m3gxkUeg
	2nsU/Hr/gyo4GmKdRLdXdra415DjJutSVRAf20Pg0dDLBYR2Sm7KGECIO/nFRn+17Qd
	RI3tRN6TsQ==
Received: by mx.zohomail.com with SMTPS id 1745418117666283.0504327658683;
	Wed, 23 Apr 2025 07:21:57 -0700 (PDT)
Message-ID: <c5efd677fd2199cbf8f9d6006905acdf19da02bc.camel@icenowy.me>
Subject: Re: [RFC PATCH 1/3] dt-bindings: pinctrl: jh7110-sys: add force
 inputs
From: Icenowy Zheng <uwu@icenowy.me>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Jianlong Huang
 <jianlong.huang@starfivetech.com>, Hal Feng <hal.feng@starfivetech.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Date: Wed, 23 Apr 2025 22:21:51 +0800
In-Reply-To: <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
References: <20250422162250.436169-1-uwu@icenowy.me>
	 <20250422162250.436169-2-uwu@icenowy.me>
	 <CACRpkdbGwPyQgVL18iMvUTAvh4XTjo6g3mGT4e_b2aNAjr2obg@mail.gmail.com>
	 <B4C8B369-E345-4133-A106-7C5E71513329@icenowy.me>
	 <CACRpkdYgkDpC1iJ-KaZj2GZ3A3_V=3-KQef_nCRhMDrUK=FHXg@mail.gmail.com>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_072206_564544_043A910C 
X-CRM114-Status: GOOD (  20.47  )
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

5ZyoIDIwMjUtMDQtMjPmmJ/mnJ/kuInnmoQgMTI6NTUgKzAyMDDvvIxMaW51cyBXYWxsZWlq5YaZ
6YGT77yaCj4gT24gV2VkLCBBcHIgMjMsIDIwMjUgYXQgMTE6NDHigK9BTSBJY2Vub3d5IFpoZW5n
IDx1d3VAaWNlbm93eS5tZT4KPiB3cm90ZToKPiA+IOS6jiAyMDI15bm0NOaciDIz5pelIEdNVCsw
ODowMCAxNzowOTo0Mu+8jExpbnVzIFdhbGxlaWoKPiA+IDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+IOWGmemBk++8mgo+ID4gPiBIaSBJY2Vub3d5LAo+ID4gPiAKPiA+ID4gdGhhbmtzIGZvciB5
b3VyIHBhdGNoIQo+ID4gPiAKPiA+ID4gT24gVHVlLCBBcHIgMjIsIDIwMjUgYXQgNjoyM+KAr1BN
IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gPiB3cm90ZToKPiA+ID4gCj4gPiA+
ID4gK8KgIHN0YXJmaXZlLGZvcmNlLWxvdy1pbnB1dHM6Cj4gPiA+ID4gK8KgwqDCoCBkZXNjcmlw
dGlvbjoKPiA+ID4gPiArwqDCoMKgwqDCoCBUaGUgbGlzdCBvZiBpbnB1dCBzaWduYWxzIGZvcmNl
ZCB0byBiZSBsb3cgaW5zaWRlIHRoZQo+ID4gPiA+IFNvQyBpdHNlbGYuCj4gPiA+ID4gK8KgwqDC
oCAkcmVmOiAvc2NoZW1hcy90eXBlcy55YW1sIy9kZWZpbml0aW9ucy91aW50MzItYXJyYXkKPiA+
ID4gCj4gPiA+IEkgZG9uJ3Qgc2VlIHdoeSB5b3UgbmVlZCB0aGlzIGhhY2suCj4gPiAKPiA+IFVu
Zm9ydHVuYXRlbHkgdGhlc2UgcHJvcGVydGllcyBhcmUgbm90IGZvciBwaW5zLCBidXQgaW50ZXJu
YWwKPiA+IHNpZ25hbHMgdGhhdCBpc24ndAo+ID4gYm91bmQgdG8gZXh0ZXJuYWwgcGlucy4KPiAK
PiBXZSBkb24ndCByZWFsbHkgY2FyZSBpZiBwaW5zIGFyZSBleHRlcm5hbCBvciBub3QsIHdlIGFy
ZSBhbiBvcGVyYXRpbmcKPiBzeXN0ZW0KPiBub3QgYSBwaGlsb3NvcGh5IGRlcGFydG1lbnQgOykK
PiAKPiBZb3UgY2FsY3VsYXRlIHRoZSBvZmZzZXQgYW5kIHNoaWZ0IGxpa2UgdGhpcyBhbmQgd3Jp
dGUgaW50byBhCj4gYmFzZStvZmZzZXQ6Cj4gCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgIG9mZnNldCA9IDQgKiAocGluIC8gNCk7Cj4gK8KgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHNoaWZ0wqAgPSA4ICogKHBpbiAlIDQp
Owo+ICsKPiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdmFs
ID0gcmVhZGxfcmVsYXhlZChzZnAtPmJhc2UgKwo+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgaW5mby0+Z3BpX3JlZ19iYXNlICsKPiBvZmZzZXQpOwo+IAo+IENvbXBhcmUgdG8gamg3MTEw
X3Bpbl9kYmdfc2hvdygpOgo+IAo+IMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgdW5zaWdu
ZWQgaW50IG9mZnNldCA9IDQgKiAocGluIC8gNCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHVuc2lnbmVkIGludCBzaGlmdMKgID0gOCAqIChwaW4gJSA0KTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgdTMyIGRvdXQgPSByZWFkbF9yZWxheGVkKHNmcC0+YmFzZSAr
Cj4gaW5mby0+ZG91dF9yZWdfYmFzZSArIG9mZnNldCk7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIHUzMiBkb2VuID0gcmVhZGxfcmVsYXhlZChzZnAtPmJhc2UgKwo+IGluZm8tPmRv
ZW5fcmVnX2Jhc2UgKyBvZmZzZXQpOwo+IAo+IFNvIGNsZWFybHkgdGhlIGVudGl0aWVzIHRoYXQg
eW91IGFmZmVjdCBhcmUgaW4gdGhlIHNhbWUgbnVtYmVyc3BhY2UsCj4gYW5kIHRoYXQgaXMgYWxs
IHdlIGNhcmUgYWJvdXQuIFRoZXkgYXJlIG5vdCBlbnVtZXJhdGVkIGluIGFueSB3YXkKPiBvcnRo
b2dvbmFsIHRvIGFueSBvdGhlciBwaW5zIEFGQUlDVC4KClRoZXkganVzdCBzaGFyZSB0aGUgZmll
bGQgd2lkdGgsIHRoZXkncmUgbm90IGluIHRoZSBzYW1lIG51bWJlcnNwYWNlLgoKVGhlIGRlc2ln
biBvZiB0aGUgSkg3MTEwIHBpbiBtdXggY29udHJvbCBpcyBxdWl0ZSBzaW1wbGUgYW5kIHN0dXBp
ZDoKCi0gRmlyc3QgcGVyLUdQSU8gbWFwIGNvbmZpZ3VyYXRpb24gdG8gbWFwIHRoZSBHUElPJ3Mg
RE9FbiBwaW4gdG8KaW50ZXJuYWwgdHJpLXN0YXRpbmcgc2lnbmFscy4KLSBUaGVuIHBlci1HUElP
IG1hcCBjb25maWd1cmF0aW9uIHRvIG1hcCB0aGUgR1BJTydzIERPVVQgcGluIHRvCmludGVybmFs
IG91dHB1dCBzaWduYWxzLgotIFRoZW4gcGVyLWlucHV0LXNpZ25hbCBjb25maWd1cmF0aW9uIChu
b3RlIHRoYXQgaXQncyBubyBsb25nZXIgcGVyLQpHUElPKSBtYXAgY29uZmlndXJhdGlvbiB0byBt
YXAgdGhlIHNpZ25hbCB0byBhIEdQSU8ncyBESU4gKG9yIGZpeGVkCmxvdy9oaWdoKS4KCkZvciBl
eGFtcGxlcywgaGVyZSdzIHNvbWUgZmllbGQgbmFtZXMgb2YgYSBmZXcgcmVnaXN0ZXJzIChhY2Nv
cmRpbmcgdG8KdGhlIFRSTSk6CjB4MCBbNTowXTogc3lzX2lvbXV4X2dwbzBfZG9lbl9jZmcKMHg0
MCBbNjowXTogc3lzX2lvbXV4X2dwbzBfZG91dF9jZmcKMHg4MCBbNjowXTogc3lzX2lvbXV4X2dw
aV91MF9XQVZFNTExX2lfwq11YXJ0X3J4c2luX2NmZwoKUC5TLiBJIGp1c3Qgbm93IGZvdW5kIHRo
YXQgdGhlIHZlbmRvcidzIDYuMTIgQlNQICh3aGljaCB1c2VzIHRoZQptYWlubGluZWQgcGluY3Ry
bCBkcml2ZXIpIGhhcyBwaW5tdXggY29uZmlndXJhdGlvbiB0aGF0IG1hcHMgdGhlIHNhbWUKR1BJ
TyBwaW4gKEdQSU8zOCkgdG8gdHdvIGlucHV0IHNpZ25hbHMgKGJvdGggQkNMSyBzaWduYWxzIG9m
IHR3byBJMlMKY29udHJvbGxlcnMsIG9uZSBSWCBhbmQgb25lIFRYKSBbMV0uIFRoaXMgbWFrZXMg
bWUgdGhpbmsgdXNlIHR3bwp2aXJ0dWFsIHBhZCBudW1iZXJzIChvbmUgZm9yIGludGVybmFsIGxv
dyBsZXZlbCwgYW5vdGhlciBmb3IgaW50ZXJuYWwKaGlnaCkgZm9yIHRoZXNlIGludGVybmFsIGNv
bm5lY3Rpb25zIHZpYWJsZSBhZ2FpbiAtLSBJbiB0aGlzIGNhc2UgSSBjYW4Kd3JpdGUgYEdQSU9N
VVgoUEFEX0lOVEVSTkFMX0hJR0gsIEdQT1VUX0xPVywgR1BPRU5fRElTQUJMRSwKR1BJX1NZU19V
U0JfT1ZFUkNVUlJFTlQpYCAuCgpbMV0KaHR0cHM6Ly9naXRodWIuY29tL3N0YXJmaXZlLXRlY2gv
bGludXgvYmxvYi9KSDcxMTBfVmlzaW9uRml2ZTJfNi4xMi55X2RldmVsL2FyY2gvcmlzY3YvYm9v
dC9kdHMvc3RhcmZpdmUvamg3MTEwLXN0YXJmaXZlLXZpc2lvbmZpdmUtMi5kdHNpI0wyOTgKCj4g
Cj4gQm90aCBwaW4gY29udHJvbCBhbmQgR1BJTyBoYW5kbGUgY2hpcC1pbnRlcm5hbCBsaW5lcyB0
aGF0IGFyZSBub3QKPiByb3V0ZWQgb3V0c2lkZSBzb21ldGltZXMsIHRoYXQncyBmaW5lLiBKdXN0
IGRlYWwgd2l0aCB0aGVtIGFzIGFueQo+IG90aGVyCj4gInBpbnMiLgo+IAo+IFlvdXJzLAo+IExp
bnVzIFdhbGxlaWoKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFk
Lm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJp
c2N2Cg==
