Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACA32C4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 16:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=LF7TOQcx7Ozp3bjn3tRArtpCY1W73qy2VGoP4tgUcdY=; b=ryYHP7anQSBl6JrQV+bQbayVmh
	8UqMGL241GM1fKIw+cuxzxvcuCOfDXigwugJVPZi1npQ6iLDBqYetjhlEaolXdvF2M15XDxlD+jQx
	xU5ylEnqlXONPyrQlFyETnJ5LseSvf/5iOQU+LgZoq4WaQflnQp4aI+ssoGYxQWwGSYfVi5DkK8RS
	qljhPIck77AiDgxHqp1qfX+eVjezj2eEYH2eJT4VrkzOHF/Hs/2pFBsGB7+RxYAiV3EAiMCKCz5dQ
	SMkWPtvjISS/hD+bejemSqaFq0GT3SD6f+xLaBQ1bc16FW5Pk84PdiHh9Yn+DnNjvhez3/goYQtKL
	CQi7BQAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdr1-00G2yP-0B;
	Fri, 08 Dec 2023 16:37:31 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBdqw-00G2xG-36
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 16:37:29 +0000
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com [209.85.208.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 3597C3F4C0
	for <linux-riscv@lists.infradead.org>; Fri,  8 Dec 2023 16:37:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1702053444;
	bh=YT/kV/Dp30PwQaDY0JCP+r7zoJhVpxRRZO8hjSNjj3s=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RZrtlVhDDbvMW/NephNnD2KMXX1x+OdI8VxxF+C6dRoCGXLX5S3LaiL9EsSHEMsAd
	 zLDHY1MkpTa4t+juVpC+FyXrYeIwstlRrnPHZYNW5hx3750ZurQarheUPTACH3+hM/
	 a74ywjs90BI+7H/HGQm8qW7Oy3YzdcX1gag/UlZgQJXn30FjUto7b2DrF7Am70bhDC
	 K6zWj5eLswg0BrNRimLhAnwsLGQ3CZMOe6zR9+m9mkhr6w0oP+uDBedssYISD8JPWr
	 89zjx0SvU95txbcCitgxCUc75FwcqrzoqEEcRYDQhJKFV2rYOFyZEBat6AT5faO+iE
	 JbxlRBwG4tkSw==
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ca29456d38so19718221fa.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 08:37:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702053443; x=1702658243;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YT/kV/Dp30PwQaDY0JCP+r7zoJhVpxRRZO8hjSNjj3s=;
        b=igboLKaQe5kbJat+PzO/oM3RkM/uLKiBrySgiKX4YwQ8Mcaq1LUkK1y0XeeqVyEhFM
         IesA0msmwCJ6sMCnJNCAX/E+C8zDIjaRf68effj18mbSW1kDdLR5Pj5en4D8NKrWQXOE
         mtrYW2eiZOEKk+I9r3zMhs8hv44JJayaQVIuUz6S9EJPvtQfuudHJGQAI2D6I+udnt/O
         EXbkJfTyFjjIoYPejaXE5hbCU1ZBv7g93vW8Zsy4WiOhJLc1fTVTvT3jLgwEd7nkscEA
         NWXaxPC6Cc5830GomnYq9lzo6XKbL3h7DRvZWUqHTukMbWRKEOjS6yYP9y+Mzkk4eCR5
         pA+Q==
X-Gm-Message-State: AOJu0YzP7pAv75m8GtdDzAXJOEkOwWX1Pg0JwlibN0puUUTUglLbjrtA
	YwSzrH3mDsOYxXAtMyh8cO2V0TPCpkB9uGMPpGNrQXZmNRL58yeq4n/8dDS5GZAKVxbtLOCAY/B
	yodUflV6IlpMPQQ9dFk511uZRVrxQScUeH/2QzsJCDke6ew0kFG1NqK2DWHAe3Q==
X-Received: by 2002:ac2:598a:0:b0:50b:f7c6:2f72 with SMTP id w10-20020ac2598a000000b0050bf7c62f72mr84592lfn.106.1702053443539;
        Fri, 08 Dec 2023 08:37:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHsNnO1XfYSlnYp1dZD6tNH65TwHmtLaUUmeoX2IT5o0GoT7vAF3CO6XD1zyHCOiQ5LVIYfVi1131QZ4wUZCFs=
X-Received: by 2002:ac2:598a:0:b0:50b:f7c6:2f72 with SMTP id
 w10-20020ac2598a000000b0050bf7c62f72mr84575lfn.106.1702053443189; Fri, 08 Dec
 2023 08:37:23 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 8 Dec 2023 08:37:21 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206115000.295825-8-jeeheng.sia@starfivetech.com>
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com> <20231206115000.295825-8-jeeheng.sia@starfivetech.com>
Mime-Version: 1.0
Date: Fri, 8 Dec 2023 08:37:21 -0800
Message-ID: <CAJM55Z-FXV-Go4yj_AJyU4pRC0msHqTCT3q24HkNtBTWW9rAgA@mail.gmail.com>
Subject: Re: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100
 System-North-West clock and reset generator
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk, conor@kernel.org, 
	robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, 
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de, 
	emil.renner.berthing@canonical.com, hal.feng@starfivetech.com, 
	xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	leyfoon.tan@starfivetech.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_083727_353519_3068630E 
X-CRM114-Status: GOOD (  14.97  )
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

Sia Jee Heng wrote:
> Add bindings for the System-North-West clock and reset generator
> (SYSCRG-NW) on JH8100 SoC.
>
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++++++++++++++++

The JH7110 clocks, the JH8100 system and always-on all follow the Xcrg pattern:
syscrg
aoncrg
stgcrg
ispcrg
voutcrg
etc.

Is there a reason the north-west, north-east and south-west breaks this pattern?
I'd have expected them to be called something like
nwcrg, JH8100_NWCLK_*, JH8100_NWRST_*,
necrg, JH8100_NECLK_*, JH8100_NERST_* and
swcrg, JH8100_SWCLK_*, JH8100_SWRST_*

Just like all the other Starfive drivers.

>  .../dt-bindings/clock/starfive,jh8100-crg.h   |  45 +++++++
>  .../dt-bindings/reset/starfive,jh8100-crg.h   |  15 +++
>  3 files changed, 179 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml b/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> new file mode 100644
> index 000000000000..b16a874828dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh8100-syscrg-nw.yaml
> @@ -0,0 +1,119 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh8100-syscrg-nw.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH8100 System-North-West Clock and Reset Generator
> +
> +maintainers:
> +  - Sia Jee Heng <jeeheng.sia@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh8100-syscrg-nw
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: APB_BUS clock from SYSCRG
> +      - description: ISP_2X clock from SYSCRG
> +      - description: ISP_AXI clock from SYSCRG
> +      - description: VOUT_ROOT0 clock from SYSCRG
> +      - description: VOUT_ROOT1 clock from SYSCRG
> +      - description: VOUT_SCAN_ATS clock from SYSCRG
> +      - description: VOUT_DC_CORE clock from SYSCRG
> +      - description: VOUT_AXI clock from SYSCRG
> +      - description: AXI_400 clock from SYSCRG
> +      - description: AXI_200 clock from SYSCRG
> +      - description: Peripheral clock from SYSCRG
> +      - description: External DVP clock
> +      - description: External ISP DPHY TAP TCK clock
> +      - description: External golbal clock
> +      - description: External i2s_tscko clock
> +      - description: External VOUT MIPI DPHY TAP TCK
> +      - description: External VOUT eDP TAP TCK
> +      - description: External SPI In2 clock
> +
> +  clock-names:
> +    items:
> +      - const: clk_osc
> +      - const: sys_clk_apb_bus
> +      - const: sys_clk_isp_2x
> +      - const: sys_clk_isp_axi
> +      - const: sys_clk_vout_root0
> +      - const: sys_clk_vout_root1
> +      - const: sys_clk_vout_scan_ats
> +      - const: sys_clk_vout_dc_core
> +      - const: sys_clk_vout_axi
> +      - const: sys_clk_axi_400
> +      - const: sys_clk_axi_200
> +      - const: sys_clk_perh_root_preosc
> +      - const: clk_dvp_ext
> +      - const: clk_isp_dphy_tap_tck_ext
> +      - const: clk_glb_ext_clk
> +      - const: clk_i2s_tscko
> +      - const: clk_vout_mipi_dphy_tap_tck_ext
> +      - const: clk_vout_edp_tap_tck_ext
> +      - const: clk_spi_in2_ext
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive,jh8100-crg.h> for valid indices.
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/reset/starfive,jh8100-crg.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +  - '#reset-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh8100-crg.h>
> +
> +    clock-controller@123c0000 {
> +            compatible = "starfive,jh8100-syscrg-nw";
> +            reg = <0x123c0000 0x10000>;
> +            clocks = <&clk_osc>, <&syscrg SYSCRG_CLK_APB_BUS>,
> +                     <&syscrg SYSCRG_CLK_ISP_2X>,
> +                     <&syscrg SYSCRG_CLK_ISP_AXI>,
> +                     <&syscrg SYSCRG_CLK_VOUT_ROOT0>,
> +                     <&syscrg SYSCRG_CLK_VOUT_ROOT1>,
> +                     <&syscrg SYSCRG_CLK_VOUT_SCAN_ATS>,
> +                     <&syscrg SYSCRG_CLK_VOUT_DC_CORE>,
> +                     <&syscrg SYSCRG_CLK_VOUT_AXI>,
> +                     <&syscrg SYSCRG_CLK_AXI_400>,
> +                     <&syscrg SYSCRG_CLK_AXI_200>,
> +                     <&syscrg SYSCRG_CLK_PERH_ROOT_PREOSC>,
> +                     <&clk_dvp_ext>,
> +                     <&clk_isp_dphy_tap_tck_ext>,
> +                     <&clk_glb_ext_clk>,
> +                     <&clk_i2s_tscko>,
> +                     <&clk_vout_mipi_dphy_tap_tck_ext>,
> +                     <&clk_vout_edp_tap_tck_ext>,
> +                     <&clk_spi_in2_ext>;
> +            clock-names = "clk_osc", "sys_clk_apb_bus", "sys_clk_isp_2x",
> +                          "sys_clk_isp_axi", "sys_clk_vout_root0",
> +                          "sys_clk_vout_root1", "sys_clk_vout_scan_ats",
> +                          "sys_clk_vout_dc_core", "sys_clk_vout_axi",
> +                          "sys_clk_axi_400", "sys_clk_axi_200",
> +                          "sys_clk_perh_root_preosc", "clk_dvp_ext",
> +                          "clk_isp_dphy_tap_tck_ext", "clk_glb_ext_clk",
> +                          "clk_i2s_tscko", "clk_vout_mipi_dphy_tap_tck_ext",
> +                          "clk_vout_edp_tap_tck_ext", "clk_spi_in2_ext";
> +            #clock-cells = <1>;
> +            #reset-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh8100-crg.h b/include/dt-bindings/clock/starfive,jh8100-crg.h
> index e5bb588ce798..8417455c2409 100644
> --- a/include/dt-bindings/clock/starfive,jh8100-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh8100-crg.h
> @@ -120,4 +120,49 @@
>  #define SYSCRG_CLK_NNE_ICG_EN						108
>
>  #define SYSCRG_CLK_END							109
> +
> +/* SYSCRG_NW_CLK */
> +#define SYSCRG_NW_CLK_PLL5_DIV2						0
> +#define SYSCRG_NW_CLK_GCLK5						1
> +#define SYSCRG_NW_CLK_GPIO_100						2
> +#define SYSCRG_NW_CLK_GPIO_50						3
> +#define SYSCRG_NW_CLK_GPIO_150						4
> +#define SYSCRG_NW_CLK_GPIO_60						5
> +#define SYSCRG_NW_CLK_IOMUX_WEST_PCLK					6
> +#define SYSCRG_NW_CLK_I2C6_APB						7
> +#define SYSCRG_NW_CLK_I2C7_APB						8
> +#define SYSCRG_NW_CLK_SPI2_APB						9
> +#define SYSCRG_NW_CLK_SPI2_CORE						10
> +#define SYSCRG_NW_CLK_SPI2_SCLK_IN					11
> +#define SYSCRG_NW_CLK_SMBUS1_APB					12
> +#define SYSCRG_NW_CLK_SMBUS1_CORE					13
> +#define SYSCRG_NW_CLK_ISP_DVP						14
> +#define SYSCRG_NW_CLK_ISP_CORE_2X					15
> +#define SYSCRG_NW_CLK_ISP_AXI						16
> +#define SYSCRG_NW_CLK_ISP_DPHY_TAP_TCK					17
> +#define SYSCRG_NW_CLK_FLEXNOC_ISPSLV					18
> +#define SYSCRG_NW_CLK_VOUT_PIX0						19
> +#define SYSCRG_NW_CLK_VOUT_PIX1						20
> +#define SYSCRG_NW_CLK_VOUT_SCAN_ATS					21
> +#define SYSCRG_NW_CLK_VOUT_DC_CORE					22
> +#define SYSCRG_NW_CLK_VOUT_APB						23
> +#define SYSCRG_NW_CLK_VOUT_DSI						24
> +#define SYSCRG_NW_CLK_VOUT_AHB						25
> +#define SYSCRG_NW_CLK_VOUT_AXI						26
> +#define SYSCRG_NW_CLK_VOUT_MIPI_DPHY_TAP_TCK				27
> +#define SYSCRG_NW_CLK_VOUT_EDP_PHY_TAP_TCK				28
> +#define SYSCRG_NW_CLK_UART5_CORE_PREOSC					29
> +#define SYSCRG_NW_CLK_UART5_APB						30
> +#define SYSCRG_NW_CLK_UART5_CORE					31
> +#define SYSCRG_NW_CLK_UART6_CORE_PREOSC					32
> +#define SYSCRG_NW_CLK_UART6_APB						33
> +#define SYSCRG_NW_CLK_UART6_CORE					34
> +#define SYSCRG_NW_CLK_SPI2_ICG_EN					35
> +#define SYSCRG_NW_CLK_SMBUS1_ICG_EN					36
> +#define SYSCRG_NW_CLK_ISP_ICG_EN					37
> +#define SYSCRG_NW_CLK_VOUT_ICG_EN					38
> +#define SYSCRG_NW_CLK_UART5_ICG_EN					39
> +#define SYSCRG_NW_CLK_UART6_ICG_EN					40
> +
> +#define SYSCRG_NW_CLK_END						41
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH8100_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh8100-crg.h b/include/dt-bindings/reset/starfive,jh8100-crg.h
> index 3b7b92488e76..8c3a858bdf6a 100644
> --- a/include/dt-bindings/reset/starfive,jh8100-crg.h
> +++ b/include/dt-bindings/reset/starfive,jh8100-crg.h
> @@ -20,4 +20,19 @@
>
>  #define SYSCRG_RESET_NR_RESETS					8
>
> +/*
> + * syscrg_nw: assert0
> + */
> +#define SYSCRG_NW_RSTN_PRESETN					0
> +#define SYSCRG_NW_RSTN_SYS_IOMUX_W				1
> +#define SYSCRG_NW_RSTN_I2C6					2
> +#define SYSCRG_NW_RSTN_I2C7					3
> +#define SYSCRG_NW_RSTN_SPI2					4
> +#define SYSCRG_NW_RSTN_SMBUS1					5
> +#define SYSCRG_NW_RSTN_UART5					6
> +#define SYSCRG_NW_RSTN_UART6					7
> +#define SYSCRG_NW_RSTN_MERAK0_TVSENSOR				8
> +#define SYSCRG_NW_RSTN_MERAK1_TVSENSOR				9
> +
> +#define SYSCRG_NW_RESET_NR_RESETS				10
>  #endif /* __DT_BINDINGS_RESET_STARFIVE_JH8100_H__ */
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
