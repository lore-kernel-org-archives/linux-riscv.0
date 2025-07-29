Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A443C83F26
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Jul 2025 17:48:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nK0dJwBPkEegNYy1xpkdMaHpDSdcaOJeyuc1YmQ3jQY=; b=Ow50ctVC7dZUUj
	qJB9p2suK0OLXr0as0z19/8wrxRyyalLvCdF+/p1CE0GYLvcOXNCi5yfXuplmMGaHZpB/eqy3553C
	puntzGwu1AbsA0oV6G+8xoiEF1ic1+R3NUjW3SIjlnUZbGnPCcJOVufSmDw8usLfbJUAejags+LR/
	AKr5N1/ziWBaapBhQdVOi5ceInE5uwoDcCHgm39BP1QuDH3pP3U9pI4iZhidcYU+oY90pkna1J8rB
	pwPK1YXq11xk5ZbJI8PhXM/gngc3dHR8ABekh5Xi8xYFgRt4Y524bcpIEzNnzQSaIddgigFWCs2gL
	GIcN0hNlvbvl05o7YuIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoQj-0000000HOQm-3U40;
	Tue, 29 Jul 2025 17:48:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugoOj-0000000HOG6-3QoV
	for linux-riscv@lists.infradead.org;
	Tue, 29 Jul 2025 17:45:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E404C5C6533;
	Tue, 29 Jul 2025 17:45:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEF0C4CEF4;
	Tue, 29 Jul 2025 17:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753811156;
	bh=6qjTRlNG6mWLFC8VSGcpPLF+CAKlIypJQcDcbXR/Otw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3SvszjaScYVH2cxvcbjgFbZsEdyFYQ5VRKpfVXyjtjpt0htJIN4mtK1PpeCjDaTh
	 /46k3styG6mmy/i/SG4QDXuWKob0spuXN4wa2XligKXGNHgB96bSxGvYpmq6t8R4lQ
	 3LGJp2bUsAMQnQP3EpveRTed/HN+jVc+RK5Axje7AwxBXFws9gYtiLeuLNzj5ly+gV
	 uF3n3MzkE5o6wlBHY3SHVPJTNsIdjDQ7x+AOQ6MLwrKSSv6sRiRAOhiPeIHS6WkQRB
	 e9BWt/aD9VViGsaHwERb/lX7n67N7yX90TBLYrc9+y6SYEJx8Lmceif5xxNW4b++Vj
	 0fP4QaRafx0fg==
Date: Tue, 29 Jul 2025 10:45:54 -0700
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Jisheng Zhang <jszhang@kernel.org>, linux-riscv@lists.infradead.org,
	netdev@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net 3/3] riscv: dts: thead: Add APB clocks for TH1520
 GMACs
Message-ID: <aIkI0vHDD1CfxAkl@x1>
References: <20250729093734.40132-1-ziyao@disroot.org>
 <20250729093734.40132-4-ziyao@disroot.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250729093734.40132-4-ziyao@disroot.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250729_104557_899058_F3F6B735 
X-CRM114-Status: GOOD (  13.69  )
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

On Tue, Jul 29, 2025 at 09:37:34AM +0000, Yao Zi wrote:
> Describe perisys-apb4-hclk as the APB clock for TH1520 SoC, which is
> essential for accessing GMAC glue registers.
> 
> Fixes: 7e756671a664 ("riscv: dts: thead: Add TH1520 ethernet nodes")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index 42724bf7e90e..03f1d7319049 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -297,8 +297,9 @@ gmac1: ethernet@ffe7060000 {
>  			reg-names = "dwmac", "apb";
>  			interrupts = <67 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> -			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>;
> -			clock-names = "stmmaceth", "pclk";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC1>,
> +				 <&clk CLK_PERISYS_APB4_HCLK>;
> +			clock-names = "stmmaceth", "pclk", "apb";
>  			snps,pbl = <32>;
>  			snps,fixed-burst;
>  			snps,multicast-filter-bins = <64>;
> @@ -319,8 +320,9 @@ gmac0: ethernet@ffe7070000 {
>  			reg-names = "dwmac", "apb";
>  			interrupts = <66 IRQ_TYPE_LEVEL_HIGH>;
>  			interrupt-names = "macirq";
> -			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>;
> -			clock-names = "stmmaceth", "pclk";
> +			clocks = <&clk CLK_GMAC_AXI>, <&clk CLK_GMAC0>,
> +				 <&clk CLK_PERISYS_APB4_HCLK>;
> +			clock-names = "stmmaceth", "pclk", "apb";
>  			snps,pbl = <32>;
>  			snps,fixed-burst;
>  			snps,multicast-filter-bins = <64>;
> -- 
> 2.50.1
> 

Thank you for determining that this clock is needed for the GMAC.

Reviewed-by: Drew Fustini <fustini@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
