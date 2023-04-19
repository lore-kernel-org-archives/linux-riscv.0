Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDCEC6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 17:29:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BeYtPbMz+QOKs4yBPP/bjta3W9jD+5YuIgpsgh16pZk=; b=s/eLAyHpsjY8eqk0eqpTCj3Df7
	H60vkdclwTHC3CfvRWndpdWZNrT1ruYx6GNCLmDegyUIohGz/AoaLere3+QiEdQ5wb31GwOaPASkf
	J/otC0Vve9+EQ7uG/0BBJCr9xPOCpNrXG/HfJ1xEZMyCynFU8aBa4ZY4t232CVXQ5PkuRS4N9tSKk
	Uw+3t/9K+uf0zm3AMXGJ7sjMajEK9iUOrCsFFnPSK8Ena7xdCa7HvAhW3PngIFeH+qktiujkFbXfn
	b+NopS9QtbI6TrRQ02xLvY+eomjFxB21H8AF9JyrSgo76XDiXzlt4ms0TFV0ttZ6WqWev3LY4vZQB
	UpX74fqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppBcQ-0063DS-0L;
	Wed, 19 Apr 2023 17:29:22 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppBcM-0063Br-0m
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 17:29:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 9856D64053;
	Wed, 19 Apr 2023 17:29:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97ACCC433EF;
	Wed, 19 Apr 2023 17:29:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1681925357;
	bh=dBjJtM9HGcn63G8tRHjZ+HaXYz8+0XXQc0yx7wTgNAc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LMrM/BtLJo/Bjo57ErdeSVhavDIBrLKpi1nsJNkJJWr7Uuog4uqgqi69EvbBUKm1M
	 mX6opbOHJ4ghRP9F1ERGpGU0SVClOEoVogB2/Mwg5LzJP3/a5Uldpwb3yF1EU8LbJn
	 zK2IdWtq6edx3Ah7pm2zRFy1s8dE6uCP9ysdl7SUjlGvP4AVu5thwdke+FICZfkNmy
	 SxLwCD2VOzeeG/I2d4hu10Vo+++tXdEIAZE3siYysrxWx+8UjO1f+6sgZc3Oi8zg0e
	 /Sgz1aFj2gRnX0139Fs6D00HgzTl2aR8fu7rcrKCQs5pprzgYVG7hsX7LXtaSXT00w
	 kGn7JMVJDSowg==
Date: Wed, 19 Apr 2023 18:29:12 +0100
From: Conor Dooley <conor@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Walker Chen <walker.chen@starfivetech.com>,
	Hal Feng <hal.feng@starfivetech.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [RESEND v2 3/6] soc: starfive: Modify ioremap to regmap
Message-ID: <20230419-headdress-surcharge-8017d6db444b@spud>
References: <20230419035646.43702-1-changhuang.liang@starfivetech.com>
 <20230419035646.43702-4-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <20230419035646.43702-4-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_102918_379241_73604D7A 
X-CRM114-Status: GOOD (  26.30  )
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
Content-Type: multipart/mixed; boundary="===============1696628699773375385=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============1696628699773375385==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="XH9Lm32OUTczAMsU"
Content-Disposition: inline


--XH9Lm32OUTczAMsU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 18, 2023 at 08:56:43PM -0700, Changhuang Liang wrote:
> Modify ioremap to regmap which can be compatible with the syscon
> interface, such as:
> struct regmap *syscon_node_to_regmap(struct device_node *np)
> Convenient introduction of syscon operation.

What's missing here is an explanation of *why* you are making this
compatible with the syscon interface. Provided everything else is fine,
I can fix this when applying the series.

Thanks,
Conor.

>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/soc/starfive/jh71xx_pmu.c | 43 +++++++++++++++++--------------
>  1 file changed, 23 insertions(+), 20 deletions(-)
>=20
> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh7=
1xx_pmu.c
> index 7d5f50d71c0d..306218c83691 100644
> --- a/drivers/soc/starfive/jh71xx_pmu.c
> +++ b/drivers/soc/starfive/jh71xx_pmu.c
> @@ -6,13 +6,13 @@
>   */
> =20
>  #include <linux/interrupt.h>
> -#include <linux/io.h>
> -#include <linux/iopoll.h>
> +#include <linux/mfd/syscon.h>
>  #include <linux/module.h>
>  #include <linux/of.h>
>  #include <linux/of_device.h>
>  #include <linux/platform_device.h>
>  #include <linux/pm_domain.h>
> +#include <linux/regmap.h>
>  #include <dt-bindings/power/starfive,jh7110-pmu.h>
> =20
>  /* register offset */
> @@ -59,7 +59,7 @@ struct jh71xx_pmu_match_data {
>  struct jh71xx_pmu {
>  	struct device *dev;
>  	const struct jh71xx_pmu_match_data *match_data;
> -	void __iomem *base;
> +	struct regmap *base;
>  	struct generic_pm_domain **genpd;
>  	struct genpd_onecell_data genpd_data;
>  	int irq;
> @@ -75,11 +75,14 @@ struct jh71xx_pmu_dev {
>  static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bo=
ol *is_on)
>  {
>  	struct jh71xx_pmu *pmu =3D pmd->pmu;
> +	unsigned int val;
> =20
>  	if (!mask)
>  		return -EINVAL;
> =20
> -	*is_on =3D readl(pmu->base + JH71XX_PMU_CURR_POWER_MODE) & mask;
> +	regmap_read(pmu->base, JH71XX_PMU_CURR_POWER_MODE, &val);
> +
> +	*is_on =3D val & mask;
> =20
>  	return 0;
>  }
> @@ -130,7 +133,7 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev=
 *pmd, u32 mask, bool on)
>  		encourage_hi =3D JH71XX_PMU_SW_ENCOURAGE_DIS_HI;
>  	}
> =20
> -	writel(mask, pmu->base + mode);
> +	regmap_write(pmu->base, mode, mask);
> =20
>  	/*
>  	 * 2.Write SW encourage command sequence to the Software Encourage Reg =
(offset 0x44)
> @@ -140,21 +143,21 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_d=
ev *pmd, u32 mask, bool on)
>  	 *   Then write the lower bits of the command sequence, followed by the=
 upper
>  	 *   bits. The sequence differs between powering on & off a domain.
>  	 */
> -	writel(JH71XX_PMU_SW_ENCOURAGE_ON, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
> -	writel(encourage_lo, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
> -	writel(encourage_hi, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
> +	regmap_write(pmu->base, JH71XX_PMU_SW_ENCOURAGE, JH71XX_PMU_SW_ENCOURAG=
E_ON);
> +	regmap_write(pmu->base, JH71XX_PMU_SW_ENCOURAGE, encourage_lo);
> +	regmap_write(pmu->base, JH71XX_PMU_SW_ENCOURAGE, encourage_hi);
> =20
>  	spin_unlock_irqrestore(&pmu->lock, flags);
> =20
>  	/* Wait for the power domain bit to be enabled / disabled */
>  	if (on) {
> -		ret =3D readl_poll_timeout_atomic(pmu->base + JH71XX_PMU_CURR_POWER_MO=
DE,
> -						val, val & mask,
> -						1, JH71XX_PMU_TIMEOUT_US);
> +		ret =3D regmap_read_poll_timeout_atomic(pmu->base, JH71XX_PMU_CURR_POW=
ER_MODE,
> +						      val, val & mask,
> +						      1, JH71XX_PMU_TIMEOUT_US);
>  	} else {
> -		ret =3D readl_poll_timeout_atomic(pmu->base + JH71XX_PMU_CURR_POWER_MO=
DE,
> -						val, !(val & mask),
> -						1, JH71XX_PMU_TIMEOUT_US);
> +		ret =3D regmap_read_poll_timeout_atomic(pmu->base, JH71XX_PMU_CURR_POW=
ER_MODE,
> +						      val, !(val & mask),
> +						      1, JH71XX_PMU_TIMEOUT_US);
>  	}
> =20
>  	if (ret) {
> @@ -190,14 +193,14 @@ static void jh71xx_pmu_int_enable(struct jh71xx_pmu=
 *pmu, u32 mask, bool enable)
>  	unsigned long flags;
> =20
>  	spin_lock_irqsave(&pmu->lock, flags);
> -	val =3D readl(pmu->base + JH71XX_PMU_TIMER_INT_MASK);
> +	regmap_read(pmu->base, JH71XX_PMU_TIMER_INT_MASK, &val);
> =20
>  	if (enable)
>  		val &=3D ~mask;
>  	else
>  		val |=3D mask;
> =20
> -	writel(val, pmu->base + JH71XX_PMU_TIMER_INT_MASK);
> +	regmap_write(pmu->base, JH71XX_PMU_TIMER_INT_MASK, val);
>  	spin_unlock_irqrestore(&pmu->lock, flags);
>  }
> =20
> @@ -206,7 +209,7 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void=
 *data)
>  	struct jh71xx_pmu *pmu =3D data;
>  	u32 val;
> =20
> -	val =3D readl(pmu->base + JH71XX_PMU_INT_STATUS);
> +	regmap_read(pmu->base, JH71XX_PMU_INT_STATUS, &val);
> =20
>  	if (val & JH71XX_PMU_INT_SEQ_DONE)
>  		dev_dbg(pmu->dev, "sequence done.\n");
> @@ -220,8 +223,8 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void=
 *data)
>  		dev_err(pmu->dev, "p-channel fail event.\n");
> =20
>  	/* clear interrupts */
> -	writel(val, pmu->base + JH71XX_PMU_INT_STATUS);
> -	writel(val, pmu->base + JH71XX_PMU_EVENT_STATUS);
> +	regmap_write(pmu->base, JH71XX_PMU_INT_STATUS, val);
> +	regmap_write(pmu->base, JH71XX_PMU_EVENT_STATUS, val);
> =20
>  	return IRQ_HANDLED;
>  }
> @@ -271,7 +274,7 @@ static int jh71xx_pmu_probe(struct platform_device *p=
dev)
>  	if (!pmu)
>  		return -ENOMEM;
> =20
> -	pmu->base =3D devm_platform_ioremap_resource(pdev, 0);
> +	pmu->base =3D device_node_to_regmap(np);
>  	if (IS_ERR(pmu->base))
>  		return PTR_ERR(pmu->base);
> =20
> --=20
> 2.25.1
>=20

--XH9Lm32OUTczAMsU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZEAk6AAKCRB4tDGHoIJi
0h3vAQCRte93vA8RyHW8U1k0Hkk+ce6ZTjaT7mORbWdqxxyMYQEAm8X5jywC5/ts
d4zGZg32pS+F5jY8JrcLpbEy0yHqewo=
=5Bxg
-----END PGP SIGNATURE-----

--XH9Lm32OUTczAMsU--


--===============1696628699773375385==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============1696628699773375385==--

