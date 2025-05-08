Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80B58C3ABC0
	for <linux-riscv@archiver.kernel.org>; Thu,  8 May 2025 05:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9c8Q74TujeiZbKhmT18FNWCFBGCiSOnZ8zNW2kzGjyg=; b=DlmczPx/+F516F
	aOmaLm48RyETrDGMIBcqCxhfqAZ6iR1UhnhWchXo/Z44IfkUerw5SZm5d7e53FFl/xCNpHn5/xS7c
	QF/BompTUwdG9GZsNpPUbu7MEvIAovkxVeaadLIE4fvXExXugsEiD+K6oVsUmMasH2tyruMW+EIzg
	v8KNRG4rUadvuD15+DCRwRMutWEGPICIp77QwMF4uDYsrNxb11uSxwwWj7u8bFzoh/Qnn/CX50Jsh
	viCmNKMK5f0UAaE3HDT/g1v+TKEwIavM8JgTIaQPXqIu/lUXdE+Jl1sgfFxaRfjwCospf9OctDdqh
	bRsjQgHcJ6YTyQO5SKJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCu9N-0000000HOx4-0Pqk;
	Thu, 08 May 2025 05:50:29 +0000
Received: from bayard.4d2.org ([155.254.16.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCu9H-0000000HOwG-0ab3
	for linux-riscv@lists.infradead.org;
	Thu, 08 May 2025 05:50:24 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id 8305B12FB447;
	Wed, 07 May 2025 22:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746683421; bh=9h1xbURXxGWrvKx9QCcbV1QCEaBoQJVsir3FtKD2gCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mtVqxhw4uMfcFkqkn2govDBg6HdQT72/yv4YNkMaAMZ2W/qkCfX1waLVpD32rUYE6
	 pdyZx/XcDqW7FEI0x26rojU6SejdMYGe/ue0olk1cN1M3jjP0P9/WY0Cu1vCIuzZaX
	 4yJiwaOIWJBgqJayp0uWrbcg6CLXnftxGNNr7W9bulaQVVHh9agzmhWYNvCAVrOwXA
	 mKVXUDHfYTwxE6Sn7bdVukTP4KajT9Qr+bbBxqiKZJamvCdSKhRsTpqtGmYNThoySm
	 z8J15ghInqO+VDIeEeL0Fnd6FZWcXvLr1tNLxd/PdkugaDfZV6e7EeMEv7mEaCH07w
	 tcOdpUiTgVJgg==
X-Virus-Scanned: amavisd-new at 4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZB89_tY-Ofmk; Wed,  7 May 2025 22:49:47 -0700 (PDT)
Received: from ketchup (unknown [183.217.82.204])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 896BA12FB439;
	Wed, 07 May 2025 22:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1746683387; bh=9h1xbURXxGWrvKx9QCcbV1QCEaBoQJVsir3FtKD2gCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q7g4GK4QYHgbQRvVz6WueosEuJM3dTt/iuT/Z69kHnZRsG0/sUiBbIyX4qx/VniWK
	 SWoAyq3+YdPBynkoZy8PMBLF/6a8XVwYF5jAGJaYVLPi5fEU+SGJdnbQm1UbgERhb2
	 knsws/s/c6KJgz3BRpNDaspFV50aUkpi/tE9GlVs9uCLSXth8ItSS7xFnDrato4Z2E
	 nEkHMItd74NUdWtAF7qFWr95LFveUeghbIFwWhVVsKLYQ8iaIJjqrJaDTOo3SpXXaV
	 B9bNrtnQXXwriCcCMqxef2UHdfSuvxPu+lB/kcc2Sk0GnC4zYzfLEo9n64czP8mj89
	 yRq0ef7LoXY0A==
Date: Thu, 8 May 2025 05:49:39 +0000
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev, Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Meng Zhang <zhangmeng.kevin@linux.spacemit.com>,
	Alex Elder <elder@riscstar.com>
Subject: Re: [PATCH v8 5/6] riscv: dts: spacemit: Add clock tree for SpacemiT
 K1
Message-ID: <aBxF81yqPgHP5oA_@ketchup>
References: <20250416135406.16284-1-heylenay@4d2.org>
 <20250416135406.16284-6-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250416135406.16284-6-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_225023_221688_AAAD71E1 
X-CRM114-Status: GOOD (  16.10  )
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

Hi Yixun,

On Wed, Apr 16, 2025 at 01:54:05PM +0000, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> Reviewed-by: Alex Elder <elder@riscstar.com>
> Reviewed-by: Yixun Lan <dlan@gentoo.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 75 ++++++++++++++++++++++++++++
>  1 file changed, 75 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..584f0dbc60f5 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi

I found that I forgot to make the nodenames of syscons consistent:
both "system-control" and "system-controller" are used, and pll should
be named as "clock-controller" instead.

Could you please drop the SoC devicetree patch then I could rework on
it and correct the mistake? Or I could follow up a clean up patch if
dropping isn't easy or doesn't follow the convention.

Thanks for your work,
Haylen Chu

> @@ -314,6 +346,17 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@d4017000 {
>  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>  			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +452,38 @@ pinctrl: pinctrl@d401e000 {
>  			reg = <0x0 0xd401e000 0x0 0x400>;
>  		};
>  
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		plic: interrupt-controller@e0000000 {
>  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> -- 
> 2.49.0
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
