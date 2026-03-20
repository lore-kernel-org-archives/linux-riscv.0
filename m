Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C33A1093199
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Mar 2026 09:19:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dBpNckAuSN/YoNxbgtm9fRPVEGZrQPRTxf68CPqd29w=; b=CY2XGcUzupgRWN
	to1MtRAgJebgfnQLeDsLRmHt7/l/RyZg4vNkz002mYDMsAJQwNiXOG06dH9TenYHTIyT9m7DlP23B
	LJ3TfDJmwT9LRgkgR8DIM6QVwlfZ/rlVx5QiFwaLl6urttyBL50tNibcfTVXiC3j/nyF159QXKT2o
	RD5nyf6WvjbttLymJq3NxsCGXx1tX0py29FdF+O5HTmHEgCq/7RlxkR1jCyXJGApVR+OPt7YO5F8C
	OrIZ7u7oL60Du60ocXgc4zbC1F5QLkXCHWype6LgD6COZUiv8upDmbFN/HAJvjybywHS/mrNAWs/c
	Oe2ZUdPOBLullbw2bydw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W17-0000000CSks-1dJ6;
	Fri, 20 Mar 2026 09:19:41 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3W15-0000000CSjp-0FkV
	for linux-riscv@lists.infradead.org;
	Fri, 20 Mar 2026 09:19:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 881D5403C0;
	Fri, 20 Mar 2026 09:19:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FB6C4CEF7;
	Fri, 20 Mar 2026 09:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773998378;
	bh=ykmhVLHFaVW6VL0kFqfY/5bJbeu59kIBa0Np560J1r0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p2SHTXDwJKQk8EgpT/xYlgQiw6SSOEC+/0hqE1VfRxsyolPrXWYSA7fJLnwKgeBOk
	 WNp1M+cbScGMlEMqpRBDjfEK9oydKmJCJG9PPCJ0VivFv8d+m3Nwc5hl0ePDlJdqen
	 h22qg1Y5Q5VXjmesk+Pkih5XnhLxUy7XisXEowHuwdkV4iRy0xvTsBmGtqQU42dra2
	 CM+poPsSMg4QPsekNX8P1PlsMZbzusk4kEUcRuEYouZ+zzh0jSzAxtMHCtK+wtlkin
	 AcHLL0iFnNViYUa6GBLfHlA+spDUVK0z2cz1V5Av1nGQ9WfkRbMbkV62NEtxW4F8g7
	 YXBmPsMJZc00Q==
Date: Fri, 20 Mar 2026 17:19:36 +0800
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: dts: spacemit: Add PDMA controller node for K3 SoC
Message-ID: <20260320091936-GKB525649@kernel.org>
References: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260317-k3-pdma-v1-1-f39d3e97b53a@linux.spacemit.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_021939_144274_50644B86 
X-CRM114-Status: GOOD (  18.38  )
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

Hi Troy,

On 15:55 Tue 17 Mar     , Troy Mitchell wrote:
> Add the Peripheral DMA (PDMA) controller node for the SpacemiT K3 SoC.
> The PDMA controller provides general-purpose DMA capabilities for various
> peripheral devices across the system to offload CPU data transfers.
> 
> Unlike the previous K1 SoC, where some DMA masters had memory addressing
> limitations (e.g. restricted to the 0-4GB space) requiring a dedicated dma-bus
> with dma-ranges to restrict memory allocations, the K3 DMA masters have
> full memory addressing capabilities. Therefore, the PDMA node is now
> instantiated directly under the main soc bus.
> 
..
> This configuration defines the essential hardware properties:
> - Register base address and size
> - High-level triggered interrupt
> - Associated APMU clock and reset controls
> - 16 hardware DMA channels
> 
> The node is disabled by default and should be enabled by specific
> board device trees as needed.
I would suggest to drop above, as they are quite obvious, and easy for 
people to grab from the code..
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 11 +++++++++++
>  1 file changed, 11 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index a3a8ceddabec..f90d34a81be0 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -438,6 +438,17 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		pdma: dma-controller@d4000000 {
> +			compatible = "spacemit,k1-pdma";
I think here we should introduce a new compatible for K3 SoC,
it would avoid ABI breakage if something different with K1?
cases exist even same PDMA IP integrated into different SoC..

The commit message tells some difference, although no code changes
introduced so far..

> +			reg = <0x0 0xd4000000 0x0 0x4000>;
> +			clocks = <&syscon_apmu CLK_APMU_DMA>;
> +			resets = <&syscon_apmu RESET_APMU_DMA>;
> +			interrupts = <72 IRQ_TYPE_LEVEL_HIGH>;
> +			dma-channels = <16>;
> +			#dma-cells = <1>;
> +			status = "disabled";
> +		};
> +
>  		syscon_apbc: system-controller@d4015000 {
>  			compatible = "spacemit,k3-syscon-apbc";
>  			reg = <0x0 0xd4015000 0x0 0x1000>;
> 
> ---
> base-commit: 95c541ddfb0815a0ea8477af778bb13bb075079a
> change-id: 20260317-k3-pdma-7c1734431436
> 
> Best regards,
> -- 
> Troy Mitchell <troy.mitchell@linux.spacemit.com>
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
