Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19160C48BC3
	for <linux-riscv@archiver.kernel.org>; Sat, 17 Feb 2024 16:10:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OgvOg4yUvsTYKN8JoZDdiYeRZLNJKRJfY+iRaCoMEmw=; b=aXOnE0RIrUWIZk
	NeY+g3/f8j/kE1Nqu7Ji6QjUViEu4+tccBX1EfP25RQYmDzvXIOgnBn9v3xu04y2NbQ1HtfC1O4oq
	m/FWigrFjp0lwBRbrfJE7+6iJ2CGPCAZBWjXEsU41M9KoMM+8mZue9g6ZFCZZPNrHHa3Djk3AoacL
	DB8hLxHiNxCej+9+8TUiHH97od7v8kqA1UqJVVRRwOvoAilnQ8isZEBC0kiix7538aWchvRFux0Q0
	G0olTr3Ey1Vll+QW4cc9c7Z1KFdc4BUIEfDUx1uovnCkEWtsGMQEaZw1dSMshse09N+ogs5pattLI
	M8rIthypnp4R9TEWa7FQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbNGl-00000005yAX-2iET;
	Sat, 17 Feb 2024 16:10:27 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbNGd-00000005y9R-40De
	for linux-riscv@lists.infradead.org;
	Sat, 17 Feb 2024 16:10:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E6E31CE0929;
	Sat, 17 Feb 2024 16:10:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BDA1C433C7;
	Sat, 17 Feb 2024 16:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1708186217;
	bh=jnnuiG2JA3w1jL3b+rX0XgYDDbHfBnfPxf8SR5AXRDY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TnOKWYAvQgSl1jOt4DM2iJrH5X+Js5+PgWiKEnVlYkyFEcOmM+JKmfznrRVZwfyAK
	 Oz3vZ/1OxKpjQaq/rW8w7wN3lEo97vJ9Ct+nfw7s/n8hlesL5z+Kgt5rl5WOZJBa+7
	 7OLLZkb8L7JcqOFLv9w9YrYEAHeGHESslkwOidqQ0Kt2bX9UgaHCdfvLRucOPe58ms
	 hhVS9SS2ZtbpMdwVXAE3KqsjIGxuDsBqj1VbEUlSukdW4Yy13JwqCbER2u1cuowApX
	 AaXOwd9KR6JoD3Yi94cQSlP/4PipDzfjUm35sjSGTVR2l1AXW2lR2BEFuGvRg+foEK
	 NuotaXNE7WJDQ==
Date: Sat, 17 Feb 2024 23:57:14 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: AnnanLiu <annan.liu.xdu@outlook.com>
Cc: chao.wei@sophgo.com, unicorn_wang@outlook.com, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv: dts: sophgo: add watchdog dt node for CV1800
Message-ID: <ZdDXWkibFjKvXJPe@xhacker>
References: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <DM6PR20MB2316366FC9ADCBC7B6E9C289AB7A2@DM6PR20MB2316.namprd20.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_081024_743226_FE6D0C01 
X-CRM114-Status: GOOD (  19.01  )
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

On Thu, Jan 25, 2024 at 05:46:40PM +0800, AnnanLiu wrote:
> Add the watchdog device tree node to cv1800 SoC.
> 
> Signed-off-by: AnnanLiu <annan.liu.xdu@outlook.com>
> ---
> This patch depends on the clk driver and reset driver.
> Clk driver link:
> https://lore.kernel.org/all/IA1PR20MB49539CDAD9A268CBF6CA184BBB9FA@IA1PR20MB4953.namprd20.prod.outlook.com/
> Reset driver link:
> https://lore.kernel.org/all/20231113005503.2423-1-jszhang@kernel.org/

I will update reset series soon

> 
> Changes since v1:
> - Change the name of the watchdog from watchdog0 to watchdog.
> - Change the status of watchdog.
> v1 link:
> https://lore.kernel.org/all/DM6PR20MB23160B8499CC2BFDAE6FCACDAB9EA@DM6PR20MB2316.namprd20.prod.outlook.com/
> 
> 
>  arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts |  4 ++++
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi          | 16 ++++++++++++++++
>  2 files changed, 20 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> index 3af9e34b3bc7..75469161bfff 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> @@ -36,3 +36,7 @@ &osc {
>  &uart0 {
>  	status = "okay";
>  };
> +
> +&watchdog {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index aec6401a467b..03ca32cd37b6 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -1,6 +1,7 @@
>  // SPDX-License-Identifier: (GPL-2.0 OR MIT)
>  /*
>   * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> + * Copyright (C) 2024 Annan Liu <annan.liu.xdu@outlook.com>

No, I don't think every commit author needs to add this line.

>   */
>  
>  #include <dt-bindings/interrupt-controller/irq.h>
> @@ -103,6 +104,21 @@ uart4: serial@41c0000 {
>  			status = "disabled";
>  		};
>  
> +		watchdog: watchdog@3010000{
> +			compatible = "snps,dw-wdt";
> +			reg = <0x3010000 0x100>;
> +			interrupts = <58 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&pclk>;
> +			resets = <&rst RST_WDT>;
> +			status = "disabled";
> +		};
> +
> +		pclk: pclk {

what's this clk?
> +			#clock-cells = <0>;
> +			compatible = "fixed-clock";
> +			clock-frequency = <25000000>;
> +		};
> +
>  		plic: interrupt-controller@70000000 {
>  			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
>  			reg = <0x70000000 0x4000000>;
> -- 
> 2.34.1
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
