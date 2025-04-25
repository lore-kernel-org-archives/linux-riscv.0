Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C739C369C2
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Apr 2025 08:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CmfGSJDzmqxIEPOo9WsZapyeoshhUWG+En/3CtoEGCk=; b=rIvyVSF2lvNldw
	QRTC3xF0edCggbp7oM7CY+T4QEYoElotyXCZ79xM7wIydQDypuZNtdFN4z88y53w/gFqHK1l7DRbR
	ck6VrzF5wmdZ0YDfv3Gl5NMWTi8zlEuMLdU6OMzoMRbQWwinNUttP7ObPjha3cKCiVce8QxVuaXM1
	4HBfb2YAth9+qX20oZeIGTqlbMWXRHKS9ClnY6pBxy3QqYostbfkOAsEj9/y9DCZbmKD04pYqK0xu
	Jm+5xHzlN/n82FDualwpZXjiVrp5qdmpAIY51d7KZGx1btQdMFzXaHKdUird9oTp7kgbVsgMvlyj8
	bghaT1EUrJsnjpmJ7aGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EfU-0000000GO9a-0n4x;
	Fri, 25 Apr 2025 08:44:20 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8EfS-0000000GO8d-1fpb
	for linux-riscv@lists.infradead.org;
	Fri, 25 Apr 2025 08:44:19 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1745570646; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=iPxa1tME43btWBJM9+6+JF3341N/snsfZv7ikXOFqzt+ANi4A4Ysm8FOemEfDbUFzoeMjGLIlhMXvhq431XE1VV6YNa+7pB5M6NU7sqFUvSgmhgi2UF+CMZ3hjTIfeNhqWWMpdSilO2/ZTL8IGQzs7C3n3RKPc84NXnfsBCZNp4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1745570646; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yjq2AGuA29xCOgUcG0CIGuz4LaDtS7a60cZx5XO2DGA=; 
	b=i2MLWQYurtV3APXeIRg1xh2Qw3urvftrm+CLRlgsB1ZqUseQD9sH5sfdPcr8+mPqYhWHjNq2IpinEvPel3RSl3sI5rt6/Nywibcnetu/saZXwsG62TBTWzkIOrksmWOyMUk1cSk71xDBYLAXccLsNWFyni33zmo3Iq+znekys6Y=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1745570646;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yjq2AGuA29xCOgUcG0CIGuz4LaDtS7a60cZx5XO2DGA=;
	b=MbSr3hYhmraOXLP86p9Z8aaBI4qPNMRnIdZidUznApzOKEGDMzJjtIdnZ0yxBvc3
	eQ844/s9iIpWOxG51BOVQHsnkKfWt6yNO6skTbO1V6EQWYPL8Umy+0EX48cFe5wrRnM
	PLPsIZcEg7iXk5hAN0y3KJIF4LK6SMSgzKE4A1XGeCTJKqhlAsGrCqJv/CvPhz+EbCY
	BZWanu9+eYglFfwWt1u53YhOoYPvt6Ol4M/rdHh0AZ7s9PvYeGmW7PdmZI9vQrR5NV9
	hLcrKbqk3bwjuYWpO4TXC9j15hWYnCkSCzWc54wpAyJhi55ohZSXvbmeMNMpOXje2TZ
	R18j/Qftog==
Received: by mx.zohomail.com with SMTPS id 1745570643106791.8159653626777;
	Fri, 25 Apr 2025 01:44:03 -0700 (PDT)
Message-ID: <460048c49b82684af0759520ec8dcac057ad2857.camel@icenowy.me>
Subject: Re: [PATCH v2 1/3] dt-bindings: pinctrl: starfive,jh7110: add
 PAD_INTERNAL_* virtual pins
From: Icenowy Zheng <uwu@icenowy.me>
To: E Shattow <e@freeshell.de>, Emil Renner Berthing <kernel@esmil.dk>, 
 Jianlong Huang <jianlong.huang@starfivetech.com>, Hal Feng
 <hal.feng@starfivetech.com>, Linus Walleij <linus.walleij@linaro.org>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Fri, 25 Apr 2025 16:43:56 +0800
In-Reply-To: <60891c52-eeca-4358-8f38-789533016495@freeshell.de>
References: <20250424062017.652969-1-uwu@icenowy.me>
	 <20250424062017.652969-2-uwu@icenowy.me>
	 <60891c52-eeca-4358-8f38-789533016495@freeshell.de>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_014418_505008_E6FABEF3 
X-CRM114-Status: GOOD (  22.73  )
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

5ZyoIDIwMjUtMDQtMjTmmJ/mnJ/lm5vnmoQgMDE6MTUgLTA3MDDvvIxFIFNoYXR0b3flhpnpgZPv
vJoKPiBPbiA0LzIzLzI1IDIzOjIwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+ID4gVGhlIEpINzEx
MCBTb0MgY291bGQgc3VwcG9ydCBpbnRlcm5hbCBHUEkgc2lnbmFscyB0byBiZSByb3V0ZWQgdG8K
PiA+IG5vdAo+ID4gZXh0ZXJuYWwgR1BJTyBidXQgaW50ZXJuYWwgbG93L2hpZ2ggbGV2ZWxzLgo+
ID4gCj4gPiBBZGQgdHdvIG1hY3JvcywgUEFEX0lOVEVSTkFMX0xPVyBhbmQgUEFEX0lOVEVSTkFM
X0hJR0gsIGFzIHR3bwo+ID4gdmlydHVhbAo+ID4gInBhZHMiIHRvIHJlcHJlc2VudCBpbnRlcm5h
bCBHUEkgc291cmNlcyB3aXRoIGZpeGVkIGxvdy9oaWdoCj4gPiBsZXZlbHMuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gLS0tCj4gPiDC
oGluY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdGFyZml2ZSxqaDcxMTAtcGluY3RybC5oIHwg
NCArKysrCj4gPiDCoDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKPiA+IAo+ID4gZGlm
ZiAtLWdpdCBhL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdGFyZml2ZSxqaDcxMTAtcGlu
Y3RybC5oCj4gPiBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdGFyZml2ZSxqaDcxMTAt
cGluY3RybC5oCj4gPiBpbmRleCAzODY1ZjAxMzk2Mzk1Li4zY2NhODc0YjJiZWY3IDEwMDY0NAo+
ID4gLS0tIGEvaW5jbHVkZS9kdC1iaW5kaW5ncy9waW5jdHJsL3N0YXJmaXZlLGpoNzExMC1waW5j
dHJsLmgKPiA+ICsrKyBiL2luY2x1ZGUvZHQtYmluZGluZ3MvcGluY3RybC9zdGFyZml2ZSxqaDcx
MTAtcGluY3RybC5oCj4gPiBAQCAtMTI2LDYgKzEyNiwxMCBAQAo+ID4gwqAjZGVmaW5lwqDCoMKg
wqDCoMKgwqDCoFBBRF9HTUFDMF9UWEVOwqDCoMKgwqDCoMKgwqDCoMKgwqAxOAo+ID4gwqAjZGVm
aW5lwqDCoMKgwqDCoMKgwqDCoFBBRF9HTUFDMF9UWEPCoMKgwqDCoMKgwqDCoMKgwqDCoMKgMTkK
PiA+IMKgCj4gPiArLyogdmlydHVhbCBwaW5zIGZvciBmb3JjaW5nIEdQSSAqLwo+ID4gKyNkZWZp
bmUgUEFEX0lOVEVSTkFMX0xPV8KgwqDCoMKgwqDCoMKgMjU0Cj4gPiArI2RlZmluZSBQQURfSU5U
RVJOQUxfSElHSMKgwqDCoMKgwqDCoDI1NQo+ID4gKwo+ID4gwqAjZGVmaW5lIEdQT1VUX0xPV8Kg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAwCj4gPiDCoCNkZWZpbmUgR1BPVVRfSElHSMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgMQo+ID4gwqAKPiAKPiBBc2tpbmcgYWJvdXQgdGhlIGNob2lj
ZSBvZiAyNTUgYW5kIDI1NCB2YWx1ZXMgZm9yIHZpcnR1YWwgaGlnaC9sb3cKPiBwaW5zLAo+IGhl
cmUuIFRoZXJlJ3Mgbm90IG11Y2ggcmVzdWx0IHdoZW4gZ3JlcCBMaW51eCBzb3VyY2UgZm9yICd2
aXJ0dWFsCj4gcGluJwo+IHRvIGNvbXBhcmUgd2l0aC4gQXJlIHRoZXNlIHRoZSBiZXN0IHZhbHVl
cyBmb3IgdGhpcyBhcHByb2FjaD8KClRoZXNlIHR3byB2YWx1ZXMgYXJlIHBpY2tlZCBiZWNhdXNl
IHRoZSBmb2xsb3dpbmcgcmVhc29uczoKCi0gVGhlIHBpbiBmaWVsZCBoYXMgOCBiaXRzIChzZWUg
dGhlIGNvbW1lbnRzIG9mIGpoNzExMF9waW5tdXhfZGluKCkgaW4KcGluY3RybC1zdGFyZml2ZS1q
aDcxMTAuYykKLSBXZSBhcmUgYWxyZWFkeSB1c2luZyB2YWx1ZXMgMCBhbmQgMSBmb3IgR1BJTzAv
R1BJTzEKCklmIHdlJ3JlIGRlc2lnbmluZyBmcm9tIHNjcmF0Y2gsIGl0J3MgcG9zc2libGUgdG8g
aGF2ZSBhbm90aGVyIHByYWN0aWNlCmJ5IHVzaW5nIDAgYW5kIDEgZm9yIGludGVybmFsIGxvdy9o
aWdoIGFuZCAyIGZvciBncGlvMCBzbyBvbi4KCj4gCj4gV2hhdCBoYXBwZW5zIHdoZW4gZGV2aWNl
dHJlZSBoYXMgaW4gaXQgdG8gcm91dGUgUEFEX0lOVEVSTkFMX0xPVyB0bwo+IFBBRF9JTlRFUk5B
TF9ISUdIIGFuZCBvdGhlciB1bmxpa2VseSBjb21iaW5hdGlvbnM/wqAgT3IgYSBkZXZpY2V0cmVl
Cj4gYmxvYgo+IHdpdGggdGhpcyBjb21wdXRlZCB2YWx1ZSBpcyBwYWlyZWQgdG8gTGludXgga2Vy
bmVsIHRoYXQgZG9lcyBub3QgaGF2ZQo+IHRoZSBjb2RlIHRvIGhhbmRsZSB0aGVzZSB2aXJ0dWFs
IHBpbnMsIGZvciBjb21wYXRpYmlsaXR5IGNvbmNlcm4/CgpJIHRoaW5rIGl0J3Mgbm90IHN1cHBv
cnRlZCBmb3IgbmV3ZXIgRFRzIHRvIGJlIGNvbXBhdGlibGUgd2l0aCBvbGQKa2VybmVscywgYnV0
IEkgYW5hbHl6ZWQgdGhlIGNvZGUsIGEgcmVhZC1vdXQtb2YtYm91bmQgY291bGQgaGFwcGVuIGlu
CmpoNzExMF9zZXRfZnVuY3Rpb24oKSBpbiBwaW5jdHJsLXN0YXJmaXZlLWpoNzExMC1zeXMuYyAu
IFdlbGwgdGhpcyBpcwp1bmZvcnR1bmF0ZSwgYnV0IHdlIGNhbiBkbyBmZXcgdGhpbmdzIHRvIGZp
eCBvbGQga2VybmVscyAtLSB3ZSBjYW4gZml4CnRoZSBwcm9ibGVtIGluIG5ld2VyIGtlcm5lbHMu
CgpBbmQgZXZlbiBwaWNraW5nIG90aGVyIHZhbHVlcyBjYW5ub3QgbWFrZSB0aGluZ3MgYmV0dGVy
Li4uCgo+IAo+IERvIHdlIGtub3cgeWV0IGlmIEpIODEwMCB3aWxsIHNoYXJlIHNvbWUgb2YgdGhp
cyBkZXNpZ24/CgpXZSBkb24ndCBrbm93IHlldCB3aGV0aGVyIEpIODEwMCBjYW4gZXhpc3QuCgo+
IAo+IC1FCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
bGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
