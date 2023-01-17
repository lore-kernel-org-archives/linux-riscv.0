Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8CBC3DA78
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 10:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=IFcD1BJKsbruC+ZJOdNTH8XQ1SzrT689hykhiOWXzZQ=; b=OjdIQAZwtmePP+
	2X+tBlFdM7xfnazif9hg4C2+62ZLaoyooc/GZnZYGXin4cpe2ecrfbuUrYngXcm6D++5cLzg4IRa9
	+LOrOtBujtHXRzvYCCJYo2Xe6iKEVom7wGQ/pj3aApi2FUwi1wVGpBcDCEUm0yMgLZXt0xE/LmIz5
	FAyDXTkeib30T0ritrSzFn4vliH0BmYRNdAFoF3QfTqQ8GJftSW1kfPoUZxaOXGK4ds3HjrwX0h7j
	8uvgHjzdAa9hHR/JRM9OPaCNBo1Wr3kHYL91s+scJUTmjomM2mR9GqsnNeqDm30/XEfeLOq36iRYN
	WBABGDVMUnRJbbj4DQyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHiuB-00DhTJ-IB; Tue, 17 Jan 2023 10:09:23 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHity-00DhR9-4l
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 10:09:11 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1pHitr-0006k8-Rj; Tue, 17 Jan 2023 11:09:03 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor.dooley@microchip.com>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>,
 "Rafael J . Wysocki" <rafael@kernel.org>,
 Walker Chen <walker.chen@starfivetech.com>, linux-kernel@vger.kernel.org,
 Walker Chen <walker.chen@starfivetech.com>
Subject: Re: [PATCH v3 2/3] soc: starfive: Add StarFive JH71XX pmu driver
Date: Tue, 17 Jan 2023 11:09:03 +0100
Message-ID: <10209933.nUPlyArG6x@diego>
In-Reply-To: <20230116074259.22874-3-walker.chen@starfivetech.com>
References:  <20230116074259.22874-1-walker.chen@starfivetech.com>
 <20230116074259.22874-3-walker.chen@starfivetech.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230117_020910_224387_53232B94 
X-CRM114-Status: GOOD (  22.33  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Hi Walker,

Am Montag, 16. Januar 2023, 08:42:58 CET schrieb Walker Chen:
> +static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool *is_on)
> +{
> +	struct jh71xx_pmu *pmu = pmd->pmu;
> +
> +	if (!mask) {
> +		*is_on = false;

nit: While it's not necessarily bad, I don't think callers of
jh71xx_pmu_get_state() should expect this to be set in error case.

> +		return -EINVAL;
> +	}
> +
> +	*is_on = readl(pmu->base + JH71XX_PMU_CURR_POWER_MODE) & mask;
> +
> +	return 0;
> +}

[...]

> +static int jh71xx_pmu_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	const struct jh71xx_pmu_match_data *match_data;
> +	struct jh71xx_pmu *pmu;
> +	unsigned int i;
> +	int ret;
> +
> +	pmu = devm_kzalloc(dev, sizeof(*pmu), GFP_KERNEL);
> +	if (!pmu)
> +		return -ENOMEM;
> +
> +	pmu->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(pmu->base))
> +		return PTR_ERR(pmu->base);
> +
> +	pmu->irq = platform_get_irq(pdev, 0);
> +	if (pmu->irq < 0)
> +		return pmu->irq;
> +
> +	ret = devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
> +			       0, pdev->name, pmu);
> +	if (ret)
> +		dev_err(dev, "failed to request irq\n");
> +
> +	match_data = of_device_get_match_data(dev);
> +	if (!match_data)
> +		return -EINVAL;
> +
> +	pmu->genpd = devm_kcalloc(dev, match_data->num_domains,
> +				  sizeof(struct generic_pm_domain *),
> +				  GFP_KERNEL);
> +	if (!pmu->genpd)
> +		return -ENOMEM;
> +
> +	pmu->dev = dev;
> +	pmu->match_data = match_data;
> +	pmu->genpd_data.domains = pmu->genpd;
> +	pmu->genpd_data.num_domains = match_data->num_domains;
> +
> +	for (i = 0; i < match_data->num_domains; i++) {
> +		ret = jh71xx_pmu_init_domain(pmu, i);
> +		if (ret) {
> +			dev_err(dev, "failed to initialize power domain\n");
> +			return ret;
> +		}
> +	}
> +
> +	spin_lock_init(&pmu->lock);
> +	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
> +
> +	ret = of_genpd_add_provider_onecell(np, &pmu->genpd_data);
> +	if (ret) {
> +		dev_err(dev, "failed to register genpd driver: %d\n", ret);
> +		return ret;
> +	}
> +
> +	dev_info(dev, "registered %u power domains\n", i);

nit: I guess that could be a dev_dbg to not spam the kernel log too much?


> +	return 0;
> +}
> +
> +static const struct jh71xx_domain_info jh7110_power_domains[] = {
> +	[JH7110_PD_SYSTOP] = {
> +		.name = "SYSTOP",
> +		.bit = 0,
> +		.flags = GENPD_FLAG_ALWAYS_ON,
> +	},
> +	[JH7110_PD_CPU] = {
> +		.name = "CPU",
> +		.bit = 1,
> +		.flags = GENPD_FLAG_ALWAYS_ON,
> +	},
> +	[JH7110_PD_GPUA] = {
> +		.name = "GPUA",
> +		.bit = 2,
> +	},
> +	[JH7110_PD_VDEC] = {
> +		.name = "VDEC",
> +		.bit = 3,
> +	},
> +	[JH7110_PD_VOUT] = {
> +		.name = "VOUT",
> +		.bit = 4,
> +	},
> +	[JH7110_PD_ISP] = {
> +		.name = "ISP",
> +		.bit = 5,
> +	},
> +	[JH7110_PD_VENC] = {
> +		.name = "VENC",
> +		.bit = 6,
> +	},
> +};
> +
> +static const struct jh71xx_pmu_match_data jh7110_pmu = {
> +	.num_domains = ARRAY_SIZE(jh7110_power_domains),
> +	.domain_info = jh7110_power_domains,
> +};
> +
> +static const struct of_device_id jh71xx_pmu_of_match[] = {
> +	{
> +		.compatible = "starfive,jh7110-pmu",
> +		.data = (void *)&jh7110_pmu,
> +	}, {
> +		/* sentinel */
> +	}
> +};
> +
> +static struct platform_driver jh71xx_pmu_driver = {
> +	.driver = {
> +		.name = "jh71xx-pmu",
> +		.of_match_table = jh71xx_pmu_of_match,

In the rockchip pm-domains driver we have

                /*
                 * We can't forcibly eject devices from the power
                 * domain, so we can't really remove power domains
                 * once they were added.
                 */
                .suppress_bind_attrs = true,

here, which might be valid for your pmu driver as well.


Other than that
Reviewed-by: Heiko Stuebner <heiko@sntech.de>




_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
