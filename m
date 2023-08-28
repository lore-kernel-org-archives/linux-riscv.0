Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51C33C83F12
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Aug 2023 13:13:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkyEWTBmJpzLKNleWxDp4rNHdHuDqS0EPjd1unzfDtI=; b=HC/srBn7IT4Zl+
	Sjv0QjdAkq5yOu/0rgQMMX2e5+4eE0RMfDx9xID9Dpg41e6GULJeYPzcBa/0CAgQZD+E68huq90Wh
	Hp4ydmFR2eUaUmShHLA72I7sPrsJR7SAEwX/2ONAy/ej54xtMb9cut3y5M2xnU1G2Hx3iFTNLXUZO
	V3obVqZHXfftr7ljrYjxw5085q4sr8QeffcimQXl0YCtE3wnnPkyhc5SLqTGz8w6JpQVsLsxPCaUV
	NsLVwFYpRD9qTfbsGKeGfFB7vOIs6qsqghTS0MOmxrYT/YJm6iSMBI8CLdVqs8FL6Bbl+apwsCPQ9
	0R6zsOwR6eLTC95XxF1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qac3Y-009cHt-2Y;
	Mon, 28 Aug 2023 13:13:24 +0000
Received: from mail-lf1-x12e.google.com ([2a00:1450:4864:20::12e])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qac3U-009cGR-1x;
	Mon, 28 Aug 2023 13:13:22 +0000
Received: by mail-lf1-x12e.google.com with SMTP id 2adb3069b0e04-50079d148aeso4858661e87.3;
        Mon, 28 Aug 2023 06:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693228389; x=1693833189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=vPcs0sktiib0CVnQrsGDXOLxOsYaOoyJrgrvneL+iRI=;
        b=EEnmV2sMju/dqKLAuQnHnueTheowYjzwfKRXRixXky7c7ImDccINdT0pTl+/2ge+j+
         W1pQXboC6Ty5KaPQZKmUab5cR3/E3SPwFn9K5eeYl/qmeBKaQa0ZNEv0Ddn8XiMFJqQu
         qD/Z4VBRm4rRaM4vVz88+OFysYVXVgVRKBzET7RGwE1kO4apkcxPBMqGD+JJw6ak5oyb
         cbRNV3fTTE0nex1r7M5S7x16TkQYwiy8j7DXsPDziOQbK2rK4EsaWc8IHmA34JmackPg
         2L1uMD91hM5K9qVgvueZ9hdPljPNiLj8bD9B18OaT2HrcTATN4QQajG50QkT5f9Qkpyl
         2zCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693228389; x=1693833189;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vPcs0sktiib0CVnQrsGDXOLxOsYaOoyJrgrvneL+iRI=;
        b=DDykd1Y1paUEBezyAHQa4Y8aqDvIze/vBvbUtP4R4DCg7C3tVmPXTjmcV1NvHnqWi8
         1Fl8s55ZjDzk+t/uGRH20W5dia8kUpsDskC9cROApkZZiqlBgcB5CCjzSFO9EZ/g1OEv
         E+97SGE4A0bdesyWArMEs7jZH8q0+O+T8Cb3WhxwTx9Hv/S7/dWe1xheSzCOIofX6lcd
         ZA1kKF8Aj9L3EGSCjIKdtYVXqb/GEFr7qdf1v1gFjRZbyjcrAu53yiLJmzOcSGhjdk2Y
         BCqtjvChxQUYAxpVux0x5WyIdF7KtZqTeHLFNOvCLq4C5vAnSPZroQbBAOdrk2I29GtI
         oNxw==
X-Gm-Message-State: AOJu0YwlUyjq6XXbtY176Vr9fSRdH8xE877sLajjtQHi7XiS6G2BsiIr
	RXBhcHfIrMpV7sqU2S20P1s=
X-Google-Smtp-Source: AGHT+IEm2nDKmysz9bZqzY/IjgJcyF6bL+NRMaFzEewPti0bqJYqOQn+cfpgmS2KGCGOxCmnPQWspQ==
X-Received: by 2002:a2e:99c4:0:b0:2bc:e856:6208 with SMTP id l4-20020a2e99c4000000b002bce8566208mr8664753ljj.33.1693228388708;
        Mon, 28 Aug 2023 06:13:08 -0700 (PDT)
Received: from mobilestation ([178.176.56.174])
        by smtp.gmail.com with ESMTPSA id n23-20020a2e86d7000000b002b9e5fe86dasm1727253ljj.81.2023.08.28.06.13.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Aug 2023 06:13:08 -0700 (PDT)
Date: Mon, 28 Aug 2023 16:13:00 +0300
From: Serge Semin <fancer.lancer@gmail.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime@web.codeaurora.org, Coquelin@web.codeaurora.org, 
	Simon Horman <simon.horman@corigine.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH net-next v2 2/3] dt-bindings: net: add T-HEAD dwmac
 support
Message-ID: <qc2nyqmuouig6qww2q7orlwzvcprjyruyeuyr5dqdpxysajjpv@6fzsgjgokry7>
References: <20230827091710.1483-1-jszhang@kernel.org>
 <20230827091710.1483-3-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230827091710.1483-3-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230828_061320_664098_D4108D3E 
X-CRM114-Status: GOOD (  21.68  )
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

On Sun, Aug 27, 2023 at 05:17:09PM +0800, Jisheng Zhang wrote:
> Add documentation to describe T-HEAD dwmac.
> 
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |  1 +
>  .../devicetree/bindings/net/thead,dwmac.yaml  | 77 +++++++++++++++++++
>  2 files changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/thead,dwmac.yaml
> 
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index b196c5de2061..73821f86a609 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -96,6 +96,7 @@ properties:
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
>          - starfive,jh7110-dwmac
> +        - thead,th1520-dwmac
>  
>    reg:
>      minItems: 1
> diff --git a/Documentation/devicetree/bindings/net/thead,dwmac.yaml b/Documentation/devicetree/bindings/net/thead,dwmac.yaml
> new file mode 100644
> index 000000000000..bf8ec8ca2753
> --- /dev/null

> +++ b/Documentation/devicetree/bindings/net/thead,dwmac.yaml

see further regarding using dwmac in the names here.

> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/thead,dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +

> +title: T-HEAD DWMAC Ethernet controller

Additionally would be nice to have a brief controller "description:"
having the next info: the SoCs the controllers can be found on, the DW
(G)MAC IP-core version the ethernet controller is based on and some
data about the synthesize parameters: SMA (MDIO-bus), Tx/Rx COE, DMA
FIFOs size, perfect and hash MAC-filters size, L3L4 frame filters
availability, VLAN hash filter, SA/VLAN-tag insertion, ARP offload
engine, PHY interfaces (MII, RMII, RGMII, etc), EEE support, IEEE
1588(-2008) Timestamping support, PMT and Wake-up frame support, MAC
Management counters (MMC). In addition to that for DW QoS
ETH/XGMAC/XLGMAC the next info would be useful: number of MTL Queues
and DMA channels, MTL queues capabilities (QoS-related), TSO
availability, SPO availability.

Note DMA FIFO sizes can be also constrained in the properties
"rx-fifo-depth" and "tx-fifo-depth"; perfect and hash MAC-filter sizes -
in "snps,perfect-filter-entries" and "snps,multicast-filter-bins".

> +
> +maintainers:
> +  - Jisheng Zhang <jszhang@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:

> +          - thead,th1520-dwmac

Referring to the DW IP-core in the compatible string isn't very
much useful especially seeing you have a generic fallback compatible.
Name like "thead,th1520-gmac" looks more informative indicating its
speed capability.

> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:

> +          - thead,th1520-dwmac

ditto.

-Serge(y)

> +      - const: snps,dwmac-3.70a
> +
> +  reg:
> +    maxItems: 1
> +
> +  thead,gmacapb:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      The phandle to the syscon node that control ethernet
> +      interface and timing delay.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - phy-mode
> +  - thead,gmacapb
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    gmac0: ethernet@e7070000 {
> +        compatible = "thead,th1520-dwmac", "snps,dwmac-3.70a";
> +        reg = <0xe7070000 0x2000>;
> +        clocks = <&clk 1>, <&clk 2>;
> +        clock-names = "stmmaceth", "pclk";
> +        interrupts = <66>;
> +        interrupt-names = "macirq";
> +        phy-mode = "rgmii-id";
> +        snps,fixed-burst;
> +        snps,axi-config = <&stmmac_axi_setup>;
> +        snps,pbl = <32>;
> +        thead,gmacapb = <&gmacapb_syscon>;
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
> -- 
> 2.40.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
