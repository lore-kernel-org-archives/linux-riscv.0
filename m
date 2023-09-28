Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3ACFCE7AF8
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Sep 2023 05:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Jsfjk5GLV9M89xZdFgZY8lcNlXSx9ARnfdPHicmkA4I=; b=W8Ntd1GQTRy0RZ
	DkiZO+HgAlC/B5BE0inhcIqnFJn9WFERs6ZBJnfmKVCYeR8+4xnlrFiR/Pyla5xz9ic9nq/EwF94U
	lpUA61YpNORlj4YhBWASkm6eRsLtd2wyDWDEYdesf18Z9GxLS02v3+ozxCwmjOB8Kl6XLfxVummfj
	OZ00Ml24OVTeEjgOG/rpqb2DEcy1v3y1W7g29ZEZ0nsKaAb+KYf173vsXJ+TxlBTe4jf7x3YJCGdW
	iD+Kvls1RkaPGhjRnrODsaOenNzi+XQCEjSiHvj8f8/NZ4dB/T0RKGreiwHGLipJGO2AS1GgXA+lc
	+tmhZcaZu6bZWr58rHHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qljSw-002Ib8-20;
	Thu, 28 Sep 2023 05:21:34 +0000
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qljSt-002Iae-0g
	for linux-riscv@lists.infradead.org;
	Thu, 28 Sep 2023 05:21:32 +0000
Received: by mail-ed1-x531.google.com with SMTP id 4fb4d7f45d1cf-533c5d10dc7so11673422a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 27 Sep 2023 22:21:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1695878488; x=1696483288; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IctSNdmwP27jdIkRDHGtBl56HPuutEqsWQ3K1xwqCM0=;
        b=uzi3cp3c9oqbB9pIOgAMZU5MmXOpjfO00+Rj4hykLdAFzY0gBDtOcv5Hz8vmluw1Zd
         kafV/vsJwgBYGinP5gsRgARoHApBaEo2fAKQemPHOCZheUToxXrKg1WVSbUjlS4bRi31
         hV4fPt1s4CulBdlu77NgZPMbzrZCvESj68Li3OfhjGJXyuKiW0VcfI2gjvH5UsWC90xR
         HEC+8VTA/hCVNhmkHcyazKiH9RvBczUzWpe/cKqyV8u6K3lh5xILITm6LqdT50kT2fVt
         4ZO7TgQQ+SpkqYn1k1uYZt1nO3iUnefYTzaBq7EmPy/h0C/vvJg7SidhE1mofcfGp90n
         Yxjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695878488; x=1696483288;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IctSNdmwP27jdIkRDHGtBl56HPuutEqsWQ3K1xwqCM0=;
        b=SMjUJ6UVcJ3hMGNuwSwltS1+grvTFId1wErfqEXmI6nndSfpDhwUNDWVrNld8Yd03/
         ZpsQYzeglFuztGCO/oGnXL4lUSBxxIfi9K8dKiaPu55arIVDq2PBSZn7cihobMJ/1eq4
         K4THHFvBdQUYXpu1BjhBc5ra2EVz1N5DEzmEWsawBQK5wNC4gdZPP1WTXwWYr/ZsDQts
         sAp/M8gIZ+UI5GsLHXcN5KuXRaoCW5lcHvS3hCYr8xuKJnXb8RfcUNFH7ncUGf9U/D54
         sm5sQzuqpoW2HMaJ7bgQP46P44N1J4oa/BGCS2ehK6bfa+eN4r3wukWnIpJB/rB8tr+B
         U5JQ==
X-Gm-Message-State: AOJu0YwDg8T40g5U5LrvdjanAaAT7PaC4BHLzyE5a/mbZ7UJU9rD0TJx
	iFnMnKlRmBx1jYlURSIb2cfYgQ==
X-Google-Smtp-Source: AGHT+IHCI6nP8GJrizsiycPqb9sumMYLwbNfauPQm9m/YdWVDylObm9wgRL27P0XVvBUJvRPacOxyA==
X-Received: by 2002:a17:906:1dd:b0:9ae:6355:64bb with SMTP id 29-20020a17090601dd00b009ae635564bbmr200009ejj.73.1695878488360;
        Wed, 27 Sep 2023 22:21:28 -0700 (PDT)
Received: from [192.168.1.235] (host-87-4-82-94.retail.telecomitalia.it. [87.4.82.94])
        by smtp.gmail.com with ESMTPSA id v5-20020a1709064e8500b00993470682e5sm10174443eju.32.2023.09.27.22.21.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Sep 2023 22:21:27 -0700 (PDT)
Message-ID: <5e453da1-91b6-4f55-8af7-c25e9d28be7a@linaro.org>
Date: Thu, 28 Sep 2023 07:21:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] usb: dwc3: add T-HEAD TH1520 usb driver
Content-Language: en-US
To: Jisheng Zhang <jszhang@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>, Thinh Nguyen <Thinh.Nguyen@synopsys.com>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Guo Ren <guoren@kernel.org>,
 Fu Wei <wefu@redhat.com>, linux-riscv@lists.infradead.org
References: <20230927164222.3505-1-jszhang@kernel.org>
 <20230927164222.3505-3-jszhang@kernel.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20230927164222.3505-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230927_222131_262310_22B05C06 
X-CRM114-Status: GOOD (  26.40  )
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

On 27/09/2023 18:42, Jisheng Zhang wrote:
> Adds TH1520 Glue layer to support USB controller on T-HEAD TH1520 SoC.
> There is a DesignWare USB3 DRD core in TH1520 SoCs, the dwc3 core is
> the child of this USB wrapper module device.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  MAINTAINERS                   |   1 +
>  drivers/usb/dwc3/Kconfig      |   9 +++
>  drivers/usb/dwc3/Makefile     |   1 +
>  drivers/usb/dwc3/dwc3-thead.c | 119 ++++++++++++++++++++++++++++++++++
>  4 files changed, 130 insertions(+)
>  create mode 100644 drivers/usb/dwc3/dwc3-thead.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90f13281d297..d55e40060c46 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -18481,6 +18481,7 @@ M:	Fu Wei <wefu@redhat.com>
>  L:	linux-riscv@lists.infradead.org
>  S:	Maintained
>  F:	arch/riscv/boot/dts/thead/
> +F:	drivers/usb/dwc3/dwc3-thead.c
>  
>  RNBD BLOCK DRIVERS
>  M:	Md. Haris Iqbal <haris.iqbal@ionos.com>
> diff --git a/drivers/usb/dwc3/Kconfig b/drivers/usb/dwc3/Kconfig
> index 98efcbb76c88..1b02f4f55b47 100644
> --- a/drivers/usb/dwc3/Kconfig
> +++ b/drivers/usb/dwc3/Kconfig
> @@ -178,4 +178,13 @@ config USB_DWC3_OCTEON
>  	  Only the host mode is currently supported.
>  	  Say 'Y' or 'M' here if you have one such device.
>  
> +config USB_DWC3_THEAD
> +	tristate "T-HEAD Platform"
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	default USB_DWC3
> +	help
> +	  Support T-HEAD platform with DesignWare Core USB3 IP.
> +	  Only the host mode is currently supported.
> +	  Say 'Y' or 'M' here if you have one such device.
> +
>  endif
> diff --git a/drivers/usb/dwc3/Makefile b/drivers/usb/dwc3/Makefile
> index fe1493d4bbe5..9523a51dd279 100644
> --- a/drivers/usb/dwc3/Makefile
> +++ b/drivers/usb/dwc3/Makefile
> @@ -55,3 +55,4 @@ obj-$(CONFIG_USB_DWC3_QCOM)		+= dwc3-qcom.o
>  obj-$(CONFIG_USB_DWC3_IMX8MP)		+= dwc3-imx8mp.o
>  obj-$(CONFIG_USB_DWC3_XILINX)		+= dwc3-xilinx.o
>  obj-$(CONFIG_USB_DWC3_OCTEON)		+= dwc3-octeon.o
> +obj-$(CONFIG_USB_DWC3_THEAD)		+= dwc3-thead.o
> diff --git a/drivers/usb/dwc3/dwc3-thead.c b/drivers/usb/dwc3/dwc3-thead.c
> new file mode 100644
> index 000000000000..999b1e319c72
> --- /dev/null
> +++ b/drivers/usb/dwc3/dwc3-thead.c
> @@ -0,0 +1,119 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dwc3-thead.c - T-HEAD platform specific glue layer
> + *
> + * Inspired by dwc3-of-simple.c
> + *
> + * Copyright (C) 2021 Alibaba Group Holding Limited.
> + * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (c) 2018, The Linux Foundation. All rights reserved.
> + */
> +
> +#include <linux/io.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/of.h>
> +#include <linux/of_platform.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +
> +#include "core.h"
> +
> +#define USB_SSP_EN		0x34
> +#define  REF_SSP_EN		BIT(0)
> +#define USB_SYS			0x3c
> +#define  COMMONONN		BIT(0)
> +
> +#define USB3_DRD_SWRST		0x14
> +#define  USB3_DRD_PRST		BIT(0)
> +#define  USB3_DRD_PHYRST	BIT(1)
> +#define  USB3_DRD_VCCRST	BIT(2)
> +#define  USB3_DRD_RSTMASK	(USB3_DRD_PRST | USB3_DRD_PHYRST | USB3_DRD_VCCRST)
> +
> +struct dwc3_thead {
> +	void __iomem		*base;
> +	struct regmap		*misc_sysreg;
> +	struct regulator	*vbus;
> +};
> +
> +static void dwc3_thead_optimize_power(struct dwc3_thead *thead)
> +{
> +	u32 val;
> +
> +	/* config usb top within USB ctrl & PHY reset */
> +	regmap_update_bits(thead->misc_sysreg, USB3_DRD_SWRST,
> +			   USB3_DRD_RSTMASK, USB3_DRD_PRST);
> +
> +	/*
> +	 * dwc reg also need to be configed to save power
> +	 * 1. set USB_SYS[COMMONONN]
> +	 * 2. set DWC3_GCTL[SOFITPSYNC](done by core.c)
> +	 * 3. set GUSB3PIPECTL[SUSPENDEN] (done by core.c)
> +	 */
> +	val = readl(thead->base + USB_SYS);
> +	val |= COMMONONN;
> +	writel(val, thead->base + USB_SYS);
> +	val = readl(thead->base + USB_SSP_EN);
> +	val |= REF_SSP_EN;
> +	writel(val, thead->base + USB_SSP_EN);
> +
> +	regmap_update_bits(thead->misc_sysreg, USB3_DRD_SWRST,
> +			   USB3_DRD_RSTMASK, USB3_DRD_RSTMASK);
> +}
> +
> +static int dwc3_thead_probe(struct platform_device *pdev)
> +{
> +	struct device *dev = &pdev->dev;
> +	struct device_node *np = dev->of_node;
> +	struct dwc3_thead *thead;
> +	int ret;
> +
> +	thead = devm_kzalloc(&pdev->dev, sizeof(*thead), GFP_KERNEL);
> +	if (!thead)
> +		return -ENOMEM;
> +
> +	platform_set_drvdata(pdev, thead);
> +
> +	ret = devm_regulator_get_enable_optional(dev, "vbus");
> +	if (ret < 0 && ret != -ENODEV)
> +		return ret;
> +
> +	thead->misc_sysreg = syscon_regmap_lookup_by_phandle(np, "thead,misc-sysreg");

NAK. Test your DTS first. You do not have such property.

> +	if (IS_ERR(thead->misc_sysreg))
> +		return PTR_ERR(thead->misc_sysreg);
> +
> +	thead->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(thead->base))
> +		return PTR_ERR(thead->base);
> +
> +	dwc3_thead_optimize_power(thead);
> +
> +	return of_platform_populate(np, NULL, NULL, dev);
> +}
> +
> +static void dwc3_thead_remove(struct platform_device *pdev)
> +{
> +	of_platform_depopulate(&pdev->dev);
> +}
> +
> +static const struct of_device_id dwc3_thead_of_match[] = {
> +	{ .compatible = "thead,th1520-usb" },
> +	{ },
> +};
> +MODULE_DEVICE_TABLE(of, dwc3_thead_of_match);
> +
> +static struct platform_driver dwc3_thead_driver = {
> +	.probe		= dwc3_thead_probe,
> +	.remove_new	= dwc3_thead_remove,
> +	.driver		= {
> +		.name	= "dwc3-thead",
> +		.of_match_table	= dwc3_thead_of_match,
> +	},
> +};
> +module_platform_driver(dwc3_thead_driver);
> +
> +MODULE_ALIAS("platform:dwc3-thead");

No, you do not need this. If you need, your device ID table is wrong.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
