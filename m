Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7500EC4321E
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Dec 2022 16:55:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:References:
	In-Reply-To:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gHtcaZ9Uu/C+taMuy9DZ9d4A7rykMK7Yy2d5Fp2+n3s=; b=zkQLyjx24/DQSy
	RV/qh6EZiUIIqhazTLTpUvuyd/nX4Eqmi10gZK/YUCfcf9+e7wJcp8wamt18kSRKoGkDL1f9Vyg6j
	kYcX6V3UqZ8LXMr5vpfVNQu9pkdyKIn0ImC5ndAbJ86twVGSA2f4Ib0CRxsv2ViJoZ5299wJVBr7/
	Np+iCWWgZXWN8hnZrYh4JYkR/7tvIut1bjL3k933LSLPqa4iyIbF9oZxccOtWOZliWb8F5+atCB/v
	HvK1UJp6dQNRnRLpvwwfu9LHeG2rvNjWvmcYFOBYevU71LlVul1L3hGDEIBDEXpjmyvajIqo+lK9g
	ChKdewpHpPzPRyvkyubA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ek7-0070IX-IG; Mon, 05 Dec 2022 16:54:59 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p2Ek4-00705O-IZ
	for linux-riscv@lists.infradead.org; Mon, 05 Dec 2022 16:54:58 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 12EBFB81147;
	Mon,  5 Dec 2022 16:54:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49641C433C1;
	Mon,  5 Dec 2022 16:54:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670259293;
	bh=8BXqDKQEGhK85bBV9PqvuptFk8jDXft+wx34YVG0dT8=;
	h=Date:From:To:CC:Subject:In-Reply-To:References:From;
	b=JnXgqlzLbN9ScbMN51sTOc1hORuahCUYcmrvyRCfypUj0dSHUxz4WWLbqWQzixEFb
	 Ngznul2rHCClPEsGF5/Hgg3gUaFOojr6uXPic0gqDSoenHv2T8WBbTAqZC14d88RML
	 dDfeBQ24o7fPJKsDDsh86i8oyAezrzEc3ShMP6xFQJLIYdWCuF1dVsDH4PrHaydyzv
	 /U/gHqqzTJWFBigGfb7Yj8+ZLa0o3SWnjGFWh3bQsY2bTr01hj49KQKhf8+e6MS1Yr
	 aRymfrXFJA8m9L7hs0aahq5NhiBpyPk/ODrV+4ILyzzcJNmjUnj39h4QM0p6eFBjrW
	 +aJSI5po+GLGQ==
Date: Mon, 05 Dec 2022 16:54:48 +0000
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
In-Reply-To: <879345cd8609cddccbf7bcf230923139af320b17.camel@icenowy.me>
References: <20221121041757.418645-3-uwu@icenowy.me> <98005150-83a7-5439-0db1-d93d459c3809@linaro.org> <b924d37d716fa8b1fd93102b1d51fac221f43d59.camel@icenowy.me> <d0f3ce4f-5676-f5e1-f04f-dd069679b2d3@linaro.org> <81C2234E-C92D-4F78-8295-7C6DD0A9BBC4@icenowy.me> <20221130181330.GA2544489-robh@kernel.org> <Y4j+Gpptk3NAFBNV@spud> <4ad56fa249a30167844abcedac53d198606511d8.camel@icenowy.me> <Y43Jt3YOSbFyh954@wendy> <75a3ef9a175b16c46b57b2829ecbe4f97737de8a.camel@icenowy.me> <Y44IoC765yztZ6VF@wendy> <879345cd8609cddccbf7bcf230923139af320b17.camel@icenowy.me>
Message-ID: <B1B2FC9D-D971-435B-A9FD-B092DE726367@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221205_085456_926803_AC277371 
X-CRM114-Status: GOOD (  26.79  )
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

CgpPbiA1IERlY2VtYmVyIDIwMjIgMTU6NTk6NDQgR01ULCBJY2Vub3d5IFpoZW5nIDx1d3VAaWNl
bm93eS5tZT4gd3JvdGU6Cj7lnKggMjAyMi0xMi0wNeaYn+acn+S4gOeahCAxNTowNSArMDAwMO+8
jENvbm9yIERvb2xleeWGmemBk++8mgo+PiBPbiBNb24sIERlYyAwNSwgMjAyMiBhdCAwNzowMzox
N1BNICswODAwLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+PiA+IOWcqCAyMDIyLTEyLTA15pif5pyf
5LiA55qEIDEwOjM2ICswMDAw77yMQ29ub3IgRG9vbGV55YaZ6YGT77yaCj4+IAo+PiA+ID4gWW91
IGxvdCBhbGwga25vdyB0aGUgc2l0dWF0aW9uIGhlcmUgYSBsb3QgbW9yZSB0aGFuIEkgZG8uLi4K
Pj4gPiA+IEkgZG9uJ3QgdGhpbmsgImxldHRpbmciIHBlb3BsZSB1c2UgdGhlIGJhcmUgInRoZWFk
LGM5MDAtZm9vIgo+PiA+ID4gbWFrZXMKPj4gPiA+IG11Y2gKPj4gPiA+IHNlbnNlIGFzIGl0IGdp
dmVzIHVzIG5vIGNoYW5jZSB0byBkZWFsIHdpdGggcXVpcmtzIGRvd24gdGhlIGxpbmUuCj4+ID4g
Cj4+ID4gV2VsbCwgYWZ0ZXIgcmVjaGVja2luZyB0aGUgbWFudWFsLCBJIGZvdW5kIGl0IHBvc3Np
YmxlIHRvIGhhbmRsZQo+PiA+IHF1aXJrcwo+PiA+IC0tIFQtSGVhZCBoYXMgYSBjdXN0b20gIm1j
cHVpZCIgQ1NSIChAIFJJU0MtViBDU1IgMHhGQzApLCB3aGljaCBjYW4KPj4gPiBiZQo+PiA+IHVz
ZWQgdG8gcmV0cmlldmUgc29tZSBpZGVudGlmaWNhdGlvbiBpbmZvIG9mIHRoZSBjb3JlLCBpbmNs
dWRpbmcKPj4gPiBpdHMKPj4gPiBtb2RlbCBJRCwgdmVyc2lvbiwgZXRjOyBhbmQgdGhlIFQtSGVh
ZCBQTElDL0NMSU5UIGFyZSBwYXJ0IG9mIHRoZWlyCj4+ID4gQzkwNiBTb0MgZGVzaWduIHRoYXQg
dGhlcmUncyBhbm90aGVyICJtYXBiYWRkciIgQ1NSIHRoYXQgY291bGQgYmUKPj4gPiB1c2VkCj4+
ID4gdG8gcmV0cmlldmUgdGhlIGJhc2UgYWRkcmVzcyBvZiB0aGVtLgo+PiA+IAo+PiA+IFNvIEkg
dGhpbmsgaXQgb2theSB0byBqdXN0IHVzZSAidGhlYWQsYzkwMC1jbGludCIgaGVyZSwgYW5kIHdo
ZW4KPj4gPiBuZWNlc3NhcnksIHRyeSB0byByZXRyaWV2ZSBtY3B1aWQgZm9yIGRlYWxpbmcgd2l0
aCBxdWlya3MuCj4+IAo+PiBJJ20gbm90IHN1cGVyIHN1cmUgSSBmb2xsb3cuIFdoYXQncyB0aGUg
cmVsZXZhbmNlIG9mICJtYXBiYWRkciIgaGVyZT8KPj4gV2UndmUgZ290IGEgcmVnIHByb3BlcnR5
LCBzbyBJIGRvbid0IHRoaW5rIHdlIG5lZWQgIm1hcGJhZGRyIj8KPgo+WWVzLCBpdCdzIG5vdCBy
ZWxldmFudCB0byB1cyBoZXJlLCBpdCdzIG9ubHkgdG8gcHJvdmUgdGhhdCBQTElDL0NMSU5UCj5p
cyBwYXJ0IG9mIEM5MDYgIkNvcmUgQ29tcGxleCIuCj4KPj4gCj4+IEZvciAibWNwdWlkIiwgY2Fu
IHlvdSBiZSBzdXJlIHRoYXQgaW1wbGVtZW50ZXJzIHdpbGwgbm90IG9taXQgc2V0dGluZwo+PiB0
aGF0IHZhbHVlIHRvIHNvbWV0aGluZyB1bmlxdWU/IEknZCBiZSBoYXBwaWVyIGlmIHdlIHdlcmUg
b3Zlcmx5Cj4+IGNsZWFyCj4+IG5vdyByYXRoZXIgdGhhbiBoYXZlIHNvbWUgaGVhZGFjaGVzIGxh
dGVyLiBIYXZlIEkgbWlzc2VkIHNvbWV0aGluZz8KPgo+VGhlc2UgdmFsdWVzIGFyZSBzZXQgYnkg
VC1IZWFkIGluc3RlYWQgb2YgaW5kaXZpZHVhbCBTb0MgaW1wbGVtZW50ZXJzCj5hcyBhIENQVSBD
U1IsIGFuZCBpdCdzIG5vdCBmb3IgdW5pcXVlbmVzcywgYnV0IGl0J3MgZm9yIGlkZW50aWZpY2F0
aW9uCj5vZiB0aGUgQ1BVIGNvcmUgcmV2aXNpb24gKHRodXMgdGhlIFBMSUMvQ0xJTlQgdGhhdCBj
b21lIHdpdGggaXQpLgoKSSByZWFsbHkgYW0gbWlzc2luZyBzb21ldGhpbmcgaGVyZSB0aGF0IG11
c3QgYmUgb2J2aW91cyB0byB5b3UuCkxldCBtZSB0cnkgYW5kIGV4cGxhaW4gd2hlcmUgbXkgZ2Fw
IGluIHVuZGVyc3RhbmRpbmcgaXMuCklmIHNvbWVvbmUgdGFrZXMgdGhlIG9wZW4gY29yZXMgJiBt
YWtlcyBhIG1pbm9yIHR3ZWFrIGluIHRoZSBwbGljIGhvdyBkb2VzIGtub3dpbmcgbWNwdWlkIGhl
bHAgdXMgaWRlbnRpZnkgdGhhdCB0aGF0IHBsaWMgaXMgbWFyZ2luYWxseSBkaWZmZXJlbnQ/CgpJ
IG11c3QgaGF2ZSBtaXNzZWQgc29tZXRoaW5nIHRoYXQgc2hvdWxkIGJlIGFwcGFyZW50IGFuZCBs
b29rIGxpa2UgYW4gZWVqaXQgcmlnaHQgbm93IQoKPgo+PiAKPj4gPiA+IEkgZG9uJ3QgdGhpbmsg
dGhhdCB1c2luZyAidGhlYWQsb3BlbmM5MDYtY2xpbnQiLCAidGhlYWQsYzkwMC0KPj4gPiA+IGNs
aW50Igo+PiA+ID4gbWFrZXMgYWxsIHRoYXQgbXVjaCBzZW5zZSBlaXRoZXIsIGluIGNhc2Ugc29t
ZW9uZSBkb2VzIHNvbWV0aGluZwo+PiA+ID4gd2Fja3kKPj4gPiA+IHdpdGggdGhlIG9wZW4tc291
cmNlIHZlcnNpb24gb2YgdGhlIGNvcmUuCj4+ID4gPiAKPj4gPiA+IFRoYXQgbGVhdmVzIHVzIHdp
dGggZWl0aGVyOgo+PiA+ID4gInZlbmRvcixzb2MtY2xpbnQiLCAidGhlYWQsb3BlbmM5MDYtY2xp
bnQiLCAidGhlYWQsYzkwMC1jbGludCIKPj4gPiA+IG9yOgo+PiA+ID4gInZlbmRvcixzb2MtY2xp
bnQiLCAidGhlYWQsYzkwMC1jbGludCIKPj4gPiA+IHJpZ2h0Pwo+PiA+ID4gCj4+ID4gPiBUaGUg
Zmlyc3Qgb25lIHNlZW1zIGxpa2UgcG9zc2libHkgdGhlIGJldHRlciBvcHRpb24gYXMgeW91J2QK
Pj4gPiA+IGtpbmRhCj4+ID4gPiBleHBlY3QgdGhhdCwgaW4gYSBwZXJmZWN0IHdvcmQsIGFsbCBv
ZiB0aGUgb3Blbi1zb3VyY2UgSVAKPj4gPiA+IGltcGxlbWVudGF0aW9ucyB3b3VsZCBzaGFyZSBx
dWlya3MgZXRjPwo+PiAKPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
