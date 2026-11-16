Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7684E606A322
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Nov 2026 18:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CIyz0V51;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BufQ4yB8
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9nQ7loDpO2I3Eq8tMsw0QQv/ZUlRBHrEoK28fLwvF5c=; b=CIyz0V51UKqwQBJcTMia1xFM47
	4kNw7dCM24wwQtZuH2v3U/kZlGAtsasOaaB0BnXRgUvDsFEra0PEPat+8sFzpOLucwO39swVwr8JD
	nY/x6jG2Xh5aetIlYAhRKoiSeEDiTuc+9bYb5RbtjbilBlFyDW1IglXDIwC8bn/HBwhPZzu7YNqNk
	bd6j3a7v3GF8AAf5C/KR5froFohfAdONZFH6hz2yKFaOuT4a3KxH+5vzEIgnHCIUpYxbqG+6d4tMl
	VJtDtGbk+ODOjGXWFeKlRiB2KZXsQPsk6OFrvyEVLJAk08NCEddVl9pvJcTHGD9qqElncvNOF0XtQ
	ahyWbV+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1VS-00000003aAM-37fx;
	Mon, 16 Nov 2026 18:32:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xT1VR-00000003a9R-2OC4;
	Mon, 16 Nov 2026 18:32:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id D24D76314D;
	Mon, 16 Nov 2026 18:32:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CB111F000C4;
	Mon, 16 Nov 2026 18:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794853960;
	bh=u0amJXnNhvCqUYVosfqp8kda2/cuojxj7YCK3kHoL1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BufQ4yB8tNbR8TJ/Hnm/k0+qE6qxhRqGHHX46jkRGjToD5o4wDrOYPG7nvezFv0ij
	 e00clQXsG373kdYmAXh8oCe3IdIVdiT7Iui5KI+tcxMLHi5sV3JE0MCYGqkDxIcaXG
	 7gFlY44DXGIocwrYaoiYok5Qz2wfSVMvRrYiuUBEIyuQJO2rmvTxnoeAq5ciRmKYtF
	 8jWVjuzRfesJCaPTKOdJGnjX00leLrKY96LkSJxp8fIyI8sTMQtc30D3p5LMJfS9hY
	 WHff+hOG9ikpu+ry1kjea+En2yvY2vIpCCDVgojLaxx8EmurFzgfstWWNc3x0/FSjO
	 xjWuXeQY+sZGQ==
Date: Mon, 16 Nov 2026 18:32:32 +0000
From: Conor Dooley <conor@kernel.org>
To: gaohan@iscas.ac.cn
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Samuel Holland <samuel.holland@sifive.com>,
	Daniel Lezcano <daniel.lezcano@kernel.org>,
	Anup Patel <anup@brainfault.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Maxime Ripard <mripard@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Andre Przywara <andre.przywara@arm.com>,
	Han Gao <rabenda.cn@gmail.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@sifive.com>, devicetree@vger.kernel.org,
	linux-csky@vger.kernel.org, linux-sunxi@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rtc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH 03/19] dt-bindings: interrupt-controller: add the
 Allwinner V861 PLIC
Message-ID: <20261116-catsup-lethargic-45b29242cb79@spud>
References: <20261114-v861-v1-0-eb71ec3ee523@iscas.ac.cn>
 <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261114-v861-v1-3-eb71ec3ee523@iscas.ac.cn>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============1430888434119797989=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-8.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============1430888434119797989==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eBIsJ0dmZzflzkKm"
Content-Disposition: inline

--eBIsJ0dmZzflzkKm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--eBIsJ0dmZzflzkKm
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCavtMQAAKCRB4tDGHoIJi
0gQ9AP9yFcU7elfIZfpsStDtWeKtAnPFAqBGCugfc09t6ejP6wD/arKyMr+JWozf
FFL142vScOtV8F9Q7w85A31HzFStQgc=
=1gXO
-----END PGP SIGNATURE-----

--eBIsJ0dmZzflzkKm--


--===============1430888434119797989==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1430888434119797989==--

