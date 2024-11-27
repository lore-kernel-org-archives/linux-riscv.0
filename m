Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CC9D6ACD4
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Nov 2024 13:40:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=W9Kv5aV0u5+anFrMXVOQoNjoVBUomsDKftNHoKl8qFs=; b=UlSjLpW2VoecqN
	qEua2sLZ0w7EBdm1mpJA+V2ZBNqQX/tluubj4vgeJpDw/7N12S/x/VxB7rl0+Ydblu/uhqzq55fpv
	T9M5WYEHJvBVMTBs40O1/zpm10mJO6E0KW2wqyaeyanVkXUWOHpclUVgBsRWQF39voSCvqAZdbQ9t
	sbS08h/y+lJ6L/msxfozKXCyIK5RZEQbyukqPk9WDcDohAwcZFhhyjfmmOs6cjy593oZwTWNEqgAI
	kFP/Qz3HoPWpqz0+YuW83wzef8USjY5Pp8351Rk4mxe46k4BSNLyjfiNjlhO08GsHIOInIirxIfFJ
	vegsDUCAiA2Bfcufdl+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIHZ-0000000DGXh-3HZK;
	Wed, 27 Nov 2024 13:40:41 +0000
Received: from freeshell.de ([116.202.128.144])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGIFi-0000000DG7m-3qt9
	for linux-riscv@lists.infradead.org;
	Wed, 27 Nov 2024 13:38:48 +0000
Received: from [IPV6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46] (unknown [IPv6:2605:59c8:31de:bf00:37c2:fe62:c21b:ab46])
	(Authenticated sender: e)
	by freeshell.de (Postfix) with ESMTPSA id F2247B4B1EF8;
	Wed, 27 Nov 2024 14:38:41 +0100 (CET)
Message-ID: <dd060a05-9428-4af8-85b1-b6baa756490f@freeshell.de>
Date: Wed, 27 Nov 2024 05:38:39 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] riscv: dts: starfive: jh7110-pine64-star64: enable
 usb0 host function
To: Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 Henry Bell <dmoo_dv@protonmail.com>
Cc: Conor Dooley <conor@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20241126073836.17208-1-e@freeshell.de>
 <20241126073836.17208-2-e@freeshell.de>
 <CAJM55Z8---o6_ZxeyUu_M74LA_zKfeksBmRGFkm2C66hRJbPug@mail.gmail.com>
Content-Language: en-US
From: E Shattow <e@freeshell.de>
In-Reply-To: <CAJM55Z8---o6_ZxeyUu_M74LA_zKfeksBmRGFkm2C66hRJbPug@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_053847_107698_ED8EFFDE 
X-CRM114-Status: GOOD (  14.89  )
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
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Ck9uIDExLzI3LzI0IDA1OjIzLCBFbWlsIFJlbm5lciBCZXJ0aGluZyB3cm90ZToKPiBFIFNoYXR0
b3cgd3JvdGU6Cj4+IFBpbmU2NCBTdGFyNjQgc2V0IEpINzExMCBvbi1jaGlwIFVTQiBob3N0IG1v
ZGUgYW5kIHZidXMgcGluIGFzc2lnbm1lbnQKPiBIZXJlIEknZCBsaWtlIGl0IGV4cGxhaW5lZCB0
aGF0IHRoZSBTdGFyNjQgYm9hcmQgcm91dGVzIDEgb2YgdGhlIDQgVVNCLUEgcG9ydHMKPiB0byBV
U0IwIG9uIHRoZSBTb0MgcmF0aGVyIHRoYW4gdG8gdGhlIFVTQiAzLjAgPC0+IFBDSWUgY2hpcC4K
Pgo+IChDb25mdXNpbmcgZm9yIHVzZXJzIHRoYXQgMSBvZiB0aGUgNCBzaW1pbGFyIHBvcnRzIG9u
bHkgZG9lcyBVU0IgMi4wLCBidXQKPiB0aGF0J3MgdG9vIGxhdGUgdG8gY2hhbmdlIGFuZCBub3Qg
cmVsZXZhbnQgaGVyZSkKPgo+IFdpdGggdGhhdCBmaXhlZDoKPiBSZXZpZXdlZC1ieTogRW1pbCBS
ZW5uZXIgQmVydGhpbmcgPGVtaWwucmVubmVyLmJlcnRoaW5nQGNhbm9uaWNhbC5jb20+CgoKVGhl
cmUgaXMgbm8gKFZMODA1KSBVU0IgMy4wIDwtPiBQQ0llIGNoaXAgb24gU3RhcjY0O8KgIEFsbCA0
IFVTQi1BIHBvcnRzIApyb3V0ZSB0byBVU0IwIG9mIHRoZSBTb0MuIFdoYXQgZG9lcyBub3QgZXhp
c3QgSSBkaWQgbm90IHdyaXRlIGFib3V0IGluIAp0aGUgY292ZXIgbGV0dGVyLiBJIHdpbGwgZXhw
YW5kIHRoZSBkZXNjcmlwdGlvbiBpbiB0aGUgY29tbWl0IG1lc3NhZ2UuIApUaGFuayB5b3UhwqAg
LUUKCgo+PiBTaWduZWQtb2ZmLWJ5OiBFIFNoYXR0b3cgPGVAZnJlZXNoZWxsLmRlPgo+PiAtLS0K
Pj4gICAuLi4vYm9vdC9kdHMvc3RhcmZpdmUvamg3MTEwLXBpbmU2NC1zdGFyNjQuZHRzIHwgMTgg
KysrKysrKysrKysrKysrKystCj4+ICAgMSBmaWxlIGNoYW5nZWQsIDE3IGluc2VydGlvbnMoKyks
IDEgZGVsZXRpb24oLSkKPj4KPj4gZGlmZiAtLWdpdCBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3Rh
cmZpdmUvamg3MTEwLXBpbmU2NC1zdGFyNjQuZHRzIGIvYXJjaC9yaXNjdi9ib290L2R0cy9zdGFy
Zml2ZS9qaDcxMTAtcGluZTY0LXN0YXI2NC5kdHMKPj4gaW5kZXggZmU0YTQ5MGVjYzYxLi5iNzY0
ZDRkOTJmZDkgMTAwNjQ0Cj4+IC0tLSBhL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZpdmUvamg3
MTEwLXBpbmU2NC1zdGFyNjQuZHRzCj4+ICsrKyBiL2FyY2gvcmlzY3YvYm9vdC9kdHMvc3RhcmZp
dmUvamg3MTEwLXBpbmU2NC1zdGFyNjQuZHRzCj4+IEBAIC04MCw3ICs4MCwyMyBAQCAmc3BpMCB7
Cj4+ICAgCXN0YXR1cyA9ICJva2F5IjsKPj4gICB9Owo+Pgo+PiArJnN5c2dwaW8gewo+PiArCXVz
YjBfcGluczogdXNiMC0wIHsKPj4gKwkJdmJ1cy1waW5zIHsKPj4gKwkJCXBpbm11eCA9IDxHUElP
TVVYKDI1LCAgR1BPVVRfU1lTX1VTQl9EUklWRV9WQlVTLAo+PiArCQkJCQkgICAgICAgR1BPRU5f
RU5BQkxFLAo+PiArCQkJCQkgICAgICAgR1BJX05PTkUpPjsKPj4gKwkJCWJpYXMtZGlzYWJsZTsK
Pj4gKwkJCWlucHV0LWRpc2FibGU7Cj4+ICsJCQlpbnB1dC1zY2htaXR0LWRpc2FibGU7Cj4+ICsJ
CQlzbGV3LXJhdGUgPSA8MD47Cj4+ICsJCX07Cj4+ICsJfTsKPj4gK307Cj4+ICsKPj4gICAmdXNi
MCB7Cj4+IC0JZHJfbW9kZSA9ICJwZXJpcGhlcmFsIjsKPj4gKwlkcl9tb2RlID0gImhvc3QiOwo+
PiArCXBpbmN0cmwtbmFtZXMgPSAiZGVmYXVsdCI7Cj4+ICsJcGluY3RybC0wID0gPCZ1c2IwX3Bp
bnM+Owo+PiAgIAlzdGF0dXMgPSAib2theSI7Cj4+ICAgfTsKPj4gLS0KPj4gMi40NS4yCj4+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
