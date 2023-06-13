Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1469EB64D0
	for <linux-riscv@archiver.kernel.org>; Tue, 13 Jun 2023 18:34:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yLPFq1/Th0JUuL3e/cmLM2BLfxti/vythG6IrFbZRKQ=; b=QU1ZbQRA1kN1CE
	dVHicndzURO4iXt3bEChR/otf/ZK41qg2fTa5PtFrHXcgx8+875feDEVRVPjsUFKGGLz5fo5v33MH
	+QbKUxvV9vY7f2Di+NwMpIUYv/LTIaCNLeAh2FToS4t9lD/HSND8UYAUVjt3jI4W2wgc88v6PrGqh
	TvELR7FmC8S7m9I7/P3PCdHXnapa8Qe+shbn8YiA4M8EwobGJQfqKBLsxpBCPi20U9ntivG68c9OQ
	i8ynOzjhExP7H+uohbRN63ymB8UoMQKAVF37OOVgnUduR6HvWKW6TKHE+v2cSJR3RaUI3p/HtIe6u
	AjiaHuK5em4UnW9jnkUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q98qj-008rSA-0R;
	Tue, 13 Jun 2023 18:34:37 +0000
Received: from mail-ej1-x62e.google.com ([2a00:1450:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q98qe-008rR1-36
	for linux-riscv@lists.infradead.org;
	Tue, 13 Jun 2023 18:34:35 +0000
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-97458c97333so957998166b.2
        for <linux-riscv@lists.infradead.org>; Tue, 13 Jun 2023 11:34:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686681268; x=1689273268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NtcqOw9tGOLwmlWw5dD/FwSbu+eMTAPAiQdNyorGdKs=;
        b=TF06f9ZKq7pMgbq7ormbfzR+qN7ngTNxN1iQAXw5U5DuvJrUq1xjjW5xw9Ize6wSp7
         EYxB2YzFz/QtVppI3GMbtwa4xgZ9sRQc3f4t8YBK/meyV6UR1DiBbMgwpXwOIgNKFs33
         U87sFC0COYk9vce4kBnTGAGE2hazjZOGeQSpl2b7BLjyXbNQiuFuyb5xpd60z2nQkxnA
         4ykIXEPRyNRfLYITKW1o/rh6DBnkOaeN2/hn1ZF0+4KTDPZWhyejI8hH3+tu0EYeYbJB
         EJffQ0cUT8Gpm0QKBn3ydp3Uf+0X+hUyQ9Savf8KEz8OyniD+XdZ/s6VAtYcnNCFkcFq
         8qsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686681268; x=1689273268;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NtcqOw9tGOLwmlWw5dD/FwSbu+eMTAPAiQdNyorGdKs=;
        b=Xll5EENqwp1Mmgd35g1HIaaikyeeYjutaQTM/AM8ChNFJMhDGkiE99+hnu8sihunEN
         RNBoxLF63VWXvlATrEMVqeV2MSaTD/tn1woLCJ9cT93BdwKF+Ll7nKZnmV8TD9B14CHV
         j8iwmtarVaiPvvJnZHfM+gqGb7d9dy8GbfVAxeMl/81Qtb/6MxGUoEL1Q258MSILl8MS
         hFzVsQCov8JteQ5TTwv04tOKcRqHXQeASfUMgT2ra5Y5V55gAr+54dtTLIJsS8IxqC47
         bmDgLyMdC1rchVt02bgavNdZaD8zZYjg1u4wFVRY1P+RIV9wYjbDM/bZY30IujYUnB0m
         /zaQ==
X-Gm-Message-State: AC+VfDxZrN69rEQSvz03h/CyJo3Ok8qP23b8Oro3VgmyAohzoQVksXSZ
	kdrotZgYv8/CF2MNaWjBZpKjNg==
X-Google-Smtp-Source: ACHHUZ5h4YyZdlSWo9Eiykl6LWg95TEWZGgJxSeDzTRZm8HcaKkAKbdZzhGVqPwl1h+uQO5nbWUlYg==
X-Received: by 2002:a17:907:eac:b0:978:8925:7a08 with SMTP id ho44-20020a1709070eac00b0097889257a08mr15533059ejc.72.1686681268157;
        Tue, 13 Jun 2023 11:34:28 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id pv12-20020a170907208c00b0096b4ec45e10sm6946337ejb.139.2023.06.13.11.34.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Jun 2023 11:34:27 -0700 (PDT)
Message-ID: <75508c4d-d86e-f88f-191f-dd870ebe7bd7@linaro.org>
Date: Tue, 13 Jun 2023 20:34:25 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH v5 3/7] dt-bindings: clock: jh7110-syscrg: Add PLL clock
 inputs
Content-Language: en-US
To: Xingyu Wu <xingyu.wu@starfivetech.com>, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>,
 Emil Renner Berthing <emil.renner.berthing@canonical.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Hal Feng <hal.feng@starfivetech.com>,
 William Qiu <william.qiu@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-clk@vger.kernel.org
References: <20230613125852.211636-1-xingyu.wu@starfivetech.com>
 <20230613125852.211636-4-xingyu.wu@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230613125852.211636-4-xingyu.wu@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230613_113433_007409_861FC6E3 
X-CRM114-Status: GOOD (  12.97  )
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

On 13/06/2023 14:58, Xingyu Wu wrote:
> Add optional PLL clock inputs from PLL clock generator.

Are you sure that PLLs are optional? Usually they are not...

> 
> Signed-off-by: Xingyu Wu <xingyu.wu@starfivetech.com>
> ---
>  .../clock/starfive,jh7110-syscrg.yaml         | 56 +++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> index 84373ae31644..5536e5f9e20b 100644
> --- a/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> +++ b/Documentation/devicetree/bindings/clock/starfive,jh7110-syscrg.yaml
> @@ -39,6 +39,33 @@ properties:
>            - description: External TDM clock
>            - description: External audio master clock
>  
> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC1 RMII reference or GMAC1 RGMII RX
> +          - description: External I2S TX bit clock
> +          - description: External I2S TX left/right channel clock
> +          - description: External I2S RX bit clock
> +          - description: External I2S RX left/right channel clock
> +          - description: External TDM clock
> +          - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2

Add these three to the existing entry with minItems.

> +
> +      - items:
> +          - description: Main Oscillator (24 MHz)
> +          - description: GMAC1 RMII reference
> +          - description: GMAC1 RGMII RX
> +          - description: External I2S TX bit clock
> +          - description: External I2S TX left/right channel clock
> +          - description: External I2S RX bit clock
> +          - description: External I2S RX left/right channel clock
> +          - description: External TDM clock
> +          - description: External audio master clock
> +          - description: PLL0
> +          - description: PLL1
> +          - description: PLL2

Add these three to the existing entry with minItems.



> +
>    clock-names:
>      oneOf:
>        - items:
> @@ -64,6 +91,35 @@ properties:
>            - const: tdm_ext
>            - const: mclk_ext
>  
> +      - items:
> +          - const: osc
> +          - enum:
> +              - gmac1_rmii_refin
> +              - gmac1_rgmii_rxin
> +          - const: i2stx_bclk_ext
> +          - const: i2stx_lrck_ext
> +          - const: i2srx_bclk_ext
> +          - const: i2srx_lrck_ext
> +          - const: tdm_ext
> +          - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out

Add these three to the existing entry with minItems.


> +
> +      - items:
> +          - const: osc
> +          - const: gmac1_rmii_refin
> +          - const: gmac1_rgmii_rxin
> +          - const: i2stx_bclk_ext
> +          - const: i2stx_lrck_ext
> +          - const: i2srx_bclk_ext
> +          - const: i2srx_lrck_ext
> +          - const: tdm_ext
> +          - const: mclk_ext
> +          - const: pll0_out
> +          - const: pll1_out
> +          - const: pll2_out

Add these three to the existing entry with minItems.



Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
