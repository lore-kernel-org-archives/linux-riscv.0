Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 199D4606A321
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 08:30:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Ncq57q9M;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=ZfUwuPv3
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=J6/f/YKIkeQcB5sATNhJhIEPo4hLDnXgYYLf6VTuJS8=; b=Ncq57q9MHDssicgJGqym0sRILZ
	8aF2uEbFT0ALyIhMpaDzipOsj/u1HEL2RgcRcuoptm2ANq8v8DbLUn98m8K7/Ne3jPOHjBAyNwY4V
	itSwOXIOq131OijUnr1pWsGpgkX0DHWvEl3yrRy5fmAipcFtOhjMASabulmd04J0TjIKxV755R552
	mlEGgaTOMCp+0W2JmYfIpeI0PH6ix998e4u1gf+9mqDdMcrVhkvJkb1+IJA9IVCbRp6b6vnjhlrCN
	MX1w/Na1ngtyHNEIsMWwcDwjsEc10ff1KpnJXpc0u/UVcGFEgc3i/V+vvBz/SOKCZDC3/VxynU/N7
	tMrt3EmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVluT-00000005twn-0EIT;
	Tue, 24 Nov 2026 08:29:53 +0000
Received: from mail-m4921.qiye.163.com ([45.254.49.21])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVluO-00000005tuy-26pd;
	Tue, 24 Nov 2026 08:29:50 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 55cbe0da5;
	Tue, 24 Nov 2026 16:29:43 +0800 (GMT+08:00)
Message-ID: <af27260f-1911-47bb-8fe2-8eaa8bec31b0@rock-chips.com>
Date: Tue, 24 Nov 2026 16:29:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] drm/bridge: add TH1520 DesignWare MIPI DSI host
 controller
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
References: <20261124-th1520-dw-mipi-dsi-v3-0-ffcf2d87971b@iscas.ac.cn>
 <20261124-th1520-dw-mipi-dsi-v3-2-ffcf2d87971b@iscas.ac.cn>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261124-th1520-dw-mipi-dsi-v3-2-ffcf2d87971b@iscas.ac.cn>
X-HM-Tid: 0aa20cacd82b03a7kunmd001bf23cd629f
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZSh1DVh5MHUNOTk1KHUgaSVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=ZfUwuPv3lhY6U0hFr6IwQ8jsYcZF3NMW+UQgUmySH9fZZin0nuUkyL0C1cHeJxE3j862iwb0aNpGBYRlkWCA23nGKKXCJrsM4TpMYUQCTXpy5ZfycZMWuJO5Xeg0kIHaaEUUi4WXJyPvX2YtqK6pWeXw2G79oWgaP+l70+JiyqE=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=445Y3PS/QMfmoRgrMu4TdwvLJuUU9Wg/QShpg3I+Oec=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261124_002948_799634_C20E63C0 
X-CRM114-Status: GOOD (  21.03  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, linux-riscv@lists.infradead.org, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Rob Herring <robh@kernel.org>, Robert Foss <rfoss@kernel.org>, Andy Yan <andyshrk@163.com>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-rockchip@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Han Gao <gaohan@iscas.ac.cn>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Sandy Huang <hjc@rock-chips.com>, Thomas Zimmermann <tzimmermann@suse.de>, Krzysztof Kozlowski <krzk+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Icenowy,

On 11/24/2026 3:56 PM, Icenowy Zheng wrote:
> The T-Head TH1520 SoC contains a Synopsys DesignWare MIPI DSI host
> controller with an internal DesignWare MIPI D-PHY.
> 
> Add a glue driver configuring clocks and PHY parameters for it.
> 
> Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> ---
>  drivers/gpu/drm/bridge/Kconfig              |  12 +
>  drivers/gpu/drm/bridge/Makefile             |   1 +
>  drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c | 570 ++++++++++++++++++++++++++++
>  3 files changed, 583 insertions(+)
> 
> diff --git a/drivers/gpu/drm/bridge/Kconfig b/drivers/gpu/drm/bridge/Kconfig
> index c7da6b02d7b6b..f8987e8946fbb 100644
> --- a/drivers/gpu/drm/bridge/Kconfig
> +++ b/drivers/gpu/drm/bridge/Kconfig
> @@ -372,6 +372,18 @@ config DRM_THEAD_TH1520_DW_HDMI
>  	  Choose this to enable support for the internal HDMI bridge found
>  	  on the T-Head TH1520 SoC.
>  
> +config DRM_THEAD_TH1520_DW_MIPI_DSI
> +	tristate "T-Head TH1520 DesignWare MIPI DSI bridge"
> +	depends on OF
> +	depends on COMMON_CLK
> +	depends on ARCH_THEAD || COMPILE_TEST
> +	select DRM_DW_MIPI_DSI
> +	select GENERIC_PHY_MIPI_DPHY
> +	select MFD_SYSCON
> +	help
> +	  Choose this to enable support for the internal MIPI DSI bridge
> +	  found on the T-Head TH1520 SoC.
> +
>  config DRM_TOSHIBA_TC358762
>  	tristate "TC358762 DSI/DPI bridge"
>  	depends on OF
> diff --git a/drivers/gpu/drm/bridge/Makefile b/drivers/gpu/drm/bridge/Makefile
> index 15cc821d85b7e..5af871ba5ce77 100644
> --- a/drivers/gpu/drm/bridge/Makefile
> +++ b/drivers/gpu/drm/bridge/Makefile
> @@ -32,6 +32,7 @@ obj-$(CONFIG_DRM_SII9234) += sii9234.o
>  obj-$(CONFIG_DRM_SIMPLE_BRIDGE) += simple-bridge.o
>  obj-$(CONFIG_DRM_SOLOMON_SSD2825) += ssd2825.o
>  obj-$(CONFIG_DRM_THEAD_TH1520_DW_HDMI) += th1520-dw-hdmi.o
> +obj-$(CONFIG_DRM_THEAD_TH1520_DW_MIPI_DSI) += th1520-dw-mipi-dsi.o
>  obj-$(CONFIG_DRM_THINE_THC63LVD1024) += thc63lvd1024.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358762) += tc358762.o
>  obj-$(CONFIG_DRM_TOSHIBA_TC358764) += tc358764.o
> diff --git a/drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c b/drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c
> new file mode 100644
> index 0000000000000..8e866b70aec88
> --- /dev/null
> +++ b/drivers/gpu/drm/bridge/th1520-dw-mipi-dsi.c
> @@ -0,0 +1,570 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Copyright (C) 2026 Institute of Software, Chinese Academy of Sciences (ISCAS)
> + *
> + * Author:
> + *   Icenowy Zheng <zhengxingda@iscas.ac.cn>
> + *
> + * Based on dw_mipi_dsi-stm.c, which is:
> + *   Copyright (C) STMicroelectronics SA 2017
> + *
> + * Based on dw-mipi-dsi-rockchip.c, which is:
> + *   Copyright (C) Rockchip Electronics Co., Ltd.
> + *
> + * Based on vendor kernel phy-dw-mipi-dphy.c, which is:
> + *   Copyright (C) Alibaba Group Holding Limited.
> + */
> +
> +#include <linux/bitfield.h>
> +#include <linux/clk.h>
> +#include <linux/kernel.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/module.h>
> +#include <linux/phy/phy.h>
> +#include <linux/phy/phy-mipi-dphy.h>
> +#include <linux/platform_device.h>
> +#include <linux/regmap.h>
> +#include <linux/regulator/consumer.h>
> +
> +#include <video/mipi_display.h>
> +
> +#include <drm/bridge/dw_mipi_dsi.h>
> +#include <drm/drm_mipi_dsi.h>
> +
> +/* DSI controller registers for DPHY access */
> +
> +#define DSI_PHY_TST_CTRL0		0xb4
> +#define PHY_TESTCLK			BIT(1)
> +#define PHY_UNTESTCLK			0
> +#define PHY_TESTCLR			BIT(0)
> +#define PHY_UNTESTCLR			0
> +
> +#define DSI_PHY_TST_CTRL1		0xb8
> +#define PHY_TESTEN			BIT(16)
> +#define PHY_UNTESTEN			0
> +#define PHY_TESTDOUT(n)			(((n) & 0xff) << 8)
> +#define PHY_TESTDIN(n)			(((n) & 0xff) << 0)
> +
> +/* DPHY registers */
> +
> +#define PLL_DELAY_LP_TX_START_LP11	0x02
> +#define TXDINDLYTIME_9_2		GENMASK(7,  0)
> +
> +#define PLL_FSM_CNTRL			0x03
> +
> +#define PLL_PROP_CHARGE_PUMP_CTRL	0x0e
> +#define PLL_PROP_CNTRL			GENMASK(5,  0)
> +
> +#define PLL_INT_CHARGE_PUMP_CTRL	0x0f
> +#define PLL_INT_CNTRL			GENMASK(5,  0)
> +
> +#define PLL_VCO_CTRL			0x12
> +#define PLL_VCO_CNTRL_OVR_EN		BIT(6)
> +#define PLL_VCO_CNTRL_OVR		GENMASK(5,  0)
> +
> +#define PLL_GMP_CTRL_DIGITAL_TEST	0x13
> +#define PLL_TESTLOCK			BIT(7)
> +#define PLL_GMP_CNTRL			GENMASK(5,  4)
> +#define TSTPLLDIG			GENMASK(3,  1)
> +#define TSTPLLDIG_LOCK			(0x0 << 1)
> +#define TSTPLLDIG_REFCLK		(0x1 << 1)
> +#define TSTPLLDIG_FBCLK			(0x2 << 1)
> +#define TSTPLLDIG_INT_CLKIN		(0x3 << 1)
> +#define TSTPLLDIG_LOCK_FROM_DETECTOR	(0x4 << 1)
> +#define TSTPLLDIG_OUTPUT		(0x5 << 1)
> +#define TSTPLLDIG_BUF_VCOCLK		(0x6 << 1)
> +#define TSTPLLDIG_UPDATEPLL		(0x7 << 1)
> +
> +#define PLL_N_DIV_FSM_SIG		0x17
> +#define PLL_N_OVR			GENMASK(3,  0)
> +
> +#define PLL_M_DIV			0x18
> +#define PLL_M_OVR_4_0			GENMASK(4,  0)
> +#define PLL_M_OVR_9_5			GENMASK(4,  0)
> +
> +#define PLL_N_AND_M_DIV_CTRL		0x19
> +#define PLL_M_OVR_EN			BIT(5)
> +#define PLL_N_OVR_EN			BIT(4)
> +
> +#define PLL_CHARGE_PUMP_BIAS_CTRL	0x1c
> +#define PLL_CPBIAS_CNTRL		GENMASK(6,  0)
> +
> +#define PLL_ANALOG_PROGRAM_CONTROL	0x1f
> +#define PLL_MPLL_PROG_5_0		GENMASK(5,  0)
> +#define PLL_MPLL_PROG_11_6		GENMASK(5,  0)
> +#define PLL_MPLL_PROG_16_12		GENMASK(4,  0)
> +
> +#define HS_FREQ_RANGE_OF_OPERATION	0x44
> +#define HSFREQRANGE_OVR_EN		BIT(7)
> +#define HSFREQRANGE_OVR			GENMASK(6,  0)
> +#define HSFREQRANGE			HSFREQRANGE_OVR
> +
> +#define PG_LP_BIAS_LANE0		0x4a
> +#define PRG_ON_LANE0			BIT(6)
> +
> +#define SR_FSM_OVR_CNTRL		0xa0
> +#define SR_DDL_LOOP_CONF		0xa3
> +
> +/* syscon registers */
> +
> +#define MIPIDSI0_SYSREG			0x8
> +#define MIPIDSI1_SYSREG			0xc
> +#define MIPIDSI_HSFREQRANGE		GENMASK(9,  3)
> +#define MIPIDSI_CFGCLKFREQRANGE		GENMASK(15, 10)
> +#define MIPIDSI_CFGCLKFREQRANGE_DEF	(0x1c << 10)
> +
> +struct pll_hsfreqrange {
> +	unsigned int max_mbps;
> +	u8 hsfreqrange;
> +};
> +
> +static const struct pll_hsfreqrange hsfreqrange_table[] = {
> +	{ 80,  0x00 },
> +	{ 90,  0x10 },
> +	{ 100, 0x20 },
> +	{ 110, 0x30 },
> +	{ 120, 0x01 },
> +	{ 130, 0x11 },
> +	{ 140, 0x21 },
> +	{ 150, 0x31 },
> +	{ 160, 0x02 },
> +	{ 170, 0x12 },
> +	{ 180, 0x22 },
> +	{ 190, 0x32 },
> +	{ 205, 0x03 },
> +	{ 220, 0x13 },
> +	{ 235, 0x23 },
> +	{ 250, 0x33 },
> +	{ 275, 0x04 },
> +	{ 300, 0x14 },
> +	{ 325, 0x25 },
> +	{ 350, 0x35 },
> +	{ 400, 0x05 },
> +	{ 450, 0x16 },
> +	{ 500, 0x26 },
> +	{ 550, 0x37 },
> +	{ 600, 0x07 },
> +	{ 650, 0x18 },
> +	{ 700, 0x28 },
> +	{ 750, 0x39 },
> +	{ 800, 0x09 },
> +	{ 850, 0x19 },
> +	{ 900, 0x29 },
> +	{ 950, 0x3A },
> +	{ 1000, 0x0A },
> +	{ 1050, 0x1A },
> +	{ 1100, 0x2A },
> +	{ 1150, 0x3B },
> +	{ 1200, 0x0B },
> +	{ 1250, 0x1B },
> +	{ 1300, 0x2B },
> +	{ 1350, 0x3C },
> +	{ 1400, 0x0C },
> +	{ 1450, 0x1C },
> +	{ 1500, 0x2C },
> +	{ 1550, 0x3D },
> +	{ 1600, 0x0D },
> +	{ 1650, 0x1D },
> +	{ 1700, 0x2E },
> +	{ 1750, 0x3E },
> +	{ 1800, 0x0E },
> +	{ 1850, 0x1E },
> +	{ 1900, 0x2F },
> +	{ 1950, 0x3F },
> +	{ 2000, 0x0F },
> +	{ 2050, 0x40 },
> +	{ 2100, 0x41 },
> +	{ 2150, 0x42 },
> +	{ 2200, 0x43 },
> +	{ 2250, 0x44 },
> +	{ 2300, 0x45 },
> +	{ 2350, 0x46 },
> +	{ 2400, 0x47 },
> +	{ 2450, 0x48 },
> +	{ 2500, 0x49 },
> +};
> +
> +struct hstt {
> +	unsigned int max_mbps;
> +	struct dw_mipi_dsi_dphy_timing timing;
> +};
> +
> +#define HSTT(_max_mbps, _c_lp2hs, _c_hs2lp, _d_lp2hs, _d_hs2lp)	\
> +{					\
> +	.max_mbps = _max_mbps,		\
> +	.timing = {			\
> +		.clk_lp2hs = _c_lp2hs,	\
> +		.clk_hs2lp = _c_hs2lp,	\
> +		.data_lp2hs = _d_lp2hs,	\
> +		.data_hs2lp = _d_hs2lp,	\
> +	}				\
> +}
> +
> +static struct hstt hstt_table[] = {
> +	HSTT(80, 21, 17, 15, 10),
> +	HSTT(90, 23, 17, 16, 10),
> +	HSTT(100, 22, 17, 16, 10),
> +	HSTT(110, 25, 18, 17, 11),
> +	HSTT(120, 26, 20, 18, 11),
> +	HSTT(130, 27, 19, 19, 11),
> +	HSTT(140, 27, 19, 19, 11),
> +	HSTT(150, 28, 20, 20, 12),
> +	HSTT(160, 30, 21, 22, 13),
> +	HSTT(170, 30, 21, 23, 13),
> +	HSTT(180, 31, 21, 23, 13),
> +	HSTT(190, 32, 22, 24, 13),
> +	HSTT(205, 35, 22, 25, 13),
> +	HSTT(220, 37, 26, 27, 15),
> +	HSTT(235, 38, 28, 27, 16),
> +	HSTT(250, 41, 29, 30, 17),
> +	HSTT(275, 43, 29, 32, 18),
> +	HSTT(300, 45, 32, 35, 19),
> +	HSTT(325, 48, 33, 36, 18),
> +	HSTT(350, 51, 35, 40, 20),
> +	HSTT(400, 59, 37, 44, 21),
> +	HSTT(450, 65, 40, 49, 23),
> +	HSTT(500, 71, 41, 54, 24),
> +	HSTT(550, 77, 44, 57, 26),
> +	HSTT(600, 82, 46, 64, 27),
> +	HSTT(650, 87, 48, 67, 28),
> +	HSTT(700, 94, 52, 71, 29),
> +	HSTT(750, 99, 52, 75, 31),
> +	HSTT(800, 105, 55, 82, 32),
> +	HSTT(850, 110, 58, 85, 32),
> +	HSTT(900, 115, 58, 88, 35),
> +	HSTT(950, 120, 62, 93, 36),
> +	HSTT(1000, 128, 63, 99, 38),
> +	HSTT(1050, 132, 65, 102, 38),
> +	HSTT(1100, 138, 67, 106, 39),
> +	HSTT(1150, 146, 69, 112, 42),
> +	HSTT(1200, 151, 71, 117, 43),
> +	HSTT(1250, 153, 74, 120, 45),
> +	HSTT(1300, 160, 73, 124, 46),
> +	HSTT(1350, 165, 76, 130, 47),
> +	HSTT(1400, 172, 78, 134, 49),
> +	HSTT(1450, 177, 80, 138, 49),
> +	HSTT(1500, 183, 81, 143, 52),
> +	HSTT(1550, 191, 84, 147, 52),
> +	HSTT(1600, 194, 85, 152, 52),
> +	HSTT(1650, 201, 86, 155, 53),
> +	HSTT(1700, 208, 88, 161, 53),
> +	HSTT(1750, 212, 89, 165, 53),
> +	HSTT(1800, 220, 90, 171, 54),
> +	HSTT(1850, 223, 92, 175, 54),
> +	HSTT(1900, 231, 91, 180, 55),
> +	HSTT(1950, 236, 95, 185, 56),
> +	HSTT(2000, 243, 97, 190, 56),
> +	HSTT(2050, 248, 99, 194, 58),
> +	HSTT(2100, 252, 100, 199, 59),
> +	HSTT(2150, 259, 102, 204, 61),
> +	HSTT(2200, 266, 105, 210, 62),
> +	HSTT(2250, 269, 109, 213, 63),
> +	HSTT(2300, 272, 109, 217, 65),
> +	HSTT(2350, 281, 112, 225, 66),
> +	HSTT(2400, 283, 115, 226, 66),
> +	HSTT(2450, 282, 115, 226, 67),
> +	HSTT(2500, 281, 118, 227, 67),
> +};
> +

Where do these data come from?

-- 
Best, 
Chaoyi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
