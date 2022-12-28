Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70D63C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 19:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	In-Reply-To:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
	:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aaF4DYszdSkpsXajtq1CCvCD/MDKjH5IrVoGxNAGpQ8=; b=2/bJDCNtzV7O1JJqPT4Pu89Gkw
	CI/6PQxuPwXJBsBINLSVwoIw9Y5up07FwOH+qorxIka63vI5EnBcyhW7Vpy9q9Vz4VF+wHJQv2W7J
	vJCapNHvUFd8flh58IjWIYQAQBh45LhYM+4n4d35YhlfIm1sgLRRBTderJ3pFzCPD9tYpiZU1oV8G
	EdK5oUpE6YHBBTKQMJAZlOPiVrRHn8jpQZLKthD0O8R7YA9kHGY2jfsBAQbwDzLKJzabz7dX3nUzv
	z40sKRVGyhPg3TgjXL3lG9P5S4YN5ryE1PokHOxAuquAAP2/ytslV8rqv+lRwcWzP3MVbfXGft5Rq
	31Q5jK4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAcRJ-007iwF-Hv; Wed, 28 Dec 2022 19:50:13 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAcRF-007it7-Um
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 19:50:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3C0E461582;
	Wed, 28 Dec 2022 19:50:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 88E5EC433EF;
	Wed, 28 Dec 2022 19:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1672257007;
	bh=0bbRyIAzbIgaVjUgqvIh/JnCacz91hOhUqYWcD9wLOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YY6J6rRdjquW8LT1bHdOiDjiAG0wqaI43Adyxe6yne7OgdqgwEb3GgG3G4lo8WskI
	 4Nb9WqEqYbffvXFzIhhiwtBm+lg2Sj43UnDMHsoYEBLPPwdBJ3X46vLGRm0e1vcGiG
	 obdmIMyhQyZ6H6zWWom3FpnC3NOyTFz3vPmy/dR0v7bCcvlvqDNJXQ74nJwtVQgLcs
	 zubMhpq1XitE4P2ney+ZlsRTolehSmbFNZw8lZZd9F6auTTxdnEtaD7WGwf480DzIQ
	 XcmUEWwukayjCX/QH/giXJMoPkK5BQdymwf/XxGrKYoiKOfZl3tX6TNpwsBgS0e7rn
	 BaFnJ1SZ/IOWg==
Date: Wed, 28 Dec 2022 19:50:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Walker Chen <walker.chen@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: Re: [RESEND PATCH v2 2/3] soc: starfive: Add StarFive JH71XX pmu
 driver
Message-ID: <Y6yd6p16JxDz1j20@spud>
References: <20221208084523.9733-1-walker.chen@starfivetech.com>
 <20221208084523.9733-3-walker.chen@starfivetech.com>
 <Y6DMQpGuXfBWHr8L@spud>
 <83899ba9-dff0-a678-e319-565101f71157@starfivetech.com>
MIME-Version: 1.0
In-Reply-To: <83899ba9-dff0-a678-e319-565101f71157@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221228_115010_128927_EEDE7FFB 
X-CRM114-Status: GOOD (  63.42  )
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
Content-Type: multipart/mixed; boundary="===============2641697186883383569=="
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org


--===============2641697186883383569==
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="7BlfBYBi/3WRGk9W"
Content-Disposition: inline


--7BlfBYBi/3WRGk9W
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hey Walker,
Took another bit of a look.

On Wed, Dec 28, 2022 at 10:08:55AM +0800, Walker Chen wrote:
> On 2022/12/20 4:40, Conor Dooley wrote:
> > Hey Walker,
> >=20
> > Hopefully just some minor bits here. Hopefully either Emil who has a
> > board, or someone that knows power management stuff better can give this
> > a proper review.
> >=20
> > On Thu, Dec 08, 2022 at 04:45:22PM +0800, Walker Chen wrote:
> >> Add pmu driver for the StarFive JH71XX SoC.
> >>=20
> >> As the power domains provider, the Power Management Unit (PMU) is
> >> designed for including multiple PM domains that can be used for power
> >> gating of selected IP blocks for power saving by reduced leakage
> >> current. It accepts software encourage command to switch the power mode
> >> of SoC.
> >>=20
> >> Signed-off-by: Walker Chen <walker.chen@starfivetech.com>
> >> ---
> >>  MAINTAINERS                       |  14 ++
> >>  drivers/soc/Kconfig               |   1 +
> >>  drivers/soc/Makefile              |   1 +
> >>  drivers/soc/starfive/Kconfig      |  11 +
> >>  drivers/soc/starfive/Makefile     |   3 +
> >>  drivers/soc/starfive/jh71xx_pmu.c | 396 ++++++++++++++++++++++++++++++
> >>  6 files changed, 426 insertions(+)
> >>  create mode 100644 drivers/soc/starfive/Kconfig
> >>  create mode 100644 drivers/soc/starfive/Makefile
> >>  create mode 100644 drivers/soc/starfive/jh71xx_pmu.c
> >>=20
> >=20
> >> +config JH71XX_PMU
> >> +	bool "Support PMU for StarFive JH71XX Soc"
> >> +	depends on PM && (SOC_STARFIVE || COMPILE_TEST)
> >=20
> > Why not just do:
> > 	depends on PM
> > 	depends on SOC_STARFIVE || COMPILE_TEST
> > I think that way reads a little better.
>=20
> No problem, will be changed like this way.
>=20
> >=20
> >> +	default SOC_STARFIVE
> >> +	select PM_GENERIC_DOMAINS
> >> +	help
> >> +	  Say 'y' here to enable support power domain support.
> >> +	  In order to meet low power requirements, a Power Management Unit (=
PMU)
> >> +	  is designed for controlling power resources in StarFive JH71XX SoC=
s.
> >> diff --git a/drivers/soc/starfive/Makefile b/drivers/soc/starfive/Make=
file
> >> new file mode 100644
> >> index 000000000000..13b589d6b5f3
> >> --- /dev/null
> >> +++ b/drivers/soc/starfive/Makefile
> >> @@ -0,0 +1,3 @@
> >> +# SPDX-License-Identifier: GPL-2.0
> >> +
> >> +obj-$(CONFIG_JH71XX_PMU)	+=3D jh71xx_pmu.o
> >> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/=
jh71xx_pmu.c
> >> new file mode 100644
> >> index 000000000000..7a0145779e07
> >> --- /dev/null
> >> +++ b/drivers/soc/starfive/jh71xx_pmu.c
> >> @@ -0,0 +1,396 @@
> >> +// SPDX-License-Identifier: GPL-2.0-or-later
> >> +/*
> >> + * StarFive JH71XX PMU (Power Management Unit) Controller Driver
> >> + *
> >> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
> >> + */
> >> +
> >> +#include <linux/interrupt.h>
> >> +#include <linux/io.h>
> >> +#include <linux/iopoll.h>
> >> +#include <linux/module.h>
> >> +#include <linux/of.h>
> >> +#include <linux/of_device.h>
> >> +#include <linux/platform_device.h>
> >> +#include <linux/pm_domain.h>
> >> +#include <dt-bindings/power/starfive,jh7110-pmu.h>
> >> +
> >> +/* register offset */
> >> +#define JH71XX_PMU_HW_EVENT_ON		0x04
> >> +#define JH71XX_PMU_HW_EVENT_OFF		0x08

Neither of these are used here at the moment - would they be used in the
future? Also the docs fail to describe this PMU_HW_EVENT_OFF register,
although the HW_ON, and SW_FOO ones are described.

> >> +#define JH71XX_PMU_SW_TURN_ON_POWER	0x0C
> >> +#define JH71XX_PMU_SW_TURN_OFF_POWER	0x10
> >> +#define JH71XX_PMU_SW_ENCOURAGE		0x44
> >> +#define JH71XX_PMU_INT_MASK		0x48

This one is called the "Timer Interrupt Mask", so we may as well match
that naming here, no?

> >> +#define JH71XX_PMU_PCH_BYPASS		0x4C
> >> +#define JH71XX_PMU_PCH_PSTATE		0x50
> >> +#define JH71XX_PMU_PCH_TIMEOUT		0x54
> >> +#define JH71XX_PMU_LP_TIMEOUT		0x58
> >> +#define JH71XX_PMU_HW_TURN_ON		0x5C

Same here, this HW related bit is also not used AFAICT.
Do you intend adding a user of the HW encourage at some point in the
future?

> >> +#define JH71XX_PMU_CURR_POWER_MODE	0x80
> >> +#define JH71XX_PMU_EVENT_STATUS		0x88
> >> +#define JH71XX_PMU_INT_STATUS		0x8C
> >> +
> >> +/* sw encourage cfg */
> >> +#define JH71XX_PMU_SW_ENCOURAGE_EN_LO	0x05
> >> +#define JH71XX_PMU_SW_ENCOURAGE_EN_HI	0x50
> >> +#define JH71XX_PMU_SW_ENCOURAGE_DIS_LO	0x0A
> >> +#define JH71XX_PMU_SW_ENCOURAGE_DIS_HI	0xA0
> >> +#define JH71XX_PMU_SW_ENCOURAGE_ON	0xFF

This all seems to correspond w/ docs...

> >> +
> >> +/* pmu int status */
> >> +#define JH71XX_PMU_INT_SEQ_DONE		BIT(0)
> >> +#define JH71XX_PMU_INT_HW_REQ		BIT(1)
> >> +#define JH71XX_PMU_INT_SW_FAIL		GENMASK(3, 2)
> >> +#define JH71XX_PMU_INT_HW_FAIL		GENMASK(5, 4)
> >> +#define JH71XX_PMU_INT_PCH_FAIL		GENMASK(8, 6)
> >> +#define JH71XX_PMU_INT_FAIL_MASK	(JH71XX_PMU_INT_SW_FAIL | \
> >> +					JH71XX_PMU_INT_HW_FAIL | \
> >> +					JH71XX_PMU_INT_PCH_FAIL)
> >> +#define JH71XX_PMU_INT_ALL_MASK		(JH71XX_PMU_INT_SEQ_DONE | \
> >> +					JH71XX_PMU_INT_HW_REQ | \
> >> +					JH71XX_PMU_INT_FAIL_MASK)

=2E..as does all of this - although, could the FAIL_MASK be dropped as it
appears to only be used here & the ALL_MASK definition be replaced with
GENMASK(8, 0)?
I don't really mind what you do here, think it just may be slightly
easier to read, so if you disagree leave it as is.

> >> +
> >> +/*
> >> + * The time required for switching power status is based on the time
> >> + * to turn on the largest domain's power, which is at microsecond lev=
el

Would you mind mentioning which domain that is?
USB seems to be listed in Table 3-9 as 200 us.

> >> + */
> >> +#define JH71XX_PMU_TIMEOUT_US		100

I'm happy enough with things, apart from my lack of familiarity with the
power management APIs. Perhaps when you send the next version, someone
else can comment there.

> >> +struct jh71xx_domain_info {
> >=20
> > 	const char * const name;
> > 	unsigned int flags;
> > 	u8 bit;
> >=20
> >> +};
> >> +
> >> +struct jh71xx_pmu_match_data {
> >=20
> > 	const struct jh71xx_domain_info *domain_info;
> > 	int num_domains;
> >=20
> > Can you switch these two around like so?
>=20
> Should be no problem.
>=20
> >> +};
> >> +
> >> +struct jh71xx_pmu {
> >> +	struct device *dev;
> >> +	const struct jh71xx_pmu_match_data *match_data;
> >> +	void __iomem *base;
> >> +	spinlock_t lock;	/* protects pmu reg */
> >> +	int irq;
> >> +	struct genpd_onecell_data genpd_data;
> >> +	struct generic_pm_domain **genpd;
> >> +};
> >> +
> >> +struct jh71xx_pmu_dev {
> >> +	struct generic_pm_domain genpd;
> >> +	const struct jh71xx_domain_info *domain_info;
> >> +	struct jh71xx_pmu *pmu;
> >=20
> > And these two too please in the same way.
>=20
> Nice :)
>=20
> >=20
> >> +};
> >> +
> >> +static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask,=
 bool *is_on)
> >> +{
> >> +	struct jh71xx_pmu *pmu =3D pmd->pmu;
> >> +
> >> +	if (!mask) {
> >> +		*is_on =3D false;
> >> +		return -EINVAL;
> >> +	}
> >> +
> >> +	*is_on =3D readl(pmu->base + JH71XX_PMU_CURR_POWER_MODE) & mask;
> >> +
> >> +	return 0;
> >> +}
> >> +
> >> +static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask,=
 bool on)
> >> +{
> >> +	struct jh71xx_pmu *pmu =3D pmd->pmu;
> >> +	unsigned long flags;
> >> +	u32 val;
> >> +	u32 mode;
> >> +	u32 encourage_lo;
> >> +	u32 encourage_hi;
> >> +	bool is_on;
> >> +	int ret;
> >> +
> >> +	ret =3D jh71xx_pmu_get_state(pmd, mask, &is_on);
> >> +	if (ret) {
> >> +		dev_dbg(pmu->dev, "unable to get current state for %s\n",
> >> +			pmd->genpd.name);
> >> +		return ret;
> >> +	}
> >> +
> >> +	if (is_on =3D=3D on) {
> >> +		dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
> >> +			pmd->genpd.name, on ? "en" : "dis");
> >> +		return 0;
> >> +	}
> >> +
> >> +	spin_lock_irqsave(&pmu->lock, flags);
> >> +
> >> +	/*
> >> +	 * The PMU accepts software encourage to switch power mode in the fo=
llowing 2 steps:
> >> +	 *
> >> +	 * 1. Configure the register SW_TURN_ON_POWER (offset 0x0c), write 1=
 to
> >> +	 *    the bit which power domain will be turn-on, write 0 to the oth=
ers.
> >=20
> > Some grammatical nit picking..
> >=20
> > "Configure the register blah (offset 0x0c) by writing 1 to the bit
> > corresponding to the power domain that will be turned on and writing
> > zero to the others."
> >=20
> > Is that a correct correct summation of the operation?
>=20
> Yes, maybe your description is better easy-to-understand.
>=20
> >=20
> >> +	 *    Likewise, configure the register SW_TURN_OFF_POWER (offset 0x1=
0),
> >> +	 *    write 1 to the bit which power domain will be turn-off, write =
0 to the others.
> >=20
> >=20
> >> +	 */
> >> +	if (on) {
> >> +		mode =3D JH71XX_PMU_SW_TURN_ON_POWER;
> >> +		encourage_lo =3D JH71XX_PMU_SW_ENCOURAGE_EN_LO;
> >> +		encourage_hi =3D JH71XX_PMU_SW_ENCOURAGE_EN_HI;
> >> +	} else {
> >> +		mode =3D JH71XX_PMU_SW_TURN_OFF_POWER;
> >> +		encourage_lo =3D JH71XX_PMU_SW_ENCOURAGE_DIS_LO;
> >> +		encourage_hi =3D JH71XX_PMU_SW_ENCOURAGE_DIS_HI;
> >> +	}
> >> +
> >> +	writel(mask, pmu->base + mode);
> >> +
> >> +	/*
> >> +	 * 2. Write SW encourage command sequence to the Software Encourage =
Reg (offset 0x44)
> >> +	 * SW turn-on command sequence: 0xff -> 0x05 -> 0x50
> >> +	 * SW turn-off command sequence: 0xff -> 0x0a -> 0xa0
> >=20
> > I think you could replace the hard "coded" numbers here with a better
> > description idk without looking at the #defines above what these
> > correspond to. AFAICT, it'd be something like:
> > First write the ...ENCOURAGE_ON to reset the state machine which parses
> > the command sequence. It must be written every time.
> > Then write the lower bits of the command sequence, followed by the upper
> > bits. The sequence differs between powering on & off a domain.
>=20
> Thank you for correction for these description. Because English is not my=
 native language,
> so not very good in some sentences. I'll take your advice.

It may be mine but that does not mean I don't make mistakes either :)
In this case, I'd like to re-word my suggestion. How about:
First write ...ENCOURAGE_ON to ...SW_ENCOURAGE. This will reset the state
machine which parses the command sequence. This register must be written
every time software wants to power on/off a domain.
Then write the lower bits of the command sequence, followed by the upper
bits. The sequence differs between powering on & off a domain.

When I read my previous suggestion back, I had to read it more than once
to get what I had meant...

> >> +	 * Note: writing SW_MODE_ENCOURAGE_ON (0xFF) to the SW_ENCOURAGE reg=
ister,
> >> +	 * the purpose is to reset the state machine which is going to parse=
 instruction
> >> +	 *  sequence. It has to be written every time.
> >> +	 */
> >> +	writel(JH71XX_PMU_SW_ENCOURAGE_ON, pmu->base + JH71XX_PMU_SW_ENCOURA=
GE);
> >> +	writel(encourage_lo, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
> >> +	writel(encourage_hi, pmu->base + JH71XX_PMU_SW_ENCOURAGE);
> >> +
> >> +	spin_unlock_irqrestore(&pmu->lock, flags);
> >> +
> >> +	/* Wait for the power domain bit to be enabled / disabled */
> >> +	if (on) {
> >> +		ret =3D readl_poll_timeout_atomic(pmu->base + JH71XX_PMU_CURR_POWER=
_MODE,
> >> +						val, val & mask,
> >> +						1, JH71XX_PMU_TIMEOUT_US);
> >> +	} else {
> >> +		ret =3D readl_poll_timeout_atomic(pmu->base + JH71XX_PMU_CURR_POWER=
_MODE,
> >> +						val, !(val & mask),
> >> +						1, JH71XX_PMU_TIMEOUT_US);
> >> +	}
> >> +
> >> +	if (ret) {
> >> +		dev_err(pmu->dev, "%s: failed to power %s\n",
> >> +			pmd->genpd.name, on ? "on" : "off");
> >> +		return -ETIMEDOUT;
> >> +	}
> >> +
> >> +	return 0;
> >> +}
> >=20
> >> +static int jh71xx_pmu_probe(struct platform_device *pdev)
> >> +{
> >> +	struct device *dev =3D &pdev->dev;
> >> +	struct device_node *np =3D dev->of_node;
> >> +	const struct jh71xx_pmu_match_data *match_data;
> >> +	struct jh71xx_pmu *pmu;
> >> +	unsigned int i;
> >> +	int ret;
> >> +
> >> +	pmu =3D devm_kzalloc(dev, sizeof(*pmu), GFP_KERNEL);
> >> +	if (!pmu)
> >> +		return -ENOMEM;
> >> +
> >> +	pmu->base =3D devm_platform_ioremap_resource(pdev, 0);
> >> +	if (IS_ERR(pmu->base))
> >> +		return PTR_ERR(pmu->base);
> >> +
> >> +	/* initialize pmu interrupt  */
> >=20
> > nit: this comment is ~pointless.
>=20
> Will be dropped.
>=20
> >=20
> >> +	pmu->irq =3D platform_get_irq(pdev, 0);
> >> +	if (pmu->irq < 0)
> >> +		return pmu->irq;
> >> +
> >> +	ret =3D devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
> >> +			       0, pdev->name, pmu);
> >> +	if (ret)
> >> +		dev_err(dev, "request irq failed.\n");
> >=20
> > nit: s/request/requesting
>=20
> Will be fixed.
>=20
> >=20
> > Unfortunately I cannot really review the rest of this, but hopefully
> > I'll get a board soon and can try it out - or else send me a link to
> > your TRM or w/e.
>=20
> Anyway, I would like to thank you very much for your time.

Oh, while I think of it - I was talking to some people from Imagination
at the RISC-V Summit who said they're working on open sourcing their
GPU drivers, so hopefully we do end up with an open source driver for
the one on JH7110 soon :)

Thanks,
Conor.


--7BlfBYBi/3WRGk9W
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY6yd6gAKCRB4tDGHoIJi
0iY0AP0fmLHc/vRaesHOCScosW0+q7tHUxZMvtSm3xd+E33keAEAheawec+rAjtV
dhtpRna/460a6BqH/UhhZ0er9MMGwQ0=
=ix2e
-----END PGP SIGNATURE-----

--7BlfBYBi/3WRGk9W--


--===============2641697186883383569==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv

--===============2641697186883383569==--

