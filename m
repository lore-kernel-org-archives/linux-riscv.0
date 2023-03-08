Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 641D7C6FD19
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Mar 2023 21:59:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DCmZV9qeqeCS5fxp7DIgIs7SObFURNbyRqlagLgRNx4=; b=KcSvTe6cce21Mf
	TjENJQOqtyCfU/TjOrtz3X0WsnhelqdUUdIDTYYV19wCHC+Ye8sHaoXGaXmTFRDv9qHbLDg6Wc6x5
	5TIwCycR9WORhSKiYVj/IrQoOKK45Rv+72i1BBDiMTYoWcemRb7wFtwOdR4g8Qv7kpOR2ihZCkwA5
	qs1UH99db0j9tgBM/XODoAQMHxTPY9VKDDA1WQbd8vS2y6jGzQoEOCE9qaMqH6IrgjXPR/JuaLVyR
	0wPGWvxfAsSb/AK+u9Ddf5wO4kLiINYkLPcFFUZT+e4m1FZonYsoz//FjqVUVhSO0xM7UGUZOebBR
	goz4tPu2M4JKF9l7OAyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1od-006uex-Rr; Wed, 08 Mar 2023 21:59:19 +0000
Received: from mail-ot1-f48.google.com ([209.85.210.48])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pa1ob-006ueM-Lm
	for linux-riscv@lists.infradead.org; Wed, 08 Mar 2023 21:59:19 +0000
Received: by mail-ot1-f48.google.com with SMTP id e9-20020a056830200900b00694651d19f6so6920768otp.12
        for <linux-riscv@lists.infradead.org>; Wed, 08 Mar 2023 13:59:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678312756;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8zlXSnMRJPYfLbixN9EXHHN0qB6jtGkytaRGS5ki5aI=;
        b=FoBhFF5mdIrxhWLYsWRS/Yohp7lJUskeN3tSrbEp9u0t19Cbtua+cfdc/SfDoj22Ug
         nrBzEE1qU/+3YsosTCbpHaN2g9OMQWuPnJz7bpfh3/ym/pd0tYB6NCl6eB3FMXlD9OGd
         8PELEWhVSq7A8YIF7nFePWBLuDygRvC4O74OQoLGsA9npRX9Tb268qIcXKi0+0vxrfC3
         t41H6CyQ1Udo8EcFGdrmBRokVjXR8x3gwPnDRTrAUR/R1HBbAXHlePubiCRdsbY+pQdb
         zNiRgL2ITUVFjMWPfkFLXr3kWE7NQR60PS55G6XV6XifjVwSuUuZajDUEwvyRzZXo/fZ
         o3aA==
X-Gm-Message-State: AO0yUKVS3gqkZ3I/j/9Js0DDYrsPS8RIvmVa1sJKZ5m0colatr+a/23s
	sKuNeJiucLD8lnFYVCHLYw==
X-Google-Smtp-Source: AK7set+Df1FSt526SUD1t+1ggqqkwsSf4k6oWoLoO/zuzY//dQhI/mu1F1AFSzIePg/LVfuSOjZVhA==
X-Received: by 2002:a9d:855:0:b0:68d:7a7b:bd61 with SMTP id 79-20020a9d0855000000b0068d7a7bbd61mr9263669oty.23.1678312756277;
        Wed, 08 Mar 2023 13:59:16 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id n25-20020a9d7119000000b0068bd922a244sm7007247otj.20.2023.03.08.13.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Mar 2023 13:59:15 -0800 (PST)
Received: (nullmailer pid 3914250 invoked by uid 1000);
	Wed, 08 Mar 2023 21:59:15 -0000
Date: Wed, 8 Mar 2023 15:59:15 -0600
From: Rob Herring <robh@kernel.org>
To: Samin Guo <samin.guo@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>, Yanhong Wang <yanhong.wang@starfivetech.com>
Subject: Re: [PATCH v5 04/12] dt-bindings: net: Add support StarFive dwmac
Message-ID: <20230308215915.GA3911690-robh@kernel.org>
References: <20230303085928.4535-1-samin.guo@starfivetech.com>
 <20230303085928.4535-5-samin.guo@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230303085928.4535-5-samin.guo@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230308_135917_733570_941BE8CA 
X-CRM114-Status: GOOD (  17.28  )
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

On Fri, Mar 03, 2023 at 04:59:20PM +0800, Samin Guo wrote:
> From: Yanhong Wang <yanhong.wang@starfivetech.com>
> 
> Add documentation to describe StarFive dwmac driver(GMAC).
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> Signed-off-by: Samin Guo <samin.guo@starfivetech.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/starfive,jh7110-dwmac.yaml   | 117 ++++++++++++++++++
>  MAINTAINERS                                   |   6 +
>  3 files changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 89099a888f0b..395f081161ce 100644
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
> index 000000000000..ca49f08d50dd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> @@ -0,0 +1,117 @@
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
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: true

This must be false.

> +
> +required:
> +  - compatible
> +  - clocks
> +  - clock-names
> +  - resets
> +  - reset-names
> +
> +examples:
> +  - |
> +    ethernet@16030000 {
> +        compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> +        reg = <0x16030000 0x10000>;
> +        clocks = <&clk 3>, <&clk 2>, <&clk 109>,
> +                 <&clk 6>, <&clk 111>;
> +        clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                      "tx", "gtx";
> +        resets = <&rst 1>, <&rst 2>;
> +        reset-names = "stmmaceth", "ahb";
> +        interrupts = <7>, <6>, <5>;
> +        interrupt-names = "macirq", "eth_wake_irq", "eth_lpi";
> +        phy-mode = "rgmii-id";
> +        snps,multicast-filter-bins = <64>;
> +        snps,perfect-filter-entries = <8>;
> +        rx-fifo-depth = <2048>;
> +        tx-fifo-depth = <2048>;
> +        snps,fixed-burst;
> +        snps,no-pbl-x8;
> +        snps,tso;
> +        snps,force_thresh_dma_mode;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        snps,en-tx-lpi-clockgating;
> +        snps,txpbl = <16>;
> +        snps,rxpbl = <16>;
> +        phy-handle = <&phy0>;
> +
> +        mdio {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +            compatible = "snps,dwmac-mdio";
> +
> +            phy0: ethernet-phy@0 {
> +                reg = <0>;
> +            };
> +        };
> +
> +        stmmac_axi_setup: stmmac-axi-config {
> +            snps,lpi_en;
> +            snps,wr_osr_lmt = <4>;
> +            snps,rd_osr_lmt = <4>;
> +            snps,blen = <256 128 64 32 0 0 0>;
> +        };
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 5c67c75a940f..4e236b7c7fd2 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19912,6 +19912,12 @@ M:	Emil Renner Berthing <kernel@esmil.dk>
>  S:	Maintained
>  F:	arch/riscv/boot/dts/starfive/
>  
> +STARFIVE DWMAC GLUE LAYER
> +M:	Emil Renner Berthing <kernel@esmil.dk>
> +M:	Samin Guo <samin.guo@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
> +
>  STARFIVE JH71X0 CLOCK DRIVERS
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Hal Feng <hal.feng@starfivetech.com>
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
