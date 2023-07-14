Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66CDDEB64DC
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Jul 2023 18:51:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Az0noi86COzJO6qjLY7NgC/RoPXNzTLYkxmzVwzmeIQ=; b=XTAZBamuyczq/zivrBOM5nDR2w
	cquu+OOMFJwNAWWiWLBCznSXVXjmPB6rhh8eq8M0N0iioFEculD7/fRFDU+ldc62Pz7QO94MFs0/7
	npa2ElBshmY0xIZRStXGko2YQXdv8DZuc6b0p55r19y+IZ3KyWQSJpyeXZZakdX2iPK8W6FD//JH4
	hOSqkbYACUEf9w8WDmnzena2zqg/qgqvlMfco8JQQY+yZXY9sjBCcQFKlad5XIvR0jWEsubpMQs0W
	0K/lV5eqSwEkfOAfEKhcfQGtJotGN4kwSK+v7Gv3Prb/5+3aJr/ItCOzyGQSD4PqEmXJHeEMoPgEV
	f2SXcvLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNtA-0071O9-31;
	Fri, 14 Jul 2023 18:51:36 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qKNt7-0071NK-1F;
	Fri, 14 Jul 2023 18:51:34 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 580BE61DAE;
	Fri, 14 Jul 2023 18:51:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC148C433C7;
	Fri, 14 Jul 2023 18:51:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689360691;
	bh=75P5bsMunT6wijRx+XHlIke36CUI4vRQg315QeNciy8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Bx45JmWpw3YldzFhH5s6ix/Rdr46B/eBj7iAH367RmnbohY7JRDobL8hUeX0QE1KN
	 KNP8spldtJRSz8iF7X2sx3IpZXAtOuMwpXe6cmm0R8FTLs99BcFRtDiu4a1dMwzzLo
	 0wwTu1ijAw70sv/lB3BPPty4yS+6fWjN9lQWKZ8OH7+sVQBwRhS5spTQqbBqXVWM0B
	 0jNrwkOGIRmXsfODczggwzths92xZqqUHA7a923G0fvVHcC1fBJZdTcpW4CgmnZn07
	 bT8F4SfYnJFfPOSUdOZ8xVJYOmPs59277wdk6MPsw4y1bk5rozKtOBx25BjfthBx6e
	 NKlSMBMPJCc3Q==
Date: Fri, 14 Jul 2023 19:51:27 +0100
From: Conor Dooley <conor@kernel.org>
To: Rob Herring <robh@kernel.org>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH] soc: microchip: Explicitly include correct DT includes
Message-ID: <20230714-handcart-batting-e805e7567231@spud>
References: <20230714175139.4067685-1-robh@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20230714175139.4067685-1-robh@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230714_115133_505878_AE789C5C 
X-CRM114-Status: GOOD (  19.32  )
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
Content-Type: multipart/mixed; boundary="===============4842456359881034459=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============4842456359881034459==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="jizOvC+TdPQbkhjW"
Content-Disposition: inline


--jizOvC+TdPQbkhjW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 14, 2023 at 11:51:38AM -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
>=20
> Signed-off-by: Rob Herring <robh@kernel.org>

Hmm, usually these go to different places. I'll push them both to the
at91 repo.

> ---
>  drivers/soc/atmel/sfr.c                     | 1 -
>  drivers/soc/microchip/mpfs-sys-controller.c | 2 +-
>  2 files changed, 1 insertion(+), 2 deletions(-)
>=20
> diff --git a/drivers/soc/atmel/sfr.c b/drivers/soc/atmel/sfr.c
> index 0525eef49d1a..cc94ca1b494c 100644
> --- a/drivers/soc/atmel/sfr.c
> +++ b/drivers/soc/atmel/sfr.c
> @@ -10,7 +10,6 @@
>  #include <linux/nvmem-provider.h>
>  #include <linux/random.h>
>  #include <linux/of.h>
> -#include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> =20
> diff --git a/drivers/soc/microchip/mpfs-sys-controller.c b/drivers/soc/mi=
crochip/mpfs-sys-controller.c
> index 216d9f4ea0ce..fbcd5fd24d7c 100644
> --- a/drivers/soc/microchip/mpfs-sys-controller.c
> +++ b/drivers/soc/microchip/mpfs-sys-controller.c
> @@ -13,7 +13,7 @@
>  #include <linux/module.h>
>  #include <linux/jiffies.h>
>  #include <linux/interrupt.h>
> -#include <linux/of_platform.h>
> +#include <linux/of.h>
>  #include <linux/mailbox_client.h>
>  #include <linux/platform_device.h>
>  #include <soc/microchip/mpfs.h>
> --=20
> 2.40.1
>=20
>=20
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--jizOvC+TdPQbkhjW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZLGZLwAKCRB4tDGHoIJi
0jrYAQDw7C52D/rlhw9ADfh3Tidha+PsWlRE8UAzBK5ZyW8ZfAD+M+zjTm+uTux4
jG/xdu1L8A0cXPKX4J+cAJDgImqV5Aw=
=jETL
-----END PGP SIGNATURE-----

--jizOvC+TdPQbkhjW--


--===============4842456359881034459==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============4842456359881034459==--

