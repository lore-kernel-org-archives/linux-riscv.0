Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 226A1C5AD55
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Aug 2026 16:05:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=srJeWtxXNWNq6LfD7gtQUuoSM0nTpmUGDqCjrtwz33I=; b=TTC7I41BDM7cw7dTe+JjzicaiT
	BMq0XyD/CxzB0R1ohV0V7oYNgq67+F+aRX6shkugKPbbmucrENrHhFAB7eP2iI9CGEFIpQjt0vdk3
	ydgwstk0wCMYWJHa32RKIntAUOC43Q3PmSx1DfRMF/UpOY0k6uZHoWPSdqU1TCkkGlK1vR1PhdJI+
	ASg/qSujXknhaOOsBaK/CpbPcKpJPqzh8m0bRXDQyNerP+NR7PyvO4AT5RuNmSR2yYf/gEDvI4WF0
	oLAlztR/zz1SnY90P1M0zvkNbN7Hk+aFJ9oncn7qm/+62wmGkEmF0PK50uS65xlv5sAN1HOs7yCBW
	bRbdYdGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSUv-0000000CLCr-3UJ1;
	Mon, 10 Aug 2026 16:05:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtSUu-0000000CLBs-3prn
	for linux-riscv@lists.infradead.org;
	Mon, 10 Aug 2026 16:05:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4080B60052;
	Mon, 10 Aug 2026 16:05:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 036CB1F000E9;
	Mon, 10 Aug 2026 16:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786377907;
	bh=aZliVbVvGETr0QEqkNRL1i42gj38xTn+l5ropz04LAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=KlT8GMCabzHf5JBAPWuurFXxmwDLGnZ+BBl2/GhGPVjWpchX36CtJI+6hYbABn7vk
	 OoiCyW4qtNLBBtLaikWtB8jzEr8cv5Gz5o4j3HwOEXnVR59ZphEQ5lOzTwpxTi4ooc
	 WpZtyxdMjSc4OUPaomynH5ULLd2DmZvOjUgpSobuHmbhRw0Larwa/6KzOC5X+aBGta
	 AbD5lKLXOOl1nRk80R7WfbaCMQLhLmrCMdHbQu0RWsKNo7tXQaNjr9PoBOBSFyyewN
	 aQm5wdNzZNZjYHhUssgRD7LSGBeCYs1KxkMTV/aLKzkny0+Cl4nL8WiFmbOhM6Q/lS
	 36sM+uBQtL2aA==
Date: Mon, 10 Aug 2026 17:05:01 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney@redhat.com>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Alexey Charkov <alchark@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Keguang Zhang <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v4 7/8] soc: starfive: Add socinfo driver for JHB100 SoC
Message-ID: <20260810-caress-rack-45615c8d9747@spud>
References: <20260809015054.210577-1-changhuang.liang@starfivetech.com>
 <20260809015054.210577-8-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20260809015054.210577-8-changhuang.liang@starfivetech.com>
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
Content-Type: multipart/mixed; boundary="===============2669248327011337956=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

--===============2669248327011337956==
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="IY6Lbzd1L/jArdrp"
Content-Disposition: inline

--IY6Lbzd1L/jArdrp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 08, 2026 at 06:50:53PM -0700, Changhuang Liang wrote:
> Add socinfo driver for JHB100 SoC. Currently available for distinguishing
> between the two reversions, A0 and A1.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                                   |  6 ++
>  drivers/soc/Kconfig                           |  1 +
>  drivers/soc/Makefile                          |  1 +
>  drivers/soc/starfive/Kconfig                  |  6 ++
>  drivers/soc/starfive/Makefile                 |  2 +
>  drivers/soc/starfive/socinfo/Kconfig          | 11 +++
>  drivers/soc/starfive/socinfo/Makefile         |  2 +
>  drivers/soc/starfive/socinfo/jhb100-socinfo.c | 90 +++++++++++++++++++
>  8 files changed, 119 insertions(+)
>  create mode 100644 drivers/soc/starfive/Kconfig
>  create mode 100644 drivers/soc/starfive/Makefile
>  create mode 100644 drivers/soc/starfive/socinfo/Kconfig
>  create mode 100644 drivers/soc/starfive/socinfo/Makefile
>  create mode 100644 drivers/soc/starfive/socinfo/jhb100-socinfo.c
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index cecb4f279160..90919c672d4d 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -26040,6 +26040,7 @@ M:	Conor Dooley <conor@kernel.org>
>  S:	Maintained
>  T:	git https://git.kernel.org/pub/scm/linux/kernel/git/conor/linux.git/
>  F:	Documentation/devicetree/bindings/soc/starfive/
> +F:	drivers/soc/starfive/
> =20
>  STARFIVE STARLINK PMU DRIVER
>  M:	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>
> @@ -26094,6 +26095,11 @@ S:	Maintained
>  F:	drivers/reset/starfive/reset-starfive-jhb1*
>  F:	include/dt-bindings/reset/starfive,jhb1*.h
> =20
> +STARFIVE JHB100 SOCINFO DRIVER
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>
> +S:	Maintained
> +F:	drivers/soc/starfive/socinfo/jhb100-socinfo.c
> +
>  STARFIVE JHB100 SYSCON
>  M:	Changhuang Liang <changhuang.liang@starfivetech.com>
>  S:	Maintained
> diff --git a/drivers/soc/Kconfig b/drivers/soc/Kconfig
> index a2d65adffb80..b3b01fc38139 100644
> --- a/drivers/soc/Kconfig
> +++ b/drivers/soc/Kconfig
> @@ -24,6 +24,7 @@ source "drivers/soc/renesas/Kconfig"
>  source "drivers/soc/rockchip/Kconfig"
>  source "drivers/soc/samsung/Kconfig"
>  source "drivers/soc/sophgo/Kconfig"
> +source "drivers/soc/starfive/Kconfig"
>  source "drivers/soc/sunxi/Kconfig"
>  source "drivers/soc/tegra/Kconfig"
>  source "drivers/soc/ti/Kconfig"
> diff --git a/drivers/soc/Makefile b/drivers/soc/Makefile
> index c9e689080ceb..009f85ff891a 100644
> --- a/drivers/soc/Makefile
> +++ b/drivers/soc/Makefile
> @@ -30,6 +30,7 @@ obj-y				+=3D renesas/
>  obj-y				+=3D rockchip/
>  obj-$(CONFIG_SOC_SAMSUNG)	+=3D samsung/
>  obj-y				+=3D sophgo/
> +obj-y				+=3D starfive/
>  obj-y				+=3D sunxi/
>  obj-$(CONFIG_ARCH_TEGRA)	+=3D tegra/
>  obj-y				+=3D ti/
> diff --git a/drivers/soc/starfive/Kconfig b/drivers/soc/starfive/Kconfig
> new file mode 100644
> index 000000000000..04b020083d3e
> --- /dev/null
> +++ b/drivers/soc/starfive/Kconfig
> @@ -0,0 +1,6 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +menu "StarFive SoC (System On Chip) specific Drivers"
> +
> +source "drivers/soc/starfive/socinfo/Kconfig"
> +
> +endmenu
> diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Makefile
> new file mode 100644
> index 000000000000..ca1e609b8104
> --- /dev/null
> +++ b/drivers/soc/starfive/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-y +=3D socinfo/
> diff --git a/drivers/soc/starfive/socinfo/Kconfig b/drivers/soc/starfive/=
socinfo/Kconfig
> new file mode 100644
> index 000000000000..92bbab62895b
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/Kconfig
> @@ -0,0 +1,11 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +
> +config STARFIVE_JHB100_SOCINFO
> +	bool "StarFive JHB100 SoC Information"
> +	depends on ARCH_STARFIVE || COMPILE_TEST
> +	select SOC_BUS
> +	default y
> +	help
> +	  Include support for the SoC bus socinfo for the StarFive JHB100 SoC
> +	  platforms to provide information about the SoC family and variant
> +	  to user space.
> diff --git a/drivers/soc/starfive/socinfo/Makefile b/drivers/soc/starfive=
/socinfo/Makefile
> new file mode 100644
> index 000000000000..26c2bdf1de3b
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_STARFIVE_JHB100_SOCINFO)	+=3D jhb100-socinfo.o
> diff --git a/drivers/soc/starfive/socinfo/jhb100-socinfo.c b/drivers/soc/=
starfive/socinfo/jhb100-socinfo.c
> new file mode 100644
> index 000000000000..638f81ef174c
> --- /dev/null
> +++ b/drivers/soc/starfive/socinfo/jhb100-socinfo.c
> @@ -0,0 +1,90 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2025 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#define pr_fmt(fmt) "jhb100-socinfo: " fmt
> +
> +#include <linux/bitfield.h>
> +#include <linux/init.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/of.h>
> +#include <linux/regmap.h>
> +#include <linux/slab.h>
> +#include <linux/string.h>
> +#include <linux/sys_soc.h>
> +
> +#define JHB100_REV_ID			0x38
> +#define JHB100_REV_ID_CHAR		GENMASK(3, 2)
> +#define JHB100_REV_ID_NUM		GENMASK(1, 0)
> +
> +static int __init starfive_socinfo_init(void)
> +{
> +	struct soc_device_attribute *attrs;
> +	struct soc_device *soc_dev;
> +	const char *machine =3D NULL;
> +	struct device_node *np;
> +	struct regmap *regmap;
> +	char rev_char;
> +	u32 rev_id;
> +	int ret;
> +
> +	np =3D of_find_compatible_node(NULL, NULL, "starfive,jhb100-sys0-syscon=
");

Remind me again why this is not just probed as an mfd cell from the syscon
driver?

(Hint: please put this info in the commit message).

Cheers
Conor.

> +	if (!of_device_is_available(np)) {
> +		of_node_put(np);
> +		return -ENODEV;
> +	}
> +
> +	regmap =3D syscon_node_to_regmap(np);
> +	if (IS_ERR(regmap)) {
> +		of_node_put(np);
> +		return PTR_ERR(regmap);
> +	}
> +
> +	ret =3D regmap_read(regmap, JHB100_REV_ID, &rev_id);
> +	if (ret) {
> +		of_node_put(np);
> +		return ret;
> +	}
> +
> +	of_node_put(np);
> +
> +	rev_char =3D (char)FIELD_GET(JHB100_REV_ID_CHAR, rev_id) + 'A';
> +	rev_id =3D (u32)FIELD_GET(JHB100_REV_ID_NUM, rev_id);
> +
> +	attrs =3D kzalloc_obj(*attrs);
> +	if (!attrs)
> +		return -ENOMEM;
> +
> +	np =3D of_find_node_by_path("/");
> +	of_property_read_string(np, "model", &machine);
> +	if (machine)
> +		attrs->machine =3D kstrdup(machine, GFP_KERNEL);
> +	of_node_put(np);
> +
> +	attrs->revision =3D kasprintf(GFP_KERNEL, "%c%u", rev_char, rev_id);
> +	if (!attrs->revision) {
> +		kfree(attrs->machine);
> +		kfree(attrs);
> +		return -ENOMEM;
> +	}
> +
> +	attrs->family =3D "JH";
> +	attrs->soc_id =3D "JHB100";
> +
> +	soc_dev =3D soc_device_register(attrs);
> +	if (IS_ERR(soc_dev)) {
> +		kfree(attrs->revision);
> +		kfree(attrs->machine);
> +		kfree(attrs);
> +		return PTR_ERR(soc_dev);
> +	}
> +
> +	pr_info("StarFive %s SoC rev(%s)\n", attrs->soc_id, attrs->revision);
> +
> +	return 0;
> +}
> +
> +subsys_initcall(starfive_socinfo_init);
> --=20
> 2.25.1
>=20

--IY6Lbzd1L/jArdrp
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCann2rAAKCRB4tDGHoIJi
0ohHAQDdhAr1kJrXXf8gDwzmNcWcdZswvT6sxS4RoDwPoASqtQD9Gdx69wWho21S
1KaFgDL9u9uMGKVOJPZ+baxhqEpe/ws=
=maJS
-----END PGP SIGNATURE-----

--IY6Lbzd1L/jArdrp--


--===============2669248327011337956==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2669248327011337956==--

