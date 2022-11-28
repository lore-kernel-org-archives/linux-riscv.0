Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32AC6C4321E
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Nov 2022 21:00:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CI7Pb1qNcLs0zML1HIh8C1KxMvpHy/lBv5HMU06jqlE=; b=faplMoye1oqEY8
	cbHRDxOXUxMcET/LWVl/yJ6MytMXqFvvY0kUaFtNAhakwhc56ujRcFY481ENeSWBycNsi30Tx4mmt
	xIGUiy5pFK4aLf5QjVh4X+A+qvTW12k/WbjYn2hMu7Hcj2DQe87mBwEYlSDkNk/+dyhcaJ+yllMP7
	7VjlPqNeuaqTAxEgkY9dpq7j5JSX/msHZtdmXIXq5URN+ub2FHf1hnB/ff32iv8Oj5W/fpk1FuSBD
	2rZD9tou+aMhD7HaIqVz0r/o0DXRoAO1UAFfDRas9r2e+vayDbVDaPAXpjfoF7SW6V+/TUv0f/CAx
	iKwhdBA58kWXHfzXDvag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlET-004PNZ-71; Mon, 28 Nov 2022 21:00:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ozlEQ-004PM7-D0; Mon, 28 Nov 2022 21:00:03 +0000
Received: from ip5b412258.dynamic.kabel-deutschland.de ([91.65.34.88] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ozlEL-000833-O6; Mon, 28 Nov 2022 21:59:57 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, linux-sunxi@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org, Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Rob Herring <robh+dt@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Andre Przywara <andre.przywara@arm.com>, Samuel Holland <samuel@sholland.org>, Albert Ou <aou@eecs.berkeley.edu>, Anup Patel <apatel@ventanamicro.com>, Atish Patra <atishp@rivosinc.com>, Christian Hewitt <christianshewitt@gmail.com>, Conor Dooley <conor.dooley@microchip.com>, Guo Ren <guoren@kernel.org>, Heinrich Schuchardt <heinrich.schuchardt@canonical.com>, Linus Walleij <linus.walleij@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Stanislav Jakubek <stano.jakubek@gmail.com>
Subject: Re: [PATCH v2 04/12] riscv: dts: allwinner: Add the D1/D1s SoC devicetree
Date: Mon, 28 Nov 2022 21:59:56 +0100
Message-ID: <3819214.ElGaqSPkdT@diego>
In-Reply-To: <20221125234656.47306-5-samuel@sholland.org>
References: <20221125234656.47306-1-samuel@sholland.org> <20221125234656.47306-5-samuel@sholland.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221128_130002_478357_51DEE39F 
X-CRM114-Status: GOOD (  16.60  )
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

Am Samstag, 26. November 2022, 00:46:48 CET schrieb Samuel Holland:
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
> Signed-off-by: Samuel Holland <samuel@sholland.org>

While the overall dt looks good to me, it seems others did find
some minor issues. But I can at least provide a

Tested-by: Heiko Stuebner <heiko.stuebner@vrull.eu>

as it could sucessfully boot the Nezha variant of boards for me.


Heiko



_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
