Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68A19C982D8
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Sep 2026 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ubu/yA81N2tQe2M1OccxWTONEHLy61HtmehBgt/+JfU=; b=vNcMuum1KuW7O9
	CLTTaFxq7o8BraEHEgrrq33g85UNqjUH8QI/wE+LqK6QR2QsVIdFIkfKkkF/E9eNUrs5Sjh/Z6hk7
	BThbLtpv5SaIWvnErxCI0T7dRDcaxAc9iPG9ryGQLZtYiAO0e7oZSP7funDPo7yBHUTc9YF0yYY9y
	E9z9Ka0LelN/in0oJHQnol8mXggCIHAeJco2n24+0fw1juL/nQHPb3/vviALGGmv+HJXTL1HlZGan
	NDzb2lMfAgLEdw2kO1ORvpK1BC2PSIeix1dsSbnRLFZx2WYlJl8pwcg+AC2odWtxli5DM+jeYZSb4
	z5AvFtm4n8eDMcwdbkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vYI-0000000GLi6-4B4d;
	Sat, 19 Sep 2026 13:56:27 +0000
Received: from sender5-op-o12.zoho.com ([165.173.182.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7vYG-0000000GLhc-1Pdh
	for linux-riscv@lists.infradead.org;
	Sat, 19 Sep 2026 13:56:25 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1789826181; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lxJtI0f5J52eBI0jkXF+fCjjktZihnJal+2wxXAFeJeMr7hA4MNnFTo6o7kTkRNxQ9sqToreVpEPJMb6lDHMXWiWt/Sn5mBpdBc1J3gk9PEdZSjUnBDNXPKWHqFzKw9omeR5d/bUaRiFN5/hABtXZ21lbuaepN05CPHYQk65/9E=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1789826181; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=yhX14Zjrs1T1LKc/UQ3XM5yVsTmDWG/q39PuOw4fZkw=; 
	b=Ni5XsT26yJfRAbsYM5mTkdiCmtEN0MPSyQgGGYkdqtjQGGnc21MbM+O/BVfJ3jYagernbGAQeD5YURO+kitKwVeKiAdJOWWxpUWNo0BSW+8gwsx6A+7EjkikN+lXDdsHV+sOMpr3r5h6Bo0wRXt5s3mFiZ8tvVdKSL1M8n5IrQA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=icenowy.me;
	spf=pass  smtp.mailfrom=uwu@icenowy.me;
	dmarc=pass header.from=<uwu@icenowy.me>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1789826181;
	s=zmail2; d=icenowy.me; i=uwu@icenowy.me;
	h=Message-ID:Subject:Subject:From:From:To:To:Cc:Cc:Date:Date:In-Reply-To:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id:Reply-To;
	bh=yhX14Zjrs1T1LKc/UQ3XM5yVsTmDWG/q39PuOw4fZkw=;
	b=e8k+DUqK8L0f/XjRqQOdi0HQ/UI5S1Gu7O3c6Lg1eNJdymP25Cp1kkckNIXJ4pr1
	qQueD0jICa932JYSArNLhRFepAzNl6pGdZTXd3w6qJMMSm78hNB94PTGtRILf0Ca2WW
	6Vs7//Uin5WcuhlDsPpYPyp4iteilNXakZ5/Tq/wyJL1wjJl0K9NoM0w2PRem4k8kYg
	Jd04Owgb8RpA96d6og4yDllg9edyQhblplh/pBgVE0Q9/B1Qvio9RdwKVhrUGVSpZGY
	AfLA55XW4Ak/PiTIhfoHKjyxKa5zdkMrzrYRe4/laVg/IN4ov9FipAwjd6YPLxBdP45
	ZL2yKzRZRA==
Received: by smtp.zohomail.com with SMTPS id 1789826179625358.0297920384029;
	Sat, 19 Sep 2026 06:56:19 -0700 (PDT)
Message-ID: <8301abce221e33d827053c54a64aed05f3227f7f.camel@icenowy.me>
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
Date: Sat, 19 Sep 2026 21:56:12 +0800
In-Reply-To: <20260919095936-GKA322102@kernel.org>
References: <20260918-04-k3-pm-support-v1-0-0acd2b36b96f@kernel.org>
	 <20260918-04-k3-pm-support-v1-2-0acd2b36b96f@kernel.org>
	 <a4359efeee2220903a05a2383a651ec8ec7284b7.camel@icenowy.me>
	 <20260918230107-GKC297024@kernel.org>
	 <33b33b2b79763d410bc2e5b4ef46c305aaf6f7c8.camel@icenowy.me>
	 <20260919095936-GKA322102@kernel.org>
Organization: Anthon Open-Source Community
User-Agent: Evolution 3.58.3 
MIME-Version: 1.0
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260919_065624_440060_150FDCE8 
X-CRM114-Status: GOOD (  28.66  )
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

5ZyoIDIwMjYtMDktMTnlha3nmoQgMDk6NTkgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiBI
aSBJY2Vub3d5LAo+IAo+IE9uIDE0OjU3IFNhdCAxOSBTZXDCoMKgwqDCoCAsIEljZW5vd3kgWmhl
bmcgd3JvdGU6Cj4gPiDlnKggMjAyNi0wOS0xOOS6lOeahCAyMzowMSArMDAwMO+8jFlpeHVuIExh
buWGmemBk++8mgo+ID4gPiBIaSBJY2Vub3d5LCAKPiA+ID4gCj4gPiA+IE9uIDE3OjAwIEZyaSAx
OCBTZXDCoMKgwqDCoCAsIEljZW5vd3kgWmhlbmcgd3JvdGU6Cj4gPiA+ID4g5ZyoIDIwMjYtMDkt
MTjkupTnmoQgMDI6NDAgKzAwMDDvvIxZaXh1biBMYW7lhpnpgZPvvJoKPiA+ID4gPiA+IMKgIFNw
YWNlbWlUJ3MgUE1VIChQb3dlciBNYW5hZ2VtZW50IFVuaXQpIGNvbnNpc3Qgb2Ygc2V2ZXJhbAo+
ID4gPiA+ID4gcG93ZXIKPiA+ID4gPiA+IGRvbWFpbnMKPiA+ID4gPiA+IHdoaWNoIGNhbiBiZSBt
YW5hZ2VkIGluZGVwZW5kZW50bHksIGRlcGVuZGluZyBvbiBkaWZmZXJlbnQKPiA+ID4gPiA+IGFw
cGxpY2F0aW9uCj4gPiA+ID4gPiBzY2VuYXJpbywgZWFjaCBkb21haW4gY2FuIGJlIHBvd2VyZWQg
b24vb2ZmIGZvciBzYXZpbmcgcG93ZXIuCj4gPiA+ID4gPiAKPiA+ID4gPiA+IMKgIFRoZSBkcml2
ZXIgaXMgaW1wbGVtZW50ZWQgYmFzZWQgb24gTGludXggR2VuZXJpYyBQTSBEb21haW4KPiA+ID4g
PiA+IGZyYW1ld29yay4KPiA+ID4gPiA+IEZyb20gYSBoYXJkd2FyZSBwZXJzcGVjdGl2ZSwgZWl0
aGVyIG9mIHR3byBkaXN0aW5jdCBwb3dlci1vbgo+ID4gPiA+ID4gc2VxdWVuY2VzCj4gPiA+ID4g
PiBhcmUgc3VwcG9ydGVkLCBpbiBzb2Z0d2FyZSBtb2RlIChTVyBtb2RlKSwgdGhlIGRyaXZlciBp
cwo+ID4gPiA+ID4gcmVzcG9uc2libGUKPiA+ID4gPiA+IGZvcgo+ID4gPiA+ID4gY29udHJvbGxp
bmcgdGhlIHN0YXRlcyBvZiBiaXRzIHN1Y2ggYXMgc2xlZXAxLCBzbGVlcDIsCj4gPiA+ID4gPiBp
c29sYXRpb24KPiA+ID4gPiA+IGFuZAo+ID4gPiA+ID4gcHdyX3N0YXRlLCB3aGlsZSBpbiBoYXJk
d2FyZSBtb2RlIChIVyBtb2RlKSwgdGhlIFBNVSBoYXJkd2FyZQo+ID4gPiA+ID4gd2lsbAo+ID4g
PiA+ID4gY29tcGxldGUKPiA+ID4gPiA+IHRoZSBzZXF1ZW5jZSBhdXRvbWF0aWNhbGx5IHdpdGhv
dXQgcmVxdWlyaW5nIHNvZnR3YXJlCj4gPiA+ID4gPiBpbnRlcnZlbnRpb24uCj4gPiA+ID4gCj4g
PiA+ID4gSSB0aGluayB0aGVyZSBhbHNvIGV4aXN0cyBzb2x1dGlvbnMgZm9yIEszIHRoYXQgdXNl
cyBSUE1JIHBvd2VyCj4gPiA+ID4gZG9tYWlucywgYW5kIGxldCB0aGVpciBFU09TIGZpcm13YXJl
IHRvIGFjY2VzcyB0aGUgaGFyZHdhcmUuCj4gPiA+ID4gCj4gPiA+IFllcywgSSdtIGF3YXJlIG9m
IHRoYXQKPiA+ID4gCj4gPiA+ID4gV2hhdCdzIHRoZSByZWxhdGlvbnNoaXAgb2YgdGhpcyBpbXBs
ZW1lbnRhdGlvbiB3aXRoIHRoZSBFU09TCj4gPiA+ID4gaW1wbGVtZW50YXRpb24/IFNob3VsZCB0
aGUgRVNPUyBwYXJ0IGJlIGRpc2FibGVkIHRvIHVzZSB0aGlzCj4gPiA+ID4gaW1wbGVtZW50YXRp
b24/Cj4gPiA+ID4gCj4gPiA+IEkgc2hvdWxkIHNheSwgaXQncyBhIG11dHVhbGx5IGV4Y2x1c2l2
ZSBzb2x1dGlvbiwgc28geWVzLCB0aGUKPiA+ID4gRVNPUwo+ID4gPiBwYXJ0Cj4gPiA+IHNob3Vs
ZCBiZSBkaXNhYmxlZCBpbiBvcmRlciB0byB1c2UgdGhpcyB2ZXJzaW9uCj4gPiA+IAo+ID4gPiBU
aGUgbW90aXZhdGlvbiBvZiB0aGlzIHBhdGNoIGlzIHRyeWluZyB0byBzdXBwb3J0IGRybS9kaXNw
bGF5Cj4gPiA+IGRyaXZlcidzCj4gPiA+IFBNIHJlcXVpcmVtZW50LCB3aGlsZSBhdm9pZCBnb2lu
ZyB3aXRoIHZlbmRvcidzIGNvbXBsaWNhdGVkIFJQTUkKPiA+ID4gc29sdXRpb24KPiA+ID4gd2hp
Y2ggaXNuJ3QgbWFpbmxpbmUgcmVhZHkKPiA+IAo+ID4gSXMgdGhpcyBhIGxvbmctdGVybSBzb2x1
dGlvbiwgb3IgYSB0ZW1wb3Jhcnkgb25lPwo+ID4gCj4gRm9yIHVwc3RyZWFtLCBJJ2Qgc2F5IHdl
IHByb2JhYmx5IHdpbGwgc3RpY2sgdG8gdGhpcyBzb2x1dGlvbiBmb3IKPiBsb25nIHRpbWUsIHdv
bid0IHNheSBpdCAnZm9yZXZlcicsIHNlZSBjb21tZW50IGJlbG93Li4KPiAKPiA+IElmIGl0J3Mg
YSB0ZW1wb3JhcnkgY29uZmxpY3Rpbmcgb25lLCBJIGRvbid0IHRoaW5rIGl0J3Mgd29ydGgKPiA+
IHBpY2tpbmcKPiA+IGF0IGFsbC4KPiA+IAo+IFdlbGwsIGNoZWNrZWQgY3VycmVudCBMaW51eCBr
ZXJuZWwgc3RhdHVzLCB0aGVyZSBpcyBubyBSUE1JIFBNCj4gc29sdXRpb24gCj4gaW1wbGVtZW50
ZWQgYWx0aG91Z2ggdGhlcmUgaXMgZG9jdW1lbnRhdGlvbiBpbiByaXNjdi1ycG1pIHNwZWNbMV0K
CkkgaGF2ZSBzZWVuIHBlbmRpbmcgcGF0Y2ggZm9yIGl0IHdpdGggbXVsdGlwbGUgcmV2aXNpb25z
IFsxXSwgdGhlIGR0CmJpbmRpbmcgaXMgZXZlbiBhbHJlYWR5IEFDS2VkIGJ5IENvbm9yLCBzbyBJ
IHRoaW5rIGl0J3Mgbm90IGEgYmlnCnByb2JsZW0gaGVyZS4KClRoYW5rcywKSWNlbm93eQoKWzFd
IDIwMjYwOTAzMDkyMzQ3LjYyMDA2MC0xLWpvc2h1YS55ZW9uZ0BzdGFyZml2ZXRlY2guY29tCgo+
IAo+IE9uIHRoZSBvdGhlciBoYW5kLCBJIHNlZSBubyBwcm9ibGVtIHRvIHN3aXRjaCB0byBSUE1J
IHNvbHV0aW9uIG9uY2UKPiBpdAo+IGJlY2FtZSBtYXR1cmUsIGl0J3MgdmVyeSBzaW1pbGFyIHRv
IHR3byBzb2x1dGlvbiBvZiBjbG9jayBDTEtfQ0NVIHZzCj4gQ0xLX1JQTUkuLiAKPiAKPiBMaW5r
Ogo+IGh0dHBzOi8vZ2l0aHViLmNvbS9yaXNjdi1ub24taXNhL3Jpc2N2LXJwbWkvYmxvYi9tYWlu
L3NyYy9zcnZncnAtZGV2aWNlLXBvd2VyLmFkb2MKPiDCoFsxXQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0Cmxp
bnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcv
bWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
