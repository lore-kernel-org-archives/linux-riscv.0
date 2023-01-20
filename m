Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF6E8C05027
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Jan 2023 08:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bSbQciGV8hTV6Z5mc6f8KGUxnPCLnPBJWRMTOJCEs2g=; b=fdyT3hOmibtnRz
	soFYwtfVu/G/pM0K68a14FNuSAtS9TtoWfgvyfbGVZOVQz4p754sH2Zzt9g+THpi5da84EcO8MxHW
	+1xuIvJezI6mVl7S6eIOLc7dlcYwaBoQDgvLIMFgNgv/Xj3F5hO9DMhCjBpgadkasnmbcDnoqB7lZ
	HVuObpfZOb9rsQ0UqC/x3bAaOaEPAdVAGTz+MjbaFCCe4t2TjlHPSpVllXclg4JXe5bkkQtMXIrwJ
	DPZtuE9y1u2yApWoIwIoj/96G4Q9dvOeZRZQhZ7gMWFKE4zFueaQYHwAnX60LWiTRCt7Hbh/31Jw2
	sCj4U3rTydg8dyMKymcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImWd-008zKx-4n; Fri, 20 Jan 2023 08:13:27 +0000
Received: from mail-wm1-x336.google.com ([2a00:1450:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pImWZ-008zHo-Fe
	for linux-riscv@lists.infradead.org; Fri, 20 Jan 2023 08:13:25 +0000
Received: by mail-wm1-x336.google.com with SMTP id j17so3401356wms.0
        for <linux-riscv@lists.infradead.org>; Fri, 20 Jan 2023 00:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1uvdzDEyw4aMwwFxv90bw7L4K8vMnN12+a5SiR5f2e0=;
        b=Mp1BjMIrt1Bi1aLAxlXS+/LFjW+NZGHTlV7Y4BKVN5+DwwJVvl3BzXuXP508RF/7VF
         wLz8w9nn8OEmMKKXxAeh1fdlQv62aTFiFn/u4Pj6R0uENSzB28DD/8jtrVDFi6AWc985
         wHxhrAPSq4pQoQLfuIH3lsY8630Ug3in47toRtWnq0Vr9+BFFB5hRv/v3f0MqSS8bMA/
         JzheOBQWmFYTtatlAIJRsOcgK0G0GbYFfvlo6k7b8wm8OvX2xIBhaB9XZA5MKP726NG+
         +n2l4wTpNa7TOAGSV657iu9qNZvCMLGaEL5axCcvhOXmTfxf5SisAtkoFLiN/ngZbQVz
         /W8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1uvdzDEyw4aMwwFxv90bw7L4K8vMnN12+a5SiR5f2e0=;
        b=C4mo+HI8U3WU900MwuoKWVCfu8nvlbfA+LQB3jX6bfts/pEfekLM+AqHPiZKaw2OdJ
         gZdjpnWmgP0l8om6rqi/W500GlhUeMBUEJZtyRAIYY1skeP1dpJznMc7vK2tCUl2Q5h+
         0i/vzIgEYtZBWWMsoYTwswZQzhduf9Pkt0MOO86E19/9VldXibgRvIWGVLknDMGlWfKU
         icC0+crVnh145Q0NyaAlKEgyNqqrjhF3wYv9jR/LskhlFwAlb/6pfjPdOvaZXrIeZO2Y
         dTFiEgsWxtSFiedqaHdGvnCslLxfygSVzNYw3JJqdQ9XKh+eZ5LczSd3X2ipfeedTGm1
         69ww==
X-Gm-Message-State: AFqh2krLPJOJRjC5/8Uh74sfYZgIzIbcJtKOvxTjBkh9TA9qBf0q8wP8
	D378ebZ9C2CAS6O5JE2WEJXMSg==
X-Google-Smtp-Source: AMrXdXuBhIv+nqBTjZiIRYIa8I/haxKNtjRNPQGzggHVcsUGxIMnPvQInpf1qsbsZaO20LitnygE5w==
X-Received: by 2002:a05:600c:b96:b0:3db:19:798 with SMTP id fl22-20020a05600c0b9600b003db00190798mr9333419wmb.39.1674202398590;
        Fri, 20 Jan 2023 00:13:18 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id f14-20020a05600c154e00b003daff80f16esm2089490wmg.27.2023.01.20.00.13.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jan 2023 00:13:18 -0800 (PST)
Message-ID: <428dc119-82ab-e565-7bd6-1a99ec3967d9@linaro.org>
Date: Fri, 20 Jan 2023 09:13:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [PATCH v1 07/11] dt-bindings: clock: Add StarFive JH7110
 Video-Output clock and reset generator
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
 <20230120024445.244345-8-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230120024445.244345-8-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230120_001323_620637_158D097F 
X-CRM114-Status: GOOD (  16.32  )
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
> Add bindings for the Video-Output clock and reset generator (VOUTCRG)
> on the JH7110 RISC-V SoC by StarFive Ltd.
> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-voutcrg.yaml        | 96 +++++++++++++++++++
>  .../dt-bindings/clock/starfive,jh7110-crg.h   | 22 +++++
>  .../dt-bindings/reset/starfive,jh7110-crg.h   | 16 ++++
>  3 files changed, 134 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> new file mode 100644
> index 000000000000..a6a43d86a392
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-voutcrg.yaml
> @@ -0,0 +1,96 @@
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
> +    items:
> +      - description: Vout Top core
> +
> +  reset-names:
> +    items:
> +      - const: vout_top_src
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
> +        reset-names = "vout_top_src";
> +        #clock-cells = <1>;
> +        #reset-cells = <1>;
> +        power-domains = <&pwrc JH7110_PD_VOUT>;
> +    };
> diff --git a/include/dt-bindings/clock/starfive,jh7110-crg.h b/include/dt-bindings/clock/starfive,jh7110-crg.h
> index 91ee589809c3..3ebece93cbd3 100644
> --- a/include/dt-bindings/clock/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/clock/starfive,jh7110-crg.h
> @@ -274,4 +274,26 @@
>  
>  #define JH7110_ISPCLK_END			14
>  
> +/* VOUTCRG clocks */
> +#define JH7110_VOUTCLK_APB			0
> +#define JH7110_VOUTCLK_DC8200_PIX		1
> +#define JH7110_VOUTCLK_DSI_SYS			2
> +#define JH7110_VOUTCLK_TX_ESC			3
> +#define JH7110_VOUTCLK_DC8200_AXI		4
> +#define JH7110_VOUTCLK_DC8200_CORE		5
> +#define JH7110_VOUTCLK_DC8200_AHB		6
> +#define JH7110_VOUTCLK_DC8200_PIX0		7
> +#define JH7110_VOUTCLK_DC8200_PIX1		8
> +#define JH7110_VOUTCLK_DOM_VOUT_TOP_LCD		9
> +#define JH7110_VOUTCLK_DSITX_APB		10
> +#define JH7110_VOUTCLK_DSITX_SYS		11
> +#define JH7110_VOUTCLK_DSITX_DPI		12
> +#define JH7110_VOUTCLK_DSITX_TXESC		13
> +#define JH7110_VOUTCLK_MIPITX_DPHY_TXESC	14
> +#define JH7110_VOUTCLK_HDMI_TX_MCLK		15
> +#define JH7110_VOUTCLK_HDMI_TX_BCLK		16
> +#define JH7110_VOUTCLK_HDMI_TX_SYS		17
> +
> +#define JH7110_VOUTCLK_END			18
> +
>  #endif /* __DT_BINDINGS_CLOCK_STARFIVE_JH7110_CRG_H__ */
> diff --git a/include/dt-bindings/reset/starfive,jh7110-crg.h b/include/dt-bindings/reset/starfive,jh7110-crg.h
> index 1b40df62cdac..f89589610cf5 100644
> --- a/include/dt-bindings/reset/starfive,jh7110-crg.h
> +++ b/include/dt-bindings/reset/starfive,jh7110-crg.h
> @@ -195,4 +195,20 @@
>  
>  #define JH7110_ISPRST_END			12
>  
> +/* VOUTCRG resets */
> +#define	JH7110_VOUTRST_DC8200_AXI		0
> +#define	JH7110_VOUTRST_DC8200_AHB		1

Ditto

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
