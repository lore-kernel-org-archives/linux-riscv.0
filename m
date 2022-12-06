Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B047C3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 03:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FPtHxxyxYagMzNOG0hat05EdqQaOPQd4mRfcvL4gS0E=; b=vyLgK2WLV/xUzO
	ziDbfJLuf4VI/ORZU1Hduwg+9AQFw4IEiCBR4j54cYhHedaqwwG/Hm37MSB0VqQhmq8nEftgqpzb6
	8grPP/K8S60zBpZ0qjZJG/0tuFyUWU5kWDthuaUtsA4Z3THzgk732jb4awM1KXzkXfxPcyZeOpGl1
	LfT+PEEXtaCdO4EgabHI4ExFh0orUQa3I2KlY/eYFIPeMD+2AJcSfKPZCzT+V90Z+UaTbTw5DWVD0
	gO1Oo8cuybsBtwftHb9B24Tb5HqavcoYvhPyjHAnE6Ux4Pn88CphezP2WJeabg6OsW59Ta4UPIUYI
	L1ZFmEl/Y0Ng+m5FalYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ouf-00Guia-A9; Tue, 06 Dec 2022 03:46:33 +0000
Received: from sender4-op-o16.zoho.com ([136.143.188.16])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ouc-00Gub5-1T
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 03:46:31 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1670298379; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XC1UtjX2LLN1wAhTAqR5lvBlUxFgjtWEMAQyx2b9p6kSpOhiItVdMNXvHaEVpT0HOAAGCS5ZFsAYZi4nwXqy2HRnyWkd1fPL2cS4fjRMrpnICM6+X2KkLS/ksdpUJahre6Ie/NNZTx72s0SA0hoz3BjSWEBQSMqYxsgybbyB7yo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1670298379; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
	bh=oesidm6oUL1/85Jw3P7QodTJlckej5INKkfVuimasjg=; 
	b=jihNKGTkRAVr9FFtiB6P2JEC2+wzh8uLH3HGnJ4a7mlpGpQCpg0d/Egp8N07huO3dmEYYIRkaWIN2kKmSn2IM+mF8T5GmsoOri2eMH7zbQyUULA89kEs1tMo6rrt0SZPRXCpggymKpocHu7f/xyNKT2cEwprrVBQuWr0e5dVrKU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1670298379;
	s=zmail; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=oesidm6oUL1/85Jw3P7QodTJlckej5INKkfVuimasjg=;
	b=OXlSY7t2/CNoPLhrqQlD65eqb8fkTZE/AimZRkiRLKq9/0EPw2FKwzlLwvpz5c+9
	TDMkqiazGAVaS2yt0znyMD2bpTOfwqs5FsO7mEn7482h+hitrGHDEqsbJU+d4Zo8xyR
	Vr+aRXwFjAKmHya2tCfvS/U4YGImhAy0bJVmImVA=
Received: from edelgard.fodlan.icenowy.me (120.85.99.143 [120.85.99.143]) by mx.zohomail.com
	with SMTPS id 1670298376821248.54157344971338; Mon, 5 Dec 2022 19:46:16 -0800 (PST)
Message-ID: <86d822f73f6e61c9f286e800db50e9959aef05a0.camel@icenowy.me>
Subject: Re: [PATCH 2/3] dt-bindings: timer: sifive,clint: add compatible
 for OpenC906
From: Icenowy Zheng <uwu@icenowy.me>
To: Conor Dooley <conor@kernel.org>, Conor Dooley
 <conor.dooley@microchip.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski@linaro.org>, Marc Zyngier <maz@kernel.org>, Krzysztof
 Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt
 <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, Daniel
 Lezcano <daniel.lezcano@linaro.org>,  Jisheng Zhang <jszhang@kernel.org>,
 Samuel Holland <samuel@sholland.org>, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Date: Tue, 06 Dec 2022 11:46:11 +0800
In-Reply-To: <B1B2FC9D-D971-435B-A9FD-B092DE726367@kernel.org>
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
	 <879345cd8609cddccbf7bcf230923139af320b17.camel@icenowy.me>
	 <B1B2FC9D-D971-435B-A9FD-B092DE726367@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.44.4 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_194630_169779_2A7274BD 
X-CRM114-Status: GOOD (  36.24  )
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

5ZyoIDIwMjItMTItMDXmmJ/mnJ/kuIDnmoQgMTY6NTQgKzAwMDDvvIxDb25vciBEb29sZXnlhpnp
gZPvvJoKPiAKPiAKPiBPbiA1IERlY2VtYmVyIDIwMjIgMTU6NTk6NDQgR01ULCBJY2Vub3d5IFpo
ZW5nIDx1d3VAaWNlbm93eS5tZT4KPiB3cm90ZToKPiA+IOWcqCAyMDIyLTEyLTA15pif5pyf5LiA
55qEIDE1OjA1ICswMDAw77yMQ29ub3IgRG9vbGV55YaZ6YGT77yaCj4gPiA+IE9uIE1vbiwgRGVj
IDA1LCAyMDIyIGF0IDA3OjAzOjE3UE0gKzA4MDAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+
ID4g5ZyoIDIwMjItMTItMDXmmJ/mnJ/kuIDnmoQgMTA6MzYgKzAwMDDvvIxDb25vciBEb29sZXnl
hpnpgZPvvJoKPiA+ID4gCj4gPiA+ID4gPiBZb3UgbG90IGFsbCBrbm93IHRoZSBzaXR1YXRpb24g
aGVyZSBhIGxvdCBtb3JlIHRoYW4gSSBkby4uLgo+ID4gPiA+ID4gSSBkb24ndCB0aGluayAibGV0
dGluZyIgcGVvcGxlIHVzZSB0aGUgYmFyZSAidGhlYWQsYzkwMC1mb28iCj4gPiA+ID4gPiBtYWtl
cwo+ID4gPiA+ID4gbXVjaAo+ID4gPiA+ID4gc2Vuc2UgYXMgaXQgZ2l2ZXMgdXMgbm8gY2hhbmNl
IHRvIGRlYWwgd2l0aCBxdWlya3MgZG93biB0aGUKPiA+ID4gPiA+IGxpbmUuCj4gPiA+ID4gCj4g
PiA+ID4gV2VsbCwgYWZ0ZXIgcmVjaGVja2luZyB0aGUgbWFudWFsLCBJIGZvdW5kIGl0IHBvc3Np
YmxlIHRvCj4gPiA+ID4gaGFuZGxlCj4gPiA+ID4gcXVpcmtzCj4gPiA+ID4gLS0gVC1IZWFkIGhh
cyBhIGN1c3RvbSAibWNwdWlkIiBDU1IgKEAgUklTQy1WIENTUiAweEZDMCksIHdoaWNoCj4gPiA+
ID4gY2FuCj4gPiA+ID4gYmUKPiA+ID4gPiB1c2VkIHRvIHJldHJpZXZlIHNvbWUgaWRlbnRpZmlj
YXRpb24gaW5mbyBvZiB0aGUgY29yZSwKPiA+ID4gPiBpbmNsdWRpbmcKPiA+ID4gPiBpdHMKPiA+
ID4gPiBtb2RlbCBJRCwgdmVyc2lvbiwgZXRjOyBhbmQgdGhlIFQtSGVhZCBQTElDL0NMSU5UIGFy
ZSBwYXJ0IG9mCj4gPiA+ID4gdGhlaXIKPiA+ID4gPiBDOTA2IFNvQyBkZXNpZ24gdGhhdCB0aGVy
ZSdzIGFub3RoZXIgIm1hcGJhZGRyIiBDU1IgdGhhdCBjb3VsZAo+ID4gPiA+IGJlCj4gPiA+ID4g
dXNlZAo+ID4gPiA+IHRvIHJldHJpZXZlIHRoZSBiYXNlIGFkZHJlc3Mgb2YgdGhlbS4KPiA+ID4g
PiAKPiA+ID4gPiBTbyBJIHRoaW5rIGl0IG9rYXkgdG8ganVzdCB1c2UgInRoZWFkLGM5MDAtY2xp
bnQiIGhlcmUsIGFuZAo+ID4gPiA+IHdoZW4KPiA+ID4gPiBuZWNlc3NhcnksIHRyeSB0byByZXRy
aWV2ZSBtY3B1aWQgZm9yIGRlYWxpbmcgd2l0aCBxdWlya3MuCj4gPiA+IAo+ID4gPiBJJ20gbm90
IHN1cGVyIHN1cmUgSSBmb2xsb3cuIFdoYXQncyB0aGUgcmVsZXZhbmNlIG9mICJtYXBiYWRkciIK
PiA+ID4gaGVyZT8KPiA+ID4gV2UndmUgZ290IGEgcmVnIHByb3BlcnR5LCBzbyBJIGRvbid0IHRo
aW5rIHdlIG5lZWQgIm1hcGJhZGRyIj8KPiA+IAo+ID4gWWVzLCBpdCdzIG5vdCByZWxldmFudCB0
byB1cyBoZXJlLCBpdCdzIG9ubHkgdG8gcHJvdmUgdGhhdAo+ID4gUExJQy9DTElOVAo+ID4gaXMg
cGFydCBvZiBDOTA2ICJDb3JlIENvbXBsZXgiLgo+ID4gCj4gPiA+IAo+ID4gPiBGb3IgIm1jcHVp
ZCIsIGNhbiB5b3UgYmUgc3VyZSB0aGF0IGltcGxlbWVudGVycyB3aWxsIG5vdCBvbWl0Cj4gPiA+
IHNldHRpbmcKPiA+ID4gdGhhdCB2YWx1ZSB0byBzb21ldGhpbmcgdW5pcXVlPyBJJ2QgYmUgaGFw
cGllciBpZiB3ZSB3ZXJlIG92ZXJseQo+ID4gPiBjbGVhcgo+ID4gPiBub3cgcmF0aGVyIHRoYW4g
aGF2ZSBzb21lIGhlYWRhY2hlcyBsYXRlci4gSGF2ZSBJIG1pc3NlZAo+ID4gPiBzb21ldGhpbmc/
Cj4gPiAKPiA+IFRoZXNlIHZhbHVlcyBhcmUgc2V0IGJ5IFQtSGVhZCBpbnN0ZWFkIG9mIGluZGl2
aWR1YWwgU29DCj4gPiBpbXBsZW1lbnRlcnMKPiA+IGFzIGEgQ1BVIENTUiwgYW5kIGl0J3Mgbm90
IGZvciB1bmlxdWVuZXNzLCBidXQgaXQncyBmb3IKPiA+IGlkZW50aWZpY2F0aW9uCj4gPiBvZiB0
aGUgQ1BVIGNvcmUgcmV2aXNpb24gKHRodXMgdGhlIFBMSUMvQ0xJTlQgdGhhdCBjb21lIHdpdGgg
aXQpLgo+IAo+IEkgcmVhbGx5IGFtIG1pc3Npbmcgc29tZXRoaW5nIGhlcmUgdGhhdCBtdXN0IGJl
IG9idmlvdXMgdG8geW91Lgo+IExldCBtZSB0cnkgYW5kIGV4cGxhaW4gd2hlcmUgbXkgZ2FwIGlu
IHVuZGVyc3RhbmRpbmcgaXMuCj4gSWYgc29tZW9uZSB0YWtlcyB0aGUgb3BlbiBjb3JlcyAmIG1h
a2VzIGEgbWlub3IgdHdlYWsgaW4gdGhlIHBsaWMgaG93Cj4gZG9lcyBrbm93aW5nIG1jcHVpZCBo
ZWxwIHVzIGlkZW50aWZ5IHRoYXQgdGhhdCBwbGljIGlzIG1hcmdpbmFsbHkKPiBkaWZmZXJlbnQ/
CgpObywgYnV0IG15IHBvaW50IGlzIHRoYXQgaW4gdGhpcyBzaXR1YXRpb24gd2Ugc2hvdWxkbid0
IHVzZSBDOTAwCmNvbXBhdGlibGUgYXQgYWxsIGJlY2F1c2UgaXQncyBubyBsb25nZXIgdGhlIHZh
bmlsbGEgQzkwMCBjb3Jlcy4KCk15IGFzc3VtcHRpb24gaXMgdGhhdCB0aGUgc2FtZSBJUCBjb3Jl
cyBhcmUgdGhlIHNhbWUgdW5sZXNzIHNwZWNpYWxseQpjdXN0b21pemVkLgoKPiAKPiBJIG11c3Qg
aGF2ZSBtaXNzZWQgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGFwcGFyZW50IGFuZCBsb29rIGxp
a2UgYW4KPiBlZWppdCByaWdodCBub3chCj4gCj4gPiAKPiA+ID4gCj4gPiA+ID4gPiBJIGRvbid0
IHRoaW5rIHRoYXQgdXNpbmcgInRoZWFkLG9wZW5jOTA2LWNsaW50IiwgInRoZWFkLGM5MDAtCj4g
PiA+ID4gPiBjbGludCIKPiA+ID4gPiA+IG1ha2VzIGFsbCB0aGF0IG11Y2ggc2Vuc2UgZWl0aGVy
LCBpbiBjYXNlIHNvbWVvbmUgZG9lcwo+ID4gPiA+ID4gc29tZXRoaW5nCj4gPiA+ID4gPiB3YWNr
eQo+ID4gPiA+ID4gd2l0aCB0aGUgb3Blbi1zb3VyY2UgdmVyc2lvbiBvZiB0aGUgY29yZS4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gVGhhdCBsZWF2ZXMgdXMgd2l0aCBlaXRoZXI6Cj4gPiA+ID4gPiAi
dmVuZG9yLHNvYy1jbGludCIsICJ0aGVhZCxvcGVuYzkwNi1jbGludCIsICJ0aGVhZCxjOTAwLQo+
ID4gPiA+ID4gY2xpbnQiCj4gPiA+ID4gPiBvcjoKPiA+ID4gPiA+ICJ2ZW5kb3Isc29jLWNsaW50
IiwgInRoZWFkLGM5MDAtY2xpbnQiCj4gPiA+ID4gPiByaWdodD8KPiA+ID4gPiA+IAo+ID4gPiA+
ID4gVGhlIGZpcnN0IG9uZSBzZWVtcyBsaWtlIHBvc3NpYmx5IHRoZSBiZXR0ZXIgb3B0aW9uIGFz
IHlvdSdkCj4gPiA+ID4gPiBraW5kYQo+ID4gPiA+ID4gZXhwZWN0IHRoYXQsIGluIGEgcGVyZmVj
dCB3b3JkLCBhbGwgb2YgdGhlIG9wZW4tc291cmNlIElQCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlv
bnMgd291bGQgc2hhcmUgcXVpcmtzIGV0Yz8KPiA+ID4gCj4gPiAKCgpfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QK
bGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
