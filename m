Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A059C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 16:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FQ5fg74CQi9j8Ue5aftGNRuyCQNywfvs5mG3OODCuQs=; b=ds4ze0tPaCKucm
	BasZ9j9eCCQmXXt9cI+KeEpaf57NI6QY1gYdCrUzygN14h0Cm0P+VPDnM8Yu8RJPXPGBy6GCTFqN7
	VL3c59pekAefU/fHqtaBjSqIWnZg7BGiDAUJC5Ega2rs2QCpxf/ZxcV5NZ0F6Cww32Yy3uv7AKZGA
	vCCSFLxqAcErHFNzyEmavHwIbn6tgicSQjxQAqPaOAz66MIbm8FsJb9AJ6kcljUHLRv6+31WTKlgX
	tiJ7qH5W4o+ibwHpA/Tdxi+A71Kvsa6nDjkHiYb4jTnSicfIISZVxzRalJREkWUnAPRWOUBdYr2Sa
	XFHdXcat+b9o/ndAlwdA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mJG-008WLg-Vx; Thu, 01 Dec 2022 16:21:15 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0mJD-008WIH-9P
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 16:21:12 +0000
Received: by mail-lf1-x129.google.com with SMTP id p8so3221399lfu.11
        for <linux-riscv@lists.infradead.org>; Thu, 01 Dec 2022 08:21:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iegIkb4fipqnzTjEHK3Rzo5fetpTzelf4+OZ20EGaxQ=;
        b=VbvXhlxH6TipiO2qGi6mtKXCZ0FlWYWE3s3cOvx/seesTXZpq1sMLXDxBph+NPebj3
         kAOJB4fyBKMl/6/rkR4wjztOUc9WMVU7DkTPlbI/5XE+y8XpZzqP0rR03EgQpTMtEZfm
         UUv9z6659u9OUywCheoHC6K9pQwLRo8Nl4sGnGmW88JrNTvIKC//5ieGG6NQGyplmQSD
         fy5kGfrSnT+Nm1JuQPgTsLUF7NLUPVRzU7RxF45iuz8drQZazBFvXle5mGMUSqUNZhye
         V59Br0xY2ZJ2Ws2c3lvArQPzH3aRtBb1ZMKDBWk7WOogGVz1S4FCGaYPpdDXTZw1lemm
         Nr3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iegIkb4fipqnzTjEHK3Rzo5fetpTzelf4+OZ20EGaxQ=;
        b=a6tvDemc6AO442FmR35Ew3jILVL9KUkqK1Q/uP9L4PbLRzvPyla+vcqMgruaijTCRP
         soQdWUu7qibK+/OuPH3ux7BWtgU3imeeoLhPU0q/BZPEnf8o4DkynMLwrw/1fCre92Jk
         yAWQZaxGaBNFfsGFncBgmoXj4qyeuypvSrHq5jrs8kwx1MseNkyw5ZKOOtGoQJoV+Y9u
         uoEPwTMO8zxqkVXoTozbPirpT/w20wl2/E5WQgqSy1MJpzJCIAzljZ643V90yneAkdgl
         84tb7Vj/0h6wEh5JbldGsLh5PXoG9BDzwLqQ5JsywRfPNSu3CYVPjCeNk/vyro7yzfrB
         Nbow==
X-Gm-Message-State: ANoB5pmuwsEsLzjwJltIefnEXSGIRr3L/6KvLeoFcFNWG5WZq1DOEyZ8
	AWPRAmTJaD929z7/lrAZrnuB0g==
X-Google-Smtp-Source: AA0mqf6hzJAldb7QB0+TmhU70sfyI9ugpbVn1aL8hGBP0zumhEwBHDgD4o5f2wa/of7dOVE7+YARug==
X-Received: by 2002:a05:6512:34d0:b0:4a8:ebec:7140 with SMTP id w16-20020a05651234d000b004a8ebec7140mr22563341lfr.150.1669911667556;
        Thu, 01 Dec 2022 08:21:07 -0800 (PST)
Received: from [192.168.0.20] (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
        by smtp.gmail.com with ESMTPSA id c24-20020a056512075800b004a01105eea2sm690936lfs.150.2022.12.01.08.21.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Dec 2022 08:21:05 -0800 (PST)
Message-ID: <36565cc1-3c48-0fa8-f98b-414a7ac8f5bf@linaro.org>
Date: Thu, 1 Dec 2022 17:21:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.0
Subject: Re: [PATCH v1 3/7] dt-bindings: net: Add bindings for StarFive dwmac
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
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-4-yanhong.wang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221201090242.2381-4-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_082111_375740_8DFC7503 
X-CRM114-Status: GOOD (  16.23  )
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

On 01/12/2022 10:02, Yanhong Wang wrote:
> Add bindings for the StarFive dwmac module on the StarFive RISC-V SoCs.

Subject: drop second, redundant "bindings".

> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,dwmac-plat.yaml     | 106 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  3 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index d8779d3de3d6..13c5928d7170 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -33,6 +33,7 @@ select:
>            - snps,dwmac-5.20
>            - snps,dwxgmac
>            - snps,dwxgmac-2.10
> +          - starfive,dwmac
>  
>            # Deprecated
>            - st,spear600-gmac
> diff --git a/Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml b/Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml
> new file mode 100644
> index 000000000000..561cf2a713ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/starfive,dwmac-plat.yaml

Filename should base on compatible.

> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2022 StarFive Technology Co., Ltd.
> +%YAML 1.2
> +---
> +$id: "http://devicetree.org/schemas/net/dwmac-starfive.yaml#"

Does not look like you tested the bindings. Please run `make
dt_binding_check` (see
Documentation/devicetree/bindings/writing-schema.rst for instructions).

> +$schema: "http://devicetree.org/meta-schemas/core.yaml#"

Drop quotes from both lines.

> +
> +title: StarFive DWMAC glue layer
> +
> +maintainers:
> +  - Yanhong Wang <yanhong.wang@starfivetech.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - starfive,dwmac
> +  required:
> +    - compatible
> +
> +allOf:
> +  - $ref: "snps,dwmac.yaml#"

Drop quotes.

> +
> +properties:
> +  compatible:
> +    oneOf:

Drop oneOf. You do not have more cases here.

> +      - items:
> +          - enum:
> +               - starfive,dwmac

Wrong indentation.... kind of expected since you did not test the bindings.

> +          - const: snps,dwmac-5.20
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
> +    contains:
> +      enum:
> +        - stmmaceth
> +        - pclk
> +        - ptp_ref
> +        - tx
> +        - gtxc
> +        - gtx

Names should be specific and with fixed order, just like clocks are.

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
