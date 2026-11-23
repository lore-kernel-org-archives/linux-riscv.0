Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E491606A31E
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Nov 2026 01:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KF4xaki4;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ivOklNN2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=FOQtSqyaOAxtMnqMeEcnEcmP0RxHjqOtTVf75eJKnX0=; b=KF4xaki4cJkSxaFpxF9hHuwKHx
	nU739CseCBsnZ9vu+OPJyT0azKXcPc8wJBp4aAOB9uoLE7obhwJCdX1LSo0EGM4iF6z+MIo50YGnb
	p6ZPfKdMzk3PSW62bjamCuEed2JnE8O+TA19+cmVpbneH1osBxGlOXFJoMZp3K/yC4w3uEcgSQMTM
	BFUi6ULfir5cSmAok9MY6uoZBJJr0VQanephF8y3bZk/7UmBf0TF4e8wou2PDUB+pG0iug1n1/thP
	/auW3h/ldLjmiCtrPz9rgDB4gFtXJSHmJYxAoIKN0bwhNLT6+n+xY7IGn/1K3a0VYNWoqtwrPLduB
	WYChWpYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIk2-000000024U1-06f8;
	Mon, 23 Nov 2026 01:21:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVIk0-000000024Te-2L9R
	for linux-riscv@lists.infradead.org;
	Mon, 23 Nov 2026 01:21:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id ED32841290
	for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 01:21:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D22C31F000C6
	for <linux-riscv@lists.infradead.org>; Mon, 23 Nov 2026 01:21:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795396867;
	bh=mZqHayVGS1xgtvg32Na1JhcmVegYW+rmWEW78/lQ8ms=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ivOklNN2KOGbBFBnB9FPVh7Ld7SVUF0l6X/QpLensP7wYUOgIaUzgygVwGuX7E66A
	 wa5iA5ScRg88Zqb2fwPTGVh7+I+j/AmodinTS0CRnmjCVZaKjS6LnTKBWYLWgP5GwZ
	 xyx6e8khX7plnxrs1xYCkPsOtjoHXTksvq1K97EenFi/26xOxfKZzoHNEYrs5boju4
	 MDi3UwugVv1uuAQI7Z7FakahmJbHcb/vEFgHGr65TyzTFcEM+z1N6HzGLxc8EUmc7Z
	 hQr+k3m+qe+pBonf4F92P9FjY+aM5LUrwkzUjMMt+YKdS7APbtTG9F4yBDYve8LJ5y
	 ggDdZwilvsWQw==
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4bb6adaf0f1so23421235e9.0
        for <linux-riscv@lists.infradead.org>; Sun, 22 Nov 2026 17:21:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFrcAoDC5Z9e+4XogKMREOQY81NfAFg607yiAuCH40+vRwAl3q8wP/Qio5vW0G+qUBmZTyxi/jp3Y02DQ==@lists.infradead.org
X-Gm-Message-State: APuU4Z/49kZLyZur/PrJhFCQa36v9us8aeZx6raPqe7GwWv8J9FuVbU1
	EQ7T53VUibR9Hi9eVEDWsiIcYp5jQ1tmuJYPH0s5z6VNgTl0o48zRh4fWksceDCsFzGtgW37F79
	1SOT6Wl2q9huvMhyNdtPMjotOmNy9sVM=
X-Received: by 2002:a05:600d:600b:b0:4a2:167a:c939 with SMTP id
 5b1f17b1804b1-4bb88815f1fmr209227025e9.21.1795396866520; Sun, 22 Nov 2026
 17:21:06 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-6-eb71ec3ee523@iscas.ac.cn>
 <c8OwiyQSR8ivEFULfFWNow@gmail.com>
In-Reply-To: <c8OwiyQSR8ivEFULfFWNow@gmail.com>
From: Guo Ren <guoren@kernel.org>
Date: Mon, 23 Nov 2026 09:20:52 +0800
X-Gmail-Original-Message-ID: <CAJF2gTRiDrhOTJ77nnHm_v3k52iz2JPk15zZVE0SS_w1KJAVeg@mail.gmail.com>
X-Gm-Features: Aa3M54ouhks5E3p4QI9taB6w48IYX-BM80EMc8-2bbL7hF7KLogcDmZQZpD8tBk
Message-ID: <CAJF2gTRiDrhOTJ77nnHm_v3k52iz2JPk15zZVE0SS_w1KJAVeg@mail.gmail.com>
Subject: Re: [PATCH 06/19] clk: sunxi-ng: add support for the Allwinner V861 CCU
To: =?UTF-8?Q?Jernej_=C5=A0krabec?= <jernej.skrabec@gmail.com>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Han Gao <gaohan@iscas.ac.cn>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Chen-Yu Tsai <wens@kernel.org>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Andre Przywara <andre.przywara@arm.com>, 
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, 
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

U29tZSByZWZlcmVuY2VzIGZvciB2ODYxOgoKaHR0cHM6Ly93d3cuY254LXNvZnR3YXJlLmNvbS8y
MDI2LzAxLzA0L2FsbHdpbm5lci12ODYxLWR1YWwtY29yZS02NC1iaXQtcmlzYy12LWFpLWNhbWVy
YS1zaXAtZmVhdHVyZXMtMTI4bWItZGRyM2wtNGstaC0yNjUtaC0yNjQtdmlkZW8tZW5jb2Rlci8K
Cmh0dHBzOi8vd3d3LmFsbHdpbm5lcnRlY2guY29tL2luZGV4LnBocD9jPXByb2R1Y3QmYT1pbmRl
eCZpZD0xNDgKCmh0dHBzOi8vZG9jcy5hbGx3aW5uZXJ0ZWNoLmNvbS9kb2NzL3NvYy92ODYxLXRp
bmEtbGludXgvZW4vCgpIb3BlIHRoZXNlIGhlbHAgeW91LgoKT24gU3VuLCBOb3YgMTUsIDIwMjYg
YXQgMzozMeKAr1BNIEplcm5laiDFoGtyYWJlYyA8amVybmVqLnNrcmFiZWNAZ21haWwuY29tPiB3
cm90ZToKPgo+IERuZSBwZXRlaywgMTMuIG5vdmVtYmVyIDIwMjYgb2IgMjM6MzM6MzIgU3JlZG5q
ZWV2cm9wc2tpIHN0YW5kYXJkbmkgxI1hcyBqZSBIYW4gR2FvIHZpYSBCNCBSZWxheSBuYXBpc2Fs
KGEpOgo+ID4gRnJvbTogSGFuIEdhbyA8Z2FvaGFuQGlzY2FzLmFjLmNuPgo+ID4KPiA+IEFkZCB0
aGUgbWFpbiBDQ1UgZHJpdmVyIGZvciB0aGUgVjg2MSwgYmFzZWQgb24gdGhlIEE1MjMgb25lLiBU
aGUgQ1BVCj4gPiBQTEwsIHRoZSBDUFUgc3Vic3lzdGVtIGNsb2NrcyBhbmQgdGhlIEU5MDcgY2xv
Y2tzIGFyZSBsZWZ0IHRvIHRoZQo+ID4gZmlybXdhcmUuCj4gPgo+ID4gVW5saWtlIG9uIHRoZSBB
NTIzLCB0aGUgc2Vjb25kIGRpdmlkZXIgb2YgdGhlIDI3IE1IeiBvdXRwdXQgaXMgYSBwb3dlcgo+
ID4gb2YgdHdvLiBwbGwtYXVkaW8tNHggZG9lcyBub3QgcGFzcyByYXRlIGNoYW5nZXMgdXAsIGFz
IGl0cyBwYXJlbnQgYWxzbwo+ID4gZmVlZHMgdGhlIFVBUlQgY2xvY2sgbXV4Lgo+ID4KPiA+IFNp
Z25lZC1vZmYtYnk6IEhhbiBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IERvIHlvdSBoYXZl
IGFueSB1c2VyIG1hbnVhbCBmb3IgaXQ/IE9yIGF0IGxlYXN0IEJTUCBjb2RlPyBJdCdzIGhhcmQg
dG8KPiByZXZpZXcgcGF0Y2hlcyB3aXRob3V0IGFueSBvZiB0aG9zZSByZWZlcmVuY2VzLgo+Cj4g
QmVzdCByZWdhcmRzLAo+IEplcm5lago+Cj4KCgotLSAKQmVzdCBSZWdhcmRzCiBHdW8gUmVuCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpsaW51eC1yaXNj
diBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFkZWFkLm9yZwpodHRwOi8vbGlz
dHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4LXJpc2N2Cg==
