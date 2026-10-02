Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CDC5CA5FC4
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Oct 2026 07:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Reply-To:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date
	:From:In-Reply-To:References:MIME-Version:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nTIZJN5TNvWubpR1cH/eKF8V/nPPNIzigiIH6K7SdKY=; b=Ya5hMBD/Xh2rXq
	apw8BNj5GFe3HoTefRXMiaE7E5cfdZ+tUTjDSi2T5KgqnHlB7Fl4OOxmhFi5L8lW+rVao36JIRyPg
	midnrIMHZ1cwDJDPJ79SRoh3lFwp4LRpFvc7sX7y8qxLedzo0RGGiHuHYT/gR8YIjjUp5yC4yiHlz
	i8Dx37qop+zaqydZSmigfJcrXrZu0BmsIjoncNP3QXOMkex+aM6FKZqYtvXnCI3i389i7Rn7hXjyL
	w7RTQRuKwPwI2XWfLuLrJwd3pfRtHJjPAqXJt3gLYSULfFp4PcZgGw0QcnJ4hQ51ZZoPIIJ3Rg/F6
	qeTv9W3F9NqNUCQhhYeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY2F-0000000AuTW-0M9D;
	Fri, 02 Oct 2026 07:50:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCY2E-0000000AuTJ-1cjA
	for linux-riscv@lists.infradead.org;
	Fri, 02 Oct 2026 07:50:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED62443C74
	for <linux-riscv@lists.infradead.org>; Fri,  2 Oct 2026 07:50:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 903E61F008A3
	for <linux-riscv@lists.infradead.org>; Fri,  2 Oct 2026 07:50:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790927425;
	bh=Uuw9YcGk9lfdEVRwjqrzUmYDlAJl7TAqXFgwWW6Q8r8=;
	h=References:In-Reply-To:Reply-To:From:Date:Subject:To:Cc;
	b=opAULVzserwDb623yWkTcdiUML85+eUnznNSm2bz9BbqvYiGAwrYmMs4N5G3AI2Do
	 SRosiiL4LqIJdn0j+5KRGCF1G3rI/z7WcudA0XxY2wuaOUQNGF8GzuhELil6VrQcbJ
	 v+TtUe+v2C1s+wtC3hMFSXsxHqN1FKtST0gYH+D7h7EmZfo0fHDxSX+eIdcwsLqHnu
	 EFnpu+wg5W/KoHhGajA0x9yUeS5bjGFxqyZsD6terQGNrPrL27SuXwsYIg196Tt1fC
	 XqubiQjLbY8o+gzwBYblVy+/WkIt0LHmaHO2rXQrKBashx7FIBhHhrwuY19KS9LYe9
	 12slgzEAXYrqA==
Received: by mail-lr2-f34.google.com with SMTP id 38308e7fff4ca-3a783ec301dso13403561fa.1
        for <linux-riscv@lists.infradead.org>; Fri, 02 Oct 2026 00:50:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw7x2U9s8Z5UdqyIzC/7x7fEOjupWIGQM2RDhQBktxw2ptKsjZPeKMEBz0JvN8UNRH8xxc3eAjDtNBSfQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYJRrR6S/1FLNesb99kAPV//j5/mP/C0a2aZIuxSZvIp8neC0M1j
	1zpjPfvLnUNW/epwQVRoEn8olX3z5dnsJFbff2+PKl0ZFLY+kKCg2kkPpZBpmsc8GkjbwvZTNkE
	VlRy3Ca4/o0OEtqQGE+Gt/bOkH0gxIFM=
X-Received: by 2002:a05:651c:a107:10b0:3a3:74b9:8a79 with SMTP id
 38308e7fff4ca-3a8877f2af4mr3028011fa.18.1790927423980; Fri, 02 Oct 2026
 00:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20260927025626.69614-1-tien.nguyenminh@embeddedlinux.blog>
 <20260927025626.69614-4-tien.nguyenminh@embeddedlinux.blog>
 <20260927132707.5f484946@posteo.net> <20260930130221.129529-1-tien.nguyenminh@embeddedlinux.blog>
 <20260930160541.040ccc0e@posteo.net> <20261002-matted-tux-5b4059bc305a@wendy> <20261002094816.64349979@posteo.net>
In-Reply-To: <20261002094816.64349979@posteo.net>
From: Chen-Yu Tsai <wens@kernel.org>
Date: Fri, 2 Oct 2026 15:50:08 +0800
X-Gmail-Original-Message-ID: <CAGb2v65YP7WM-FKKJJuEpGWO3xyY1KAhWjw39hgHE=Ns2a0zzw@mail.gmail.com>
X-Gm-Features: AclHuK_HVE57bDVsQlmhG-VM5VBilmJ8qnl2ozGwoiccAzLaGGbOy91FR-N2-UM
Message-ID: <CAGb2v65YP7WM-FKKJJuEpGWO3xyY1KAhWjw39hgHE=Ns2a0zzw@mail.gmail.com>
Subject: Re: [PATCH 3/3] riscv: dts: allwinner: d1-t113: Add the hardware spinlock
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Nguyen Minh Tien <tien.nguyenminh@embeddedlinux.blog>, Bjorn Andersson <andersson@kernel.org>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Andre Przywara <andre.przywara@arm.com>, Bastian Germann <bage@debian.org>, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
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
Reply-To: wens@kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMiwgMjAyNiBhdCAzOjQ44oCvUE0gV2lsa2VuIEdvdHR3YWx0Cjx3aWxrZW4u
Z290dHdhbHRAcG9zdGVvLm5ldD4gd3JvdGU6Cj4KPiBPbiBGcmksIDIgT2N0IDIwMjYgMDg6MzI6
NTEgKzAxMDAKPiBDb25vciBEb29sZXkgPGNvbm9yLmRvb2xleUBtaWNyb2NoaXAuY29tPiB3cm90
ZToKPgo+ID4gT24gV2VkLCBTZXAgMzAsIDIwMjYgYXQgMDI6MDU6NDdQTSArMDAwMCwgV2lsa2Vu
IEdvdHR3YWx0IHdyb3RlOgo+ID4gPiBPbiBXZWQsIDMwIFNlcCAyMDI2IDIwOjAyOjIxICswNzAw
Cj4gPiA+IE5ndXllbiBNaW5oIFRpZW4gPHRpZW4ubmd1eWVubWluaEBlbWJlZGRlZGxpbnV4LmJs
b2c+IHdyb3RlOgo+ID4gPgo+ID4gPiA+IEhpIFdpbGtlbiwKPiA+ID4gPgo+ID4gPiA+ID4gV291
bGRuJ3QgaXQgbWFrZSBtb3JlIHNlbnNlIHRvIGFkZCB0aGUgImFsbHdpbm5lcixzdW4yMGktZDEt
aHdzcGlubG9jayIgbGluZSB0bwo+ID4gPiA+ID4gdGhlIGRyaXZlciBpbiB0aGUgc3VuNmlfaHdz
cGlubG9ja19pZHMgc3RydWN0LCBkcm9wCj4gPiA+ID4gPiAiYWxsd2lubmVyLHN1bjZpLWEzMS1o
d3NwaW5sb2NrIiBoZXJlIGluIHRoZSBEMSBkZXZpY2UgdHJlZSBhbmQgdXBkYXRlIHRoZSB5YW1s
Cj4gPiA+ID4gPiBmaWxlIGFjY29yZGluZ2x5Pwo+ID4gPiA+Cj4gPiA+ID4gVGhhbmtzIGZvciBs
b29raW5nIGF0IGl0LiBCam9ybiBoYXNuJ3QgcmVwbGllZCB5ZXQsIHNvIEkgbG9va2VkIGEgYml0
Cj4gPiA+ID4gbW9yZSBhdCB0aGUgbmFtaW5nLiBJJ2QgbGlrZSB0byBrZWVwIHRoZSBBMzEgZmFs
bGJhY2s6IGl0J3MgdGhlIHVzdWFsCj4gPiA+ID4gcGF0dGVybiwgb3RoZXIgYmxvY2tzIGluIHRo
aXMgZHRzaSBkbyB0aGUgc2FtZSAodGltZXIsIEkyUywgTEVECj4gPiA+ID4gY29udHJvbGxlciks
IGFuZCBDb25vciBhbHJlYWR5IGFja2VkIHRoZSBiaW5kaW5nIGluIDIvMy4gSWYgQmpvcm4KPiA+
ID4gPiBwcmVmZXJzIGEgZHJpdmVyIGVudHJ5IGluc3RlYWQsIEknbSBmaW5lIHRvIGNoYW5nZSBp
dC4KPiA+ID4KPiA+ID4gWWVhaCwgQ29ub3Igd2FzIGEgYml0IHF1aWNrIHRvIGFjdCBoZXJlLCBz
dWNoIHRoaW5ncyBoYXBwZW4gb2Z0ZW4gd2l0aCBwYXRjaHNldHMKPiA+ID4gbWFkZSBvdXQgb2Yg
ZG9jdW1lbnRhdGlvbi9kZXZpY2V0cmVlcyBhbmQgY29kZS4gVGhvdWdoLCB0aGUgZ2V0IGNsb2Nr
IGFuZCByZXNldHMKPiA+ID4gcGF0Y2ggaXMgZmluZS4gVGhlIGRyaXZlciBjb3VsZCB1c2Ugc29t
ZSBtb2Rlcm5pemF0aW9uLgo+ID4KPiA+IEkgZHVubm8sIHdhcyBJIHRvbyBxdWljayB0byBhY3Q/
IFRoZSBwYXRjaGVkIGxvb2tlZCBjb3JyZWN0IHRvIG1lLCBzaW5jZQo+ID4gaXQgd2FzIHVzaW5n
IGEgZmFsbGJhY2sgdG8gYSBkZXZpY2UgdGhhdCBpdCBhcHBlYXJzIHRvIGJlIGNvbXBhdGlibGUK
PiA+IHdpdGguIEhhZCB0aGUgc2VyaWVzIGRvbmUgd2hhdCB5b3UncmUgc3VnZ2VzdGluZywgbXkg
cmV2aWV3IGZlZWRiYWNrCj4gPiB3b3VsZCBoYXZlIGJlZW4gdG8gdGVsbCB0aGUgVGllbiB0byBh
ZGQgYSBmYWxsYmFjay4KPgo+IEknbSBqdXN0IG5vdCBzdXJlIGhvdyB0byBhY3R1YWxseSBkbyBp
dCByaWdodCwgYmVjYXVzZSBzbyBtYW55IFNvQ3MgaW5jbHVkZSB0aGF0Cj4gZmVhdHVyZS4gVGhh
dCBpcyB3aHkgSSBhc2tlZCBob3cgeW91IHdvdWxkIGRvIGl0IGhhdmluZyBtb3JlIGluc2lnaHQg
YXMgYQo+IHN1YnN5c3RlbSBtYWludGFpbmVyLiBJdCBqdXN0IGxvb2tzIGluY29tcGxldGUgdG8g
bWUuIEluIHRoZSBwYXN0IEkgYWN0dWFsbHkKPiB2ZXJpZmllZCBpdCB3b3JraW5nIHdpdGggSDIs
IEgyKyBhbmQgSDMsIG5vbmUgb2YgdGhlbSBiZWluZwo+ICJhbGx3aW5uZXIsc3VuNmktYTMxLWh3
c3BpbmxvY2siLgoKRXZlbiBpZiBhbGwgdGhlIFNvQ3MgaGFkIHRoZW0sIGlmIG5vIG9uZSBlbmFi
bGVkIGFuZCB0ZXN0ZWQgdGhlbSwgdGhlbiB0aGV5CndvdWxkbid0IGhhdmUgZW50cmllcyBpbiB0
aGUgYmluZGluZyBvciBkdHNpIGZpbGVzLgoKPiA+ID4gPiBCam9ybiwgd2hhdCBkbyB5b3UgdGhp
bms/IEp1c3Qgc3RheSB3aXRoIHRoZSAiYWxsd2lubmVyLHN1bjZpLWEzMS1od3NwaW5sb2NrIgo+
ID4gPiA+IHN0cmluZyBvciBhZGQgYWxsIHRoZSBwb3NzaWJsZSBjb21iaW5hdGlvbnMgbGlrZQo+
ID4gPiA+ICJhbGx3aW5uZXIsc3VuOGktaDItcGx1cy1od3NwaW5sb2NrIiBvciAiYWxsd2lubmVy
LHN1bjhpLWE4M3QtaHdzcGlubG9jayIuCj4gPiA+ID4gSSBtZWFuLCBpdCBpcyBqdXN0IGEgbmFt
aW5nIGdhbWUgYW5kIHRoZXJlIGFyZSAxMCsgU29DcyBzdXBwb3J0aW5nIHRoaXMKPiA+ID4gPiBz
cGlubG9jayByZWdpc3RlciBmaWxlCj4gPgo+ID4gQWxsIGRldmljZXMgY29tcGF0aWJsZSB3aXRo
IHRoZSBhMzEgc2hvdWxkIHVzZSB0aGUgYTMxIGFzIGEgZmFsbGJhY2suCj4gPgo+ID4gPgo+ID4g
PiA+ID4gT2gsIGFuZCBJIG1heSBiZSBhYmxlIHRvIHRlc3QgaXQgYWdhaW5zdCB0aGUgRDEsIEkg
b3duIGEgU2lwZWVkIE5lemhhLgo+ID4gPiA+Cj4gPiA+ID4gVGhhdCB3b3VsZCBiZSBncmVhdC4g
WW91IGRvbid0IG5lZWQgRnJlZVJUT1MgZm9yIGl0OiBJIHRlc3RlZCB3aXRoIGEKPiA+ID4gPiBz
bWFsbCBMaW51eCBtb2R1bGUgdGhhdCB0YWtlcyBlYWNoIGxvY2sgYW5kIGNoZWNrcyB0aGUgc3Rh
dHVzCj4gPiA+ID4gcmVnaXN0ZXIuIEkgY2FuIGNsZWFuIGl0IHVwIGZvciB0aGUgc2luZ2xlLWNv
cmUgRDEgYW5kIHNlbmQgaXQuCj4gPiA+Cj4gPiA+IFVobSwgdGhlIExpbnV4LW9ubHkgdGVzdCBk
b2Vzbid0IHdvcmsgYXMgYSBod3NwaW5sb2NrIHRlc3QsIGl0IG1pc3NlcyB0aGUgZW50aXJlCj4g
PiA+IHBvaW50IG9mIHRoZSBwcmltaXRpdmUuIEEgaHdzcGlubG9jayBhcmJpdHJhdGVzIGJldHdl
ZW4gdHdvIGluZGVwZW5kZW50IGFnZW50cywKPiA+ID4gaW4gdGhpcyBjYXNlLCBMaW51eCBydW5u
aW5nIG9uIHRoZSBDOTA2IGNvcmUgYW5kIEZyZWVSVE9TIHJ1bm5pbmcgb24gdGhlIEhpRmkKPiA+
ID4gRFNQLCBib3RoIHNoYXJpbmcgdGhlIHNhbWUgbWVtb3J5IGJ1cyBhbmQgb3RoZXIgaGFyZHdh
cmUuIElmIExpbnV4IGlzIHRoZSBvbmx5Cj4gPiA+IG9uZSB3aG8gZXZlciB0YWtlcyB0aGUgbG9j
a3MsIGl0IGlzIHNpbXVsdGFuZW91c2x5IHdyaXRlciBhbmQgcmVhZGVyIG9mIHRoZSBzdGF0dXMK
PiA+ID4gcmVnaXN0ZXIsIHNvIHRoZSB0ZXN0IGNhbm5vdCBmYWlsIGV2ZW4gZm9yIGEgYnJva2Vu
IChvciBmYWtlKSBpbXBsZW1lbnRhdGlvbi4gVGhhdAo+ID4gPiB3b3VsZCBiYXNpY2FsbHkgdGVz
dCBub3RoaW5nIGF0IGFsbCwgd2VsbCwgbWF5YmUgaXQgd291bGQgYmUgc29tZSBraW5kIG9mIGJy
aW5nLXVwCj4gPiA+IHRlc3QsIGJ1dCBvdmVyYWxsIHF1aXRlIHVzZWxlc3MuCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5n
IGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFk
ZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
