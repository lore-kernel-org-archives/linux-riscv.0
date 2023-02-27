Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3D5DC64ED8
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Feb 2023 18:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=70zy9w2haonXmZGZ8hAwDsfzwMbiwPCvRwQMxa5enNc=; b=EwdcJAdfbgfc1Z
	b61/k14maM//SWidXFQk28b5hvbEhyo9sNwymObrDE2UhIiVxEYk5M+vFgsBDKc+/dTfXXKKQMLPr
	lt5T8+Q+fnsDbZjHu2C9+9dGIvqONF2LMESRjLTjriK/6R7ZQ+aRA31Qlz/I9+hm6cuzoy48CErKw
	Z7Wqcch7uSQgDbSwP6euLlo6t1CgZIjnQ3+EQ4pNpvxBGcvCoRYBNJiZBaTPsOGN27fDRZE1CNZFe
	Z2fVe28Q7QmW9crgL75OAOAXXOv5HOQcft1FhxBBp/uflIStE5LHb0XalPs7bM01BCZ+0Maf6qnrr
	V+azXAQrVbUeqsKx4EtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiKg-00Akal-Eh; Mon, 27 Feb 2023 18:34:42 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWiKc-00AkZL-Qn; Mon, 27 Feb 2023 18:34:40 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-17264e9b575so8333301fac.9;
        Mon, 27 Feb 2023 10:34:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/n6Yv51jW5LAwlzGIh67sJQM+UVRJdiU8ADnwyoJqp4=;
        b=P3l/eh+wVi4nfJH/hmO+mi58/uEYJ+YnXsIo+jYlCjY/uAmkwzIRvcqYUrEnz+qQt5
         kaG+IQsaK+zB4knwddQN9wictj1Sz403NoVZOYzEd9mp+EEGQ80Y/4uLVM/DHFSsycJL
         V8XVdiU+4kvPo2OJU1b2iWH8KWM94JaBV2d2oYFpJnDMdRWMXW0mkZwf/c3DcILP3aNc
         m6QKZockHvsjX6BHX/Aj8/G0SbmCGfFlqzfRRwutA9qqUtBA5y3bkXu/v65Ks/3wA3y0
         BHPi8tU4PlwJoQwbvcAcUK9DfX50Fz0Y/NKf+hUrtztTnqsFOeHUcf9LafOcTSQtz4dB
         XgyA==
X-Gm-Message-State: AO0yUKX7J/Io3cwSAs857wX80hfXVfYp5Ym7HMIpMMt4zTtvCS9TSsHw
	dvwbRF5eFcdikHIZcRLlSw==
X-Google-Smtp-Source: AK7set/ZtQIEXLigG6HKVUhIDHBY2W/Gvzvr0DTnjglSjgXggcIfBsaT1ydf9BJAYYtr0mOVbmGB4A==
X-Received: by 2002:a05:6870:f283:b0:172:fda1:5773 with SMTP id u3-20020a056870f28300b00172fda15773mr3395641oap.32.1677522875743;
        Mon, 27 Feb 2023 10:34:35 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id ef27-20020a0568701a9b00b00152c52608dbsm2545569oab.34.2023.02.27.10.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Feb 2023 10:34:35 -0800 (PST)
Received: (nullmailer pid 647312 invoked by uid 1000);
	Mon, 27 Feb 2023 18:34:34 -0000
Date: Mon, 27 Feb 2023 12:34:34 -0600
From: Rob Herring <robh@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Philipp Zabel <p.zabel@pengutronix.de>, Jack Zhu <jack.zhu@starfivetech.com>, linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: phy: Add starfive,jh7110-dphy-rx
Message-ID: <20230227183434.GA642331-robh@kernel.org>
References: <20230223015952.201841-1-changhuang.liang@starfivetech.com>
 <20230223015952.201841-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230223015952.201841-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230227_103438_892301_3FA4F8FA 
X-CRM114-Status: GOOD (  18.93  )
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

On Wed, Feb 22, 2023 at 05:59:50PM -0800, Changhuang Liang wrote:
> Starfive SoCs like the jh7110 use a MIPI D-PHY RX controller based on
> a M31 IP. Add a binding for it.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../bindings/phy/starfive,jh7110-dphy-rx.yaml | 74 +++++++++++++++++++
>  1 file changed, 74 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> new file mode 100644
> index 000000000000..a67ca57a6f21
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
> @@ -0,0 +1,74 @@
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
> +description:
> +  The Starfive SoC uses the MIPI CSI D-PHY based on M31 IP to transfer
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
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: cfg
> +      - const: ref
> +      - const: tx

Should be 'rx' given this is the 'rx' block? A description of each clock 
in 'clocks' would be good.

> +
> +  resets:
> +    items:
> +      - description: DPHY_HW reset
> +      - description: DPHY_B09_ALWAYS_ON reset
> +
> +  starfive,aon-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      items:

- items: ?

Otherwise, multiple 2 cell entries are allowed. Is that intended?

> +        - description: phandle of AON SYSCON
> +        - description: register offset
> +    description: The power of dphy rx is configured by AON SYSCON
> +      in this property.


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
