Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D32C982CC
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 06:58:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lWzs7xwLSAbi6vgYngtTX1vtkQYV3jlyw+6Fa4izEqk=; b=p71hqDDVSSe4zX
	3vLRacmOWL81tUxxAl+LzFOQo5AzPC/moMbHbQ69Futpzb5+lGsR4zD3KnXJ05AfjtnJ45RGca55s
	NGAzfrgxUhO216zbrTBkogQ3fDpMDqSvtZgWQcBjeOtVovQq1fgwL775oZS4L2VinnfCdHkE4CMTr
	p6+PfwcTwLnHRuD3ZtEG1gHYAKm0UusU37jV56exHU7DlSs5q088iL9tSNzLrnOtxPkBqI3gff4sk
	PMEog2TKm6iFFgHfZPpZGcnyQmp0eyEi/975omvXBTCka7ieyQwbVJhXifSv1kTAdSr0lj7Cphmjm
	j5lfVEEvmFD3NABPPmyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7p14-0000000G1cs-1kJV;
	Sat, 19 Sep 2026 06:57:42 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7p12-0000000G1bH-1MsP
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 06:57:41 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789801056; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n0F7k2w7VW6EWRhehL503C5goS+g4WXzxQE1Q4WSeMcZ+SQl7TquN8jk00yDaVGfLMt3jcgxPkMCYT6epgtsum8G+FleBEB6sfNASLvZlI7J0xwExrn5RfPKD5Co/m+AJhu3ctQnekwVCx+wbCqWDYXIduZDDmJrGJEczDy3BaY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789801056; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=IdHUg8gZsKG1eK8ddv1bf9KJVpCAWuDGitsqS71bHqY=; 
	b=ThHCOdSDW8ZX5mkA+xL47/XC7XYpL4AAmOIDWiiFybZoQzXC/GpScqKEh2XcyEIMR0NLnEnzajJvO0datpLfesDwUZCjZuQLA3Xg5cTF7J8ATHEq+0CqcPOLnUOf+FUauSwN1ZTPd977GgONqIN2kLTvC5mtK0qqkpA/JP5G0no=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789801056;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=IdHUg8gZsKG1eK8ddv1bf9KJVpCAWuDGitsqS71bHqY=;
	b=ii9TMd7W+t3husvchZhqJ+OsMxmnNSPDkkHH35pmcrXxz1jtG0VBgw04RG/CPffG
	EtF2EUDlWt3+eSLSRsK3pfz3Lkaci+ytI9aJnRMgVa+r5CyreYK3T15dNet90fxsrMG
	47vnjaI8QVajUlMYCIPGILNj66aJMJmxYjHTJ9UwPF5CWP8QKkvDcnbdW/vF1XFxQC2
	x8zMxNuZl6a3gN/eFMXGhbexkCAIqx0fAYFeLlvJHEdGmzmFw5y4w1H5ZBv2G9lp5n2
	7UNQEErodd2Q9XoQdKxbVI+i/M62M1htkrjo3VQK2FN0DRgZOz2kS4Wsrj6zNNuZPW/
	vy0rGsNWbg==
Received: by smtp.zohomail.com with SMTPS id 1789801054439855.651129720259;
	Fri, 18 Sep 2026 23:57:34 -0700 (PDT)
Message-ID: <33b33b2b79763d410bc2e5b4ef46c305aaf6f7c8.camel@icenowy.me>
Subject: Re: [PATCH 2/3] pmdomain: spacemit: Add power domain driver
From: Icenowy Zheng <uwu@icenowy.me>
To: Yixun Lan <dlan@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
  Conor Dooley <conor+dt@kernel.org>, Ulf Hansson <ulfh@kernel.org>, Paul
 Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-pm@vger.kernel.org
Date: Sat, 19 Sep 2026 14:57:28 +0800
In-Reply-To: <20260918230107-GKC297024@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
	 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
	 <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
	 <20260918230107-GKC297024@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260918_235740_428647_56294C3D 
X-CRM114-Status: GOOD (  20.76  )
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

5ZyoIDIwMjYtMDktMTjkupTnmoQgMjM6MDEgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiBI
aSBJY2Vub3d5LCAKPiAKPiBPbiAxNzowMCBGcmkgMTggU2VwwqDCoMKgwqAgLCBJY2Vub3d5IFpo
ZW5nIHdyb3RlOgo+ID4g5ZyoIDIwMjYtMDktMTjkupTnmoQgMDI6NDAgKzAwMDDvvIxZaXh1biBM
YW7lhpnpgZPvvJoKPiA+ID4gwqAgU3BhY2VtaVQncyBQTVUgKFBvd2VyIE1hbmFnZW1lbnQgVW5p
dCkgY29uc2lzdCBvZiBzZXZlcmFsIHBvd2VyCj4gPiA+IGRvbWFpbnMKPiA+ID4gd2hpY2ggY2Fu
IGJlIG1hbmFnZWQgaW5kZXBlbmRlbnRseSwgZGVwZW5kaW5nIG9uIGRpZmZlcmVudAo+ID4gPiBh
cHBsaWNhdGlvbgo+ID4gPiBzY2VuYXJpbywgZWFjaCBkb21haW4gY2FuIGJlIHBvd2VyZWQgb24v
b2ZmIGZvciBzYXZpbmcgcG93ZXIuCj4gPiA+IAo+ID4gPiDCoCBUaGUgZHJpdmVyIGlzIGltcGxl
bWVudGVkIGJhc2VkIG9uIExpbnV4IEdlbmVyaWMgUE0gRG9tYWluCj4gPiA+IGZyYW1ld29yay4K
PiA+ID4gRnJvbSBhIGhhcmR3YXJlIHBlcnNwZWN0aXZlLCBlaXRoZXIgb2YgdHdvIGRpc3RpbmN0
IHBvd2VyLW9uCj4gPiA+IHNlcXVlbmNlcwo+ID4gPiBhcmUgc3VwcG9ydGVkLCBpbiBzb2Z0d2Fy
ZSBtb2RlIChTVyBtb2RlKSwgdGhlIGRyaXZlciBpcwo+ID4gPiByZXNwb25zaWJsZQo+ID4gPiBm
b3IKPiA+ID4gY29udHJvbGxpbmcgdGhlIHN0YXRlcyBvZiBiaXRzIHN1Y2ggYXMgc2xlZXAxLCBz
bGVlcDIsIGlzb2xhdGlvbgo+ID4gPiBhbmQKPiA+ID4gcHdyX3N0YXRlLCB3aGlsZSBpbiBoYXJk
d2FyZSBtb2RlIChIVyBtb2RlKSwgdGhlIFBNVSBoYXJkd2FyZQo+ID4gPiB3aWxsCj4gPiA+IGNv
bXBsZXRlCj4gPiA+IHRoZSBzZXF1ZW5jZSBhdXRvbWF0aWNhbGx5IHdpdGhvdXQgcmVxdWlyaW5n
IHNvZnR3YXJlCj4gPiA+IGludGVydmVudGlvbi4KPiA+IAo+ID4gSSB0aGluayB0aGVyZSBhbHNv
IGV4aXN0cyBzb2x1dGlvbnMgZm9yIEszIHRoYXQgdXNlcyBSUE1JIHBvd2VyCj4gPiBkb21haW5z
LCBhbmQgbGV0IHRoZWlyIEVTT1MgZmlybXdhcmUgdG8gYWNjZXNzIHRoZSBoYXJkd2FyZS4KPiA+
IAo+IFllcywgSSdtIGF3YXJlIG9mIHRoYXQKPiAKPiA+IFdoYXQncyB0aGUgcmVsYXRpb25zaGlw
IG9mIHRoaXMgaW1wbGVtZW50YXRpb24gd2l0aCB0aGUgRVNPUwo+ID4gaW1wbGVtZW50YXRpb24/
IFNob3VsZCB0aGUgRVNPUyBwYXJ0IGJlIGRpc2FibGVkIHRvIHVzZSB0aGlzCj4gPiBpbXBsZW1l
bnRhdGlvbj8KPiA+IAo+IEkgc2hvdWxkIHNheSwgaXQncyBhIG11dHVhbGx5IGV4Y2x1c2l2ZSBz
b2x1dGlvbiwgc28geWVzLCB0aGUgRVNPUwo+IHBhcnQKPiBzaG91bGQgYmUgZGlzYWJsZWQgaW4g
b3JkZXIgdG8gdXNlIHRoaXMgdmVyc2lvbgo+IAo+IFRoZSBtb3RpdmF0aW9uIG9mIHRoaXMgcGF0
Y2ggaXMgdHJ5aW5nIHRvIHN1cHBvcnQgZHJtL2Rpc3BsYXkKPiBkcml2ZXIncwo+IFBNIHJlcXVp
cmVtZW50LCB3aGlsZSBhdm9pZCBnb2luZyB3aXRoIHZlbmRvcidzIGNvbXBsaWNhdGVkIFJQTUkK
PiBzb2x1dGlvbgo+IHdoaWNoIGlzbid0IG1haW5saW5lIHJlYWR5CgpJcyB0aGlzIGEgbG9uZy10
ZXJtIHNvbHV0aW9uLCBvciBhIHRlbXBvcmFyeSBvbmU/CgpJZiBpdCdzIGEgdGVtcG9yYXJ5IGNv
bmZsaWN0aW5nIG9uZSwgSSBkb24ndCB0aGluayBpdCdzIHdvcnRoIHBpY2tpbmcKYXQgYWxsLgoK
VGhhbmtzLApJY2Vub3d5CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJh
ZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51
eC1yaXNjdgo=
