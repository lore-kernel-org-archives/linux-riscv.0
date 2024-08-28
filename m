Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2E65C636ED
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Aug 2024 17:56:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SK15yZBhp3gO7EJ/8LlzcYoMzksmN3CXhbxUBV7wt8E=; b=WXpcxVmDiGUFJM
	Az5UE+ACbnCedwFoiLVEAHaLzmPe53LZjsz1tl3JI5LDhje3v9OgZHdQOPanbC8kys9pWcpI0Qh+4
	vozx+AKwDCWuxPFkWq2RgdMCwnOGoQOmmfy4jjAn1B9gq3c6N9rqi5LGe9G7GYEs4aTB+R1y7b0pN
	9RUK1W0k1q84NT4b2Gws0uHHkr1PPy002x9z2zS6MEI2Ebvr7psvcyZtKzsXwPCD6YOfwWVZf6W40
	3MX0hPGeQFTm2QgQir7HXL5In1orWRpkuIDNmJqdVH03+16Z2UbWHtTNPGNncQokJ1rI572+BU4f6
	huEgXuSFiDQ+BWSJkKJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMu1-0000000GS0L-0xEJ;
	Wed, 28 Aug 2024 17:56:17 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sjMtx-0000000GRzi-3V7g
	for linux-riscv@lists.infradead.org;
	Wed, 28 Aug 2024 17:56:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0054CA429C3;
	Wed, 28 Aug 2024 17:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C322C4CEC0;
	Wed, 28 Aug 2024 17:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1724867772;
	bh=2PBr5QWpevcJp1WvmduesQGSU9hgFKf8rgffyoLHc58=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sLIAqa7IYJVdRWlUTOSvnEsPnfEF+xhTICeMK07wPkmBwFopRY1JIkg5U+HcWQlA0
	 fc8AYHKCP7fRumJvkC2iWRByMKVj9kimNGsJLG8HhuD7e9eXUW1OruB/NF6+T9WLAv
	 LOCHPKqUArYIvR8JRd087fJ2Yo6psrSkhSo1cHcax1L34cAnw1VlzPrAaoLLI16AG8
	 HIJfZmMPddg/kd8V7vOpFnvCQyEWKZtepCmeJT7BxQug7nl+qmrgLXNqCctE4EDEjg
	 WQqUEm8/XDnVuABbclzr/ingQqTOItqbWqTCjlPq4Ns6Z5kZtZRoJYBwnbMD0dAsu0
	 wDto0iHEI77Mw==
Date: Wed, 28 Aug 2024 23:26:08 +0530
From: Vinod Koul <vkoul@kernel.org>
To: Inochi Amaoto <inochiama@outlook.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 3/3] dmaengine: add driver for Sophgo CV18XX/SG200X
 dmamux
Message-ID: <Zs9kuJ1+aLdvFHrU@vaman>
References: <IA1PR20MB495396729244074C36E51E11BB942@IA1PR20MB4953.namprd20.prod.outlook.com>
 <IA1PR20MB4953D9A62A26337E7EBC73DCBB942@IA1PR20MB4953.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <IA1PR20MB4953D9A62A26337E7EBC73DCBB942@IA1PR20MB4953.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240828_105614_036868_2FDE90FC 
X-CRM114-Status: GOOD (  30.31  )
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

On 27-08-24, 14:49, Inochi Amaoto wrote:
> Sophgo CV18XX/SG200X use DW AXI CORE with a multiplexer for remapping
> its request lines. The multiplexer supports at most 8 request lines.
> 
> Add driver for Sophgo CV18XX/SG200X DMA multiplexer.
> 
> Signed-off-by: Inochi Amaoto <inochiama@outlook.com>
> ---
>  drivers/dma/Kconfig         |   9 ++
>  drivers/dma/Makefile        |   1 +
>  drivers/dma/cv1800-dmamux.c | 257 ++++++++++++++++++++++++++++++++++++
>  3 files changed, 267 insertions(+)
>  create mode 100644 drivers/dma/cv1800-dmamux.c
> 
> diff --git a/drivers/dma/Kconfig b/drivers/dma/Kconfig
> index cc0a62c34861..df010ee1de46 100644
> --- a/drivers/dma/Kconfig
> +++ b/drivers/dma/Kconfig
> @@ -546,6 +546,15 @@ config PLX_DMA
>  	  These are exposed via extra functions on the switch's
>  	  upstream port. Each function exposes one DMA channel.
>  
> +config SOPHGO_CV1800_DMAMUX
> +	tristate "Sophgo CV1800/SG2000 series SoC DMA multiplexer support"
> +	depends on MFD_SYSCON
> +	depends on ARCH_SOPHGO

this lgtm, maybe add || COMPILE_TEST for wider compile test coverage?

> +	help
> +	  Support for the DMA multiplexer on Sophgo CV1800/SG2000
> +	  series SoCs.
> +	  Say Y here if your board have this soc.
> +
>  config STE_DMA40
>  	bool "ST-Ericsson DMA40 support"
>  	depends on ARCH_U8500
> diff --git a/drivers/dma/Makefile b/drivers/dma/Makefile
> index 374ea98faf43..60d05b305082 100644
> --- a/drivers/dma/Makefile
> +++ b/drivers/dma/Makefile
> @@ -69,6 +69,7 @@ obj-$(CONFIG_PPC_BESTCOMM) += bestcomm/
>  obj-$(CONFIG_PXA_DMA) += pxa_dma.o
>  obj-$(CONFIG_RENESAS_DMA) += sh/
>  obj-$(CONFIG_SF_PDMA) += sf-pdma/
> +obj-$(CONFIG_SOPHGO_CV1800_DMAMUX) += cv1800-dmamux.o
>  obj-$(CONFIG_STE_DMA40) += ste_dma40.o ste_dma40_ll.o
>  obj-$(CONFIG_SPRD_DMA) += sprd-dma.o
>  obj-$(CONFIG_TXX9_DMAC) += txx9dmac.o
> diff --git a/drivers/dma/cv1800-dmamux.c b/drivers/dma/cv1800-dmamux.c
> new file mode 100644
> index 000000000000..a907c72325c7
> --- /dev/null
> +++ b/drivers/dma/cv1800-dmamux.c
> @@ -0,0 +1,257 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2024 Inochi Amaoto <inochiama@outlook.com>
> + */
> +
> +#include <linux/bitops.h>
> +#include <linux/cleanup.h>
> +#include <linux/module.h>
> +#include <linux/of_dma.h>
> +#include <linux/of_address.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/llist.h>
> +#include <linux/regmap.h>
> +#include <linux/spinlock.h>
> +#include <linux/mfd/syscon.h>
> +
> +#include <soc/sophgo/cv1800-sysctl.h>
> +
> +#define DMAMUX_NCELLS			2
> +#define MAX_DMA_MAPPING_ID		42
> +#define MAX_DMA_CPU_ID			2
> +#define MAX_DMA_CH_ID			7
> +
> +#define DMAMUX_INTMUX_REGISTER_LEN	4
> +#define DMAMUX_NR_CH_PER_REGISTER	4
> +#define DMAMUX_BIT_PER_CH		8
> +#define DMAMUX_CH_MASk			GENMASK(5, 0)
> +#define DMAMUX_INT_BIT_PER_CPU		10
> +#define DMAMUX_CH_UPDATE_BIT		BIT(31)
> +
> +#define DMAMUX_CH_REGPOS(chid) \
> +	((chid) / DMAMUX_NR_CH_PER_REGISTER)
> +#define DMAMUX_CH_REGOFF(chid) \
> +	((chid) % DMAMUX_NR_CH_PER_REGISTER)
> +#define DMAMUX_CH_REG(chid) \
> +	((DMAMUX_CH_REGPOS(chid) * sizeof(u32)) + \
> +	 CV1800_SDMA_DMA_CHANNEL_REMAP0)
> +#define DMAMUX_CH_SET(chid, val) \
> +	(((val) << (DMAMUX_CH_REGOFF(chid) * DMAMUX_BIT_PER_CH)) | \
> +	 DMAMUX_CH_UPDATE_BIT)
> +#define DMAMUX_CH_MASK(chid) \
> +	DMAMUX_CH_SET(chid, DMAMUX_CH_MASk)
> +
> +#define DMAMUX_INT_BIT(chid, cpuid) \
> +	BIT((cpuid) * DMAMUX_INT_BIT_PER_CPU + (chid))
> +#define DMAMUX_INTEN_BIT(cpuid) \
> +	DMAMUX_INT_BIT(8, cpuid)
> +#define DMAMUX_INT_CH_BIT(chid, cpuid) \
> +	(DMAMUX_INT_BIT(chid, cpuid) | DMAMUX_INTEN_BIT(cpuid))
> +#define DMAMUX_INT_MASK(chid) \
> +	(DMAMUX_INT_BIT(chid, 0) | \
> +	 DMAMUX_INT_BIT(chid, 1) | \
> +	 DMAMUX_INT_BIT(chid, 2))
> +#define DMAMUX_INT_CH_MASK(chid, cpuid) \
> +	(DMAMUX_INT_MASK(chid) | DMAMUX_INTEN_BIT(cpuid))
> +
> +struct cv1800_dmamux_data {
> +	struct dma_router	dmarouter;
> +	struct regmap		*regmap;
> +	spinlock_t		lock;
> +	struct llist_head	free_maps;
> +	struct llist_head	reserve_maps;
> +	DECLARE_BITMAP(mapped_peripherals, MAX_DMA_MAPPING_ID);
> +};
> +
> +struct cv1800_dmamux_map {
> +	struct llist_node node;
> +	unsigned int channel;
> +	unsigned int peripheral;
> +	unsigned int cpu;
> +};
> +
> +static void cv1800_dmamux_free(struct device *dev, void *route_data)
> +{
> +	struct cv1800_dmamux_data *dmamux = dev_get_drvdata(dev);
> +	struct cv1800_dmamux_map *map = route_data;
> +
> +	guard(spinlock_irqsave)(&dmamux->lock);
> +
> +	regmap_update_bits(dmamux->regmap,
> +			   DMAMUX_CH_REG(map->channel),
> +			   DMAMUX_CH_MASK(map->channel),
> +			   DMAMUX_CH_UPDATE_BIT);
> +
> +	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
> +			   DMAMUX_INT_CH_MASK(map->channel, map->cpu),
> +			   DMAMUX_INTEN_BIT(map->cpu));
> +
> +	dev_dbg(dev, "free channel %u for req %u (cpu %u)\n",
> +		map->channel, map->peripheral, map->cpu);
> +}
> +
> +static void *cv1800_dmamux_route_allocate(struct of_phandle_args *dma_spec,
> +					  struct of_dma *ofdma)
> +{
> +	struct platform_device *pdev = of_find_device_by_node(ofdma->of_node);
> +	struct cv1800_dmamux_data *dmamux = platform_get_drvdata(pdev);
> +	struct cv1800_dmamux_map *map;
> +	struct llist_node *node;
> +	unsigned long flags;
> +	unsigned int chid, devid, cpuid;
> +	int ret;
> +
> +	if (dma_spec->args_count != DMAMUX_NCELLS) {
> +		dev_err(&pdev->dev, "invalid number of dma mux args\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	devid = dma_spec->args[0];
> +	cpuid = dma_spec->args[1];
> +	dma_spec->args_count = 1;
> +
> +	if (devid > MAX_DMA_MAPPING_ID) {
> +		dev_err(&pdev->dev, "invalid device id: %u\n", devid);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (cpuid > MAX_DMA_CPU_ID) {
> +		dev_err(&pdev->dev, "invalid cpu id: %u\n", cpuid);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	dma_spec->np = of_parse_phandle(ofdma->of_node, "dma-masters", 0);
> +	if (!dma_spec->np) {
> +		dev_err(&pdev->dev, "can't get dma master\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	spin_lock_irqsave(&dmamux->lock, flags);
> +
> +	if (test_bit(devid, dmamux->mapped_peripherals)) {
> +		llist_for_each_entry(map, dmamux->reserve_maps.first, node) {
> +			if (map->peripheral == devid && map->cpu == cpuid)
> +				goto found;
> +		}
> +
> +		ret = -EINVAL;
> +		goto failed;
> +	} else {
> +		node = llist_del_first(&dmamux->free_maps);
> +		if (!node) {
> +			ret = -ENODEV;
> +			goto failed;
> +		}
> +
> +		map = llist_entry(node, struct cv1800_dmamux_map, node);
> +		llist_add(&map->node, &dmamux->reserve_maps);
> +		set_bit(devid, dmamux->mapped_peripherals);
> +	}
> +
> +found:
> +	chid = map->channel;
> +	map->peripheral = devid;
> +	map->cpu = cpuid;
> +
> +	regmap_set_bits(dmamux->regmap,
> +			DMAMUX_CH_REG(chid),
> +			DMAMUX_CH_SET(chid, devid));
> +
> +	regmap_update_bits(dmamux->regmap, CV1800_SDMA_DMA_INT_MUX,
> +			   DMAMUX_INT_CH_MASK(chid, cpuid),
> +			   DMAMUX_INT_CH_BIT(chid, cpuid));
> +
> +	spin_unlock_irqrestore(&dmamux->lock, flags);
> +
> +	dma_spec->args[0] = chid;
> +
> +	dev_dbg(&pdev->dev, "register channel %u for req %u (cpu %u)\n",
> +		chid, devid, cpuid);
> +
> +	return map;
> +
> +failed:
> +	spin_unlock_irqrestore(&dmamux->lock, flags);
> +	of_node_put(dma_spec->np);
> +	dev_err(&pdev->dev, "errno %d\n", ret);
> +	return ERR_PTR(ret);
> +}
> +
> +static int cv1800_dmamux_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *mux_node = dev->of_node;
> +	struct cv1800_dmamux_data *data;
> +	struct cv1800_dmamux_map *tmp;
> +	struct device *parent = dev->parent;
> +	struct regmap *regmap = NULL;
> +	unsigned int i;
> +
> +	if (!parent)
> +		return -ENODEV;
> +
> +	regmap = device_node_to_regmap(parent->of_node);
> +	if (IS_ERR(regmap))
> +		return PTR_ERR(regmap);
> +
> +	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
> +	if (!data)
> +		return -ENOMEM;
> +
> +	spin_lock_init(&data->lock);
> +	init_llist_head(&data->free_maps);
> +	init_llist_head(&data->reserve_maps);
> +
> +	for (i = 0; i <= MAX_DMA_CH_ID; i++) {
> +		tmp = devm_kmalloc(dev, sizeof(*tmp), GFP_KERNEL);
> +		if (!tmp) {
> +			/* It is OK for not allocating all channel */
> +			dev_warn(dev, "can not allocate channel %u\n", i);
> +			continue;
> +		}
> +
> +		init_llist_node(&tmp->node);
> +		tmp->channel = i;
> +		llist_add(&tmp->node, &data->free_maps);
> +	}
> +
> +	/* if no channel is allocated, the probe must fail */
> +	if (llist_empty(&data->free_maps))
> +		return -ENOMEM;
> +
> +	data->regmap = regmap;
> +	data->dmarouter.dev = dev;
> +	data->dmarouter.route_free = cv1800_dmamux_free;
> +
> +	platform_set_drvdata(pdev, data);
> +
> +	return of_dma_router_register(mux_node,
> +				      cv1800_dmamux_route_allocate,
> +				      &data->dmarouter);
> +}
> +
> +static void cv1800_dmamux_remove(struct platform_device *pdev)
> +{
> +	of_dma_controller_free(pdev->dev.of_node);
> +}
> +
> +static const struct of_device_id cv1800_dmamux_ids[] = {
> +	{ .compatible = "sophgo,cv1800b-dmamux", },
> +	{ }
> +};
> +MODULE_DEVICE_TABLE(of, cv1800_dmamux_ids);
> +
> +static struct platform_driver cv1800_dmamux_driver = {
> +	.driver = {
> +		.name = "cv1800-dmamux",
> +		.of_match_table = cv1800_dmamux_ids,
> +	},
> +	.probe = cv1800_dmamux_probe,
> +	.remove_new = cv1800_dmamux_remove,
> +};
> +module_platform_driver(cv1800_dmamux_driver);
> +
> +MODULE_AUTHOR("Inochi Amaoto <inochiama@outlook.com>");
> +MODULE_DESCRIPTION("Sophgo CV1800/SG2000 Series SoC DMAMUX driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.46.0

-- 
~Vinod

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
