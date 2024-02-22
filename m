Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D54CC48BF8
	for <linux-riscv@archiver.kernel.org>; Thu, 22 Feb 2024 21:06:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n28WZ2mCe5RulvIzNimawI+UAaJZEYiGkn8ro9TBJXE=; b=4y6FTfXFg4ceqqy3XMZNaAH5nd
	jkjDDDMklVzWArXuLLI861ewP979AIHpw2WaheIPScd/8BEgsaXWeyu83++6aK6ohqVYCXLWag3Vx
	Pvz+aAGbus235zoiRSw5Ow7FD9SrqjDtctU/GiwtXqRR8wNfcI+6z6w99WUFORe2XiuPK2BcdiktS
	8/5Zb+tO+nn12iotMcUBBYBxNGsQZl8g8JqPGCM4QFlTt7KxcsJnvn84ICyRTJCqYdXli64OKjQrR
	tn6WhfXtPMCtisfptA1QAFv85XPDzAh5e4ba6blwxQ13dQLEy2vSZXOSrJXZObaohUKqb+G8dePku
	OW13rRfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGGb-00000006b1h-1lg9;
	Thu, 22 Feb 2024 21:06:05 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rdGGY-00000006b1G-10jJ
	for linux-riscv@lists.infradead.org;
	Thu, 22 Feb 2024 21:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 78FFECE225A;
	Thu, 22 Feb 2024 21:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7AE9C433C7;
	Thu, 22 Feb 2024 21:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708635959;
	bh=U58sud556eDeQ1ZmImtKrBLUvfMuIE+mzW0XTCAiPso=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LzRRZwXidNQzDxeJIbnP4nNXwp+aEQYkFr6bel+eg3jxqQJtKMRG5WULKe+Az0SJH
	 QTWLexadcq60LJgYMmy/t2OD1pRUKuLkjMjxZ49eutxO0Rd4LnylMLRymWOy0KgEZQ
	 abHQdGj5bxoqH3xKhLrgVbJrVE4Rc74QSkEMbIiQig0vu6kO5yCE58FYNzDmkUKSF9
	 UCNoS7zUQfcTFRLXHgcnrDGhglnCpGcgBfaaHMCXZ/tiDP/WMzn8bnd+EHSKO7D6f8
	 8HTO8hxVXSNdQiumIaFDZmZf4Cus+wCT1ZKAcTJ3EzypWz2VW5WhyPxJUul6x/wYDr
	 JzQn38Zj1f3Xw==
Date: Thu, 22 Feb 2024 21:05:55 +0000
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
Message-ID: <20240222-wound-dedicate-8622374372c0@spud>
References: <tencent_AB625442CC1BCFF86E04D7B5891C43719109@qq.com>
 <tencent_C9E0DAC75884B0346EF2250A5E68673BA20A@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_C9E0DAC75884B0346EF2250A5E68673BA20A@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240222_130602_650083_2024DEB9 
X-CRM114-Status: GOOD (  21.77  )
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
Content-Type: multipart/mixed; boundary="===============3393943580405638639=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============3393943580405638639==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5zmUS5d2XUx6ACNS"
Content-Disposition: inline


--5zmUS5d2XUx6ACNS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey,

On Wed, Feb 21, 2024 at 03:03:57AM +0800, Yangyu Chen wrote:
> The BUILTIN_DTB kernel feature on RISC-V only works on K210 SoC only. This
> patch moved this configuration to entire riscv.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>
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

s/SOC/ARCH/

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

I think we should drop this default, I don't think that "k210_generic"
should really exist in the first place. And suggest that there are
platform-wide default devicetrees isn't something I think should be
encouraged.

> +	help
> +	  DTS file path (without suffix, relative to arch/riscv/boot/dts)
> +	  for the DTS file that will be used to produce the DTB linked into the
> +	  kernel.
> =20
>  endmenu # "Boot options"

> -config SOC_CANAAN_K210_DTB_BUILTIN
> -config SOC_CANAAN_K210_DTB_SOURCE

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

There are two more instances of this that need to be removed.

Thanks,
Conor.

--5zmUS5d2XUx6ACNS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZde3MwAKCRB4tDGHoIJi
0ryjAP911F6vJIsVOELuA0YuESC2m71QaGZIPmuzmNmO5beULgEA3vRKcYuNh9//
rbNn0MGJyAPpzfbA5l3oinawqjujDgA=
=abz2
-----END PGP SIGNATURE-----

--5zmUS5d2XUx6ACNS--


--===============3393943580405638639==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============3393943580405638639==--

