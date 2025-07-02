Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 861E8C77B7C
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Jul 2025 17:06:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Pc9EA+83CML03reQd0q0arVtMVZwxk4goOwC2N0wDbQ=; b=oOORE2sGzrX9Xf
	/Xk3XsWr9Ip+zicdYpgx3X4f6ttIGSp37246dFnAjirsgWKpgW2a92PSla4lPXqilf5BokRAU8til
	ul7Q7JNUVbulRaUzhigNZEob25Uj0uNSRQ9C7d5q7lmCg7JvSYbQA/N6N7jOQgVrX50YDxfN63UkI
	BuR4jzC557iumbSluHy3Qxjwhu/skrDSuAafWL6B5Qr03o/QKFrrf6mYMrfKTHBxOuyDbJyO3efTl
	X0lXa/rntFXhh/8IDpWxW9yshiG+XLVRGfLC0un8YCAOZ2EI++fl8KeKAg0kMzLwityfO1YsayZrp
	htv1d9JxsgeaD0Bz6uTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0ug-000000093oq-12hr;
	Wed, 02 Jul 2025 17:06:26 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX0Hz-00000008wmJ-2Aul
	for linux-riscv@lists.infradead.org;
	Wed, 02 Jul 2025 16:26:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B479AA52290;
	Wed,  2 Jul 2025 16:26:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3FB9C4AF09;
	Wed,  2 Jul 2025 16:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751473586;
	bh=MK0TeEDtIYEG+qBbIu9c9zXZjic9aPUL1e3LYCTRgLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SvIcD3Ie5dSYOZ0oz9yAtCTe4rl3T57V8I636/dO+Blo49qAcxJ5YObOaqwmA5LTI
	 UbEgko3Ae4m1UXqGcu6Zc76uYkHiY9CdVsrjfqxQzoZCLNq30/KYn6TbkEJRDC8eV1
	 wu0X+hlp+IHSgABor5nc/eSiZ9PZZSYsSDmYt6d3nc+rpsQPzgixUczz57zh1MVDJm
	 sHQQ2lVrAb4xftyGSltUYjrooYe7fP9hfJK08/DUlOTkfENchV89XlCbA60sRTPsjA
	 jHgXldVmJd01Y5BGBsSZl6q1MiKBUJs/S3x2cxqXes0juev8I5CRoRlulX4u54DXfc
	 z9nFhjT70sHuA==
Date: Wed, 2 Jul 2025 17:26:20 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: lgirdwood@gmail.com, broonie@kernel.org, alexandre.belloni@bootlin.com,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	mat.jonczyk@o2.pl, dlan@gentoo.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alex@ghiti.fr,
	troymitchell988@gmail.com, guodong@riscstar.com,
	linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 2/8] mfd: simple-mfd-i2c: specify max_register
Message-ID: <20250702162620.GA10134@google.com>
References: <20250627142309.1444135-1-elder@riscstar.com>
 <20250627142309.1444135-3-elder@riscstar.com>
 <20250702152618.GU10134@google.com>
 <0219b698-2f1b-4fcd-bce7-0ba6f6895b11@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <0219b698-2f1b-4fcd-bce7-0ba6f6895b11@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_092627_619524_889B89BF 
X-CRM114-Status: GOOD (  16.83  )
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

T24gV2VkLCAwMiBKdWwgMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gT24gNy8yLzI1IDEwOjI2
IEFNLCBMZWUgSm9uZXMgd3JvdGU6Cj4gPiBPbiBGcmksIDI3IEp1biAyMDI1LCBBbGV4IEVsZGVy
IHdyb3RlOgo+ID4gCj4gPiA+IEFsbCBkZXZpY2VzIHN1cHBvcnRlZCBieSBzaW1wbGUgTUZEIHVz
ZSB0aGUgc2FtZSA4LWJpdCByZWdpc3Rlcgo+ID4gPiA4LWJpdCB2YWx1ZSByZWdtYXAgY29uZmln
dXJhdGlvbi4gIFRoZXJlIGlzIGFuIG9wdGlvbiBhdmFpbGFibGUKPiA+ID4gZm9yIGEgZGV2aWNl
IHRvIHNwZWNpZnkgYSBjdXN0b21lIGNvbmZpZ3VyYXRpb24sIGJ1dCBubyBleGlzdGluZwo+ID4g
PiBkZXZpY2UgdXNlcyBpdC4KPiA+ID4gCj4gPiA+IExlZSBKb25lcyBzdWdnZXN0ZWQgbW9kaWZ5
aW5nIHRoZSBzaW1wbGUgTUZEIGltcGxlbWVudGF0aW9uIHRvCj4gPiA+IHJlbW92ZSB0aGUgZ2Vu
ZXJhbGl0eSBvZiB0aGUgZnVsbCByZWdtYXAgY29uZmlndXJhdGlvbiBhbmQgYWRkIGEKPiA+ID4g
bWF4X3JlZ2lzdGVyIHZhbHVlIHRvIHRoZSBzaW1wbGVfbWZkX2RhdGEgc3RydWN0dXJlLiAgVGhp
cyBjYW4KPiA+ID4gYmUgdXNlZCBpbiB0aGUgcmVnbWFwIGNvbmZpZ3VyYXRpb24gdG8gbGltaXQg
dGhlIHZhbGlkIHJlZ2lzdGVyCj4gPiA+IGFkZHJlc3NlcyBpZiBkZXNpcmVkLiAgSXQncyBzaW1w
bGVyLCBhbmQgY292ZXJzIGFsbCBleGlzdGluZyBhbmQKPiA+ID4gYW50aWNpcGF0ZWQgZGV2aWNl
IHR5cGVzLgo+ID4gCj4gPiBXb2FoLCBub3QgbGlrZSB0aGlzLiAgSSB3YW50ZWQgdG8gbWFrZSB0
aGUgZnJhbWV3b3JrIF9tb3JlXyBmbGV4aWJsZS4KPiAKPiBPSywgc29ycnkgSSBtaXN1bmRlcnN0
b29kLiAgSSdsbCBzZW5kIGFub3RoZXIgbmV3IHZlcnNpb24gdG9kYXkKPiB0aGF0IGRvZXMgd2hh
dCB5b3Ugc3VnZ2VzdC4KCk5vIHdvcnJpZXMuICBQZXJoYXBzIEkgd2Fzbid0IGNsZWFyIGVub3Vn
aC4KCi0tIApMZWUgSm9uZXMgW+adjueQvOaWr10KCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCmxpbnV4LXJpc2N2IG1haWxpbmcgbGlzdApsaW51eC1yaXNj
dkBsaXN0cy5pbmZyYWRlYWQub3JnCmh0dHA6Ly9saXN0cy5pbmZyYWRlYWQub3JnL21haWxtYW4v
bGlzdGluZm8vbGludXgtcmlzY3YK
