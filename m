Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 434CCCAC58E
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Sep 2025 19:55:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dQnBc2xSFAGIlWRwo1jliAlFYRfGY3n7m/7dkS6vhD8=; b=1U48einhxmzevI
	xKfsHli1O9K4HZXReBBSB9+P15ZaNKdX//gO29wSGIUDZzbvved1mVTsmsHVBTKCfbk40Js9rV4Sc
	kxg5Pts83M8cPLd915l2yZWueYs8hSwHO9dJY3ifJ9O+6KGv6x5t0qJDy3DB1GAUh+yRLjfcmzYyq
	Yr9SFhHyhrsWMCv1B96OrW7t+oLeAfd0+HqeLMuMUyKmMpN9Rvc7uIkdIFbnhXNZ9jUAyWBZmb8xV
	TbAmrf2+HKuklH297GK6x43l7qN+eA5oqVfdk9dRic1/nHM7Gw/T1clYo8cZG8QHxrrJ+YMEhDsJB
	DDFSkn7bUl1qL3RNL+vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnO2-0000000569b-3mMw;
	Thu, 11 Sep 2025 19:55:18 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwnNz-0000000567s-1iJR
	for linux-riscv@lists.infradead.org;
	Thu, 11 Sep 2025 19:55:16 +0000
Received: from localhost (unknown [116.232.18.168])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 05E0C335DB4;
	Thu, 11 Sep 2025 19:55:10 +0000 (UTC)
Date: Fri, 12 Sep 2025 03:55:02 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Alex Elder <elder@riscstar.com>
Cc: Lee Jones <lee@kernel.org>, lgirdwood@gmail.com, broonie@kernel.org,
	alexandre.belloni@bootlin.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, mat.jonczyk@o2.pl, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	linux.amoon@gmail.com, troymitchell988@gmail.com,
	guodong@riscstar.com, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH v13 0/7] spacemit: introduce P1 PMIC support
Message-ID: <20250911195502-GYA1223946@gentoo.org>
References: <20250825172057.163883-1-elder@riscstar.com>
 <175690199980.2656286.5459018179105557107.b4-ty@kernel.org>
 <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec882a78-9604-45b1-9405-8f2f958f307c@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250911_125515_471668_AA2BC27B 
X-CRM114-Status: GOOD (  15.49  )
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

SGkgQWxleCwKCk9uIDExOjM2IFRodSAxMSBTZXAgICAgICwgQWxleCBFbGRlciB3cm90ZToKPiBP
biA5LzMvMjUgNzoxOSBBTSwgTGVlIEpvbmVzIHdyb3RlOgo+ID4gT24gTW9uLCAyNSBBdWcgMjAy
NSAxMjoyMDo0OSAtMDUwMCwgQWxleCBFbGRlciB3cm90ZToKPiA+PiBUaGUgU3BhY2VtaVQgUDEg
aXMgYW4gSTJDLWNvbnRyb2xsZWQgUE1JQyB0aGF0IGltcGxlbWVudHMgNiBidWNrCj4gPj4gY29u
dmVydGVycyBhbmQgMTIgTERPcy4gIEl0IGNvbnRhaW5zIGEgbG9hZCBzd2l0Y2gsIEFEQyBjaGFu
bmVscywKPiA+PiBHUElPcywgYSByZWFsLXRpbWUgY2xvY2ssIGFuZCBhIHdhdGNoZG9nIHRpbWVy
Lgo+ID4+Cj4gPj4gVGhpcyBzZXJpZXMgaW50cm9kdWNlcyBhIG11bHRpZnVuY3Rpb24gZHJpdmVy
IGZvciB0aGUgUDEgUE1JQyBhcwo+ID4+IHdlbGwgYXMgZHJpdmVycyBmb3IgaXRzIHJlZ3VsYXRv
cnMgYW5kIFJUQy4KPiA+Pgo+ID4+IFsuLi5dCj4gPiAKPiA+IEFwcGxpZWQsIHRoYW5rcyEKPiA+
IAo+ID4gWzEvN10gZHQtYmluZGluZ3M6IG1mZDogYWRkIHN1cHBvcnQgdGhlIFNwYWNlbWlUIFAx
IFBNSUMKPiA+ICAgICAgICBjb21taXQ6IGJhYWM2NzU1ZDNlOGRkZjQ3ZWVlMmJlM2NhNzJmZTE0
ZWJhZTIxNDMKPiA+IFsyLzddIG1mZDogc2ltcGxlLW1mZC1pMmM6IGFkZCBTcGFjZW1pVCBQMSBz
dXBwb3J0Cj4gPiAgICAgICAgY29tbWl0OiA0OTgzMzQ5NWM4NWYyNmQwNzBlNzAxNDhmZDk2MDdj
NmZiZjkyN2ZkCj4gPiAKPiA+IC0tCj4gPiBMZWUgSm9uZXMgW+adjueQvOaWr10KPiA+IAo+IAo+
IFlpeHVuIExhbiBwbGFucyB0byBtZXJnZSBwYXRjaGVzIDUtNyBvZiB0aGlzIHNlcmllcy4KPiAK
RFQgcGF0Y2hlcyB1c3VhbGx5IGdvIGFzIHRoZSBsYXN0IG9uZSwgaW4gdGhpcyBjYXNlLCB0aGV5
IGVmZmVjdGl2ZWx5CmRlcGVuZWQgb24gcGF0Y2ggMyB3aGljaCBhZGRzIHRoZSByZWd1bGF0b3Ig
c3VwcG9ydAoKQXMgTWFyayBzdWdnZXN0IGl0IGdvIHZpYSBNRkQsIHRoYXQgbGVhdmVzIEpvbmVz
IHRvIGhhbmRsZSwKSXQncyBjbG9zZSB0byB0aGUgcmVsZWFzZSBvZiByYzYsIEknZCBob3BlIGl0
IGlzbid0IHRvbyBsYXRlLi4KCj4gVGhhdCBsZWF2ZXMgcGF0Y2ggMywgd2hpY2ggZW5hYmxlcyBy
ZWd1bGF0b3Igc3VwcG9ydCwgYW5kIHBhdGNoCj4gNCwgd2hpY2ggYWRkcyBSVEMgc3VwcG9ydC4K
PiAKPiBIb3cgc2hvdWxkIHRoZXNlIHR3byBwYXRjaGVzIGJlIG1lcmdlZD8gIE1hcmsgaGFzIHJl
dmlld2VkIHRoZQo+IHJlZ3VsYXRvciBwYXRjaCAzIGFuZCBBbGV4YW5kcmUgaGFzIGFja2VkIHRo
ZSBSVEMgcGF0Y2ggNC4KPiAKPiBUaGFuayB5b3UuCj4gCj4gCQkJCQktQWxleAoKLS0gCllpeHVu
IExhbiAoZGxhbikKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRlYWQu
b3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgtcmlz
Y3YK
