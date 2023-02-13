Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48084C636D4
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Feb 2023 09:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LnIl0JeyjiUdzBBJsWQvdCQ15/VB746hI+BCUK9ZQDg=; b=4ytZQyiC0QYIVY
	gARJA/xNhHcVaelGx60em3ELZR3/bfvf2SPIKfTdnsWPKnHtJKYOa6o1CG6TkcIyM11InFT8l6pmO
	pZu4MzxajSN30I6sSThILUs27PTpNeyN7PxYeipI5dw3ymD9d+wU1ocjubAWFjRaPUX3MNPJVKJU6
	CWSbTBuCDykTYRocs//ORmz44C1d/AFaPQQoAUkBisa1r/o0QCcpTfWlKY3kQtp8RwEwndkDPhUqn
	C8pNecBluo1L0hremc1sqsee/3IRcouXElLoaqidw1yUNZyyoTt2qKKM97SWAmJR4cVtUnsShrjNT
	9uV9yed512aw1euXeK2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVEW-00DuFM-8c; Mon, 13 Feb 2023 09:34:48 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pRVAL-00DsE9-05
	for linux-riscv@lists.infradead.org; Mon, 13 Feb 2023 09:30:53 +0000
Received: by mail-wr1-x430.google.com with SMTP id bk16so11396449wrb.11
        for <linux-riscv@lists.infradead.org>; Mon, 13 Feb 2023 01:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OpHa2OO6IfUJ9x7Qw45HN5IHZS4VCZar5vwweznON50=;
        b=opZ+UQ/pXegz0SLGsPVxyy2F+I7SvtBR++2Ja90BdT6e+WGwxdDqNL4tiyNBwhxNjz
         lhS/SBpAmzILo0ZEFyBbAuRrZU934ghWnoPT25PSC7L/oYtAKg3FGc87Ytl8uscL+fuj
         CO3GYv0oTl3eBBgfrX5NqQj9tNV26fOYeiw8/9hCbtpuTDbrAJOl0M5dH6dCTpuWiNP6
         fuQNX7LO1b3Vz5SJrd5Kska792fxssD4J5mYjbsZXcUqkwMeQzSd3Q49ZEhLMP6e2KH6
         yDu1DTBNzLEn9gRAAlg9UX5CZKDmh/yJV93exUlTy0Vs6UJd+fSBYzcFuTf3ikEgjDa4
         RDSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OpHa2OO6IfUJ9x7Qw45HN5IHZS4VCZar5vwweznON50=;
        b=Y/MbTryF17v1r7meXGo2xo7AF8Ivrshv2iQYJrlvw/0yivXcO9Vcx19tQySUZ/onGn
         DG7tRgIa8/9SlGea8nUXWhPkMk77UcS/G3jiq7HI1YJAT0qe3tumaeZe3bNZJtqKfXuu
         OHl9WWhyQV95JIlM+oturF/eYBaSlKRKDLg4KDUvsbGnHimc1vvXDLjfEGbM1u/qUm/I
         AwytrY8w6CN0lP5T7NCV+Chrd3cVADCDuFXgqcpsfLtxgodPF9MggbnRZN1+tJuJ2wXz
         YjVFImENV9VKz0lzuWg57YdIUs445Ru5ZtbdpDTXR5Xl3SgvV9vxRmLKg2F29il6Hact
         OqfA==
X-Gm-Message-State: AO0yUKXK6GSG+48po5sh1q5tzPoFPedZFZSjjqpw6RsNpUmDwWqQxH3y
	AZDQ5lDolBIY4mLuMxYPdE4eaQ==
X-Google-Smtp-Source: AK7set+T1ZW6DDEn7b6T2RvBeRhzbgzRxitNFID/D8/L4CyhFCQOIccrzH+3dp9VV7nUb+Gfi/O6Nw==
X-Received: by 2002:a5d:6805:0:b0:2c5:5886:850d with SMTP id w5-20020a5d6805000000b002c55886850dmr2557588wru.5.1676280624569;
        Mon, 13 Feb 2023 01:30:24 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id c18-20020a056000105200b002c5584d0e3dsm2486583wrx.24.2023.02.13.01.30.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 01:30:24 -0800 (PST)
Message-ID: <3fc07187-f5a0-86d1-a0fd-ba18a2baf555@linaro.org>
Date: Mon, 13 Feb 2023 10:30:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Content-Language: en-US
To: Changhuang Liang <changhuang.liang@starfivetech.com>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
References: <20230210061713.6449-1-changhuang.liang@starfivetech.com>
 <20230210061713.6449-3-changhuang.liang@starfivetech.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230210061713.6449-3-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230213_013029_297587_BF01D1C7 
X-CRM114-Status: GOOD (  17.07  )
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

On 10/02/2023 07:17, Changhuang Liang wrote:
> Starfive SoC like the jh7110 use a MIPI D-PHY RX controller based on
> a M31 IP. Add a binding for it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> new file mode 100644
> index 000000000000..1c1e5c7cbee2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-dphy-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Starfive SoC MIPI D-PHY Rx Controller
> +
> +maintainers:
> +  - Jack Zhu <jack.zhu@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description: |
> +  The Starfive SOC has a MIPI CSI D-PHY based on M31 IP use to transfer
> +  the CSI cameras data.
> +
> +properties:
> +  compatible:
> +    items:

Drop items

> +      - const: "starfive,jh7110-dphy-rx"

Drop quotes

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3

Drop minItems

> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: cfg
> +      - const: ref
> +      - const: tx
> +
> +  resets:
> +    minItems: 2

Ditto

> +    maxItems: 2
> +
> +  starfive,aon-syscon:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'

Drop quotes

> +    items:
> +      items:
> +        - description: phandle of AON SYSCON
> +        - description: register offset
> +    description: The register of dphy rx driver can be configured
> +      by AON SYSCON in this property.

Can be? So does not have to? But you made it a required property....

> +
> +  "#phy-cells":
> +    const: 0
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - resets
> +  - starfive,aon-syscon
> +  - "#phy-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/starfive,jh7110-crg.h>
> +    #include <dt-bindings/reset/starfive,jh7110-crg.h>
> +
> +    dphy@19820000 {

just phy@......

> +      compatible = "starfive,jh7110-dphy-rx";
> +      reg = <0x19820000 0x10000>;
> +      clocks = <&ispcrg JH7110_ISPCLK_M31DPHY_CFGCLK_IN>,
> +               <&ispcrg JH7110_ISPCLK_M31DPHY_REFCLK_IN>,
> +               <&ispcrg JH7110_ISPCLK_M31DPHY_TXCLKESC_LAN0>;
> +      clock-names = "cfg", "ref", "tx";
> +      resets = <&ispcrg JH7110_ISPRST_M31DPHY_HW>,
> +               <&ispcrg JH7110_ISPRST_M31DPHY_B09_ALWAYS_ON>;
> +      starfive,aon-syscon = <&aon_syscon 0x00>;
> +      #phy-cells = <0>;
> +    };

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
