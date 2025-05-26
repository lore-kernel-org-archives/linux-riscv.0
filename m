Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258F5C54FB3
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 15:45:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pA8TjLJeV5/iM4PbgFQSLgVYm08YdYxJOwlZJ35yjHk=; b=ob2U4RL9move8a1Iu7YqmPtd/L
	PBdjg1xzf/rJwY8fZXbgBFwjqREegJyVEgi+PvmGlPNfINUq35jCriyst0FO9s7qYDGkzlnIxOQMb
	dhJ8BrLnDPTHDCW7WyNVTgOYxXD0GxpBuE9EooQ6tB4iUzm82BWoATQEkirnar9TleCR3qqZysSCO
	ct/5a8KticIcSB7HXOwcGORGhRftgug1jfRo6AyXN2/6quI60oe48xuXQ1OOTIEluLMPJy+w8pUfQ
	5KraO3WYSStZ1tqTHhHO6B5ci2Oh+1wqCdMRMSuSP6mfwdPRsil1EqDylDI7gZfDWZ0SjbzBfBw3X
	m+EtFhPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJa0y-00000009ADl-1FCV;
	Mon, 26 May 2025 15:45:24 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJa0v-00000009ACq-2HQB
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 15:45:22 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a36efcadb8so2319268f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 08:45:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748274320; x=1748879120; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HFl8LQPP9raTyVXFbX2CX+NqGviWoNgmnKIkDgu9FgE=;
        b=N/d7WvOa463Rv1el1v1sNSQzrXCYqJLnDleOYR9VM2iMD7XuG2xex010M1YcY0hHYW
         Nkv3jJIftNZwrCiS30Dc8nhq2hynaseXOQJTKbIueWe7SoT+NNjbu1HOfvKhZc2YuV1p
         iNX9ENqsiX2WEeEpevsXtorZrAVR+dRlna0WFyCIZvs+1l8LUseG3Nc5l8xzjrwLckpj
         2lD7zqw6GfsV0CQxjw2z3dfzacxqkYwzhQkILu3I2+uOFL1I8tW+pQaRCfQOlJl6n0nz
         NgRrIZdWrqyCGFP/N2UoV0n23K6AfUWrlUs56Xpb1ionKxXJaaNOlG3reOAKYvY/ay5G
         EwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274320; x=1748879120;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=HFl8LQPP9raTyVXFbX2CX+NqGviWoNgmnKIkDgu9FgE=;
        b=DIfWyby3pFoExuzNaOpniOugI3ymOoKaxRGjyBsAAhTtT0ioUUVEEQjovmT5oh5pns
         md5nNy7zKgvK0qeEGU8/a2/sxD09MonhLyOZVkoNd0bBYY72GUO/qgfYY11lhGg4Aw9O
         mPDqf1xevTNeY2JEoY5AjGcCBbNuvhvsKD1LwXWjPfeHj+bRSEbY1eA4+hViewUK2fi4
         uCfjUz53vqHZRIjt/lrfQAbsO8vNHR4nP2hRQoiR1YNSAW2kgDo+1vWl4vutTbuD57BL
         C3F6m6jCIJOhEleyr5zDzxz/r6/1VEqiSZ2CBgZDxoIrcqnM//fGNs466rQIwZExT4tP
         wVyQ==
X-Forwarded-Encrypted: i=1; AJvYcCV3+Mt/tjU5L6xPsEjHw2/vF/F5iSiy20m0/y3Y0XckBOpiLB74JJya1/WVb94nUYnWX188cOr2QQkuEw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzC+sE3mVLH2yuBKG9cqBpKvPmyNxrUJFt0KhVYg0vSgd8RFNEp
	WwuTDlnJsACKn94FcbzdxUU3+o1d9MvyTPAiozTRM8agOdDLINA6yVtRLDG2f/n1JPk=
X-Gm-Gg: ASbGnctuWAbRfvHIfb6PO9lx1E0Cm70sGfyDoKR2POkd0kaTMvjlJLRhF3HZUFKA/GG
	ElNSf/bZ5f3YinzJaju52Lgedp7KNZp4zzHGyDjKDLTLV0ZNUA6UYzt0cIEiz8MoL0yWsbVK5Y8
	wiCxiktw7ZGWIOk7Lb2gxCWZIPKO7TcfMKChxDiLb/gn175eowUlbaS6v9adhvklLI0bi5ZmzJW
	BikGWrJxqaTV7lOn3QPsKSLDlyS9Y2pxqsxyunsROOIhh7CEIts1RkcKJvVGv/Fdwcxmy2mjcRA
	5C1mstURQPGaFkyFfof0hd+qohlO0uL+25hWU3t7Wc1GDF+igPaiPvaz72917oItr5pNiMQNZF2
	x7AKfwIGb4eUxNvNCwWaf33v3PY1M
X-Google-Smtp-Source: AGHT+IFSTQVnwVX+3jfYQ26Uy7TnQL56FNeWCswfMjziUepzIMDH82s2FL1P/GELn1jnsZ6bldt9Xw==
X-Received: by 2002:a05:6000:2512:b0:3a3:6a2b:ab25 with SMTP id ffacd0b85a97d-3a4cb4834c2mr7896662f8f.45.1748274319727;
        Mon, 26 May 2025 08:45:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4db7e2e87sm2472008f8f.22.2025.05.26.08.45.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:45:19 -0700 (PDT)
Message-ID: <90976e7f-dad5-4b6d-b202-bdc3d7fc93e5@linaro.org>
Date: Mon, 26 May 2025 17:45:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 4/4] phy: spacemit: add USB3 support for K1 PCIe/USB3
 combo PHY
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-4-eca668fc16a2@whut.edu.cn>
Content-Language: en-US, fr
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-4-eca668fc16a2@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_084521_579717_96D3555A 
X-CRM114-Status: GOOD (  31.46  )
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
Reply-To: Neil Armstrong <neil.armstrong@linaro.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 26/05/2025 16:31, Ze Huang wrote:
> Add support for USB 3.0 mode on the K1 PCIe/USB3 combo PHY which
> implements PIPE3(125MHz) interface for USB3.0. Currently, only USB mode
> is supported; PCIe support is not included in this change.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>   drivers/phy/spacemit/Kconfig          |   8 +
>   drivers/phy/spacemit/Makefile         |   1 +
>   drivers/phy/spacemit/phy-k1-combphy.c | 266 ++++++++++++++++++++++++++++++++++
>   3 files changed, 275 insertions(+)
> 
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> index 0136aee2e8a2f5f484da136b26f80130794b992c..ccc6bf9ea49f4988a27f79a4dcd024b18cbd78b0 100644
> --- a/drivers/phy/spacemit/Kconfig
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -11,3 +11,11 @@ config PHY_SPACEMIT_K1_USB2
>   	help
>   	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
>   	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> +
> +config PHY_SPACEMIT_K1_COMBPHY
> +	tristate "SpacemiT K1 PCIe/USB3 combo PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	select GENERIC_PHY
> +	help
> +	  USB3/PCIe Combo PHY Support for SpacemiT K1 SoC
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> index fec0b425a948541b39b814caef0b05e1e002d92f..1fd0c65f2c5cd10ea2f70e43e62c70588d1ffae9 100644
> --- a/drivers/phy/spacemit/Makefile
> +++ b/drivers/phy/spacemit/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_COMBPHY)	+= phy-k1-combphy.o
>   obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-combphy.c b/drivers/phy/spacemit/phy-k1-combphy.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..227b1c743f4d981b3d4555c871ef397c1c8df0b5
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-combphy.c
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 PCIE/USB3 PHY driver
> + *
> + * This driver supports the combo PHY found on Spacemit K1 SoC, which integrates
> + * a dual-mode USB3/PCIe PHY shared between the USB3.0 DRD controller and PCIe
> + * PortA. But only one mode can work at any given application scenario.
> + *
> + * PCIe mode is not supported yet and any attempt to use the PHY in PCIe mode
> + * will result in an error.
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
> + */
> +
> +#include <dt-bindings/phy/phy.h>
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/phy/phy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/reset.h>
> +#include <linux/usb/of.h>
> +
> +#define COMBPHY_USB_REG1		0x68
> +#define  COMBPHY_USB_REG1_VAL		0x00
> +#define COMBPHY_USB_REG2		0x48
> +#define  COMBPHY_USB_REG2_VAL		0x603a2276
> +#define COMBPHY_USB_REG3		0x08
> +#define  COMBPHY_USB_REG3_VAL		0x97c
> +#define COMBPHY_USB_REG4		0x18
> +#define  COMBPHY_USB_REG4_VAL		0x00
> +#define  COMBPHY_USB_TERM_SHORT_MASK	0x3000
> +#define  COMBPHY_USB_TERM_SHORT_VAL	0x3000
> +#define COMBPHY_USB_PLL_REG		0x08
> +#define  COMBPHY_USB_PLL_MASK		0x01
> +#define  COMBPHY_USB_PLL_VAL		0x01
> +#define COMBPHY_USB_LFPS_REG		0x58
> +#define  COMBPHY_USB_LFPS_MASK		0x700
> +#define  COMBPHY_USB_LFPS_THRES_DEFAULT	0x03
> +
> +#define COMBPHY_MODE_SEL_MASK	BIT(3)
> +#define COMBPHY_MODE_USB	BIT(3)
> +#define COMBPHY_WAIT_TIMEOUT	1000
> +
> +struct spacemit_combphy_priv {
> +	struct device *dev;
> +	struct phy *phy;
> +	struct reset_control *phy_rst;
> +	struct regmap *regmap_ctrl;
> +	struct regmap *regmap_sel;
> +	bool rx_always_on;
> +	u8 lfps_threshold;
> +	u8 type;
> +};
> +
> +static const struct regmap_config phy_ctrl_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x800,
> +};
> +
> +static const struct regmap_config phy_sel_regmap_config = {
> +	.reg_bits = 32,
> +	.val_bits = 32,
> +	.reg_stride = 4,
> +	.max_register = 0x400,
> +};
> +
> +static int spacemit_combphy_set_mode(struct spacemit_combphy_priv *priv)
> +{
> +	struct regmap *map = priv->regmap_sel;
> +	int ret = 0;
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		regmap_update_bits(map, 0, COMBPHY_MODE_SEL_MASK, COMBPHY_MODE_USB);
> +		break;
> +	default:
> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	return ret;
> +}
> +
> +static int spacemit_combphy_init_usb(struct spacemit_combphy_priv *priv)
> +{
> +	struct regmap *map = priv->regmap_ctrl;
> +	u32 reg_val;
> +	int ret;
> +
> +	regmap_write(map, COMBPHY_USB_REG1, COMBPHY_USB_REG1_VAL);
> +	regmap_write(map, COMBPHY_USB_REG2, COMBPHY_USB_REG2_VAL);
> +	regmap_write(map, COMBPHY_USB_REG3, COMBPHY_USB_REG3_VAL);
> +	regmap_write(map, COMBPHY_USB_REG4, COMBPHY_USB_REG4_VAL);
> +
> +	ret = regmap_read_poll_timeout(map, COMBPHY_USB_PLL_REG, reg_val,
> +				       (reg_val & COMBPHY_USB_PLL_MASK) == COMBPHY_USB_PLL_VAL,
> +				       1000, COMBPHY_WAIT_TIMEOUT * 1000);
> +	if (ret) {
> +		dev_err(priv->dev, "USB3 PHY init timeout!\n");
> +		return ret;
> +	}
> +
> +	dev_dbg(priv->dev, "USB3 PHY init lfps threshold %d\n", priv->lfps_threshold);
> +	regmap_update_bits(map, COMBPHY_USB_LFPS_REG,
> +			   COMBPHY_USB_LFPS_MASK,
> +			   priv->lfps_threshold << 8);
> +
> +	if (priv->rx_always_on)
> +		regmap_update_bits(map, COMBPHY_USB_REG4,
> +				   COMBPHY_USB_TERM_SHORT_MASK,
> +				   COMBPHY_USB_TERM_SHORT_VAL);
> +
> +	return ret;
> +}
> +
> +static int spacemit_combphy_init(struct phy *phy)
> +{
> +	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
> +	int ret;
> +
> +	ret = spacemit_combphy_set_mode(priv);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to set mode for PHY type %x\n",
> +			priv->type);
> +		goto out;
> +	}
> +
> +	ret = reset_control_deassert(priv->phy_rst);
> +	if (ret) {
> +		dev_err(priv->dev, "failed to deassert rst\n");
> +		goto err_rst;
> +	}
> +
> +	switch (priv->type) {
> +	case PHY_TYPE_USB3:
> +		ret = spacemit_combphy_init_usb(priv);
> +		break;
> +	default:
> +		dev_err(priv->dev, "PHY type %x not supported\n", priv->type);
> +		ret = -EINVAL;
> +		break;
> +	}
> +
> +	if (ret)
> +		goto err_rst;
> +
> +	return 0;
> +
> +err_rst:
> +	reset_control_assert(priv->phy_rst);
> +out:
> +	return ret;
> +}
> +
> +static int spacemit_combphy_exit(struct phy *phy)
> +{
> +	struct spacemit_combphy_priv *priv = phy_get_drvdata(phy);
> +
> +	reset_control_assert(priv->phy_rst);
> +
> +	return 0;
> +}
> +
> +static struct phy *spacemit_combphy_xlate(struct device *dev,
> +					  const struct of_phandle_args *args)
> +{
> +	struct spacemit_combphy_priv *priv = dev_get_drvdata(dev);
> +
> +	if (args->args_count != 1) {
> +		dev_err(dev, "invalid number of arguments\n");
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	if (priv->type != PHY_NONE && priv->type != args->args[0])
> +		dev_warn(dev, "PHY type %d is selected to override %d\n",
> +			 args->args[0], priv->type);
> +
> +	priv->type = args->args[0];
> +
> +	if (args->args_count > 1)
> +		dev_dbg(dev, "combo phy idx: %d selected",  args->args[1]);
> +
> +	return priv->phy;
> +}
> +
> +static const struct phy_ops spacemit_combphy_ops = {
> +	.init = spacemit_combphy_init,
> +	.exit = spacemit_combphy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_combphy_probe(struct platform_device *pdev)
> +{
> +	struct spacemit_combphy_priv *priv;
> +	void __iomem *ctrl_base, *sel_base;
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +
> +	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> +	if (!priv)
> +		return -ENOMEM;
> +
> +	ctrl_base = devm_platform_ioremap_resource_byname(pdev, "ctrl");
> +	if (IS_ERR(ctrl_base))
> +		return PTR_ERR(ctrl_base);
> +
> +	priv->regmap_ctrl = devm_regmap_init_mmio(dev, ctrl_base, &phy_ctrl_regmap_config);
> +	if (IS_ERR(priv->regmap_ctrl))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap_ctrl),
> +				     "Failed to init regmap for ctrl\n");
> +
> +	sel_base = devm_platform_ioremap_resource_byname(pdev, "sel");
> +	if (IS_ERR(sel_base))
> +		return PTR_ERR(sel_base);
> +
> +	priv->regmap_sel = devm_regmap_init_mmio(dev, sel_base, &phy_sel_regmap_config);
> +	if (IS_ERR(priv->regmap_sel))
> +		return dev_err_probe(dev, PTR_ERR(priv->regmap_sel),
> +				     "Failed to init regmap for sel\n");
> +
> +	priv->lfps_threshold = COMBPHY_USB_LFPS_THRES_DEFAULT;
> +	device_property_read_u8(&pdev->dev, "spacemit,lfps-threshold", &priv->lfps_threshold);
> +
> +	priv->rx_always_on = device_property_read_bool(&pdev->dev, "spacemit,rx-always-on");
> +	priv->type = PHY_NONE;
> +	priv->dev = dev;
> +
> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->phy_rst))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy_rst),
> +				     "failed to get phy reset\n");
> +
> +	priv->phy = devm_phy_create(dev, NULL, &spacemit_combphy_ops);
> +	if (IS_ERR(priv->phy))
> +		return dev_err_probe(dev, PTR_ERR(priv->phy),
> +				     "failed to create combphy\n");
> +
> +	dev_set_drvdata(dev, priv);
> +	phy_set_drvdata(priv->phy, priv);
> +	phy_provider = devm_of_phy_provider_register(dev, spacemit_combphy_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_combphy_of_match[] = {
> +	{ .compatible = "spacemit,k1-combphy", },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, spacemit_combphy_of_match);
> +
> +static struct platform_driver spacemit_combphy_driver = {
> +	.probe	= spacemit_combphy_probe,
> +	.driver = {
> +		.name = "spacemit-k1-combphy",
> +		.of_match_table = spacemit_combphy_of_match,
> +	},
> +};
> +module_platform_driver(spacemit_combphy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit PCIE/USB3.0 COMBO PHY driver");
> +MODULE_LICENSE("GPL");
> 

Looks all good now

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>

Thanks,
Neil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
