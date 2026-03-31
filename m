Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93408FF60CF
	for <linux-riscv@archiver.kernel.org>; Tue, 31 Mar 2026 07:22:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:From:Subject:To:Date:
	In-Reply-To:Mime-Version:Cc:Message-Id:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=FCTfRXfbw74yOgd5oU375IqhJp9yASsVfd+PJb7ywBY=; b=LuvcpE4F6S8LBaGBNLmNsXb1mA
	Lx13WcIoZlSAZHRDW1us5+0e7aN5ZNsyEpiesjDWOeTWc16QSYCOoMKjSfgYiuvUikNXzEPguLNYj
	sIuolFufzFt7dlFCieIfNGoPCBPS9lu44bziATgJFZOu9SEKAjIGDTNv7+nd7buQBr4l6+NxJnoC4
	YTXFAJfOJZcM1f4yEZAJA4RlEW+nupUpcSI+wJuiGSGGj10FEpsaAxs4AvUK8MVZw+F8p8NbbtWEW
	Z9g4ftWKJT0aER98B8uqDkeThj1KzFnpDmc3klZd7tLl+CKsg+ARKpUDAjt1x/ZAIRjDaad8aOIlA
	sck77p7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQ9-0000000CT88-1sk7;
	Tue, 31 Mar 2026 07:21:53 +0000
Received: from va-2-37.ptr.blmpb.com ([209.127.231.37])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TQ6-0000000CT7d-0Nu4
	for linux-riscv@lists.infradead.org;
	Tue, 31 Mar 2026 07:21:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 s=s1; d=deepcomputing-io.20200927.dkim.feishu.cn; t=1774941704;
  h=from:subject:mime-version:from:date:message-id:subject:to:cc:
 reply-to:content-type:mime-version:in-reply-to:message-id;
 bh=B7oNmP6viNZ6qgD7MgVlD0elZ+Qs3xdqUMng7B/CrDA=;
 b=nUWYE0Fb8mMcLD7dHHiIWIENcW9gXsK4KB+jcnrZqVIiTOc9jZnOsK/zfcUs+UTWe8yyCv
 k+/0Wy7QBxF5QHxB9HJiCyj2Omeuxc+i6sFDMKVeGHiZNiWoRrVHy7+MzoAgdK4lR6kyzJ
 3X5ivjOpe7fvw3ZdnIyKQgXgCGgDW1rNT1j89h1mRA8QsbsjdFhoc6RYlb35kD91FN6UQB
 s6ii9uZZTCoKrxbCGQU1OebeH3jOR/ilYZwOOYLK0ZTBptZnXDc3dFTSHa/6wWF7/7FteM
 PBavoQD9LWxMto8wsflO2QdrBkofLntRsWVDnf2eHvZksfvIhMDjCfCwye/Cfg==
Message-Id: <407ce3d77416bb2522b7906b0df3d5adf02c27ee.08d3c83d.aec5.4c10.8292.56d0380e3296@feishu.cn>
Cc: "Conor Dooley" <conor+dt@kernel.org>, 
	"Emil Renner Berthing" <kernel@esmil.dk>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Yixun Lan" <dlan@kernel.org>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, 
	"Albert Ou" <aou@eecs.berkeley.edu>, 
	"Heinrich Schuchardt" <heinrich.schuchardt@canonical.com>, 
	"Troy Mitchell" <troy.mitchell@linux.spacemit.com>, 
	"Michael Opdenacker" <michael.opdenacker@rootcommit.com>, 
	"Guodong Xu" <guodong@riscstar.com>, 
	"Hendrik Hamerlinck" <hendrik.hamerlinck@hammernet.be>, 
	"Yangyu Chen" <cyy@cyyself.name>, <spacemit@lists.linux.dev>, 
	<linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>, 
	<linux-kernel@vger.kernel.org>
Mime-Version: 1.0
In-Reply-To: <DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
X-Lms-Return-Path: <lba+169cb7606+a37d4f+lists.infradead.org+sandie.cao@deepcomputing.io>
Date: Tue, 31 Mar 2026 15:21:39 +0800
To: "Troy Mitchell" <troy.mitchell@linux.spacemit.com>
Subject: Re: [PATCH v2 0/2] Add DeepComputing FML13V05 board dts
From: =?utf-8?q?=E6=9B=B9=E7=8F=8A=E7=8F=8A?= <sandie.cao@deepcomputing.io>
References: <20260331071110.68321-1-sandie.cao@deepcomputing.io>
	<DHGS6RDFCOIN.14KI92Y8TSNRS@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_002150_980380_8A1E7C38 
X-CRM114-Status: UNSURE (   9.44  )
X-CRM114-Notice: Please train this message.
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

Cj4gSGkgU2FuZGllLAo+wqAKPiBPbiBUdWUgTWFyIDMxLCAyMDI2IGF0IDM6MTEgUE0gQ1NULCBT
YW5kaWUgQ2FvIHdyb3RlOgo+ID4gVGhpcyBzZXJpZXMgdXBkYXRlcyBEZXZpY2UgVHJlZSByZWxh
dGVkIGZpbGVzIHRvIGludHJvZHVjZSB0aGUKPiA+IEZNTDEzVjA1IGJvYXJkIGZyb20gRGVlcENv
bXB1dGluZywgd2hpY2ggaW5jb3Jwb3JhdGVzIGEgU3BhY2VtaXQKPiA+IEszIFNvQy4gwqBUaGlz
IGJvYXJkIGlzIGRlc2lnbmVkIGZvciB1c2Ugb24gdGhlIEZyYW1ld29yayBMYXB0b3AgMTMKPiA+
IENoYXNzaXMsIHdoaWNoIGhhcyAoRnJhbWV3b3JrKSBTS1UgRlJBTkhRMDAwMS4KPiA+Cj4gPiBU
aGUgc2VyaWVzIGlzIGJhc2VkIG9uIHJpc2N2LWR0LWZvci1uZXh0Lgo+ID4KPiA+IHYyOgo+ID4g
LSBQYXRjaCAxOgo+ID4gwqAgwqBVc2UgZm9ybWFsIGZvcm1hdCB1c2VyIG5hbWUuCj4gPiAtIFBh
dGNoIDI6Cj4gPiDCoCDCoFVzZSBmb3JtYWwgZm9ybWF0IHVzZXIgbmFtZS4KPiA+IMKgIMKgQWRk
IFJldmlld2VkLWJ5IGZyb20gVHJveSBNaXRjaGVsbC4KPiA+Cj4gPiBMaW5rIHRvIHYxOiBodHRw
czovL2xvcmUua2VybmVsLm9yZy9hbGwvMjAyNjAzMzEwMzQ0MjMuNjcxNDItMS1zYW5kaWUuY2Fv
QGRlZXBjb21wdXRpbmcuaW8vCj4gUGxlYXNlIHNsb3cgZG93biBhIGJpdC4gU2VuZGluZyBhIHYy
IGltbWVkaWF0ZWx5IGFmdGVyIGEgc2luZ2xlIHJldmlldyBkb2Vzbid0Cj4gZ2l2ZSBvdGhlcnMg
KGVzcGVjaWFsbHkgdGhvc2UgaW4gZGlmZmVyZW50IHRpbWUgem9uZXMpIGEgY2hhbmNlIHRvIGxv
b2sgYXQgdjEuCj4gSXQncyBiZXR0ZXIgdG8gd2FpdCBhIGRheSBvciB0d28gdG8gY29sbGVjdCBt
b3JlIGZlZWRiYWNrIGJlZm9yZSBzZW5kaW5nIGEgbmV3IGl0ZXJhdGlvbgo+wqAKPiDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCAtIFRyb3kKPsKgCgpHb3QgaXQuwqAKVGhhbmtz
IGEgbG90LgpTYW5kaWUKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNjdkBsaXN0cy5pbmZyYWRl
YWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4vbGlzdGluZm8vbGludXgt
cmlzY3YK
