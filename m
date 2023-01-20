Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86F50C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AGFUsahK0BM5EKxXmjYfD5ciKfNY3+L1PLUx9umCTBE=; b=DkXH2UxHGGwwQr
	8N0y9ujBm0EODlJsqEoHQ75DW5KuIFji/nGV5odopc6TPkzeWYp0YIJ0q4u3XerWDwpxDDu2gyzaL
	S2VJ2Lq6IdlYGDsZSMmWzSM2EsBO5lRkDBcFKqAkwSd4JJwwlBRWlYgjrC7ss4KWiQR7Pv1Eako4N
	PZrz+jCXQ1w7wOnzM0vKRlGVBwn7HaaNefMwAI1O0Ikixf6xq5UPSWmxHlQbyOO8B1ksJCPIsjAfd
	R7xZq40n/RnKPp18OHGXjMkaFtEkwIf7rH5yY8XXOcgf2GCYLT1v6V7qpzFXjI/usCJHCg6/Hsp+r
	iaNfC18iW1fIyaDjUa0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImW1-008z3V-IR; Fri, 20 Jan 2023 08:12:49 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImVy-008z1Y-BG
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:12:48 +0000
Received: by mail-wr1-x42a.google.com with SMTP id h12so104199wrv.10
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 00:12:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yiAdPlVGnlmrDGm9QLZ2Gsviy1Uod58CRnOWNst221Q=;
        b=UBCYHnYVR9kc4oxoLdRjzF7Ay+gEz8PcDG8bFf6Z7xlhX9J3kVeY2q1fSqaDpEerrl
         NJvF0D3scSBxK/fXlz0XYUfMc1KeHMY303Q8YUjXjluHlIXmSm4p5Qp/u544/Bu8vZp5
         KOC9mJxxcYA9DcEUZmF0A4Ma/0utJ0VI025kVGbWjqzhbMiYSOQxEkX7zo+LiFaAsIVl
         OnK9x2G4EPLQJrW/Fx28GCJ1FzoBXfRgeog2KF/iVMD82nAgO6CdoVSbdmN1jXpUfW1M
         SOoYYbEX5E0dCOIraIg7Aq3SXhb2InPtncSBp5yGZCoqpFl2c/QZL683Q76uWpdGq/8D
         ppyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yiAdPlVGnlmrDGm9QLZ2Gsviy1Uod58CRnOWNst221Q=;
        b=zJ5FJ0vfytJMhZwlt7gOqioACJt9DL7lEa10C3Dnd/HrQuLb2KNcm5EkbZVElqOrXV
         aj6MTScC0hOgJki7B8kyXAMxMDGwdp70/S1n7lhpwj+pQNUsLUC7rEa8IQ8xfalo74ld
         rNH/VcsHSr3MjzSddIMb12P/jJtShLsYgAKtqpuyOwO1DXvoBc7QQCP/clowyyCk7uOS
         QBIYchRov2SWHckJkhP9N/H6MTYAWZEpcvjbiyITAFkP5bJhMo2S7BC1Vwsq7pG+OfRa
         UZQUK4XBnDzogk/hSVKCIeFzL7S5Ncn8RU9yh8QS4+2jrb93FP5A5Eu4QSo6PurUoH60
         v1Pg==
X-Gm-Message-State: AFqh2kr6IWATz/9lp9C3fftpfu0c9HnAbILXa9Yttr/dOV6689M+580U
	HZnwHYbTEtuikE2qng4fUXyzgumLnclxdlXu
X-Google-Smtp-Source: AMrXdXssFgmae4BzCMjzn8XNhOeYLTMGSkgCtWcOpFxpMhkomalTT1AMRy/aq8pWNIniEw4M5hrE9Q==
X-Received: by 2002:a05:6000:79d:b0:2be:34fa:7866 with SMTP id bu29-20020a056000079d00b002be34fa7866mr7158910wrb.63.1674202364905;
        Fri, 20 Jan 2023 00:12:44 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g2-20020a5d64e2000000b002be063f6820sm16678189wri.81.2023.01.20.00.12.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:12:44 -0800 (PST)
Message-ID: <f85f5283-98b2-46b1-5a91-64ae708a6353@linaro.org>
Date: Fri, 20 Jan 2023 09:12:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 04/11] dt-bindings: clock: Add StarFive JH7110
 Image-Signal-Process clock and reset generator
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
 <20230120024445.244345-5-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120024445.244345-5-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_001246_466624_0CB4D9E3 
X-CRM114-Status: GOOD (  16.56  )
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
> Add bindings for the Image-Signal-Process clock and reset
> generator (ISPCRG) on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-ispcrg.yaml         | 97 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 18 ++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 +++
>  3 files changed, 131 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
> new file mode 100644
> index 000000000000..32794f809364
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-ispcrg.yaml
> @@ -0,0 +1,97 @@
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
> +  reset-names:
> +    items:
> +      - const: isp_top_core
> +      - const: isp_top_axi
> +      - const: noc_bus_isp_axi
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
> +  - reset-names
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
> +        reset-names = "isp_top_core",
> +                      "isp_top_axi",
> +                      "noc_bus_isp_axi";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        power-domains = <&pwrc JH7110_PD_ISP>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 5ac8a4d90a7a..91ee589809c3 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -256,4 +256,22 @@
>  
>  #define JH7110_STGCLK_END			29
>  
> +/* ISPCRG clocks */
> +#define JH7110_ISPCLK_DOM4_APB_FUNC		0
> +#define JH7110_ISPCLK_MIPI_RX0_PXL		1
> +#define JH7110_ISPCLK_DVP_INV			2
> +#define JH7110_ISPCLK_M31DPHY_CFGCLK_IN		3
> +#define JH7110_ISPCLK_M31DPHY_REFCLK_IN		4
> +#define JH7110_ISPCLK_M31DPHY_TXCLKESC_LAN0	5
> +#define JH7110_ISPCLK_VIN_PCLK			6
> +#define JH7110_ISPCLK_VIN_SYS_CLK		7
> +#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF0		8
> +#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF1		9
> +#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF2		10
> +#define JH7110_ISPCLK_VIN_PIXEL_CLK_IF3		11
> +#define JH7110_ISPCLK_VIN_CLK_P_AXIWR		12
> +#define JH7110_ISPCLK_ISPV2_TOP_WRAPPER_CLK_C	13
> +
> +#define JH7110_ISPCLK_END			14
> +
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
> index cb70a1759482..1b40df62cdac 100644
> --- a/include/dt-bindings/reset/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
> @@ -179,4 +179,20 @@
>  
>  #define JH7110_STGRST_END			23
>  
> +/* ISPCRG resets */
> +#define	JH7110_ISPRST_ISPV2_TOP_WRAPPER_P	0

Drop weird indentation.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
