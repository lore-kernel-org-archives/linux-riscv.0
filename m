Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D064AC4167B
	for <linux-riscv@archiver.kernel.org>; Fri,  8 Dec 2023 17:53:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jdXeCX3xpEVgGRwkywHfeSdLkSn5URlzBRDohnfa0ao=; b=pWHLMecZOZ9/H+
	S7R1HqaPJxHSeZfw995Do2UUdyEVf0fHb1NtshroHTM8wexbnCGWUFZXs7tMXsxzZf6UJSfqbzKA+
	6pmTy9OnQdElNbApIy9o2ypFb9kwxfoLKrDf7MBK8CLzbskOV+s4h5HCcH3UVs5SWBB0bg3dgLbm6
	LfWa8fNNYDNGj7n0A3dd44qAtNBDvbWCCeRHBpU74ELnpvbhmk7sQ6J/H5IhHs9rF8OdeCYUFsCTL
	4FBVeQHxI2Rto2n9mYYUYKIKP6jV2u8Id7M+4WIKuhm6K+DuEQypkULqigO3dFFPXWQv7YiNRouKu
	CzDnb7X7AZv/Gw/40VFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rBf2t-00GEWr-2g;
	Fri, 08 Dec 2023 17:53:51 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rBf2r-00GEWO-0W
	for linux-riscv@lists.infradead.org;
	Fri, 08 Dec 2023 17:53:51 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-40c25973988so25061295e9.2
        for <linux-riscv@lists.infradead.org>; Fri, 08 Dec 2023 09:53:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702058026; x=1702662826; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GqoGSElDnWPEcFeuWY8Lzx1hjYSPo7bWLt2+QwAl7kk=;
        b=ForP1C9bRSJJIM86uhgFJ0CxmvO+pHxx4tpiNqCdc962IpXi6o0/cGikw7Q6yJyV3N
         IuyUhBsb6IaicgCFV3idlaGS+MFlMy1G1IPx/26bbbLCIvpm0p9wYkOpr83Z7k/XUS0c
         4SVfMDEhRhVFp057/UaAEjVMkgcjToV0eOjShxFca9G2ZdsjVLuxcpcvL4PSqIRw2xEE
         iNWw1QBPbbnJn6LKMF7LtP4Rl2DyEmY3+0evh3r4ayPL66zAlqhBORveZz5Qzqsk58/y
         h0Tv6P9EGi3h4dKuBOfFPV193Q1EhoGl6PaVg1DXbnANfqIPDQngx45/46MqkQsHCnH9
         iRcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702058026; x=1702662826;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GqoGSElDnWPEcFeuWY8Lzx1hjYSPo7bWLt2+QwAl7kk=;
        b=chaYb/OKG68mpg7PsbRYtQtkaSjwnw/yBoc2hM5vUE4hsfyrHa1jzYH7Jx2ch8GmcT
         IzgcK3bk5hFqo6SkCmVq8cB+kpFpk8lcfmIX8gi3MXRje3YPeKs1UXy7ZRKvDS0aFCGM
         q6AZGFXYHbBjPA47+awArSqq+WoWFa/S7zxO5W7X92DT5KZsPBy9F7KKZRFINkrAycVH
         028p4P32NbRW6t7kX/nMmrs32C9kXgm/pmbd59fHvxPw+ycb2viD6lVEElybM3jb0wkl
         Vpeha0rWvqvp83ZwySQ0ZzoHeCY/Q+q67Isl8d3E8UUYUkzu40d3zIviYq6PEN0XZJQ7
         nzBw==
X-Gm-Message-State: AOJu0YwtJ3cOpLUwebGtgM+AmVb2ViEprfYc/f7gmUUG6TIkcY8ax1BJ
	QZ6VTVcK8ptG4P0q8rqGlbKE3Q==
X-Google-Smtp-Source: AGHT+IGqNrWoWjJdSSkzLrjKCmXLyc9cqrRXnhhV3P2b7kG5wRr44h3xu7WbND3ZYS4JeICc/dRHHQ==
X-Received: by 2002:a1c:770b:0:b0:40c:7a3:888e with SMTP id t11-20020a1c770b000000b0040c07a3888emr183974wmi.148.1702058025844;
        Fri, 08 Dec 2023 09:53:45 -0800 (PST)
Received: from [192.168.1.20] ([178.197.218.27])
        by smtp.gmail.com with ESMTPSA id rf19-20020a1709076a1300b00a1f75d21bf3sm498896ejc.6.2023.12.08.09.53.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Dec 2023 09:53:45 -0800 (PST)
Message-ID: <452ec1ad-2f01-4f18-be16-94fb7cc583e1@linaro.org>
Date: Fri, 8 Dec 2023 18:53:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 07/16] dt-bindings: clock: Add StarFive JH8100
 System-North-West clock and reset generator
Content-Language: en-US
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>, kernel@esmil.dk,
 conor@kernel.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
 paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
 emil.renner.berthing@canonical.com, hal.feng@starfivetech.com,
 xingyu.wu@starfivetech.com
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 leyfoon.tan@starfivetech.com
References: <20231206115000.295825-1-jeeheng.sia@starfivetech.com>
 <20231206115000.295825-8-jeeheng.sia@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Autocrypt: addr=krzysztof.kozlowski@linaro.org; keydata=
 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
 D2GYIS41Kv4Isx2dEFh+/Q==
In-Reply-To: <20231206115000.295825-8-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231208_095349_213175_ED51D7B9 
X-CRM114-Status: GOOD (  15.05  )
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

On 06/12/2023 12:49, Sia Jee Heng wrote:
> Add bindings for the System-North-West clock and reset generator
> (SYSCRG-NW) on JH8100 SoC.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> Reviewed-by: Ley Foon Tan <leyfoon.tan@starfivetech.com>
> ---
>  .../clock/starfive,jh8100-syscrg-nw.yaml      | 119 ++++++++++++++++++
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

Same comments as for other patch.

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

Same comments as for other patch.


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

Same comments as for other patch.


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

Same comments as for other patch.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
