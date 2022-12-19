Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2DCF9C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Dec 2022 10:57:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6CC8tVWAP/vKB26VfcAQQvT2G6NEdgGXCETtCWG43gw=; b=AcdqfzzkiJp80v
	7hKk+y0gf1FqJEc3s1nmiSFUI2CItp2PSeusgJlcoRvWLF7V/kU+5fXP9OPjUwMRNWQpZMxQuZJLi
	IblPKF75pN8JtXFeGoXCLsWRf/LMIuwJUmB+ddfGjGvInGU0TCsd/wfwJ3U/nYX3AqBL5aBzR/vF7
	uNnyE3RP79zc/jdJYCWx+2jWyCjw2CZGVrsAkCMo8/VsWBFgg2Ay6m/PQPWEaADUAIVl9Ph0gDzOQ
	vtXmjyZjBz7N5KmevjrpU/9HP6Ra5neTZqNYvOwrf24lsbx+gX0sl6QbeoFN/Tfx6qkS2DVJiXSVx
	r12JCSp7RPFQinlbCudQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Dpv-00CF8L-FA; Mon, 19 Dec 2022 10:57:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7Dpl-00CEz8-7t; Mon, 19 Dec 2022 10:57:27 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1p7Dpb-0004km-5j; Mon, 19 Dec 2022 11:57:15 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: Jisheng Zhang <jszhang@kernel.org>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Palmer Dabbelt <palmer@rivosinc.com>, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v3 04/12] riscv: dts: allwinner: Add the D1/D1s SoC devicetree
Date: Mon, 19 Dec 2022 11:57:14 +0100
Message-ID: <2133897.PYKUYFuaPT@diego>
In-Reply-To: <20221208090237.20572-5-samuel@sholland.org>
References: <20221208090237.20572-1-samuel@sholland.org> <20221208090237.20572-5-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221219_025725_350045_993A14C9 
X-CRM114-Status: GOOD (  14.34  )
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

Am Donnerstag, 8. Dezember 2022, 10:02:29 CET schrieb Samuel Holland:
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
> 
> Acked-by: Jernej Skrabec <jernej.skrabec@gmail.com>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

after spending some more time looking at the devicetree, I'm pretty
confident that it looks ok, so also

Reviewed-by: Heiko Stuebner <heiko.stuebner@vrull.eu>



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
