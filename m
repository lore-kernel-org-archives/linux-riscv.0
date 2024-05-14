Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E35E0C04FFE
	for <linux-riscv@archiver.kernel.org>; Tue, 14 May 2024 19:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3UY3gPXrolgDYl1P5Yt1cn1IlI6Brr46tBTvXbHo3aE=; b=q2DmxGEDpt3eTqQYsnr57G0OFG
	quJEerqOB1HrdW2XtTrieza2A+dkbg1bthztA2qceSooRVWdf8h2Y5DUo6ej+/bOWP3rpuFVZouYO
	zwJTtmN5eTC5wAbe9mB7VaG8ZWg83ctvczVPIjRs/43JzhuNKekblNC2uCbdRdaQTfKOG4w7kHxt0
	LM9jMYvCVzCriMRm3+MYQHJk/75qsf4bZEZjvdsVN5qIXcaX3FtiSNGhj9u5fRRzPeKtapTzXdOzW
	FYs5V0tgYn6HKAzZx5Vcb6Lblos/ua0IGTl3drayexGlC9GVjdYptieYdR2Soglk0zFXeF/wyl9RT
	ZXgC3zmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6xP2-0000000GurA-2t8q;
	Tue, 14 May 2024 19:01:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6wLk-0000000GjRb-2QJO
	for linux-riscv@lists.infradead.org;
	Tue, 14 May 2024 17:54:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 00D14612FD;
	Tue, 14 May 2024 17:54:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F77C2BD10;
	Tue, 14 May 2024 17:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715709243;
	bh=Og2bulaEiyhJKBbZNSuOSTrvk7DGpRodAs0PpN4so9Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=K0kPQXSEKrzRVNE1rhsk7LR8Y9DVKojRyOJxI/q9ASeeyJ3kLTNTZnffMQkUmLQ46
	 Sxj43rQN30djUDw/EFF51Z7/6OdMnffKTRs3ZdJHhqCu4Svv/xM+W0Vy9F6rRYnbDJ
	 MvbgCZR92nyN5lQbIVP24wAzTX6BEGDtvl1WsU675/u9cxILjccBD2dw75Gb4DNrHV
	 gcHSxg1wqowP2s18cUU8Ix7R0s7UnmC3xhiBEooaZgPiPz6600v+ly8JxK1CbW2lbM
	 cxKG0nrkDwW1/kqFp79n7zlPcgYmZb+/Ueo+NTcCLSA83vCtPkZclWRg9rCSyxhLBF
	 RxLuVOzH3kUtg==
Date: Tue, 14 May 2024 18:53:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Daire McNamara <daire.mcnamara@microchip.com>,
	valentina.fernandezalanis@microchip.com
Subject: Re: [PATCH v2 2/3] spi: spi-microchip-core: Fix the number of chip
 selects supported
Message-ID: <20240514-epileptic-enrage-44fe37b417ff@spud>
References: <20240514104508.938448-1-prajna.rajendrakumar@microchip.com>
 <20240514104508.938448-3-prajna.rajendrakumar@microchip.com>
MIME-Version: 1.0
In-Reply-To: <20240514104508.938448-3-prajna.rajendrakumar@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240514_105404_936005_762DCDB1 
X-CRM114-Status: GOOD (  20.89  )
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
Content-Type: multipart/mixed; boundary="===============0615701043568960485=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============0615701043568960485==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="vyFYGc/Uj8F56sfy"
Content-Disposition: inline


--vyFYGc/Uj8F56sfy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 14, 2024 at 11:45:07AM +0100, Prajna Rajendra Kumar wrote:
> The SPI "hard" controller in PolarFire SoC has eight CS lines, but only
> one CS line is wired. When the 'num-cs' property is not specified in
> the device tree, the driver defaults to the MAX_CS value, which has
> been fixed to 1 to match the hardware configuration; however, when the
> 'num-cs' property is explicitly defined in the device tree, it
> overrides the default value.
>=20
> Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers=
")
> Signed-off-by: Prajna Rajendra Kumar <prajna.rajendrakumar@microchip.com>

I gave you a reviewed-by on v1, here it is again:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

Cheers,
Conor.

> ---
>  drivers/spi/spi-microchip-core.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip=
-core.c
> index 634364c7cfe6..c10de45aa472 100644
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
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

--vyFYGc/Uj8F56sfy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZkOlNwAKCRB4tDGHoIJi
0mh9AP0e3B6+xx/518heUOBQSktIwp5X7vszCM4FRNeMALAPlAEApV7oxlTbfDp6
VOdPHK8/UYURoluxXJ5VzI1bZDU6cwU=
=yQ4T
-----END PGP SIGNATURE-----

--vyFYGc/Uj8F56sfy--


--===============0615701043568960485==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============0615701043568960485==--

