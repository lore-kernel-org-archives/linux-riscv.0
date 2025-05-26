Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C932C5AD49
	for <linux-riscv@archiver.kernel.org>; Mon, 26 May 2025 15:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:Reply-To:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:To:Subject:
	From:MIME-Version:Date:Message-ID:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+iLNrrC0VhVfS+cYpTFp49dX0xunQr5JUxHdXzgdZOE=; b=oVtCSkkp5is53tFEbGND7SlCBi
	Vgfe13ZmxTY4qqcv+ToMCP5g3cVw8yCwsJPu4PmgV9qzlw228zJFmlsIR2z4rjozIbVXcJHDHvpcp
	yau9h5+EDJg9iA3nm4IVqRXRylz/qtpiMhquvxDheofRY43bbh65n9sbQ5wlBg3A/YXlFe9pDaGmZ
	6EyKMq+GxzmZJpfE518CnDKLD0APxM6+E9eGIo8gKxxEJtJp51rDmpPj0wH7PejU5tYlPkrg2Hz23
	75Yf2gSEnHtZfcQxvkz98Lp0d9tTZgYjwGAE9BrA+2IzPR+LxAL/0M9fllHvUC77G2iE3kNs0D8IJ
	eTcg2vxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJa7K-00000009Asb-0Xz1;
	Mon, 26 May 2025 15:51:58 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJa7I-00000009Arp-0zZy
	for linux-riscv@lists.infradead.org;
	Mon, 26 May 2025 15:51:57 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-3a375d758a0so2109680f8f.0
        for <linux-riscv@lists.infradead.org>; Mon, 26 May 2025 08:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748274715; x=1748879515; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7bjzoIIXG8TdggAgokiJNFRsdiocEQaRnkKiyhSlsH0=;
        b=j06eHQSlzg5ycA6pQmjNz/FKw3PI4XZQoo3jt5jCP32qZ3Rsa80GLxuK1ymVa+37A1
         1aWpreyRCBEHiAHNPWXrXBSzG+pQXXhp5HoIE5X8ufRG76p1K7Vw3/HGPlfBOUwPz4T0
         Vg8bGRaHGl5S3+3wwmvAIIVteFRuoa4mRomgZ8o6vm3blU0yZ2KFlcYvjfQYvQsEtPqL
         SHIvesFxK51MHcBHJiPPK1GcxO3dtTzEIcf/ikJ8PK/q9xega+Mpx/pI2RkNc+wgvGyt
         yceVyb3tPhXLTxfCVrWNsLtqXSOJZVOriU/rBkMI8kNVF5NTF2uAZGgBKq3r4CFUJvSq
         BIhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748274715; x=1748879515;
        h=content-transfer-encoding:in-reply-to:organization:autocrypt
         :content-language:references:cc:to:subject:reply-to:from:user-agent
         :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7bjzoIIXG8TdggAgokiJNFRsdiocEQaRnkKiyhSlsH0=;
        b=atu3WhH6sYB0CDLkZc17yqpg25/1ZOOzV/n496HojQkZgOfEFX8Z5JLeX1OTpa0u11
         55WtkagjtGM1gD9BzSsZRiCv/Uze2lNXBMzBvEMnBMFUE+aIjdcnSPwSH0xOwYDecyzy
         j2yR6kTxyco51qVsRtj0kjHy1wktcO73SS4uTTHO9n8Sk3b5yJUWh1qI+XibmW4x7ZOh
         NRWxg8qc5E6GZnG3VTB4TdyAA7l4+DvIB4W1q7Ou/YzEt+Evuibohjn1ISu8WVqt13VQ
         JtU45MIqnCV9KPEuU3rtWX3UnbMQMC2LGRdAb/PAJZhEVs/Y3Uzs7sr1JsFF2kyV3XBA
         cRig==
X-Forwarded-Encrypted: i=1; AJvYcCV9DPH9KBHNck6GNqZGU+1SamIHBJLA6tMwU16+j5FVNwpqHfoVZNQ3QTAOV6Wnl1tovNeBGsAhBEtNZA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy11x6EZU13haGOehK7F1DZhNsMHMN69hXaAAHjjFJhBffM4WZo
	05rQA0g4TY5o/qTrX/sSH7AYRcdSY1pzH/4v0hoimuWixSIBWrtkcTdQU07hLjsxlRQ=
X-Gm-Gg: ASbGncsqBkQEaCGAWu+lERoczKvdNzxftQ1gngTz9vqfrd3l/OOjxOc1d3eOruTz5UB
	jgfs3ch8ruVZ71M8Pp1h4DcAbsr4dK19emvevH34uwDdcL0Z/OwTvbG15+D8mcTKVlrCjryCH1R
	g3qLIeD0HRGWbIeo5Aqk38+CI7XOTBmJmLamnYXbp3WAAZbsu0SuCk3pGT3EvvfiGTCU4eZ6nxr
	Qcjea40Aa71U4ownXYFTUQznKT9SwK2ttp6AtwXA1fKYLpVEH3LY29lJzbko+ey3Y/zYTVcOBY7
	xzjjvta/7dU6L+CjBDiHfcdSUTyLst7Og4P/h2SmUq+06wvW5OVNUNp+NPFu7eaqrWAmg8B8SwI
	tyoNj/TNwN6zFP69B/DvFuzgUm7m7
X-Google-Smtp-Source: AGHT+IH1epXCOIUG/iYdu3e9sbMDiReRn+5q8Cf6MYskS62ZGRXKqLb43uikJKqhdCgcIn6FoAJgfg==
X-Received: by 2002:adf:ee43:0:b0:3a4:cea0:7ec9 with SMTP id ffacd0b85a97d-3a4cea07f3bmr6470899f8f.54.1748274714508;
        Mon, 26 May 2025 08:51:54 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4? ([2a01:e0a:3d9:2080:485c:38a6:3d01:f4a4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4d90912d4sm3325921f8f.47.2025.05.26.08.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 26 May 2025 08:51:54 -0700 (PDT)
Message-ID: <39e6b2e7-2aae-4f11-8cb0-2e911c2d7793@linaro.org>
Date: Mon, 26 May 2025 17:51:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: neil.armstrong@linaro.org
Subject: Re: [PATCH v4 3/4] phy: spacemit: support K1 USB2.0 PHY controller
To: Ze Huang <huangze@whut.edu.cn>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250526-b4-k1-usb3-phy-v2-v4-0-eca668fc16a2@whut.edu.cn>
 <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
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
In-Reply-To: <20250526-b4-k1-usb3-phy-v2-v4-3-eca668fc16a2@whut.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250526_085156_293654_4CA517F6 
X-CRM114-Status: GOOD (  30.26  )
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

Hi,

On 26/05/2025 16:31, Ze Huang wrote:
> The SpacemiT K1 SoC includes three USB ports:
> 
> - One USB2.0 OTG port
> - One USB2.0 host-only port
> - One USB3.0 port with an integrated USB2.0 DRD interface
> 
> Each of these ports is connected to a USB2.0 PHY responsible for USB2
> transmission.
> 
> This commit adds support for the SpacemiT K1 USB2.0 PHY, which is
> compliant with the USB 2.0 specification and supports both 8-bit 60MHz
> and 16-bit 30MHz parallel interfaces.
> 
> Signed-off-by: Ze Huang <huangze@whut.edu.cn>
> ---
>   drivers/phy/Kconfig                |   1 +
>   drivers/phy/Makefile               |   1 +
>   drivers/phy/spacemit/Kconfig       |  13 ++++
>   drivers/phy/spacemit/Makefile      |   2 +
>   drivers/phy/spacemit/phy-k1-usb2.c | 131 +++++++++++++++++++++++++++++++++++++
>   5 files changed, 148 insertions(+)
> 
> diff --git a/drivers/phy/Kconfig b/drivers/phy/Kconfig
> index 8d58efe998ec5fd50054eed2c90d6ecce6bd5dd8..fca589aa7926eb5bce14e99785cf32cf0395202e 100644
> --- a/drivers/phy/Kconfig
> +++ b/drivers/phy/Kconfig
> @@ -114,6 +114,7 @@ source "drivers/phy/renesas/Kconfig"
>   source "drivers/phy/rockchip/Kconfig"
>   source "drivers/phy/samsung/Kconfig"
>   source "drivers/phy/socionext/Kconfig"
> +source "drivers/phy/spacemit/Kconfig"
>   source "drivers/phy/st/Kconfig"
>   source "drivers/phy/starfive/Kconfig"
>   source "drivers/phy/sunplus/Kconfig"
> diff --git a/drivers/phy/Makefile b/drivers/phy/Makefile
> index e281442acc752820fe0bd638dfe38986a37c2a78..05993ff8a15daf7e2583b5f9b9b37ac584a30609 100644
> --- a/drivers/phy/Makefile
> +++ b/drivers/phy/Makefile
> @@ -34,6 +34,7 @@ obj-y					+= allwinner/	\
>   					   rockchip/	\
>   					   samsung/	\
>   					   socionext/	\
> +					   spacemit/	\
>   					   st/		\
>   					   starfive/	\
>   					   sunplus/	\
> diff --git a/drivers/phy/spacemit/Kconfig b/drivers/phy/spacemit/Kconfig
> new file mode 100644
> index 0000000000000000000000000000000000000000..0136aee2e8a2f5f484da136b26f80130794b992c
> --- /dev/null
> +++ b/drivers/phy/spacemit/Kconfig
> @@ -0,0 +1,13 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Phy drivers for SpacemiT platforms
> +#
> +config PHY_SPACEMIT_K1_USB2
> +	tristate "SpacemiT K1 USB 2.0 PHY support"
> +	depends on (ARCH_SPACEMIT || COMPILE_TEST) && OF
> +	depends on COMMON_CLK
> +	depends on USB_COMMON
> +	select GENERIC_PHY
> +	help
> +	  Enable this to support K1 USB 2.0 PHY driver. This driver takes care of
> +	  enabling and clock setup and will be used by K1 udc/ehci/otg/xhci driver.
> diff --git a/drivers/phy/spacemit/Makefile b/drivers/phy/spacemit/Makefile
> new file mode 100644
> index 0000000000000000000000000000000000000000..fec0b425a948541b39b814caef0b05e1e002d92f
> --- /dev/null
> +++ b/drivers/phy/spacemit/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +obj-$(CONFIG_PHY_SPACEMIT_K1_USB2)		+= phy-k1-usb2.o
> diff --git a/drivers/phy/spacemit/phy-k1-usb2.c b/drivers/phy/spacemit/phy-k1-usb2.c
> new file mode 100644
> index 0000000000000000000000000000000000000000..3485064a77baac8bb857aff3da45838c0da28f03
> --- /dev/null
> +++ b/drivers/phy/spacemit/phy-k1-usb2.c
> @@ -0,0 +1,131 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * SpacemiT K1 USB 2.0 PHY driver
> + *
> + * Copyright (C) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
> + * Copyright (C) 2025 Ze Huang <huangze9015@gmail.com>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/iopoll.h>
> +#include <linux/platform_device.h>
> +#include <linux/usb/of.h>
> +
> +#define USB2_PHY_REG01			0x04
> +#define  USB2_PHY_REG01_VAL		0x60ef
> +#define  USB2_PHY_REG01_PLL_IS_READY	BIT(0)
> +#define USB2_PHY_REG04			0x10
> +#define  USB2_PHY_REG04_AUTO_CLEAR_DIS	BIT(2)
> +#define USB2_PHY_REG0D			0x34
> +#define  USB2_PHY_REG0D_VAL		0x1c
> +#define USB2_PHY_REG26			0x98
> +#define  USB2_PHY_REG26_VAL		0xbec4
> +
> +#define USB2D_CTRL_RESET_TIME_MS	50
> +
> +struct spacemit_usb2phy {
> +	struct phy	*phy;
> +	struct clk	*clk;
> +	void __iomem	*base;
> +};
> +
> +static int spacemit_usb2phy_init(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +	void __iomem *base = sphy->base;
> +	u32 val;
> +	int ret;
> +
> +	ret = clk_prepare_enable(sphy->clk);
> +	if (ret) {
> +		dev_err(&phy->dev, "failed to enable clock\n");
> +		return ret;
> +	}
> +
> +	/*
> +	 * make sure the usb controller is not under reset process before
> +	 * any configuration
> +	 */
> +	usleep_range(150, 200);
> +	writel(USB2_PHY_REG26_VAL, base + USB2_PHY_REG26); /* 24M ref clk */
> +
> +	ret = read_poll_timeout(readl, val, (val & USB2_PHY_REG01_PLL_IS_READY),
> +				500, USB2D_CTRL_RESET_TIME_MS * 1000, true,
> +				base + USB2_PHY_REG01);
> +	if (ret) {
> +		dev_err(&phy->dev, "wait PHY_REG01[PLLREADY] timeout\n");
> +		return ret;
> +	}
> +
> +	/* release usb2 phy internal reset and enable clock gating */
> +	writel(USB2_PHY_REG01_VAL, base + USB2_PHY_REG01);
> +	writel(USB2_PHY_REG0D_VAL, base + USB2_PHY_REG0D);
> +
> +	/* auto clear host disc */
> +	val = readl(base + USB2_PHY_REG04);
> +	val |= USB2_PHY_REG04_AUTO_CLEAR_DIS;
> +	writel(val, base + USB2_PHY_REG04);
> +
> +	return 0;
> +}
> +
> +static int spacemit_usb2phy_exit(struct phy *phy)
> +{
> +	struct spacemit_usb2phy *sphy = phy_get_drvdata(phy);
> +
> +	clk_disable_unprepare(sphy->clk);
> +
> +	return 0;
> +}
> +
> +static const struct phy_ops spacemit_usb2phy_ops = {
> +	.init = spacemit_usb2phy_init,
> +	.exit = spacemit_usb2phy_exit,
> +	.owner = THIS_MODULE,
> +};
> +
> +static int spacemit_usb2phy_probe(struct platform_device *pdev)
> +{
> +	struct phy_provider *phy_provider;
> +	struct device *dev = &pdev->dev;
> +	struct spacemit_usb2phy *sphy;
> +
> +	sphy = devm_kzalloc(dev, sizeof(*sphy), GFP_KERNEL);
> +	if (!sphy)
> +		return -ENOMEM;
> +
> +	sphy->clk = devm_clk_get_prepared(&pdev->dev, NULL);
> +	if (IS_ERR(sphy->clk))
> +		return dev_err_probe(dev, PTR_ERR(sphy->clk), "Failed to get clock\n");
> +
> +	sphy->base = devm_platform_ioremap_resource(pdev, 0);
> +	if (IS_ERR(sphy->base))
> +		return PTR_ERR(sphy->base);
> +
> +	sphy->phy = devm_phy_create(dev, NULL, &spacemit_usb2phy_ops);
> +	if (IS_ERR(sphy->phy))
> +		return dev_err_probe(dev, PTR_ERR(sphy->phy), "Failed to create phy\n");
> +
> +	phy_set_drvdata(sphy->phy, sphy);
> +	phy_provider = devm_of_phy_provider_register(dev, of_phy_simple_xlate);
> +
> +	return PTR_ERR_OR_ZERO(phy_provider);
> +}
> +
> +static const struct of_device_id spacemit_usb2phy_dt_match[] = {
> +	{ .compatible = "spacemit,k1-usb2-phy", },
> +	{ /* sentinal */ }

=> sentinel

> +};
> +MODULE_DEVICE_TABLE(of, spacemit_usb2phy_dt_match);
> +
> +static struct platform_driver spacemit_usb2_phy_driver = {
> +	.probe	= spacemit_usb2phy_probe,
> +	.driver = {
> +		.name   = "spacemit-usb2-phy",
> +		.of_match_table = spacemit_usb2phy_dt_match,
> +	},
> +};
> +module_platform_driver(spacemit_usb2_phy_driver);
> +
> +MODULE_DESCRIPTION("Spacemit USB 2.0 PHY driver");
> +MODULE_LICENSE("GPL");
> 

It looks fine, but why didn't also convert thid driver to regmap ?

Thanks,
Neil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
