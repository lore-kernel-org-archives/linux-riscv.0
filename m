Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67E67C7618A
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Mar 2023 15:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sf69kUg8ZB0UqBlvVVP2Krge/++yUpPA4QPapvM0pPI=; b=OfFXjVhcaGFvoV
	uvHaC2rx96ytrBZYL41lJEdmxPhDZ2i6+bXvAWlcjmkWtB+hdJ8HWJsoPiu041M31XqaP9687ve2x
	kXzU23N4fWXyw39rB51l+F8SPROhFUNgbf+ldN7xkpReSP4Hq5s+ddv6h79DpAofQuKlp6kKKan4F
	qum9vWRwfuJP4Jsvh/ZQ94t9wIaJbPkq7peYZKBp+U9e7dOT+hFT8nEeBDcrOuuOZn6UZtySXnytg
	XUYSqNNWeS/NhVoohHZzyCxjdX2yB7+PDjifc3/OHK2CzhM1wVnsMNV1Q3OVCI0VvZNYGV9kQVvCW
	K6Zi9AXE7BuagdEz20EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peHDg-009UJe-1K;
	Mon, 20 Mar 2023 15:14:44 +0000
Received: from mail-oa1-f42.google.com ([209.85.160.42])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peHDc-009UID-36;
	Mon, 20 Mar 2023 15:14:42 +0000
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-17aeb49429eso13035041fac.6;
        Mon, 20 Mar 2023 08:14:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679325278;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g5qZtnUm8Mm8wUqRNJAyXi0PBNEXChBjw1lMTidfAtY=;
        b=A9vpv0EJT3bJpKR5PBFHoIO7j4VDfxzBPgBWbBa/xvLQkHtpQaQMEAQiO94aQD/pP2
         1a/vJHPTAdkv5CnOiTFiWlW0e9e8Q7TFPgUej7xqcaF9Qh27IE0PIt9nY4EY8EXRfiAq
         7V97ic73yP/ls0Yx30CnxUZG+apkWwSrgCaGi5Y//OAiUcB/OX0Uwv/8Eyu477+IFBYD
         7A3GeMkZvlV6Np6JqNPUGrnWbiQzjiE3zXrLtksA3bWIcfqxBPY/WYA2z5+uAePRYbwI
         oZCa0ly1MmYFGtgHG/rFgnXaHyyABHd9l6qU9NAEkWm2UU/SHXiU2fiDn2ZVnM4FE7aK
         se2w==
X-Gm-Message-State: AO0yUKWWPyhNhIXbAmN6ynDdw3vv/Lriy6jI/JLhsDhA/U1Kh4uv04kb
	MET/sLv+4e7jD94PRUwZig==
X-Google-Smtp-Source: AK7set8tshMz5XRnkeEqcwB6jzvA8gX4UtDFqALHdeGzcBeOSXLMjWOv6RYPiHw3JpEfoIrBWRqlyQ==
X-Received: by 2002:a05:6871:6ab:b0:17a:a7af:6cf3 with SMTP id l43-20020a05687106ab00b0017aa7af6cf3mr5400139oao.56.1679325278373;
        Mon, 20 Mar 2023 08:14:38 -0700 (PDT)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id eo17-20020a056870ec9100b0017aa2cd117asm3395883oab.13.2023.03.20.08.14.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Mar 2023 08:14:38 -0700 (PDT)
Received: (nullmailer pid 1712355 invoked by uid 1000);
	Mon, 20 Mar 2023 15:14:37 -0000
Date: Mon, 20 Mar 2023 10:14:37 -0500
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Message-ID: <20230320151437.GA1709620-robh@kernel.org>
References: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
 <20230315100421.133428-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230315100421.133428-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_081440_994761_BF0EEFD2 
X-CRM114-Status: GOOD (  18.21  )
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

On Wed, Mar 15, 2023 at 03:04:19AM -0700, Changhuang Liang wrote:
> StarFive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
> a M31 IP. Add a binding for it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 77 +++++++++++++++++++
>  1 file changed, 77 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> new file mode 100644
> index 000000000000..b72ac44bc29d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> @@ -0,0 +1,77 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/starfive,jh7110-dphy-rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive SoC MIPI D-PHY Rx Controller
> +
> +maintainers:
> +  - Jack Zhu <jack.zhu@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive SoC uses the MIPI CSI D-PHY based on M31 IP to transfer
> +  CSI camera data.
> +
> +properties:
> +  compatible:
> +    const: starfive,jh7110-dphy-rx
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: config clock
> +      - description: reference clock
> +      - description: escape mode transmit clock
> +
> +  clock-names:
> +    items:
> +      - const: cfg
> +      - const: ref
> +      - const: tx
> +
> +  resets:
> +    items:
> +      - description: DPHY_HW reset
> +      - description: DPHY_B09_ALWAYS_ON reset
> +
> +  starfive,aon-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle of AON SYSCON
> +          - description: register offset
> +    description: The power of dphy rx is configured by AON SYSCON
> +      in this property.

Sounds like AON SYSCON should be a power-domains provider. Custom 
phandle links are for things which don't fit standard bindings.

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
> +    phy@19820000 {
> +      compatible = "starfive,jh7110-dphy-rx";
> +      reg = <0x19820000 0x10000>;
> +      clocks = <&ispcrg 3>,
> +               <&ispcrg 4>,
> +               <&ispcrg 5>;
> +      clock-names = "cfg", "ref", "tx";
> +      resets = <&ispcrg 2>,
> +               <&ispcrg 3>;
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
