Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82D76EB64DA
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jul 2023 17:48:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bsMmo+wnjXi9sds1FQ/WEuGvFsYC8enAtbWXJRvGvgQ=; b=C4ve1fywg8rwbS
	/bmy59qBl3nLPFLFQQwE5JSKyGYr/VyhAyTxQFq+FhraP66cIzTbmOKWJHNlJW4cYF/jl24+3uP2J
	x16UZ3oMaId/cOKL5s2aT+w8SQjYRqZS3cBSQ82xULoatJiDq+Q6yQ4+0W6fqy+i7iPkTEYuj7n2d
	keZuDZAaVMTDgkOpikyt8dOBo+gll9i+U+nAmQaaDrlnKIWy1qjz4wBxinQU6HAl0xwM64XpUB49w
	+RAwKMOHT5VuTLfmZsdCottiMibCUC0uYgqc3gNmL+pZjboxXzpf2Tnjuo4FHQfaCpevTwKEueRL1
	jAyzsODUArLxJXMF/izA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdxJ-000oAa-0a;
	Wed, 12 Jul 2023 17:48:49 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJdxG-000o9C-0h
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jul 2023 17:48:48 +0000
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 5F0833F18D
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 17:48:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1689184117;
	bh=4mIbFJA7GYTeh9wzOtbGqFQCZ+DpBgKY7ChRoRgRPZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=Uu73au1172u6A8YUFT9+7N5mzqk8ctvqV3TYHwnIO8F6pCiFRZJGPbGgOMqiR3kYW
	 IfHZRHxgZ1GCfKr9LokNfjfMUrlJqfz1i7w7q9vc5wyaQd0kmpQ+7Ab8Imk4TqNURr
	 wVcQLXzmpmLYwGPu0OI4fW/7D3DSQjA2KVEyqeQtGxGizwM8/EwzFZiTshD8nFGION
	 Drp9PqYwDplNRURAWCEuWPkBo1tEbCtnzYCKFI8eJoSsFT0B+0jCK36QCG9UZVazzL
	 BM42K1VIVu3dgtKkMAceHiIbBl7W8VV2A9I7mTuOo95xIl2UJYV3tEGji5Fh2zROlX
	 KWa3YFegpK+DA==
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-767cf9caaa9so67257785a.0
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jul 2023 10:48:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689184114; x=1691776114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4mIbFJA7GYTeh9wzOtbGqFQCZ+DpBgKY7ChRoRgRPZM=;
        b=LM7QKFQ2pC5hk3lcm4Kav/a7wkT3pK5esmVNXZ9C5wQRcfu5VOdoU/E9Q11XuYO/0X
         evB/lN02aIOtiITW2nZuDZIwcOxrPpS36u6wRVS8OAW8PDx2edy2roFYS9c0P4HTuT+h
         +5a2vSZ9nSds8TTz+TcCIzGwGqRt2eIzGoXVO9Twqr0V5IDtPblUELaUyDZYM93J2KsD
         E+YMinpUyHmaBJuIdSVmRqyVpG4WcOzq3AMQN1gRDhsnxaGQKiRi2mbT350tfRrbNsEU
         9RlVMOBt6HHpdpNubnsMS8WpmNbC1AzgpQ1rhLPAaZiqULtCVm2GWbuqhXjzv3Xg7YiK
         kaAg==
X-Gm-Message-State: ABy/qLYSNCfEttT2S3Onuh8nx+uNnqx7hLnIuwA7GA38f2k0cNMz3Yq3
	yZMY9DABBJY2Ry5lOd60LWT8qaOlCqr+7+deLafiVbGq797WbcN6emvJebLCfazN/P1la+P7uCf
	tV0z0RBsCodjGd7VAioar0gL0UfWuOF5ccD4QcycTfQ3AC2/LAV1ltjwpHS7pQA==
X-Received: by 2002:ac8:5f84:0:b0:3ff:2cce:c625 with SMTP id j4-20020ac85f84000000b003ff2ccec625mr2725879qta.19.1689184114261;
        Wed, 12 Jul 2023 10:48:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEjwbk7z1DpqBNVCGwacj9BzAdcTlyn7qKP4MeQvQk8JS/G9rq1B7Ub3SXjq21GRE0NRLwBBLIPyi97X70AGPQ=
X-Received: by 2002:ac8:5f84:0:b0:3ff:2cce:c625 with SMTP id
 j4-20020ac85f84000000b003ff2ccec625mr2725870qta.19.1689184114014; Wed, 12 Jul
 2023 10:48:34 -0700 (PDT)
MIME-Version: 1.0
References: <20230712092007.31013-1-xingyu.wu@starfivetech.com> <20230712092007.31013-6-xingyu.wu@starfivetech.com>
In-Reply-To: <20230712092007.31013-6-xingyu.wu@starfivetech.com>
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Date: Wed, 12 Jul 2023 19:48:17 +0200
Message-ID: <CAJM55Z_YQ-92BrDcSgH26cdLwQO6KXy-D33xBT5t=2CgTMOyrA@mail.gmail.com>
Subject: Re: [PATCH v7 5/9] dt-bindings: clock: Add StarFive JH7110
 Video-Output clock and reset generator
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
X-CRM114-CacheID: sfid-20230712_104846_594401_0A3C638A 
X-CRM114-Status: GOOD (  19.65  )
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
> Add bindings for the Video-Output clock and reset generator (VOUTCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-voutcrg.yaml        | 90 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
>  3 files changed, 128 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
>
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> new file mode 100644
> index 000000000000..af77bd8c86b1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> @@ -0,0 +1,90 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/starfive,jh7110-voutcrg.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 Video-Output Clock and Reset Generator
> +
> +maintainers:
> +  - Xingyu Wu <xingyu.wu@starfivetech.com>
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-voutcrg
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: Vout Top core
> +      - description: Vout Top Ahb
> +      - description: Vout Top Axi
> +      - description: Vout Top HDMI MCLK
> +      - description: I2STX0 BCLK
> +      - description: external HDMI pixel
> +
> +  clock-names:
> +    items:
> +      - const: vout_src
> +      - const: vout_top_ahb
> +      - const: vout_top_axi
> +      - const: vout_top_hdmitx0_mclk
> +      - const: i2stx0_bclk
> +      - const: hdmitx0_pixelclk
> +
> +  resets:
> +    maxItems: 1
> +    description: Vout Top core
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
> +      Vout domain power
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
> +    voutcrg: clock-controller@295C0000 {
> +        compatible = "starfive,jh7110-voutcrg";
> +        reg = <0x295C0000 0x10000>;
> +        clocks = <&syscrg JH7110_SYSCLK_VOUT_SRC>,
> +                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AHB>,
> +                 <&syscrg JH7110_SYSCLK_VOUT_TOP_AXI>,
> +                 <&syscrg JH7110_SYSCLK_VOUT_TOP_HDMITX0_MCLK>,
> +                 <&syscrg JH7110_SYSCLK_I2STX0_BCLK>,
> +                 <&hdmitx0_pixelclk>;
> +        clock-names = "vout_src", "vout_top_ahb",
> +                      "vout_top_axi", "vout_top_hdmitx0_mclk",
> +                      "i2stx0_bclk", "hdmitx0_pixelclk";
> +        resets = <&syscrg JH7110_SYSRST_VOUT_TOP_SRC>;
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        power-domains = <&pwrc JH7110_PD_VOUT>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 39acf30db491..016227c64a27 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -270,4 +270,26 @@
>
>  #define JH7110_ISPCLK_END                      14
>
> +/* VOUTCRG clocks */
> +#define JH7110_VOUTCLK_APB                     0
> +#define JH7110_VOUTCLK_DC8200_PIX              1
> +#define JH7110_VOUTCLK_DSI_SYS                 2
> +#define JH7110_VOUTCLK_TX_ESC                  3
> +#define JH7110_VOUTCLK_DC8200_AXI              4
> +#define JH7110_VOUTCLK_DC8200_CORE             5
> +#define JH7110_VOUTCLK_DC8200_AHB              6
> +#define JH7110_VOUTCLK_DC8200_PIX0             7
> +#define JH7110_VOUTCLK_DC8200_PIX1             8
> +#define JH7110_VOUTCLK_DOM_VOUT_TOP_LCD                9
> +#define JH7110_VOUTCLK_DSITX_APB               10
> +#define JH7110_VOUTCLK_DSITX_SYS               11
> +#define JH7110_VOUTCLK_DSITX_DPI               12
> +#define JH7110_VOUTCLK_DSITX_TXESC             13
> +#define JH7110_VOUTCLK_MIPITX_DPHY_TXESC       14
> +#define JH7110_VOUTCLK_HDMI_TX_MCLK            15
> +#define JH7110_VOUTCLK_HDMI_TX_BCLK            16
> +#define JH7110_VOUTCLK_HDMI_TX_SYS             17
> +
> +#define JH7110_VOUTCLK_END                     18
> +
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
> index 2c5d9dcefffa..eaf4a0d84f6a 100644
> --- a/include/dt-bindings/reset/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
> @@ -195,4 +195,20 @@
>
>  #define JH7110_ISPRST_END                      12
>
> +/* VOUTCRG resets */
> +#define JH7110_VOUTRST_DC8200_AXI              0
> +#define JH7110_VOUTRST_DC8200_AHB              1
> +#define JH7110_VOUTRST_DC8200_CORE             2
> +#define JH7110_VOUTRST_DSITX_DPI               3
> +#define JH7110_VOUTRST_DSITX_APB               4
> +#define JH7110_VOUTRST_DSITX_RXESC             5
> +#define JH7110_VOUTRST_DSITX_SYS               6
> +#define JH7110_VOUTRST_DSITX_TXBYTEHS          7
> +#define JH7110_VOUTRST_DSITX_TXESC             8
> +#define JH7110_VOUTRST_HDMI_TX_HDMI            9
> +#define JH7110_VOUTRST_MIPITX_DPHY_SYS         10
> +#define JH7110_VOUTRST_MIPITX_DPHY_TXBYTEHS    11
> +
> +#define JH7110_VOUTRST_END                     12
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
