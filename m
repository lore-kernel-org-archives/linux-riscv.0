Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1859E77197
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Jan 2025 09:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=BeGwu8zIIoFH0wUJRD2hObCt6b4qH+6IfCQq9FA66uY=; b=odU0YJ444tGqy4
	VWH+R2rBhNbTWwKz8dWmzhYa575FB1Wuxn0DAgAMnLtBgFIODKObvCzhrfQlb4VvvBv8llD1ORvQD
	yekNsmhwPSZHzPB4QLSiKf1F8KQxWaEVPIcMWUBl9h8hPJDao2ibZ9nT1CZ3G8QhySkEesVhT9xVl
	zV0D32sgIDUZXLvLMGlaXmPsZ1pYrrXs4angj5STwAKWRVd31ED6cfgFhDwr532tcKI+q1FpcYKbk
	FYe/z2AqhHwWis37UZv85ks9Kz2OL6KBv4L3WZTz1bLqBLaDb8zo6GYwfFS5qLLy73Z2ilmhNRXDh
	LEJcmAwGhWzcWvEIjpQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoft-0000000BJyj-3Rpx;
	Thu, 09 Jan 2025 09:17:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVoY6-0000000BHcA-3wYW
	for linux-riscv@lists.infradead.org;
	Thu, 09 Jan 2025 09:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6751A5C5A54;
	Thu,  9 Jan 2025 09:09:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 85008C4CEE3;
	Thu,  9 Jan 2025 09:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736413794;
	bh=KL2iAg/uEyClQDiAdgHhgwp3Z+anv1P0HGVi20lgT+Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WflDN4Nq4cXrmp4uPAoYzqk4UXbJses9w4LuKM1Deqf0GGuXoCtpgreOBXaFzbjQh
	 vBX4cz18tPfO3ViwBQLWF2Dv9QxtcabcAE5gpCVKpyAuolLKdYPBcY20ARunEXYiBc
	 KpvGpu/GBgy0Fz8Hy4JPYxL3o9iAf3YAHFUhGZtlk8qEd6Ygg0yNJFjnL59pM0sKsL
	 BAI6WYiFmSlygmfklrsFkl4dMaE1z1373Z32ACEaFoD+QsjuHQHkPXB6Y9ZWK//v8/
	 amJikE0EN7K3FYkeT/UJei94Z6j6NIgTia0LfLAeq5eLFgFpwqIONhSdalDYzXFY6g
	 JbtJzLLaCXpWg==
Date: Thu, 9 Jan 2025 10:09:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xukai Wang <kingxukai@zohomail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	Troy Mitchell <TroyMitchell988@gmail.com>
Subject: Re: [PATCH v2 3/3] riscv: dts: canaan: Add clock initial support for
 K230
Message-ID: <ebj26gfkaypgtvi7o2ab3mfvcgc7yk4scdoxroftlp7lnx3xix@p3nnfiva3hdm>
References: <20250108-b4-k230-clk-v2-0-27b30a2ca52d@zohomail.com>
 <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250108-b4-k230-clk-v2-3-27b30a2ca52d@zohomail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_010955_028123_7E19599E 
X-CRM114-Status: GOOD (  15.39  )
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

On Wed, Jan 08, 2025 at 07:53:09PM +0800, Xukai Wang wrote:
> This patch provides basic support for the K230 clock, which does not
> cover all clocks.
> 
> The clock tree of the K230 SoC consists of OSC24M,
> PLLs and sysclk.
> 
> Co-developed-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
> Signed-off-by: Xukai Wang <kingxukai@zohomail.com>
> ---
>  arch/riscv/boot/dts/canaan/k230.dtsi | 27 +++++++++++++++++++++++++++
>  1 file changed, 27 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/canaan/k230.dtsi b/arch/riscv/boot/dts/canaan/k230.dtsi
> index 95c1a3d8fb1192e30113d96d3e96329545bc6ae7..c407471af3daac154e0fbdd377d57ea3ff4698e1 100644
> --- a/arch/riscv/boot/dts/canaan/k230.dtsi
> +++ b/arch/riscv/boot/dts/canaan/k230.dtsi
> @@ -3,6 +3,7 @@
>   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>   */
>  
> +#include <dt-bindings/clock/k230-clk.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
>  
>  /dts-v1/;
> @@ -65,6 +66,13 @@ apb_clk: apb-clk-clock {
>  		#clock-cells = <0>;
>  	};
>  
> +	osc24m: clock-24m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "osc24m";
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -138,5 +146,24 @@ uart4: serial@91404000 {
>  			reg-shift = <2>;
>  			status = "disabled";
>  		};
> +
> +		sysclk: clock-controller@91100000 {

Does not look like placed in correct order.

> +			compatible = "canaan,k230-clk";
> +			reg = <0x0 0x91102000 0x0 0x1000>, <0x0 0x91100000 0x0 0x1000>;
> +			clocks = <&osc24m>;
> +			#clock-cells = <1>;
> +			clock-output-names =

Unnecessary blank line

> +			"CPU0_ACLK", "CPU0_PLIC", "CPU0_NOC_DDRCP4", "CPU0_PCLK",

Messed indentation/alignment. See DTS coding style.

Best regards,
Krzysztof


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
