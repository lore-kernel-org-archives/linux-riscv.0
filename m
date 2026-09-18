Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50963C982D2
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Sep 2026 01:39:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nwVf3tw08y0jh/AXcE5+d3A9GqfHs17k6W+/gXgBs9Q=; b=H5KAArx02ctkbg
	Q7vXovkC/PBbGXm9kpwKGLj9qLojnBArpzYAvTvOlI5/nbPHEbI2YGCX+0L2d60ClTG62dmR277oC
	k/f/9qM9TZYHPMnjkmc9PlhQD4jzeRXJ8glmcxYeTItzuH4WD0VmffZmkFwoNduiCLewMeW3uWVqJ
	CkBy8y0mLCk3lH53cSAwyGl7nGDsSQlKVRrtqNHyRh+0NLdPMlBtsUmKI2N/Uk8OwK8MOSXWHjCCZ
	q2HdTDM1Mwwwcs4Fw2G+04nrWEKlXb7m29IoGP1NQOHLtVMTAWXKWF+tHSExjB6bHZKT9Xg22pFGu
	65j5qEryBWLL9jM3LSCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NYy-0000000DAwq-3atp;
	Fri, 18 Sep 2026 01:38:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7NYx-0000000DAw2-2D1F;
	Fri, 18 Sep 2026 01:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ANSYXhkR59VMjSJxw7ihndcWaAezvhBNEHzaW2IaT8Q=; b=o/q5zSt1Pk4JiweCSLOrFSHYiX
	I9VZIpxLU75lX73oDfm5vtOqjU3cXyrB9RovyV9rhdZXQhRFSoQhP4kn5LP5BVe/vVfh/2YWqwPBx
	V+U9LGSbVRXF4HkBCP9P8qAABkXD4lAPFPNtCMK3bsru4t0SdxDaIZ0zSplBVI2fRXl+u0Xhyf6cp
	8MCfLxvmVorZoEjLD6Qgow5R+/ZbIGY4BPeTHawc33oGpDin0mscK6HumBFjuoGK/hrxPRN/gE6oq
	oBoLW/mjKw7/axzLT6uSQ5ykABEcWK76wVO0uvMQ1SAI9p9awOSWt3IT/ezcz+RGpl4UHUrVG3KcL
	2R4e4Z9w==;
Received: from xs1.mindbit.ro ([80.86.107.70] helo=mail.mindbit.ro)
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x7NYu-00000009U9v-20PT;
	Fri, 18 Sep 2026 01:38:50 +0000
Received: from dog.kanata.rendec.net (pool-174-112-193-187.cpe.net.cable.rogers.com [174.112.193.187])
	by mail.mindbit.ro (Postfix) with ESMTPSA id 7125DCFB00;
	Fri, 18 Sep 2026 04:38:41 +0300 (EEST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.mindbit.ro 7125DCFB00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rendec.net;
	s=default; t=1789695524;
	bh=ANSYXhkR59VMjSJxw7ihndcWaAezvhBNEHzaW2IaT8Q=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=UUFShpgXvfTYmy5brAtO+WcGmV3rDOVegPicqUL9zj5RA97uAyCc0vfhtHnzp/cQH
	 lgeeNGr8EpfgrhVgpHTSVShEQZYxefMGS8F0yRGsV0AMLZEpZTcIUiyPyt1BPurz1T
	 QeL8n0QO4KTZtuGI3Fssf17KVkFYkV94FPUlOU4J3LHfbLCcQE0NnCbtp8LMjIzRPj
	 BkZIf6EYcJINqt5ciNEZvPKrZ8FzR0I3gol01O0FC8usyqs2NjCmZJwrm+34Qg3s6k
	 CPF/2PttvoU63/4X9NEUaoDvenduK8aRmniNzluH4xUpg5/SUNz8Ohjtp4wuKWwiWI
	 1ZPjwGiDMTlLA==
Message-ID: <6a4202752078c5f55882d3a4f5113829201dfb7b.camel@rendec.net>
Subject: Re: [PATCH v2 0/6] riscv: Make IPI_MAX visible and use it
 consistently
From: Radu Rendec <radu@rendec.net>
To: Guo Ren <guoren@kernel.org>, Thomas Gleixner <tglx@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Daniel
 Lezcano	 <daniel.lezcano@kernel.org>, Anup Patel <anup@brainfault.org>,
 Tiffany Lin	 <tiffany.lin@mediatek.com>, Andrew-CT Chen
 <andrew-ct.chen@mediatek.com>,  Yunfei Dong <yunfei.dong@mediatek.com>,
 Minghsiu Tsai <minghsiu.tsai@mediatek.com>, Houlong Wei	
 <houlong.wei@mediatek.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, "tip-bot2 for GUO Ren (XuanTie)"	
 <tip-bot2@linutronix.de>, Nathan Chancellor <nathan@kernel.org>
Date: Thu, 17 Sep 2026 21:38:39 -0400
In-Reply-To: <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
References: <20260911-ipi_max-v2-0-a77826ff189e@kernel.org>
	 <81f0bf10b41dff85872487ab68c750471b7c2f89.camel@rendec.net>
	 <CAJF2gTQZWfvN8c7E3+jcmzD0GqzYKzYO9vLd=eR36azKU1Uq5g@mail.gmail.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_023848_647955_C7D7F035 
X-CRM114-Status: GOOD (  33.76  )
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

T24gVGh1LCAyMDI2LTA5LTE3IGF0IDE5OjIyICswODAwLCBHdW8gUmVuIHdyb3RlOgo+IE9uIE1v
biwgU2VwIDE0LCAyMDI2IGF0IDM6NTPigK9BTSBSYWR1IFJlbmRlYyA8cmFkdUByZW5kZWMubmV0
PiB3cm90ZToKPiA+IAo+ID4gT24gRnJpLCAyMDI2LTA5LTExIGF0IDAzOjI3ICswMDAwLCBHdW8g
UmVuIHdyb3RlOgo+ID4gPiBUaGlzIHNlcmllcyByZW1vdmVzIHRoZSBpbXBsaWNpdCBhc3N1bXB0
aW9uIHRoYXQgUklTQy1WIHN1cHBvcnRzIGV4YWN0bHkKPiA+ID4gZWlnaHQgSVBJIG1lc3NhZ2Ug
dHlwZXMuCj4gPiA+IAo+ID4gPiBDdXJyZW50bHksIHRoZSBTQkksIENMSU5UIGFuZCBBQ0xJTlQg
U1NXSSBJUEkgcHJvdmlkZXJzIHVzZQo+ID4gPiBCSVRTX1BFUl9CWVRFIHdoZW4gc2l6aW5nIHRo
ZSBnZW5lcmljIElQSSBtdXgsIHdoaWxlIElNU0lDIGNhcnJpZXMgYQo+ID4gPiBzZXBhcmF0ZSBJ
TVNJQ19OUl9JUEkgZGVmaW5pdGlvbiBzZXQgdG8gOC4gVGhlc2UgdmFsdWVzIGhhcHBlbiB0byBt
YXRjaAo+ID4gPiBJUElfTUFYIHRvZGF5LCBidXQgbmVpdGhlciBpcyB0aGUgcHJvcGVyIHNvdXJj
ZSBvZiB0cnV0aCBmb3IgdGhlIG51bWJlcgo+ID4gPiBvZiBSSVNDLVYgSVBJIG1lc3NhZ2UgdHlw
ZXMuCj4gPiA+IAo+ID4gPiBNb3ZlIGVudW0gaXBpX21lc3NhZ2VfdHlwZSB0byBhc20vc21wLmgg
c28gSVBJIHByb3ZpZGVycyBjYW4gdXNlIElQSV9NQVgKPiA+ID4gZGlyZWN0bHksIHRoZW4gcmVw
bGFjZSB0aGUgQklUU19QRVJfQllURSBhbmQgSU1TSUNfTlJfSVBJIHVzZXMgd2l0aAo+ID4gPiBJ
UElfTUFYLgo+ID4gPiAKPiA+ID4gVGhpcyBhbHNvIG1ha2VzIGFkZGluZyBmdXR1cmUgUklTQy1W
IElQSSBtZXNzYWdlIHR5cGVzIGluZGVwZW5kZW50IG9mCj4gPiA+IHRoZSBjdXJyZW50IGVpZ2h0
LWVudHJ5IGFzc3VtcHRpb24uCj4gPiA+IAo+ID4gPiBBIGZvbGxvdy11cCBwYXRjaCByZW5hbWVz
IHRoZSBNZWRpYVRlayBWUFUgbWFpbGJveCB0ZXJtaW5hdG9yIGZyb20KPiA+ID4gSVBJX01BWCB0
byBJUElfVlBVX01BWC4gVGhhdCB0b2tlbiBiZWxvbmdzIHRvIHRoZSBWUFUgZmlybXdhcmUgSVBJ
IGlkCj4gPiA+IGVudW0gYW5kIHNob3VsZCBmb2xsb3cgdGhlIHNhbWUgcHJlZml4ZWQgY29udmVu
dGlvbiBhcyBJUElfVlBVX0lOSVQKPiA+ID4gKGFuZCBTQ1BfSVBJX01BWCBvbiB0aGUgU0NQIHNp
ZGUpLCBpbnN0ZWFkIG9mIHJldXNpbmcgdGhlIGdlbmVyaWMKPiA+ID4gSVBJX01BWCBuYW1lLgo+
ID4gPiAKPiA+ID4gLS0tCj4gPiA+IEdVTyBSZW4gKFh1YW5UaWUpICg0KToKPiA+ID4gwqDCoMKg
wqDCoCBjbG9ja3NvdXJjZTogY2xpbnQ6IFVzZSBJUElfTUFYIGZvciBJUEkgbXV4aW5nCj4gPiA+
IMKgwqDCoMKgwqAgaXJxY2hpcC9hY2xpbnQtc3N3aTogVXNlIElQSV9NQVggZm9yIElQSSBtdXhp
bmcKPiA+ID4gwqDCoMKgwqDCoCBpcnFjaGlwL2ltc2ljOiBVc2UgSVBJX01BWCBpbnN0ZWFkIG9m
IElNU0lDX05SX0lQSQo+ID4gPiDCoMKgwqDCoMKgIG1lZGlhOiBtdGstdnB1OiByZW5hbWUgSVBJ
X01BWCB0byBJUElfVlBVX01BWAo+ID4gPiAKPiA+ID4gdGlwLWJvdDIgZm9yIEdVTyBSZW4gKFh1
YW5UaWUpICgyKToKPiA+ID4gwqDCoMKgwqDCoCByaXNjdjogc21wOiBNb3ZlIGVudW0gaXBpX21l
c3NhZ2VfdHlwZSB0byBhc20vc21wLmgKPiA+ID4gwqDCoMKgwqDCoCByaXNjdjogc2JpOiBVc2Ug
SVBJX01BWCBmb3IgU0JJIElQSSBtdXhpbmcKPiA+IAo+ID4gSSBhbSBjb25mdXNlZC4gVGhvbWFz
IG1lcmdlZCB5b3VyIGVudGlyZSB2MSBzZXJpZXMgYSB3ZWVrIGJlZm9yZSAoc2VlCj4gPiB0aGUg
aW5kaXZpZHVhbCByZXBsaWVzIGZyb20gdGlwLWJvdDJAbGludXRyb25peC5kZSkuIFdoeSBhcmUg
eW91Cj4gPiBzZW5kaW5nIHYyPwo+ID4gCj4gPiBQYXRjaCA2IHdhcyBub3QgaW5jbHVkZWQgaW4g
djEgKGJ1dCBpdCdzIGNsZWFybHkgcmVsYXRlZCksIHNvIHBlcmhhcHMKPiA+IHlvdSBtZWFudCB0
byBzZW5kIG9ubHkgdGhpcyBvbmUgYXMgYSBzZXBhcmF0ZSBwYXRjaD8KPiA+IAo+ID4gQWxzbzoK
PiA+IMKgKiBUaGUgY292ZXIgbGV0dGVyIHNob3VsZCBpbmNsdWRlIGEgY2hhbmdlbG9nLCBpbmRp
Y2F0aW5nIHdoYXQgY2hhbmdlcwo+ID4gwqDCoCB3ZXJlIG1hZGUgaW4gZWFjaCB2ZXJzaW9uIGNv
bXBhcmVkIHRvIHRoZSBwcmV2aW91cyBvbmUuCj4gPiDCoCogUGF0Y2hlcyAxIGFuZCAyIGNhcnJ5
IGEgIkZyb206IiB0YWcgdGhhdCBhdHRyaWJ1dGVzIGF1dGhvcnNoaXAgdG8KPiA+IMKgwqAgdGlw
LWJvdDIsIHdoaWNoIGlzIHdyb25nIChpZiB0aGVzZSBwYXRjaGVzIHdlcmUgdG8gYmUgYXBwbGll
ZCkuCj4gCj4gU29ycnkgZm9yIHRoZSBub2lzZSwgYW5kIHRoYW5rcyBmb3IgY2F0Y2hpbmcgdGhl
c2UuCgpObyB3b3JyaWVzIDopCgo+IFlvdSBhcmUgcmlnaHQgb24gYm90aCBwb2ludHMuIEkgbWlz
c2VkIHRoZSBjb3Zlci1sZXR0ZXIgY2hhbmdlbG9nLAo+IGFuZCBJIHNob3VsZCBub3QgaGF2ZSBy
ZXNlbnQgdGhlIGFscmVhZHktbWVyZ2VkIHBhdGNoZXMgYXMgdjIuIFRoZQo+ICJGcm9tOiB0aXAt
Ym90MiIgdGFncyB3ZXJlIGFkZGVkIGJ5IGI0IGJlY2F1c2UgdGhvc2UgdHdvIHBhdGNoZXMgaGFk
Cj4gYWxyZWFkeSBsYW5kZWQ7IHRoYXQgaXMgdXNlZnVsIGFzIGEgcmVtaW5kZXIgdG8gbWUsIGJ1
dCBpdCBzaG91bGQgbm90Cj4gaGF2ZSBiZWVuIGxlZnQgaW4gdGhlIHBhdGNoZXMgdGhlbXNlbHZl
cy4KPiAKPiBJIHNob3VsZCBoYXZlIHNraXBwZWQgdGhlIGI0IHYyIGZsb3cgYW5kIGp1c3Qgc2Vu
dCBwYXRjaCA2IG9uIGl0cwo+IG93bi4gVGhlIG9ubHkgcmVtYWluaW5nIGNoYW5nZSBpcyB0aGUg
bXRrLXZwdSBJUElfTUFYIHJlbmFtZSwgd2hpY2gKPiBpcyBuZWVkZWQgYWZ0ZXIgSVBJX01BWCBi
ZWNhbWUgdmlzaWJsZSBmcm9tIDxhc20vc21wLmg+LgoKVWdoLCBJIG1pc3NlZCB0aGF0IHBhcnQu
IEJlY2F1c2UgdGhlIElQSV9NQVggcmVuYW1lIHdhcyBhbHJlYWR5IHBpY2tlZAp1cCwgaXQncyBn
b2luZyB0byBicmVhayB0aGUgbXRrLXZwdSBkcml2ZXIgdW50aWwgcGF0Y2ggNiBpcyBwaWNrZWQg
dXAKdG9vLgoKPiBJZiB5b3UgYXJlIHdpbGxpbmcgdG8gcGljayBwYXRjaCA2IGFzLWlzLCBJIHdv
dWxkIGFwcHJlY2lhdGUgaXQuCj4gT3RoZXJ3aXNlIEkgd2lsbCByZXNlbmQgaXQgYXMgYSBzdGFu
ZGFsb25lIHBhdGNoLgoKSSBjYW5ub3QgcGljayB1cCBhbnl0aGluZyBteXNlbGYgYmVjYXVzZSBJ
J20ganVzdCBhIHJldmlld2VyLiBCdXQgSQpkb24ndCBzZWUgYW55IHJlYXNvbiB3aHkgcGF0Y2gg
NiBjb3VsZG4ndCBiZSBwaWNrZWQgdXAgYXMtaXMsIGFzIGxvbmcKYXMgZXZlcnlvbmUgaXMgb24g
dGhlIHNhbWUgcGFnZS4gVGhlICJbUEFUQ0ggdjIgNi82XSIgcGFydCBvZiB0aGUKc3ViamVjdCBp
cyBkcm9wcGVkIGFueXdheS4KCkkgbm93IHJlYWxpemUgdGhhdCBwYXRjaCAxICh3aGljaCBpbnRy
b2R1Y2VzIHRoZSBjb25mbGljdGluZyBjaGFuZ2UpCndhcyBwaWNrZWQgdXAgYnkgVGhvbWFzIHZp
YSB0aGUgaXJxL2RyaXZlcnMgdGlwIGJyYW5jaCwgYnV0IHBhdGNoIDYgaXMKc3RyaWN0bHkgYSBt
ZWRpYSBzdWJzeXN0ZW0gcGF0Y2gsIHNvIEkgZ3Vlc3Mgbm9ybWFsbHkgaXQgc2hvdWxkIGJlCnBp
Y2tlZCB1cCBieSBhIGRpZmZlcmVudCBtYWludGFpbmVyIHZpYSBhIGRpZmZlcmVudCB0cmVlLgoK
VGhvbWFzLCBhcmUgeW91IHdpbGxpbmcgdG8gcGljayB0aGlzIHVwIHRvbz8gSSdtIHRoaW5raW5n
IGl0IGNvdWxkCmF2b2lkIHNvbWUgcGFpbiBpZiBpcnEvZHJpdmVycyBnZXRzIG1lcmdlZCBpbnRv
IG1haW5saW5lIGZpcnN0LCBiZWZvcmUKcGF0Y2ggNiBtYWtlcyBpdCB0aGVyZSB0aHJvdWdoIHRo
ZSBtZWRpYSBzdWJzeXN0ZW0uIEFsc28sIGl0J3MgYSBwcmV0dHkKImlubm9jZW50IiBwYXRjaCwg
aXQganVzdCByZW5hbWVzIGFuIGVudW0gdmFsdWUsIGFuZCBpdCdzIGNvbnRhaW5lZAp3aXRoaW4g
dGhhdCBkcml2ZXIuCgotLSAKQmVzdCByZWdhcmRzLApSYWR1CgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGlu
dXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
