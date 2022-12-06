Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FCFEC3A5A7
	for <linux-riscv@archiver.kernel.org>; Tue,  6 Dec 2022 06:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=eCDM+XGvGiqNVqL+gPCE4OFiu2j3Ez17cL6dA97iVSI=; b=YJbBUSLM1jskro
	bxNYioydoCh8TzNKqdCiP0Fo1KDrsdxHfxyEaGDGN30BN9FUu/447Ttqv9C6WXT4TLSydcs0a2y/F
	Gk3vLh/RcmHeAfIkbO/uqFfuNljL8waZd9rdsgJnnYBDYRRrHPR9frr7WH5hLIBRva6z+98X9NhWH
	XFWpmBhdeJEptvuBqFfBoXEcZpe8S0+xhFdROzqhjaggVfdSqbn/UF2iu9oGFXXgi+gmIi2ZDBryE
	5pK/oig+Byp2PgfbfM0bc01DTTwPqAtqhQ0wgYn6RAAwbkdyy9TVjCAL4ffBeA5y278jY/AqNbb/E
	7AGfLHkzOrw/akJDGE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RW7-002BOx-Rw; Tue, 06 Dec 2022 06:33:23 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2RW4-002BLV-Dp
	for linux-riscv@lists.infradead.org; Tue, 06 Dec 2022 06:33:22 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 075FBB81615;
	Tue,  6 Dec 2022 06:33:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01EB0C433D6;
	Tue,  6 Dec 2022 06:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670308396;
	bh=EDB501nrhkqSiyDdVoSm8DT/Z0wlMc5J7EKvKmO5Ap0=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=j8t/3vQg3aak8yu64eOB42ZeADSUk4T6L5Rj5cTlwzp59/Tp/tRrySYfBHaA/hcvc
	 ciRG3yCuLTqoRfQRRhCwjB2LcQt1B+jFWRC7EnRotqSNW0m928DMnTNO9zarktepEN
	 holI3b+sJd5SBscz08+lQgq6XBYtV5icWpWv15YUHPc7ymyl0ZRQ5NynHGxI+yz4kL
	 OVthxMnm1Dzoora5ru14VsxRwjyEDniwK+ntexaoHqef7R9lNS99UkvwC2lODlyxiu
	 7s6Ew9T5wZiojtyf8rMJXAxbrEghJLOJ2Itob4DoehppodBp0MiYv9xvbHOSHBatjW
	 rdqU8M32Kp3TA==
Date: Tue, 06 Dec 2022 06:33:13 +0000
From: Conor Dooley <conor@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>, Conor Dooley <conor.dooley@microchip.com>
CC: Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Marc Zyngier <maz@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Jisheng Zhang <jszhang@kernel.org>, Samuel Holland <samuel@sholland.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_2/3=5D_dt-bindings=3A_timer=3A_si?= =?US-ASCII?Q?five=2Cclint=3A_add_compatible_for_OpenC906?=
User-Agent: K-9 Mail for Android
In-Reply-To: <86d822f73f6e61c9f286e800db50e9959aef05a0.camel@icenowy.me>
References: <20221121041757.418645-3-uwu@icenowy.me> <98005150-83a7-5439-0db1-d93d459c3809@linaro.org> <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me> <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org> <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me> <20221130181330.GA2544489-robh@kernel.org> <Y4j+Gpptk3NAFBNV@spud> <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me> <Y43Jt3YOSbFyh954@wendy> <75a3ef9a175b16c46b57b2829ecbe4f97737de8a.camel@icenowy.me> <Y44IoC765yztZ6VF@wendy> <879345cd8609cddccbf7bcf230923139af320b17.camel@icenowy.me> <B1B2FC9D-D971-435B-A9FD-B092DE726367@kernel.org> <86d822f73f6e61c9f286e800db50e9959aef05a0.camel@icenowy.me>
Message-ID: <04BFA351-92E6-442F-B065-9C287C174A0E@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_223320_778962_C2AA3EA1 
X-CRM114-Status: GOOD (  37.78  )
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

CgpPbiA2IERlY2VtYmVyIDIwMjIgMDM6NDY6MTEgR01ULCBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4gd3JvdGU6Cj7lnKggMjAyMi0xMi0wNeaYn+acn+S4gOeahCAxNjo1NCArMDAwMO+8
jENvbm9yIERvb2xleeWGmemBk++8mgo+PiAKPj4gCj4+IE9uIDUgRGVjZW1iZXIgMjAyMiAxNTo1
OTo0NCBHTVQsIEljZW5vd3kgWmhlbmcgPHV3dUBpY2Vub3d5Lm1lPgo+PiB3cm90ZToKPj4gPiDl
nKggMjAyMi0xMi0wNeaYn+acn+S4gOeahCAxNTowNSArMDAwMO+8jENvbm9yIERvb2xleeWGmemB
k++8mgo+PiA+ID4gT24gTW9uLCBEZWMgMDUsIDIwMjIgYXQgMDc6MDM6MTdQTSArMDgwMCwgSWNl
bm93eSBaaGVuZyB3cm90ZToKPj4gPiA+ID4g5ZyoIDIwMjItMTItMDXmmJ/mnJ/kuIDnmoQgMTA6
MzYgKzAwMDDvvIxDb25vciBEb29sZXnlhpnpgZPvvJoKPj4gPiA+IAo+PiA+ID4gPiA+IFlvdSBs
b3QgYWxsIGtub3cgdGhlIHNpdHVhdGlvbiBoZXJlIGEgbG90IG1vcmUgdGhhbiBJIGRvLi4uCj4+
ID4gPiA+ID4gSSBkb24ndCB0aGluayAibGV0dGluZyIgcGVvcGxlIHVzZSB0aGUgYmFyZSAidGhl
YWQsYzkwMC1mb28iCj4+ID4gPiA+ID4gbWFrZXMKPj4gPiA+ID4gPiBtdWNoCj4+ID4gPiA+ID4g
c2Vuc2UgYXMgaXQgZ2l2ZXMgdXMgbm8gY2hhbmNlIHRvIGRlYWwgd2l0aCBxdWlya3MgZG93biB0
aGUKPj4gPiA+ID4gPiBsaW5lLgo+PiA+ID4gPiAKPj4gPiA+ID4gV2VsbCwgYWZ0ZXIgcmVjaGVj
a2luZyB0aGUgbWFudWFsLCBJIGZvdW5kIGl0IHBvc3NpYmxlIHRvCj4+ID4gPiA+IGhhbmRsZQo+
PiA+ID4gPiBxdWlya3MKPj4gPiA+ID4gLS0gVC1IZWFkIGhhcyBhIGN1c3RvbSAibWNwdWlkIiBD
U1IgKEAgUklTQy1WIENTUiAweEZDMCksIHdoaWNoCj4+ID4gPiA+IGNhbgo+PiA+ID4gPiBiZQo+
PiA+ID4gPiB1c2VkIHRvIHJldHJpZXZlIHNvbWUgaWRlbnRpZmljYXRpb24gaW5mbyBvZiB0aGUg
Y29yZSwKPj4gPiA+ID4gaW5jbHVkaW5nCj4+ID4gPiA+IGl0cwo+PiA+ID4gPiBtb2RlbCBJRCwg
dmVyc2lvbiwgZXRjOyBhbmQgdGhlIFQtSGVhZCBQTElDL0NMSU5UIGFyZSBwYXJ0IG9mCj4+ID4g
PiA+IHRoZWlyCj4+ID4gPiA+IEM5MDYgU29DIGRlc2lnbiB0aGF0IHRoZXJlJ3MgYW5vdGhlciAi
bWFwYmFkZHIiIENTUiB0aGF0IGNvdWxkCj4+ID4gPiA+IGJlCj4+ID4gPiA+IHVzZWQKPj4gPiA+
ID4gdG8gcmV0cmlldmUgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGVtLgo+PiA+ID4gPiAKPj4gPiA+
ID4gU28gSSB0aGluayBpdCBva2F5IHRvIGp1c3QgdXNlICJ0aGVhZCxjOTAwLWNsaW50IiBoZXJl
LCBhbmQKPj4gPiA+ID4gd2hlbgo+PiA+ID4gPiBuZWNlc3NhcnksIHRyeSB0byByZXRyaWV2ZSBt
Y3B1aWQgZm9yIGRlYWxpbmcgd2l0aCBxdWlya3MuCj4+ID4gPiAKPj4gPiA+IEknbSBub3Qgc3Vw
ZXIgc3VyZSBJIGZvbGxvdy4gV2hhdCdzIHRoZSByZWxldmFuY2Ugb2YgIm1hcGJhZGRyIgo+PiA+
ID4gaGVyZT8KPj4gPiA+IFdlJ3ZlIGdvdCBhIHJlZyBwcm9wZXJ0eSwgc28gSSBkb24ndCB0aGlu
ayB3ZSBuZWVkICJtYXBiYWRkciI/Cj4+ID4gCj4+ID4gWWVzLCBpdCdzIG5vdCByZWxldmFudCB0
byB1cyBoZXJlLCBpdCdzIG9ubHkgdG8gcHJvdmUgdGhhdAo+PiA+IFBMSUMvQ0xJTlQKPj4gPiBp
cyBwYXJ0IG9mIEM5MDYgIkNvcmUgQ29tcGxleCIuCj4+ID4gCj4+ID4gPiAKPj4gPiA+IEZvciAi
bWNwdWlkIiwgY2FuIHlvdSBiZSBzdXJlIHRoYXQgaW1wbGVtZW50ZXJzIHdpbGwgbm90IG9taXQK
Pj4gPiA+IHNldHRpbmcKPj4gPiA+IHRoYXQgdmFsdWUgdG8gc29tZXRoaW5nIHVuaXF1ZT8gSSdk
IGJlIGhhcHBpZXIgaWYgd2Ugd2VyZSBvdmVybHkKPj4gPiA+IGNsZWFyCj4+ID4gPiBub3cgcmF0
aGVyIHRoYW4gaGF2ZSBzb21lIGhlYWRhY2hlcyBsYXRlci4gSGF2ZSBJIG1pc3NlZAo+PiA+ID4g
c29tZXRoaW5nPwo+PiA+IAo+PiA+IFRoZXNlIHZhbHVlcyBhcmUgc2V0IGJ5IFQtSGVhZCBpbnN0
ZWFkIG9mIGluZGl2aWR1YWwgU29DCj4+ID4gaW1wbGVtZW50ZXJzCj4+ID4gYXMgYSBDUFUgQ1NS
LCBhbmQgaXQncyBub3QgZm9yIHVuaXF1ZW5lc3MsIGJ1dCBpdCdzIGZvcgo+PiA+IGlkZW50aWZp
Y2F0aW9uCj4+ID4gb2YgdGhlIENQVSBjb3JlIHJldmlzaW9uICh0aHVzIHRoZSBQTElDL0NMSU5U
IHRoYXQgY29tZSB3aXRoIGl0KS4KPj4gCj4+IEkgcmVhbGx5IGFtIG1pc3Npbmcgc29tZXRoaW5n
IGhlcmUgdGhhdCBtdXN0IGJlIG9idmlvdXMgdG8geW91Lgo+PiBMZXQgbWUgdHJ5IGFuZCBleHBs
YWluIHdoZXJlIG15IGdhcCBpbiB1bmRlcnN0YW5kaW5nIGlzLgo+PiBJZiBzb21lb25lIHRha2Vz
IHRoZSBvcGVuIGNvcmVzICYgbWFrZXMgYSBtaW5vciB0d2VhayBpbiB0aGUgcGxpYyBob3cKPj4g
ZG9lcyBrbm93aW5nIG1jcHVpZCBoZWxwIHVzIGlkZW50aWZ5IHRoYXQgdGhhdCBwbGljIGlzIG1h
cmdpbmFsbHkKPj4gZGlmZmVyZW50Pwo+Cj5ObywgYnV0IG15IHBvaW50IGlzIHRoYXQgaW4gdGhp
cyBzaXR1YXRpb24gd2Ugc2hvdWxkbid0IHVzZSBDOTAwCj5jb21wYXRpYmxlIGF0IGFsbCBiZWNh
dXNlIGl0J3Mgbm8gbG9uZ2VyIHRoZSB2YW5pbGxhIEM5MDAgY29yZXMuCj4KPk15IGFzc3VtcHRp
b24gaXMgdGhhdCB0aGUgc2FtZSBJUCBjb3JlcyBhcmUgdGhlIHNhbWUgdW5sZXNzIHNwZWNpYWxs
eQo+Y3VzdG9taXplZC4KCkFoIHNlZSB0aGF0IGlzIGFzc3VtaW5nIHBlb3BsZSBnZXQgaXQgcmln
aHQuCkkndmUgYmVlbiBpbiB0aGUgbWluZHNldCBvZiAid2hhdCBpZiB0aGUgZGlmZmVyZW5jZSBp
cyBvbmx5IG5vdGljZWQgYWZ0ZXIgdGhlIERUIGhhcyBiZWVuIHNoaXBwZWQiLgpJIGd1ZXNzIHRo
YXQncyB3aGVyZSB3ZSd2ZSBiZWVuIGF0IG9kZHMuCgo+Cj4+IAo+PiBJIG11c3QgaGF2ZSBtaXNz
ZWQgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGFwcGFyZW50IGFuZCBsb29rIGxpa2UgYW4KPj4g
ZWVqaXQgcmlnaHQgbm93IQo+PiAKPj4gPiAKPj4gPiA+IAo+PiA+ID4gPiA+IEkgZG9uJ3QgdGhp
bmsgdGhhdCB1c2luZyAidGhlYWQsb3BlbmM5MDYtY2xpbnQiLCAidGhlYWQsYzkwMC0KPj4gPiA+
ID4gPiBjbGludCIKPj4gPiA+ID4gPiBtYWtlcyBhbGwgdGhhdCBtdWNoIHNlbnNlIGVpdGhlciwg
aW4gY2FzZSBzb21lb25lIGRvZXMKPj4gPiA+ID4gPiBzb21ldGhpbmcKPj4gPiA+ID4gPiB3YWNr
eQo+PiA+ID4gPiA+IHdpdGggdGhlIG9wZW4tc291cmNlIHZlcnNpb24gb2YgdGhlIGNvcmUuCj4+
ID4gPiA+ID4gCj4+ID4gPiA+ID4gVGhhdCBsZWF2ZXMgdXMgd2l0aCBlaXRoZXI6Cj4+ID4gPiA+
ID4gInZlbmRvcixzb2MtY2xpbnQiLCAidGhlYWQsb3BlbmM5MDYtY2xpbnQiLCAidGhlYWQsYzkw
MC0KPj4gPiA+ID4gPiBjbGludCIKPj4gPiA+ID4gPiBvcjoKPj4gPiA+ID4gPiAidmVuZG9yLHNv
Yy1jbGludCIsICJ0aGVhZCxjOTAwLWNsaW50Igo+PiA+ID4gPiA+IHJpZ2h0Pwo+PiA+ID4gPiA+
IAo+PiA+ID4gPiA+IFRoZSBmaXJzdCBvbmUgc2VlbXMgbGlrZSBwb3NzaWJseSB0aGUgYmV0dGVy
IG9wdGlvbiBhcyB5b3UnZAo+PiA+ID4gPiA+IGtpbmRhCj4+ID4gPiA+ID4gZXhwZWN0IHRoYXQs
IGluIGEgcGVyZmVjdCB3b3JkLCBhbGwgb2YgdGhlIG9wZW4tc291cmNlIElQCj4+ID4gPiA+ID4g
aW1wbGVtZW50YXRpb25zIHdvdWxkIHNoYXJlIHF1aXJrcyBldGM/Cj4+ID4gPiAKPj4gPiAKPgoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlz
Y3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xp
c3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
