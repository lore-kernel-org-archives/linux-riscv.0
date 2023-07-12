Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A36F0EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:52:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oiapN7TfIHDmd1FVwEbN3R/8K+VuTMYzSOHTdXjPTTM=; b=MJPs3xCf0gBePk
	BZ4KIgR588sxkrn9U2ayWAyXckssrRK1reaG+7ARhG5Ssc5KKPiC6fhrwhaDptBJ4k+A76y9LEqkh
	V9IecrTm1mps1yisOWSiOj+QAShl4P+89fJlN97hgue4L53D1L4+/mWQ3KCqfUIsbgLEKInsul+sy
	pQveQ20FvenOZe261ncBgIdpy9yqWq78mBgXy6oAyHFktR59gyr0jibCyWPctU1b29sCA3NS+jZe3
	TYfaeCZO3KGCUF3hLUBnH4KxBNMNH2phrkzCzaznqpZx7sAfTSYjzX/WhlJOLlt/T5dlO6Inm0t5o
	gw160hhiNRj2B6vFlJog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJe0j-000olx-01;
	Wed, 12 Jul 2023 17:52:21 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJe0f-000ok4-1T
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:52:19 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DB9943F438
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 17:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689184335;
	bh=l5M3IqZkSZTNpK4Rgfb/490i8YL19SZAjTybhYdRe5U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=wK8ZO80lAOJ0yp5UPp+rv9Rd37L/egS88c24HnFw+Nzt1DExLQU0p7Je2+j7cCrEI
	 RKTFjnb7zWpHHs8GRQmX4q2S1SjUso81almXzMcOZuzDq+omeQ6cFi0h9x8Jetpm4L
	 Qv6a9vIK9lpGY628RA8Dcj62n2Ri/6sIsG5TwBraZdh/4Jx2dieokH0tXpG96X06Hb
	 nx3jW7+Zuiiqwd+/6LXVJ62Bqw/Ea2oSgBbf2sCM1gHXrno7eZ2YYWEwB4nHKo23HO
	 9oIAD2jmCSOd+9gpi1WAps/55oRPmuvESvrxK+K/HUkHPZ+CaKrGHV8ERciBAuBDKW
	 avn9OaJe+mfiw==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-403ad49c647so39865051cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:52:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689184335; x=1691776335;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=l5M3IqZkSZTNpK4Rgfb/490i8YL19SZAjTybhYdRe5U=;
        b=dGtHQ2wQNv4tw4LBMXnO2kOuCYnJushBgsP6Cs+BixolOarcsxITLA63GD9WLAsz8v
         Q970ZhTUTreBxZuzm2PL4du1LNHjZUauNmZJM/kgAIvIkZ+KRyM+fXBBc1+zBlb+Cdtp
         uhHIdrlTUHXHTkYYjGGOwqdxPdz5V7GONhNh5EuPJTkf53N/TCS+W7unc8Sg0amUhERh
         mOhAxQAdY1Wd9SPfo9FriZqyPB5tXG3WFqaqBGsx+IPmXgFEnelhHjqxn0FjqrEjpC0J
         38I+mOge1V2KdYV+4uBn4UpLzsQq4yL79eQRNKqInYVKQ7IXSqtzNnWowRxpLAv+q0kg
         iDUA==
X-Gm-Message-State: ABy/qLYj+uu+2Iviu0pN5PLmh3PCnOcjX9DZ3qH/9PYyRDQ4sqWnLRZR
	G9G+mZaP0ak/vJVY1st9Bqlrf731AHnx+7zLf5/7xekX8/9YlGnpD0l8a0MgImlNhfsKh2PQ/eA
	uLpDqh24OQMVshxyFhXtfQZ34TmcCMatl3eY/+6ce3ANcy/jjEEjb4x7rxc9qtA==
X-Received: by 2002:a05:622a:54e:b0:402:d15e:2982 with SMTP id m14-20020a05622a054e00b00402d15e2982mr23069230qtx.25.1689184335021;
        Wed, 12 Jul 2023 10:52:15 -0700 (PDT)
X-Google-Smtp-Source: APBJJlG3uMj4FGxQKvZ4HRowGrH0Fv5CI+N5D+ut6hhpgRCwd5Z3AsHez8thKYRxHUQtDfruIfQQPmR8RGBKrnRhhxg=
X-Received: by 2002:a05:622a:54e:b0:402:d15e:2982 with SMTP id
 m14-20020a05622a054e00b00402d15e2982mr23069219qtx.25.1689184334781; Wed, 12
 Jul 2023 10:52:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-4-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-4-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 19:51:58 +0200
Message-ID: <CAJM55Z8TwKUzPjg4LdjrgV98D_oLr3ZBervOKwXHx+K9-Ddjew@mail.gmail.com>
Subject: Re: [PATCH v7 3/9] dt-bindings: clock: Add StarFive JH7110
 Image-Signal-Process clock and reset generator
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230712_105217_644727_4B62811F 
X-CRM114-Status: GOOD (  19.60  )
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

On Wed, 12 Jul 2023 at 11:22, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
>
> Add bindings for the Image-Signal-Process clock and reset
> generator (ISPCRG) on the JH7110 RISC-V SoC by StarFive Ltd.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-ispcrg.yaml         | 87 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 ++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
>  3 files changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
> new file mode 100644
> index 000000000000..3b8b85be5cd0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
> @@ -0,0 +1,87 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-ispcrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Image-Signal-Process Clock and Reset Generator
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-ispcrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ISP Top core
> +      - description: ISP Top Axi
> +      - description: NOC ISP Bus
> +      - description: external DVP
> +
> +  clock-names:
> +    items:
> +      - const: isp_top_core
> +      - const: isp_top_axi
> +      - const: noc_bus_isp_axi
> +      - const: dvp_clk
> +
> +  resets:
> +    items:
> +      - description: ISP Top core
> +      - description: ISP Top Axi
> +      - description: NOC ISP Bus
> +
> +  '#clock-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/starfive,jh7110-crg.h> for valid indices.
> +
> +  '#reset-cells':
> +    const: 1
> +    description:
> +      See <dt-bindings/reset/starfive,jh7110-crg.h> for valid indices.
> +
> +  power-domains:
> +    maxItems: 1
> +    description:
> +      ISP domain power
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - '#clock-cells'
> +  - '#reset-cells'
> +  - power-domains
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/power/starfive,jh7110-pmu.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    ispcrg: clock-controller@19810000 {
> +        compatible = "starfive,jh7110-ispcrg";
> +        reg = <0x19810000 0x10000>;
> +        clocks = <&syscrg JH7110_SYSCLK_ISP_TOP_CORE>,
> +                 <&syscrg JH7110_SYSCLK_ISP_TOP_AXI>,
> +                 <&syscrg JH7110_SYSCLK_NOC_BUS_ISP_AXI>,
> +                 <&dvp_clk>;
> +        clock-names = "isp_top_core", "isp_top_axi",
> +                      "noc_bus_isp_axi", "dvp_clk";
> +        resets = <&syscrg JH7110_SYSRST_ISP_TOP>,
> +                 <&syscrg JH7110_SYSRST_ISP_TOP_AXI>,
> +                 <&syscrg JH7110_SYSRST_NOC_BUS_ISP_AXI>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        power-domains = <&pwrc JH7110_PD_ISP>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 6c8e8b4cf1f6..39acf30db491 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -252,4 +252,22 @@
>
>  #define JH7110_STGCLK_END                      29
>
> +/* ISPCRG clocks */
> +#define JH7110_ISPCLK_DOM4_APB_FUNC            0
> +#define JH7110_ISPCLK_MIPI_RX0_PXL             1
> +#define JH7110_ISPCLK_DVP_INV                  2
> +#define JH7110_ISPCLK_M31DPHY_CFG_IN           3
> +#define JH7110_ISPCLK_M31DPHY_REF_IN           4
> +#define JH7110_ISPCLK_M31DPHY_TX_ESC_LAN0      5
> +#define JH7110_ISPCLK_VIN_APB                  6
> +#define JH7110_ISPCLK_VIN_SYS                  7
> +#define JH7110_ISPCLK_VIN_PIXEL_IF0            8
> +#define JH7110_ISPCLK_VIN_PIXEL_IF1            9
> +#define JH7110_ISPCLK_VIN_PIXEL_IF2            10
> +#define JH7110_ISPCLK_VIN_PIXEL_IF3            11
> +#define JH7110_ISPCLK_VIN_P_AXI_WR             12
> +#define JH7110_ISPCLK_ISPV2_TOP_WRAPPER_C      13
> +
> +#define JH7110_ISPCLK_END                      14
> +
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
> index 4e96ab81dd8e..2c5d9dcefffa 100644
> --- a/include/dt-bindings/reset/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
> @@ -179,4 +179,20 @@
>
>  #define JH7110_STGRST_END                      23
>
> +/* ISPCRG resets */
> +#define JH7110_ISPRST_ISPV2_TOP_WRAPPER_P      0
> +#define JH7110_ISPRST_ISPV2_TOP_WRAPPER_C      1
> +#define JH7110_ISPRST_M31DPHY_HW               2
> +#define JH7110_ISPRST_M31DPHY_B09_AON          3
> +#define JH7110_ISPRST_VIN_APB                  4
> +#define JH7110_ISPRST_VIN_PIXEL_IF0            5
> +#define JH7110_ISPRST_VIN_PIXEL_IF1            6
> +#define JH7110_ISPRST_VIN_PIXEL_IF2            7
> +#define JH7110_ISPRST_VIN_PIXEL_IF3            8
> +#define JH7110_ISPRST_VIN_SYS                  9
> +#define JH7110_ISPRST_VIN_P_AXI_RD             10
> +#define JH7110_ISPRST_VIN_P_AXI_WR             11
> +
> +#define JH7110_ISPRST_END                      12
> +
>  #endif /* __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__ */
> --
> 2.25.1
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
