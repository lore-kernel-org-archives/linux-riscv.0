Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AF0BC77B6E
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Apr 2023 06:08:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:CC:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=d5QXg8biANB670qbp4aBS3SjbSmubzu55FVzA9TZh/M=; b=4erScKd1Ut9FWu
	qVvAuM+vCL5Zb8PxaLJqgF3cIZsF+AMAVkqbYdJhg17AmRvdu+nUv5sFW5cdtc86WLuk3QfcP7u/v
	pYdz6KP6dX0RiSWceqKbb93wzXSNyBmwxOCqdkaQDSSn9Q3Ab4sNzufT8AhDw4LQQhfUDfYO7j6Qk
	Gn/YfjsKXth3IxbTZ92GYhklTcjbV+7YGU7j5jr07bjzDYJLtiYC6tVTovEpOWg2bpWZUFozHV77G
	Uw5kaJupOAYos53vyQY+GwTNQ2yBZZ8Udel/4RjoH8W1+ryeDR8IpWoIAj9yNep/V2f/RynTU8Oyp
	e2YtrumzIcEbBPE3gK+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTep-001uCS-1U;
	Wed, 12 Apr 2023 06:08:39 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pmTel-001uB5-0m
	for linux-riscv@lists.infradead.org;
	Wed, 12 Apr 2023 06:08:38 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 703CC24E196;
	Wed, 12 Apr 2023 14:07:54 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 14:07:54 +0800
Received: from [192.168.125.109] (113.72.145.176) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 12 Apr
 2023 14:07:53 +0800
Message-ID: <eeb7dadb-1cfd-d270-158b-5dd2e5f2bd1a@starfivetech.com>
Date: Wed, 12 Apr 2023 14:07:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.1
Subject: Re: [PATCH v1 5/7] soc: starfive: Use call back to parse device tree
 resources
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Rob Herring
	<robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
CC: <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
References: <20230411064743.273388-1-changhuang.liang@starfivetech.com>
 <20230411064743.273388-6-changhuang.liang@starfivetech.com>
From: Walker Chen <walker.chen@starfivetech.com>
In-Reply-To: <20230411064743.273388-6-changhuang.liang@starfivetech.com>
X-Originating-IP: [113.72.145.176]
X-ClientProxiedBy: EXCAS063.cuchost.com (172.16.6.23) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_230835_599022_E7747634 
X-CRM114-Status: GOOD (  13.16  )
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



On 2023/4/11 14:47, Changhuang Liang wrote:
> Different compatible parse device tree resources work in different ways.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>

I don't think it's necessary to submit multiple patches separately for the same .c file
unless it is very necessary. Because the disadvantage of separating multiple patches 
is that some information lacks completeness and coherence.

> ---
>  drivers/soc/starfive/jh71xx_pmu.c | 54 ++++++++++++++++++++++---------
>  1 file changed, 39 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/soc/starfive/jh71xx_pmu.c b/drivers/soc/starfive/jh71xx_pmu.c
> index 98f6849d61de..990db6735c48 100644
> --- a/drivers/soc/starfive/jh71xx_pmu.c
> +++ b/drivers/soc/starfive/jh71xx_pmu.c
> @@ -57,10 +57,14 @@ struct jh71xx_domain_info {
>  	u8 bit;
>  };
>  
> +struct jh71xx_pmu;
> +
>  struct jh71xx_pmu_match_data {
>  	const struct jh71xx_domain_info *domain_info;
>  	int num_domains;
>  	u8 pmu_type;
> +	int (*pmu_parse_dt)(struct platform_device *pdev,
> +			    struct jh71xx_pmu *pmu);
>  };
>  
>  struct jh71xx_pmu {
> @@ -251,6 +255,31 @@ static irqreturn_t jh71xx_pmu_interrupt(int irq, void *data)
>  	return IRQ_HANDLED;
>  }
>  
> +static int jh7110_pmu_general_parse_dt(struct platform_device *pdev,
> +				       struct jh71xx_pmu *pmu)
> +{



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
