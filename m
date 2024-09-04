Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B74CA0ED3
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Sep 2024 06:46:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jDmrYb6KUwYZuiJfNfClzP4VRrWWIgsMO5ksuFidysg=; b=Lug/3juskAi3Mn
	2KLp8vE7b7CTecltoolZ6fU5IPI6lrUJ9r/dQ2h4Cfgjkv8NDyHoSPAIehgFvJ54jYNgLi/0KlOFp
	3fwBRMcXIRT2WnfkChOwvUjxGjbabxu4PbqxpuU1tWKko/oOuVetd624sHGqqF4MEIQ+A/XDGNI+h
	vG5fuCjaYsFa4/1CuEFN+bcGWQlzdaxzHvjKWYXsNBc4yO96Ow5xbuJB96TzXwDtjbG7RkuLqTrYr
	AFhzgTfL7p9IxhKlqArN8rNiRJf9Sm98xEcSSBSgVs/hn/H1naVCWoE1a3RO8A6bOICTRErZk4FsR
	CokcBAZlOXwhadOGM1yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sljmW-000000034E1-2R2q;
	Wed, 04 Sep 2024 06:46:20 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sljmT-000000034DR-01ek
	for linux-riscv@lists.infradead.org;
	Wed, 04 Sep 2024 06:46:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C5CC0A41062;
	Wed,  4 Sep 2024 06:46:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D2ACC4CEC2;
	Wed,  4 Sep 2024 06:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1725432375;
	bh=dYOCY0yk+cwLkcXcgwp9/YV2ZgT7cPjQlCCdBTFQ3WA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PAvWqOTQcX2pjmA2V7X84ZPEWFpCLfcgE1cztCOtT2QP8c/H1LCx4AB46ZwmlHC6v
	 vAub1J+4iXPh06tq55e8rCHYUOwdvvtl/HAJkMzgUzQcZy1/USYGMhDlrE+XgsYrjw
	 +wNwRpk+MoYrpSz2UI0taSQn0dHhSdY9QLdU2NARUAcUxtivPI7MRcIbK5RfZDCQdb
	 FsdZmzBBVDzRb1up/8FSCXYUrmZZ/VNfAvBFcXQXEZWY69VEIAnKsAFihJc3ABtCHp
	 6qK1WFyMpFjobl3eUw2A8zKBmPY5MmAb6OFI3MZIFqi1OaRnQhZUJHNfVezE3xN0Rt
	 Soub50vKANT/w==
Date: Wed, 4 Sep 2024 08:46:12 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Yixun Lan <dlan@gentoo.org>
Subject: Re: [PATCH 1/3] dt-bindings: gpio: spacemit: add support for K1 SoC
Message-ID: <ttvqw3hncprtshhdgsnvlfopobqcxtsraxevgxqgnlt6orftkr@ktahud64cczd>
References: <20240904-03-k1-gpio-v1-0-6072ebeecae0@gentoo.org>
 <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240904-03-k1-gpio-v1-1-6072ebeecae0@gentoo.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240903_234617_198876_2EC26744 
X-CRM114-Status: GOOD (  21.12  )
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
Cc: linux-riscv@lists.infradead.org, Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Meng Zhang <kevin.z.m@hotmail.com>, Linus Walleij <linus.walleij@linaro.org>, linux-kernel@vger.kernel.org, Conor Dooley <conor@kernel.org>, Yangyu Chen <cyy@cyyself.name>, devicetree@vger.kernel.org, linux-gpio@vger.kernel.org, Palmer Dabbelt <palmer@dabbelt.com>, Jisheng Zhang <jszhang@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Bartosz Golaszewski <brgl@bgdev.pl>, Meng Zhang <zhangmeng.kevin@spacemit.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Sep 04, 2024 at 12:27:23AM +0000, Yixun Lan wrote:
> The GPIO controller of K1 support basic functions as input/output,
> all pins can be used as interrupt which route to one IRQ line,
> trigger type can be select between rising edge, failing edge, or both.
> There are four GPIO banks, each consisting of 32 pins.
> 
> Signed-off-by: Yixun Lan <dlan@gentoo.org>
> ---
>  .../devicetree/bindings/gpio/spacemit,k1-gpio.yaml | 95 ++++++++++++++++++++++
>  1 file changed, 95 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> new file mode 100644
> index 0000000000000..db2e62fb452fd
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/spacemit,k1-gpio.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/gpio/spacemit,k1-gpio.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: SpacemiT K1 GPIO controller
> +
> +description: >

Drop >

> +  The controller's registers are organized as sets of eight 32-bit
> +  registers with each set controlling a bank of up to 32 pins.  A single
> +  interrupt is shared for all of the banks handled by the controller.
> +
> +maintainers:
> +  - Yixun Lan <dlan@gentoo.org>

Maintainers go before description. Use example-schema as template.

> +
> +properties:
> +  $nodename:
> +    pattern: '^gpio@[0-9a-f]+$'


No, why? Drop.

> +
> +  compatible:
> +    items:

and you can drop items as well.

> +      - const: spacemit,k1-gpio
> +
> +  reg:
> +    maxItems: 1
> +    description: >

Drop >. Everywhere.

> +      Define the base and range of the I/O address space containing
> +      the SpacemiT K1 GPIO controller registers

Redundant description, drop.

> +
> +  ranges: true
> +
> +  "#gpio-cells":
> +    const: 2
> +    description: >
> +      The first cell is the pin number (within the controller's
> +      pin space), and the second is used for the following:
> +      bit[0]: polarity (0 for active-high, 1 for active-low)

Rather refer to standard GPIO bindings header.

> +
> +  gpio-controller: true
> +
> +  gpio-ranges: true
> +
> +  interrupts:
> +    maxItems: 1
> +    description:
> +      The interrupt shared by all GPIO lines for this controller.
> +
> +  interrupt-names:
> +    items:
> +      - const: gpio_mux
> +
> +  "#interrupt-cells":
> +    const: 2
> +    description: |
> +      The first cell is the GPIO number, the second should specify
> +      flags.  The following subset of flags is supported:
> +      - bits[3:0] trigger type flags (no level trigger type support)
> +        1 = low-to-high edge triggered
> +        2 = high-to-low edge triggered
> +      Valid combinations are 1, 2, 3

Hm? No, you must use standard interrupt flags, not custom ones.

> +
> +  interrupt-controller: true
> +
> +required:
> +  - compatible
> +  - reg
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupts
> +  - interrupt-names
> +  - interrupt-controller
> +  - '#interrupt-cells'

Use consistent quotes. Either ' or ".

> +
> +additionalProperties: false

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
