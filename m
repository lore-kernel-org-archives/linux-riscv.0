Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF844C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Dec 2023 12:43:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3+LIXYCukApizDQxu/8a2e3B5qLC8ROMemrYiyG24J4=; b=jhey9y+v4vzxPx/5HPqUMmulEb
	eYk/cKtKns5J5L41fpc++Z62hpceyx+hx3IBoZwA299w71cUNW2iHZnsLwInzc7uh6Zy+SFxVV0p3
	1aTD9nKK5T5+8SPfSRTKs/yztFpTb6mSHPmfRwp/OcX3kDpsIusTEaaKJGBf/U9rVbufOI6BJcSp3
	z80LypWBCEeQ0rQ8R5MGpCQ5bA6dYz6Q3XbPSv2zPrp2oNXZCqs5pK03ppgjEDAsAk2bqb4MTlPkK
	J9xSGVqcymJYlU+pQwveS3X0Mk7CNHRZUur9HDIbv6d0/AXuWkU3cHsCHPbIjiE1XUoHs9KdkL/so
	5M0Y8znQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOa3-00Ed1G-1h;
	Wed, 13 Dec 2023 12:43:15 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rDOa0-00EczX-15
	for linux-riscv@lists.infradead.org;
	Wed, 13 Dec 2023 12:43:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 72ED2B81214;
	Wed, 13 Dec 2023 12:43:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AA4DAC433C8;
	Wed, 13 Dec 2023 12:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702471387;
	bh=FjDgTJb3iN+IW1iAF5vDMCIbbGw0B3symE2ANlrDB5w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SkigjsFv2x+gC7EpuxdQxnywJ4suCEtmoH+ePSuVjVkflsKPbVS+huHzufrgTjrjo
	 3RrlcuVx1GTL3bskd5v5WCO092kIZQLlluttUivdP4LB1zQVFR/Kx3U3pm5gogdwRH
	 WEJHJKX5m3E5VGuY5BA4IFLd6bdgvtoPkjxJgN7/OB0Hub1gkir9kVmHmgQbKfovod
	 DJAFm7NAj+00iDIPJS7n95K2Z+6sUYLaLcMy0K7Q8fAN+k+x9NDTWm05zSXAC5KnVb
	 j8wMrORBndfOPcPaHy8wcYtPiAg5Iw63J+1n0yvJ9ppLOJ3xE2L/LSdupZX1DJ5jA6
	 e3b8y6wd5J77w==
Date: Wed, 13 Dec 2023 12:43:01 +0000
From: Conor Dooley <conor@kernel.org>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: kernel@esmil.dk, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	krzk@kernel.org, conor+dt@kernel.org, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu,
	daniel.lezcano@linaro.org, tglx@linutronix.de, anup@brainfault.org,
	gregkh@linuxfoundation.org, jirislaby@kernel.org,
	michal.simek@amd.com, michael.zhu@starfivetech.com,
	drew@beagleboard.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	leyfoon.tan@starfivetech.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 2/6] dt-bindings: riscv: Add StarFive JH8100 SoC
Message-ID: <20231213-imminent-favorable-a7d25e6555af@spud>
References: <20231201121410.95298-1-jeeheng.sia@starfivetech.com>
 <20231201121410.95298-3-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20231201121410.95298-3-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231213_044312_681547_B60D9F45 
X-CRM114-Status: GOOD (  15.56  )
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
Content-Type: multipart/mixed; boundary="===============5332448866848678405=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5332448866848678405==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="zXeS7EP6Yj4II9Wy"
Content-Disposition: inline


--zXeS7EP6Yj4II9Wy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 01, 2023 at 08:14:06PM +0800, Sia Jee Heng wrote:
> Add device tree bindings for the StarFive JH8100 RISC-V SoC.
>=20
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> ---
>  Documentation/devicetree/bindings/riscv/starfive.yaml | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/riscv/starfive.yaml b/Docu=
mentation/devicetree/bindings/riscv/starfive.yaml
> index cc4d92f0a1bf..12d7844232b8 100644
> --- a/Documentation/devicetree/bindings/riscv/starfive.yaml
> +++ b/Documentation/devicetree/bindings/riscv/starfive.yaml
> @@ -30,6 +30,10 @@ properties:
>                - starfive,visionfive-2-v1.3b
>            - const: starfive,jh7110
> =20
> +      - items:
> +          - enum:
> +              - starfive,jh8100-evb

Hmm, reading some of the other threads it appears that the evaluation
platform that you guys have is actually just an FPGA? Could you please
provide more information as to what this "evb" actually is?

If it is just an FPGA-based evaluation platform I don't think that we
want to merge patches for the platform. I'm fine with patches adding
peripheral support, but the soc/board dts files and things like pinctrl
or clock drivers I am not keen on.
Perhaps Emil also has an opinion on this.

Thanks,
Conor.

> +          - const: starfive,jh8100
>  additionalProperties: true
> =20
>  ...
> --=20
> 2.34.1
>=20
>=20

--zXeS7EP6Yj4II9Wy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZXmm1QAKCRB4tDGHoIJi
0q72AQDhgF9fijVdRhbKeMyERN4WLOL/D6o7cI1DU92ChEiNoQEAq6oZD+7p/il+
dgQb7NS+xXKd9Q3hwC949WAUiDm63A8=
=PqAD
-----END PGP SIGNATURE-----

--zXeS7EP6Yj4II9Wy--


--===============5332448866848678405==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5332448866848678405==--

