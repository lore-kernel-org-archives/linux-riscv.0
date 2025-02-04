Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30E6DC02194
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Feb 2025 15:26:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TT/b9cfA1FhXlyiVxqpRT7LYl9e9XfJq4PYY3C8KjAU=; b=zLQU/qDOZGzH50
	woZmzcYe+XVbA48nVTAWr0D+G8ID9D7Zqo8xJTwqVKj73ixM7REqIoJSj8U78PKQ3kh8TebuQU3Ho
	Ca5CxnQxZpfQHnCeb5X0TelFRUsjGUdr1O12c8uXBCmDvX01KXrcDXs7YhzN97VBnmyk/YMJOcWV4
	MnMZTcX4ZgTqX2v3R+tuHVRW7hADIUh9EV7vqI1VxnouexoEEDt+MxfTvHVfD2XwhBwFXHOceMX6+
	Z5/Uv144SGHNzkZSHb5ptG479jUEUPcDF4iQ/DBQrnDILjE7kVspiL1e5aazkF7/A3zaPuM3KyqFY
	ORGo4/o4HAsK/rAeP8oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKoY-00000000oHa-03XF;
	Tue, 04 Feb 2025 15:26:14 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfKj3-00000000njv-185q;
	Tue, 04 Feb 2025 15:20:34 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738682429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	b=PhnloDKYNBOrZBEe9vEbIX8wdTJMzWPCq9rB3iYhHnl9FFRrKeNxTrKOBpjWlKWGB8W6xb
	R0MGAX/uT5/nGmCn3pxBnubFyDeu5WDKk5kpLj0/4xJ9sS1raOa3AuslhdOIvWrQXPtErr
	tQxrsQ6ksCJ4v2KS7nCQeFBzUrauP+7CjBmtzIw//Sc0kn4MZ3iHwrgp6E7tJcRc+CTP5f
	6kvvz1+6fF1pTuOANHtCH/SwS3oD+xs/q9bgrEcUhilZORvJlD5Dx/jc+R4mKx8+Zgi0SN
	LJVZPshsHOrvPMuz4guozzsqmaU9j8kqm/EUyTKvJPLTvor/FTxbvXs4fDNw+w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738682429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=b+np3wghDxTYvPM4DJ7Bcv/JvDfMQYeUeUQQTzNPD3A=;
	b=rOLEsODCJvNLJOUwg/qKcv7l3HvdSVhKFHYQM9G81quzT2zY0VtGTOwVSSYqSKg2g1lrUr
	gLT6jEyfQOk5+dDQ==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH v3 10/10] irqchip/riscv-imsic: Use IRQCHIP_MOVE_DEFERRED
 flag for PCI devices
In-Reply-To: <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
References: <20250204075405.824721-1-apatel@ventanamicro.com>
 <20250204075405.824721-11-apatel@ventanamicro.com> <87o6zinl5o.ffs@tglx>
 <CAK9=C2VgOnSVBRPh+bJBQnGreVYcUh6HWVg1MEzDtfYsuT0s-g@mail.gmail.com>
Date: Tue, 04 Feb 2025 16:20:28 +0100
Message-ID: <87cyfxohxf.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_072033_443536_63C8F47E 
X-CRM114-Status: GOOD (  11.39  )
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
Cc: Andrew Lunn <andrew@lunn.ch>, imx@lists.linux.dev, Marc Zyngier <maz@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Paul Walmsley <paul.walmsley@sifive.com>, Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, Shawn Guo <shawnguo@kernel.org>, Gregory Clement <gregory.clement@bootlin.com>, linux-arm-kernel@lists.infradead.org, Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gVHVlLCBGZWIgMDQgMjAyNSBhdCAyMDoxOSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBUdWUs
IEZlYiA0LCAyMDI1IGF0IDI6MjbigK9QTSBUaG9tYXMgR2xlaXhuZXIgPHRnbHhAbGludXRyb25p
eC5kZT4gd3JvdGU6Cj4+IFRoZSBzYW1lIGNvdWxkIGJlIGFjaGlldmVkIGJ5IGV4ZWN1dGluZyB0
aGF0IGludGVybWVkaWF0ZSB0cmFuc2l0aW9uIG9uCj4+IENQVTAgd2l0aCBpbnRlcnJ1cHRzIGRp
c2FibGVkIGJ5IGFmZmluaW5nIHRoZSBjYWxsaW5nIGNvbnRleHQgKHRocmVhZCkKPj4gdG8gQ1BV
MCBvciBieSBpc3N1aW5nIGFuIElQSSBvbiBDUFUwIGFuZCBkb2luZyBpdCBpbiB0aGF0IGNvbnRl
eHQuIEkKPj4gbG9va2VkIGludG8gdGhhdCwgYnV0IHRoYXQgaGFzIGl0J3Mgb3duIHBpbGUgb2Yg
aXNzdWVzLiBTbyBhdCB0aGUgZW5kCj4+IG1vdmluZyBpdCBpbiB0aGUgY29udGV4dCBvZiB0aGUg
aW50ZXJydXB0IG9uIHRoZSBvcmlnaW5hbCBDUFUvdmVjdG9yCj4+IHR1cm5lZCBvdXQgdG8gYmUg
dGhlIHNpbXBsZXN0IHdheSB0byBhY2hpZXZlIGl0Lgo+Cj4gSSBnb3QgY29uZnVzZWQgYmVjYXVz
ZSBJUlFDSElQX01PVkVfREVGRVJSRUQgdXBkYXRlcyBhZmZpbml0eQo+IHdpdGggdGhlIGludGVy
cnVwdCBtYXNrZWQgd2hpY2ggSSBpbnRlcnByZXRlZCBhcyBtYXNrZWQgYXQgdGhlIGRldmljZQo+
IGxldmVsLiBBbHNvLCBQQ0kgTVNJIG1hc2svdW5tYXNrIGlzIGFuIG9wdGlvbmFsIGZlYXR1cmUg
b2YgUENJIGRldmljZXMKPiB3aGljaCBJIHRvdGFsbHkgbWlzc2VkLgoKVGhhdCdzIHRoZSBwcm9i
bGVtIHRoaXMgYWN0dWFsbHkgaGFuZGxlcy4gSWYgUENJIG1hc2svdW5tYXNrIHdvdWxkIGJlCm1h
bmRhdG9yeSB0aGUgcHJvYmxlbSB3b3VsZCBub3QgZXhpc3QgaW4gdGhlIGZpcnN0IHBsYWNlIDop
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
