Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B031C83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 11:04:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Date:Cc:To:From:Subject:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r8xVyGIb5QELknHzzjMgN41Aye8xKfBukyx7pDd14UE=; b=ezmwgHKIb+VVuq
	9taC8sdhx1NnXEnzavxGJD+/UWjgb7KMCUVrQZEIPzmK4shkU+co20gJw4xau5YCICNGKUbCCpHZs
	N9MmA1BMLLk9yBr8IitK0MM8g5psBscj5tHR00F3QzmL+XwhN4bcqwjmsJbfNx08lPsVa1ReiVIIt
	h1JwBP/6KLUFNvVE9DwjWIVTNY2o5hC9tdFagTYEYF7bbmBFaNQ/BOg3fCGplj3Z1tEjU/HQtAOnW
	LB7IH+H2SS/osd01OiJQ7GFMokC9Ca5sxxm3XHJO0HY6sxyCNYxSKQMkMmEwkcLkeI0tGFcvtWTnb
	Dhu1+TiANGq6C4AjcsOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXeDa-0000000E9PC-2eOC;
	Fri, 04 Jul 2025 11:04:34 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXdGA-0000000DziB-0LtE
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 10:03:11 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXdFx-0008E4-R2; Fri, 04 Jul 2025 12:02:57 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXdFx-006kU9-1J;
	Fri, 04 Jul 2025 12:02:57 +0200
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1uXdFx-000BZv-16;
	Fri, 04 Jul 2025 12:02:57 +0200
Message-ID: <daf9ddad1aa24ee18abdc11a9b26ef03bdcbae16.camel@pengutronix.de>
Subject: Re: [GIT PULL] Immutable tag between SpacemiT's reset and clock
 trees for v6.17
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Yixun Lan <dlan@gentoo.org>
Cc: Alex Elder <elder@riscstar.com>, linux-clk@vger.kernel.org, 
	spacemit@lists.linux.dev, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Date: Fri, 04 Jul 2025 12:02:57 +0200
In-Reply-To: <20250703151823-GYA312602@gentoo>
References: <20250703151823-GYA312602@gentoo>
User-Agent: Evolution 3.46.4-2 
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_030310_120514_5A065F9D 
X-CRM114-Status: UNSURE (   7.62  )
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

T24gRG8sIDIwMjUtMDctMDMgYXQgMTU6MTggKzAwMDAsIFlpeHVuIExhbiB3cm90ZToKPiBIaSBQ
aGlsaXBwLAo+IAo+IFBsZWFzZSBwdWxsIHRoZSBmb2xsb3dpbmcgY2hhbmdlIGludG8gdGhlIHJl
c2V0IHRyZWUuIFRoaXMKPiBhbGxvd3MgeW91IHRvIGFwcGx5IHRoZSBwYXRjaCA1IG9mIHRoZSBT
cGFjZW1pVCByZXNldCBkcml2ZXIgWzFdLgo+IAo+IFRoYW5rcywKPiBZaXh1biBMYW4KPiAKPiBM
aW5rOiBodHRwczovL2xvcmUua2VybmVsLm9yZy9yLzIwMjUwNzAyMTEzNzA5LjI5MTc0OC02LWVs
ZGVyQHJpc2NzdGFyLmNvbSBbMV0KClNvcnJ5IEkgZGlkbid0IG5vdGljZSBiZWZvcmUsIHRoaXMg
aXMgbWlzc2luZyBrMS1zeXNjb24uaCBmcm9tIFBhdGNoIDIuCsKgCkNhbiB3ZSBnZXQgYSBjbG9j
ayBtYWludGFpbmVyIGFjayB0byBwbGFjZSBwYXRjaCAyIGluIHRoZSBzaGFyZWQgdGFnIGFzCndl
bGw/IE90aGVyd2lzZSB5b3UgY291bGQgc3BsaXQgcGF0Y2ggMiBpbnRvIHNvYyBhbmQgY2xrIHBh
cnRzLgoKcmVnYXJkcwpQaGlsaXBwCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMu
aW5mcmFkZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L2xpbnV4LXJpc2N2Cg==
