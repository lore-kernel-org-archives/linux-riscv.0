Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D135D0BB46
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 23:41:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=RPLQ5jJhO341Q6jPR8STlaehH6H3VO16IOIKWND9Xx4=; b=IeAHxLfuh2YdInfpLBEyjptprk
	19a02QKx4Q+4T5ZqOnDsK20n9hDkTMjf3eYubzi1qX0b+63gX93FZBE+jm9MGxQ6HNT+g0XG04yC2
	IFKux2R/14eI6Ywt88UdYJJ1OFEJOhzYL305kD7Mi35JOXI4aoMWHPLsiY0BFZIYmnnYCWYWQATSp
	t0hSNe6tmC3XK5pXsskXTVkOr+9ityBNieyrJtT1hqBhKwh/2wxzBhxGaerQ2BFRYQvYdhOb+x9sL
	QhexvsawSjSkefwhBcR7nbpqnWQjgTdPYmMjyZtQpnpd7QJSBrXMoHjKfT29Lkmc92jcCXMVypXP6
	ghJxV8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kyv-0000000GEzl-1RcB;
	Wed, 23 Oct 2024 23:41:37 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3kys-0000000GEyk-1uB8
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 23:41:36 +0000
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 945BB3F293
	for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 23:41:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1729726890;
	bh=3PGQu02YnHPlZo11QYKayLhqc6TqDv+KCeQ0Xgfz3C4=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=RF0A4JEhv4fQi8Q/4ca7vHqBrqF1I01GzTTSSRD9kseDfap9qNtRdBIWobry9259j
	 AeViUjXLJbPuR22jwguGXjOO/IrQzLXaJer7WrZGGtM8/wXVoPeGkscR1t/Czmdc02
	 QMkUbYqjrU9E5z0G7P+sr0YVlmREoYG7t5JI5Q1XZGqHvB13ARpaGASIX08rcXnHzR
	 wsJrQFjUz4pOG4Tay6OrtFB3G1ahEOJOQnDDunQmN9Ljavc2wes+PAOedsIXYNkatB
	 s7syojT0Wd14M+CQ3+Cfp8CAfpRjUM7jzuYix+ZIYE7DJkdxez+9FdiMNNgtrK4N7K
	 GaIETST73euGA==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-5eb7826862cso187694eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 23 Oct 2024 16:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729726889; x=1730331689;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3PGQu02YnHPlZo11QYKayLhqc6TqDv+KCeQ0Xgfz3C4=;
        b=obqtkVEJTLYXOZuRJr9Hq6B7OZpGjOyJAvwQWT39G4NgX4fEkc/6xJBSA1f2mt9DVn
         8trUftnj/b1X4tG1ixIWapMqYDpr4hCsZfnRJxLUniAhHjzff73JkH8MJb7RXFwEJd0t
         fQytn1+z7BjzomEnsDxEc2FjBfZuvXljX2lAbUrkUiZ6F7MLweyTmzPRe6ZwTZzjtDzJ
         zUDOk/d8bfzPpMUBmFV8VmHHWUEQ/2XUtaGYrkZBiaCkPeALqf61Oa2nyHarEWM8YPib
         vyPI7m3720HnOxqxijhUBVklky+w9Fh7mPxqH3KBvrMJRyprnzh18+MBnzH1lH9jV53J
         cs6w==
X-Forwarded-Encrypted: i=1; AJvYcCUlVQbCD3jPS/r3+Knv4/+3a8AjzT5p/sA5Mtcw53L67w/xSNYuzPIIp/ttlEZJ10FHf9QqXnTtkg18hA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFaaJsOBOuaqnYOBgdVF2KgIqKq0tJOPYlNlsmE4D4hSLbbOxV
	wgoatyTdzNvEf7d4/qQ3d6sI70g7aNfeFQ9M2iQi4DEPu/Wbdmyz7Rw6/i6aRaqufGHKlSnNQQc
	84SCqDuiivj81GxrC+raNNre4PpiYoZjiOtQFuKgh/c4ge9EV1laIOH6sQY/naI5HzrzJZHCtrp
	UpgbgSfViLL+DE7UyU2flMRQx9jfi4KNeVKqVEahA0yGhOy2t83LtlCOOK
X-Received: by 2002:a05:6870:a2d4:b0:288:50aa:7714 with SMTP id 586e51a60fabf-28ccb83f8b8mr4707224fac.24.1729726889070;
        Wed, 23 Oct 2024 16:41:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmoFBHnCYHUIGE5FQoeW7XP6jvjOogMHggvGexa+v1/qSORAbovEejIXVxUVEWGhexV1ySLJ9KlbQa+3yyW4Y=
X-Received: by 2002:a05:6870:a2d4:b0:288:50aa:7714 with SMTP id
 586e51a60fabf-28ccb83f8b8mr4707213fac.24.1729726888692; Wed, 23 Oct 2024
 16:41:28 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 23 Oct 2024 19:41:28 -0400
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241021103617.653386-3-inochiama@gmail.com>
References: <20241021103617.653386-1-inochiama@gmail.com> <20241021103617.653386-3-inochiama@gmail.com>
Mime-Version: 1.0
Date: Wed, 23 Oct 2024 19:41:28 -0400
Message-ID: <CAJM55Z8SnjQFui0J2hOD34HmBsGqZfxn8e_KAWhXxiqswqv6Ww@mail.gmail.com>
Subject: Re: [PATCH 2/4] dt-bindings: net: Add support for Sophgo SG2044 dwmac
To: Inochi Amaoto <inochiama@gmail.com>, Chen Wang <unicorn_wang@outlook.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Inochi Amaoto <inochiama@outlook.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Jose Abreu <joabreu@synopsys.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Richard Cochran <richardcochran@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Giuseppe Cavallaro <peppe.cavallaro@st.com>
Cc: Yixun Lan <dlan@gentoo.org>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com, 
	linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_164134_910661_A4896C0F 
X-CRM114-Status: GOOD (  19.64  )
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

Inochi Amaoto wrote:
> The GMAC IP on SG2044 is almost a standard Synopsys DesignWare MAC
> with some extra clock.
>
> Add necessary compatible string for this device.
>
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../devicetree/bindings/net/snps,dwmac.yaml   |   1 +
>  .../bindings/net/sophgo,sg2044-dwmac.yaml     | 145 ++++++++++++++++++
>  2 files changed, 146 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
>
> diff --git a/Documentation/devicetree/bindings/net/snps,dwmac.yaml b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> index 3c4007cb65f8..69f6bb36970b 100644
> --- a/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/snps,dwmac.yaml
> @@ -99,6 +99,7 @@ properties:
>          - snps,dwmac-5.30a
>          - snps,dwxgmac
>          - snps,dwxgmac-2.10
> +        - sophgo,sg2044-dwmac
>          - starfive,jh7100-dwmac
>          - starfive,jh7110-dwmac
>
> diff --git a/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> new file mode 100644
> index 000000000000..93c41550b0b6
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml
> @@ -0,0 +1,145 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/net/sophgo,sg2044-dwmac.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JH7110 DWMAC glue layer

I think you forgot to change this when you copied the binding.

/Emil

> +
> +maintainers:
> +  - Inochi Amaoto <inochiama@gmail.com>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        enum:
> +          - sophgo,sg2044-dwmac
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: sophgo,sg2044-dwmac
> +      - const: snps,dwmac-5.30a
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: GMAC main clock
> +      - description: PTP clock
> +      - description: TX clock
> +
> +  clock-names:
> +    items:
> +      - const: stmmaceth
> +      - const: ptp_ref
> +      - const: tx
> +
> +  sophgo,syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to syscon that configures phy
> +          - description: offset of phy mode register
> +          - description: length of the phy mode register
> +    description:
> +      A phandle to syscon with two arguments that configure phy mode.
> +      The argument one is the offset of phy mode register, the
> +      argument two is the length of phy mode register.
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - interrupt-names
> +  - resets
> +  - reset-names
> +
> +allOf:
> +  - $ref: snps,dwmac.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: sophgo,sg2044-dwmac
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 1
> +          maxItems: 1
> +
> +        interrupt-names:
> +          minItems: 1
> +          maxItems: 1
> +
> +        resets:
> +          maxItems: 1
> +
> +        reset-names:
> +          const: stmmaceth
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    ethernet@30006000 {
> +      compatible = "sophgo,sg2044-dwmac", "snps,dwmac-5.30a";
> +      reg = <0x30006000 0x4000>;
> +      clocks = <&clk 151>, <&clk 152>, <&clk 154>;
> +      clock-names = "stmmaceth", "ptp_ref", "tx";
> +      interrupt-parent = <&intc>;
> +      interrupts = <296 IRQ_TYPE_LEVEL_HIGH>;
> +      interrupt-names = "macirq";
> +      resets = <&rst 30>;
> +      reset-names = "stmmaceth";
> +      snps,multicast-filter-bins = <0>;
> +      snps,perfect-filter-entries = <1>;
> +      snps,aal;
> +      snps,tso;
> +      snps,txpbl = <32>;
> +      snps,rxpbl = <32>;
> +      snps,mtl-rx-config = <&gmac0_mtl_rx_setup>;
> +      snps,mtl-tx-config = <&gmac0_mtl_tx_setup>;
> +      snps,axi-config = <&gmac0_stmmac_axi_setup>;
> +      status = "disabled";
> +
> +      gmac0_mtl_rx_setup: rx-queues-config {
> +        snps,rx-queues-to-use = <8>;
> +        snps,rx-sched-wsp;
> +        queue0 {};
> +        queue1 {};
> +        queue2 {};
> +        queue3 {};
> +        queue4 {};
> +        queue5 {};
> +        queue6 {};
> +        queue7 {};
> +      };
> +
> +      gmac0_mtl_tx_setup: tx-queues-config {
> +        snps,tx-queues-to-use = <8>;
> +        queue0 {};
> +        queue1 {};
> +        queue2 {};
> +        queue3 {};
> +        queue4 {};
> +        queue5 {};
> +        queue6 {};
> +        queue7 {};
> +      };
> +
> +      gmac0_stmmac_axi_setup: stmmac-axi-config {
> +        snps,blen = <16 8 4 0 0 0 0>;
> +        snps,wr_osr_lmt = <1>;
> +        snps,rd_osr_lmt = <2>;
> +      };
> +    };
> --
> 2.47.0
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
