Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026E3C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 16 Dec 2022 11:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=P3qNe4vqu9SQhbANIuopBMLaXHdZqoO/8+wImHXbdNc=; b=bWWemD4PIJH2x/
	x/Z5rVRydHqT8fRqwyl7oo64nxuZGViAnKDTUm0BuTDXT+RWa6R7gBWdy9p5vSggULYDeV7K+oE5a
	IGz1BHc4zW79Uo+fmsnlXYCYJq7J0YKvvUcRR0ZdOfimYbQhKkenFSLYY6B9fKoBgpiCYlR5DPUo5
	1B5joE5L3EcUrwX2tVxtpK4HYo+hV6qEyA/GrnV61nuohCLkvdHEEGVQTP5LQZXn09jZjsyv8p/a8
	LMUk0oQGks9AWGKgx5IdfxdZRCmhOAmR87WNFmiq9rX9ago/NIBgCyOCvqvkn7PWN7rySXmmhSpcJ
	ipnuATuoeKX6/FvJTRmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68XI-00EKdU-Ib; Fri, 16 Dec 2022 11:05:52 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p68XD-00EKaf-Vw
	for linux-riscv@lists.infradead.org; Fri, 16 Dec 2022 11:05:49 +0000
Received: by mail-lf1-x134.google.com with SMTP id z26so2926101lfu.8
        for <linux-riscv@lists.infradead.org>; Fri, 16 Dec 2022 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4XRGRHsiFCJ4ktT8TNwZgSlFysJO9ZB/tk8ZQbwb5zo=;
        b=VDIfWnJqJWOX/1OfsOQsHqNcGSxl/2H4LZLbiw5gWSix3Xqpq1mGZhd60FXn562FhN
         xZNO1k6mtkSw2tvlaGZFhgk/T48P+gr3mqhusbGfGtprxsEanoH6hMTSCZSEpH6EF2eU
         7Vr60xNbelZZlwuaLDbq6NLBH0EvIUHBhX2EnwqHOU+YqEYkxH/Pfx7qFW8Abv2kGqEh
         6iO1qplDtmoZBOc0fp6bxEzKR2xTe/LqypQZgpVfI4vcsHvpg9DI79AEihIGtPBWOi3g
         OL/DKWL6e9Es/wq8Fb0NKKf92p58PVFNMbEAn51Dva11PgtnBMUTmzcR2XVzpNO39ZmV
         CKFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4XRGRHsiFCJ4ktT8TNwZgSlFysJO9ZB/tk8ZQbwb5zo=;
        b=agsubbO0DIuOY28Slmi3Nad6kpWKVyZRlWjPfVjf1Z2XaeKL2WcrJH3sc00HHPTrfi
         YOdROld2LzuzFyHtoSoRxiZ9J6slkC9BCE2+GRMRnd/+EisbnaViRXeKr3LVx0TeqLg4
         WVDiuyFX9ELqsfaHcOsDVbhj1VwPxla9lnK9F2CWOIMwL2WzxqBwsPDjwOHOYVO1yE9P
         Qc6JPoGlUqC3jtQw+Vr7FG5q5Pvst7z3vENbJWVQPrBPI5ACfa29le4OpZZiLpLpdrQy
         7KSdUgshuBr3JW9SW9MRoBSqVoo5wa6iGYDTjYcmNuSwuC0IaRf/+vWpEsU6gPsYAbIy
         Ju0A==
X-Gm-Message-State: ANoB5pl2gZAXLWQA/J3w7QKA7CXk7+e6YKu3564zIsD8iFY6RMVtpyhc
	Ret17Ur00v3J0kZUli9IJIJ6gg==
X-Google-Smtp-Source: AA0mqf7RjdnDqkGDqcEvhbC2VLnr090341tf7ipweUOZhmZnoOna730rCzSEZXX7WXsJhDwR9sq2ww==
X-Received: by 2002:a05:6512:16a1:b0:4ad:5fbb:a594 with SMTP id bu33-20020a05651216a100b004ad5fbba594mr12469152lfb.58.1671188746251;
        Fri, 16 Dec 2022 03:05:46 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id h18-20020a19ca52000000b004b55075f813sm189891lfj.227.2022.12.16.03.05.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Dec 2022 03:05:45 -0800 (PST)
Message-ID: <2da394a6-411a-ca2b-90d3-7e97f3637d9f@linaro.org>
Date: Fri, 16 Dec 2022 12:05:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [PATCH v2 4/9] dt-bindings: net: Add bindings for StarFive dwmac
Content-Language: en-US
To: Yanhong Wang <yanhong.wang@starfivetech.com>,
 linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-5-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221216070632.11444-5-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221216_030548_117026_207F312D 
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

On 16/12/2022 08:06, Yanhong Wang wrote:
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,jh71x0-dwmac.yaml   | 103 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  3 files changed, 109 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh71x0-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 7870228b4cd3..cdb045d1c618 100644
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
> diff --git a/Documentation/devicetree/bindings/net/starfive,jh71x0-dwmac.yaml b/Documentation/devicetree/bindings/net/starfive,jh71x0-dwmac.yaml
> new file mode 100644
> index 000000000000..5cb1272fe959
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/starfive,jh71x0-dwmac.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 StarFive Technology Co., Ltd.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/starfive,jh71x0-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH71x0 DWMAC glue layer
> +
> +maintainers:
> +  - Yanhong Wang <yanhong.wang@starfivetech.com>
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
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - starfive,jh7110-dwmac

Is it going to grow with new models? If yes, when? If not, filename does
not match compatible.

> +      - const: snps,dwmac-5.20
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: GMAC AHB clock
> +      - description: PTP clock
> +      - description: TX clock
> +      - description: GTXC clock
> +      - description: GTX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: pclk
> +      - const: ptp_ref
> +      - const: tx
> +      - const: gtxc
> +      - const: gtx

missing resets and reset-names.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +unevaluatedProperties: false
> +
Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
