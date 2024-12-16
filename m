Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4DCE7717F
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Dec 2024 20:11:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l8x4jFe6/2RSzQMGh08MUzbyp7qr7IY8cqHFwtE4iJY=; b=pEUCD0TM+mrK6ubH44DWk6DUGL
	YmVfOQEH/1QwENp3HYvN1sFBub7p7R3vQ2WvELw/YSZdpuTt8O46eVpOPfsOmTrDB1h/ePbdPs+Ro
	uQ/XWh4pH73WoRx469zwqOFZpdvJirLoYIF2QbAbrP9YEt+LLsC0Isq36VhE/vnLnbYDvHdk48LBO
	WkSpHZzKcBu1h3jNF5H96twozl20LCFdDOxqSL1pRvkDH6HUb34vePWI/lVMMUkyh9irf6f2OBOGl
	V098I/s8CFPPhaBQpeLoKPPf5XLspdt3zsWuYO1ykCEBMfztCJQVN3z8tbCOICNkDuxDz+YVA5Zuh
	XN08GzEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHQv-0000000BDNf-463j;
	Mon, 16 Dec 2024 20:11:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNHQt-0000000BDN5-31fp
	for linux-riscv@lists.infradead.org;
	Mon, 16 Dec 2024 20:11:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0655BA418CC;
	Mon, 16 Dec 2024 20:09:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B72C4CED0;
	Mon, 16 Dec 2024 20:11:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734379870;
	bh=lkk98hRwhqZmwQEshqTnBcBCUrNRCwUxIABBB4mSJDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e1ZSoq6GxisXu1A8l+XUeE3e/87SOeoSJw1h79l7SBGMMaC2R2/a3mlY8F0YY6H2p
	 faOnDgoZRmK7SQeGffp63FkZgTeUNQcJ+qc6lcw1EjOyNYtAZJoVkIVTM/bLDqwk+K
	 fGeNP1VMw8l/9YoLVZZ5D8jTML6mEbrvvOnZlkQ78tE6zpDQ/xedTCMBt/PZ5VB3BG
	 Lq28a3VRRetDaKPKpnBMZw/g9lUquh8GgSqeBudnHCHKg5AItUZ7lV7oll3JqYCCd1
	 EWDpYYMpU7jWJDEOBdNW8cvt/QhDgzsU877VSIJMdvGfG5WKVKbbg6sIg7Iz5Azfzr
	 0QPK4y5+dW1IA==
Date: Mon, 16 Dec 2024 20:11:05 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jisheng Zhang <jszhang@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: Use named
 definition for mmc1 card detect
Message-ID: <20241216-rounding-padlock-25a55bfad108@spud>
References: <20241210040652.164030-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20241210040652.164030-1-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_121111_824829_E722106E 
X-CRM114-Status: GOOD (  14.78  )
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
Content-Type: multipart/mixed; boundary="===============2337552536902636975=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2337552536902636975==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6Xhj8PbiuSf1P2l9"
Content-Disposition: inline


--6Xhj8PbiuSf1P2l9
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 09, 2024 at 08:06:46PM -0800, E Shattow wrote:
> Use named definition for mmc1 card detect GPIO instead of numeric literal.
>=20
> Fixes: ac9a37e2d6b63 ("riscv: dts: starfive: introduce a common board dts=
i for jh7110 based boards")

I don't think this is a fix. Don't resend for that, I'll remove the tag.

> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 48fb5091b817..12a90d38ab31 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -281,7 +281,7 @@ &mmc1 {
>  	bus-width =3D <4>;
>  	no-sdio;
>  	no-mmc;
> -	cd-gpios =3D <&sysgpio 41 GPIO_ACTIVE_LOW>;
> +	cd-gpios =3D <&sysgpio GPI_SYS_SDIO1_CD GPIO_ACTIVE_LOW>;
>  	disable-wp;
>  	cap-sd-highspeed;
>  	post-power-on-delay-ms =3D <200>;
>=20
> base-commit: 708d55db3edbe2ccf88d94b5f2e2b404bc0ba37c
> --=20
> 2.45.2
>=20

--6Xhj8PbiuSf1P2l9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ2CJWQAKCRB4tDGHoIJi
0jQcAQC0h2JuDDyQXflhrr72Iny3UoInADf6RdtNzdx3ZjrBQwEApDFAen0ljmkx
Ib4yz3oRzyNeDuMY1z5bLXM3qZofnQo=
=nL2z
-----END PGP SIGNATURE-----

--6Xhj8PbiuSf1P2l9--


--===============2337552536902636975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2337552536902636975==--

