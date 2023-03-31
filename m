Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F54DC761AF
	for <linux-riscv@archiver.kernel.org>; Fri, 31 Mar 2023 10:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aiBYkEkUd1MXD12XELwELDpsELVwBRWIQKLHU3jmIXA=; b=gGNRkGLfIqp1FaeIfN9Ubkdsqu
	c0WhGlCT9maAjvYDJ9rFQbhUAYTyxMM7IYJARUmTVRIFVE0yupgneLejNf3J5K7sHFmVC/qSfm1aX
	4AaEN95+QSgcfCe7eR1yZxVAIradsWb0922Djovq/i7ER6xJhjexl43ziLWmBCtTusCgOJKepoIXj
	kcN7s7XzPcdPiw55D51CXubQ/3Nf49bRM2fBLDZzcoxDjzyc6hfEHtY2ByuOKqHD3odvxOsRMYTGQ
	RUOp+sDVnUl1V/vloEtOjUhZPchfZlaP6TSnjo/Mgf81MMzZ1OZTK0qj+WLHTq2jXgaEeBCoJufBI
	6L90t2dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1piCPw-0070b9-15;
	Fri, 31 Mar 2023 10:55:36 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1piCPt-0070aV-1I
	for linux-riscv@lists.infradead.org;
	Fri, 31 Mar 2023 10:55:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1680260133; x=1711796133;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=fmFXNjlDNk/NwlvKemf9I4yf1T0EbLEfb7ypDG0gvOg=;
  b=uQKKseIUQkDZ04FpXyOA/S3+SFUvc0Rlayxz61CACuNAtH3wWWyT5cEN
   Fvlkw7Kol6kWxXPxKSbT/h7hllwyohcAyczjAVJbgSHxgXoIhPsngLrYz
   7U1ps+ve7w0IJGpsL945k3TsvzGIcUcd7D4PEA9Op3x93yUE7sQquz3T6
   UsT6d6a1o/YDYbIrmHJu1CfRs+Na7Yft8wtB4o5T5Xh7BaqSpeQ4ZY7+u
   GPn/hhqh7Espa/scTduds12+iZONMU7CH+dY4LC0tNR1bNx37UOihUHBK
   7ggDLZJ4bI4JQRnlC99fO5pFQf6dpbf78dKmA5lutm0+6M79/EA3uJUgo
   A==;
X-IronPort-AV: E=Sophos;i="5.98,307,1673938800"; 
   d="asc'?scan'208";a="207170249"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 31 Mar 2023 03:55:32 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Fri, 31 Mar 2023 03:55:31 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Fri, 31 Mar 2023 03:55:29 -0700
Date: Fri, 31 Mar 2023 11:55:15 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
CC: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven
	<geert+renesas@glider.be>, Heiko =?iso-8859-1?Q?St=FCbner?=
	<heiko@sntech.de>, guoren <guoren@kernel.org>, Andrew Jones
	<ajones@ventanamicro.com>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Samuel
 Holland <samuel@sholland.org>, <linux-riscv@lists.infradead.org>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Linux-Renesas
	<linux-renesas-soc@vger.kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>,
	"Lad, Prabhakar" <prabhakar.mahadev-lad.rj@bp.renesas.com>
Subject: Re: [PATCH v7 1/6] riscv: mm: dma-noncoherent: Switch using function
 pointers for cache management
Message-ID: <50e932df-cb20-4679-b911-fd9d7f0f2c1d@spud>
References: <20230330204217.47666-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20230330204217.47666-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <6ca5941a-8803-477d-8b40-17292decc5af@app.fastmail.com>
 <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CA+V-a8tkiDXG37YjFKPxrGoXVQMVBemMdBcfb+uUDzBofOWH_A@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230331_035533_452471_DFE34740 
X-CRM114-Status: GOOD (  18.54  )
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
Content-Type: multipart/mixed; boundary="===============6963101298250748719=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============6963101298250748719==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="CSbvtOdTMuQLjL4r"
Content-Disposition: inline

--CSbvtOdTMuQLjL4r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 31, 2023 at 11:37:30AM +0100, Lad, Prabhakar wrote:

> > As far as I recall, the #else path here was needed previously
> > to work around a binutils dependency, but with the current
> > code, it should be possible to just always enable
> > CONFIG_RISCV_ISA_ZICBOM when RISCV_DMA_NONCOHERENT is used.
> >
> Are you suggesting something like below?
>=20
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 4dadf35ac721..a55dee98ccf8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -242,6 +242,7 @@ config RISCV_DMA_NONCOHERENT
>         select ARCH_HAS_SYNC_DMA_FOR_CPU
>         select ARCH_HAS_SYNC_DMA_FOR_DEVICE
>         select DMA_DIRECT_REMAP
> +       select RISCV_ISA_ZICBOM
>=20
>  config AS_HAS_INSN
>         def_bool $(as-instr,.insn r 51$(comma) 0$(comma) 0$(comma)
> t0$(comma) t0$(comma) zero)
> @@ -465,7 +466,6 @@ config RISCV_ISA_ZICBOM
>         depends on MMU
>         depends on RISCV_ALTERNATIVE
>         default y
> -       select RISCV_DMA_NONCOHERENT
>         help
>            Adds support to dynamically detect the presence of the ZICBOM
>            extension (Cache Block Management Operations) and enable its
>

Does that actually work? I don't think it does.
If you try to enable RISCV_ISA_ZICBOM then you won't get
RISC_DMA_NONCOHERENT turned on. Run menuconfig and disable support for
Renesas, SiFive and T-Head SoCs & you can replicate.

I think one of RISCV_ISA_ZICBOM and RISCV_DMA_NONCOHERENT should just be
dropped, although I don't know which one to pick!
Making RISCV_DMA_NONCOHERENT user selectable probably makes the most
sense.


--CSbvtOdTMuQLjL4r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZCa8EwAKCRB4tDGHoIJi
0gv8AQDmXopbmBtrwgpdT70H1KpMBgB8DRztldVostbpyT7KpAEA2JJggZT9ayUa
tSrS0FeAl7Q+HC4ExyMuP+/iqLDQLAQ=
=rDeY
-----END PGP SIGNATURE-----

--CSbvtOdTMuQLjL4r--


--===============6963101298250748719==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6963101298250748719==--

