Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EC4BC7EE2A
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 18:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=o46UN8RgfeCPUYVD/wy65e/YAPTzThFC7V+OqvTe+xE=; b=Owg/M6CN28/8AG
	1Y9pYrPHtOSCD3TXOFN8CjelNi6x66ODqZQXhkVmSl0qMjRcq8RweiNz1vsx66dplmOoEqB6Z9601
	DuV4XWjrNPh5dU78XoyDGkcSdcS6aFl/CgzEbTvNKfC7VIb/4JACdru91SYPgUUS1pqE+INYE9Qf0
	oFNjfSbAYWR61cTDegU61CFqIhYjrz+nW+CMXPICRQSp5bLtJqRi6NPzH2zClrdVA/rHi7jLVeuXm
	mDGuUhea/yrItY/ILEEWjvt+yCxQOLItnoywbmoCvbZ9HRsvQlqfzIum7Oi8Wh+ud68ZGHIujsuZ9
	faX299XxJM1IrvnaXd+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSK7P-0000000DtNl-0f6w;
	Thu, 19 Jun 2025 18:36:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSGVU-0000000DJGn-2qux
	for linux-riscv@lists.infradead.org;
	Thu, 19 Jun 2025 14:44:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A1BE45C4950;
	Thu, 19 Jun 2025 14:42:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A739DC4CEEA;
	Thu, 19 Jun 2025 14:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750344287;
	bh=2SBtOHAa8PXv7Oh4DwBgBrVlkUpWnuwLqFJrzHmdOjE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Z6Svpu2u9Rw1VPl1lBofruzEIlctenWb1IdyXMqbQNzFpmtVSulfTcXzYrPE0qye9
	 JVPNUkToJZnrW++nJ0AZHENFTgEt1OSy8Mg9edW04BMuWf4p17L7zLVK9U/uSzKUd0
	 1iYfW/NZUNhra8w8czOQBUrQ2L68Y/qohjjPbpqE+SDKOA8SeAw2K3k0gsQEc7deSI
	 eIUlu7miJrsFEVPWDyV7di+KE8hBSOavlzAJREcnUiB+9/5kUEOSq3GJdJJGrBKNiT
	 iV/SlC7L1ZyKvTmiuZJjrTK1NGLkWmxLZMvDJsDleBcSo9r+czNv1hbx1TZz+RAcAj
	 /Sb/w87Na1dfw==
Date: Thu, 19 Jun 2025 15:44:42 +0100
From: Lee Jones <lee@kernel.org>
To: Alex Elder <elder@riscstar.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	broonie@kernel.org, lgirdwood@gmail.com, wangruikang@iscas.ac.cn,
	dlan@gentoo.org, troymitchell988@gmail.com,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr, devicetree@vger.kernel.org, spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/6] mfd: spacemit: add support for SpacemiT PMICs
Message-ID: <20250619144442.GI795775@google.com>
References: <20250619135151.3206258-1-elder@riscstar.com>
 <20250619135151.3206258-3-elder@riscstar.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250619135151.3206258-3-elder@riscstar.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_074448_755938_1C574EB4 
X-CRM114-Status: GOOD (  13.39  )
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

T24gVGh1LCAxOSBKdW4gMjAyNSwgQWxleCBFbGRlciB3cm90ZToKCj4gQWRkIHN1cHBvcnQgZm9y
IFNwYWNlbWlUIFBNSUNzLiBJbml0aWFsbHkgb25seSB0aGUgUDEgUE1JQyBpcyBzdXBwb3J0ZWQK
PiBidXQgdGhlIGRyaXZlciBpcyBzdHJ1Y3R1cmVkIHRvIGFsbG93IHN1cHBvcnQgZm9yIG90aGVy
cyB0byBiZSBhZGRlZC4KPiAKPiBUaGUgUDEgUE1JQyBpcyBjb250cm9sbGVkIGJ5IEkyQywgYW5k
IGlzIG5vcm1hbGx5IGltcGxlbWVudGVkIHdpdGggdGhlCj4gU3BhY2VtaVQgSzEgU29DLiAgVGhp
cyBQTUlDIHByb3ZpZGVzIHNpeCBidWNrIGNvbnZlcnRlcnMgYW5kIDEyIExETwo+IHJlZ3VsYXRv
cnMuICBJdCBhbHNvIGltcGxlbWVudHMgYSBzd2l0Y2gsIHdhdGNoZG9nIHRpbWVyLCByZWFsLXRp
bWUgY2xvY2ssCj4gYW5kIG1vcmUsIGJ1dCBpbml0aWFsbHkgd2Ugd2lsbCBvbmx5IHN1cHBvcnQg
aXRzIHJlZ3VsYXRvcnMuCj4gCj4gU2lnbmVkLW9mZi1ieTogQWxleCBFbGRlciA8ZWxkZXJAcmlz
Y3N0YXIuY29tPgo+IC0tLQo+IHYyOiAtIFVzZSBtb2R1bGVfaTJjX2RyaXZlcigpCj4gICAgIC0g
RXhwYW5kZWQgS2NvbmZpZyBtb2R1bGUgaGVscCB0ZXh0Cj4gICAgIC0gQWRkIE1PRFVMRV9BTElB
UygpLCBhbmQgZGVmaW5lIGFuZCB1c2UgRFJWX05BTUUKPiAKPiAgZHJpdmVycy9tZmQvS2NvbmZp
ZyAgICAgICAgIHwgMTMgKysrKysrCj4gIGRyaXZlcnMvbWZkL01ha2VmaWxlICAgICAgICB8ICAx
ICsKPiAgZHJpdmVycy9tZmQvc3BhY2VtaXQtcG1pYy5jIHwgODMgKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKwo+ICAzIGZpbGVzIGNoYW5nZWQsIDk3IGluc2VydGlvbnMoKykK
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWZkL3NwYWNlbWl0LXBtaWMuYwoKQWxsIGNv
bW1lbnRzIGZybyB2MSBhcmUgc3RpbGwgcmVsZXZhbnQuCgotLSAKTGVlIEpvbmVzIFvmnY7nkLzm
lq9dCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51
eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRw
Oi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
