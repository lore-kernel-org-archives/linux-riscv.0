Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8BD0606A32D
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Nov 2026 13:29:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=cU/hmojC;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=EnCssEPw
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=SSsv6DAmvCSh9hADMR9uBh6wLfncYxsVD+uRGDqqyfg=; b=cU/hmojCQwNnvkW9YVeYxKaGaP
	mtrAvT6Wzfbo1owqwytGM1/f0QDm7mwDXtqUOJKCI1HgXp+aawnpAitUv/7xhUhg/nMOT/V5TJL1x
	AZVQgOuG9Rvu5kTIBU+S1C1o58p/PCkXIhsXrpS7DSCY53YVzjM1ZPJxP/ke/9sRBeUSiwLl8awiG
	5VnfhxBI8I9vt2ouS869OGmgZzZ1ZIWzetG3zoMJAIw2bAEuy+bKMUfQSLtcLU4VuwViInXmthmR2
	k00xrn2RcquNEbb+fxir5NfoJTznL6EijFnkdYsF6eejz8oVNTKBoxwuIEr3U+6okyCIWg4QxD2xy
	CiH1M6UQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDov-0000000G7HJ-04Uy;
	Sat, 14 Nov 2026 13:29:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xSDor-0000000G7Gt-3XkE
	for linux-riscv@lists.infradead.org;
	Sat, 14 Nov 2026 13:29:27 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5019A45B80
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:29:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09F661F00934
	for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 13:29:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794662965;
	bh=8PCw2XdXKwdBOKGqs7jdnmPpKrWXHVDdf62xcZoZaEM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EnCssEPw6cov5K9aRkaXKIug9hrEdX7SUkUiCFbnGSp9r5EM7MzYA/v1ySC16+Wq8
	 xhJw/v4UJgT3fI9+hy98dPofqYTOqcqfFiUYFvqKbG3sUVnJ8js7ecNTxyJTA95j6a
	 gHn3YsO13Nsz/w2IGgwJ2xTvov+ogJDyVBcGRKcwifXUqmTy/AVqLLk6RFmfp+odf3
	 qdH8qAe5KkP6byA8F+ntNXj3/YJW3fP52hUWbgzPGAJyMWLYqblHWDCGd4XTuVoeP0
	 dI/ReNThj1xWEba13epitPGrdJlAghmmgVNNXK+zHleuDzGNpdIjGRtC6v034pgMcL
	 00Gzu6a7N7NkQ==
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so23991015e9.2
        for <linux-riscv@lists.infradead.org>; Sat, 14 Nov 2026 05:29:24 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGlA3SMbNtFntBA6j4HzEZd4iVGdzYKCL8pw3cSDd5tQWXhgVnNok5C5PFphJ8USkzYJGiWsAevYX2o3w==@lists.infradead.org
X-Gm-Message-State: APuU4Z+bLJstszO4eZzvpGw3yPoC0zJLy0w88wp4pKUCyDjetcKLcS/k
	TE/sw+UkTN/oIytwCSwzaZgeSG7VW3yIGA1UZgXXCrjsF4CcKSvkkocE6tx/pSGWlm3PioUOYDI
	tuHNUrloBF27swr55I2p0QaJh4CgEDok=
X-Received: by 2002:a05:600c:a10a:b0:4a2:10f9:37ce with SMTP id
 5b1f17b1804b1-4bb55a4f1d8mr82881675e9.15.1794662963477; Sat, 14 Nov 2026
 05:29:23 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn> <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
From: Guo Ren <guoren@kernel.org>
Date: Sat, 14 Nov 2026 21:29:10 +0800
X-Gmail-Original-Message-ID: <CAJF2gTREPzZeBX+HMvXhPfgW_PUaUQRS=beZdUAX_dWdQXQXoQ@mail.gmail.com>
X-Gm-Features: AclHuK8FYIwK7avJPlBwjKjnw3eVNsp5Aw_49eWaUu--rt0mOUqOqs5zKnvpneU
Message-ID: <CAJF2gTREPzZeBX+HMvXhPfgW_PUaUQRS=beZdUAX_dWdQXQXoQ@mail.gmail.com>
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

T24gU2F0LCBOb3YgMTQsIDIwMjYgYXQgNjozM+KAr0FNIEhhbiBHYW8gdmlhIEI0IFJlbGF5Cjxk
ZXZudWxsK2dhb2hhbi5pc2Nhcy5hYy5jbkBrZXJuZWwub3JnPiB3cm90ZToKPgo+IEZyb206IEhh
biBHYW8gPGdhb2hhbkBpc2Nhcy5hYy5jbj4KPgo+IFRoZSBWODYxIHVzZXMgdGhlIFh1YW5UaWUg
QzkwMCBQTElDIGltcGxlbWVudGF0aW9uLCBsaWtlIHRoZSBEMS4gQWRkIGFuCj4gU29DLXNwZWNp
ZmljIGNvbXBhdGlibGUgd2l0aCAidGhlYWQsYzkwMC1wbGljIiBhcyB0aGUgZmFsbGJhY2suCj4K
PiBTaWduZWQtb2ZmLWJ5OiBIYW4gR2FvIDxnYW9oYW5AaXNjYXMuYWMuY24+Cj4gLS0tCj4gIC4u
Li9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxwbGljLTEu
MC4wLnlhbWwgICAgICB8IDEgKwo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykKPgo+
IGRpZmYgLS1naXQgYS9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvaW50ZXJydXB0
LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbCBiL0RvY3VtZW50YXRpb24vZGV2aWNl
dHJlZS9iaW5kaW5ncy9pbnRlcnJ1cHQtY29udHJvbGxlci9zaWZpdmUscGxpYy0xLjAuMC55YW1s
Cj4gaW5kZXggY2RlNGJiNjkxODk3Li42MTc4ZmVhOWJiZGMgMTAwNjQ0Cj4gLS0tIGEvRG9jdW1l
bnRhdGlvbi9kZXZpY2V0cmVlL2JpbmRpbmdzL2ludGVycnVwdC1jb250cm9sbGVyL3NpZml2ZSxw
bGljLTEuMC4wLnlhbWwKPiArKysgYi9Eb2N1bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3Mv
aW50ZXJydXB0LWNvbnRyb2xsZXIvc2lmaXZlLHBsaWMtMS4wLjAueWFtbAo+IEBAIC03Miw2ICs3
Miw3IEBAIHByb3BlcnRpZXM6Cj4gICAgICAgIC0gaXRlbXM6Cj4gICAgICAgICAgICAtIGVudW06
Cj4gICAgICAgICAgICAgICAgLSBhbGx3aW5uZXIsc3VuMjBpLWQxLXBsaWMKPiArICAgICAgICAg
ICAgICAtIGFsbHdpbm5lcixzdW4yNTJpLXY4NjEtcGxpYwo+ICAgICAgICAgICAgICAgIC0gY2Fu
YWFuLGsyMzAtcGxpYwo+ICAgICAgICAgICAgICAgIC0gc29waGdvLGN2MTgwMGItcGxpYwo+ICAg
ICAgICAgICAgICAgIC0gc29waGdvLGN2MTgxMmgtcGxpYwo+Cj4gLS0KPiAyLjU1LjAKPgo+Ck9o
LCBteSBtaXN1bmRlcnN0YW5kaW5nLCB0aGVhZCxjOTAwLXBsaWMgaXMgdXNlZCBieSBvcGVuc2Jp
LiBQbGVhc2UKa2VlcCB0aGlzIGluIHRoZSBjb21taXQgbG9nLgoKUmV2aWV3ZWQtYnk6IEdVTyBS
ZW4gKFh1YW5UaWUpIDxndW9yZW5Aa2VybmVsLm9yZz4KCi0tCkJlc3QgUmVnYXJkcwogR3VvIFJl
bgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
cmlzY3YgbWFpbGluZyBsaXN0CmxpbnV4LXJpc2N2QGxpc3RzLmluZnJhZGVhZC5vcmcKaHR0cDov
L2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1yaXNjdgo=
