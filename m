Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4ACDEB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Jun 2023 08:31:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pwAjgZQAXramau76zxL1HBV52puPPJOreSDwCDYK2R8=; b=vNF2ZNOwSO/Xv6
	fotsTxQUrxgKLXE6jde/QK6kK/JH9WMwW2SFlPVuAKS5dY/yniuKNDNjOEaD7IQ1AKyPQqIt29hU6
	pFqFZxgH1G3Cv1CefVsVGn2aC0BgOVVpjWPRGrlRwSv4FJLx4AQ8rjN17fNgxU2qW2M4ubaf39TEK
	0pKnNM7rlG/QUBrnsxdfgasZPgAh3I7L0KCZBqTT/Eoryj1YSjIPcGaTF5TLSOBj3RD5UTRDZmAVY
	/CJj/+yiykJ1JAO+3XIyob8QCI7p4zfB5fiCJnOXMyEZth1MoDt86dtw1kziWMDJXDBpJ9QQ8BKii
	thv1uNQFQQsu23ppCQsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4rs-00HHKf-1P;
	Fri, 16 Jun 2023 08:31:40 +0000
Received: from imap5.colo.codethink.co.uk ([78.40.148.171])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qA4ro-00HHJf-1h
	for linux-riscv@lists.infradead.org;
	Fri, 16 Jun 2023 08:31:38 +0000
Received: from [167.98.27.226] (helo=[10.35.6.111])
	by imap5.colo.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1qA4qw-009I4S-AX; Fri, 16 Jun 2023 09:30:43 +0100
Message-ID: <3f264505-af11-b667-fc82-a5310982ef8b@codethink.co.uk>
Date: Fri, 16 Jun 2023 09:30:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 1/3] soc: sifive: Add SiFive private L2 cache support
Content-Language: en-GB
To: Eric Lin <eric.lin@sifive.com>, conor@kernel.org, robh+dt@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, palmer@dabbelt.com,
 paul.walmsley@sifive.com, aou@eecs.berkeley.edu, maz@kernel.org,
 chenhuacai@kernel.org, baolu.lu@linux.intel.com, will@kernel.org,
 kan.liang@linux.intel.com, nnac123@linux.ibm.com, pierre.gondois@arm.com,
 huangguangbin2@huawei.com, jgross@suse.com, chao.gao@intel.com,
 maobibo@loongson.cn, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, dslin1010@gmail.com
Cc: Nick Hu <nick.hu@sifive.com>, Zong Li <zong.li@sifive.com>
References: <20230616063210.19063-1-eric.lin@sifive.com>
 <20230616063210.19063-2-eric.lin@sifive.com>
From: Ben Dooks <ben.dooks@codethink.co.uk>
Organization: Codethink Limited.
In-Reply-To: <20230616063210.19063-2-eric.lin@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230616_013136_724812_DE688BF1 
X-CRM114-Status: GOOD (  35.13  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 16/06/2023 07:32, Eric Lin wrote:
> This adds SiFive private L2 cache driver which will show
> cache config information when booting and add cpu hotplug
> callback functions.
> 
> Signed-off-by: Eric Lin <eric.lin@sifive.com>
> Signed-off-by: Nick Hu <nick.hu@sifive.com>
> Reviewed-by: Zong Li <zong.li@sifive.com>
> ---
>   drivers/soc/sifive/Kconfig            |   8 +
>   drivers/soc/sifive/Makefile           |   1 +
>   drivers/soc/sifive/sifive_pl2.h       |  25 ++++
>   drivers/soc/sifive/sifive_pl2_cache.c | 202 ++++++++++++++++++++++++++
>   include/linux/cpuhotplug.h            |   1 +
>   5 files changed, 237 insertions(+)
>   create mode 100644 drivers/soc/sifive/sifive_pl2.h
>   create mode 100644 drivers/soc/sifive/sifive_pl2_cache.c
> 
> diff --git a/drivers/soc/sifive/Kconfig b/drivers/soc/sifive/Kconfig
> index e86870be34c9..573564295058 100644
> --- a/drivers/soc/sifive/Kconfig
> +++ b/drivers/soc/sifive/Kconfig
> @@ -7,4 +7,12 @@ config SIFIVE_CCACHE
>   	help
>   	  Support for the composable cache controller on SiFive platforms.
>   
> +config SIFIVE_PL2
> +	bool "Sifive private L2 Cache controller"
> +	help
> +	  Support for the private L2 cache controller on SiFive platforms.
> +	  The SiFive Private L2 Cache Controller is per hart and communicates
> +	  with both the upstream L1 caches and downstream L3 cache or memory,
> +	  enabling a high-performance cache subsystem.
> +
>   endif
> diff --git a/drivers/soc/sifive/Makefile b/drivers/soc/sifive/Makefile
> index 1f5dc339bf82..707493e1c691 100644
> --- a/drivers/soc/sifive/Makefile
> +++ b/drivers/soc/sifive/Makefile
> @@ -1,3 +1,4 @@
>   # SPDX-License-Identifier: GPL-2.0
>   
>   obj-$(CONFIG_SIFIVE_CCACHE)	+= sifive_ccache.o
> +obj-$(CONFIG_SIFIVE_PL2)	+= sifive_pl2_cache.o
> diff --git a/drivers/soc/sifive/sifive_pl2.h b/drivers/soc/sifive/sifive_pl2.h
> new file mode 100644
> index 000000000000..57aa1019d5ed
> --- /dev/null
> +++ b/drivers/soc/sifive/sifive_pl2.h
> @@ -0,0 +1,25 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2023 SiFive, Inc.
> + *
> + */
> +
> +#ifndef _SIFIVE_PL2_H
> +#define _SIFIVE_PL2_H
> +
> +#define SIFIVE_PL2_CONFIG1_OFFSET	0x1000
> +#define SIFIVE_PL2_CONFIG0_OFFSET	0x1008
> +#define SIFIVE_PL2_PMCLIENT_OFFSET	0x2800
> +
> +struct sifive_pl2_state {
> +	void __iomem *pl2_base;
> +	u32 config1;
> +	u32 config0;
> +	u64 pmclientfilter;
> +};
> +
> +int sifive_pl2_pmu_init(void);
> +int sifive_pl2_pmu_probe(struct device_node *pl2_node,
> +			 void __iomem *pl2_base, int cpu);
> +
> +#endif /*_SIFIVE_PL2_H */
> diff --git a/drivers/soc/sifive/sifive_pl2_cache.c b/drivers/soc/sifive/sifive_pl2_cache.c
> new file mode 100644
> index 000000000000..aeb51d576af9
> --- /dev/null
> +++ b/drivers/soc/sifive/sifive_pl2_cache.c
> @@ -0,0 +1,202 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * SiFive private L2 cache controller Driver
> + *
> + * Copyright (C) 2018-2023 SiFive, Inc.
> + */
> +
> +#define pr_fmt(fmt) "pL2CACHE: " fmt
> +
> +#include <linux/of.h>
> +#include <linux/of_device.h>
> +#include <linux/platform_device.h>
> +#include <linux/io.h>
> +#include <linux/cpu_pm.h>
> +#include <linux/cpuhotplug.h>
> +#include "sifive_pl2.h"
> +
> +static DEFINE_PER_CPU(struct sifive_pl2_state, sifive_pl2_state);
> +
> +static void sifive_pl2_state_save(struct sifive_pl2_state *pl2_state)
> +{
> +	void __iomem *pl2_base = pl2_state->pl2_base;
> +
> +	if (!pl2_base)
> +		return;

is this test realy needed?

> +
> +	pl2_state->config1 = readl(pl2_base + SIFIVE_PL2_CONFIG1_OFFSET);
> +	pl2_state->config0 = readl(pl2_base + SIFIVE_PL2_CONFIG0_OFFSET);
> +	pl2_state->pmclientfilter = readq(pl2_base + SIFIVE_PL2_PMCLIENT_OFFSET);
> +}
> +
> +static void sifive_pl2_state_restore(struct sifive_pl2_state *pl2_state)
> +{
> +	void __iomem *pl2_base = pl2_state->pl2_base;
> +
> +	if (!pl2_base)
> +		return;
> +
> +	writel(pl2_state->config1, pl2_base + SIFIVE_PL2_CONFIG1_OFFSET);
> +	writel(pl2_state->config0, pl2_base + SIFIVE_PL2_CONFIG0_OFFSET);
> +	writeq(pl2_state->pmclientfilter, pl2_base + SIFIVE_PL2_PMCLIENT_OFFSET);
> +}
> +
> +/*
> + * CPU Hotplug call back function
> + */
> +static int sifive_pl2_online_cpu(unsigned int cpu)
> +{
> +	struct sifive_pl2_state *pl2_state = this_cpu_ptr(&sifive_pl2_state);
> +
> +	sifive_pl2_state_restore(pl2_state);
> +
> +	return 0;
> +}
> +
> +static int sifive_pl2_offline_cpu(unsigned int cpu)
> +{
> +	struct sifive_pl2_state *pl2_state = this_cpu_ptr(&sifive_pl2_state);
> +
> +	/* Save the pl2 state */
> +	sifive_pl2_state_save(pl2_state);
> +
> +	return 0;
> +}
> +
> +/*
> + *  PM notifer for suspend to ram
> + */
> +#ifdef CONFIG_CPU_PM
> +static int sifive_pl2_pm_notify(struct notifier_block *b, unsigned long cmd,
> +				void *v)
> +{
> +	struct sifive_pl2_state *pl2_state = this_cpu_ptr(&sifive_pl2_state);
> +
> +	switch (cmd) {
> +	case CPU_PM_ENTER:
> +		/* Save the pl2 state */
> +		sifive_pl2_state_save(pl2_state);
> +		break;
> +	case CPU_PM_ENTER_FAILED:
> +	case CPU_PM_EXIT:
> +		sifive_pl2_state_restore(pl2_state);
> +		break;
> +	default:
> +		break;
> +	}
> +
> +	return NOTIFY_OK;
> +}
> +
> +static struct notifier_block sifive_pl2_pm_notifier_block = {
> +	.notifier_call = sifive_pl2_pm_notify,
> +};
> +
> +static inline void sifive_pl2_pm_init(void)
> +{
> +	cpu_pm_register_notifier(&sifive_pl2_pm_notifier_block);
> +}
> +
> +#else
> +static inline void sifive_pl2_pm_init(void) { }
> +#endif /* CONFIG_CPU_PM */
> +
> +static const struct of_device_id sifive_pl2_cache_of_ids[] = {
> +	{ .compatible = "sifive,pL2Cache0" },
> +	{ .compatible = "sifive,pL2Cache1" },

why the single cap here? I think that looks ugly.

> +	{ /* sentinel value */ }
> +};
> +
> +static void pl2_config_read(void __iomem *pl2_base, int cpu)
> +{
> +	u32 regval, bank, way, set, cacheline;
> +
> +	regval = readl(pl2_base);
> +	bank = regval & 0xff;
> +	pr_info("in the CPU: %d\n", cpu);
> +	pr_info("No. of Banks in the cache: %d\n", bank);
> +	way = (regval & 0xff00) >> 8;
> +	pr_info("No. of ways per bank: %d\n", way);
> +	set = (regval & 0xff0000) >> 16;
> +	pr_info("Total sets: %llu\n", (uint64_t)1 << set);
> +	cacheline = (regval & 0xff000000) >> 24;
> +	pr_info("Bytes per cache block: %llu\n", (uint64_t)1 << cacheline);
> +	pr_info("Size: %d\n", way << (set + cacheline));


please either remove this or make it a single line, this is just going 
to spam the log with any system with more than one cpu core.

> +}
> +
> +static int sifive_pl2_cache_dev_probe(struct platform_device *pdev)
> +{
> +	struct resource *res;
> +	int cpu, ret = -EINVAL;
> +	struct device_node *cpu_node, *pl2_node;
> +	struct sifive_pl2_state *pl2_state = NULL;
> +	void __iomem *pl2_base;
> +
> +	/* Traverse all cpu nodes to find the one mapping to its pl2 node. */
> +	for_each_cpu(cpu, cpu_possible_mask) {
> +		cpu_node = of_cpu_device_node_get(cpu);
> +		pl2_node = of_parse_phandle(cpu_node, "next-level-cache", 0);
> +
> +		/* Found it! */
> +		if (dev_of_node(&pdev->dev) == pl2_node) {
> +			/* Use cpu to get its percpu data sifive_pl2_state. */
> +			pl2_state = per_cpu_ptr(&sifive_pl2_state, cpu);
> +			break;
> +		}
> +	}
> +
> +	if (!pl2_state) {
> +		pr_err("Not found the corresponding cpu_node in dts.\n");
> +		goto early_err;
> +	}
> +
> +	/* Set base address of select and counter registers. */
> +	pl2_base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
> +	if (IS_ERR(pl2_base)) {
> +		ret = PTR_ERR(pl2_base);
> +		goto early_err;
> +	}
> +
> +	/* Print pL2 configs. */
> +	pl2_config_read(pl2_base, cpu);
> +	pl2_state->pl2_base = pl2_base;
> +
> +	return 0;
> +
> +early_err:
> +	return ret;
> +}
> +
> +static struct platform_driver sifive_pl2_cache_driver = {
> +	.driver = {
> +		   .name = "SiFive-pL2-cache",
> +		   .of_match_table = sifive_pl2_cache_of_ids,
> +		   },
> +	.probe = sifive_pl2_cache_dev_probe,
> +};
> +
> +static int __init sifive_pl2_cache_init(void)
> +{
> +	int ret;
> +
> +	ret = cpuhp_setup_state(CPUHP_AP_RISCV_SIFIVE_PL2_ONLINE,
> +				"soc/sifive/pl2:online",
> +				      sifive_pl2_online_cpu,
> +				      sifive_pl2_offline_cpu);
> +	if (ret < 0) {
> +		pr_err("Failed to register CPU hotplug notifier %d\n", ret);
> +		return ret;
> +	}
> +
> +	ret = platform_driver_register(&sifive_pl2_cache_driver);
> +	if (ret) {
> +		pr_err("Failed to register sifive_pl2_cache_driver: %d\n", ret);
> +		return ret;
> +	}
> +
> +	sifive_pl2_pm_init();
> +
> +	return ret;
> +}
> +
> +device_initcall(sifive_pl2_cache_init);
> diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
> index 0f1001dca0e0..35cd5ba0030b 100644
> --- a/include/linux/cpuhotplug.h
> +++ b/include/linux/cpuhotplug.h
> @@ -207,6 +207,7 @@ enum cpuhp_state {
>   	CPUHP_AP_IRQ_AFFINITY_ONLINE,
>   	CPUHP_AP_BLK_MQ_ONLINE,
>   	CPUHP_AP_ARM_MVEBU_SYNC_CLOCKS,
> +	CPUHP_AP_RISCV_SIFIVE_PL2_ONLINE,
>   	CPUHP_AP_X86_INTEL_EPB_ONLINE,
>   	CPUHP_AP_PERF_ONLINE,
>   	CPUHP_AP_PERF_X86_ONLINE,

-- 
Ben Dooks				http://www.codethink.co.uk/
Senior Engineer				Codethink - Providing Genius

https://www.codethink.co.uk/privacy.html


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
