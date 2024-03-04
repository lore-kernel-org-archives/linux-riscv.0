Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54619C48BF6
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Mar 2024 10:31:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G2Kt3abGXbsVzIufQPiygZeS/xjOUe2vOXctaV4TUb8=; b=RHHCdb3LmwRcksiwxVaIQoELcx
	q03zppADM3IoTKkcePOPF4Pab7NL3Yvm/UN9G0RY2rxPeAvkm+JhGEmHD/nNbVfP/mo7WMf7EJEh8
	p6cb2Xn1rudcNupxHV+JJJ+/Q2w+aEd+gQufg6sFlIIfA5MBr0Pze9SgEs/lnEo5LpYCQzcBl+UaW
	rxjA0w2C1WR1OurciwaieIz8BOeyrw+iWB5MWcV2IKaoUrlJina7L8GQc3skn5pEhIlr+PVqpQk5p
	KIRIGH9McWuLRH41bX2YGeFIoH3VtjJQVnMDg7/9zeKa2AEKhX5nfNR8dZS48aaP0xA01zhAy6gQL
	RAG7MjKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5bi-00000008dFy-2Jq0;
	Mon, 04 Mar 2024 10:31:42 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rh5QI-00000008Zdl-2lz1
	for linux-riscv@lists.infradead.org;
	Mon, 04 Mar 2024 10:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1709547594; x=1741083594;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oAwVOvhNSYIJcvi3KYz9lODQVXjEBbjFSOCNDTXHkGU=;
  b=Vshu1ampPiqd+WHO3renK91BhvwSJfSxsz8kYUpG//zOWSqmjeL367A4
   xHsaPSRGyF9KMMCKFbF5a5qpToHYwAfk5O6oRHotPapa98GaKnMJNLX3W
   81ZyGFpOjCwIxd5tNoSgPh5qHRoHqmOVFR1A8NTuajd5u9i4hlKJuRdEr
   A7++Jhy0yKosGnIkoSvevP1t2hd1ExipqbHbgcl0wgRW3dl07iDzBtgcQ
   xZPZ5fi911h/uaI1JU5HcfhF88CXS8xZeZHDcZKXyYd4EAKx53YZbGwvd
   iRK4RlT16fFxXOvKR4R7DD9doStSZvZKckK6iAH7FD1AxB2OPMeIWtopN
   w==;
X-CSE-ConnectionGUID: GTh8GKPTQM2QJHexAl2qug==
X-CSE-MsgGUID: qt1xL4hmQbGjG2oZQGGyKQ==
X-IronPort-AV: E=Sophos;i="6.06,203,1705388400"; 
   d="asc'?scan'208";a="17693872"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 04 Mar 2024 03:19:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Mar 2024 03:19:36 -0700
Received: from wendy (10.10.85.11) by chn-vm-ex04.mchp-main.com (10.10.85.152)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.35 via Frontend
 Transport; Mon, 4 Mar 2024 03:19:34 -0700
Date: Mon, 4 Mar 2024 10:18:50 +0000
From: Conor Dooley <conor.dooley@microchip.com>
To: Yangyu Chen <cyy@cyyself.name>
CC: <linux-riscv@lists.infradead.org>, Conor Dooley <conor@kernel.org>, Rob
 Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley
	<paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 3/5] riscv: Kconfig.socs: Allow SOC_CANAAN with MMU for
 K230
Message-ID: <20240304-henna-verbalize-c206ba771a9e@wendy>
References: <tencent_E15F8FE0B6769E6338AE690C7F4844A31706@qq.com>
 <tencent_4F1B21F8A605B7B4091DBB70B5635442BE09@qq.com>
MIME-Version: 1.0
In-Reply-To: <tencent_4F1B21F8A605B7B4091DBB70B5635442BE09@qq.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240304_021956_043132_A556E521 
X-CRM114-Status: GOOD (  16.19  )
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
Content-Type: multipart/mixed; boundary="===============2565104944576299851=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2565104944576299851==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jHXxCXVHqhS+kbK3"
Content-Disposition: inline

--jHXxCXVHqhS+kbK3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 03, 2024 at 09:26:25PM +0800, Yangyu Chen wrote:
> Since K230 was released, SOC_CANAAN is no longer only referred to the K21=
0.
> Remove it depends on !MMU will allow building dts for K230 and remove the
> K210 string from the help message.
>=20
> Signed-off-by: Yangyu Chen <cyy@cyyself.name>

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  arch/riscv/Kconfig.socs | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 623de5f8a208..b4e9b7f75510 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -75,13 +75,12 @@ config ARCH_CANAAN
>  	def_bool SOC_CANAAN
> =20
>  config SOC_CANAAN
> -	bool "Canaan Kendryte K210 SoC"
> -	depends on !MMU
> +	bool "Canaan Kendryte SoC"
>  	select CLINT_TIMER if RISCV_M_MODE
>  	select ARCH_HAS_RESET_CONTROLLER
>  	select PINCTRL
>  	select COMMON_CLK
>  	help
> -	  This enables support for Canaan Kendryte K210 SoC platform hardware.
> +	  This enables support for Canaan Kendryte SoC platform hardware.
> =20
>  endmenu # "SoC selection"
> --=20
> 2.43.0
>=20

--jHXxCXVHqhS+kbK3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZeWgCgAKCRB4tDGHoIJi
0vUCAQD0CoV1uSDQ7JiawSnX85ZEZiRg4TPZmr77Rl0SGLt59QD/f9B6sx7gnPhW
rqAFj5vm3UQ/ZofMS/3ltXvO8/WkNA4=
=vnEB
-----END PGP SIGNATURE-----

--jHXxCXVHqhS+kbK3--


--===============2565104944576299851==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2565104944576299851==--

