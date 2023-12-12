Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0395C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Dec 2023 02:48:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:In-Reply-To:References:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VPjZlEGh7pEpRmLOjSMf0cbXv9p4sLjckveIVafXtLY=; b=N6A6DZIuEZ0giN
	WHsF0qO0c3hpO4O0cEinhdJeSNGV49Tff3ho3ubPhk06HDch0YyrI/pCpmha7sDZMZg4EnaYgxgYQ
	a8tCiC7gxdJKBsy78IgF2LVu37o7BYZuwJLk7dk+wDXq0VzwWh99vxh/wHnCkO1ppS6YB+5CW/jX+
	VWHPSF+9WVt2g4H2pp4wmGElCiId8n+ATnYRMeoscFAQksYk+Sxh/hlrs5BfR+zHHnLIxh+d51gpO
	BuW8bjSodZTArKBzyib+0+JoPUSvtvbAUb1qZzhXVoCer97V257K0VK+wz9MAunkcD+2nFFZR8+aj
	4d1yxNUgxcTy9OUQysZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsot-00AZWK-2O;
	Tue, 12 Dec 2023 02:48:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCsoo-00AZTX-0H
	for linux-riscv@lists.infradead.org;
	Tue, 12 Dec 2023 02:48:25 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 4D42B24E29B;
	Tue, 12 Dec 2023 10:48:03 +0800 (CST)
Received: from EXMBX071.cuchost.com (172.16.6.81) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 10:48:03 +0800
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX071.cuchost.com
 (172.16.6.81) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 12 Dec
 2023 10:48:02 +0800
Received: from EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f]) by
 EXMBX066.cuchost.com ([fe80::5947:9245:907e:339f%17]) with mapi id
 15.00.1497.044; Tue, 12 Dec 2023 10:48:02 +0800
From: JeeHeng Sia <jeeheng.sia@starfivetech.com>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, "kernel@esmil.dk"
	<kernel@esmil.dk>, "conor@kernel.org" <conor@kernel.org>,
	"robh+dt@kernel.org" <robh+dt@kernel.org>,
	"krzysztof.kozlowski+dt@linaro.org" <krzysztof.kozlowski+dt@linaro.org>,
	"paul.walmsley@sifive.com" <paul.walmsley@sifive.com>, "palmer@dabbelt.com"
	<palmer@dabbelt.com>, "aou@eecs.berkeley.edu" <aou@eecs.berkeley.edu>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org"
	<sboyd@kernel.org>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
	"emil.renner.berthing@canonical.com" <emil.renner.berthing@canonical.com>,
	Hal Feng <hal.feng@starfivetech.com>, Xingyu Wu <xingyu.wu@starfivetech.com>
CC: "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, Leyfoon Tan
	<leyfoon.tan@starfivetech.com>
Subject: RE: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100
 System-North-West clock and reset generator
Thread-Topic: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100
 System-North-West clock and reset generator
Thread-Index: AQHaKDqBLsc6ZLEdqkC8Pa2wy7o0rrCfKGcAgAW9vxA=
Date: Tue, 12 Dec 2023 02:48:02 +0000
Message-ID: <f84dd621094745b2b0328ae9f47a7143@EXMBX066.cuchost.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-8-jeeheng.sia@starfivetech.com>
 <452ec1ad-2f01-4f18-be16-94fb7cc583e1@linaro.org>
In-Reply-To: <452ec1ad-2f01-4f18-be16-94fb7cc583e1@linaro.org>
Accept-Language: en-US, zh-CN
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [202.188.176.82]
x-yovoleruleagent: yovoleflag
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_184822_638111_0C6745F8 
X-CRM114-Status: GOOD (  19.19  )
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



> -----Original Message-----
> From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Sent: Saturday, December 9, 2023 1:54 AM
> To: JeeHeng Sia <jeeheng.sia@starfivetech.com>; kernel@esmil.dk; conor@kernel.org; robh+dt@kernel.org;
> krzysztof.kozlowski+dt@linaro.org; paul.walmsley@sifive.com; palmer@dabbelt.com; aou@eecs.berkeley.edu;
> mturquette@baylibre.com; sboyd@kernel.org; p.zabel@pengutronix.de; emil.renner.berthing@canonical.com; Hal Feng
> <hal.feng@starfivetech.com>; Xingyu Wu <xingyu.wu@starfivetech.com>
> Cc: linux-riscv@lists.infradead.org; devicetree@vger.kernel.org; linux-kernel@vger.kernel.org; linux-clk@vger.kernel.org; Leyfoon Tan
> <leyfoon.tan@starfivetech.com>
> Subject: Re: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100 System-North-West clock and reset generator
> 
> On 06/12/2023 12:49, Sia Jee Heng wrote:
> > Add bindings for the System-North-West clock and reset generator
> > (SYSCRG-NW) on JH8100 SoC.
> >
> > Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> > ---
> >  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++++++++++++++++
> >  .../dt-bindings/clock/starfive,jh8100-crg.h   |  45 +++++++
> >  .../dt-bindings/reset/starfive,jh8100-crg.h   |  15 +++
> >  3 files changed, 179 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> b/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> > new file mode 100644
> > index 000000000000..b16a874828dd
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> > @@ -0,0 +1,119 @@
> > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/starfive,jh8100-syscrg-nw.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: StarFive JH8100 System-North-West Clock and Reset Generator
> > +
> > +maintainers:
> > +  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
> > +
> > +properties:
> > +  compatible:
> > +    const: starfive,jh8100-syscrg-nw
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: Main Oscillator (24 MHz)
> > +      - description: APB_BUS clock from SYSCRG
> > +      - description: ISP_2X clock from SYSCRG
> > +      - description: ISP_AXI clock from SYSCRG
> > +      - description: VOUT_ROOT0 clock from SYSCRG
> > +      - description: VOUT_ROOT1 clock from SYSCRG
> > +      - description: VOUT_SCAN_ATS clock from SYSCRG
> > +      - description: VOUT_DC_CORE clock from SYSCRG
> > +      - description: VOUT_AXI clock from SYSCRG
> > +      - description: AXI_400 clock from SYSCRG
> > +      - description: AXI_200 clock from SYSCRG
> > +      - description: Peripheral clock from SYSCRG
> > +      - description: External DVP clock
> > +      - description: External ISP DPHY TAP TCK clock
> > +      - description: External golbal clock
> > +      - description: External i2s_tscko clock
> > +      - description: External VOUT MIPI DPHY TAP TCK
> > +      - description: External VOUT eDP TAP TCK
> > +      - description: External SPI In2 clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: clk_osc
> > +      - const: sys_clk_apb_bus
> > +      - const: sys_clk_isp_2x
> > +      - const: sys_clk_isp_axi
> > +      - const: sys_clk_vout_root0
> > +      - const: sys_clk_vout_root1
> > +      - const: sys_clk_vout_scan_ats
> > +      - const: sys_clk_vout_dc_core
> > +      - const: sys_clk_vout_axi
> > +      - const: sys_clk_axi_400
> > +      - const: sys_clk_axi_200
> > +      - const: sys_clk_perh_root_preosc
> > +      - const: clk_dvp_ext
> > +      - const: clk_isp_dphy_tap_tck_ext
> > +      - const: clk_glb_ext_clk
> > +      - const: clk_i2s_tscko
> > +      - const: clk_vout_mipi_dphy_tap_tck_ext
> > +      - const: clk_vout_edp_tap_tck_ext
> > +      - const: clk_spi_in2_ext
> 
> Same comments as for other patch.
Noted.
> 
> > +
> > +  '#clock-cells':
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/clock/starfive,jh8100-crg.h> for valid indices.
> > +
> > +  '#reset-cells':
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/reset/starfive,jh8100-crg.h> for valid indices.
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - '#clock-cells'
> > +  - '#reset-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/starfive,jh8100-crg.h>
> > +
> > +    clock-controller@123c0000 {
> > +            compatible = "starfive,jh8100-syscrg-nw";
> 
> Same comments as for other patch.
Noted.
> 
> 
> > +            reg = <0x123c0000 0x10000>;
> > +            clocks = <&clk_osc>, <&syscrg SYSCRG_CLK_APB_BUS>,
> > +                     <&syscrg SYSCRG_CLK_ISP_2X>,
> > +                     <&syscrg SYSCRG_CLK_ISP_AXI>,
> > +                     <&syscrg SYSCRG_CLK_VOUT_ROOT0>,
> > +                     <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
> > +                     <&syscrg SYSCRG_CLK_VOUT_SCAN_ATS>,
> > +                     <&syscrg SYSCRG_CLK_VOUT_DC_CORE>,
> > +                     <&syscrg SYSCRG_CLK_VOUT_AXI>,
> > +                     <&syscrg SYSCRG_CLK_AXI_400>,
> > +                     <&syscrg SYSCRG_CLK_AXI_200>,
> > +                     <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
> > +                     <&clk_dvp_ext>,
> > +                     <&clk_isp_dphy_tap_tck_ext>,
> > +                     <&clk_glb_ext_clk>,
> > +                     <&clk_i2s_tscko>,
> > +                     <&clk_vout_mipi_dphy_tap_tck_ext>,
> > +                     <&clk_vout_edp_tap_tck_ext>,
> > +                     <&clk_spi_in2_ext>;
> > +            clock-names = "clk_osc", "sys_clk_apb_bus", "sys_clk_isp_2x",
> > +                          "sys_clk_isp_axi", "sys_clk_vout_root0",
> > +                          "sys_clk_vout_root1", "sys_clk_vout_scan_ats",
> > +                          "sys_clk_vout_dc_core", "sys_clk_vout_axi",
> > +                          "sys_clk_axi_400", "sys_clk_axi_200",
> > +                          "sys_clk_perh_root_preosc", "clk_dvp_ext",
> > +                          "clk_isp_dphy_tap_tck_ext", "clk_glb_ext_clk",
> > +                          "clk_i2s_tscko", "clk_vout_mipi_dphy_tap_tck_ext",
> > +                          "clk_vout_edp_tap_tck_ext", "clk_spi_in2_ext";
> > +            #clock-cells = <1>;
> > +            #reset-cells = <1>;
> > +    };
> > diff --git a/include/dt-bindings/clock/starfive,jh8100-crg.h b/include/dt-bindings/clock/starfive,jh8100-crg.h
> > index e5bb588ce798..8417455c2409 100644
> > --- a/include/dt-bindings/clock/starfive,jh8100-crg.h
> > +++ b/include/dt-bindings/clock/starfive,jh8100-crg.h
> > @@ -120,4 +120,49 @@
> >  #define SYSCRG_CLK_NNE_ICG_EN						108
> >
> >  #define SYSCRG_CLK_END							109
> > +
> > +/* SYSCRG_NW_CLK */
> > +#define SYSCRG_NW_CLK_PLL5_DIV2						0
> > +#define SYSCRG_NW_CLK_GCLK5						1
> > +#define SYSCRG_NW_CLK_GPIO_100						2
> > +#define SYSCRG_NW_CLK_GPIO_50						3
> > +#define SYSCRG_NW_CLK_GPIO_150						4
> > +#define SYSCRG_NW_CLK_GPIO_60						5
> > +#define SYSCRG_NW_CLK_IOMUX_WEST_PCLK					6
> > +#define SYSCRG_NW_CLK_I2C6_APB						7
> > +#define SYSCRG_NW_CLK_I2C7_APB						8
> > +#define SYSCRG_NW_CLK_SPI2_APB						9
> > +#define SYSCRG_NW_CLK_SPI2_CORE						10
> > +#define SYSCRG_NW_CLK_SPI2_SCLK_IN					11
> > +#define SYSCRG_NW_CLK_SMBUS1_APB					12
> > +#define SYSCRG_NW_CLK_SMBUS1_CORE					13
> > +#define SYSCRG_NW_CLK_ISP_DVP						14
> > +#define SYSCRG_NW_CLK_ISP_CORE_2X					15
> > +#define SYSCRG_NW_CLK_ISP_AXI						16
> > +#define SYSCRG_NW_CLK_ISP_DPHY_TAP_TCK					17
> > +#define SYSCRG_NW_CLK_FLEXNOC_ISPSLV					18
> > +#define SYSCRG_NW_CLK_VOUT_PIX0						19
> > +#define SYSCRG_NW_CLK_VOUT_PIX1						20
> > +#define SYSCRG_NW_CLK_VOUT_SCAN_ATS					21
> > +#define SYSCRG_NW_CLK_VOUT_DC_CORE					22
> > +#define SYSCRG_NW_CLK_VOUT_APB						23
> > +#define SYSCRG_NW_CLK_VOUT_DSI						24
> > +#define SYSCRG_NW_CLK_VOUT_AHB						25
> > +#define SYSCRG_NW_CLK_VOUT_AXI						26
> > +#define SYSCRG_NW_CLK_VOUT_MIPI_DPHY_TAP_TCK				27
> > +#define SYSCRG_NW_CLK_VOUT_EDP_PHY_TAP_TCK				28
> > +#define SYSCRG_NW_CLK_UART5_CORE_PREOSC					29
> > +#define SYSCRG_NW_CLK_UART5_APB						30
> > +#define SYSCRG_NW_CLK_UART5_CORE					31
> > +#define SYSCRG_NW_CLK_UART6_CORE_PREOSC					32
> > +#define SYSCRG_NW_CLK_UART6_APB						33
> > +#define SYSCRG_NW_CLK_UART6_CORE					34
> > +#define SYSCRG_NW_CLK_SPI2_ICG_EN					35
> > +#define SYSCRG_NW_CLK_SMBUS1_ICG_EN					36
> > +#define SYSCRG_NW_CLK_ISP_ICG_EN					37
> > +#define SYSCRG_NW_CLK_VOUT_ICG_EN					38
> > +#define SYSCRG_NW_CLK_UART5_ICG_EN					39
> > +#define SYSCRG_NW_CLK_UART6_ICG_EN					40
> > +
> > +#define SYSCRG_NW_CLK_END						41
> 
> Same comments as for other patch.
Noted.
> 
> 
> >  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH8100_H__ */
> > diff --git a/include/dt-bindings/reset/starfive,jh8100-crg.h b/include/dt-bindings/reset/starfive,jh8100-crg.h
> > index 3b7b92488e76..8c3a858bdf6a 100644
> > --- a/include/dt-bindings/reset/starfive,jh8100-crg.h
> > +++ b/include/dt-bindings/reset/starfive,jh8100-crg.h
> > @@ -20,4 +20,19 @@
> >
> >  #define SYSCRG_RESET_NR_RESETS					8
> >
> > +/*
> > + * syscrg_nw: assert0
> > + */
> > +#define SYSCRG_NW_RSTN_PRESETN					0
> > +#define SYSCRG_NW_RSTN_SYS_IOMUX_W				1
> > +#define SYSCRG_NW_RSTN_I2C6					2
> > +#define SYSCRG_NW_RSTN_I2C7					3
> > +#define SYSCRG_NW_RSTN_SPI2					4
> > +#define SYSCRG_NW_RSTN_SMBUS1					5
> > +#define SYSCRG_NW_RSTN_UART5					6
> > +#define SYSCRG_NW_RSTN_UART6					7
> > +#define SYSCRG_NW_RSTN_MERAK0_TVSENSOR				8
> > +#define SYSCRG_NW_RSTN_MERAK1_TVSENSOR				9
> > +
> > +#define SYSCRG_NW_RESET_NR_RESETS				10
> 
> Same comments as for other patch.
Noted.
> 
> 
> 
> Best regards,
> Krzysztof

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
