Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A08AC4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 22:31:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcvnrok8n14zDJS22c7ATyMuhCqH+z48AhGVmjeH1sA=; b=MokuqTcpLwiLCeE9yS6CyhlaHF
	PNpqj8ufuGPybsjqtI4XXf7xIIP0VfA2UxsNg1OSgb6+A8D6gbEp3eNZxKi5KbCQ8DScDFNg4LeYB
	xSg43nMRGi6/38Nk+eDpIdVWxO2kGXB2cUOjRjsVe3Ar77Sf12o9unEMhZNrDX2paPLH8Aafr/NOt
	DJ7mIcIcqKZ/QMkBF8IORliVh+NZMBzHtuzE2A0b3TkK2vrIhqXl/LT/yJMuGoTCdS3Q47QxqKGla
	18r5KzcUtnboxffr3jVvuQ3Lb7xR+p3A2xSZzjtis3O6FcB7PlV2Boox7b8DF1knb4HdbvfSudG0y
	mGiCDjbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7l8o-005GlF-Ie; Tue, 20 Dec 2022 22:31:18 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7l8k-005Gaf-DS
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 22:31:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 29099B8136B;
	Tue, 20 Dec 2022 22:31:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D847C433F0;
	Tue, 20 Dec 2022 22:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1671575470;
	bh=xgQ0tGvpPg+ETNCt2c8QD/eU0zTwVAcmpZAvIlAsD8U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JFFRKExOTmVnEvV5jRQZCLfZgTpHRP4lFdRktog4ilTkGz/Y2LREluG42QDKWeZGX
	 N7RqeIQX7kv1fsCEqq1ZAeyOrk/xbnO+Fl97rAyaMTMIvPdLTTIRY8L7gzdf+pN/49
	 ONNdWuLy8QUfQ05h52EJp5Lpzc1mPu2ztPjftTrCsYiV8055kmUR2ZW+HbpFgbEd+k
	 J8SYtI7DDWchH4Ezdg8/SxdkVsX9TgI9qqv8IpQcdAf6NholRKr+Nv7W/eUw2vgo0b
	 kmWs5hb2v+wTQDqSjNiy2jkG5U8VCwW2iJTnoR+agyqvr96TrFlFYAUMOaXe+Ho5Fy
	 XEmpuSD8oEKxA==
Date: Tue, 20 Dec 2022 22:31:05 +0000
From: Conor Dooley <conor@kernel.org>
To: Hal Feng <hal.feng@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 05/11] reset: starfive: Rename "jh7100" to "jh71x0"
 for the common code
Message-ID: <Y6I3qbp34+0Mc4lk@spud>
References: <20221220005054.34518-1-hal.feng@starfivetech.com>
 <20221220005054.34518-6-hal.feng@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20221220005054.34518-6-hal.feng@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_143114_800600_4A985C30 
X-CRM114-Status: GOOD (  22.54  )
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
Content-Type: multipart/mixed; boundary="===============5935724649072902631=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============5935724649072902631==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="eJdgXXuw4ayzxA+h"
Content-Disposition: inline


--eJdgXXuw4ayzxA+h
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 20, 2022 at 08:50:48AM +0800, Hal Feng wrote:
> From: Emil Renner Berthing <kernel@esmil.dk>
>=20
> For the common code will be shared with the StarFive JH7110 SoC.
>=20
> Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>
> Signed-off-by: Hal Feng <hal.feng@starfivetech.com>

Label on the tin seems to match the contents.
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Thanks,
Conor.

> ---
>  .../reset/starfive/reset-starfive-jh7100.c    |  2 +-
>  .../reset/starfive/reset-starfive-jh71x0.c    | 50 +++++++++----------
>  .../reset/starfive/reset-starfive-jh71x0.h    |  2 +-
>  3 files changed, 27 insertions(+), 27 deletions(-)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-jh7100.c b/drivers/res=
et/starfive/reset-starfive-jh7100.c
> index 9d7cb4ed8869..5f06e5ae3346 100644
> --- a/drivers/reset/starfive/reset-starfive-jh7100.c
> +++ b/drivers/reset/starfive/reset-starfive-jh7100.c
> @@ -51,7 +51,7 @@ static int __init jh7100_reset_probe(struct platform_de=
vice *pdev)
>  	if (IS_ERR(base))
>  		return PTR_ERR(base);
> =20
> -	return reset_starfive_jh7100_register(&pdev->dev, pdev->dev.of_node,
> +	return reset_starfive_jh71x0_register(&pdev->dev, pdev->dev.of_node,
>  					      base + JH7100_RESET_ASSERT0,
>  					      base + JH7100_RESET_STATUS0,
>  					      jh7100_reset_asserted,
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.c b/drivers/res=
et/starfive/reset-starfive-jh71x0.c
> index ee8c28f9bcb5..1f201c612583 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.c
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.c
> @@ -1,6 +1,6 @@
>  // SPDX-License-Identifier: GPL-2.0-or-later
>  /*
> - * Reset driver for the StarFive JH7100 SoC
> + * Reset driver for the StarFive JH71X0 SoCs
>   *
>   * Copyright (C) 2021 Emil Renner Berthing <kernel@esmil.dk>
>   */
> @@ -13,7 +13,7 @@
>  #include <linux/reset-controller.h>
>  #include <linux/spinlock.h>
> =20
> -struct jh7100_reset {
> +struct jh71x0_reset {
>  	struct reset_controller_dev rcdev;
>  	/* protect registers against concurrent read-modify-write */
>  	spinlock_t lock;
> @@ -22,16 +22,16 @@ struct jh7100_reset {
>  	const u64 *asserted;
>  };
> =20
> -static inline struct jh7100_reset *
> -jh7100_reset_from(struct reset_controller_dev *rcdev)
> +static inline struct jh71x0_reset *
> +jh71x0_reset_from(struct reset_controller_dev *rcdev)
>  {
> -	return container_of(rcdev, struct jh7100_reset, rcdev);
> +	return container_of(rcdev, struct jh71x0_reset, rcdev);
>  }
> =20
> -static int jh7100_reset_update(struct reset_controller_dev *rcdev,
> +static int jh71x0_reset_update(struct reset_controller_dev *rcdev,
>  			       unsigned long id, bool assert)
>  {
> -	struct jh7100_reset *data =3D jh7100_reset_from(rcdev);
> +	struct jh71x0_reset *data =3D jh71x0_reset_from(rcdev);
>  	unsigned long offset =3D BIT_ULL_WORD(id);
>  	u64 mask =3D BIT_ULL_MASK(id);
>  	void __iomem *reg_assert =3D data->assert + offset * sizeof(u64);
> @@ -60,34 +60,34 @@ static int jh7100_reset_update(struct reset_controlle=
r_dev *rcdev,
>  	return ret;
>  }
> =20
> -static int jh7100_reset_assert(struct reset_controller_dev *rcdev,
> +static int jh71x0_reset_assert(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
> -	return jh7100_reset_update(rcdev, id, true);
> +	return jh71x0_reset_update(rcdev, id, true);
>  }
> =20
> -static int jh7100_reset_deassert(struct reset_controller_dev *rcdev,
> +static int jh71x0_reset_deassert(struct reset_controller_dev *rcdev,
>  				 unsigned long id)
>  {
> -	return jh7100_reset_update(rcdev, id, false);
> +	return jh71x0_reset_update(rcdev, id, false);
>  }
> =20
> -static int jh7100_reset_reset(struct reset_controller_dev *rcdev,
> +static int jh71x0_reset_reset(struct reset_controller_dev *rcdev,
>  			      unsigned long id)
>  {
>  	int ret;
> =20
> -	ret =3D jh7100_reset_assert(rcdev, id);
> +	ret =3D jh71x0_reset_assert(rcdev, id);
>  	if (ret)
>  		return ret;
> =20
> -	return jh7100_reset_deassert(rcdev, id);
> +	return jh71x0_reset_deassert(rcdev, id);
>  }
> =20
> -static int jh7100_reset_status(struct reset_controller_dev *rcdev,
> +static int jh71x0_reset_status(struct reset_controller_dev *rcdev,
>  			       unsigned long id)
>  {
> -	struct jh7100_reset *data =3D jh7100_reset_from(rcdev);
> +	struct jh71x0_reset *data =3D jh71x0_reset_from(rcdev);
>  	unsigned long offset =3D BIT_ULL_WORD(id);
>  	u64 mask =3D BIT_ULL_MASK(id);
>  	void __iomem *reg_status =3D data->status + offset * sizeof(u64);
> @@ -96,25 +96,25 @@ static int jh7100_reset_status(struct reset_controlle=
r_dev *rcdev,
>  	return !((value ^ data->asserted[offset]) & mask);
>  }
> =20
> -static const struct reset_control_ops jh7100_reset_ops =3D {
> -	.assert		=3D jh7100_reset_assert,
> -	.deassert	=3D jh7100_reset_deassert,
> -	.reset		=3D jh7100_reset_reset,
> -	.status		=3D jh7100_reset_status,
> +static const struct reset_control_ops jh71x0_reset_ops =3D {
> +	.assert		=3D jh71x0_reset_assert,
> +	.deassert	=3D jh71x0_reset_deassert,
> +	.reset		=3D jh71x0_reset_reset,
> +	.status		=3D jh71x0_reset_status,
>  };
> =20
> -int reset_starfive_jh7100_register(struct device *dev, struct device_nod=
e *of_node,
> +int reset_starfive_jh71x0_register(struct device *dev, struct device_nod=
e *of_node,
>  				   void __iomem *assert, void __iomem *status,
>  				   const u64 *asserted, unsigned int nr_resets,
>  				   struct module *owner)
>  {
> -	struct jh7100_reset *data;
> +	struct jh71x0_reset *data;
> =20
>  	data =3D devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
>  	if (!data)
>  		return -ENOMEM;
> =20
> -	data->rcdev.ops =3D &jh7100_reset_ops;
> +	data->rcdev.ops =3D &jh71x0_reset_ops;
>  	data->rcdev.owner =3D owner;
>  	data->rcdev.nr_resets =3D nr_resets;
>  	data->rcdev.dev =3D dev;
> @@ -127,4 +127,4 @@ int reset_starfive_jh7100_register(struct device *dev=
, struct device_node *of_no
> =20
>  	return devm_reset_controller_register(dev, &data->rcdev);
>  }
> -EXPORT_SYMBOL_GPL(reset_starfive_jh7100_register);
> +EXPORT_SYMBOL_GPL(reset_starfive_jh71x0_register);
> diff --git a/drivers/reset/starfive/reset-starfive-jh71x0.h b/drivers/res=
et/starfive/reset-starfive-jh71x0.h
> index 1fc5a648c8d8..ac9e80dd3f59 100644
> --- a/drivers/reset/starfive/reset-starfive-jh71x0.h
> +++ b/drivers/reset/starfive/reset-starfive-jh71x0.h
> @@ -6,7 +6,7 @@
>  #ifndef __RESET_STARFIVE_JH71X0_H
>  #define __RESET_STARFIVE_JH71X0_H
> =20
> -int reset_starfive_jh7100_register(struct device *dev, struct device_nod=
e *of_node,
> +int reset_starfive_jh71x0_register(struct device *dev, struct device_nod=
e *of_node,
>  				   void __iomem *assert, void __iomem *status,
>  				   const u64 *asserted, unsigned int nr_resets,
>  				   struct module *owner);
> --=20
> 2.38.1
>=20
>=20

--eJdgXXuw4ayzxA+h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6I3qQAKCRB4tDGHoIJi
0jGJAQDL/UqzaYk17IC4zOeAnST9JdCssMStfwnje8bhFyXovQEAjhaq4USaB3wx
y4bB92yR4Or836ZP6JYghMELmyNnlgw=
=bLVf
-----END PGP SIGNATURE-----

--eJdgXXuw4ayzxA+h--


--===============5935724649072902631==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============5935724649072902631==--

