Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8C8C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 16:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Z+YyFpuaPr7fnkhRqIu5I9AVdZc42y1XppRdp8dvUFA=; b=iUYfFPIPHyhbSn
	gsISymksWua7oFrEY2RaeRsaIEGDyTb8CJAjwEd55Dw2VghjorMKhsKQkXVZ42v0HW3qwv0035UGA
	2JKCISxQGuWzMDx3il3LJZthkwXC+wZ+e584SNVwjPrdZkmyYsNZ81ZCMv5mcYGB1A/0EKyJAh1oF
	Vp9TjK5l3AF82kXbgkOHsIP8ppsq+JZhzQmorWBXMKBz3PZrh14YWKNSD/knHJDLVTPJUKKfuj4Me
	S6GY32ikyt+XfbjXMZjtbypIqguw8mUIE0G4fIBdcYyA+LAng4WeuWHkZklQJU2uQwE3Anjw1KB9G
	ZX/5/+P1bTje58CJB8gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Dt4-005rnJ-72; Mon, 05 Dec 2022 16:00:10 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Dsy-005rRe-Cx
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 16:00:05 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670255995; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X7jn62/jMmkCOkK8ufWo0TMcd7RRQ7I9K7spYpLbdiOsmgvJmT1B6e3WyLi2EDUTeQskiuns5dIiA7X6gukJE5+tQGArrA/SsxJZBF71byI+/ojLJE6kgRJKyUffW19+ezDRE2rRI/IXg/i0LGdvx/v1aKLEFcJ97Etx0pdEfVI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670255995; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=0jeaGZv0Hzfrv7zLGvcbO/z3eedPimr2SDOTRFy+Dug=; 
	b=AshApFAwZWnxA/hs0EyF5hJe9b/vhgHB2PCKcVN+VLhpXKr6Irx6uIOVqcu3rf0kuTcHs0dy1zcVzfLZdBFmyluxxj50b7kBLmejSfbQGclbTkQeSd51TPqgYYBGyxHr2FMeCOduww/2ye0I9f4hdwzN/Nh5mAGbijJS4O1q8tw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670255995;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=0jeaGZv0Hzfrv7zLGvcbO/z3eedPimr2SDOTRFy+Dug=;
	b=HsVtg30HP1bgTr/VwFkPcUOGhzTVVu1cQK71xcZm/3/VHcW5QampWsuleBa27Yl2
	WYDJH5Efmi1FNDq6ODJoeDX53NQkpZmP/PHqdT71UHUrp/qhKN9gomD16Kl351x+wB2
	Nm5Rcm9fN491Sz7diMbSQaVJawn6iWG70/WmYPz8=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 1670255993421842.6596337900735; Mon, 5 Dec 2022 07:59:53 -0800 (PST)
Message-ID: <879345cd8609cddccbf7bcf230923139af320b17.camel@icenowy.me>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible
 for OpenC906
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor.dooley@microchip.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, Marc Zyngier
 <maz@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,  Paul Walmsley
 <paul.walmsley@sifive.com>, Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org
Date: Mon, 05 Dec 2022 23:59:44 +0800
In-Reply-To: <Y44IoC765yztZ6VF@wendy>
References: <20221121041757.418645-3-uwu@icenowy.me>
	 <98005150-83a7-5439-0db1-d93d459c3809@linaro.org>
	 <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me>
	 <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org>
	 <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me>
	 <20221130181330.GA2544489-robh@kernel.org> <Y4j+Gpptk3NAFBNV@spud>
	 <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me>
	 <Y43Jt3YOSbFyh954@wendy>
	 <75a3ef9a175b16c46b57b2829ecbe4f97737de8a.camel@icenowy.me>
	 <Y44IoC765yztZ6VF@wendy>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_080004_542713_FAA30D3F 
X-CRM114-Status: GOOD (  24.90  )
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

5ZyoIDIwMjItMTItMDXmmJ/mnJ/kuIDnmoQgMTU6MDUgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiBPbiBNb24sIERlYyAwNSwgMjAyMiBhdCAwNzowMzoxN1BNICswODAwLCBJY2Vub3d5
IFpoZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjItMTItMDXmmJ/mnJ/kuIDnmoQgMTA6MzYgKzAwMDDv
vIxDb25vciBEb29sZXnlhpnpgZPvvJoKPiAKPiA+ID4gWW91IGxvdCBhbGwga25vdyB0aGUgc2l0
dWF0aW9uIGhlcmUgYSBsb3QgbW9yZSB0aGFuIEkgZG8uLi4KPiA+ID4gSSBkb24ndCB0aGluayAi
bGV0dGluZyIgcGVvcGxlIHVzZSB0aGUgYmFyZSAidGhlYWQsYzkwMC1mb28iCj4gPiA+IG1ha2Vz
Cj4gPiA+IG11Y2gKPiA+ID4gc2Vuc2UgYXMgaXQgZ2l2ZXMgdXMgbm8gY2hhbmNlIHRvIGRlYWwg
d2l0aCBxdWlya3MgZG93biB0aGUgbGluZS4KPiA+IAo+ID4gV2VsbCwgYWZ0ZXIgcmVjaGVja2lu
ZyB0aGUgbWFudWFsLCBJIGZvdW5kIGl0IHBvc3NpYmxlIHRvIGhhbmRsZQo+ID4gcXVpcmtzCj4g
PiAtLSBULUhlYWQgaGFzIGEgY3VzdG9tICJtY3B1aWQiIENTUiAoQCBSSVNDLVYgQ1NSIDB4RkMw
KSwgd2hpY2ggY2FuCj4gPiBiZQo+ID4gdXNlZCB0byByZXRyaWV2ZSBzb21lIGlkZW50aWZpY2F0
aW9uIGluZm8gb2YgdGhlIGNvcmUsIGluY2x1ZGluZwo+ID4gaXRzCj4gPiBtb2RlbCBJRCwgdmVy
c2lvbiwgZXRjOyBhbmQgdGhlIFQtSGVhZCBQTElDL0NMSU5UIGFyZSBwYXJ0IG9mIHRoZWlyCj4g
PiBDOTA2IFNvQyBkZXNpZ24gdGhhdCB0aGVyZSdzIGFub3RoZXIgIm1hcGJhZGRyIiBDU1IgdGhh
dCBjb3VsZCBiZQo+ID4gdXNlZAo+ID4gdG8gcmV0cmlldmUgdGhlIGJhc2UgYWRkcmVzcyBvZiB0
aGVtLgo+ID4gCj4gPiBTbyBJIHRoaW5rIGl0IG9rYXkgdG8ganVzdCB1c2UgInRoZWFkLGM5MDAt
Y2xpbnQiIGhlcmUsIGFuZCB3aGVuCj4gPiBuZWNlc3NhcnksIHRyeSB0byByZXRyaWV2ZSBtY3B1
aWQgZm9yIGRlYWxpbmcgd2l0aCBxdWlya3MuCj4gCj4gSSdtIG5vdCBzdXBlciBzdXJlIEkgZm9s
bG93LiBXaGF0J3MgdGhlIHJlbGV2YW5jZSBvZiAibWFwYmFkZHIiIGhlcmU/Cj4gV2UndmUgZ290
IGEgcmVnIHByb3BlcnR5LCBzbyBJIGRvbid0IHRoaW5rIHdlIG5lZWQgIm1hcGJhZGRyIj8KClll
cywgaXQncyBub3QgcmVsZXZhbnQgdG8gdXMgaGVyZSwgaXQncyBvbmx5IHRvIHByb3ZlIHRoYXQg
UExJQy9DTElOVAppcyBwYXJ0IG9mIEM5MDYgIkNvcmUgQ29tcGxleCIuCgo+IAo+IEZvciAibWNw
dWlkIiwgY2FuIHlvdSBiZSBzdXJlIHRoYXQgaW1wbGVtZW50ZXJzIHdpbGwgbm90IG9taXQgc2V0
dGluZwo+IHRoYXQgdmFsdWUgdG8gc29tZXRoaW5nIHVuaXF1ZT8gSSdkIGJlIGhhcHBpZXIgaWYg
d2Ugd2VyZSBvdmVybHkKPiBjbGVhcgo+IG5vdyByYXRoZXIgdGhhbiBoYXZlIHNvbWUgaGVhZGFj
aGVzIGxhdGVyLiBIYXZlIEkgbWlzc2VkIHNvbWV0aGluZz8KClRoZXNlIHZhbHVlcyBhcmUgc2V0
IGJ5IFQtSGVhZCBpbnN0ZWFkIG9mIGluZGl2aWR1YWwgU29DIGltcGxlbWVudGVycwphcyBhIENQ
VSBDU1IsIGFuZCBpdCdzIG5vdCBmb3IgdW5pcXVlbmVzcywgYnV0IGl0J3MgZm9yIGlkZW50aWZp
Y2F0aW9uCm9mIHRoZSBDUFUgY29yZSByZXZpc2lvbiAodGh1cyB0aGUgUExJQy9DTElOVCB0aGF0
IGNvbWUgd2l0aCBpdCkuCgo+IAo+ID4gPiBJIGRvbid0IHRoaW5rIHRoYXQgdXNpbmcgInRoZWFk
LG9wZW5jOTA2LWNsaW50IiwgInRoZWFkLGM5MDAtCj4gPiA+IGNsaW50Igo+ID4gPiBtYWtlcyBh
bGwgdGhhdCBtdWNoIHNlbnNlIGVpdGhlciwgaW4gY2FzZSBzb21lb25lIGRvZXMgc29tZXRoaW5n
Cj4gPiA+IHdhY2t5Cj4gPiA+IHdpdGggdGhlIG9wZW4tc291cmNlIHZlcnNpb24gb2YgdGhlIGNv
cmUuCj4gPiA+IAo+ID4gPiBUaGF0IGxlYXZlcyB1cyB3aXRoIGVpdGhlcjoKPiA+ID4gInZlbmRv
cixzb2MtY2xpbnQiLCAidGhlYWQsb3BlbmM5MDYtY2xpbnQiLCAidGhlYWQsYzkwMC1jbGludCIK
PiA+ID4gb3I6Cj4gPiA+ICJ2ZW5kb3Isc29jLWNsaW50IiwgInRoZWFkLGM5MDAtY2xpbnQiCj4g
PiA+IHJpZ2h0Pwo+ID4gPiAKPiA+ID4gVGhlIGZpcnN0IG9uZSBzZWVtcyBsaWtlIHBvc3NpYmx5
IHRoZSBiZXR0ZXIgb3B0aW9uIGFzIHlvdSdkCj4gPiA+IGtpbmRhCj4gPiA+IGV4cGVjdCB0aGF0
LCBpbiBhIHBlcmZlY3Qgd29yZCwgYWxsIG9mIHRoZSBvcGVuLXNvdXJjZSBJUAo+ID4gPiBpbXBs
ZW1lbnRhdGlvbnMgd291bGQgc2hhcmUgcXVpcmtzIGV0Yz8KPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
