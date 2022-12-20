Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91D2C4332F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Dec 2022 18:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=efp/7L+ce3W0Yt+rsmC98rXG8TISDi0wSP1jhUUUoj8=; b=xHbtLjCX/MBNkK
	oaTqf4RO5hNXVTl9ViI/vpNs8EjBNMwjKftLXWi85p6usjvhuW9zDdTwW21212+60pRZzUs9vGXoF
	RBe4zkYH2dBQdchuxS1Ewf3wqZEn8IomUb70tgslqIkLfaP5u8icsJxMiSYFpEUNgUTPFOj/XxHPN
	fZ5loOs/QMfMcE078x0SoQ9p8aqZRh7swhPE6Yz56AFctdxsQ0M/hSP/65FB/t0aW6BWFjqddGy3E
	pGmJMEjPjpbveOERUgBseyd25Zjg3rQO7yfq8Ws+DWrZGIo1l8yet1Nw0+DfO/vFkzoLnaGgxqxVZ
	E2LnW3GnzgKzMZqqJ13A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7gxQ-001qXP-CP; Tue, 20 Dec 2022 18:03:16 +0000
Received: from mail-oa1-f44.google.com ([209.85.160.44])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7gxM-001qQe-NG
	for linux-riscv@lists.infradead.org; Tue, 20 Dec 2022 18:03:14 +0000
Received: by mail-oa1-f44.google.com with SMTP id 586e51a60fabf-14455716674so16311449fac.7
        for <linux-riscv@lists.infradead.org>; Tue, 20 Dec 2022 10:03:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F2YewOJD85WGF20J/8fhEnggBVZALsncIOJvMd3kj/A=;
        b=lnvmVJnFC1ae+cxr4q8XtCbFRNBEK/NmxEZiecDM2Rxz7yRtJmnjL/wZvdtYWXEYC+
         YC85fPw9kLaRm62vMpZGvlGj8tqDZuxHWysnUvi+sM74k4FvhpdyWOU8/fnqpw1D9Th1
         xJWyHn5Ce63uNIQQf4PpxeYxmhaxCA/R5D9eSPAVc2Xk2mSy6gxcFaaudPTLL2ycn5IQ
         1Qmaj0bWhzBy5uOuKCnH26D5Z/EOFJskeZIq8IcJkLuEcVNOumfuRrlJwLGUL97/iTp1
         5Nh+TyINZ5aBzeqPdBEqjZPlIofFr8nJpUKcFKyAly+1NuWFJ8FoQm3pPLy+4zAFz2ak
         Jjhw==
X-Gm-Message-State: AFqh2kpf3mrtVC8jckiCgWgBAWuu2ExwV/68aAL0OkcG1Lm/U6TbMsZW
	wnXSqS2gbUfqVZ4wW58xfA==
X-Google-Smtp-Source: AMrXdXs5h/ALvVWclASR/ucBduXWO9SqzvD24gMo+oK9/jtvt+UcGOfbEMtSOwhOWHrQfYbvwLT0qA==
X-Received: by 2002:a05:6870:4508:b0:13a:f312:3055 with SMTP id e8-20020a056870450800b0013af3123055mr5845941oao.24.1671559391215;
        Tue, 20 Dec 2022 10:03:11 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id o15-20020a056870524f00b0010d7242b623sm6356141oai.21.2022.12.20.10.03.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Dec 2022 10:03:10 -0800 (PST)
Received: (nullmailer pid 827338 invoked by uid 1000);
	Tue, 20 Dec 2022 18:03:09 -0000
Date: Tue, 20 Dec 2022 12:03:09 -0600
From: Rob Herring <robh@kernel.org>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, "David S . Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Richard Cochran <richardcochran@gmail.com>, Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>, Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v2 4/9] dt-bindings: net: Add bindings for StarFive dwmac
Message-ID: <20221220180309.GA810622-robh@kernel.org>
References: <20221216070632.11444-1-yanhong.wang@starfivetech.com>
 <20221216070632.11444-5-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221216070632.11444-5-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221220_100312_804143_AF01DECB 
X-CRM114-Status: GOOD (  15.59  )
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

On Fri, Dec 16, 2022 at 03:06:27PM +0800, Yanhong Wang wrote:
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
> +examples:
> +  - |
> +    stmmac_axi_setup: stmmac-axi-config {

The schema says put this as a child node of ethernet@16030000.

> +        snps,lpi_en;
> +        snps,wr_osr_lmt = <4>;
> +        snps,rd_osr_lmt = <4>;
> +        snps,blen = <256 128 64 32 0 0 0>;
> +    };
> +
> +    gmac0: ethernet@16030000 {

Drop unused labels.

> +        compatible = "starfive,jh7110-dwmac", "snps,dwmac-5.20";
> +        reg = <0x16030000 0x10000>;
> +        clocks = <&clk 3>, <&clk 2>, <&clk 109>,
> +                 <&clk 5>, <&clk 111>, <&clk 108>;
> +        clock-names = "stmmaceth", "pclk", "ptp_ref",
> +                      "tx", "gtxc", "gtx";
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
> +    };
> diff --git a/MAINTAINERS b/MAINTAINERS
> index a70c1d0f303e..166b0009f63c 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -19606,6 +19606,11 @@ F:	Documentation/devicetree/bindings/clock/starfive*
>  F:	drivers/clk/starfive/
>  F:	include/dt-bindings/clock/starfive*
>  
> +STARFIVE DWMAC GLUE LAYER
> +M:	Yanhong Wang <yanhong.wang@starfivetech.com>
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/net/starfive,jh71x0-dwmac.yaml
> +
>  STARFIVE PINCTRL DRIVER
>  M:	Emil Renner Berthing <kernel@esmil.dk>
>  M:	Jianlong Huang <jianlong.huang@starfivetech.com>
> -- 
> 2.17.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
