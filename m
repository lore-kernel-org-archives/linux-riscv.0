Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7170EC83F26
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Jul 2025 18:34:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WcqOJDVTo/WSz4M6Ix0vFiQxvdt72/IRL5Ku2Ww55X4=; b=2dJEossY/ulxxf5N17dtHi6fzb
	TNJytCk9ZFtqgNau/lY+7cEPNPCUio1u4RO3Z/CobCp+9IZDB6IpNo/R7Mwkm60mw2dec4pUOC37G
	XsIgYeDJyI7jtR3wixHMV8bXuWCBSHT0svHjakz9qOmN4lP/kV8TCel0K8XqBrfUGuJHPJMkfu4QW
	vyDvG/3Wk9464L1BYfzkbs5oSTUkBbfm0aH2Q02/IUreYRZyWXhUkNXA0eEGosOb5RtNvG2Dosmxz
	0qoQNxem5P+fMYfGwobqvSCK4b47eb5yMTdtbYQdpZT6fScYY+02kleYf6e/fYsPxRHPedxoGQV+p
	o1Sw2XCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uf0ll-00000008Cya-0lzl;
	Thu, 24 Jul 2025 18:34:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uezAc-000000081Xo-2PLj
	for linux-riscv@lists.infradead.org;
	Thu, 24 Jul 2025 16:51:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E8B92613FC;
	Thu, 24 Jul 2025 16:51:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE55C4CEED;
	Thu, 24 Jul 2025 16:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753375909;
	bh=/qsjcK1VomkE6apG8nnNlFvhA9m0+QqNzjR+5Fxg+Is=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y6Mui2C5tmXU92YDRwif2Mv8GN3Rww19l97ok3n4wucIqTW0YYNIzW3tVdnGxY3JX
	 xuAGIYiPsPaCOoXjQUWgIDrVFz/G8GxIBdEffgFAJ/YAaTadlAJIGX+917xzE2HtIo
	 E6kkxS3nQUm6udeXCgLtede73JjXH+MfRbN4X3HivD2rHdniDyPw/MwIXgM8GIjdFW
	 IG6zKKzjQeyzjqjkMvGNBpaYCNxyMXt4aGTPhacUpnLEpVEF7R5UNO8kgev+g6Us48
	 PgV86blSd9jc+illN6kiLcgvSrT4X+UGN4n7od+vVnebf53fqWMq9IAddqZADolhQe
	 Kxrxq6W+WlOLg==
Date: Thu, 24 Jul 2025 17:51:45 +0100
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: starfive: jh7110-common: drop no-sdio
 property from mmc1
Message-ID: <20250724-equal-limb-2922f240961e@spud>
References: <20250724075600.239522-1-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250724075600.239522-1-e@freeshell.de>
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
Content-Type: multipart/mixed; boundary="===============6195093195923581581=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6195093195923581581==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="cnNW1JdvRKUTQWKq"
Content-Disposition: inline


--cnNW1JdvRKUTQWKq
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 24, 2025 at 12:55:53AM -0700, E Shattow wrote:
> Drop no-sdio property avoids a delete-property on variant board dts
> having an SDIO wireless module connected to mmc1.

I'm struggling to understand why this change is correct.

If there are specific boards that have wireless modules connected
instead of using sdcards, how come the no-sdio property isn't moved to the
the boards that do have sdcard slots?
The property was added for the visionfive 2, and only on mmc1, so should
it be retained for boards that match the visionfive 2 in terms of how
they use mmc?

Could you add an explanation for why removing this entirely is the right
thing to do, rather than only removing it for these variant boards?

Cheers,
Conor.

>=20
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 1 -
>  1 file changed, 1 deletion(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 2eaf01775ef5..a315113840e5 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -299,7 +299,6 @@ &mmc1 {
>  	assigned-clock-rates =3D <50000000>;
>  	bus-width =3D <4>;
>  	bootph-pre-ram;
> -	no-sdio;
>  	no-mmc;
>  	cd-gpios =3D <&sysgpio 41 GPIO_ACTIVE_LOW>;
>  	disable-wp;
>=20
> base-commit: 28fa0dcb571ab8f3be4d919f0e20e01d4e44bcb1
> --=20
> 2.50.0
>=20

--cnNW1JdvRKUTQWKq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaIJkoQAKCRB4tDGHoIJi
0nruAP4xPM53+ej1ekU6nUQOQC/2pzo3n5HZ/BIJTBv4xIrFnwEA5r77WDc8ja6u
5CLU8h7EQVS/wCiiIrq3JkQUwk+NNww=
=QPBu
-----END PGP SIGNATURE-----

--cnNW1JdvRKUTQWKq--


--===============6195093195923581581==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6195093195923581581==--

