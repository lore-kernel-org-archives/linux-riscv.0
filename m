Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A61E4C76196
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 21:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JMb5mvtlvr80QiA30k8tFVKoskr8y4t1f10LfQw1k80=; b=xd8bqddnbcjbrdq1Vs152j6Kak
	tGx5gNaBgEfIzmv7NW6odmLXjymagT5kQZM3KQs6MzN+xA6NXYFIcA4SpcznkT1g4kEqfsJKFOubZ
	XKVZXH5qSdUqqYqfT2LdtSIlRm1EBcx14Ueu3lPG88zfFNpnyn+OB43WE00FzUlCpX62SPXOcGbeH
	w1mYAfRO7s541BIiHx7jXb7LDWq8MhcgaboRtqYuQdktz+11EAJfOKMG8HQ4WJY1aADrOw6H7I8pa
	FX1zLA6pB4Fe/zhUk9LWq5fM3a6VnIX+q6VF812/0RgCZQegYNQ8Pwr1fgPmbNRll43R0P+J/+BrU
	XhPlhShA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLLH-001AFd-2h;
	Tue, 11 Apr 2023 21:15:55 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pmLLE-001AEd-14
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 21:15:53 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id E023562B58;
	Tue, 11 Apr 2023 21:15:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E05AC4339E;
	Tue, 11 Apr 2023 21:15:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681247751;
	bh=5utrGhW38HkoFEGqEf8o5TKntYH8lTNsjVLTn6Y7/CE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ADGZT1oAr0eMBerDMo2GwFSO6ntEnCVEi3CA6ynTF8RowoM3mxM21P0utx1ScKF58
	 qQCYUFaPDk/2fEAAmfzU5HoDp8G1D+wvmupqxzkbyRifxJCLpqD+LdjrizW8rBkmK/
	 0EPoJrD2zWTbUvWobpyNURCm2bdh8g2y4Msl7IgRbz3kXXAAYEK38Eez7YG+sYfgx9
	 v9/n27T3RC/Jf6oPcKYVAUkXkMvWhpcFy2UO/ECno1CmayFyVw5QVdMaHKtFrKfVZB
	 alXxAu17+KvG4h2zYUpz1AnTA66uwGgvtVl5rDn0aVHQo6Zc9JuEcA9AxEdW87GPm6
	 j9nKZLp7CJT/w==
Date: Tue, 11 Apr 2023 22:15:46 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 6/7] soc: starfive: Add dphy pmu support
Message-ID: <20230411-iron-everybody-70b78e94aee5@spud>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-7-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230411064743.273388-7-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_141552_448811_D39149D7 
X-CRM114-Status: GOOD (  28.60  )
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
Content-Type: multipart/mixed; boundary="===============6472804555687481008=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============6472804555687481008==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="Xr1omY7vI0HCAtOr"
Content-Disposition: inline


--Xr1omY7vI0HCAtOr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 10, 2023 at 11:47:42PM -0700, Changhuang Liang wrote:
> Add dphy pmu to turn on/off the dphy power switch.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  MAINTAINERS                       |  1 +
>  drivers/soc/starfive/jh71xx_pmu.c | 65 +++++++++++++++++++++++++++++++
>  2 files changed, 66 insertions(+)
>=20
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 0b2170e1e4ff..4d958f02403e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19944,6 +19944,7 @@ F:	include/dt-bindings/reset/starfive?jh71*.h
> =20
>  STARFIVE JH71XX PMU CONTROLLER DRIVER
>  M:	Walker Chen <walker.chen@starfivetech.com>
> +M:	Changhuang Liang <changhuang.liang@starfivetech.com>

Unmentioned in the commit message, plus I would like an R-b or an Ack
=66rom Walker.

>  S:	Supported
>  F:	Documentation/devicetree/bindings/power/starfive*
>  F:	drivers/soc/starfive/jh71xx_pmu.c
> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh7=
1xx_pmu.c
> index 990db6735c48..d4092ca4dccf 100644
> --- a/drivers/soc/starfive/jh71xx_pmu.c
> +++ b/drivers/soc/starfive/jh71xx_pmu.c
> @@ -24,6 +24,9 @@
>  #define JH71XX_PMU_EVENT_STATUS		0x88
>  #define JH71XX_PMU_INT_STATUS		0x8C
> =20
> +/* DPHY pmu register offset */
> +#define JH71XX_PMU_DPHY_SWITCH		0x00
> +
>  /* sw encourage cfg */
>  #define JH71XX_PMU_SW_ENCOURAGE_EN_LO	0x05
>  #define JH71XX_PMU_SW_ENCOURAGE_EN_HI	0x50
> @@ -94,6 +97,8 @@ static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *=
pmd, u32 mask, bool *is_o
> =20
>  	if (pmu->match_data->pmu_type =3D=3D JH71XX_PMU_GENERAL)
>  		offset =3D JH71XX_PMU_CURR_POWER_MODE;
> +	else if (pmu->match_data->pmu_type =3D=3D JH71XX_PMU_DPHY)

There are only two options for this "enum", so why `else if`?

> +		offset =3D JH71XX_PMU_DPHY_SWITCH;
> =20
>  	regmap_read(pmu->base, offset, &val);
> =20
> @@ -170,6 +175,23 @@ static int jh71xx_pmu_general_set_state(struct jh71x=
x_pmu_dev *pmd, u32 mask, bo
>  	return 0;
>  }
> =20
> +static int jh71xx_pmu_dphy_set_state(struct jh71xx_pmu_dev *pmd, u32 mas=
k, bool on)
> +{
> +	struct jh71xx_pmu *pmu =3D pmd->pmu;
> +	unsigned long flags;
> +
> +	spin_lock_irqsave(&pmu->lock, flags);
> +
> +	if (on)
> +		regmap_update_bits(pmu->base, JH71XX_PMU_DPHY_SWITCH, mask, mask);
> +	else
> +		regmap_update_bits(pmu->base, JH71XX_PMU_DPHY_SWITCH, mask, 0);
> +
> +	spin_unlock_irqrestore(&pmu->lock, flags);
> +
> +	return 0;
> +}
> +
>  static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bo=
ol on)
>  {
>  	struct jh71xx_pmu *pmu =3D pmd->pmu;
> @@ -191,6 +213,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev=
 *pmd, u32 mask, bool on)
> =20
>  	if (pmu->match_data->pmu_type =3D=3D JH71XX_PMU_GENERAL)
>  		ret =3D jh71xx_pmu_general_set_state(pmd, mask, on);
> +	else if (pmu->match_data->pmu_type =3D=3D JH71XX_PMU_DPHY)
> +		ret =3D jh71xx_pmu_dphy_set_state(pmd, mask, on);

Perhaps I am verging on over-complication, but I dislike this carry on.
Is this the only time we'll see a power domain provider coming out of
a syscon, or are there likely to be more?
Either way, I think having an ops struct w/ both parse_dt() and the
set_state() implementations would be neater than what you have here.

Very much open to dissenting opinions there though. Emil? Walker?

Cheers,
Conor.

> =20
>  	return ret;
>  }
> @@ -280,6 +304,25 @@ static int jh7110_pmu_general_parse_dt(struct platfo=
rm_device *pdev,
>  	return 0;
>  }
> =20
> +static int jh7110_pmu_dphy_parse_dt(struct platform_device *pdev,
> +				    struct jh71xx_pmu *pmu)
> +{
> +	struct device *parent;
> +	struct device *dev =3D &pdev->dev;
> +
> +	parent =3D pdev->dev.parent;
> +	if (!parent) {
> +		dev_err(dev, "No parent for syscon pmu\n");
> +		return -ENODEV;
> +	}
> +
> +	pmu->base =3D syscon_node_to_regmap(parent->of_node);
> +	if (IS_ERR(pmu->base))
> +		return PTR_ERR(pmu->base);
> +
> +	return 0;
> +}
> +
>  static int jh71xx_pmu_init_domain(struct jh71xx_pmu *pmu, int index)
>  {
>  	struct jh71xx_pmu_dev *pmd;
> @@ -409,10 +452,31 @@ static const struct jh71xx_pmu_match_data jh7110_pm=
u =3D {
>  	.pmu_parse_dt =3D jh7110_pmu_general_parse_dt,
>  };
> =20
> +static const struct jh71xx_domain_info jh7110_dphy_power_domains[] =3D {
> +	[JH7110_PD_DPHY_TX] =3D {
> +		.name =3D "DPHY-TX",
> +		.bit =3D 30,
> +	},
> +	[JH7110_PD_DPHY_RX] =3D {
> +		.name =3D "DPHY-RX",
> +		.bit =3D 31,
> +	},
> +};
> +
> +static const struct jh71xx_pmu_match_data jh7110_pmu_dphy =3D {
> +	.num_domains =3D ARRAY_SIZE(jh7110_dphy_power_domains),
> +	.domain_info =3D jh7110_dphy_power_domains,
> +	.pmu_type =3D JH71XX_PMU_DPHY,
> +	.pmu_parse_dt =3D jh7110_pmu_dphy_parse_dt,
> +};
> +
>  static const struct of_device_id jh71xx_pmu_of_match[] =3D {
>  	{
>  		.compatible =3D "starfive,jh7110-pmu",
>  		.data =3D (void *)&jh7110_pmu,
> +	}, {
> +		.compatible =3D "starfive,jh7110-pmu-dphy",
> +		.data =3D (void *)&jh7110_pmu_dphy,
>  	}, {
>  		/* sentinel */
>  	}
> @@ -429,5 +493,6 @@ static struct platform_driver jh71xx_pmu_driver =3D {
>  builtin_platform_driver(jh71xx_pmu_driver);
> =20
>  MODULE_AUTHOR("Walker Chen <walker.chen@starfivetech.com>");
> +MODULE_AUTHOR("Changhuang Liang <changhuang.liang@starfivetech.com>");
>  MODULE_DESCRIPTION("StarFive JH71XX PMU Driver");
>  MODULE_LICENSE("GPL");
> --=20
> 2.25.1
>=20

--Xr1omY7vI0HCAtOr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZDXOAgAKCRB4tDGHoIJi
0muRAQCRXx5SEVKeJdwy6ees0QA7i97tZDRPO26TmTzuFhmyagD/Xd0OesD2v+P9
fzylrvgYbIioDk+jBC7VGTEeqry7/gg=
=hxzn
-----END PGP SIGNATURE-----

--Xr1omY7vI0HCAtOr--


--===============6472804555687481008==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============6472804555687481008==--

