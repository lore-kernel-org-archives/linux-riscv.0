Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 575B4E77188
	for <linux-riscv@archiver.kernel.org>; Sat,  4 Jan 2025 18:33:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=svOOr2x0MmpfrYs1AFS6kyjVdf/vH7C28LvAUkSYbuQ=; b=Eptjzru8+2gvLmSI1quYUBF6hU
	XjYRadoJzzUoCjIYaBTFBZ7UHIDoErvEUyP85FGlDqO+ddCpC+AfK4omS7qYC21eUNkhFPMvUh6Xf
	rOsZNL/lX47kZ25DPCti4jXeTSKzcIOU7pcXzKYlKlKNnHzfcIOYoYb9KSRbZ8lHz0h/KTkSKrUIO
	JP8GNXx/Z3brJH1RUdz7e89wV/JHyVoON74gPZb6ns3p866b/tiYvF/sLPH06lfGCfA8+v/U2gEu7
	UpLhdqoMZ/WzYwEVmbLjmdm5B3IHiyxdDFer56z3T+MQj03HTUTUZvHEt4SlLUJMPf2jcAVYng84b
	bhIOqhlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tU8xz-0000000FPMk-2LIE;
	Sat, 04 Jan 2025 18:33:43 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tU8xx-0000000FPMK-1MY3
	for linux-riscv@lists.infradead.org;
	Sat, 04 Jan 2025 18:33:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 132C45C1129;
	Sat,  4 Jan 2025 18:32:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C32CC4CED1;
	Sat,  4 Jan 2025 18:33:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736015619;
	bh=bbGVCiebfDC2v8ZrjzXFysT9S4V23mFCJgUmWbhnAB8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dS9jhJE3fxzDyDlfMtIS55DjSwucd1le+RtfivhNsJpsOEGZuPxOeDj4OO5ZzgfMj
	 ekuzhAPdQQNZ34lYJhHt4Y2Fd2A8/K4N080hN3NIMNq1ftxSyHtV+I7srKxt8I4y6f
	 Zm/U7tRP7Rg/toi9hSt55TxLOxHPQDiavQBJmsBHB64GnA54MMjbh3PNUbF4hniH5W
	 IW91QCc1jaHBCm/LNXWbu0qq8fVjGkOl+pM/xBz5ui0hjq0abCvx1PWIWIFX1Obzda
	 WKbAur3l7pv4LaQYc8uKOzAInrs0K0q6sMV95T3Cr89EEMhffoMAAQRsFg8ak2wEp+
	 H5lwD84y0HVWw==
Date: Sat, 4 Jan 2025 18:33:34 +0000
From: Conor Dooley <conor@kernel.org>
To: E Shattow <e@freeshell.de>
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v1 1/5] riscv: dts: starfive: jh7110-common: replace
 syscrg clock assignments
Message-ID: <20250104-mutilated-unpaved-008eebdb200a@spud>
References: <20250102194530.418127-1-e@freeshell.de>
 <20250102194530.418127-2-e@freeshell.de>
MIME-Version: 1.0
In-Reply-To: <20250102194530.418127-2-e@freeshell.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250104_103341_406673_AFF50FFD 
X-CRM114-Status: GOOD (  13.57  )
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
Content-Type: multipart/mixed; boundary="===============0488103295598474795=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0488103295598474795==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="X/IiaMylgfGE4uV1"
Content-Disposition: inline


--X/IiaMylgfGE4uV1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 02, 2025 at 11:45:07AM -0800, E Shattow wrote:
> Replace syscrg assignments of clocks, clock parents, and rates, for
> compatibility with downstream boot loader SPL secondary program
> loader.
>=20
> Signed-off-by: E Shattow <e@freeshell.de>
> ---
>  arch/riscv/boot/dts/starfive/jh7110-common.dtsi | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv=
/boot/dts/starfive/jh7110-common.dtsi
> index 48fb5091b817..55c6743100a7 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -359,9 +359,15 @@ spi_dev0: spi@0 {
>  };
> =20
>  &syscrg {
> -	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_CORE>,
> -			  <&pllclk JH7110_PLLCLK_PLL0_OUT>;
> -	assigned-clock-rates =3D <500000000>, <1500000000>;
> +	assigned-clocks =3D <&syscrg JH7110_SYSCLK_CPU_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_BUS_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_PERH_ROOT>,
> +			  <&syscrg JH7110_SYSCLK_QSPI_REF>;
> +	assigned-clock-parents =3D <&pllclk JH7110_PLLCLK_PLL0_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&pllclk JH7110_PLLCLK_PLL2_OUT>,
> +				 <&syscrg JH7110_SYSCLK_QSPI_REF_SRC>;
> +	assigned-clock-rates =3D <0>, <0>, <0>, <0>;

Why is assigned rates here 0s, rather than the property just removed?

>  };
> =20
>  &sysgpio {
> --=20
> 2.45.2
>=20

--X/IiaMylgfGE4uV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ3l+/gAKCRB4tDGHoIJi
0tJ3AP4y1JgKxVuFtAfj2/e072mhmKgwjpCJdSfFu0f8h9kxNgEA/OuSW1oF+y2v
pCRVRiOegBMIH80dCitQajbHkophhQA=
=Z2jI
-----END PGP SIGNATURE-----

--X/IiaMylgfGE4uV1--


--===============0488103295598474795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0488103295598474795==--

