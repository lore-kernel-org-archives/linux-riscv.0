Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E1DBC7EE36
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 15:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+DgA57EeogXpUFft+EVLsnvMxX3/QAy9hMSRXCRfuW0=; b=Ge4kzzAlu/TMNB
	7BCHjuQJWdkg0M6XQ1uy14H6VJlDw6Dui8KJSNbRe2KbqepJ6ez5KCqO5Kj8FspTVcHYHdfW9eGt0
	O2NZesVMtkUK7UDpH58LrUOMqlNfZVUHBE5mfaoVn0E30z0N0aNQkFGmFy6NRVYpTr9OWyR+pJAwk
	RCgp+BY78D/RMVUe6nmoSfc4tRZ7Y1Kzjpl+LATrELwsjqt15OSanQOMjqBli/h2fQttE9LRjpnnN
	UnCytD7d1t/ONFZgU6IcTjNo7zdUA4xZwXSKiwroS8EpZd/8+yV1sqMJBqdy1eGd2bRQTpb7+juw7
	kH5PtKoQXAQ3crEZLlow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkVD-002Zfb-4Z; Thu, 02 Mar 2023 15:05:51 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXkV9-002ZcG-7A
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 15:05:50 +0000
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 484663F209
	for <linux-riscv@lists.infradead.org>; Thu,  2 Mar 2023 15:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1677769540;
	bh=ennINZICblkLNJRKAL6C7ysXY/vpm4KR2muFA6qF6vI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=EZyd6UebuPiuudYZItBUpKLm87N5nanSwg54SBSo+D6K/6xS1F9xMpfiBKPwVu08Q
	 9idxxiJBRDzs7CZzLgbPT3R2xSyvgDchBGb7xGLqt1joXsrGv/bQUMnl1aQBahhOFt
	 FLRD2IWc/GbpxwjsFgLfJ5Lc1WCStUSfc9YiHG01z57zjM+gyf47zIu3NYRYw7kDlX
	 el29ib94TxhnwBUMZnDDXo+X/VgZKAVNL0fhcw8uCvI6MoQCO9xRg5KJP88kgYHi7i
	 KJ4VuQz0so4n4Lq4z56VnPxjiD1/+hnY0dUBSlMTFxniJnHNu2Q2g0t+7s6LTMCfqS
	 PwWyWjER4jVNA==
Received: by mail-qv1-f69.google.com with SMTP id fb18-20020ad44f12000000b0056ed45f262dso8937555qvb.11
        for <linux-riscv@lists.infradead.org>; Thu, 02 Mar 2023 07:05:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677769539;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ennINZICblkLNJRKAL6C7ysXY/vpm4KR2muFA6qF6vI=;
        b=fcH7f6+UYTHlwF4LgQTDxLZeVOZoDjaiaZjJIScsSyC0KsG3GMNpcDeQtXOx6cFcKa
         K/lPijWw+uEyNyimhrX5ymDDbo5SUgd33qX+QMISf2V1xn5xHWooSyKGTF08Sw8BwmAU
         pv3bSZBXiqSo9UnE5Tcb9UOg/LRsHacTDFitHMN6We3DiedSXOR7l9W0DqCd82p92FJu
         LGAnreBEzGVdJm1Tq0NrV02IYG8apVcYHaU78nzKinccNUJ1bHCtPvkSxXXaR50l2YGX
         xRmFL9uBXWe+fMqvPr1oJbP3QfS0UYmuhTHmvCgv0YHX79/z4yn5odIge+ewCu5++c/y
         f8Og==
X-Gm-Message-State: AO0yUKVYNkU5XBn5Oppb5fVorkO3tTCASVVARdU9Lae7O+y7ubPt9dNt
	X1sths/vH5M/9LdEp2LwyLW1cqi4kSyO/JSq7oV2lc+4nYk2+I7sq565cclsjWzLCY+OBbdhKWr
	OLJYWwqJPXuFJ6FlgiqPD/qqp2oZi9zQNpI9YrciRczGl3wI4tfWYubeQOeML8A==
X-Received: by 2002:a37:4385:0:b0:721:5339:2c89 with SMTP id q127-20020a374385000000b0072153392c89mr2581676qka.7.1677769539183;
        Thu, 02 Mar 2023 07:05:39 -0800 (PST)
X-Google-Smtp-Source: AK7set/wLIZz+wN48cyx3bobDbJlcRdqTIx95pf2ooXaqJzdzUrI6PfTcx9xyTHMIuV8BHgY8aHD9TzSIKUGk43rNDo=
X-Received: by 2002:a37:4385:0:b0:721:5339:2c89 with SMTP id
 q127-20020a374385000000b0072153392c89mr2581660qka.7.1677769538838; Thu, 02
 Mar 2023 07:05:38 -0800 (PST)
MIME-Version: 1.0
References: <20230221083323.302471-1-xingyu.wu@starfivetech.com> <20230221083323.302471-2-xingyu.wu@starfivetech.com>
In-Reply-To: <20230221083323.302471-2-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Thu, 2 Mar 2023 16:05:22 +0100
Message-ID: <CAJM55Z_O+Gh0RGaAuLPxs4aSi4=5Aa3UksN_SnU-4pOn3X5fDw@mail.gmail.com>
Subject: Re: [PATCH v2 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
To: Xingyu Wu <xingyu.wu@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Hal Feng <hal.feng@starfivetech.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230302_070547_723501_7DBFF046 
X-CRM114-Status: GOOD (  27.00  )
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

On Tue, 21 Feb 2023 at 09:37, Xingyu Wu <xingyu.wu@starfivetech.com> wrote:
> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
>
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-stgcrg.yaml         | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  1 +
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 34 ++++++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 28 +++++++
>  4 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
> new file mode 100644
> index 000000000000..b64ccd84200a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-stgcrg.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-stgcrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 System-Top-Group Clock and Reset Generator
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-stgcrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Main Oscillator (24 MHz)
> +      - description: HIFI4 core
> +      - description: STG AXI/AHB
> +      - description: USB (125 MHz)
> +      - description: CPU Bus
> +      - description: HIFI4 Axi
> +      - description: NOC STG Bus
> +      - description: APB Bus
> +
> +  clock-names:
> +    items:
> +      - const: osc
> +      - const: hifi4_core
> +      - const: stg_axiahb
> +      - const: usb_125m
> +      - const: cpu_bus
> +      - const: hifi4_axi
> +      - const: nocstg_bus
> +      - const: apb_bus
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
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +
> +    stgcrg: clock-controller@10230000 {
> +        compatible = "starfive,jh7110-stgcrg";
> +        reg = <0x10230000 0x10000>;
> +        clocks = <&osc>,
> +                 <&syscrg JH7110_SYSCLK_HIFI4_CORE>,
> +                 <&syscrg JH7110_SYSCLK_STG_AXIAHB>,
> +                 <&syscrg JH7110_SYSCLK_USB_125M>,
> +                 <&syscrg JH7110_SYSCLK_CPU_BUS>,
> +                 <&syscrg JH7110_SYSCLK_HIFI4_AXI>,
> +                 <&syscrg JH7110_SYSCLK_NOCSTG_BUS>,
> +                 <&syscrg JH7110_SYSCLK_APB_BUS>;
> +        clock-names = "osc", "hifi4_core",
> +                      "stg_axiahb", "usb_125m",
> +                      "cpu_bus", "hifi4_axi",
> +                      "nocstg_bus", "apb_bus";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 93eb504c3b21..2e70c9f21989 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19914,6 +19914,7 @@ F:      arch/riscv/boot/dts/starfive/
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:     Emil Renner Berthing <kernel@esmil.dk>
>  M:     Hal Feng <hal.feng@starfivetech.com>
> +M:     Xingyu Wu <xingyu.wu@starfivetech.com>
>  S:     Maintained
>  F:     Documentation/devicetree/bindings/clock/starfive,jh71*.yaml
>  F:     drivers/clk/starfive/clk-starfive-jh71*
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 5e4f21ca0642..5ac8a4d90a7a 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright 2022 StarFive Technology Co., Ltd.
>   */
>
>  #ifndef __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__
> @@ -222,4 +223,37 @@
>
>  #define JH7110_AONCLK_END                      14

Hi Xingyu,

The clock and reset names below have been shortened from the very long
names in the documentation. I see you've come to the same shortened
names as I used in the first STGCRG driver I pushed, which is great,
but I find it highly unlikely to have happened without looking at /
copying my code like you did for the SYSCRG and AONCRG drivers Hal has
posted. Unfortunately the commit message above doesn't reflect that,
so please add a
Co-developed-by: Emil Renner Berthing <kernel@esmil.dk>
Signed-off-by: Emil Renner Berthing <kernel@esmil.dk>

I do have some updated suggestions for short names below though:

> +/* STGCRG clocks */
> +#define JH7110_STGCLK_HIFI4_CLK_CORE           0
> +#define JH7110_STGCLK_USB0_APB                 1
> +#define JH7110_STGCLK_USB0_UTMI_APB            2 unli
> +#define JH7110_STGCLK_USB0_AXI                 3
> +#define JH7110_STGCLK_USB0_LPM                 4
> +#define JH7110_STGCLK_USB0_STB                 5
> +#define JH7110_STGCLK_USB0_APP_125             6
> +#define JH7110_STGCLK_USB0_REFCLK              7
> +#define JH7110_STGCLK_PCIE0_AXI_MST0           8
> +#define JH7110_STGCLK_PCIE0_APB                        9
> +#define JH7110_STGCLK_PCIE0_TL                 10
> +#define JH7110_STGCLK_PCIE1_AXI_MST0           11
> +#define JH7110_STGCLK_PCIE1_APB                        12
> +#define JH7110_STGCLK_PCIE1_TL                 13
> +#define JH7110_STGCLK_PCIE01_SLV_DEC_MAINCLK   14

Does PCIE01 here mean that the clock is used by both pcie0 and pcie1?
If so then maybe just call it JH7110_PCIE_SLV_MAIN

> +#define JH7110_STGCLK_SEC_HCLK                 15

For other clocks I think "hclk" means ahb clock, so maybe JH7110_STGCLK_SEC_AHB

> +#define JH7110_STGCLK_SEC_MISCAHB              16

I find something like JH7110_STGCLK_SEC_MISC_AHB a little easier to read.

> +#define JH7110_STGCLK_GRP0_MAIN                        17
> +#define JH7110_STGCLK_GRP0_BUS                 18
> +#define JH7110_STGCLK_GRP0_STG                 19
> +#define JH7110_STGCLK_GRP1_MAIN                        20
> +#define JH7110_STGCLK_GRP1_BUS                 21
> +#define JH7110_STGCLK_GRP1_STG                 22
> +#define JH7110_STGCLK_GRP1_HIFI                        23
> +#define JH7110_STGCLK_E2_RTC                   24
> +#define JH7110_STGCLK_E2_CORE                  25
> +#define JH7110_STGCLK_E2_DBG                   26
> +#define JH7110_STGCLK_DMA1P_AXI                        27
> +#define JH7110_STGCLK_DMA1P_AHB                        28
> +
> +#define JH7110_STGCLK_END                      29
> +
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
> index d78e38690ceb..4a865ded78b8 100644
> --- a/include/dt-bindings/reset/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
> @@ -1,6 +1,7 @@
>  /* SPDX-License-Identifier: GPL-2.0 OR MIT */
>  /*
>   * Copyright (C) 2022 Emil Renner Berthing <kernel@esmil.dk>
> + * Copyright (C) 2022 StarFive Technology Co., Ltd.
>   */
>
>  #ifndef __DT_BINDINGS_RESET_STARFIVE_JH7110_CRG_H__
> @@ -151,4 +152,31 @@
>
>  #define JH7110_AONRST_END                      8
>
> +/* STGCRG resets */
> +#define JH7110_STGRST_SYSCON                   0
> +#define JH7110_STGRST_HIFI4_CORE               1
> +#define JH7110_STGRST_HIFI4_AXI                        2
> +#define JH7110_STGRST_SEC_TOP_HRESETN          3

JH7110_STGRST_SEC_AHB to match the clock above.

> +#define JH7110_STGRST_E24_CORE                 4
> +#define JH7110_STGRST_DMA1P_AXI                        5
> +#define JH7110_STGRST_DMA1P_AHB                        6
> +#define JH7110_STGRST_USB0_AXI                 7
> +#define JH7110_STGRST_USB0_APB                 8
> +#define JH7110_STGRST_USB0_UTMI_APB            9
> +#define JH7110_STGRST_USB0_PWRUP               10
> +#define JH7110_STGRST_PCIE0_AXI_MST0           11
> +#define JH7110_STGRST_PCIE0_AXI_SLV0           12
> +#define JH7110_STGRST_PCIE0_AXI_SLV            13
> +#define JH7110_STGRST_PCIE0_BRG                        14
> +#define JH7110_STGRST_PCIE0_CORE               15
> +#define JH7110_STGRST_PCIE0_APB                        16
> +#define JH7110_STGRST_PCIE1_AXI_MST0           17
> +#define JH7110_STGRST_PCIE1_AXI_SLV0           18
> +#define JH7110_STGRST_PCIE1_AXI_SLV            19
> +#define JH7110_STGRST_PCIE1_BRG                        20
> +#define JH7110_STGRST_PCIE1_CORE               21
> +#define JH7110_STGRST_PCIE1_APB                        22
> +
> +#define JH7110_STGRST_END                      23
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
