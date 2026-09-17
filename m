Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 092FDC982CF
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Sep 2026 11:23:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HXAe/ykVHI00tAht5xiLr0Z5YqvpbWrt1A/v3wRFnWA=; b=jbUtwgGE0frUMu
	MQgLjLvTnNErUtoFnl3ZnxIzMeyjvG97nC+O1fHexvFXRqs2/kOvBtIxTzGeM8jhyVzN1jqR80IAa
	sjogsXZnZFVBCuwloASUY49KntLHdYIvEbBTqZ3rBSwiNprHuixvCFaQu/+mLT/iqlaxrKLNkTXsm
	dcLZdGY9j6GRZJ4K28gl7lkG6oEOoq2/p0fqyXDgaK6Fn7W39m9sZQuEZDAIiCzdkSkVoEeyL8bal
	C8jJ/mNKn1HxN327DeodEobEInV0HDo7xWA4h588oxn0xxjZZwnYZSvQm093NdjFUj6ExndzyOPJn
	/rF54+hiuxz8RjL1uQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ACc-0000000BB3m-31PV;
	Thu, 17 Sep 2026 11:22:54 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7ACa-0000000BB3B-2uFy
	for linux-riscv@lists.infradead.org;
	Thu, 17 Sep 2026 11:22:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 671954451F
	for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 11:22:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E72F1F008A0
	for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 11:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789644172;
	bh=n6B9j/a1/s4fshEJb5EzFOlgfCFA7frpy0VX2srAiwg=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TXiXYNpabvSqHPTuVy63UzlukAP9rW3YxZn68xoZHUgyHw7UYnxU5Qi1d3+f96V5e
	 F02mqfQ0pDCExHmUmcF5lPKldiyNFr41olfeSh3y5vdzPOBl6Lfag8kwxpbWDNAx44
	 jEG/vybZryl02Mcyxq67Dv/ZEDQHg5WtfNZcWKFzkfVtX71DBRW6BpPJNPm5QJXWi2
	 P7O5MDIxS325W+D7YNh05nZuASiwbgkSVzXKVIo7N3XVcaBq5xwJxetGX2i1IIdrud
	 UWlRlcQdHpj+jW9rLUUxdGWDY1ob+Tv08ZjzavvUVtnsA/cF3qTeyR2azgeb18s3be
	 gvOG0s+xZvzjQ==
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so430313f8f.1
        for <linux-riscv@lists.infradead.org>; Thu, 17 Sep 2026 04:22:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxXHq1mjg0MwuF5xwMGapC7kHP40uWGp2dD/YCCXsi0r9O3AnAmZhcXoyB1gZYFi8MdDIBpFY8w2e4B7w==@lists.infradead.org
X-Gm-Message-State: AFuF++mQV1jKxZ2PFkqwCJv6cXKUSL6jVtMUN9NH5JTLMMrkQLsh3iMi
	Iu7dLEAyTvz+HUQAxNVCwnedhJYvtntfdAwb3r88ktOXxraAZfOfSCYHq3I/C3MbNzHifflvVUi
	Sk1ZTTSqA+iJt9Gq0+6U05oYrKAZQYjA=
X-Received: by 2002:a5d:5c89:0:b0:484:3310:f39b with SMTP id
 ffacd0b85a97d-4870d05a853mr8600400f8f.28.1789644170593; Thu, 17 Sep 2026
 04:22:50 -0700 (PDT)
MIME-Version: 1.0
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org> <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
In-Reply-To: <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
From: Guo Ren <guoren@kernel.org>
Date: Thu, 17 Sep 2026 19:22:36 +0800
X-Gmail-Original-Message-ID: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
X-Gm-Features: AcwNN1VkQt2KJ9LdNhZ0s1HMZyJ-GB0dwEmH64lRQnabSIV5TmddFI50VGPY-Rw
Message-ID: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it consistently
To: Radu Rendec <radu@rendec.net>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Tiffany Lin <tiffany.lin@mediatek.com>, 
	Andrew-CT Chen <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei <houlong.wei@mediatek.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	"tip-bot2 for GUO Ren (XuanTie)" <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
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

T24gTW9uLCBTZXAgMTQsIDIwMjYgYXQgMzo1M+KAr0FNIFJhZHUgUmVuZGVjIDxyYWR1QHJlbmRl
Yy5uZXQ+IHdyb3RlOgo+Cj4gT24gRnJpLCAyMDI2LTA5LTExIGF0IDAzOjI3ICswMDAwLCBHdW8g
UmVuIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgcmVtb3ZlcyB0aGUgaW1wbGljaXQgYXNzdW1wdGlv
biB0aGF0IFJJU0MtViBzdXBwb3J0cyBleGFjdGx5Cj4gPiBlaWdodCBJUEkgbWVzc2FnZSB0eXBl
cy4KPiA+Cj4gPiBDdXJyZW50bHksIHRoZSBTQkksIENMSU5UIGFuZCBBQ0xJTlQgU1NXSSBJUEkg
cHJvdmlkZXJzIHVzZQo+ID4gQklUU19QRVJfQllURSB3aGVuIHNpemluZyB0aGUgZ2VuZXJpYyBJ
UEkgbXV4LCB3aGlsZSBJTVNJQyBjYXJyaWVzIGEKPiA+IHNlcGFyYXRlIElNU0lDX05SX0lQSSBk
ZWZpbml0aW9uIHNldCB0byA4LiBUaGVzZSB2YWx1ZXMgaGFwcGVuIHRvIG1hdGNoCj4gPiBJUElf
TUFYIHRvZGF5LCBidXQgbmVpdGhlciBpcyB0aGUgcHJvcGVyIHNvdXJjZSBvZiB0cnV0aCBmb3Ig
dGhlIG51bWJlcgo+ID4gb2YgUklTQy1WIElQSSBtZXNzYWdlIHR5cGVzLgo+ID4KPiA+IE1vdmUg
ZW51bSBpcGlfbWVzc2FnZV90eXBlIHRvIGFzbS9zbXAuaCBzbyBJUEkgcHJvdmlkZXJzIGNhbiB1
c2UgSVBJX01BWAo+ID4gZGlyZWN0bHksIHRoZW4gcmVwbGFjZSB0aGUgQklUU19QRVJfQllURSBh
bmQgSU1TSUNfTlJfSVBJIHVzZXMgd2l0aAo+ID4gSVBJX01BWC4KPiA+Cj4gPiBUaGlzIGFsc28g
bWFrZXMgYWRkaW5nIGZ1dHVyZSBSSVNDLVYgSVBJIG1lc3NhZ2UgdHlwZXMgaW5kZXBlbmRlbnQg
b2YKPiA+IHRoZSBjdXJyZW50IGVpZ2h0LWVudHJ5IGFzc3VtcHRpb24uCj4gPgo+ID4gQSBmb2xs
b3ctdXAgcGF0Y2ggcmVuYW1lcyB0aGUgTWVkaWFUZWsgVlBVIG1haWxib3ggdGVybWluYXRvciBm
cm9tCj4gPiBJUElfTUFYIHRvIElQSV9WUFVfTUFYLiBUaGF0IHRva2VuIGJlbG9uZ3MgdG8gdGhl
IFZQVSBmaXJtd2FyZSBJUEkgaWQKPiA+IGVudW0gYW5kIHNob3VsZCBmb2xsb3cgdGhlIHNhbWUg
cHJlZml4ZWQgY29udmVudGlvbiBhcyBJUElfVlBVX0lOSVQKPiA+IChhbmQgU0NQX0lQSV9NQVgg
b24gdGhlIFNDUCBzaWRlKSwgaW5zdGVhZCBvZiByZXVzaW5nIHRoZSBnZW5lcmljCj4gPiBJUElf
TUFYIG5hbWUuCj4gPgo+ID4gLS0tCj4gPiBHVU8gUmVuIChYdWFuVGllKSAoNCk6Cj4gPiAgICAg
ICBjbG9ja3NvdXJjZTogY2xpbnQ6IFVzZSBJUElfTUFYIGZvciBJUEkgbXV4aW5nCj4gPiAgICAg
ICBpcnFjaGlwL2FjbGludC1zc3dpOiBVc2UgSVBJX01BWCBmb3IgSVBJIG11eGluZwo+ID4gICAg
ICAgaXJxY2hpcC9pbXNpYzogVXNlIElQSV9NQVggaW5zdGVhZCBvZiBJTVNJQ19OUl9JUEkKPiA+
ICAgICAgIG1lZGlhOiBtdGstdnB1OiByZW5hbWUgSVBJX01BWCB0byBJUElfVlBVX01BWAo+ID4K
PiA+IHRpcC1ib3QyIGZvciBHVU8gUmVuIChYdWFuVGllKSAoMik6Cj4gPiAgICAgICByaXNjdjog
c21wOiBNb3ZlIGVudW0gaXBpX21lc3NhZ2VfdHlwZSB0byBhc20vc21wLmgKPiA+ICAgICAgIHJp
c2N2OiBzYmk6IFVzZSBJUElfTUFYIGZvciBTQkkgSVBJIG11eGluZwo+Cj4gSSBhbSBjb25mdXNl
ZC4gVGhvbWFzIG1lcmdlZCB5b3VyIGVudGlyZSB2MSBzZXJpZXMgYSB3ZWVrIGJlZm9yZSAoc2Vl
Cj4gdGhlIGluZGl2aWR1YWwgcmVwbGllcyBmcm9tIHRpcC1ib3QyQGxpbnV0cm9uaXguZGUpLiBX
aHkgYXJlIHlvdQo+IHNlbmRpbmcgdjI/Cj4KPiBQYXRjaCA2IHdhcyBub3QgaW5jbHVkZWQgaW4g
djEgKGJ1dCBpdCdzIGNsZWFybHkgcmVsYXRlZCksIHNvIHBlcmhhcHMKPiB5b3UgbWVhbnQgdG8g
c2VuZCBvbmx5IHRoaXMgb25lIGFzIGEgc2VwYXJhdGUgcGF0Y2g/Cj4KPiBBbHNvOgo+ICAqIFRo
ZSBjb3ZlciBsZXR0ZXIgc2hvdWxkIGluY2x1ZGUgYSBjaGFuZ2Vsb2csIGluZGljYXRpbmcgd2hh
dCBjaGFuZ2VzCj4gICAgd2VyZSBtYWRlIGluIGVhY2ggdmVyc2lvbiBjb21wYXJlZCB0byB0aGUg
cHJldmlvdXMgb25lLgo+ICAqIFBhdGNoZXMgMSBhbmQgMiBjYXJyeSBhICJGcm9tOiIgdGFnIHRo
YXQgYXR0cmlidXRlcyBhdXRob3JzaGlwIHRvCj4gICAgdGlwLWJvdDIsIHdoaWNoIGlzIHdyb25n
IChpZiB0aGVzZSBwYXRjaGVzIHdlcmUgdG8gYmUgYXBwbGllZCkuCgpTb3JyeSBmb3IgdGhlIG5v
aXNlLCBhbmQgdGhhbmtzIGZvciBjYXRjaGluZyB0aGVzZS4KCllvdSBhcmUgcmlnaHQgb24gYm90
aCBwb2ludHMuIEkgbWlzc2VkIHRoZSBjb3Zlci1sZXR0ZXIgY2hhbmdlbG9nLAphbmQgSSBzaG91
bGQgbm90IGhhdmUgcmVzZW50IHRoZSBhbHJlYWR5LW1lcmdlZCBwYXRjaGVzIGFzIHYyLiBUaGUK
IkZyb206IHRpcC1ib3QyIiB0YWdzIHdlcmUgYWRkZWQgYnkgYjQgYmVjYXVzZSB0aG9zZSB0d28g
cGF0Y2hlcyBoYWQKYWxyZWFkeSBsYW5kZWQ7IHRoYXQgaXMgdXNlZnVsIGFzIGEgcmVtaW5kZXIg
dG8gbWUsIGJ1dCBpdCBzaG91bGQgbm90CmhhdmUgYmVlbiBsZWZ0IGluIHRoZSBwYXRjaGVzIHRo
ZW1zZWx2ZXMuCgpJIHNob3VsZCBoYXZlIHNraXBwZWQgdGhlIGI0IHYyIGZsb3cgYW5kIGp1c3Qg
c2VudCBwYXRjaCA2IG9uIGl0cwpvd24uIFRoZSBvbmx5IHJlbWFpbmluZyBjaGFuZ2UgaXMgdGhl
IG10ay12cHUgSVBJX01BWCByZW5hbWUsIHdoaWNoCmlzIG5lZWRlZCBhZnRlciBJUElfTUFYIGJl
Y2FtZSB2aXNpYmxlIGZyb20gPGFzbS9zbXAuaD4uCgpJZiB5b3UgYXJlIHdpbGxpbmcgdG8gcGlj
ayBwYXRjaCA2IGFzLWlzLCBJIHdvdWxkIGFwcHJlY2lhdGUgaXQuCk90aGVyd2lzZSBJIHdpbGwg
cmVzZW5kIGl0IGFzIGEgc3RhbmRhbG9uZSBwYXRjaC4KCi0tIApCZXN0IFJlZ2FyZHMKIEd1byBS
ZW4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmxpbnV4
LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6
Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlzY3YK
