Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52185CDB465
	for <linux-riscv@archiver.kernel.org>; Sat, 14 Oct 2023 09:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GY1mfYl0sIL92sKtWnUMxFf548qagRQWHJ6dDsLaBMw=; b=OAr2Jr03jwSFSz
	wZbRjGz5wTR2v1vwSas+YjDRwvigeGR5qZwZRbEAGc7SGUKn58Os4Qnh+OArJwOpGh4YCNNQAmbaV
	+BYuoE1kngxMCK2wg2URwD/L8Pl/6BVRMHhnqSHUoGFINvMkN9OAKKxh/60Xs4rtNHHaQt6QvnEnt
	gmq7kVC1A0WGwqwhEV7XGyJ87d/1FClgk8okJdGKkbBZ5AfgAQoqIPKM2BRdg2tUmVykf0oFb5nb8
	NzHbsv5MHWdH1K47noebpWE7dobrf68JEG13Jrtr7k5vOSIePM50GUg7fDssO8i7aHWweAcPadpby
	j9m9wMb57f6otI/J9VFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qralI-0051aX-2x;
	Sat, 14 Oct 2023 09:16:44 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qralF-0051Zf-26
	for linux-riscv@lists.infradead.org;
	Sat, 14 Oct 2023 09:16:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1FD6DCE2E3E;
	Sat, 14 Oct 2023 09:16:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CBC86C433C7;
	Sat, 14 Oct 2023 09:16:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697274998;
	bh=k52xWdFX6UjAOvOzI3AWhj638Tolfhfcr0twbZHvcUA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ExLN7t9JOPknABzwTs92zb6MYEd7IAByQ2A4ANceSuRUOlbKMSUwhNbY4zapvk57K
	 4Wwjpm34RhzcKKtIxFnFb3o3rhhkeWvq0tI0u5G4dd6nfEPNpUzqXm4vMAbS/u0KA1
	 eQ5zEwMwkUHIcxqiYT5B9qgNn/jrtXxrQDFj/5tf4Pniv+wlXeBo/2lj5IrZklvTdg
	 6h7hd8GpbyGjL7UoTa0ZNTQgcYTED7bLRARpuR9wb3f6KwpE0cWGKdfq2v9XgBPIVz
	 3DndQSGJ6v+gnyd6B6iDbKC6tHDX6H0mlHF2vWdYXez/SPK437P6JyhqjvUcaOStwH
	 p+kyy4v6kBSoQ==
Date: Sat, 14 Oct 2023 17:04:26 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Conor Dooley <conor@kernel.org>
Cc: Inochi Amaoto <inochiama@outlook.com>, Chao Wei <chao.wei@sophgo.com>,
	Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 4/7] riscv: dts: sophgo: Separate common devices from
 cv1800b soc
Message-ID: <ZSpZmsb29ZC5L9dS@xhacker>
References: <IA1PR20MB49531C1C34C3E972DBBA4151BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231009112642.477337-1-inochiama@outlook.com>
 <IA1PR20MB49532560A3CA2670A0EAB846BBCEA@IA1PR20MB4953.namprd20.prod.outlook.com>
 <20231013-catchable-wince-f24060feb639@spud>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231013-catchable-wince-f24060feb639@spud>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231014_021642_122908_D31E8C13 
X-CRM114-Status: GOOD (  24.68  )
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

On Fri, Oct 13, 2023 at 10:08:24AM +0100, Conor Dooley wrote:
> Yo,
> 
> On Mon, Oct 09, 2023 at 07:26:35PM +0800, Inochi Amaoto wrote:
> > Move the cpu and the common peripherals of CV181x and CV180x to new file.
> > 
...

> >  	};
> >  };
> 
> What I wanted to comment on was this though - it seems that both the
> cv1800b and the cv1812h have identical plic and clint nodes, other than
> their compatibles? If that is the case, why create a cv1800b and a
> cv1812h specific file containing entirely new nodes, when overriding the
> compatible would be sufficient? Doubly so if the other SoCs in the
> cv18xx series are going to have identical layouts.
> 
> I gave it a quick test locally with the below diff applied on top of
> this series - although I didn't make sure that I didn't re-order the
> plic & clint nodes, I just wanted to demonstrate what I had done.
> 
> Cheers,
> Conor.
> 
> -- 8< --
> 
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> index 3af9e34b3bc7..a9d809a49e7a 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b-milkv-duo.dts
> @@ -5,7 +5,7 @@
>  
>  /dts-v1/;
>  
> -#include "cv1800b.dtsi"
> +#include "cv180x.dtsi"
>  
>  / {
>  	model = "Milk-V Duo";
> diff --git a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> index 0904154f9829..e69de29bb2d1 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1800b.dtsi
> @@ -1,30 +0,0 @@
> -// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> -/*
> - * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
> - */
> -
> -#include "cv180x.dtsi"
> -
> -/ {
> -	compatible = "sophgo,cv1800b";
> -
> -	soc {
> -		interrupt-parent = <&plic>;
> -
> -		plic: interrupt-controller@70000000 {
> -			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> -			reg = <0x70000000 0x4000000>;
> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> -			interrupt-controller;
> -			#address-cells = <0>;
> -			#interrupt-cells = <2>;
> -			riscv,ndev = <101>;
> -		};
> -
> -		clint: timer@74000000 {
> -			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> -			reg = <0x74000000 0x10000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> -		};
> -	};
> -};
> diff --git a/arch/riscv/boot/dts/sophgo/cv180x.dtsi b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> index 64ffb23d3626..1a2c44ba4de9 100644
> --- a/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv180x.dtsi
> @@ -48,6 +48,7 @@ osc: oscillator {
>  
>  	soc {
>  		compatible = "simple-bus";
> +		interrupt-parent = <&plic>;
>  		#address-cells = <1>;
>  		#size-cells = <1>;
>  		dma-noncoherent;
> @@ -174,5 +175,21 @@ uart4: serial@41c0000 {
>  			reg-io-width = <4>;
>  			status = "disabled";
>  		};
> +
> +		plic: interrupt-controller@70000000 {
> +			compatible = "sophgo,cv1800b-plic", "thead,c900-plic";
> +			reg = <0x70000000 0x4000000>;
> +			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> +			interrupt-controller;
> +			#address-cells = <0>;
> +			#interrupt-cells = <2>;
> +			riscv,ndev = <101>;
> +		};
> +
> +		clint: timer@74000000 {
> +			compatible = "sophgo,cv1800b-clint", "thead,c900-clint";
> +			reg = <0x74000000 0x10000>;
> +			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;
> +		};
>  	};
>  };
> diff --git a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> index 3864d34b0100..c0a8d3290cc8 100644
> --- a/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> +++ b/arch/riscv/boot/dts/sophgo/cv1812h.dtsi
> @@ -15,22 +15,13 @@ memory@80000000 {
>  	};
>  
>  	soc {
> -		interrupt-parent = <&plic>;
>  
>  		plic: interrupt-controller@70000000 {
>  			compatible = "sophgo,cv1812h-plic", "thead,c900-plic";

Hi Conor,

Maybe this has been discussed before but I didn't find it. I'm wondering
the reason of adding each plic and clint binding for each SoC, can we
just use the thead,c900-plic for plic?
FWICT, arm gic dt usage follows this way, there's no binding for each SoC's
gic but directly use "arm,gic-v3" and so on.


Thanks in advance

> -			reg = <0x70000000 0x4000000>;
> -			interrupts-extended = <&cpu0_intc 11>, <&cpu0_intc 9>;
> -			interrupt-controller;
> -			#address-cells = <0>;
> -			#interrupt-cells = <2>;
> -			riscv,ndev = <101>;
>  		};
>  
>  		clint: timer@74000000 {
>  			compatible = "sophgo,cv1812h-clint", "thead,c900-clint";
> -			reg = <0x74000000 0x10000>;
> -			interrupts-extended = <&cpu0_intc 3>, <&cpu0_intc 7>;


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
