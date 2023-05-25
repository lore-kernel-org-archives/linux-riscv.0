Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD6BDC77B7E
	for <linux-riscv@archiver.kernel.org>; Thu, 25 May 2023 06:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:CC:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gTj6qE4NFOy6556TAXvWwKLYo9mlIKXhLXPC1srX11c=; b=AawuxMbfQTzLr35A/B6W8ZO0hM
	ywe9LLSGoGWTWZNPwYYnYAil1o5vaFMw0Py0qdZNMx+Js0d36b/V3GRSBi7Fq8w32uFcaE4NtlVbu
	/LE8paIj0vSgMi9tL9pgj7WnWUUWEisHUzJEtQRVvnjZz1QtL7qOMS1DFgZUhdbV/GaVTdK1KgdWV
	gv44k3tMI5MtNvMhKl2g6s/1Km69Jp1JPHmioVGD6JwVqlmmS+J5S6HXftF0OBCJV9jxijtGrxH+t
	lgb/OkXHZelNdkuOC7s8mDyujH3uUDxORuOVajTC99/nsz7dlopI3apGXiRi1R7SFiqxPL9gquTuA
	Rkhcyc/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q24O2-00FfvD-2E;
	Thu, 25 May 2023 06:23:46 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q24Ny-00Fftv-2w
	for linux-riscv@lists.infradead.org;
	Thu, 25 May 2023 06:23:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684995822; x=1716531822;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Ghme1meWK1ImCCdM1WzI68Ss/WXHp7TVgzNVm+Epnjc=;
  b=RczkdCOUtuOqpqDM954XfZqrqfBr2g+JHO+U/YkTEKdI2zfkekcrdjsO
   LGyB1bJe35fG8PI9g06ZXXJ70cXVy0iSwxThZcJmatRXXMgm4MqH9Q0ej
   TH242hYcbnwPQXaWz3FGBrXYaUna9qb69luFJo2FPgL/+3q17ZnzZdaof
   0VQxxT8818TvYBkU2JHEjK6L3yLXXYrW8/MAuqQW5mswu+B8akO34aiiN
   rGrf+fDkM+yb11d9x/oxti9O2GHj5ql7sqmk1+imxQPbubGbGt4340wJ+
   e/FZw3MfO6/JJUspMRfsF3zfcRfoA64Q5Zk6NuK7VTeSke+AgUS6Nvb85
   g==;
X-IronPort-AV: E=Sophos;i="6.00,190,1681196400"; 
   d="asc'?scan'208";a="226922975"
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 24 May 2023 23:23:36 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 24 May 2023 23:23:36 -0700
Received: from wendy (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Wed, 24 May 2023 23:23:35 -0700
Date: Thu, 25 May 2023 07:23:12 +0100
From: Conor Dooley <conor.dooley@microchip.com>
To: Jia Jie Ho <jiajie.ho@starfivetech.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	<linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] riscv: Kconfig: Add select ARM_AMBA to SOC_STARFIVE
Message-ID: <20230525-palm-sponge-982d6591a791@wendy>
References: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230525061836.79223-1-jiajie.ho@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230524_232342_957745_7B68EDBC 
X-CRM114-Status: GOOD (  15.16  )
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
Content-Type: multipart/mixed; boundary="===============7309660070691341422=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============7309660070691341422==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="ylMnpRf4XX0fWufC"
Content-Disposition: inline

--ylMnpRf4XX0fWufC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 25, 2023 at 02:18:36PM +0800, Jia Jie Ho wrote:
> Selects ARM_AMBA platform support for StarFive SoCs required by spi and
> crypto dma engine.

Thanks for sending this.
@Palmer, this depends on another commit not to introduce a build
breakage. I'll assign it to myself on patchwork and grab it when it is
okay to take.

Cheers,
Conor.

> Signed-off-by: Jia Jie Ho <jiajie.ho@starfivetech.com>
> ---
>  arch/riscv/Kconfig.socs | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/arch/riscv/Kconfig.socs b/arch/riscv/Kconfig.socs
> index 1cf69f958f10..381cd46e6373 100644
> --- a/arch/riscv/Kconfig.socs
> +++ b/arch/riscv/Kconfig.socs
> @@ -29,6 +29,7 @@ config SOC_STARFIVE
>  	bool "StarFive SoCs"
>  	select PINCTRL
>  	select RESET_CONTROLLER
> +	select ARM_AMBA
>  	help
>  	  This enables support for StarFive SoC platform hardware.
> =20
> --=20
> 2.25.1
>=20

--ylMnpRf4XX0fWufC
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZG7+xgAKCRB4tDGHoIJi
0k9pAQDUpqkrJRbYh5sYq+n3pPlZLrQc///FQAFjI7KN3QmScQD+MFimNIW8AIW7
pZdF4NL8P0bEjKDODFMC0ootIH+67A8=
=DagS
-----END PGP SIGNATURE-----

--ylMnpRf4XX0fWufC--


--===============7309660070691341422==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============7309660070691341422==--

