Return-Path: <SRS0=l+yF=EP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17DE2C388F7
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:41:26 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10B9206C0
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Nov 2020 15:41:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="o8NR76/H"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A10B9206C0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=c5IKDaKR6fjDqLGLMXw6+OkKyy24BqWFaS//0brHtl8=; b=o8NR76/HYjJzGSI8t1Q82SqDj
	QwycO5NAH1v/xGOFV/M0KDWYKFYdTGJGd/2zvAaDXfRFC6SfFbqHxWvRPOxXl+TsUVOzC1Z3wv6+h
	nJzpJMu/1kkP6cghVSlDdnMjGNIdRpmaHinUFSa7efQVubrEv9YzD+mk2yTsi2PR9F+veby8l+vpg
	ZeO8suIwws3nGYak8a2Zyilbl7Aov0rAqBWwkPUswmm4L/FQQ9edCFuPy6NiwSMXezzRZbGeNZNcU
	iq/Inz7T8lArxyhjs85saQ26w0FdH1I/4PqM9lneg1Jf47HWfkT3zM42Vdq8yh/RZBwfxMNFv95RN
	DWZ3AjgvQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kc9IA-0004K5-Up; Mon, 09 Nov 2020 15:41:15 +0000
Received: from mail-oi1-f194.google.com ([209.85.167.194])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kc9I7-0004JF-03
 for linux-riscv@lists.infradead.org; Mon, 09 Nov 2020 15:41:11 +0000
Received: by mail-oi1-f194.google.com with SMTP id m13so10630299oih.8
 for <linux-riscv@lists.infradead.org>; Mon, 09 Nov 2020 07:41:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=Skf7O7xduNCjsUIYHWZYfDlsruuW2g/Oe8onPZnrLHY=;
 b=Cznr/gtfz4bSkWpU59TR0/D1i5aWnCRnMRgWlzB98MC1uGSs4NlS0d/uNXCOmovkUr
 SkRdJLDz5P43f8xLPWssCgkdZJMyR8CEie86qQOnagyNe/B6EJ2jTJAa3hCkRgas9wUG
 g1SundTXml4WL33v63SVH9bVkjEtAcham33nr7brTi5ivOItQkBuGv41389qbUDvQDZw
 /mJmi5Gr1kTGspPe8exxZrHnD4yfpR9fAuLuc6ofxgJaxN0oFUe3z/n1I3J8nwjalXnO
 hnlgmG2cS2rg1JxfMM4ZnFcwgc9wXTBur5y245DzsK+qmBjgVou2emX5/2JHQ6TP8JMN
 Hp0A==
X-Gm-Message-State: AOAM530WOyaDoXl7VGD59G7F3yhnsjCOwOdgXHEl8x8EFh7CrS92QXhi
 KgIbcirZqiusrNtreYVv1HE4LqJvgA==
X-Google-Smtp-Source: ABdhPJzUWVuxgTdkGVZ598u0iag5nus/DpRG0Lu5FTE3BKlLataQl9y9JQaFx16MvZWSDzV46y7A4g==
X-Received: by 2002:aca:30d7:: with SMTP id w206mr9533783oiw.69.1604936467974; 
 Mon, 09 Nov 2020 07:41:07 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
 by smtp.gmail.com with ESMTPSA id g8sm2429762oia.16.2020.11.09.07.41.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Nov 2020 07:41:07 -0800 (PST)
Received: (nullmailer pid 1340389 invoked by uid 1000);
 Mon, 09 Nov 2020 15:41:05 -0000
Date: Mon, 9 Nov 2020 09:41:05 -0600
From: Rob Herring <robh@kernel.org>
To: Damien Le Moal <damien.lemoal@wdc.com>
Subject: Re: [PATCH 25/32] dt-bindings: Document kendryte,k210-rst bindings
Message-ID: <20201109154105.GB1335181@bogus>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-26-damien.lemoal@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20201107081420.60325-26-damien.lemoal@wdc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201109_104111_086343_294C53D9 
X-CRM114-Status: GOOD (  20.35  )
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

On Sat, Nov 07, 2020 at 05:14:13PM +0900, Damien Le Moal wrote:
> Document the device tree bindings for the Kendryte K210 SoC reset
> controller driver in
> Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml.
> 
> Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
> ---
>  .../bindings/reset/kendryte,k210-rst.yaml     | 78 +++++++++++++++++++
>  1 file changed, 78 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> 
> diff --git a/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml b/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> new file mode 100644
> index 000000000000..bdd0bf37bdfb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/reset/kendryte,k210-rst.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/reset/kendryte,k210-rst.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Kendryte K210 Reset Controller Device Tree Bindings
> +
> +maintainers:
> +  - Damien Le Moal <damien.lemoal@wdc.com>
> +
> +description: |
> +  Kendryte K210 reset controller driver which support the system controller
> +  subsystem supplied reset registers for the various peripherals within
> +  the SoC.
> +
> +  See also:
> +  - dt-bindings/reset/k210-rst.h
> +
> +properties:
> +  compatible:
> +    allOf:
> +      - items:
> +        - const: kendryte,k210-rst

> +        - const: syscon-reset

This is not a generic thing.

> +
> +  regmap:
> +    maxItems: 1
> +    description: phandle of the system controller (sysctl) node
> +
> +  offset:
> +    maxItems: 1
> +    description: peripheral reset register offset in the system controller
> +      controller register map
> +
> +  mask:
> +    maxItems: 1
> +    description: bit-mask indicating valid reset bits in the reset register

You don't need this. Just don't use invalid cell values.

> +
> +  assert-high:
> +    maxItems: 1
> +    description: bit value to write when asserting a reset

Should be implied by the compatible string.

> +
> +  '#reset-cells':
> +    const: 1
> +
> +required:
> +  - '#reset-cells'
> +  - compatible
> +  - regmap
> +  - offset
> +  - mask
> +  - assert-high
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/mfd/k210-sysctl.h>
> +    #include <dt-bindings/reset/k210-rst.h>
> +
> +    sysctl: system-controller@50440000 {
> +      #address-cells = <1>;
> +      #size-cells = <1>;
> +      compatible = "kendryte,k210-sysctl",
> +                   "syscon", "simple-mfd";
> +      reg = <0x50440000 0x1000>;
> +      /* ... */
> +      sysrst: reset-controller {
> +        compatible = "kendryte,k210-rst",
> +                      "syscon-reset";
> +        #reset-cells = <1>;
> +        regmap = <&sysctl>;

That's just the parent node, you don't need this.

> +        offset = <K210_SYSCTL_PERI_RESET>;

Use 'reg'.

> +        mask = <0x27FFFFFF>;
> +        assert-high = <1>;
> +      };
> +    };
> -- 
> 2.28.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
