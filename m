Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E84C25B48
	for <linux-riscv@archiver.kernel.org>; Fri, 27 Oct 2023 17:29:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References
	:In-Reply-To:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jc+ZPPI0KjNFC6sgNsVPaQPplGEB6n+ZC7ap3F+niew=; b=XZNVm/UEHjYHsI
	q2tkjbQXQyyzRf0+R4ADNpFVt569or3Yscv/RCIEC96jViAEfKfajh932Ss2ZMEGAw3IoDiao78iA
	HlvZcQcczvBoKW7/x9FNNEs93+KVe/F2aINe0xMv8PC7uSUUywXhWM/7ZRgWPHPRk3jbp2/KBv25i
	nJP/Jtv8RyVnybBS5uapggfB1FPr+CeVQ4WfjJh/Apawxm5+whovD7rHqQpe7DMMJuH5m0WPlZ63T
	eD50GYsfeaWTejg4l59UrhOcCDx4zyRXs5b+NGrr4vmxWupLDxAk2jZnuSDP6wQSPii459nXXwXHR
	OR068KxFl0trINNDj4fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQeN-00Gpit-1Y;
	Fri, 27 Oct 2023 17:29:35 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qwQeK-00GpiB-1T
	for linux-riscv@lists.infradead.org;
	Fri, 27 Oct 2023 17:29:33 +0000
From: Thomas Gleixner <tglx@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1698427765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQTIy/VXqCsK5xasPzFtCtU95N0L5Rqr8uD6BbwtUKU=;
	b=0guiRZJYY6+hb0/4VKs4gKCcYi6GHtBdM+Pg4XqYn3VXHkd/K0EMCaZn8sCAwsguTL15sb
	76SnCELLX5a2fyzD23VBJH8ebO/OeP1DB9UieMxXNhi9xD9izzPk2Bfuh7jcfD/t+rOxAe
	X9fh+Ztpv7z1sHulzexQtihJzl+gIMAAhKmIEFIW7IMb48I2s5f5uLwr+bU8c8qM4/f9Ny
	OMjVS9XAk/cx+odr/YNVDuq1+W88ID7Hu++ZITmOh6DApJRU3IhUtbz07OUW7KuZxUjPRe
	rcdAwJdtzbPWJ7Vez6FVvWAVMBeOukYUtjvB93bJ4vIsgiRlbWAcGIm6a7wWEg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1698427765;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZQTIy/VXqCsK5xasPzFtCtU95N0L5Rqr8uD6BbwtUKU=;
	b=ElMFqiF1XbQ/OhDxN3fBBKcOErxBAl3iqamWSWv5E6dUxWwwdHQELFu7BJvvYuvaLKSnWh
	5Q2jYoGRLKRu2QCA==
To: Anup Patel <apatel@ventanamicro.com>
Subject: Re: [PATCH 2/3] of: property: Add fw_devlink support for msi-parent
In-Reply-To: <CAK9=C2VRNJGySLT8_oN=U9Pe9C9mOdPjOUr24ugXciT0Hx9pqA@mail.gmail.com>
References: <20231025142820.390238-1-apatel@ventanamicro.com>
 <20231025142820.390238-3-apatel@ventanamicro.com> <871qdg4hvm.ffs@tglx>
 <CAK9=C2VRNJGySLT8_oN=U9Pe9C9mOdPjOUr24ugXciT0Hx9pqA@mail.gmail.com>
Date: Fri, 27 Oct 2023 19:29:24 +0200
Message-ID: <87msw42cuj.ffs@tglx>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231027_102932_638900_D6F14CC9 
X-CRM114-Status: GOOD (  16.72  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Saravana Kannan <saravanak@google.com>, Rob Herring <robh@kernel.org>, Marc Zyngier <maz@kernel.org>, Anup Patel <anup@brainfault.org>, Atish Patra <atishp@atishpatra.org>, linux-kernel@vger.kernel.org, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org, Frank Rowand <frowand.list@gmail.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

T24gRnJpLCBPY3QgMjcgMjAyMyBhdCAyMTowMSwgQW51cCBQYXRlbCB3cm90ZToKPiBPbiBGcmks
IE9jdCAyNywgMjAyMyBhdCAxOjI34oCvUE0gVGhvbWFzIEdsZWl4bmVyIDx0Z2x4QGxpbnV0cm9u
aXguZGU+IHdyb3RlOgo+Pgo+PiBPbiBXZWQsIE9jdCAyNSAyMDIzIGF0IDE5OjU4LCBBbnVwIFBh
dGVsIHdyb3RlOgo+PiA+IFRoaXMgYWxsb3dzIGZ3X2RldmxpbmsgdG8gY3JlYXRlIGRldmljZSBs
aW5rcyBiZXR3ZWVuIGNvbnN1bWVycyBvZgo+PiA+IGEgTVNJIGFuZCB0aGUgc3VwcGxpZXIgb2Yg
dGhlIE1TSS4KPj4KPj4gSG93IGlzIHRoaXMgcmVsYXRlZCB0byB0aGUgdHdvIGZpeGVzIGluIHRo
aXMgc2VyaWVzPwo+Cj4gVGhlIGZpcnN0IHRocmVlIHBhdGNoZXMgb2YgdGhlIHYxMSBSSVNDLVYg
QUlBIHNlcmllcyBhcmUgYWxsCj4gZml4ZXMgaGVuY2UgSSBzZW50IHRoZW0gc2VwYXJhdGVseSBm
b3IgdGhlIDYuNyBtZXJnZSB3aW5kb3cuCj4gKGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwv
MjAyMzEwMjMxNzI4MDAuMzE1MzQzLTEtYXBhdGVsQHZlbnRhbmFtaWNyby5jb20vKQo+Cj4gQWxs
IHRocmVlIGZpeGVzIGFyZSB1bnJlbGF0ZWQgdG8gZWFjaCBvdGhlciBhbmQgd2VyZSBkaXNjb3Zl
cmVkCj4gZHVyaW5nIEFJQSBkcml2ZXIgZGV2ZWxvcG1lbnQuCj4KPiBUaGlzIHBhdGNoIGZpeGVz
IHRoZSBwcm9iaW5nIG9yZGVyIGZvciBwbGF0Zm9ybSBkZXZpY2VzIGhhdmluZwo+IGludGVyLWRl
cGVuZGVuY3kgYmFzZWQgb24gIm1zaS1wYXJlbnQiIERUIHByb3BlcnR5Lgo+IEZvciBleGFtcGxl
LCB0aGUgQUlBIEFQTElDICh3aXJlZC10by1NU0kgYnJpZGdlKSBwbGF0Zm9ybQo+IGRldmljZSBk
ZXBlbmRzIG9uIHRoZSBBSUEgSU1TSUMgKE1TSSBjb250cm9sbGVyKSBwbGF0Zm9ybQo+IGRldmlj
ZS4KCldlbGwsIHRoZSBjaGFuZ2Vsb2cgc2hvdWxkIHRlbGwgdGhhdCBpdCBpcyBhIGZpeCBhbmQg
bm90IG1ha2UgdGhlCmlsbHVzaW9uIHRoYXQgdGhpcyBpcyBwdXJlIGVuYWJsZW1lbnQuLi4uCgo+
IEFyZSB5b3Ugb2theSB3aXRoIHRoaXMgcGF0Y2ggZ29pbmcgdGhyb3VnaCB0aGUgUklTQy1WIHRy
ZWUgPwoKRmluZSB3aXRoIG1lLgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KbGludXgtcmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmlu
ZnJhZGVhZC5vcmcKaHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9s
aW51eC1yaXNjdgo=
