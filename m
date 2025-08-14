Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61FC6CA0EE3
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Aug 2025 07:42:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mo7uo2BSYqaZr+6EPUZ+WOC7sGwjpKGPM5cia52arxQ=; b=ciq31lguIIknyX
	yBXYOXkhJpmH6C699NiH6CqzO2A/LrGOEaIWYiXurXzHXXKZAq5wjrIKlQ/InRwo/2znWRHVscN7i
	pv2cshuSeu7XrrUPsBVK49AEqhVIx/F580WHGVB0ZdHPrTeb/pC4GL8zVhC9R3JW0AOjGPAD5J98v
	p2AJCzHvONT3mBLv119l+dri+/TLRb/FT5IcP93RfTDBTNh73LE45Tmvqdv1BqJczfBo0cp34tV9w
	j8GWCuAMlXPAuuafTSvQ+4KgjEof68MbdLFo6uIjEmcC0XznTdi69CF+YQTKYzZ1bkQCz2Mx9Z/3X
	qgheaJEbdPECith5pflA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSbC-0000000G7gW-03Md;
	Thu, 14 Aug 2025 07:42:10 +0000
Received: from sender4-op-o15.zoho.com ([136.143.188.15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSPq-0000000G5TH-05hK
	for linux-riscv@lists.infradead.org;
	Thu, 14 Aug 2025 07:30:27 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1755156620; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SPunGYyixl+oELVyQ528XgFQeeYb0rvoaJ+Eu2HDDKE5C33LZsDBVEv1P5SDOCd1wTXRhTyKhZfeKml2gTwJMmLHxe482R2MAp3vNRwF92fRoIrgJvBhNa35WtUgYC29n6Nz+PtKRLCN/rE25olvHrZPEHfczpTMhgi4aMdYdRw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1755156620; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4YKeOCrqfpj59GD3VQlFLFbf1XftNmL9kWn00fco//k=; 
	b=dni2mPhibvReAa3iqkj8KXvzg1rkjJn/AIekKryJPkV65iDi+8nhn0aUW7igXL4pFiryrOZoRy7LFRXEtcI6lIwrdKUDrlb/n2bOiR2p4oPWELAnHbnvutS/oV+QhcGaRvK99LCL28xPOwATd5sTqdvMoptv2Gn2BKHE8APDWnA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1755156620;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=4YKeOCrqfpj59GD3VQlFLFbf1XftNmL9kWn00fco//k=;
	b=JY1R47NfTAyWEMgXmq2J4D+EjiVlWXKVAKLmE1REJkFD3s4LCB4bryCRwEJ2uxG8
	IdkDvO/bF2zGxls4Ws4siFLpOGmamOFCTTbRLHKV3jJOEDqa59XtJAjYFq0F4sx63Mv
	dvoGYfhWlwjX39R5fv3sBp/ZQFz+5J7ijAH00roooEUJOzYSgs2C/KnT2CwTupNxkY8
	vg3QgFF0l4QPFAjMTEcRg7YHGwUPpowCrmtr+UZ5ZLo6xlDme1ObMS8XxE2ag7EEWqV
	tZtw35LE7dy/HThdoyBYmdeJTY5TMrVfeLaPMn5YaXzK+DhFQM5pGdYZXYaLU5+3qt1
	LP0fO4UVMw==
Received: by mx.zohomail.com with SMTPS id 1755156617506124.96455839373789;
	Thu, 14 Aug 2025 00:30:17 -0700 (PDT)
Message-ID: <1b63d1872f5b2c89f2fafdf717bda5ec29589b69.camel@icenowy.me>
Subject: Re: [RFC PATCH 2/4] dt-bindings: firmware: thead,th1520-aon: add a
 mailbox name for SBI
From: Icenowy Zheng <uwu@icenowy.me>
To: Krzysztof Kozlowski <krzk@kernel.org>, Drew Fustini
 <fustini@kernel.org>,  Guo Ren <guoren@kernel.org>, Fu Wei
 <wefu@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Jassi Brar
 <jassisinghbrar@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>
Cc: Han Gao <rabenda.cn@gmail.com>, Inochi Amaoto <inochiama@gmail.com>, Yao
 Zi <ziyao@disroot.org>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 14 Aug 2025 15:30:10 +0800
In-Reply-To: <d0d4c9e7-c350-4996-a53b-09b13bdb9409@kernel.org>
References: <20250814070757.2267325-1-uwu@icenowy.me>
	 <20250814070757.2267325-3-uwu@icenowy.me>
	 <d0d4c9e7-c350-4996-a53b-09b13bdb9409@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_003026_129542_84768314 
X-CRM114-Status: GOOD (  12.29  )
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

5ZyoIDIwMjUtMDgtMTTmmJ/mnJ/lm5vnmoQgMDk6MTggKzAyMDDvvIxLcnp5c3p0b2YgS296bG93
c2tp5YaZ6YGT77yaCj4gT24gMTQvMDgvMjAyNSAwOTowNywgSWNlbm93eSBaaGVuZyB3cm90ZToK
PiA+IFRoZSBTQkkgZmlybXdhcmUgbWlnaHQgd2FudCB0byBjb21tdW5pY2F0ZSB0byB0aGUgQU9O
IGZpcm13YXJlIHRvby4KPiA+IAo+ID4gQWRkIGEgbWJveC1uYW1lIGl0ZW0gdG8gYWxsb3cgdG8g
YWxsb2NhdGUgYSBtYWlsYm94IGZvciBTQkkuCj4gPiAKPiA+IFNpZ25lZC1vZmYtYnk6IEljZW5v
d3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+ID4gLS0tCj4gPiDCoC4uLi9kZXZpY2V0cmVlL2Jp
bmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24ueWFtbMKgwqDCoMKgIHwgNwo+ID4gKysr
Ky0tLQo+ID4gwqAxIGZpbGUgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCspLCAzIGRlbGV0aW9ucygt
KQo+ID4gCj4gPiBkaWZmIC0tZ2l0Cj4gPiBhL0RvY3VtZW50YXRpb24vZGV2aWNldHJlZS9iaW5k
aW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtYW9uLnlhbWwKPiA+IGIvRG9jdW1lbnRhdGlvbi9k
ZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJlL3RoZWFkLHRoMTUyMC1hb24ueWFtbAo+ID4gaW5k
ZXggMzM2NTEyNGM3ZmQ0Ny4uNTU1NDY1ZjRhYWI0ZSAxMDA2NDQKPiA+IC0tLSBhL0RvY3VtZW50
YXRpb24vZGV2aWNldHJlZS9iaW5kaW5ncy9maXJtd2FyZS90aGVhZCx0aDE1MjAtCj4gPiBhb24u
eWFtbAo+ID4gKysrIGIvRG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2Zpcm13YXJl
L3RoZWFkLHRoMTUyMC0KPiA+IGFvbi55YW1sCj4gPiBAQCAtMjYsMTEgKzI2LDEyIEBAIHByb3Bl
cnRpZXM6Cj4gPiDCoMKgwqDCoCBjb25zdDogdGhlYWQsdGgxNTIwLWFvbgo+ID4gwqAKPiA+IMKg
wqAgbWJveGVzOgo+ID4gLcKgwqDCoCBtYXhJdGVtczogMQo+ID4gK8KgwqDCoCBtYXhJdGVtczog
Mgo+IAo+IAo+IEFCSSBicmVhayB3aXRob3V0IGV4cGxhbmF0aW9uIHdoeSAoImFsbG93IiBpcyBu
b3QgYSByZWFzb24gdG8gYWZmZWN0Cj4gQUJJKSBhbmQgaXRzIGltcGFjdC4KCklzIGFkZGluZyBp
dGVtcyBhbiBBQkkgYnJlYWs/CgpPciBzaG91bGQgSSBleHBsaWNpdGx5IHNheSAibWluSXRlbXM6
IDEiIGhlcmU/Cgo+IAo+IAo+IEJlc3QgcmVnYXJkcywKPiBLcnp5c3p0b2YKCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
