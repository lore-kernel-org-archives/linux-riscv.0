Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85FBC76188
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Apr 2023 06:34:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dF9roVMAhvkwH/sI8dGQ7zlGzEYUx3kFWrctojhEfFk=; b=gJFExgLIF8KF3r
	rat12NqnR0JYmyKdy1UWPCETAa1rGfIRy+sTYgoB/EluSdeqmU8eGZZyMSKMUm2ALdwr+a/eBN0gF
	l/GfbEX9UuUGUDkKPRaok93ep8A2bO0b0PcBLAKaH+N8b2heGljFpYlnVja16/PhAuvuyD3/WfSOV
	o6c3U8MuWXCqVmR6sZQrHLAz6Ne/vyNjHkx+xpk2Cle1xBVvZ2iMYEaodfHecm4ZxmEemmTXc+G50
	T2fPf+pZ8tQrBeXPxBdhcTy2GE2TL/t/QOOM0RuMSFi7BbzpEES5R4ocDDNXQaehHHRyosisG9tUR
	U8+Z1kFKlLbQt5/DQ+Gw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwip-003WT8-0P;
	Wed, 05 Apr 2023 06:34:19 +0000
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjwij-003WR6-2D
	for linux-riscv@lists.infradead.org;
	Wed, 05 Apr 2023 06:34:17 +0000
Received: by mail-ed1-x52d.google.com with SMTP id i5so138702797eda.0
        for <linux-riscv@lists.infradead.org>; Tue, 04 Apr 2023 23:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680676450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VX8BaURDAmMiXn1X2BAcvGxFigvEA3txrLdW+Fx+IZw=;
        b=rIPpaehpS5oSvYCoz67/ZyQz6Xbcw80aD8pJkdxX7S9OyExVaWPgYW1gcHrc9Qql8x
         7NwMpEsrh/wgRye2wvUKhikhv/9XlS2ZMG/5NDiGs0162GrMDG2/ztg/Uvgr746m82R7
         BY75kP7HRUgH8QcPYB3QLrcE9AaT3F2ePLLEtIgvYG9UQKCztVEMiKo3+yWEjQU0oDAO
         1oDDFFX02//OkSrSzTvUIohQsonuFPbJV3pVq652hJ7l7DrQhE6ViMOctlEZsdBso/8R
         16uqGLf+oNf7TCU4a5Yo4nIar70+moeNI5PJAtgGyqez5HD4dzcyyxCotM9sqx5k1sas
         5RUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680676450;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VX8BaURDAmMiXn1X2BAcvGxFigvEA3txrLdW+Fx+IZw=;
        b=aL3wrjixjAiy1XY3LTVFisGD8eS/Al4JmfRTk0KCVdphU6yrz9jeM3K+sXHNTWmrfe
         e9dZNxab5RhNnTUEGYGG0xPGMO8kDYUNyYkruLGtP7gZ9ouRwff4+yR3eppDFFj57FD1
         HU3iCTVfnSqsNnQ8jXvn9Z+DbA/kKtqoHGjULCY0evLnieN4/ZerZ6pc6NB3Xu1NjRTb
         bhxvyLQNnheVL2jsreLM3v5IJ1g+9FtvrpKsLe09UxU9Kn/fwDI0DVmvN+jPct71HZuh
         29mvVBkVRVjltqY5GqlpsvwPs0BADGXVd/8if8Nc9D/9hWKTbV0xg5RSjzwLaWfKPMdw
         7dlA==
X-Gm-Message-State: AAQBX9eEiS/AfXtpOSAzHCe4RtDpykqi+2CZrcmYBMth5Cf/mYvV+nZ3
	cIncKAbT+QXJaW6wGsccMld3hTD0sArbc3VPcAE=
X-Google-Smtp-Source: AKy350a6HrlFnAMQgKd+vCIeoY1a0fFXtmjdYQgCre2Kq5RpcQRJhbuwBnu7NwqDheLpf2xZ72hpHg==
X-Received: by 2002:a17:906:8602:b0:946:b942:ad6f with SMTP id o2-20020a170906860200b00946b942ad6fmr1441549ejx.8.1680676450041;
        Tue, 04 Apr 2023 23:34:10 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:3f:6b2:54cd:498e? ([2a02:810d:15c0:828:3f:6b2:54cd:498e])
        by smtp.gmail.com with ESMTPSA id a24-20020a509b58000000b005027d356613sm6430185edj.63.2023.04.04.23.34.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Apr 2023 23:34:09 -0700 (PDT)
Message-ID: <42dea5c9-96a7-9ab7-21ec-b545059659a0@linaro.org>
Date: Wed, 5 Apr 2023 08:34:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [net-next v9 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Samin Guo <samin.guo@starfivetech.com>, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
 netdev@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Jose Abreu <joabreu@synopsys.com>,
 Richard Cochran <richardcochran@gmail.com>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
 Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230328062009.25454-1-samin.guo@starfivetech.com>
 <20230328062009.25454-5-samin.guo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230328062009.25454-5-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_233413_902567_E2F72858 
X-CRM114-Status: GOOD (  18.90  )
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

On 28/03/2023 08:20, Samin Guo wrote:
> From: Yanhong Wang <yanhong.wang@starfivetech.com>
> 
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 144 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  3 files changed, 151 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index e4519cf722ab..245f7d713261 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -91,6 +91,7 @@ properties:
>          - snps,dwmac-5.20
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - starfive,jh7110-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> new file mode 100644
> index 000000000000..5861426032bd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -0,0 +1,144 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 StarFive Technology Co., Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/starfive,jh7110-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 DWMAC glue layer
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +  - Samin Guo <samin.guo@starfivetech.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - starfive,jh7110-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-dwmac
> +      - const: snps,dwmac-5.20
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: GMAC AHB clock
> +      - description: PTP clock
> +      - description: TX clock
> +      - description: GTX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: pclk
> +      - const: ptp_ref
> +      - const: tx
> +      - const: gtx
> +
> +  interrupts:
> +    minItems: 3
> +    maxItems: 3
> +
> +  interrupt-names:
> +    minItems: 3
> +    maxItems: 3
> +
> +  resets:
> +    items:
> +      - description: MAC Reset signal.
> +      - description: AHB Reset signal.
> +
> +  reset-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ahb
> +
> +  starfive,tx-use-rgmii-clk:
> +    description:
> +      Tx clock is provided by external rgmii clock.
> +    type: boolean
> +
> +  starfive,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that configures phy mode
> +          - description: Offset of phy mode selection
> +          - description: Shift of phy mode selection
> +    description:
> +      A phandle to syscon with two arguments that configure phy mode.
> +      The argument one is the offset of phy mode selection, the
> +      argument two is the shift of phy mode selection.
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names

This is a friendly reminder during the review process.

It seems my previous comments were not fully addressed. Maybe my
feedback got lost between the quotes, maybe you just forgot to apply it.
Please go back to the previous discussion and either implement all
requested changes or keep discussing them.

Thank you.


Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
