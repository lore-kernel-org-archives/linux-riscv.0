Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 529E7EB64D8
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 19:56:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0RZ3migKkUr9MMM7X7RqBIcqTYGuISZHrzEthusrV04=; b=uod356+nIwYtN14dQgDQ1PJebC
	nvjqcAKIkVSHYQo3W8CRmuNGXNRlZIgXvjioWMHNFUG+7+FqM8dzbw+wS+hggvAKux8IUQck38AFw
	A+LmtQ4g2KO7Q/6VPIdS9x3Lmhcr+uXuYNKj1Jaeht88qle+WAOC3ZN/iAKVuohyGStcWHMJgNLmw
	ho54b+qCG5wFL/kiuffN9O162kyUhbRiAOnTMS0qIPXuPwZVHKB7FS4WgD7JPcwH6kyJMEXNOTM7D
	oI4UaxKuJUNB/+fdlD9CZbAdwAZjN9dn8tNkptfvfPKtH9uq72EbGyupwa77dcv2Nukhmb5oqLRu9
	ruYhGlyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q9A7R-0091sz-37;
	Tue, 13 Jun 2023 19:55:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q9A7N-0091sG-2N
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 19:55:56 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 46026603F6;
	Tue, 13 Jun 2023 19:55:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C030C433F0;
	Tue, 13 Jun 2023 19:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1686686151;
	bh=X7DO2laKYP3B3ysfxN/nkuzWiO+uHEaxJZ1lz3iMzb0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nfsn/DHRWkcADSnOcb040jqIjz5AfCCOaJukDz9wZ6KjcmlTfXoM0BgqB0lNRBzIe
	 sOT3p3D6WnM5pbvAETJ3mGd++65yIZZMLsUvwhCZdSqkxedN/LDeo6xwhV6lhsKBHQ
	 JlAkwN5xoAXM2/LIFs8YmkYYrDUMg2A595Sr1aT/SY3mjh12mhRU2/vOo8/QgzS+wS
	 MvpdAykDyFJA1KaUXubv7qDfV9+TX4/7OuIJkYndrzsCox/UPSH+ogTRi4x4Hyls6F
	 r6x10SWXQzSI5TDfmlNHgcy6DzAwvTLyIGHg8aeSg/VXvWZYNV/ug7hOI8mQzMZzMt
	 6SB5AjyRGqHPw==
Date: Tue, 13 Jun 2023 20:55:45 +0100
From: Conor Dooley <conor@kernel.org>
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Hal Feng <hal.feng@starfivetech.com>,
	William Qiu <william.qiu@starfivetech.com>,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 7/7] riscv: dts: starfive: jh7110: Add PLL clock
 source in SYSCRG node
Message-ID: <20230613-ferret-sleeve-d0e4a5b2289e@spud>
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-8-xingyu.wu@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230613125852.211636-8-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_125553_905268_E5F0543B 
X-CRM114-Status: GOOD (  11.25  )
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
Content-Type: multipart/mixed; boundary="===============6943653619269810238=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6943653619269810238==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="IvMtdvMJSWf1agmh"
Content-Disposition: inline


--IvMtdvMJSWf1agmh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 13, 2023 at 08:58:52PM +0800, Xingyu Wu wrote:
> Modify the SYSCRG node to add PLL clocks input from
> PLL clocks driver.
>=20
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

--IvMtdvMJSWf1agmh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZIjJwQAKCRB4tDGHoIJi
0kAHAQDAQlrfp+wAEcjz8yEbiLRP2ZBZ4oUJZzxPbMVwnJ4AwwEAuMOz21LGVZW/
UGdLvMJasIvYjc+BI+XiwiBmWilfJgc=
=PiqU
-----END PGP SIGNATURE-----

--IvMtdvMJSWf1agmh--


--===============6943653619269810238==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6943653619269810238==--

