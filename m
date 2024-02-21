Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C636C48BC3
	for <linux-riscv@archiver.kernel.org>; Wed, 21 Feb 2024 01:11:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pQGkC8Ajn1xOph34DcMOnZ6Ge02RjmwB+YjNDU6MXe8=; b=zQjdaztckHqCVMECAfPw430pif
	E64fyzb6nKajsISjhWT4NAAOPAYzFDaverWC63fqecfMisAFdUEezTYX4YHQ7ZW5huXw/C361UR/7
	ciab/QMuWbTX2LDbotfJUAP3YhKlgxyMg83zANAY7ITvNRQp43gLh8gR+HV/P20IRFPyWEn5VVknG
	Yy4Ht9CTV1Y2HXSP5UCIctg5kdcIiR9sywH3otb5A1SRn1PR/Z0v1PsAyVH1j8cZcEOXT7Pbb+77q
	duB/6qcanL5aRmMgRAOYiSweK2M82/FHNlxOeS8BrTmhR5UQW7q/q3y5lRggTSGdIs+gmqpjcSFgt
	JLwyTVSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcb8o-0000000Gi0U-09DP;
	Wed, 21 Feb 2024 01:11:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcb8l-0000000Ghzu-25MK
	for linux-riscv@lists.infradead.org;
	Wed, 21 Feb 2024 01:11:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 81EE661370;
	Wed, 21 Feb 2024 01:11:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A791C433F1;
	Wed, 21 Feb 2024 01:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708477874;
	bh=btJOLopJktgGi2/wGoVtv1QtxSSCjSdVjxE6aY9Ek/k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=S54bans2BlnZaSoevee1TwMnZ3Z3UqHKYFnM5eKUMAyIF7yl9wKF/twxUlPaTSb0b
	 /f28cCjcxKNP2CauQPQkAOm5BDzn0pFNTKoAfjTRFNpbUJtx8YWqFB3ZFwDfujXraD
	 mbwAGAA0YBqF7CW7/G784mvdaWhs2M7pHiI9ckbEBsL41Z92cbc4X3RgwTKRG8acRx
	 3ICgwweV5lMk5U0vSPVuNJOxCnvB2Y6Zwgb3eMZMgY8fSuazrimy1VOwxmT0SD+Aim
	 SYenZvlu2BNC9JFJ2qOKr1cQoSERvBjV11btcAJ66vimZQSsTOQe/2ggI7PBCti7ac
	 LRLMVB6gao3XA==
Date: Wed, 21 Feb 2024 01:11:09 +0000
From: Conor Dooley <conor@kernel.org>
To: Yangyu Chen <cyy@cyyself.name>
Cc: linux-riscv@lists.infradead.org,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Rob Herring <robh+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: Re: [RFC PATCH 1/1] riscv: dts: Allow BUILTIN_DTB for all socs
Message-ID: <20240221-numerator-grill-1e5603841a8d@spud>
References: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
 <tencent_C9E0DAC75884B0346EF2250A5E68673BA20A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_C9E0DAC75884B0346EF2250A5E68673BA20A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240220_171115_674459_7410B1E8 
X-CRM114-Status: GOOD (  25.59  )
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
Content-Type: multipart/mixed; boundary="===============5491562056349169362=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5491562056349169362==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Fp5d1QqaibeYLKMo"
Content-Disposition: inline


--Fp5d1QqaibeYLKMo
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 03:03:57AM +0800, Yangyu Chen wrote:
> The BUILTIN_DTB kernel feature on RISC-V only works on K210 SoC only. This
> patch moved this configuration to entire riscv.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

A passing remark here only:
The detail in the cover letter belongs in the commit message. There's
very little value in a cover letter for a one patch "series" - it
either will duplicate information from the commit message (and is
therefore useless) or, as in this case, splits information that should
be in the commit message away from it.

Thanks,
Conor.

> ---
>  arch/riscv/Kconfig                  | 16 ++++++++++++++-
>  arch/riscv/Kconfig.socs             | 32 -----------------------------
>  arch/riscv/boot/dts/Makefile        |  2 +-
>  arch/riscv/boot/dts/canaan/Makefile |  2 --
>  4 files changed, 16 insertions(+), 36 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index b49016bb5077..23d501561e64 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -996,7 +996,21 @@ config RISCV_ISA_FALLBACK
>  config BUILTIN_DTB
>  	bool "Built-in device tree"
>  	depends on OF && NONPORTABLE
> -	default y if XIP_KERNEL
> +	default y if XIP_KERNEL || SOC_CANAAN
> +	help
> +	  Build a device tree into the Linux image.
> +	  This option should be selected if no bootloader is being used.
> +	  If unsure, say Y.
> +
> +
> +config BUILTIN_DTB_SOURCE
> +	string "Built-in device tree source"
> +	depends on BUILTIN_DTB
> +	default "canaan/k210_generic" if SOC_CANAAN
> +	help
> +	  DTS file path (without suffix, relative to arch/riscv/boot/dts)
> +	  for the DTS file that will be used to produce the DTB linked into the
> +	  kernel.
> =20
>  endmenu # "Boot options"
> =20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index e08e91c49abe..623de5f8a208 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -84,36 +84,4 @@ config SOC_CANAAN
>  	help
>  	  This enables support for Canaan Kendryte K210 SoC platform hardware.
> =20
> -if ARCH_CANAAN
> -
> -config ARCH_CANAAN_K210_DTB_BUILTIN
> -	def_bool SOC_CANAAN_K210_DTB_BUILTIN
> -
> -config SOC_CANAAN_K210_DTB_BUILTIN
> -	bool "Builtin device tree for the Canaan Kendryte K210"
> -	depends on ARCH_CANAAN
> -	default y
> -	select OF
> -	select BUILTIN_DTB
> -	help
> -	  Build a device tree for the Kendryte K210 into the Linux image.
> -	  This option should be selected if no bootloader is being used.
> -	  If unsure, say Y.
> -
> -config ARCH_CANAAN_K210_DTB_SOURCE
> -	string
> -	default SOC_CANAAN_K210_DTB_SOURCE
> -
> -config SOC_CANAAN_K210_DTB_SOURCE
> -	string "Source file for the Canaan Kendryte K210 builtin DTB"
> -	depends on ARCH_CANAAN
> -	depends on ARCH_CANAAN_K210_DTB_BUILTIN
> -	default "k210_generic"
> -	help
> -	  Base name (without suffix, relative to arch/riscv/boot/dts/canaan)
> -	  for the DTS file that will be used to produce the DTB linked into the
> -	  kernel.
> -
> -endif # ARCH_CANAAN
> -
>  endmenu # "SoC selection"
> diff --git a/arch/riscv/boot/dts/Makefile b/arch/riscv/boot/dts/Makefile
> index 72030fd727af..318239d9423b 100644
> --- a/arch/riscv/boot/dts/Makefile
> +++ b/arch/riscv/boot/dts/Makefile
> @@ -8,4 +8,4 @@ subdir-y +=3D sophgo
>  subdir-y +=3D starfive
>  subdir-y +=3D thead
> =20
> -obj-$(CONFIG_BUILTIN_DTB) :=3D $(addsuffix /, $(subdir-y))
> +obj-$(CONFIG_BUILTIN_DTB) :=3D $(addsuffix .dtb.o, $(CONFIG_BUILTIN_DTB_=
SOURCE))
> \ No newline at end of file
> diff --git a/arch/riscv/boot/dts/canaan/Makefile b/arch/riscv/boot/dts/ca=
naan/Makefile
> index 520623264c87..987d1f0c41f0 100644
> --- a/arch/riscv/boot/dts/canaan/Makefile
> +++ b/arch/riscv/boot/dts/canaan/Makefile
> @@ -5,5 +5,3 @@ dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maix_bit.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maix_dock.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maix_go.dtb
>  dtb-$(CONFIG_ARCH_CANAAN) +=3D sipeed_maixduino.dtb
> -
> -obj-$(CONFIG_ARCH_CANAAN_K210_DTB_BUILTIN) +=3D $(addsuffix .dtb.o, $(CO=
NFIG_ARCH_CANAAN_K210_DTB_SOURCE))
> --=20
> 2.43.0
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--Fp5d1QqaibeYLKMo
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZdVNrQAKCRB4tDGHoIJi
0sFAAP4h5Qi4wUH4zI2ZIpYCW4U7sB6GTty5lWkHW6FWrypX4AD/TYWKB0d+Ksve
mhB9mhYApbgHPMDwnSKtULPRnM7Hswg=
=hNmM
-----END PGP SIGNATURE-----

--Fp5d1QqaibeYLKMo--


--===============5491562056349169362==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5491562056349169362==--

