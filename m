Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B21D7C282D1
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Mar 2025 17:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sOODspAymZZy38QBr058l7sWeUsyxRs7LYKgQrTXmjI=; b=iOPwIoA2+lSLwu5xrfOTPPIH51
	3akvTriOn8BsHHF/bb5Rl0him9ID/rT6ypc2Dd6HHFlEpmLmMX2JZXOoTnzkIgKKlG86ydbiJzsAQ
	+GuIlo6h87yfaRRsba5ZPUrifWr/gfYopf3QVsLpng/KL09FrPV9ihZcRYo79WMXNClkOArcRrWLA
	qKVYdnBsR+55Grg4ftYR7MWT/BgifN5BRbOznvJb6uqMxUqeo/CD65veiG+gY7aGP/g0vWOmR0Aox
	SFe35C6DlYlnwXQpTaj0BkPbvtYP+ay3lDIGkbdhtjAdVRyGGTTgntGeIlwcI8GN9qXr54H9oSxBR
	6FxK+K6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqFLB-0000000BjWb-3v9m;
	Thu, 06 Mar 2025 17:49:01 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqEHG-0000000BXlt-1rzF
	for linux-riscv@lists.infradead.org;
	Thu, 06 Mar 2025 16:40:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B78025C56FC;
	Thu,  6 Mar 2025 16:38:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4DC1C4CEE0;
	Thu,  6 Mar 2025 16:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741279253;
	bh=qmew9N890LQz41I96G6gTo7b5NoYq+LHIcuWvtAjqhE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pk3KX6zpLRYFtaeOOU7LCDCvqGq34e3+EOgp7JiSmyNicg7sVkdl4uRjjnxHdk7jZ
	 X6kETBuFILbvSBkAwbeMGKSbNMMVkVCEO9cudPYoXGug0BdVtTYyesIXUxQTbsdrSm
	 YYdM1wRn8/6/rQY2OgD1aPznovKMSOY9rQxnS8C4ccmkDK2h8nnDPpB3+xZ7hWDccI
	 AOQ+lVSodp29JFSCCox/Le1hxESOTUEH4B6RT7gPERd6JM+JiWqvt99ctAL66Bo9ou
	 6Wy5hjWdgF+QQjiGeNiapOaNdXE5zWmEWBdMB9j/DzDzO+rxWZT/OYziBwB3+uHfTE
	 sMEomaEAHqJmw==
Date: Thu, 6 Mar 2025 16:40:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Ben Zong-You Xie <ben717@andestech.com>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	alex@ghiti.fr
Subject: Re: [PATCH] riscv: add Andes SoC family Kconfig support
Message-ID: <20250306-finale-chatroom-c620ff284d8c@spud>
References: <20250305030526.1986062-1-ben717@andestech.com>
MIME-Version: 1.0
In-Reply-To: <20250305030526.1986062-1-ben717@andestech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_084054_597110_A0AE1DD4 
X-CRM114-Status: GOOD (  20.13  )
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
Content-Type: multipart/mixed; boundary="===============2985363486262222644=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2985363486262222644==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vQim4Phh7trms/cN"
Content-Disposition: inline


--vQim4Phh7trms/cN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 05, 2025 at 11:05:26AM +0800, Ben Zong-You Xie wrote:
> The first SoC in the Andes series is QiLai. It includes a high-performance
> quad-core RISC-V AX45MP cluster and one NX27V vector processor.

I'd expect a config option like this to come with the user, which in
this case is the dts etc for a board using the QiLai SoC or drivers for
the SoC. Without dts or drivers, there's no reason to ever enable this,
so where are those patches?

Cheers,
Conor.

>=20
> For further information, refer to [1].
>=20
> [1] https://www.andestech.com/en/products-solutions/andeshape-platforms/q=
ilai-chip/
>=20
> Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
> ---
>  arch/riscv/Kconfig.errata | 2 +-
>  arch/riscv/Kconfig.socs   | 9 +++++++++
>  2 files changed, 10 insertions(+), 1 deletion(-)
>=20
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index e318119d570d..be76883704a6 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -12,7 +12,7 @@ config ERRATA_ANDES
> =20
>  config ERRATA_ANDES_CMO
>  	bool "Apply Andes cache management errata"
> -	depends on ERRATA_ANDES && ARCH_R9A07G043
> +	depends on ERRATA_ANDES && (ARCH_R9A07G043 || ARCH_ANDES)
>  	select RISCV_DMA_NONCOHERENT
>  	default y
>  	help
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1916cf7ba450..b89b6e0d1bc9 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -1,5 +1,14 @@
>  menu "SoC selection"
> =20
> +config ARCH_ANDES
> +	bool "Andes SoCs"
> +	depends on MMU && !XIP_KERNEL
> +	select ERRATA_ANDES
> +	select ERRATA_ANDES_CMO
> +	select AX45MP_L2_CACHE
> +	help
> +	  This enables support for Andes SoC platform hardware.
> +
>  config ARCH_MICROCHIP_POLARFIRE
>  	def_bool ARCH_MICROCHIP
> =20
> --=20
> 2.34.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--vQim4Phh7trms/cN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ8nQEQAKCRB4tDGHoIJi
0jT2AQCKZVdssBZSIJkKffobBzbN32p6AzBmy+PGIjHiz6mE4AEAzKZDacmHtjVO
6HyA1zLnh9IEm1KF3Oy+O/ZEhBNJ0ww=
=14cR
-----END PGP SIGNATURE-----

--vQim4Phh7trms/cN--


--===============2985363486262222644==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2985363486262222644==--

