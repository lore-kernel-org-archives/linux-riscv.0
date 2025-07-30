Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A32C87FCB
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Jul 2025 07:09:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dHcODC6cw+qg6ugp+hXUeWDEFw3Bs87lDCDb2D45YNs=; b=jzvx5N9ytpgPIB
	vSXT7HN0uQVPgAIQN0gFlTRfk3b+HVv0DM0Z132ZjXdsgtBLpdhSPR+obHLVnZqHAlgJ3KD9l6nNV
	UJ3IrSIlHxPMuOHUDguGFh3B9ms8xunlJ3K2qYd25FKNKlYfmyu7plpqHoqoGA6daw9WT3rpMW2aN
	ayL9RPl3gAtLAHwvLEDptdmxCx0feMamG430actBlVx+9X2IK6xUkdWsSM2fRQ3r1LzCejBdEW+RY
	J+QPqIV9Gq5M/Mu6EgEQMfOqSwJAxqJ2k52J3qfrdQnHOlvyocuFH9VAdXBUDMDdelsqJVlCHaOMo
	S5VxqkcEyi5uQ6Yjk1fw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0wJ-00000000qkF-1Hga;
	Wed, 30 Jul 2025 07:09:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uh0sz-00000000qMT-0Brg
	for linux-riscv@lists.infradead.org;
	Wed, 30 Jul 2025 07:06:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1A7DC5C641C;
	Wed, 30 Jul 2025 07:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 385C0C4CEE7;
	Wed, 30 Jul 2025 07:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753859159;
	bh=A2mlfbNrB71eIpXbDCYMDyraLJzE4wkjolpqa+Ojhr4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OH2PE5j7oPam6lUWMZD2p/UexAxTItW39O5xw/PTELUxZzWtcDpdn5DfnfOXStS0q
	 xR3KKmfX2O5CiqhowuuYzEu2DogwTf5BkQHPb0Ry4887tB3iKxDTyvLRSi5r2ke4Qm
	 wsw15GaaHa8iB71ZvI4Gkc4sswhrmvBQrgIH75TnhA6mdCNC/+37L2C+laQIueAEDn
	 Rzhnd0vF5eudyKCpaLPPTbWr2yfLhFiWEJu618LyvTSk1lJGYfwl5JRShiw1lKCxSg
	 rSU2jZ8MTY9epOH4z9d/sw5pxxMJ584Cu5iTV4iuY6cS8+BRS3nkZKoEVNo+MDYbip
	 vaNjRcV9neWeg==
Date: Wed, 30 Jul 2025 09:05:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Conor Dooley <conor@kernel.org>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Samuel Holland <samuel.holland@sifive.com>, Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v7 1/3] dt-bindings: clock: Add bindings for Canaan K230
 clock controller
Message-ID: <20250730-cobalt-salmon-of-charisma-aea028@kuoka>
References: <20250730-b4-k230-clk-v7-0-c57d3bb593d3@zohomail.com>
 <20250730-b4-k230-clk-v7-1-c57d3bb593d3@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250730-b4-k230-clk-v7-1-c57d3bb593d3@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250730_000601_169101_513D2AEC 
X-CRM114-Status: GOOD (  18.33  )
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

On Wed, Jul 30, 2025 at 02:43:51AM +0800, Xukai Wang wrote:
> This patch adds the Device Tree binding for the clock controller
> on Canaan k230. The binding defines the clocks and the required
> properties to configure them correctly.
> 
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  .../devicetree/bindings/clock/canaan,k230-clk.yaml |  61 ++++++
>  include/dt-bindings/clock/canaan,k230-clk.h        | 223 +++++++++++++++++++++
>  2 files changed, 284 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..f2aa509b12bce1a69679f6d7e2853273233266d5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/canaan,k230-clk.yaml
> @@ -0,0 +1,61 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/canaan,k230-clk.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Canaan Kendryte K230 Clock
> +
> +maintainers:
> +  - Xukai Wang <kingxukai@zohomail.com>
> +
> +description:
> +  The Canaan K230 clock controller generates various clocks for SoC
> +  peripherals. See include/dt-bindings/clock/canaan,k230-clk.h for
> +  valid clock IDs.
> +
> +properties:
> +  compatible:
> +    const: canaan,k230-clk
> +
> +  reg:
> +    items:
> +      - description: PLL control registers
> +      - description: Sysclk control registers
> +
> +  clocks:
> +    minItems: 1

No, drop. Hardware is not flexible.

> +    items:
> +      - description: Main external reference clock
> +      - description:
> +          External clock which used as the pulse input
> +          for the timer to provide timing signals.

So what is the difference that you removed my Rb? Only this? I do not
see any differences (and don't tell me, you claim some random indice
numbers as change DT maintainer would need to re-review...)

> +
> +  clock-names:
> +    minItems: 1

No, drop. Hardware is not flexible.

> +    items:
> +      - const: osc24m
> +      - const: timer-pulse-in
> +
> +  '#clock-cells':
> +    const: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - '#clock-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@91102000 {
> +        compatible = "canaan,k230-clk";
> +        reg = <0x91102000 0x40>,
> +              <0x91100000 0x108>;
> +        clocks = <&osc24m>;
> +        clock-names = "osc24m";

Incomplete. Post complete hardware.

> +        #clock-cells = <1>;
> +    };
> diff --git a/include/dt-bindings/clock/canaan,k230-clk.h b/include/dt-bindings/clock/canaan,k230-clk.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..9eee9440a4f14583eac845b649e5685d623132e1
> --- /dev/null
> +++ b/include/dt-bindings/clock/canaan,k230-clk.h
> @@ -0,0 +1,223 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Kendryte Canaan K230 Clock Drivers
> + *
> + * Author: Xukai Wang <kingxukai@zohomail.com>
> + */
> +
> +#ifndef __DT_BINDINGS_CANAAN_K230_CLOCK_H__
> +#define __DT_BINDINGS_CANAAN_K230_CLOCK_H__
> +
> +/* Kendryte K230 SoC clock identifiers (arbitrary values) */

Drop comment, redundant and obvious.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
