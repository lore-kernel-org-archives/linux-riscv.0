Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F083AC433F5
	for <linux-riscv@archiver.kernel.org>; Thu, 29 Sep 2022 18:45:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=49oygQwJn8IWojLD2H+nc29LhlNk6B6rgf1H6+C5Kns=; b=QgoA2WZWZyVxiw
	WCdpV1AkCxuhADhtQhmUalyrS55eL8S2UyOfZ2fvft/WKhArmSMExjKv3yY9uvZ4+QE1tng+eoDtf
	AFEbCx69KF6NyE5MXSee0wb36gZECGl79q1+iDZtxyK0SLfQKJXmHvvaNVY0yqOIEJ0Fgd23pYDmk
	XggACRpj5Uy2So4lqHbc7/77soREd2sEO/RYrkz9a6sVf05wGeDfNYjyuSnUa0AHkUToZmAjpcgOS
	HJ/1QcMeEYP6fUFPCKBAgQneSIYiv4NOsFFhjfUhSAZaulu7thkJsTVh5y5REYq5GxYKhV5xhV7vt
	HNHtoMl7/NvXhkP6XW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odyWv-00501L-W4; Thu, 29 Sep 2022 18:45:06 +0000
Received: from mail-oa1-f51.google.com ([209.85.160.51])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odyVk-004z7n-Or
	for linux-riscv@lists.infradead.org; Thu, 29 Sep 2022 18:43:57 +0000
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-131886d366cso2841510fac.10
        for <linux-riscv@lists.infradead.org>; Thu, 29 Sep 2022 11:43:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=Q4kEonMB6d7v5hHIJWkTHsGtsa94Xy9dbaqRdwzR/jk=;
        b=TyrNM6mmFuldrgJ1Ep9XRRdrLUhhtikcGQIUr22cdG6i6Sy1WEhTBUTOe4D7A4Q7wA
         AgCusqlw96F/3QEb1xXV23MmC938qkNRfDn6HF+CfVD1txZzgosH9Usd6ixc+7URHlSG
         59ccgAbB+LbPv++o0gAC8ZFyLaSNgnHjwOp78DAT3Ml9KwpILNqjjEhVZ8IZI917Ob3E
         Pra1Hjla/JvfHn76fFR5GIrlgblEhlnv/k2igwQQwvvy4dWExOvoSJnGGO7tuTVYBt3u
         7+XAKEoXNVH03aoEwBn581QCXPTEY8UONdPtFG887WWgtnF1Lz2Pe92oNO0c2TlnMOKR
         omEA==
X-Gm-Message-State: ACrzQf0gjNL+G5w33ze/yyeCh1uBwCS/NiPy8m/XyZdHZfP1OaKx9j2q
	+aVlZCnoUPqIuzbq02pmww==
X-Google-Smtp-Source: AMsMyM5S3sep/kgC/lRMc+k20QdnFLy7atFiQAWFIW3HBrS8fou5vE8LlVATDpsRqUmmHdmf37CKvg==
X-Received: by 2002:a05:6870:3389:b0:131:94ab:fb63 with SMTP id w9-20020a056870338900b0013194abfb63mr2623611oae.41.1664477030662;
        Thu, 29 Sep 2022 11:43:50 -0700 (PDT)
Received: from macbook.herring.priv (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t16-20020a0568301e3000b00655bc7c4522sm95402otr.81.2022.09.29.11.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Sep 2022 11:43:50 -0700 (PDT)
Received: (nullmailer pid 2554700 invoked by uid 1000);
	Thu, 29 Sep 2022 18:43:49 -0000
Date: Thu, 29 Sep 2022 13:43:49 -0500
From: Rob Herring <robh@kernel.org>
To: Hal Feng <hal.feng@linux.starfivetech.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, Marc Zyngier <maz@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Stephen Boyd <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Linus Walleij <linus.walleij@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 12/30] dt-bindings: reset: Add starfive,jh7110-reset
 bindings
Message-ID: <20220929184349.GA2551443-robh@kernel.org>
References: <20220929143225.17907-1-hal.feng@linux.starfivetech.com>
 <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929175147.19749-1-hal.feng@linux.starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220929_114352_874521_4248C380 
X-CRM114-Status: GOOD (  17.68  )
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

On Fri, Sep 30, 2022 at 01:51:47AM +0800, Hal Feng wrote:
> Add bindings for the reset controller on the JH7110 RISC-V
> SoC by StarFive Technology Ltd.
> 
> Signed-off-by: Hal Feng <hal.feng@linux.starfivetech.com>
> ---
>  .../bindings/reset/starfive,jh7110-reset.yaml | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> new file mode 100644
> index 000000000000..bb0010c200f9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/starfive,jh7110-reset.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/starfive,jh7110-reset.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 SoC Reset Controller Device Tree Bindings
> +
> +maintainers:
> +  - Emil Renner Berthing <kernel@esmil.dk>
> +  - Hal Feng <hal.feng@linux.starfivetech.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - starfive,jh7110-reset

'reg' needed? Is this a sub-block of something else?

> +
> +  "#reset-cells":
> +    const: 1
> +
> +  starfive,assert-offset:
> +    description: Offset of the first ASSERT register
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +
> +  starfive,status-offset:
> +    description: Offset of the first STATUS register
> +    $ref: /schemas/types.yaml#/definitions/uint32

These can't be implied from the compatible string?

> +
> +  starfive,nr-resets:
> +    description: Number of reset signals
> +    $ref: /schemas/types.yaml#/definitions/uint32

Why do you need this? Most bindings don't. If just to validate 'resets' 
args, then don't.


> +
> +required:
> +  - compatible
> +  - "#reset-cells"
> +  - starfive,assert-offset
> +  - starfive,status-offset
> +  - starfive,nr-resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/reset/starfive-jh7110.h>
> +
> +    syscrg_rst: reset-controller@13020000 {
> +        compatible = "starfive,jh7110-reset";
> +        #reset-cells = <1>;
> +        starfive,assert-offset = <0x2F8>;
> +        starfive,status-offset= <0x308>;
> +        starfive,nr-resets = <JH7110_SYSRST_END>;
> +    };
> +
> +...
> -- 
> 2.17.1
> 
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
