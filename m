Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7E80C36010
	for <linux-riscv@archiver.kernel.org>; Tue,  8 Apr 2025 19:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nQtfWcaj+kz22K5Afkt/y3R32OWUAgu/Rj+KuiinMo4=; b=IZOxGeBNES7LKp
	DK6M/GQT0hmoEVzKL9jDRszSsPdI+QIdDGpuePmyn/Ve9pkj8mPZ6azEFncYod+OtnntXmSpnT6Am
	3TJZnhBttJXAkh05ksHV9Kn7nHGKyXwUt+WbM7HaTZRagKsUdA6FDh5rtQTi8jItgSCjRnjQ2JSBd
	SagYaOzsrI8A/jUSl1D98MrrqNyQl3fYGMTxHv8rRqyc5656CYgYPCOK4SAAZTvX1lq+hnNNJOgzh
	qhXkIoi1Vt8NQSaPqVQtQVdOnfB0HrEmY9TrPEUyTlNoo2uFXMi1lVIb1rePY/Nqtf3c/veasy1km
	QpvRDb0eWoTjyykGzasA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2El9-00000005FdU-0Gt9;
	Tue, 08 Apr 2025 19:37:23 +0000
Received: from mail-io1-xd31.google.com ([2607:f8b0:4864:20::d31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2El6-00000005Fch-2Yu6
	for linux-riscv@lists.infradead.org;
	Tue, 08 Apr 2025 19:37:22 +0000
Received: by mail-io1-xd31.google.com with SMTP id ca18e2360f4ac-85e1b1f08a5so137397139f.2
        for <linux-riscv@lists.infradead.org>; Tue, 08 Apr 2025 12:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1744141039; x=1744745839; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YAocT/vq75+xif1y8rqoT/BoG6Geem5tDOet9RgchRM=;
        b=eY0BXkyCcAX4xWA6AINZuX3JikQF3iWz51csglxBhvQL6BT3c4yrySbGaWEaawgtsJ
         vS9EwwUVGKjFwJ7jPg6ePiBKwOllzNlFpzLFHYPMVUpNn2EWt8PHdbgoakUrcGWMYAOe
         avQTnu9TAx2pvNNQT0j+HGg2BuaOQeOJPdGYEOKHWCvsFXqstJfFkIUCTUv58A8Iiwqj
         xiKAhrtVvVCOwpSvfQxX5/bWxX/xxJb07Y7ek1JP8XeIfBsjJGssSyFYonaTCMkguN/B
         QUxU+MbD1jyByRWukhzZr+ejKz+kvh7xhx+lKd0qzCHJq/iOJ93U72IXmBG4FnUirBqD
         n1Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744141039; x=1744745839;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YAocT/vq75+xif1y8rqoT/BoG6Geem5tDOet9RgchRM=;
        b=Bs/WCwqugjpi+D+DYfyInD8MitYx7jWaSyE7HZRASW1z2lQd4qmHPJHkYeAABdzgE5
         PDbdaEFu4P+X7B9J/eNMxWjr2zUQTT5XKHt4R7+PN3pxvsIsmCOBvAdpgp49XoTvHfKW
         17GPFz5NNg5NxjTbxMQNfFzkPoiGVBmrl+4WJunoOItZR3uTY7DrGkwfCvE/UvSB71pl
         Csmv8XBgiEEjcvA4tCo0+4TTV6vVPBleB25miHWoek8oxMWZhT+DU5vybKKBH2UqCaZn
         GVuvVfiyPt/GbCVKT0hzrua9SrZ+0gkJ2gkzuA/YkrKS69W6LAKgJF6iwEJYiG8Xx3nu
         8dDw==
X-Gm-Message-State: AOJu0Yy66GCSd8vbQrQslyNen9UUf1ILK7zEfhLrLEic7510LLSdyWJK
	fjgBWVV38DDrlLF4tUi8p7nJ4pJ+mb6jgYi6gqcABE3vI4mXeJgJ7sfJ2vmEQGA=
X-Gm-Gg: ASbGnctWJFq4euevmPv7eVlfblW/vGl2QIySOOVg1SbdJsh4kiIoOiKFI6PbDosz/rW
	gIHYN5SXkkhvy9PRES7AbftGkMNMqU2YUX8NV7CeOw2PIiJydSBPEA6wiqrO1mZGPX1RbjP4GMb
	BphqxoOdlJ9dQEsMJU3+HBEFWW3FHbJCK22UIuSgVtlMSMOF/3oATSv7Vuz4IThPapjkyHa4Vx9
	TATRnGkp7OQNZgzaezmOZo8pCd4lrQnvZaYYHd9aRhXq5V9++MDB0U5DdD9VgkFVMB5o3C/BX7T
	LpSEdlHZMXoDfDT+73K12XTek/p/6I7+KwmrTtU1tJzKsdASPgiha4MmAzOn0BLPlXFk08KRpZ+
	V7TVv9gBd
X-Google-Smtp-Source: AGHT+IEFE1cCuIf+szHapfd8rWi0h/VWjoKhv+Wt9/LXpZ4mW4RvqE0CY5fav9qMNHn60ZS5uwh+NA==
X-Received: by 2002:a05:6602:3e89:b0:85d:a173:323c with SMTP id ca18e2360f4ac-861611e319emr51441139f.8.1744141039611;
        Tue, 08 Apr 2025 12:37:19 -0700 (PDT)
Received: from [172.22.22.28] (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4f4f44e3aa0sm653506173.126.2025.04.08.12.37.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Apr 2025 12:37:19 -0700 (PDT)
Message-ID: <c7279fb7-2c43-42d2-bf89-5cdf644d6d6e@riscstar.com>
Date: Tue, 8 Apr 2025 14:37:18 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/6] dt-bindings: clock: spacemit: Add spacemit,k1-pll
To: Haylen Chu <heylenay@4d2.org>, Michael Turquette
 <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@outlook.com>,
 Yixun Lan <dlan@gentoo.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
 Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250401172434.6774-1-heylenay@4d2.org>
 <20250401172434.6774-3-heylenay@4d2.org>
Content-Language: en-US
From: Alex Elder <elder@riscstar.com>
In-Reply-To: <20250401172434.6774-3-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_123720_657487_D8F78953 
X-CRM114-Status: GOOD (  18.12  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 4/1/25 12:24 PM, Haylen Chu wrote:
> Add definition for the PLL found on SpacemiT K1 SoC, which takes the
> external 24MHz oscillator as input and generates clocks in various
> frequencies for the system.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Minor nit:  you used tabs again on this line:

 > +/*	APBS (PLL) clocks	*/

I really don't care what convention you use (I like the spaces
myself), but stick to it one way or the other.

Otherwise this looks good to me.

Reviewed-by: Alex Elder <elder@riscstar.com>

> ---
>   .../bindings/clock/spacemit,k1-pll.yaml       | 50 +++++++++++++++++++
>   .../dt-bindings/clock/spacemit,k1-syscon.h    | 37 ++++++++++++++
>   2 files changed, 87 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> 
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> new file mode 100644
> index 000000000000..06bafd68c00a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-pll.yaml
> @@ -0,0 +1,50 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/spacemit,k1-pll.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 PLL
> +
> +maintainers:
> +  - Haylen Chu <heylenay@4d2.org>
> +
> +properties:
> +  compatible:
> +    const: spacemit,k1-pll
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: External 24MHz oscillator
> +
> +  spacemit,mpmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the "Main PMU (MPMU)" syscon. It is used to check PLL
> +      lock status.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/spacemit,k1-syscon.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - spacemit,mpmu
> +  - "#clock-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@d4090000 {
> +        compatible = "spacemit,k1-pll";
> +        reg = <0xd4090000 0x1000>;
> +        clocks = <&vctcxo_24m>;
> +        spacemit,mpmu = <&sysctl_mpmu>;
> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/spacemit,k1-syscon.h b/include/dt-bindings/clock/spacemit,k1-syscon.h
> index 61c8d7360cf8..efe29c976a01 100644
> --- a/include/dt-bindings/clock/spacemit,k1-syscon.h
> +++ b/include/dt-bindings/clock/spacemit,k1-syscon.h
> @@ -6,6 +6,43 @@
>   #ifndef _DT_BINDINGS_SPACEMIT_CCU_H_
>   #define _DT_BINDINGS_SPACEMIT_CCU_H_
>   
> +/*	APBS (PLL) clocks	*/
> +#define CLK_PLL1		0
> +#define CLK_PLL2		1
> +#define CLK_PLL3		2
> +#define CLK_PLL1_D2		3
> +#define CLK_PLL1_D3		4
> +#define CLK_PLL1_D4		5
> +#define CLK_PLL1_D5		6
> +#define CLK_PLL1_D6		7
> +#define CLK_PLL1_D7		8
> +#define CLK_PLL1_D8		9
> +#define CLK_PLL1_D11		10
> +#define CLK_PLL1_D13		11
> +#define CLK_PLL1_D23		12
> +#define CLK_PLL1_D64		13
> +#define CLK_PLL1_D10_AUD	14
> +#define CLK_PLL1_D100_AUD	15
> +#define CLK_PLL2_D1		16
> +#define CLK_PLL2_D2		17
> +#define CLK_PLL2_D3		18
> +#define CLK_PLL2_D4		19
> +#define CLK_PLL2_D5		20
> +#define CLK_PLL2_D6		21
> +#define CLK_PLL2_D7		22
> +#define CLK_PLL2_D8		23
> +#define CLK_PLL3_D1		24
> +#define CLK_PLL3_D2		25
> +#define CLK_PLL3_D3		26
> +#define CLK_PLL3_D4		27
> +#define CLK_PLL3_D5		28
> +#define CLK_PLL3_D6		29
> +#define CLK_PLL3_D7		30
> +#define CLK_PLL3_D8		31
> +#define CLK_PLL3_80		32
> +#define CLK_PLL3_40		33
> +#define CLK_PLL3_20		34
> +
>   /* MPMU clocks */
>   #define CLK_PLL1_307P2		0
>   #define CLK_PLL1_76P8		1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
