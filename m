Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAAE9109E52B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Mar 2026 01:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sb2iRZX+GyBIAQEL3fISVTSVBheYYGwFIY+8iXeCyi8=; b=Pv+rX67GMKa3oE
	C0kA0+FYinDhE6wBV2CTtDkInfb+JgorBZXsbnNImXzG3Gh82VP1vzNoO7adQ4eJDBmQLWVqdVn+9
	9zRxnhE5k96oHmizwZauy9njuRqrNn2X0MD343WCfIZ046fb7cQ27QPpW8qrLJil3pnk0Qw6DExBq
	CHZxL5DfPUTDsFSKRprbbMVZzbASwuZtpiF7PHhaBbHkku9X9zCdc1ne4wuIES9TbzYa3wsKyww9L
	aJRW5T2EvkrFHyQU290xt1T2FybkgPTHoVsHaVTNOYOh7sX7QG78vPZqQe4ZulJvEbk30cjilPiNA
	mL4jvA8+vREeFjH38HMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZaJ-00000004Wjg-2bBO;
	Thu, 26 Mar 2026 01:32:31 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5ZaI-00000004WjZ-17ok
	for linux-riscv@lists.infradead.org;
	Thu, 26 Mar 2026 01:32:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3FA3460128;
	Thu, 26 Mar 2026 01:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7056DC4CEF7;
	Thu, 26 Mar 2026 01:32:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774488748;
	bh=0o/KA3E1AVUpDoF3loQgLJ2Dd3NgNwTXagLGMlM09+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GSIl7tbqONjJj7zMpBL8xMchY9Pbb+/FZLZrvaFtvnpxH67zSvr5snK9HHwXQIqt+
	 CKZG087S7ntuKqygpTEw2nB5n2N4iB5kWaPGfYk2u1pLLaYMC7NOXdfplZ2Z08DZMU
	 dc79KrRW+i77gFtxDc0KWT1Pw/9+Fyec5bGAzjqFOaNxKcB3eM+r85Rk1LkWYGJOmq
	 sceFbrG3YYD/dqFUKRBV1n2Ta5vG6hcbhjGQVs6gZ8Gd/4wBduKucCuTdlW6O39DCo
	 X1fXixIrbgZLDWfSVI8wWBMfSVyFMg6+d0CDyMn2W+aEqwR/0ZyCDxFHXA4VFIUPKS
	 GknV1m6WTIIoQ==
Date: Thu, 26 Mar 2026 09:32:26 +0800
From: Yixun Lan <dlan@kernel.org>
To: Inochi Amaoto <inochiama@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Richard Cochran <richardcochran@gmail.com>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org, Yixun Lan <dlan@gentoo.org>,
	Longbin Li <looong.bin@gmail.com>
Subject: Re: [PATCH v5] riscv: dts: spacemit: Add ethernet device for K3
Message-ID: <20260326013226-GKC777612@kernel.org>
References: <20260324063714.750428-1-inochiama@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260324063714.750428-1-inochiama@gmail.com>
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

Hi Inochi,

Can you rebase the patch on top of spacemit DT branch, it would ease my
life to merge it, as I see some conflicts..

https://github.com/spacemit-com/linux/tree/k1/dt-for-next

Also one comment below.. Please check

On 14:37 Tue 24 Mar     , Inochi Amaoto wrote:
> Add all ethernet device nodes for K3 SoC.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
> Require the following patch series:
> 1. Basic DT device patch
> https://lore.kernel.org/spacemit/20260304-01-dts-uart-full-v1-0-50a0aa53a245@kernel.org
> 2. Ethernet driver patch
> https://lore.kernel.org/spacemit/20260316010041.164360-1-inochiama@gmail.com
> 
> Changed from v4:
> 1. Fix pinctrl pin name
> 2. Remove alias for disabled node
> 
> Changed from v3:
> 1. Separate the pin as RGMII pin and INT pin.
> 2. Add comment for pin usage.
> 3. Rename the ethernet pinctrl node to address it is RGMII node.
> 
> Changed from v2:
> 1. keep aliases in alphabetical order.
> 
> Changed from v1:
> 1. remove interrupt-parents property
> 2. add aliases for ethernet node
> ---
..
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 6cc31e94c13a..4c0cc135dc09 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -5,6 +5,7 @@
>   */
> 
>  #include <dt-bindings/clock/spacemit,k3-clocks.h>
> +#include <dt-bindings/reset/spacemit,k3-resets.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> 
>  /dts-v1/;
> @@ -437,6 +438,109 @@ soc: soc {
>  		dma-noncoherent;
>  		ranges;
> 
> +		gmac_axi_setup: stmmac-axi-config {
> +			snps,wr_osr_lmt = <0xf>;
> +			snps,rd_osr_lmt = <0xf>;
> +			/* max axi burst len is 256 */
> +			snps,blen = <256 128 64 32 16 0 0>;
> +		};
I've got a DT complaint, can you take a look? probably put it inside
ethernet node? although will duplicate a little bit in several nodes..

arch/riscv/boot/dts/spacemit/k3.dtsi:441.37-446.5: Warning (simple_bus_reg): /soc/stmmac-axi-config: missing or empty reg/ranges property


-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
