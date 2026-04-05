Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3258FE64014
	for <linux-riscv@archiver.kernel.org>; Sun,  5 Apr 2026 07:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DBj4rpZsrLhiy7oUMzPl/s0klVQH21jdAU6WygNmFE4=; b=Or4aaZLEWRIcGb
	NnI3lgdMtqQkh7Hbj2tKZUSRpAG+shZW1gmzb0SMHerRLmnO+qxpCR4rHDsWNWqi2GaTev5GStoWT
	zEuOuQ1o93njatJvWKH4yeR4wYOwPP1Itdqcg8hTgLJFDtYHNwz9Za7TfVaXrDPqtV40ju1lkRPrW
	ZnU3d8UNGRTEtBYNiyb+aagabdDt+NHGhfI6hapMeZwpBaj2jX/oF9ojOxWB0y7m/L337VMfKaClm
	EyFuNyQEiTv2zVqdghLClljMTeqhFJZnlPnzjABgEeo9uhjjk16K43MUrb92IBxdWlwX0la2akVa8
	hOZxUaJW3MhLEefGrGvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9Hjb-000000041R6-2lk3;
	Sun, 05 Apr 2026 07:17:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9HjZ-000000041QM-2vmG
	for linux-riscv@lists.infradead.org;
	Sun, 05 Apr 2026 07:17:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0F4DE44100;
	Sun,  5 Apr 2026 07:17:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A1C3C116C6;
	Sun,  5 Apr 2026 07:17:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775373444;
	bh=wWVjiZ46vIhCchV+sjr+BuLIv1/1R6Hepr051NIy+LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ux1v6AYPau6DTdBRtCesO1g7LN5uT0pm54bF0gEmbysruFmliBle6DUIYvfCA4EKh
	 Mmq5+ZHN3Ob/pKWuezskeTkEm3ELJl9XCBZDG+vgfzGkA9m0WWjbL1Vdbr+N+t9SpF
	 ma0cezgRY3tS3+lyA3JOQQbiIGmlFLspD3MykchTJCEqmAWwvB2M6fPiuZqcWP0QWg
	 6rqBBgqGfxycTXyGDDJvNG2ZnjuyAbPvsCQEyNxA9kzPOA5RQAfT1xKcGrn6HKQWln
	 WctQTy+ElbY0hJ/TiDqtJii7U6pHbttVIXOHhip+/J+xTWN/eNXLBsKNC8ciU3vtTU
	 iXg7EigH4jvbA==
Date: Sun, 5 Apr 2026 09:17:22 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Alexandre Ghiti <alex@ghiti.fr>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>, Chen Wang <unicorn_wang@outlook.com>, 
	Inochi Amaoto <inochiama@gmail.com>, Alexey Charkov <alchark@gmail.com>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang <keguang.zhang@gmail.com>, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, Ley Foon Tan <leyfoon.tan@starfivetech.com>
Subject: Re: [PATCH v1 01/13] dt-bindings: soc: starfive: Add StarFive JHB100
 syscon modules
Message-ID: <20260405-nocturnal-mighty-pegasus-eff399@quoll>
References: <20260403054945.467700-1-changhuang.liang@starfivetech.com>
 <20260403054945.467700-2-changhuang.liang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260403054945.467700-2-changhuang.liang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260405_001725_791736_0447481F 
X-CRM114-Status: GOOD (  17.31  )
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

On Thu, Apr 02, 2026 at 10:49:33PM -0700, Changhuang Liang wrote:
> Add documentation to describe StarFive JHB100 SoC System Controller
> Registers.
> 
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  .../soc/starfive/starfive,jhb100-syscon.yaml  | 140 ++++++++++++++++++
>  MAINTAINERS                                   |   5 +
>  2 files changed, 145 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
> 
> diff --git a/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
> new file mode 100644
> index 000000000000..c0e1f6f68fa2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/starfive/starfive,jhb100-syscon.yaml
> @@ -0,0 +1,140 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/soc/starfive/starfive,jhb100-syscon.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: StarFive JHB100 SoC system controller
> +
> +maintainers:
> +  - Kevin Xie <kevin.xie@starfivetech.com>
> +  - Changhuang Liang <changhuang.liang@starfivetech.com>
> +
> +description:
> +  The StarFive JHB100 SoC system controller provides register information such
> +  as offset, mask and shift to configure related modules such as PLL and PCIe.

How a MMIO based device can provide a MMIO information? What exactly
does it provide? Register where the value is the offset of other
register?

> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - items:
> +          - enum:
> +              - starfive,jhb100-pcierp-syscon
> +              - starfive,jhb100-per0-syscon
> +              - starfive,jhb100-per1-syscon
> +              - starfive,jhb100-sys0-syscon
> +          - const: syscon
> +          - const: simple-mfd
> +      - items:
> +          - enum:
> +              - starfive,jhb100-b2h-syscon
> +              - starfive,jhb100-gpu-syscon
> +              - starfive,jhb100-h2b-syscon
> +              - starfive,jhb100-host-syscon
> +              - starfive,jhb100-husb-syscon
> +              - starfive,jhb100-husbcmn-syscon
> +              - starfive,jhb100-husbd-syscon
> +              - starfive,jhb100-npu-syscon
> +              - starfive,jhb100-pcieep-ecsr-syscon
> +              - starfive,jhb100-pcierp-ecsr-syscon
> +              - starfive,jhb100-per2-syscon
> +              - starfive,jhb100-per3-syscon

Hm? per2 as starfive,jhb100-per2crg is a separate device, so how can it
be also a syscon?

> +              - starfive,jhb100-strap-syscon
> +              - starfive,jhb100-sys1-syscon
> +              - starfive,jhb100-sys2-syscon
> +              - starfive,jhb100-usb-syscon
> +              - starfive,jhb100-vout-syscon
> +          - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clock-controller:
> +    $ref: /schemas/clock/starfive,jhb100-pll.yaml#
> +    type: object

Why are you mixing MMIO and non-MMIO devices here/

> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2
> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - reg
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - starfive,jhb100-per0-syscon
> +              - starfive,jhb100-per1-syscon
> +              - starfive,jhb100-sys0-syscon
> +    then:
> +      required:
> +        - clock-controller
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jhb100-sys0-syscon
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +      patternProperties:
> +        "^chipid@[0-9a-f]+$":
> +          $ref: /schemas/hwinfo/starfive,jhb100-socinfo.yaml#
> +          type: object
> +
> +

Just one blank line

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: starfive,jhb100-pcierp-syscon
> +    then:
> +      required:
> +        - "#address-cells"
> +        - "#size-cells"
> +        - ranges
> +      patternProperties:
> +        "^reset-controller@[0-9a-f]+$":
> +          $ref: /schemas/reset/starfive,jhb100-reset-pcierp.yaml#

There is no such file so nothing here is testable or even possible to
apply.

Following my first question, I don't understand why this is even a
child.

Anyway, properties must be defined in top-level.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
