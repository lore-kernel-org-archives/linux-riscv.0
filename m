Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB232C77B7D
	for <linux-riscv@archiver.kernel.org>; Wed, 10 May 2023 06:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yfMtyqL6ZfF9WXNtUFfIk0IW/h9gxLNWpI6Ixu0VDMI=; b=t4ZKIcA4XW5irV
	fIWtpCU/ObyZdUCMx30buKLoY/p2PN66nsxQ2Qx2Ue3xQfyW2DBQ3H3+ES4gIcHuYgbXwXaa8+8mB
	e6/bY81m1W5MZdYvvI3EiHcxE5Csg7/I4W1kz98xYY8pR3+6B/yu9eUtBXVaJCCxg+exqObzjt1py
	7j8jnKV1fYW9ScRq9MymlA6vOdX2xKvNJKC8+6SNFa/ToyjAqmQLeDHjP6gwWVaLlcNCu5Q5O88Tw
	F3ckMVkW890rcalhRbR9PYkeM5ZlkTb/Csvay7Jl5M22L/nl+Ug8MDQKaJZ7tL8RmBSSwHXnmU8cX
	oX/7kaG5e27YUVDCiDrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdgT-005J00-2Y;
	Wed, 10 May 2023 06:52:21 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwdgQ-005IxY-09
	for linux-riscv@lists.infradead.org;
	Wed, 10 May 2023 06:52:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 2C36A24E292;
	Wed, 10 May 2023 14:51:42 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 14:51:42 +0800
Received: from [192.168.125.124] (183.27.98.219) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 10 May
 2023 14:51:41 +0800
Message-ID: <88660bc1-035c-fa7b-d541-d29bc142e043@starfivetech.com>
Date: Wed, 10 May 2023 14:51:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 3/5] soc: starfive: Extract JH7110 pmu private
 operations
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: Hal Feng <hal.feng@starfivetech.com>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
References: <20230510015311.27505-1-changhuang.liang@starfivetech.com>
 <20230510015311.27505-4-changhuang.liang@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230510015311.27505-4-changhuang.liang@starfivetech.com>
X-Originating-IP: [183.27.98.219]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_235218_415299_4D2C12EC 
X-CRM114-Status: GOOD (  22.08  )
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

On 2023/5/10 9:53, Changhuang Liang wrote:
> Move JH7110 private operation into private data of compatible. Convenient
> to add AON PMU which would not have interrupts property.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

Reviewed-by: Walker Chen <walker.chen@starfivetech.com>
Thanks!

> ---
>  drivers/soc/starfive/jh71xx_pmu.c | 89 +++++++++++++++++++++----------
>  1 file changed, 62 insertions(+), 27 deletions(-)
> 
> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
> index 7d5f50d71c0d..0dbdcc0d2c91 100644
> --- a/drivers/soc/starfive/jh71xx_pmu.c
> +++ b/drivers/soc/starfive/jh71xx_pmu.c
> @@ -51,9 +51,17 @@ struct jh71xx_domain_info {
>  	u8 bit;
>  };
>  
> +struct jh71xx_pmu;
> +struct jh71xx_pmu_dev;
> +
>  struct jh71xx_pmu_match_data {
>  	const struct jh71xx_domain_info *domain_info;
>  	int num_domains;
> +	unsigned int pmu_status;
> +	int (*pmu_parse_irq)(struct platform_device *pdev,
> +			     struct jh71xx_pmu *pmu);
> +	int (*pmu_set_state)(struct jh71xx_pmu_dev *pmd,
> +			     u32 mask, bool on);
>  };
>  
>  struct jh71xx_pmu {
> @@ -79,12 +87,12 @@ static int jh71xx_pmu_get_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool *is_o
>  	if (!mask)
>  		return -EINVAL;
>  
> -	*is_on = readl(pmu->base + JH71XX_PMU_CURR_POWER_MODE) & mask;
> +	*is_on = readl(pmu->base + pmu->match_data->pmu_status) & mask;
>  
>  	return 0;
>  }
>  
> -static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
> +static int jh7110_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>  {
>  	struct jh71xx_pmu *pmu = pmd->pmu;
>  	unsigned long flags;
> @@ -92,22 +100,8 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>  	u32 mode;
>  	u32 encourage_lo;
>  	u32 encourage_hi;
> -	bool is_on;
>  	int ret;
>  
> -	ret = jh71xx_pmu_get_state(pmd, mask, &is_on);
> -	if (ret) {
> -		dev_dbg(pmu->dev, "unable to get current state for %s\n",
> -			pmd->genpd.name);
> -		return ret;
> -	}
> -
> -	if (is_on == on) {
> -		dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
> -			pmd->genpd.name, on ? "en" : "dis");
> -		return 0;
> -	}
> -
>  	spin_lock_irqsave(&pmu->lock, flags);
>  
>  	/*
> @@ -166,6 +160,29 @@ static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
>  	return 0;
>  }
>  
> +static int jh71xx_pmu_set_state(struct jh71xx_pmu_dev *pmd, u32 mask, bool on)
> +{
> +	struct jh71xx_pmu *pmu = pmd->pmu;
> +	const struct jh71xx_pmu_match_data *match_data = pmu->match_data;
> +	bool is_on;
> +	int ret;
> +
> +	ret = jh71xx_pmu_get_state(pmd, mask, &is_on);
> +	if (ret) {
> +		dev_dbg(pmu->dev, "unable to get current state for %s\n",
> +			pmd->genpd.name);
> +		return ret;
> +	}
> +
> +	if (is_on == on) {
> +		dev_dbg(pmu->dev, "pm domain [%s] is already %sable status.\n",
> +			pmd->genpd.name, on ? "en" : "dis");
> +		return 0;
> +	}
> +
> +	return match_data->pmu_set_state(pmd, mask, on);
> +}
> +
>  static int jh71xx_pmu_on(struct generic_pm_domain *genpd)
>  {
>  	struct jh71xx_pmu_dev *pmd = container_of(genpd,
> @@ -226,6 +243,25 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int jh7110_pmu_parse_irq(struct platform_device *pdev, struct jh71xx_pmu *pmu)
> +{
> +	struct device *dev = &pdev->dev;
> +	int ret;
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
> +	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
> +
> +	return 0;
> +}
> +
>  static int jh71xx_pmu_init_domain(struct jh71xx_pmu *pmu, int index)
>  {
>  	struct jh71xx_pmu_dev *pmd;
> @@ -275,19 +311,18 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
>  	if (IS_ERR(pmu->base))
>  		return PTR_ERR(pmu->base);
>  
> -	pmu->irq = platform_get_irq(pdev, 0);
> -	if (pmu->irq < 0)
> -		return pmu->irq;
> -
> -	ret = devm_request_irq(dev, pmu->irq, jh71xx_pmu_interrupt,
> -			       0, pdev->name, pmu);
> -	if (ret)
> -		dev_err(dev, "failed to request irq\n");
> +	spin_lock_init(&pmu->lock);
>  
>  	match_data = of_device_get_match_data(dev);
>  	if (!match_data)
>  		return -EINVAL;
>  
> +	ret = match_data->pmu_parse_irq(pdev, pmu);
> +	if (ret) {
> +		dev_err(dev, "failed to parse irq\n");
> +		return ret;
> +	}
> +
>  	pmu->genpd = devm_kcalloc(dev, match_data->num_domains,
>  				  sizeof(struct generic_pm_domain *),
>  				  GFP_KERNEL);
> @@ -307,9 +342,6 @@ static int jh71xx_pmu_probe(struct platform_device *pdev)
>  		}
>  	}
>  
> -	spin_lock_init(&pmu->lock);
> -	jh71xx_pmu_int_enable(pmu, JH71XX_PMU_INT_ALL_MASK & ~JH71XX_PMU_INT_PCH_FAIL, true);
> -
>  	ret = of_genpd_add_provider_onecell(np, &pmu->genpd_data);
>  	if (ret) {
>  		dev_err(dev, "failed to register genpd driver: %d\n", ret);
> @@ -357,6 +389,9 @@ static const struct jh71xx_domain_info jh7110_power_domains[] = {
>  static const struct jh71xx_pmu_match_data jh7110_pmu = {
>  	.num_domains = ARRAY_SIZE(jh7110_power_domains),
>  	.domain_info = jh7110_power_domains,
> +	.pmu_status = JH71XX_PMU_CURR_POWER_MODE,
> +	.pmu_parse_irq = jh7110_pmu_parse_irq,
> +	.pmu_set_state = jh7110_pmu_set_state,
>  };
>  
>  static const struct of_device_id jh71xx_pmu_of_match[] = {

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
