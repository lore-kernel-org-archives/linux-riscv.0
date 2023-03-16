Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBF62C6FD1F
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 07:28:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DQ8uL3aSmqMQPbM1SqY31lx/nhXcohNTIL43ING6V8w=; b=c6LsjWy63wYtcT
	9gQb5RhEKO/cHGzpD0RUsaX7mo7pYk2roaWWha9tt+VwAZRfElXMEjk9rFyGVapJAHo2cXun2lK8a
	gaSb+2HVnxY9GvLRPHAldoQGdVJ8oqOkrcJcBUNrzyJT5RLjralDQwHhfGTlEmg8eXS6J4zCloR+5
	9pZwerXKRve2EB7Qha5T8PO9V0SGNLiP3WH+v8klILpeRBZ26QjqqeaAscOucn+CDBg2XFaLTcjW2
	Wgesul67cYgenw2cRjZSDA/4WlpAtiptJ6WJHB7kMm8SPzWaOosdoSe97e6YH5CnLG4FBYSR0m7V/
	UqEU0shNfFAGI1FmnFeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pci1n-00FUor-1C;
	Thu, 16 Mar 2023 07:27:59 +0000
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pci1k-00FUnh-0u
	for linux-riscv@lists.infradead.org;
	Thu, 16 Mar 2023 07:27:57 +0000
Received: by mail-ed1-x532.google.com with SMTP id eh3so3755760edb.11
        for <linux-riscv@lists.infradead.org>; Thu, 16 Mar 2023 00:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678951670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XK209g2VbExh/TqurSdOwtwH2IufznodX/JmW/3KLmc=;
        b=HChaTJc3kHVEAb6hVQADOZpU05dX3YjTZxKyDvkpBFOo1Oe4dPjb+DMmdM14GNyeIS
         6JRluNCuzmDmCmE7bSlEA4J4RTmi6HSugb5kpT65Jb6FjFTJbSApl6cd9zx1arvIHTEg
         ShmjqyCKMqbOtfPgiVNOwlu2VFKGo4XaHnzNET0qVG3WeZLajFMbDEu8N7NGGUYwqNcD
         7HD0yqK4Hsuo9OLS2JxWg10s4JB7f/263Amjs5sIJTlaeHT4bv94CS9612bSWAE/rT2/
         kIXdmlmM8eC5JUa4B9+S7APiUC45tc3cTaBPdglv1N+IfqoaZFW7fqo8fzADdN52nLE3
         8yCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678951670;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XK209g2VbExh/TqurSdOwtwH2IufznodX/JmW/3KLmc=;
        b=bfHxkUCU7aUa3tob2k+Pep/RAOKpunBhl9lHc00roW2oV6AbHKi9Q31S2oW9pCwqid
         +GvYRc1/9Jm27aVY4snoQRgvWU+E23ztQS0J0Ot1jpoCmYG1MVfe9dSwmKcAILNuyQQJ
         xOJ+LgyfKm71IWyalfORKuSlnPsiOPpvDdBYb9wfYntZgVPt9u0u0f6B+4v/HLpUNYDZ
         /sdEep1mgpCOti1JS60/PqfTzAaH8ffEOXtC1ZTlFadmy9wBnAlBY5EjEIBQGu4e1KN3
         e43BjseK5J1exmmizCWKW9u7okxVGyRNg5eM6wdg6HAZIdvKBoKt2kBoRzl2h6Bpjcek
         UzSg==
X-Gm-Message-State: AO0yUKVO9dRqThX9eNY/k+eS9uxomfH1kkTyLYj4yhPWLFe8gwNG5MWR
	MA8YRtxqisYdriorYbp1w/Alsw==
X-Google-Smtp-Source: AK7set/Dr0fYdr41RCJNO5h+athWj3NTIYT68gO1NkqweUmCPxsQgXs+rJYrxMRigcX9FdXMNWx5XA==
X-Received: by 2002:a17:907:e93:b0:92f:22b1:57f9 with SMTP id ho19-20020a1709070e9300b0092f22b157f9mr5914949ejc.2.1678951669987;
        Thu, 16 Mar 2023 00:27:49 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id si2-20020a170906cec200b008e68d2c11d8sm3458672ejb.218.2023.03.16.00.27.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:27:49 -0700 (PDT)
Message-ID: <cfeec762-de75-f90f-7ba1-6c0bd8b70dff@linaro.org>
Date: Thu, 16 Mar 2023 08:27:48 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH v7 4/6] dt-bindings: net: Add support StarFive dwmac
Content-Language: en-US
To: Samin Guo <samin.guo@starfivetech.com>, linux-riscv@lists.infradead.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>,
 Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>,
 Yanhong Wang <yanhong.wang@starfivetech.com>,
 Tommaso Merciai <tomm.merciai@gmail.com>
References: <20230316043714.24279-1-samin.guo@starfivetech.com>
 <20230316043714.24279-5-samin.guo@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230316043714.24279-5-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_002756_324208_24596210 
X-CRM114-Status: GOOD (  18.29  )
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

On 16/03/2023 05:37, Samin Guo wrote:
> From: Yanhong Wang <yanhong.wang@starfivetech.com>
> 
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
Thank you for your patch. There is something to discuss/improve.

> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> Tested-by: Tommaso Merciai <tomm.merciai@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 130 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  3 files changed, 137 insertions(+)
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
> index 000000000000..b59e6bd8201f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -0,0 +1,130 @@
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

reg:
  maxItems: 1


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

interrupts: ???

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
Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
