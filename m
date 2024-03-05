Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C00C54798
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Mar 2024 19:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rdv8F5nQIe+x2phzvRX0ZbPdTu0bSOE3afyICG3Y0W4=; b=mQjXxO9gigdO7BnVo+/5I1nC2I
	J5Hqb1so+3533fgRY5y2+As9DqB4wG01oBlovKQVlgazDBZ7grxQcHSIYjekzgMMxbBuY3x4eQzKY
	Sl/A6R7jm3Nj1GZTtVzKuJcsfeDNy8AIt8vkIGiyL7ZJISM3YVM71hIxFL5fM4lnOhmtJ64uWf4Co
	h36qKnwRtNXwTRuwbSx0t2McHyNPh6y/6mbQGq+9Aac2Gyd39Jx6qMrPNAfW+Rzj4oSxfx/AWMWTu
	t0AGqFb0H1d4Jrbr/IGGGrG6LuVx2EtnxbYV+A6fDGNXfanPzSG3RRIeIt7GEMkYLh/7zXfaroDIz
	JujqSI5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhafb-0000000F3aR-48xi;
	Tue, 05 Mar 2024 19:41:47 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhafZ-0000000F3Zp-1aQ6
	for linux-riscv@lists.infradead.org;
	Tue, 05 Mar 2024 19:41:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AC84961789;
	Tue,  5 Mar 2024 19:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6429DC433C7;
	Tue,  5 Mar 2024 19:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709667704;
	bh=wx1vWKZbAWVZSBpFlLvwCrtdSU8zvPw7WcOO3aQorXU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IkxCNDdWaI8fYdtiueCuY22sD6XWNp7UAhWO4qb0KMMbbj+ZtysXrjTvEvH75LftA
	 /aDgMERyiV7U8cfIcRKbs3nkdFQyVi+3+5w2fMrxzdBRDQuACmS4wfKFRviKpPqRpY
	 fvTJ5HT/tkPt1714aoPBXCNSa7roZA6GDeeTIDc2t+cv7z5NdVmEcIee7WulB9ftIG
	 MAx0iZv9/KDOcUvDqhMRwzcCWm2OXvn0Umnx4pxLkMedzNRlmh9M+rVDj+HEuuxkGs
	 KpUq8vi+oOoDLrEeoqovutliIwVxs/FBLihbPfnQL5E/hZhH/qr3bJN+2zKb/g6qdL
	 jROjWWlBUTCaw==
Date: Tue, 5 Mar 2024 19:41:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Shengyu Qu <wiagn233@outlook.com>
Cc: ganboing@gmail.com, kernel@esmil.dk, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, lee@kernel.org,
	andre.przywara@arm.com, jernej.skrabec@gmail.com,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v1] riscv: dts: starfive: Remove PMIC interrupt info for
 Visionfive 2 board
Message-ID: <20240305-macarena-fiber-f2460d371150@spud>
References: <TY3P286MB2611C5F5833F3E3E1AE838CA98222@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
MIME-Version: 1.0
In-Reply-To: <TY3P286MB2611C5F5833F3E3E1AE838CA98222@TY3P286MB2611.JPNP286.PROD.OUTLOOK.COM>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_114145_545180_271103DF 
X-CRM114-Status: GOOD (  17.11  )
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
Content-Type: multipart/mixed; boundary="===============1629115414065508383=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1629115414065508383==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="iNSctF24dp3Ivm4K"
Content-Disposition: inline


--iNSctF24dp3Ivm4K
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 06, 2024 at 01:11:50AM +0800, Shengyu Qu wrote:
> Since commit b2cb2ae22278f1918f7526b89760ee00b4a81393 ("mfd: axp20x:
> Generalise handling without interrupt"), interrupt info part for the
> AXP15060 PMIC is not needed anymore for Statfive Visionfive 2 board.
> And this would cause kernel to try to enable interrupt line 0, which is
> not expected. So delete this part from device tree.

interrupt-controller/#interrupt-cells are required properties, you can't
delete them. If you ran dtbs_check you'd see that it complains about
this patch.

If you just remove the interrupts property, what happens?

> Cc: stable@vger.kernel.org
> Fixes: b2cb2ae22278 ("mfd: axp20x: Generalise handling without interrupt")

This Fixes tag cannot be right, a dts patch cannot fix a driver. The dts
patch that incorrectly said this used interrupt 0 is what should be in the
Fixes tag.

Thanks,
Conor.

> Reported-by: Bo Gan <ganboing@gmail.com>

Closes: https://lore.kernel.org/linux-riscv/c8b6e960-2459-130f-e4e4-7c9c2eb=
aa6d3@gmail.com/

> Signed-off-by: Shengyu Qu <wiagn233@outlook.com>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi | 3 ---
>  1 file changed, 3 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index b89e9791efa7..6bebabe3fa37 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -189,9 +189,6 @@ &i2c5 {
>  	axp15060: pmic@36 {
>  		compatible =3D "x-powers,axp15060";
>  		reg =3D <0x36>;
> -		interrupts =3D <0>;
> -		interrupt-controller;
> -		#interrupt-cells =3D <1>;
> =20
>  		regulators {
>  			vcc_3v3: dcdc1 {
> --=20
> 2.39.2
>=20

--iNSctF24dp3Ivm4K
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZed1cgAKCRB4tDGHoIJi
0ldpAQDM6/MJ6AW3Mku853cAfxzI/uGgUrvTKPGEQmOoeYSTLgEA/Ze1f6KSz1ll
cylgQrIF7PnaEETKgv8q78LqOM8sbAs=
=02ei
-----END PGP SIGNATURE-----

--iNSctF24dp3Ivm4K--


--===============1629115414065508383==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1629115414065508383==--

