Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73672C4321E
	for <linux-riscv@archiver.kernel.org>; Sat, 26 Nov 2022 16:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qkx7VlLiabaVC7PHTyT/0Rw+l6BxiaS7f18UsXF7ueQ=; b=AnJO0nUnXHYs0T
	Un3wdh0F8EkD7Xz9im6VMlXVcQ7R6CXqsIhWzOiX43n6//j1rstGYkV+6DNwbfezW7U9bKsDXnOsy
	qYk/lCSOVVa2NrL+rIUQhAcSDe9GniPI2mkboqJ+lWfU6GRMwizOisJXafYFkDe6LsoOEFSFrFV2R
	bS2xhij7dUauGZdmYmnXGaWGtYcjjSluOuzuKM1B0CFeWGP+FoK3sAFimCgIjSJQIKEQgdic6QFuK
	//bnFps7+KdCNZSF1E4YnyyJGaVQjWND2+Ej1rGy9OH8bYYZt5yHmlGBKRIQ/ULzlm0KImXAEHyFX
	jVDfu2P/RNdazKoJkQtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxf4-0072oj-FE; Sat, 26 Nov 2022 16:04:14 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oyxep-0072hq-Ul; Sat, 26 Nov 2022 16:04:01 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 80059B818C6;
	Sat, 26 Nov 2022 16:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9319C433C1;
	Sat, 26 Nov 2022 16:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669478636;
	bh=I3oNLAP3k0VDPBsE+OwGRfWZ2bU2j6dd+5v0b5Q9tmA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OAsemZityeg5XfYsehUAUZJDHWgGIQwOc0fwhwONNlKW5SpvMrbLZ4Hez8HrbTZza
	 t+0DV4D7yxIc8gFG2TzkAxI5VikhOcK2+OsSuBJ4HGpQQwCAmsD4DAEllVpgDK7iEN
	 ob9kpDW82FfvJ6DVTuYs+Sv85igEyzmxo9w5I/JRQ848B7VuUEgHqZBhHafXAvs+gB
	 LPUVd4xgoWfsDq2gbXnyxCRgQlzjaux5QOU/4zFboieGEuUfWmfgcuAfnvyH0pOTIa
	 Ci6VQmTGjeYk6maCYRo5jIWoVa995b+B4LPktjN+PULOsv0o7id/DCjWPo4omIgl/+
	 BrWdCDDsDMFcg==
Date: Sat, 26 Nov 2022 16:03:49 +0000
From: Conor Dooley <conor@kernel.org>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Rob Herring <robh+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <apatel@ventanamicro.com>,
	Atish Patra <atishp@rivosinc.com>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Guo Ren <guoren@kernel.org>,
	Heinrich Schuchardt <heinrich.schuchardt@canonical.com>,
	Linus Walleij <linus.walleij@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 04/12] riscv: dts: allwinner: Add the D1/D1s SoC
 devicetree
Message-ID: <Y4I45Uu6eFKUo69B@spud>
References: <20221125234656.47306-1-samuel@sholland.org>
 <20221125234656.47306-5-samuel@sholland.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221125234656.47306-5-samuel@sholland.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221126_080400_313203_2DF47CE3 
X-CRM114-Status: GOOD (  24.47  )
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

On Fri, Nov 25, 2022 at 05:46:48PM -0600, Samuel Holland wrote:
> D1 (aka D1-H), D1s (aka F133), R528, and T113 are a family of SoCs based
> on a single die, or at a pair of dies derived from the same design.
> 
> D1 and D1s contain a single T-HEAD Xuantie C906 CPU, whereas R528 and
> T113 contain a pair of Cortex-A7's.

Is this "additionally contain" or a case of the D1 is the R528 but with
s/arm/riscv/? It's the latter, right?

> D1 and R528 are the full version of
> the chip with a BGA package, whereas D1s and T113 are low-pin-count QFP
> variants.
> 
> Because the original design supported both ARM and RISC-V CPUs, some
> peripherals are duplicated. In addition, all variants except D1s contain
> a HiFi 4 DSP with its own set of peripherals.
> 
> The devicetrees are organized to minimize duplication:
>  - Common perhiperals are described in sunxi-d1s-t113.dtsi
>  - DSP-related peripherals are described in sunxi-d1-t113.dtsi
>  - RISC-V specific hardware is described in sun20i-d1s.dtsi
>  - Functionality unique to the D1 variant is described in sun20i-d1.dtsi
> 
> The SOC_PERIPHERAL_IRQ macro handles the different #interrupt-cells
> values between the ARM (GIC) and RISC-V (PLIC) versions of the SoC.

Modulo the warnings I replied to the cover with & one minor comment
below:
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> Changes in v2:
>  - Split into separate files for sharing with D1s/R528/T113
>  - Use SOC_PERIPHERAL_IRQ macro for interrupts
>  - Rename osc24M to dcxo and move the frequency to the board DTs
>  - Drop analog LDOs due to the missing binding
>  - Correct tcon_top DSI clock reference
>  - Add DMIC, DSI controller, and DPHY (bindings are in linux-next)
>  - Add CPU OPP table
> 
>  arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi  |  66 ++
>  arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi |  76 ++
>  .../boot/dts/allwinner/sunxi-d1-t113.dtsi     |  15 +
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 844 ++++++++++++++++++
>  4 files changed, 1001 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi


> diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> new file mode 100644
> index 000000000000..c8815cbf0b46
> --- /dev/null
> +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> @@ -0,0 +1,844 @@
> +// SPDX-License-Identifier: (GPL-2.0+ or MIT)
> +// Copyright (C) 2021-2022 Samuel Holland <samuel@sholland.org>
> +
> +#include <dt-bindings/clock/sun6i-rtc.h>
> +#include <dt-bindings/clock/sun8i-de2.h>
> +#include <dt-bindings/clock/sun8i-tcon-top.h>
> +#include <dt-bindings/clock/sun20i-d1-ccu.h>
> +#include <dt-bindings/clock/sun20i-d1-r-ccu.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/reset/sun8i-de2.h>
> +#include <dt-bindings/reset/sun20i-d1-ccu.h>
> +#include <dt-bindings/reset/sun20i-d1-r-ccu.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	dcxo: dcxo-clk {
> +		compatible = "fixed-clock";
> +		/* This value must be overridden by the board */
> +		clock-frequency = <0>;

Since this is a "must", can you drop the clock-frequency = <0> here so
that if someone doesn't override it in their board dt-validate
complains?

Thanks,
Conor.

> +		clock-output-names = "dcxo";
> +		#clock-cells = <0>;
> +	};
> +
 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
