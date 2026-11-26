Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9088606A32A
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Nov 2026 13:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=A2VzrLMu;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=E76uDGxf
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=pdGW821inkYtzKlr8zx37R3fbuHAlcc32FEd+czTnoI=; b=A2VzrLMuN8trgkBptlAzZsHvb0
	fDyGLaRNSoxdKf7SeRhXiOYI+WNzPlOklNjpsIPyf193wgS4kCSdo6jUqZ3iOtjVY5c3tHeU5u5cT
	712oMhfFI7Ud+vJ5pWKEGleUEjQthim2oT3GjpEAxMr0dIiIdYFqm1hSeLUoLEH2JbhYBy3puNu1I
	VYAF9za6GLJoqCdtiERzpkzTfUmmZVaMJOF9/n0xdBzoIhaUjiGy86OHeC1icmwvX/RB4akHj+5p6
	99qirFITFoGeRTLdHjmVJoreHPjarHeftQtx0CsUAcvA+7ezg7SXk27mWNdb3QBw8+1Dwk2xy2Jdy
	0Lc4WWXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZIW-0000000DJR0-3QhQ;
	Thu, 26 Nov 2026 13:14:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWZIT-0000000DJQF-1QOm
	for linux-riscv@lists.infradead.org;
	Thu, 26 Nov 2026 13:13:57 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DB0EC45F61
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:13:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7BED1F000D4
	for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 13:13:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795698836;
	bh=NGKjIx/lsrYSs635frFVwYK8gqcYIaaf5ELPmMFxaA4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=E76uDGxfRoHMxGSx1n/KhJ+/uaL9TdbXC0lWWjb9UmJO+qdb3//M1VgGazAdje1Pf
	 pJKZvnJMW10Z7G9wYhRoZnqJ+GttWxUDW/DmhV5zn1mTSj62mG2eFCOp+qUwhw10Sm
	 kwMz/4/CQQJansfi+O1ysUveSuxNaDvXslw2VllzhDvIe+QiM8Vm0h0/3bZ2eQ73fG
	 EhicxdctRdXs9uh9tuvm+2zx+teaJl8bI2B9RZ0nLnVpHgQLf6ZBJDU0MbqVoUQedI
	 lIG7xfKPt0LJUj6A7L1VG+g9H9szNvIYHLeSPeiQFwyybnEgI1FqgszUlIkUVpSGZW
	 mpeycp5SAbIow==
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-3adfc004920so66457451fa.3
        for <linux-riscv@lists.infradead.org>; Thu, 26 Nov 2026 05:13:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErFshJYqZe0l36qKKRSH4FJoNATdcrVJ4c3PsNPUhsz0kBt9+ztNAiqdveX1EUkpGHq00fmNYOwHJ+DYwA==@lists.infradead.org
X-Gm-Message-State: APuU4Z+yZsJ8WRTwjYu4/r3finUY/7GTKwEOPp6fvoC30/e13YRgnTed
	uNUsd89vuXpT1b6aSVHA3D61kCyTD5Si4I6/PeDKAJv11+EAx9ForD4t6+gc1NCKS1L0sRJkEZk
	j4eP+XwRMGVaGCuqsIDECIbEOPxYKesg=
X-Received: by 2002:a05:6512:304d:b0:5c0:a65:ad2 with SMTP id
 2adb3069b0e04-5c1bc814bccmr7600916e87.49.1795698835538; Thu, 26 Nov 2026
 05:13:55 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
In-Reply-To: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
From: Linus Walleij <linusw@kernel.org>
Date: Thu, 26 Nov 2026 14:13:40 +0100
X-Gmail-Original-Message-ID: <CAD++jLkSr5Rw3vzQH_t2uGq3ZSnFDuFxwhMpdPbZ-OHmTqiMvg@mail.gmail.com>
X-Gm-Features: Aa3M54q_yjAB_gF_ehQIHoUZMFIkQNhkQlSji1urlQGfqAlyuSk3xRkB3BtsRVk
Message-ID: <CAD++jLkSr5Rw3vzQH_t2uGq3ZSnFDuFxwhMpdPbZ-OHmTqiMvg@mail.gmail.com>
Subject: Re: [PATCH 00/19] riscv: add initial support for the Allwinner V861
 and Avaota F2
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>, 
	Samuel Holland <samuel.holland@sifive.com>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Maxime Ripard <mripard@kernel.org>, 
	Andre Przywara <andre.przywara@arm.com>, Han Gao <rabenda.cn@gmail.com>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@sifive.com>, 
	Conor Dooley <conor@kernel.org>, devicetree@vger.kernel.org, linux-csky@vger.kernel.org, 
	linux-sunxi@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, 
	linux-gpio@vger.kernel.org
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
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

SGkgSGFuLAoKdGhhbmtzIGZvciB5b3VyIHBhdGNoZXMhCgpPbiBGcmksIE5vdiAxMywgMjAyNiBh
dCAxMTozM+KAr1BNIEhhbiBHYW8gdmlhIEI0IFJlbGF5CjxkZXZudWxsK2dhb2hhbi5pc2Nhcy5h
Yy5jbkBrZXJuZWwub3JnPiB3cm90ZToKCgo+ICAgICAgIGR0LWJpbmRpbmdzOiBwaW5jdHJsOiBh
ZGQgdGhlIEFsbHdpbm5lciBWODYxIHBpbiBjb250cm9sbGVycwo+ICAgICAgIHBpbmN0cmw6IHN1
bnhpOiBhbGxvdyBhIHBlci1jb250cm9sbGVyIElSUSByZWdpc3RlciBiYXNlCj4gICAgICAgcGlu
Y3RybDogc3VueGk6IGFkZCBzdXBwb3J0IGZvciB0aGUgQWxsd2lubmVyIFY4NjEgUElPCj4gICAg
ICAgcGluY3RybDogc3VueGk6IGFkZCBzdXBwb3J0IGZvciB0aGUgQWxsd2lubmVyIFY4NjEgUi1Q
SU8KCkNhbiB5b3Ugc2VuZCB0aGVzZSBmb3VyIHBhdGNoZXMgc2VwYXJhdGVseSBzbyBJIGNhbiBy
ZXZpZXcgYW5kIG1lcmdlCnRoZW0gaW4gaXNvbGF0aW9uPwoKSSB0aGluayBlbnRpcmUtU29DIHBh
dGNoIGJvbWJzIG9ubHkgZGVsYXkgbWVyZ2luZyB0aGUgdGhpbmdzIHBpZWNlbWFsLgoKVGhhbmtz
IQpMaW51cyBXYWxsZWlqCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpsaW51eC1yaXNjdiBtYWlsaW5nIGxpc3QKbGludXgtcmlzY3ZAbGlzdHMuaW5mcmFk
ZWFkLm9yZwpodHRwOi8vbGlzdHMuaW5mcmFkZWFkLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2xpbnV4
LXJpc2N2Cg==
