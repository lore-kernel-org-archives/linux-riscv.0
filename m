Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C99B4C636CD
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Feb 2023 18:29:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WZD+avYycx0cKcwsGisuLsVtkrFoCRBHA2H3sy20oF0=; b=ae+tzYQlq8Igk4
	Xja8OER7LGdUP+W8l5RPAJ64M9bx9ZOIVfNAmkFikLYDZruk1NZAIPEIrwX+iS7aeFgbSF5F8FLE2
	Z7+EvvtuZhR9KZt5O3dzOe+y3N/2qiBW9EfPL1c0ctF+5Z2atyVMX6aJasHXvMt0Av2wY8TMla7TO
	xguv+jCvs38s0rO6ojrzr0l/J35isoY3lyXYYvmMGmZW5ZanZDjURd8BjLOhhB/4jGYaB7b0VFKL+
	wwgdgdBQow28lvlnkMTiHWxdol4NRoc3w9/C8R8fiG8pBDXgnQ2anD15iFiRuKeNkcb0wnQEsFTHe
	K21DViJ4os7hHp//qoig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY9b-006wcq-Mq; Fri, 10 Feb 2023 18:29:47 +0000
Received: from mail-oi1-f176.google.com ([209.85.167.176])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pQY9X-006waZ-GU; Fri, 10 Feb 2023 18:29:45 +0000
Received: by mail-oi1-f176.google.com with SMTP id dt8so5222030oib.0;
        Fri, 10 Feb 2023 10:29:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wGTEo37sO/PejdrEzawXo41Wh2Us1e4LKILpN2RdcKM=;
        b=uL8aowhiiu42u/k7uIse6dN36Q2C0gYTOK0sbu1g92TKoPaafDfjenjhaGeewrKVvR
         8Ww6F/D6XtZT1AuCuzmrXaC8nulRWvMNASKvBk3WhzaFI5QMWqJ16XIuJ3wrtq1Y8XBd
         pOLQTPlcV93xhg0q+K8p4pW812QxcJpeX86k16Yr1PnhrxgKbQGRMwwWillzAdi0aJ7L
         Fqywz10Bd02RgKEG/faHYewg0Dkc7h3Pyb5742+3H4HymXNzAHdeKOn9CtG5cL9zNnma
         Mi10zLFalaGatsZa4ey6IeRSpgIvwEMTy77cM4ORIk5NBelUb/3WRRh4mFC+aWkeo7IE
         HhoQ==
X-Gm-Message-State: AO0yUKXOPv4S1e2nkZfAriNNYyFhsMSA1THq9SiFJEvntcWBoIopBBUj
	Icbd3+lDMLUBNAHUi8cdOQ==
X-Google-Smtp-Source: AK7set/47StQR2IteFFtY5K4A8e4jlFxeqFxgq613Kt0yzg/tmsRzIzQLGKF92qW8nmFbDRMVTy8Vw==
X-Received: by 2002:a05:6808:616:b0:364:862d:29c5 with SMTP id y22-20020a056808061600b00364862d29c5mr7107671oih.26.1676053776722;
        Fri, 10 Feb 2023 10:29:36 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id q2-20020a0568080ec200b0037d6c3fc8aasm616760oiv.45.2023.02.10.10.29.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Feb 2023 10:29:36 -0800 (PST)
Received: (nullmailer pid 2916782 invoked by uid 1000);
	Fri, 10 Feb 2023 18:29:35 -0000
Date: Fri, 10 Feb 2023 12:29:35 -0600
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v1 2/4] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Message-ID: <20230210182935.GA2914589-robh@kernel.org>
References: <20230210061713.6449-1-changhuang.liang@starfivetech.com>
 <20230210061713.6449-3-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230210061713.6449-3-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230210_102943_571937_0EAA4223 
X-CRM114-Status: GOOD (  19.63  )
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

On Thu, Feb 09, 2023 at 10:17:11PM -0800, Changhuang Liang wrote:
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

Don't need '|'

> +  The Starfive SOC has a MIPI CSI D-PHY based on M31 IP use to transfer
> +  the CSI cameras data.
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: "starfive,jh7110-dphy-rx"

Drop quotes.

> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 3
> +    maxItems: 3

Just maxItems is enough.

> +
> +  clock-names:
> +    items:
> +      - const: cfg
> +      - const: ref
> +      - const: tx
> +
> +  resets:
> +    minItems: 2
> +    maxItems: 2

Need to define what each reset is.

> +
> +  starfive,aon-syscon:
> +    $ref: '/schemas/types.yaml#/definitions/phandle-array'

Drop quotes.

> +    items:
> +      items:
> +        - description: phandle of AON SYSCON
> +        - description: register offset
> +    description: The register of dphy rx driver can be configured
> +      by AON SYSCON in this property.
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
> -- 
> 2.25.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
