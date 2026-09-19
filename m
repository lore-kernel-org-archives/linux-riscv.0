Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2847C982D7
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 23:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xDalRIdfA6dMgOJx3sSuathWPMMZwV8p4TL3vv9IDdI=; b=ECW/8K5rm01HL4
	FK3wsLbR5lUEjnhXhqTeAeLBz3q81eetlP6Vtl8qJcTiDh4pKGNUit1VkZog1D69w9/qJ7ppE9xLv
	RBX4NY6Rlqi62ziiEjQcR6ee+vsFs4K42bdbkcm3pEt0YnDAQ78pACIYLz4KjgMhBiTIsIaiCtYh3
	Dg52Y2h4cePprVyuv93YfT4//2fRuF7I2TVWrfFjinMgvftJOUeBVZGmGMJj8aiVdH2wWb0ues3EU
	5UmoOl3HqzGutyJ7ZlFlsRuiwM7FJ6W9UTRM31fgx0I4Ggm6MJ0dgpf3OVN6iCP6T4pLJ70SR0dMh
	Pp99q4UVdXLVu6EMxlSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x84FV-0000000Gfq2-3wCQ;
	Sat, 19 Sep 2026 23:13:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x84FU-0000000Gfpw-2s5i
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 23:13:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9CDB3436F5;
	Sat, 19 Sep 2026 23:13:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E960B1F000FF;
	Sat, 19 Sep 2026 23:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789859615;
	bh=2Sef/0wxyMwTpjYCRnlB9CgtNUDrbK2hMY8qeX5WdGA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=agsW2GL4vTTRqpy7+o1jwke4n1/xbLd5GX9CLNxEpk/J+J6CA5r6gJkG1jKju+NPm
	 wMOwUqTa8PrIQ5wkmYvByON9AH34njGzQIckoWUQPP6lfYsVH1JubRrXOdrW/fDw1f
	 J2KFvOBBVO/gh08nduHOQAzcOQ9ftbLQRO7OVHCnjhE6vE1wWWV93XFIHgu/NnTaQy
	 bwWdMoTMk2f5hcq3K2BvqZN+6n8vMasxFKOUFPoOB/yX3n73ayxbMRHE+cQ9UhK+Rg
	 2as9+UFbBD1l4QEoqvsNfhlrtSmWN6j5jQbj2zLUJ0MnCtSxGzVIQUE/LcE7liMVkP
	 JWzwOrSYgSyVg==
Date: Sat, 19 Sep 2026 23:13:33 +0000
From: Yixun Lan <dlan@kernel.org>
To: Icenowy Zheng <uwu@icenowy.me>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
Message-ID: <20260919231333-GKB322102@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
 <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
 <20260918230107-GKC297024@kernel.org>
 <33b33b2b79763d410bc2e5b4ef46c305aaf6f7c8.camel@icenowy.me>
 <20260919095936-GKA322102@kernel.org>
 <8301abce221e33d827053c54a64aed05f3227f7f.camel@icenowy.me>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8301abce221e33d827053c54a64aed05f3227f7f.camel@icenowy.me>
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

SGkgSWNlbm93eSwKCk9uIDIxOjU2IFNhdCAxOSBTZXAgICAgICwgSWNlbm93eSBaaGVuZyB3cm90
ZToKPiDlnKggMjAyNi0wOS0xOeWFreeahCAwOTo1OSArMDAwMO+8jFlpeHVuIExhbuWGmemBk++8
mgo+ID4gSGkgSWNlbm93eSwKPiA+IAo+ID4gT24gMTQ6NTcgU2F0IDE5IFNlcMKgwqDCoMKgICwg
SWNlbm93eSBaaGVuZyB3cm90ZToKPiA+ID4g5ZyoIDIwMjYtMDktMTjkupTnmoQgMjM6MDEgKzAw
MDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiA+ID4gPiBIaSBJY2Vub3d5LCAKPiA+ID4gPiAKPiA+
ID4gPiBPbiAxNzowMCBGcmkgMTggU2VwwqDCoMKgwqAgLCBJY2Vub3d5IFpoZW5nIHdyb3RlOgo+
ID4gPiA+ID4g5ZyoIDIwMjYtMDktMTjkupTnmoQgMDI6NDAgKzAwMDDvvIxZaXh1biBMYW7lhpnp
gZPvvJoKPiA+ID4gPiA+ID4gwqAgU3BhY2VtaVQncyBQTVUgKFBvd2VyIE1hbmFnZW1lbnQgVW5p
dCkgY29uc2lzdCBvZiBzZXZlcmFsCj4gPiA+ID4gPiA+IHBvd2VyCj4gPiA+ID4gPiA+IGRvbWFp
bnMKPiA+ID4gPiA+ID4gd2hpY2ggY2FuIGJlIG1hbmFnZWQgaW5kZXBlbmRlbnRseSwgZGVwZW5k
aW5nIG9uIGRpZmZlcmVudAo+ID4gPiA+ID4gPiBhcHBsaWNhdGlvbgo+ID4gPiA+ID4gPiBzY2Vu
YXJpbywgZWFjaCBkb21haW4gY2FuIGJlIHBvd2VyZWQgb24vb2ZmIGZvciBzYXZpbmcgcG93ZXIu
Cj4gPiA+ID4gPiA+IAo+ID4gPiA+ID4gPiDCoCBUaGUgZHJpdmVyIGlzIGltcGxlbWVudGVkIGJh
c2VkIG9uIExpbnV4IEdlbmVyaWMgUE0gRG9tYWluCj4gPiA+ID4gPiA+IGZyYW1ld29yay4KPiA+
ID4gPiA+ID4gRnJvbSBhIGhhcmR3YXJlIHBlcnNwZWN0aXZlLCBlaXRoZXIgb2YgdHdvIGRpc3Rp
bmN0IHBvd2VyLW9uCj4gPiA+ID4gPiA+IHNlcXVlbmNlcwo+ID4gPiA+ID4gPiBhcmUgc3VwcG9y
dGVkLCBpbiBzb2Z0d2FyZSBtb2RlIChTVyBtb2RlKSwgdGhlIGRyaXZlciBpcwo+ID4gPiA+ID4g
PiByZXNwb25zaWJsZQo+ID4gPiA+ID4gPiBmb3IKPiA+ID4gPiA+ID4gY29udHJvbGxpbmcgdGhl
IHN0YXRlcyBvZiBiaXRzIHN1Y2ggYXMgc2xlZXAxLCBzbGVlcDIsCj4gPiA+ID4gPiA+IGlzb2xh
dGlvbgo+ID4gPiA+ID4gPiBhbmQKPiA+ID4gPiA+ID4gcHdyX3N0YXRlLCB3aGlsZSBpbiBoYXJk
d2FyZSBtb2RlIChIVyBtb2RlKSwgdGhlIFBNVSBoYXJkd2FyZQo+ID4gPiA+ID4gPiB3aWxsCj4g
PiA+ID4gPiA+IGNvbXBsZXRlCj4gPiA+ID4gPiA+IHRoZSBzZXF1ZW5jZSBhdXRvbWF0aWNhbGx5
IHdpdGhvdXQgcmVxdWlyaW5nIHNvZnR3YXJlCj4gPiA+ID4gPiA+IGludGVydmVudGlvbi4KPiA+
ID4gPiA+IAo+ID4gPiA+ID4gSSB0aGluayB0aGVyZSBhbHNvIGV4aXN0cyBzb2x1dGlvbnMgZm9y
IEszIHRoYXQgdXNlcyBSUE1JIHBvd2VyCj4gPiA+ID4gPiBkb21haW5zLCBhbmQgbGV0IHRoZWly
IEVTT1MgZmlybXdhcmUgdG8gYWNjZXNzIHRoZSBoYXJkd2FyZS4KPiA+ID4gPiA+IAo+ID4gPiA+
IFllcywgSSdtIGF3YXJlIG9mIHRoYXQKPiA+ID4gPiAKPiA+ID4gPiA+IFdoYXQncyB0aGUgcmVs
YXRpb25zaGlwIG9mIHRoaXMgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgRVNPUwo+ID4gPiA+ID4g
aW1wbGVtZW50YXRpb24/IFNob3VsZCB0aGUgRVNPUyBwYXJ0IGJlIGRpc2FibGVkIHRvIHVzZSB0
aGlzCj4gPiA+ID4gPiBpbXBsZW1lbnRhdGlvbj8KPiA+ID4gPiA+IAo+ID4gPiA+IEkgc2hvdWxk
IHNheSwgaXQncyBhIG11dHVhbGx5IGV4Y2x1c2l2ZSBzb2x1dGlvbiwgc28geWVzLCB0aGUKPiA+
ID4gPiBFU09TCj4gPiA+ID4gcGFydAo+ID4gPiA+IHNob3VsZCBiZSBkaXNhYmxlZCBpbiBvcmRl
ciB0byB1c2UgdGhpcyB2ZXJzaW9uCj4gPiA+ID4gCj4gPiA+ID4gVGhlIG1vdGl2YXRpb24gb2Yg
dGhpcyBwYXRjaCBpcyB0cnlpbmcgdG8gc3VwcG9ydCBkcm0vZGlzcGxheQo+ID4gPiA+IGRyaXZl
cidzCj4gPiA+ID4gUE0gcmVxdWlyZW1lbnQsIHdoaWxlIGF2b2lkIGdvaW5nIHdpdGggdmVuZG9y
J3MgY29tcGxpY2F0ZWQgUlBNSQo+ID4gPiA+IHNvbHV0aW9uCj4gPiA+ID4gd2hpY2ggaXNuJ3Qg
bWFpbmxpbmUgcmVhZHkKPiA+ID4gCj4gPiA+IElzIHRoaXMgYSBsb25nLXRlcm0gc29sdXRpb24s
IG9yIGEgdGVtcG9yYXJ5IG9uZT8KPiA+ID4gCj4gPiBGb3IgdXBzdHJlYW0sIEknZCBzYXkgd2Ug
cHJvYmFibHkgd2lsbCBzdGljayB0byB0aGlzIHNvbHV0aW9uIGZvcgo+ID4gbG9uZyB0aW1lLCB3
b24ndCBzYXkgaXQgJ2ZvcmV2ZXInLCBzZWUgY29tbWVudCBiZWxvdy4uCj4gPiAKPiA+ID4gSWYg
aXQncyBhIHRlbXBvcmFyeSBjb25mbGljdGluZyBvbmUsIEkgZG9uJ3QgdGhpbmsgaXQncyB3b3J0
aAo+ID4gPiBwaWNraW5nCj4gPiA+IGF0IGFsbC4KPiA+ID4gCj4gPiBXZWxsLCBjaGVja2VkIGN1
cnJlbnQgTGludXgga2VybmVsIHN0YXR1cywgdGhlcmUgaXMgbm8gUlBNSSBQTQo+ID4gc29sdXRp
b24gCj4gPiBpbXBsZW1lbnRlZCBhbHRob3VnaCB0aGVyZSBpcyBkb2N1bWVudGF0aW9uIGluIHJp
c2N2LXJwbWkgc3BlY1sxXQo+IAo+IEkgaGF2ZSBzZWVuIHBlbmRpbmcgcGF0Y2ggZm9yIGl0IHdp
dGggbXVsdGlwbGUgcmV2aXNpb25zIFsxXSwgdGhlIGR0Cj4gYmluZGluZyBpcyBldmVuIGFscmVh
ZHkgQUNLZWQgYnkgQ29ub3IsIHNvIEkgdGhpbmsgaXQncyBub3QgYSBiaWcKPiBwcm9ibGVtIGhl
cmUuCj4gClRoYXQncyBleGFjdGx5IHdoYXQgSSBzYWlkIC0gaXQncyBub3QgbWF0dXJlLCBub3Qg
c2F5aW5nIGl0J3MgcGVuZGluZwpwYXRjaCBmb3IgcmV2aWV3LCBidXQgZm9yIHdob2xlIHNvbHV0
aW9uIHRoYXQgaW52b2x2ZSBMaW51eCBkcml2ZXIsCm9wZW5zYmkgYW5kIHVuZGVybHlpbmcgZmlt
d2FyZSAoRVNPUykgLSB3aGljaCBub3QgdXBzdHJlYW0tZWQuLgoKVG8gbWFrZSBpdCBjbGVhciwg
SSdtIG5vdCBnb2luZyB0byBwdXJzdWUgdGhlIFJQTUkgc29sdXRpb24sIGJ1dCBpZgpzb21lb25l
IGluc2lzdCBhbmQgd2lsbGluZyB0byBzcGVuZCB0aGUgZWZmb3J0LCBwbGVhc2UgZmVlbCBmcmVl
IHRvIHB1c2gKCi0tIApZaXh1biBMYW4gKGRsYW4pCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlz
Y3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
