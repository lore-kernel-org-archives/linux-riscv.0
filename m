Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C50C5C25B4E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:11:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=b5jVRIZcZes+EJ/jIVr57f2RZ3W72L+3Z/Z9I5e+YN4=; b=frREqHJJAl/kNK
	iAS+Fa+oAz2U/DO06UwEMdD5GlGzpK4etYlkmUS0j5I7zAUVGxwSuE7jyn0tnfZ2XOmNUFxUK2uIF
	U4AeqghFuUkQHRO7IAs569WzHZheRNpcdXTn/mgjfHuA+sjtNmKGjmabjVb15wMSVbvRRdAPdR5nn
	5rnlEYl24HMXOkYhEcAIEpST/u5moEjl9SfVBXVCZn8zDxCcjVZOLAMCwEfEbYq1JpENcAgzvl7dd
	dthghBM6DoQjI+iuf21hiyXZ3d+dA5EbTBub7kFtkDD4DnNKfOYhvrTTirQV/qOgGsrVJAJPbot0S
	BVx38qCuWVfU/6aVFUag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImUl-008yXV-EP; Fri, 20 Jan 2023 08:11:31 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImUi-008yUx-08
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:11:30 +0000
Received: by mail-wr1-x42e.google.com with SMTP id q10so4125057wrs.2
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 00:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=J3y5bgWWrzFBKiTAVfD/q/RFhwhvhK/bT8FSQul1BAQ=;
        b=W1sxXu9q7uxD4iIWO7Kb9dE0J4Zwxs6wlwCRzOVMjVSUYR2UciE615O6THnHAQrDUg
         bD20zJCmfngWfeiV8lnVgtVhw8Chq5prNWZLI5UngJLG/V80IU9dy6R9Jyclear1zznz
         Qfg+W9R64fjuoVRPj2qaEPh4Bsbsbi1HcGY9YDeBN71C9Q6WTong+j8QU2VDn64Tcxnq
         c5mVJfdmpE27Ko5c35173yrPh3nQi/SbH09akESt1p1Cqm/AnH2zpDEVx6pYC6MlcQYj
         d+MMsDNTa4vRRz5IToIced7cMPFf+OzIt6sHC0W0OGmw/pgduo9MnGHyO0b2ZAtCOGBY
         fJCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J3y5bgWWrzFBKiTAVfD/q/RFhwhvhK/bT8FSQul1BAQ=;
        b=3/CCfkq5h1+dH3p4Pp4NLBHbxHxIJAwSomd07AeOMFh4GgopB+ti/e9ND2r4YwTNKO
         JhD0koLoo7cLDJIORnNEkGjP4Oea3bS11pLtAqw/KPpLJpSZDzP20oA3u1F2dFuBqwno
         xPIEYVVgxRjC7uvPuf3EbY02n7ZKfrx4bKMTDK8AnR9wnId8tha1x3ZEZFSQAsRhYUnh
         nOsCWZ7KTtO78QKXYRyvIe8cmwTZquN7yNsZJn7Lf0pa0ToleDns4Ipo9y0Wt2OYqa0R
         /TfUJB6uWIrDWxmruHMvEVj69pvANjeNx5PmUa8e0kQSv3nWQKm28yWm+HCkv2wlUVfy
         P32g==
X-Gm-Message-State: AFqh2koTgAsh9dsVi273O+xTqCZYdM2QIa+8PcNQ6cSo5huu1bh5lthA
	bGXT8LGxb9N+AIfprqX4wdDV7w==
X-Google-Smtp-Source: AMrXdXu4sfjM6OyMOBfqghTyWMCoiGQ/ty1zrdbSxtzmzApA1b2TuJ+QBR+1d8jAIQqVv7T9qygphA==
X-Received: by 2002:adf:f791:0:b0:29d:f817:42c1 with SMTP id q17-20020adff791000000b0029df81742c1mr12223149wrp.54.1674202285148;
        Fri, 20 Jan 2023 00:11:25 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id q23-20020adfb197000000b002be5bdbe40csm835886wra.27.2023.01.20.00.11.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:11:24 -0800 (PST)
Message-ID: <fd54fb94-ca9b-42a2-9de7-5cc6c87f410f@linaro.org>
Date: Fri, 20 Jan 2023 09:11:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 01/11] dt-bindings: clock: Add StarFive JH7110
 System-Top-Group clock and reset generator
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Emil Renner Berthing <kernel@esmil.dk>
Cc: Rob Herring <robh+dt@kernel.org>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230120024445.244345-1-xingyu.wu@starfivetech.com>
 <20230120024445.244345-2-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120024445.244345-2-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_001128_144083_F0DAA5BC 
X-CRM114-Status: GOOD (  17.62  )
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

On 20/01/2023 03:44, Xingyu Wu wrote:
> Add bindings for the System-Top-Group clock and reset generator (STGCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-stgcrg.yaml         | 82 +++++++++++++++++++
>  MAINTAINERS                                   |  2 +
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 34 ++++++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 28 +++++++
>  4 files changed, 146 insertions(+)
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
> index 84fd7054cb6e..20243eb5470c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19635,6 +19635,7 @@ F:	arch/riscv/boot/dts/starfive/
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>

Not related, drop from this patch.

>  S:	Maintained
>  F:	Documentation/devicetree/bindings/clock/starfive,jh71*.yaml
>  F:	drivers/clk/starfive/clk-starfive-jh71*
> @@ -19654,6 +19655,7 @@ F:	include/dt-bindings/pinctrl/starfive,jh7110-pinctrl.h
>  STARFIVE JH71X0 RESET CONTROLLER DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> +M:	Xingyu Wu <xingyu.wu@starfivetech.com>

Not related.

>  S:	Maintained
>  F:	Documentation/devicetree/bindings/reset/starfive,jh7100-reset.yaml
>  F:	drivers/reset/starfive/reset-starfive-jh71*
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
>  #define JH7110_AONCLK_END			14
>  
> +/* STGCRG clocks */
> +#define JH7110_STGCLK_HIFI4_CLK_CORE		0
> +#define JH7110_STGCLK_USB0_APB			1
> +#define JH7110_STGCLK_USB0_UTMI_APB		2
> +#define JH7110_STGCLK_USB0_AXI			3
> +#define JH7110_STGCLK_USB0_LPM			4
> +#define JH7110_STGCLK_USB0_STB			5
> +#define JH7110_STGCLK_USB0_APP_125		6
> +#define JH7110_STGCLK_USB0_REFCLK		7
> +#define JH7110_STGCLK_PCIE0_AXI_MST0		8
> +#define JH7110_STGCLK_PCIE0_APB			9
> +#define JH7110_STGCLK_PCIE0_TL			10
> +#define JH7110_STGCLK_PCIE1_AXI_MST0		11
> +#define JH7110_STGCLK_PCIE1_APB			12
> +#define JH7110_STGCLK_PCIE1_TL			13
> +#define JH7110_STGCLK_PCIE01_SLV_DEC_MAINCLK	14
> +#define JH7110_STGCLK_SEC_HCLK			15
> +#define JH7110_STGCLK_SEC_MISCAHB		16
> +#define JH7110_STGCLK_GRP0_MAIN			17
> +#define JH7110_STGCLK_GRP0_BUS			18
> +#define JH7110_STGCLK_GRP0_STG			19
> +#define JH7110_STGCLK_GRP1_MAIN			20
> +#define JH7110_STGCLK_GRP1_BUS			21
> +#define JH7110_STGCLK_GRP1_STG			22
> +#define JH7110_STGCLK_GRP1_HIFI			23
> +#define JH7110_STGCLK_E2_RTC			24
> +#define JH7110_STGCLK_E2_CORE			25
> +#define JH7110_STGCLK_E2_DBG			26
> +#define JH7110_STGCLK_DMA1P_AXI			27
> +#define JH7110_STGCLK_DMA1P_AHB			28
> +
> +#define JH7110_STGCLK_END			29
> +
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
> index d78e38690ceb..cb70a1759482 100644
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
>  #define JH7110_AONRST_END			8
>  
> +/* STGCRG resets */
> +#define	JH7110_STGRST_SYSCON			0

Drop weird indentation.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
