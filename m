Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E841C3ABA2
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Sep 2024 06:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=fpcRJWFPO197nfKFTA5ygoluq35WZok9X1oY8IOm+5E=; b=brBOfhnko3nipc
	Vq1WREmWNSTzdVq8Ngz+bVEzB32lNU0Xj2HZLNy+9QhimzGk4ElvN/7cI6NCQJ6bQW6Ezr9Dgdtiw
	TmFVjwyIVmPlJs3s5npZIHqBgsHgdeM9hn57cg5Vhh6zOTpV4Hdszkt0klXNLPJQ6B1jVF4jh6mG4
	B1yMn5ezkXxyiuyh2SHisMzrUwh/gsXpWzsGjJtT/teAeWHiGfCF4gxeWMQK4HJpm8MdnFzWqx2Dc
	mzhtxs4Rr51WcZLMkwDUe7yGP9C0MfhxC3ceIztG/jSz0JN1+VGGv8/f2JXe+/DQUcwZNxmqgbGIZ
	Yti9h3IGEK1e7RZCFYIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRsH-00000005VMS-3dpx;
	Tue, 17 Sep 2024 06:39:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqRsE-00000005VLx-3fMF
	for linux-riscv@lists.infradead.org;
	Tue, 17 Sep 2024 06:39:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AA575C0FF4;
	Tue, 17 Sep 2024 06:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2762AC4CEC6;
	Tue, 17 Sep 2024 06:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1726555182;
	bh=KOEJZeVljojcmRdwqwJWhjQoq6gbxqBjzRiz12hG9lw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AXyvubyGaCUUsTrHT+W7VZ7JeaIytYlT3RDrRDLrKg0sS6oE6PMzgPaDG91555GFs
	 0Tzg4SM3D6OH2dOdx83Qy6CvHDAUZwf4yazQcDTdX9p/lOGxPyWCDb1FR/qF/xvGYf
	 V10susybUX8F7Vd9CaqjgDsV4DRyQE9r6Gj7JAIy5Un42raGcSMmsif99H5T12BgYx
	 44c+hzVKxXIZ07xoLR0r7wL2CMpd9Hh5/WciDMr7a/LZ9H7Z1lZ0G/439wKpFL7T51
	 2tGLthWSxHpVT01kFntNdV3lxaHP6ULgYwzI0s5Ntl0WdwQA5mOQjhTR9x5DnB6Ng7
	 3g0wfta/r/ZBg==
Date: Tue, 17 Sep 2024 08:39:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Haylen Chu <heylenay@outlook.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Inochi Amaoto <inochiama@outlook.com>, 
	Chen Wang <unicornxdotw@foxmail.com>, Jisheng Zhang <jszhang@kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: spacemit: Add clock
 controllers of Spacemit K1 SoC
Message-ID: <zsayhliz4a4fauzmvkimd4uzucuunt6gmkypjlqh4omle4uqx4@cbknudobc57g>
References: <SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
 <SEYPR01MB4221BDC11EE244C7D70C229DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <SEYPR01MB4221BDC11EE244C7D70C229DD7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_233943_020830_EAA96E55 
X-CRM114-Status: GOOD (  17.74  )
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

On Mon, Sep 16, 2024 at 10:23:09PM +0000, Haylen Chu wrote:
> Add definition for the clock controllers of Spacemit K1 SoC. The clock
> tree is managed by several SoC parts, thus different compatible strings
> are added for each.
> 
> spacemit,k1-syscon.yaml is updated as well to allow clock controller
> being its subnode.
> 
> Signed-off-by: Haylen Chu <heylenay@outlook.com>

Please order patches correctly. First this, then the parent so you will
not submit incomplete binding.

You still must test it, though :(

> ---
>  .../bindings/clock/spacemit,k1-ccu.yaml       |  71 +++++++
>  .../soc/spacemit/spacemit,k1-syscon.yaml      |   4 +
>  include/dt-bindings/clock/spacemit,k1-ccu.h   | 198 ++++++++++++++++++
>  3 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
>  create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml b/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
> new file mode 100644
> index 000000000000..0186722cfd87
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
> @@ -0,0 +1,71 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/spacemit,k1-ccu.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Spacemit K1 SoC Clock Controller
> +
> +maintainers:
> +  - Haylen Chu <heylenay@outlook.com>
> +
> +properties:
> +  compatible:
> +    enum:
> +      - spacemit,k1-ccu-apbs
> +      - spacemit,k1-ccu-mpmu
> +      - spacemit,k1-ccu-apbc
> +      - spacemit,k1-ccu-apmu
> +
> +  clocks:
> +    minItems: 4

Drop

> +    maxItems: 4
> +
> +  clock-names:
> +    items:
> +      - const: clk_32k
> +      - const: vctcxo_1
> +      - const: vctcxo_24
> +      - const: vctcxo_3
> +
> +  spacemit,mpmu:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Phandle to the syscon managing "Main PMU (MPMU)" registers. It is used to
> +      check PLL lock status.
> +
> +  "#clock-cells":
> +    const: 1
> +    description:
> +      See <dt-bindings/clock/spacemit,k1-ccu.h> for valid indices.
> +
> +required:
> +  - compatible
> +  - "#clock-cells"
> +
> +additionalProperties: false

Move it after allOf block

> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: spacemit,k1-ccu-apbs
> +    then:
> +      required:
> +        - compatible
> +        - "#clock-cells"

Drop both, redundant


> +        - spacemit,mpmu
> +
> +examples:
> +  - |
> +    syscon_apbs: system-control@d4090000 {

Only one example, keep it in parent node.

> +        compatible = "spacemit,k1-apbs-syscon", "syscon", "simple-mfd";
> +        reg = <0x0 0xd4090000 0x0 0x1000>;
> +
> +        clk_apbs: clock-controller {
> +            compatible = "spacemit,k1-ccu-apbs";
> +            #clock-cells = <1>;
> +            spacemit,mpmu = <&syscon_mpmu>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> index 4e3a72b48aff..08efda207101 100644
> --- a/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> +++ b/Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
> @@ -27,6 +27,10 @@ properties:
>    reg:
>      maxItems: 1
>  
> +  clock-controller:
> +    $ref: /schemas/clock/spacemit,k1-ccu.yaml#
> +    type: object
> +

This MUST be part of other patch.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
