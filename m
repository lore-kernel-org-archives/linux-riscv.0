Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F3D5C2D0A3
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:36:44 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BCD48206C0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:36:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="L2CC5sXz"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BCD48206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=wWYMnVqtFSNttxJKJXJC+JpwIlUNBw0Z43JodFlHvCc=; b=L2CC5sXzFwHN8MgdkzKb7g8+b
	XFeJYKmF/TIC+FDgYIMxabnGishtza6J+NDjsfdnZ7ZAM2Dat59WEa7GtFhRz6vHXKX4nw13gNwW8
	CjspHq85zJTq47Ehy17bNA4HYQu0ePandvxxoucYe1l4S7vwYBegxHVk7Hh28PHihHWVM7b1rV8pv
	ZjHXNuoQpCt8hTEpSQfD/lXlwEx9znpNp/Nyjt6V5NVOkRwTqH4MHQk0oL8xW+3obIcR69AUoIDNP
	uUmwCMxPq1UAg5U1i2CPf+TpuTf3UQU/Ng6VfsCIGTyz8sd6B2OP4l5E5QJ5dMetChYw0jtkry9W6
	jNkK6w0QA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9Db-00042H-D9; Mon, 09 Nov 2020 15:36:31 +0000
Received: from mail-ot1-f67.google.com ([209.85.210.67])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9DY-00041s-Pp
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:36:29 +0000
Received: by mail-ot1-f67.google.com with SMTP id 32so9319527otm.3
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:36:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=SQjVmuqZMbhgGoRanGDNbmuAYzqzxVPrj4Zn4x0esuw=;
 b=c94JCNOfaaILwgsF/aezm0v3Qmx03T5CbJM600pszcQ8dijLCWt/HMrU4xaHXWRKxF
 4czcfQgwqsg1pfDLiKxRvHfddT/DeekIfxt0ItckU9McMjiAhSO+fZVD7InG3GDHRKeW
 ieT/ULRQBnWO7x+9CGm19V/LiKQ/4W9O0gxEDOv0pEcyzLo6e6pO7J/46k5u+22f9nM/
 FaCTYxsgSRYFIzYoe4BCc4fHuPd7a8WOPC5m5fALWpJ7v7/IsYgDCs13Yw1jDjojBl7m
 au5Oylgj2nU64leu5QXimg3gT7U82AfwnoWK+HRaCvGyzwOALrnx5MhYqC+wWyaFdekU
 UG/g==
X-Gm-Message-State: AOAM532ybJiVuDxpLZgvHNrked411gEXmLqwuWSM6Q5Gle8Stuc11n3P
 mBOZFGgf+OS+9/TJb+RL5w==
X-Google-Smtp-Source: ABdhPJxG1AyzsSxmwoQK4EuOrEbQSq+zby2rybDTeCp2clGuek5+YBiOKuVOn0QvG/RG+K1PlOPQ4Q==
X-Received: by 2002:a9d:62c9:: with SMTP id z9mr11030709otk.18.1604936187448; 
 Mon, 09 Nov 2020 07:36:27 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id l8sm1085447oof.2.2020.11.09.07.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:36:26 -0800 (PST)
Received: (nullmailer pid 1334806 invoked by uid 1000);
 Mon, 09 Nov 2020 15:36:25 -0000
Date: Mon, 9 Nov 2020 09:36:25 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 24/32] dt-bindings: Document kendryte,k210-fpioa bindings
Message-ID: <20201109153625.GB1330401@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-25-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-25-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_103628_898352_54696EA4 
X-CRM114-Status: GOOD (  23.50  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Serge Semin <fancer.lancer@gmail.com>, linux-spi@vger.kernel.org,
 linux-gpio@vger.kernel.org, Mark Brown <broonie@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-riscv@lists.infradead.org, Sean Anderson <seanga2@gmail.com>,
 Frank Rowand <frowand.list@gmail.com>, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sat, Nov 07, 2020 at 05:14:12PM +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Kendryte K210 SoC Fully
> Programmable IO Array (FPIOA) pinctrl driver in
> Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/pinctrl/kendryte,k210-fpioa.yaml | 106 ++++++++++++++++++
>  1 file changed, 106 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> new file mode 100644
> index 000000000000..8730add88ee0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/kendryte,k210-fpioa.yaml
> @@ -0,0 +1,106 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/kendryte,k210-fpioa.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kendryte K210 FPIOA (Fully Programmable IO Array) Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description:
> +  The Kendryte K210 SoC Fully Programmable IO Array controller allows assiging
> +  any of 256 possible functions to any of 48 IO pins. Pin function configuration
> +  is performed on a per-pin basis.
> +
> +properties:
> +  compatible:
> +    const: kendryte,k210-fpioa
> +
> +  reg:
> +    description: FPIOA controller register space base address and size
> +
> +  clocks:
> +    minItems: 2
> +    maxItems: 2

Can drop these. Implied by 'items' length.

> +    items:
> +      - description: Controller reference clock source
> +      - description: APB interface clock source
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      - const: ref
> +      - const: pclk
> +
> +  resets:
> +    maxItems: 1
> +
> +  kendryte,sysctl:
> +    minItems: 1
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      phandle to the system controller node
> +
> +  kendryte,power-offset:
> +    minItems: 1
> +    maxItems: 1
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description: |
> +      Offset of the power domain control register of the system controller.

Sounds like you should be using power-domains binding.

> +      The value should be the macro K210_SYSCTL_POWER_SEL defined in
> +      dt-bindings/mfd/k210-sysctl.h.
> +
> +patternProperties:
> +  '^.*$':
> +    if:
> +      type: object
> +    then:

This is a hack for existing bindings. Use '-pins$' for the node names.

> +      patternProperties:
> +        "^pinmux$":

Not really a pattern.

> +          $ref: /schemas/pinctrl/pincfg-node.yaml

This is at the wrong level. Goes up 1 level.

> +          description:
> +            An array of IO pins alternate functions. The values for each
> +            IO pin is a combination of an IO pin number (0 to 47) with the
> +            desired function for the IO pin. Functions are defined as macros in
> +            dt-bindings/pinctrl/k210-pinctrl.h. The K210_FPIOA(IO pin, function)
> +            is provided to facilitate the combination of IO pin numbers and
> +            functions.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - resets
> +  - kendryte,sysctl
> +  - kendryte,power-offset
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/k210-pinctrl.h>
> +    #include <dt-bindings/mfd/k210-sysctl.h>
> +    #include <dt-bindings/clock/k210-sysctl.h>
> +    #include <dt-bindings/reset/k210-sysctl.h>
> +
> +    fpioa: pinmux@502B0000 {
> +      compatible = "kendryte,k210-fpioa";
> +      reg = <0x502B0000 0x100>;
> +      clocks = <&sysclk K210_CLK_FPIOA>;
> +      resets = <&sysrst K210_RST_FPIOA>;
> +      kendryte,sysctl = <&sysctl>;
> +      kendryte,power-offset = <K210_SYSCTL_POWER_SEL>;
> +      pinctrl-0 = <&fpioa_jtag>;
> +      pinctrl-names = "default";
> +
> +      fpioa_jtag: jtag {
> +        pinmux = <K210_FPIOA(0, K210_PCF_JTAG_TCLK)>,
> +                 <K210_FPIOA(1, K210_PCF_JTAG_TDI)>,
> +                 <K210_FPIOA(2, K210_PCF_JTAG_TMS)>,
> +                 <K210_FPIOA(3, K210_PCF_JTAG_TDO)>;
> +      };
> +    };
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
