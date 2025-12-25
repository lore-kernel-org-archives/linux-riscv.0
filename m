Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CC4BE784A6
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Dec 2025 09:46:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:References:Message-Id:Date:
	In-Reply-To:From:Subject:Mime-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4El+9C04lWmp2GORR3+CThZErH/Tdy511RpEyaR28hs=; b=LicdnQkT5uyeOY
	eSQIphF0jaBRYR0/+m2DMitFYrP9jJxcsUCb4rcNhmdTonMcMYqJm95Zw5iVYmqL5La/V/LPMazuC
	4C3JaNtdJXNUiFjpVOKeLwCvTRj7peTQvspDAPJkCgv6SZcw3h0d+aUO0M272gW+WrFZbY2ceUq0L
	OMy21o3FOHFGA/+Hsg5Jkugjmtf6VkmmffZxHzFKIHjpjIxEgLHJ6+l7wA9lRgVcbLkrr+JSoNSNN
	zoYhILRJ6JDzNkafZrIEADRb/oGr0gGVxIT5Kq3nIjc+85TxanRj1Zy/NeYC/ig0NLd2TDVDy7Pmk
	Fskj9jOdVNqbt0NA/oTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhvL-00000000HyA-404n;
	Thu, 25 Dec 2025 09:46:23 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vYhvJ-00000000Hxm-1vgq
	for linux-riscv@lists.infradead.org;
	Thu, 25 Dec 2025 09:46:22 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-2a12ebe4b74so114466365ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Dec 2025 01:46:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766655980; x=1767260780; darn=lists.infradead.org;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2bt2pVdj4yyCOt948IO4sXwlUxg7Pk0gmvzoQBMtrs=;
        b=QJ8i/WiD+k6jcJd/yxSsid86mxM8Qy2mh39nwVOZZxmvTLj66wI4uiAHAsec/GRPrM
         1TmWYQvjVNctb8Mm9s3oBqXoLSu0dpWQYDxmexJJqoBlDF2Ro0jFoDwIFONdTG+pUWXr
         xg3X2o8gcZCTh/KBMILIPc0r1YRS9A2iK8fxX2aQfjECFsCHRoPqAiFO8yJX1FXSDfTd
         kN49LVjZYyEudWwi/QFC+xen5Cev6cFg45whleOCGYljKTJyxsEt7fkZ5l7TOqy1Dqx+
         Zd7CtMA+3n/Fz7JDPKT/QcbsIz6VndijgXcxzbk/IvSSQHVrh/I90ak2x9RChVZgT8dy
         5kJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766655980; x=1767260780;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u2bt2pVdj4yyCOt948IO4sXwlUxg7Pk0gmvzoQBMtrs=;
        b=jzvZl5VvEP0P1NHJvjX3jcjNMjbDtQ7DYQ6KiQR1FTPaigHAbgCMdLUCO9UbwbsvCL
         TIYIGVuN7gOaqBXSWxa8wAh+8FNz/4NDmC7fYqoY0bEqtMl/Lny4Lb73Oh3kmVRUV72g
         39PXdUVBg8K17f8h2cbXl4fOcrWFN7cfFLhbiqkIhsvZwRnJl5gC2eSgis3rBdZwFbBv
         f/erSFRGUQuHZESpbeYygtn7vrdHqSagiEPSxBjOu2fmXuB95GgKAODIfnXcIwA5C5cI
         aJkS90xVsCTrrBl1Mfk3Bsb71yNTDqcWNVwaLJpsudqAdZcqFULKEPbLseAtNzEzkrF1
         SwNA==
X-Forwarded-Encrypted: i=1; AJvYcCUIfGxCs4kToNfAVuQEjGVwYY00gs95NxXXcr4ftMHHfBw2lCpJ4NBboTiGaMLmG7Kni/azilQ/Xlejrg==@lists.infradead.org
X-Gm-Message-State: AOJu0YzMu0h+Kdg048n+XCf0LZ4s+1eOkUbnQOKUzdyxlyMXyeiFsxwv
	7LrIdQrGvfGUT26utdD1sl6VJEYojjphC9t7XM7aRByP1S2iVQhv71Ej
X-Gm-Gg: AY/fxX4taHdIrgUc2rSRg289ig6nN+nnXKMOKHNTT0IGA7QjUPOVm/aUX/7cyeMRUcx
	62P7GffZedeMkpr2B/goCCnyQRb5MLFKxSAluPWFrD13J8NdN05D9IjZl+ABpYwy138x0y2qH0f
	BIAhxEBO6SYxHLabWv+iNsgh04n3uoIAD9sJHTZpCAs/OIqOZ7Q3iQCZIaedU++fAyH3ux0J8SX
	UNQuBGdPYPP2i0NW/POlmdY4FscoFsdx54Fc5Xj4tSmamawLpJuFKmNZo1hE+CEq9k6T22/wkOB
	qIIlXMBsizg/2ZYC1/PjrWQPCiDKDp4LTkSlan2SPG4cZWYhhTFgzC2bfdCnNa/l0qhtfdkKl4L
	HhW//t4Kw0vJWEa2gN2Tf/mZTfLV80M0KA9UsyCmVKJ+hzKRdB8MmVD4y/y7SNQpTzlfbW/S905
	5i6Kl8Kp1MdYwuVSEvx7S1CVYaJrUAHNFP4TCJ+djUZfUt3HapqzFP41fx+AxUPm7dY41VKPPmU
	A6YWyb00nxGfTufPA==
X-Google-Smtp-Source: AGHT+IHPzYWln2Hm/gqbr/aXlBreTtiVog10BDkOjZAA+mGNr3VcfmmHQHVSuV80Q9b25KZ52WX3vA==
X-Received: by 2002:a17:903:2345:b0:2a0:d43f:c934 with SMTP id d9443c01a7336-2a2f220a644mr156705895ad.8.1766655980068;
        Thu, 25 Dec 2025 01:46:20 -0800 (PST)
Received: from smtpclient.apple (125x103x213x40.ap125.ftth.ucom.ne.jp. [125.103.213.40])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c83961sm177814725ad.38.2025.12.25.01.46.13
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Dec 2025 01:46:19 -0800 (PST)
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3864.300.41.1.7\))
Subject: Re: [PATCH v4 5/9] drm/bridge: add a driver for T-Head TH1520 HDMI
 controller
From: "Han Gao (Revy)" <rabenda.cn@gmail.com>
In-Reply-To: <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
Date: Thu, 25 Dec 2025 17:46:02 +0800
Message-Id: <F485BC7D-C051-45FB-A069-6C71020E2275@gmail.com>
References: <20251224161205.1132149-1-zhengxingda@iscas.ac.cn>
 <20251224161205.1132149-6-zhengxingda@iscas.ac.cn>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
X-Mailer: Apple Mail (2.3864.300.41.1.7)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251225_014621_523424_76836C36 
X-CRM114-Status: GOOD (  33.89  )
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
Cc: Drew Fustini <fustini@kernel.org>, Heiko Stuebner <heiko@sntech.de>, dri-devel@lists.freedesktop.org, Guo Ren <guoren@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Yao Zi <ziyao@disroot.org>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Michal Wilczynski <m.wilczynski@samsung.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, linux-kernel@vger.kernel.org, Philipp Zabel <p.zabel@pengutronix.de>, "Han Gao \(Revy\)" <rabenda.cn@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



> On Dec 25, 2025, at 00:12, Icenowy Zheng <zhengxingda@iscas.ac.cn> wrote:
> 
> From: Icenowy Zheng <uwu@icenowy.me>
> 
> T-Head TH1520 SoC contains a Synopsys DesignWare HDMI controller (paired
> with DesignWare HDMI TX PHY Gen2) that takes the "DP" output from the
> display controller.
> 
> Add a driver for this controller utilizing the common DesignWare HDMI
> code in the kernel.
> 
> Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
> No changes in v3, v4.
> 
> Changes in v2:
> - Created a new function to set PHY parameters and refactored the
>  control flow of the configure_phy callback.
> 
> MAINTAINERS                             |   1 +
> drivers/gpu/drm/bridge/Kconfig          |  10 ++
> drivers/gpu/drm/bridge/Makefile         |   1 +
> drivers/gpu/drm/bridge/th1520-dw-hdmi.c | 173 ++++++++++++++++++++++++
> 4 files changed, 185 insertions(+)
> create mode 100644 drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5b11839cba9de..fc04fc007a054 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -22556,6 +22556,7 @@ F: Documentation/devicetree/bindings/reset/thead,th1520-reset.yaml
> F: arch/riscv/boot/dts/thead/
> F: drivers/clk/thead/clk-th1520-ap.c
> F: drivers/firmware/thead,th1520-aon.c
> +F: drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> F: drivers/mailbox/mailbox-th1520.c
> F: drivers/net/ethernet/stmicro/stmmac/dwmac-thead.c
> F: drivers/pinctrl/pinctrl-th1520.c
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index a250afd8d6622..8e19f5fb9ad7c 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -335,6 +335,16 @@ config DRM_THINE_THC63LVD1024
> help
>  Thine THC63LVD1024 LVDS/parallel converter driver.
> 
> +config DRM_THEAD_TH1520_DW_HDMI
> + tristate "T-Head TH1520 DesignWare HDMI bridge"
> + depends on OF
> + depends on COMMON_CLK
> + depends on ARCH_THEAD || COMPILE_TEST
> + select DRM_DW_HDMI
> + help
> +  Choose this to enable support for the internal HDMI bridge found
> +  on the T-Head TH1520 SoC.
> +
> config DRM_TOSHIBA_TC358762
> tristate "TC358762 DSI/DPI bridge"
> depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index c7dc03182e592..085b5db45d6fd 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -28,6 +28,7 @@ obj-$(CONFIG_DRM_SII902X) += sii902x.o
> obj-$(CONFIG_DRM_SII9234) += sii9234.o
> obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
> obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
> +obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
> obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
> obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
> obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> diff --git a/drivers/gpu/drm/bridge/th1520-dw-hdmi.c b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> new file mode 100644
> index 0000000000000..389eead5f1c45
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/th1520-dw-hdmi.c
> @@ -0,0 +1,173 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Copyright (C) 2025 Icenowy Zheng <uwu@icenowy.me>
> + *
> + * Based on rcar_dw_hdmi.c, which is:
> + *   Copyright (C) 2016 Renesas Electronics Corporation
> + * Based on imx8mp-hdmi-tx.c, which is:
> + *   Copyright (C) 2022 Pengutronix, Lucas Stach <kernel@pengutronix.de>
> + */
> +
> +#include <linux/clk.h>
> +#include <linux/mod_devicetable.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/reset.h>
> +
> +#include <drm/bridge/dw_hdmi.h>
> +#include <drm/drm_modes.h>
> +
> +#define TH1520_HDMI_PHY_OPMODE_PLLCFG 0x06 /* Mode of operation and PLL dividers */
> +#define TH1520_HDMI_PHY_CKSYMTXCTRL 0x09 /* Clock Symbol and Transmitter Control Register */
> +#define TH1520_HDMI_PHY_VLEVCTRL 0x0e /* Voltage Level Control Register */
> +#define TH1520_HDMI_PHY_PLLCURRGMPCTRL 0x10 /* PLL current and Gmp (conductance) */
> +#define TH1520_HDMI_PHY_PLLDIVCTRL 0x11 /* PLL dividers */
> +#define TH1520_HDMI_PHY_TXTERM 0x19 /* Transmission Termination Register */
> +
> +struct th1520_hdmi_phy_params {
> + unsigned long mpixelclock;
> + u16 opmode_pllcfg;
> + u16 pllcurrgmpctrl;
> + u16 plldivctrl;
> + u16 cksymtxctrl;
> + u16 vlevctrl;
> + u16 txterm;
> +};
> +
> +static const struct th1520_hdmi_phy_params th1520_hdmi_phy_params[] = {
> + { 35500000,  0x0003, 0x0283, 0x0628, 0x8088, 0x01a0, 0x0007 },
> + { 44900000,  0x0003, 0x0285, 0x0228, 0x8088, 0x01a0, 0x0007 },
> + { 71000000,  0x0002, 0x1183, 0x0614, 0x8088, 0x01a0, 0x0007 },
> + { 90000000,  0x0002, 0x1142, 0x0214, 0x8088, 0x01a0, 0x0007 },
> + { 121750000, 0x0001, 0x20c0, 0x060a, 0x8088, 0x01a0, 0x0007 },
> + { 165000000, 0x0001, 0x2080, 0x020a, 0x8088, 0x01a0, 0x0007 },
> + { 198000000, 0x0000, 0x3040, 0x0605, 0x83c8, 0x0120, 0x0004 },
> + { 297000000, 0x0000, 0x3041, 0x0205, 0x81dc, 0x0200, 0x0005 },
> + { 371250000, 0x0640, 0x3041, 0x0205, 0x80f6, 0x0140, 0x0000 },
> + { 495000000, 0x0640, 0x3080, 0x0005, 0x80f6, 0x0140, 0x0000 },
> + { 594000000, 0x0640, 0x3080, 0x0005, 0x80fa, 0x01e0, 0x0004 },
> +};
> +
> +struct th1520_hdmi {
> + struct dw_hdmi_plat_data plat_data;
> + struct dw_hdmi *dw_hdmi;
> + struct clk *pixclk;
> + struct reset_control *mainrst, *prst;
> +};
> +
> +static enum drm_mode_status
> +th1520_hdmi_mode_valid(struct dw_hdmi *hdmi, void *data,
> +       const struct drm_display_info *info,
> +       const struct drm_display_mode *mode)
> +{
> + /*
> + * The maximum supported clock frequency is 594 MHz, as shown in the PHY
> + * parameters table.
> + */
> + if (mode->clock > 594000)
> + return MODE_CLOCK_HIGH;
> +
> + return MODE_OK;
> +}
> +
> +static void th1520_hdmi_phy_set_params(struct dw_hdmi *hdmi,
> + const struct th1520_hdmi_phy_params *params)
> +{
> + dw_hdmi_phy_i2c_write(hdmi, params->opmode_pllcfg,
> +      TH1520_HDMI_PHY_OPMODE_PLLCFG);
> + dw_hdmi_phy_i2c_write(hdmi, params->pllcurrgmpctrl,
> +      TH1520_HDMI_PHY_PLLCURRGMPCTRL);
> + dw_hdmi_phy_i2c_write(hdmi, params->plldivctrl,
> +      TH1520_HDMI_PHY_PLLDIVCTRL);
> + dw_hdmi_phy_i2c_write(hdmi, params->vlevctrl,
> +      TH1520_HDMI_PHY_VLEVCTRL);
> + dw_hdmi_phy_i2c_write(hdmi, params->cksymtxctrl,
> +      TH1520_HDMI_PHY_CKSYMTXCTRL);
> + dw_hdmi_phy_i2c_write(hdmi, params->txterm,
> +      TH1520_HDMI_PHY_TXTERM);
> +}
> +
> +static int th1520_hdmi_phy_configure(struct dw_hdmi *hdmi, void *data,
> +     unsigned long mpixelclock)
> +{
> + unsigned int i;
> +
> + for (i = 0; i < ARRAY_SIZE(th1520_hdmi_phy_params); i++) {
> + if (mpixelclock <= th1520_hdmi_phy_params[i].mpixelclock) {
> + th1520_hdmi_phy_set_params(hdmi,
> +   &th1520_hdmi_phy_params[i]);
> + return 0;
> + }
> + }
> +
> + return -EINVAL;
> +}
> +
> +static int th1520_dw_hdmi_probe(struct platform_device *pdev)
> +{
> + struct th1520_hdmi *hdmi;
> + struct dw_hdmi_plat_data *plat_data;
> + struct device *dev = &pdev->dev;
> +
> + hdmi = devm_kzalloc(dev, sizeof(*hdmi), GFP_KERNEL);
> + if (!hdmi)
> + return -ENOMEM;
> +
> + plat_data = &hdmi->plat_data;
> +
> + hdmi->pixclk = devm_clk_get_enabled(dev, "pix");
> + if (IS_ERR(hdmi->pixclk))
> + return dev_err_probe(dev, PTR_ERR(hdmi->pixclk),
> +     "Unable to get pixel clock\n");
> +
> + hdmi->mainrst = devm_reset_control_get_exclusive_deasserted(dev, "main");
> + if (IS_ERR(hdmi->mainrst))
> + return dev_err_probe(dev, PTR_ERR(hdmi->mainrst),
> +     "Unable to get main reset\n");
> +
> + hdmi->prst = devm_reset_control_get_exclusive_deasserted(dev, "apb");
> + if (IS_ERR(hdmi->prst))
> + return dev_err_probe(dev, PTR_ERR(hdmi->prst),
> +     "Unable to get apb reset\n");
> +
> + plat_data->output_port = 1;
> + plat_data->mode_valid = th1520_hdmi_mode_valid;
> + plat_data->configure_phy = th1520_hdmi_phy_configure;
> + plat_data->priv_data = hdmi;
> +
> + hdmi->dw_hdmi = dw_hdmi_probe(pdev, plat_data);
> + if (IS_ERR(hdmi))
> + return PTR_ERR(hdmi);
> +
> + platform_set_drvdata(pdev, hdmi);
> +
> + return 0;
> +}
> +
> +static void th1520_dw_hdmi_remove(struct platform_device *pdev)
> +{
> + struct dw_hdmi *hdmi = platform_get_drvdata(pdev);
> +
> + dw_hdmi_remove(hdmi);
> +}
> +
> +static const struct of_device_id th1520_dw_hdmi_of_table[] = {
> + { .compatible = "thead,th1520-dw-hdmi" },
> + { /* Sentinel */ },
> +};
> +MODULE_DEVICE_TABLE(of, th1520_dw_hdmi_of_table);
> +
> +static struct platform_driver th1520_dw_hdmi_platform_driver = {
> + .probe = th1520_dw_hdmi_probe,
> + .remove = th1520_dw_hdmi_remove,
> + .driver = {
> + .name = "th1520-dw-hdmi",
> + .of_match_table = th1520_dw_hdmi_of_table,
> + },
> +};
> +
> +module_platform_driver(th1520_dw_hdmi_platform_driver);
> +
> +MODULE_AUTHOR("Icenowy Zheng <uwu@icenowy.me>");
> +MODULE_DESCRIPTION("T-Head TH1520 HDMI Encoder Driver");
> +MODULE_LICENSE("GPL");
> -- 
> 2.52.0
> 
Tested-by: Han Gao <gaohan@iscas.ac.cn>
_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
