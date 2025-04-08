Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE287C369A4
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 13:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R2O7oK2okdxi1Igug5Jos7tjZ8rYmeQyZ6J9bjhJbTs=; b=XMUx+4OogIv74m
	IezKiwXfOA8tNJs/k4rCsdUqVmGdF5BJYyiYKlmBNmZdSE6buTS3eqtaJRboyTXmpSpGVIbHihO/d
	9+h6GtCX7OgYBWNkT4F5P0F4jSRg82HMlWIFUmGHAbepIhGBPltePRkj11ENsMkERjR/1crxzQiQp
	l1YpGw0BKf+1funjhQehTVASRpOOSDbbLr9b+k11XwxbdIlc+zB1qsVEip0Yj+aZq+AXucS7n3SGm
	bA1Jo01zlMMfqNxjKsu9koGRyEQ/Liaf1XIZacAQw6fp77Akw4pMUXRerHq2P3CZkxdHcaOfpNiU+
	wcNF6sFaTw1fDzOfevpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28ma-000000047S8-2YXQ;
	Tue, 08 Apr 2025 13:14:28 +0000
Received: from mail.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u27WZ-00000003uHg-3qzR
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 11:53:53 +0000
Received: from localhost (unknown [116.232.27.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 568EA343096;
	Tue, 08 Apr 2025 11:53:49 +0000 (UTC)
Date: Tue, 8 Apr 2025 11:53:38 +0000
From: Yixun Lan <dlan@gentoo.org>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Alex Elder <elder@riscstar.com>,
	Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org,
	linux-gpio@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH v3 2/2] gpiolib: support parsing gpio three-cell
 interrupts scheme
Message-ID: <20250408115338-GYA15656@gentoo>
References: <20250326-04-gpio-irq-threecell-v3-0-aab006ab0e00@gentoo.org>
 <20250326-04-gpio-irq-threecell-v3-2-aab006ab0e00@gentoo.org>
 <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAMRc=McnW0YRMmikwu6qWSdWD5Zu227dBRwd4VeWZcfcEFUMDg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_045351_979545_B6A2D770 
X-CRM114-Status: GOOD (  12.72  )
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

SGkgQmFydG9zejoKCk9uIDExOjAzIFR1ZSAwOCBBcHIgICAgICwgQmFydG9zeiBHb2xhc3pld3Nr
aSB3cm90ZToKPiBPbiBUdWUsIE1hciAyNSwgMjAyNSBhdCAxMTowOOKAr1BNIFlpeHVuIExhbiA8
ZGxhbkBnZW50b28ub3JnPiB3cm90ZToKPiA+Cj4gPiBncGlvIGlycSB3aGljaCB1c2luZyB0aHJl
ZS1jZWxsIHNjaGVtZSBzaG91bGQgYWx3YXlzIGNhbGwKPiA+IGluc3RhbmNlX21hdGNoKCkgZnVu
Y3Rpb24gdG8gZmluZCB0aGUgY29ycmVjdCBpcnFkb21haW4uCj4gPgo+ID4gVGhlIHNlbGVjdCgp
IGZ1bmN0aW9uIHdpbGwgYmUgY2FsbGVkIHdpdGggIURPTUFJTl9CVVNfQU5ZLAo+ID4gc28gZm9y
IHNwZWNpZmljIGdwaW8gaXJxIGRyaXZlciwgaXQgbmVlZCB0byBzZXQgYnVzIHRva2VuCj4gPiBl
eHBsaWNpdGx5LCBzb21ldGhpbmcgbGlrZToKPiA+ICAgaXJxX2RvbWFpbl91cGRhdGVfYnVzX3Rv
a2VuKGdpcnEtPmRvbWFpbiwgRE9NQUlOX0JVU19XSVJFRCk7Cj4gPgo+ID4gU2lnbmVkLW9mZi1i
eTogWWl4dW4gTGFuIDxkbGFuQGdlbnRvby5vcmc+Cj4gPiAtLS0KPiAKPiBUaGlzIGRvZXNuJ3Qg
YXBwbHkgb24gdG9wIG9mIG15IGdwaW8vZm9yLW5leHQgYnJhbmNoLiBQbGVhc2UgcmViYXNlCj4g
eW91ciBwYXRjaCBhbmQgcmVzZW5kLiBQYXRjaCAxLzIgaXMgYWxyZWFkeSBvbiB0aGF0IGJyYW5j
aC4KPiAKT2ssIHdpbGwgZG8sIHRoYW5rcwoKLS0gCllpeHVuIExhbiAoZGxhbikKR2VudG9vIExp
bnV4IERldmVsb3BlcgpHUEcgS2V5IElEIEFBQkVGRDU1CgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgt
cmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWls
bWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
