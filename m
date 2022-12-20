Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA122C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 21:26:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KNcqF5BHer+vk9JrhCu5c1OPDDZS1FerMGUl8g4p4R4=; b=VnInpsx4t5GfdbfEobY3r1hdLt
	XVrgBW0ld7FfuUl+uB78fmLsIByVsRuaWtzE1CsDSyfsIJztghgL8i26MTLjJSEC7nrVTqZFMifJG
	zgFyMM36UbPT+gSZZ8i1059cF1VRXSGS6cT5TC5/9OK5VXX/CYACdjuc8HwADpLA5SiyZiohLWEI1
	4kspPbJ1McWNCysJs6ic4s+KMRVgtNtnB65Y+QzY424RkIA2XRsr7AA6jlIa9WKMOGZR/r1Assv5w
	gP/LB1maP5udhQ883cMXxCk0vf6dVJS12smyBhVzXAJq7EGPbin8QpfNIAYsZZQE9syy5KgDOwnqS
	UJReF8gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7k7t-004KJ0-O5; Tue, 20 Dec 2022 21:26:17 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7k7r-004KIP-5T
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 21:26:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 69DD3614FD;
	Tue, 20 Dec 2022 21:26:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68A0BC433EF;
	Tue, 20 Dec 2022 21:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671571573;
	bh=S5/irmbdxPHRGjloGu2y2uI3gxorhqGUs8rELs0Mt1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b89knfYZlcl38WQkiGRpaBqBApY5hUs2S/aKIKXC+AC2zW9UlG2rT1zozbgOYyQYr
	 QlrgGtoXRAacuK1DGl9ldAm/+npm77BPnUGKrnVJa15xA523jHpJKk0rTl7PHncgue
	 05UCdMXCtlpxq+OLIggWjkzIbYlQ9tabdCNhWq+Dm5X54FQL5fxwEoSD4RLIApbUk2
	 vQYlrgvY9LQD8nazrhiDVuBD8lm9VYHs1h5YgxiQeoMNEuG1Tn2UxtUmHboFexaYv0
	 rBqAbktDmO5WCAHhLaWGVkppG20n5ILPS8owoOB7uqZtjXNfddyKdhPBEYVQJg2jpI
	 LKlDqyIveRHqw==
Date: Tue, 20 Dec 2022 21:26:07 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Ben Dooks <ben.dooks@sifive.com>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Linus Walleij <linus.walleij@linaro.org>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 7/7] riscv: dts: starfive: Add StarFive JH7110
 VisionFive 2 board device tree
Message-ID: <Y6Iob3csmKMl0rB/@spud>
References: <20221220011247.35560-1-hal.feng@starfivetech.com>
 <20221220011247.35560-8-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220011247.35560-8-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_132615_306271_12F2E1F1 
X-CRM114-Status: GOOD (  22.73  )
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
Content-Type: multipart/mixed; boundary="===============1728133203637448783=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1728133203637448783==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="8xrhEquv/3PxHBwz"
Content-Disposition: inline


--8xrhEquv/3PxHBwz
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 09:12:47AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> Add a minimal device tree for StarFive JH7110 VisionFive 2 board
> which has version A and version B. Support booting and basic
> clock/reset/pinctrl/uart drivers.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Co-developed-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Signed-off-by: Jianlong Huang <jianlong.huang@starfivetech.com>
> Co-developed-by: Hal Feng <hal.feng@starfivetech.com>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  arch/riscv/boot/dts/starfive/Makefile         |   1 +
>  .../jh7110-starfive-visionfive-2-va.dts       |  13 ++
>  .../jh7110-starfive-visionfive-2-vb.dts       |  13 ++
>  .../jh7110-starfive-visionfive-2.dtsi         | 111 ++++++++++++++++++
>  4 files changed, 138 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfi=
ve-2-va.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfi=
ve-2-vb.dts
>  create mode 100644 arch/riscv/boot/dts/starfive/jh7110-starfive-visionfi=
ve-2.dtsi
>=20
> diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/=
starfive/Makefile
> index 0ea1bc15ab30..79e925a4a227 100644
> --- a/arch/riscv/boot/dts/starfive/Makefile
> +++ b/arch/riscv/boot/dts/starfive/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb
> +dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-va.dtb jh71=
10-starfive-visionfive-2-vb.dtb

Could you rebase on top of v6.2-rc1 when you submit your next version
squash this in please (unless Emil hates it):
diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/st=
arfive/Makefile
index c38a9ade7f48..b3744420253a 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -1,3 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb jh7100-starfi=
ve-visionfive-v1.dtb
-dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-va.dtb jh7110=
-starfive-visionfive-2-vb.dtb
+dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-beaglev-starlight.dtb
+dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7100-starfive-visionfive-v1.dtb
+dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-va.dtb
+dtb-$(CONFIG_SOC_STARFIVE) +=3D jh7110-starfive-visionfive-2-vb.dtb

I'd rather have more, but easier to read lines than long ones.

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dt=
si b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> new file mode 100644
> index 000000000000..c60280b89c73
> --- /dev/null
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -0,0 +1,111 @@
> +// SPDX-License-Identifier: GPL-2.0 OR MIT
> +/*
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> + * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + */
> +
> +/dts-v1/;
> +#include "jh7110.dtsi"
> +#include "jh7110-pinfunc.h"
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	aliases {
> +		serial0 =3D &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial0:115200n8";
> +	};
> +
> +	cpus {
> +		timebase-frequency =3D <4000000>;
> +	};
> +
> +	memory@40000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x0 0x40000000 0x1 0x0>;

Is this a good idea when you have SKUs with 2, 4 & 8 GiB of DDR?

Anyways, I can't review this as I've got neither board nor
documentation, so with the above stuff sorted out:
Acked-by: Conor Dooley <conor.dooley@microchip.com>
I'll not apply it until the clock binding header is in my tree.

Thanks,
Conor.


--8xrhEquv/3PxHBwz
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6IobwAKCRB4tDGHoIJi
0jwaAQD7o1TKtLNZlBTk13ECBN0bhssFOZvOLHHDM950ZiX1dAD/Vwfu94KObi+g
P1wOYMlvne8eqaD+rVW4wZn2KtuR4wU=
=PJBb
-----END PGP SIGNATURE-----

--8xrhEquv/3PxHBwz--


--===============1728133203637448783==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1728133203637448783==--

