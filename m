Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE45CC4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 15:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0pPIjV0TrDrBXE0RY0ePhRhhWRvjEJZKjP0Tj9OhYI=; b=lGV3Egdn1GqvFk7sesUg/0DYET
	iiso6CAqXVqKIIkMCBFGAr/xe4VSUp+J6sfeJSkQB6rFP1NrqBMWebJBvytUt3te5zShW7q/OeO72
	yfNguJyQBf+Yv9rA3xfrpDUc3NkBwUZmIV0R3S/p9uornkjr9uTeV4ivHp5alotJxQ9f3MdTM6Z0R
	VffQlHbrN1aboijrNOwSkP7abrLjXX9n/pfjdkNo3x2jyB09qNoMHKpsGaF88Q+qN4f/q1UTcl2Ag
	+WkXQ5ou0pgep1W9EZuVLCrdC/RVI8A3pGl3SQpfInmfD1usROnun/atYWNu14XLmvU2ncasAmwKE
	Ah0vg9EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Yeu-0000000DAxe-0Hu5;
	Thu, 02 May 2024 15:47:44 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2Yer-0000000DAwg-1TEg
	for linux-riscv@lists.infradead.org;
	Thu, 02 May 2024 15:47:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0C736CE174E;
	Thu,  2 May 2024 15:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C94BCC113CC;
	Thu,  2 May 2024 15:47:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714664857;
	bh=K38Qzg9vtdLwa/E8SOuIfqtUwx3/9xbQ0FyRceQT94o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lX+LA9QhBEtnMLXf2qQMCTVnD4XVeZVZ9v9aUlLh54ui8c/E4+CnZ+q8deL0RkaIC
	 yPtQNnWCD//ihfW3Y/3JaFk/F9yc1qQMEq3rWDUxcVpKWn5G1jXBOm1U1H93zB5yaG
	 RLCyhRX9xJ52t5U9JW1OYrsyf7Yeu879vqtN77pYXnVFNwnOS9xZgWoGRijCpSIoUC
	 1v/hNV/QT/s+QIje6nu5D1RWsm37W24D0gEP/g4PtsXclXzAi85tPsrRlc9FJPbMhc
	 nlJjgFeKoq0PyQTkBTvLY/s+yulFYvkfMnPtNB9JtrmJerPxlr8O9xnPVK4gsaxc1q
	 NcSGe0PCpDUTg==
Date: Thu, 2 May 2024 16:47:32 +0100
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH 3/3] spi: spi-microchip-core: Fix the number of chip
 selects supported
Message-ID: <20240502-jailhouse-porridge-3e3cf7fe5bff@spud>
References: <20240502143410.12629-1-prajna.rajendrakumar@microchip.com>
 <20240502143410.12629-4-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240502143410.12629-4-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_084741_594196_57556803 
X-CRM114-Status: GOOD (  17.65  )
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
Content-Type: multipart/mixed; boundary="===============8666338154777248310=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============8666338154777248310==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="OBnlOd1dmj9M7N71"
Content-Disposition: inline


--OBnlOd1dmj9M7N71
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 02, 2024 at 03:34:10PM +0100, Prajna Rajendra Kumar wrote:
> The SPI controller in PolarFire SoC has multiple chip selects, but only
> one is wired up in the MSS. Therefore, fix the driver to chose one
> chip select.

Given Krzysztof's comments on the binding "only one is wired up in the
MSS" probably means nothing to anyone other than us, and we should
rephrase this so that we explain what this actually means.
The actual change is fine to me though, since I do understand what's
being said here. With a revised commit message:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

>=20
> Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers=
")
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
> ---
>  drivers/spi/spi-microchip-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index 71886c27bca3..4289dfba9af5 100644
> --- a/drivers/spi/spi-microchip-core.c
> +++ b/drivers/spi/spi-microchip-core.c
> @@ -21,7 +21,7 @@
>  #include <linux/spi/spi.h>
> =20
>  #define MAX_LEN				(0xffff)
> -#define MAX_CS				(8)
> +#define MAX_CS				(1)
>  #define DEFAULT_FRAMESIZE		(8)
>  #define FIFO_DEPTH			(32)
>  #define CLK_GEN_MODE1_MAX		(255)
> --=20
> 2.25.1
>=20
>=20

--OBnlOd1dmj9M7N71
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZjO1lAAKCRB4tDGHoIJi
0vsQAP9/OdCw/6S0RNS/dhjNw9pFJq2YFuMdXEaLFb7dPziZSAD+IkzFjvRoOFQc
Y8+KyytsVQfkrajM+tEM3gpq7XvxDw4=
=DudQ
-----END PGP SIGNATURE-----

--OBnlOd1dmj9M7N71--


--===============8666338154777248310==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============8666338154777248310==--

