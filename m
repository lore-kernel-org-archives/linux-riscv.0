Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187ABC46467
	for <linux-riscv@archiver.kernel.org>; Tue,  3 Jan 2023 15:35:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NfUjUNz2lmPXhDViKDml+Xlvq8ZJgdtDLUR8wJO3w8w=; b=TCL89lygO1j/xV
	9ZfKXyzF6Uc6GwFcIOitR0mJ4R+6KWP/4WihwwZQp3ndu6WTZs9uxjPJfK1yrqzNuDBhX6KjBNxVD
	8pdVWbbmjLGWYAJG5CzBRTMeEFIfoU6G2bylKK+/kBDF/muaEzYFZiWY4k3eirKeuAckFVUOW6e0k
	MyBmlORwVFYMFOCTp4kKLVsoi2uLysmFcA1sAoqwKa13SHdZx2PSMGOvKvXtLVC6piv7KrgDl9FsJ
	yLSFPO+j1a8kcy9+2p8HjWJNC95v+RmbedgCjfVA9h4UwbAODZr7/gpwvv+Bf0WXJPVC/S5IN7nXg
	Yx9Lq0hUtTOwQuQuxYkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCjJl-002UPV-Pq; Tue, 03 Jan 2023 15:35:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pCf7d-000teE-Ju; Tue, 03 Jan 2023 11:06:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 532541516;
	Tue,  3 Jan 2023 03:06:59 -0800 (PST)
Received: from donnerap.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8D7763F663;
	Tue,  3 Jan 2023 03:06:15 -0800 (PST)
Date: Tue, 3 Jan 2023 11:06:13 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Samuel Holland <samuel@sholland.org>
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org, Rob Herring
 <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>,
 linux-kernel@vger.kernel.org, Heiko Stuebner <heiko@sntech.de>, Palmer
 Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>,
 Heiko Stuebner <heiko.stuebner@vrull.eu>
Subject: Re: [PATCH v4 04/12] riscv: dts: allwinner: Add the D1/D1s SoC
 devicetree
Message-ID: <20230103110613.725f6fa4@donnerap.cambridge.arm.com>
In-Reply-To: <20221231233851.24923-5-samuel@sholland.org>
References: <20221231233851.24923-1-samuel@sholland.org>
	<20221231233851.24923-5-samuel@sholland.org>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230103_030621_860102_9F9ED3B4 
X-CRM114-Status: GOOD (  18.57  )
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

On Sat, 31 Dec 2022 17:38:43 -0600
Samuel Holland <samuel@sholland.org> wrote:

Hi,

> D1 (aka D1-H), D1s (aka F133), R528, and T113 are a family of SoCs based
> on a single die, or at a pair of dies derived from the same design.
> 
> D1 and D1s contain a single T-HEAD Xuantie C906 CPU, whereas R528 and
> T113 contain a pair of Cortex-A7's. D1 and R528 are the full version of
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

I compared to the v2 post (which I already checked against the T113-s
manual) and did not find any extra changes apart from those mentioned in
the changelog below. As my two questions from v2 are answered:

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Many thanks,
Andre

> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Samuel Holland <samuel@sholland.org>
> ---
> 
> (no changes since v3)
> 
> Changes in v3:
>  - Drop dummy DCXO clock-frequency property
>  - Decrease the PLIC's riscv,ndev property to 175
>  - Fix `make W=1 dtbs` warnings (unnecessary #address/#size-cells)
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
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 837 ++++++++++++++++++
>  4 files changed, 994 insertions(+)
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sun20i-d1s.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1-t113.dtsi
>  create mode 100644 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> 
...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
