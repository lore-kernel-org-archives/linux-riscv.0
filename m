Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75E78C282CD
	for <linux-riscv@archiver.kernel.org>; Fri, 28 Feb 2025 11:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XUH8w++sMAaHJNLM4wu2lQG83PGOWT/AB595XcN8xBI=; b=RzRwI3O1LBXkIE
	24dRD8IMqakKCmTreGiZVPxrsqj+armBeZUumONAnScx2b6cSh1U+7khMzmwgeCw/Y19hnY0RXhi+
	9/6BbevgbZ65ZpSfKak+q/qp+kSgM7/p4BZN24CA4WZe3btkrDCuIVdH43fqzw9JGUdeABh8MbdWo
	0vE9bGG2PABh8O2b6PQ3ixWllLT7moX3GyLC4cIilahEbnZSdVP9O0mTSIJ+DwKrLRwClXX5c2koV
	aggjQUYy1NllRPQcZArzEo5L+T9ABT9/PKBSVh7NjmiQwaMF54LjrfsA8uWDP/m5I1QXdhvLrvCzP
	esjHSz+pGgdN/+A3F1ow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyRB-0000000AjoM-1bNC;
	Fri, 28 Feb 2025 11:21:49 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxzA-0000000AeqN-3yqI
	for linux-riscv@lists.infradead.org;
	Fri, 28 Feb 2025 10:52:54 +0000
Received: from localhost (unknown [116.232.55.252])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id A03F834317F;
	Fri, 28 Feb 2025 10:52:51 +0000 (UTC)
Date: Fri, 28 Feb 2025 10:52:47 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Alex Elder <elder@riscstar.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
	Thomas Gleixner <tglx@linutronix.de>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 1/2] irqdomain: support three-cell scheme interrupts
Message-ID: <20250228105247-GYB52883@gentoo>
References: <20250227-04-gpio-irq-threecell-v1-0-4ae4d91baadc@gentoo.org>
 <20250227-04-gpio-irq-threecell-v1-1-4ae4d91baadc@gentoo.org>
 <8fce8a9c-7946-4e3c-bbf3-25f8b4f4466f@riscstar.com>
 <20250227204155-GYA51171@gentoo>
 <CACRpkdas4TsMQx2Cvu_JR3kTStqWaOt1N+Cmq7nFesMzpGnZ+g@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CACRpkdas4TsMQx2Cvu_JR3kTStqWaOt1N+Cmq7nFesMzpGnZ+g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_025253_015024_A5D3A149 
X-CRM114-Status: GOOD (  18.21  )
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

SGkgTGludXMgV2FsbGVpajoKCk9uIDA5OjQ0IEZyaSAyOCBGZWIgICAgICwgTGludXMgV2FsbGVp
aiB3cm90ZToKPiBPbiBUaHUsIEZlYiAyNywgMjAyNSBhdCA5OjQy4oCvUE0gWWl4dW4gTGFuIDxk
bGFuQGdlbnRvby5vcmc+IHdyb3RlOgo+IAo+ID4gPiBUaGlzIGZ1bmN0aW9uIGlzIG1lYW50IGZv
ciAidHdvY2VsbCIuICBUaGVyZSBpcyBhbHNvIGFub3RoZXIgZnVuY3Rpb24KPiA+ID4gaXJxX2Rv
bWFpbl90cmFuc2xhdGVfb25lY2VsbCgpLiAgV2h5IGRvbid0IHlvdSBqdXN0IGNyZWF0ZQo+ID4g
PiBpcnFfZG9tYWluX3RyYW5zbGF0ZV90aHJlZWNlbGwiIGluc3RlYWQ/Cj4gPiA+Cj4gPiBnb29k
IHF1ZXN0aW9uIQo+ID4KPiA+IGl0J3MgdG9vIG1hbnkgY2hhbmdlcyBmb3IgYWRkaW5nICJ0aHJl
ZWNlbGwiIHdoaWNoIEkgdGhvdWdodCBub3Qgd29ydGgKPiA+IHRoZSBlZmZvcnQsIG9yIG1heWJl
IHdlIGNhbiByZW5hbWUgdGhlIGZ1bmN0aW9uIHRvICp0d290aHJlZWNlbGwoKT8KPiA+Cj4gPiBJ
J20gbm90IHN1cmUgd2hpY2ggd2F5IHRvIGdvIGlzIHRoZSBiZXN0LCBpZGVhcyBmcm9tIG1haW50
YWluZXIgYXJlCj4gPiB3ZWxjb21lCj4gCj4gWWVhaCBqdXN0IHJlbmFtZSBpdCB0d290aHJlZWNl
bGwsIHRoYXQncyBmaW5lLCB3ZSB3aWxsIHVuZGVyc3RhbmQgaXQgOikKPiAKdGhlcmUgd2lsbCBi
ZSBxdWl0ZSBhIGxvdCBmaWxlcyB0byB0b3VjaCwgd2hpY2ggbG9va3MgYSBsaXR0bGUgYml0IHNj
YXJ5CmJ1dCBhbnl3YXksIEknbSBmaW5lIHdpdGggZWl0aGVyIHdheS4uCgokIGdpdCBncmVwIGly
cV9kb21haW5fdHJhbnNsYXRlX3R3b2NlbGwgfCBjdXQgLWYgMSAtZCAnOicgfCBzb3J0IC11IHwg
d2MgLWwKMTEKClRob21hcyBHbGVpeG5lciwgZG8geW91IGFncmVlIHdpdGggdGhpcyBkaXJlY3Rp
b24/IHRoZW4gSSBjYW4gd29yayBvbiBpdAoKLS0gCllpeHVuIExhbiAoZGxhbikKR2VudG9vIExp
bnV4IERldmVsb3BlcgpHUEcgS2V5IElEIEFBQkVGRDU1CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
