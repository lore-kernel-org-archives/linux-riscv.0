Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CADDC531D0
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Jul 2026 13:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=siNxsCechR9c29QdjlD8uAX6L4US2Q1xUIZWbIwgqo4=; b=PufSLDGvsOcqUK
	ZrrQejIw2pajMQkb3hCRKTghKUIKCdAmjlwTELGUKKFnWKHz/1uYz4StJkc1ofSVKn5MsB+KQXyA5
	94A01fXm8dVRqw6llioslIqFBojCd6Fz1pC0vVSofrRK45nYS0sf21tCf38rlnEDD4llGMjEUZO97
	4j06sTOWlIs3U6TduqIP8F/NUSt7/O3/1ilIWXnysdorgUANbH2mN8zTP51831s7/cQMgRKnLFEtk
	zWGCdTCZISiZJGLxiYYG2AZIoh6apL10xCuR/H8QpzDjCbx+asuvp+TLnSEPdjGV7nwVcBmBrCqt8
	S66ckGEh0zCNO1RrSrOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncDd-00000000MuO-1ELI;
	Sat, 25 Jul 2026 13:15:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wncDb-00000000MuB-3wYK
	for linux-riscv@lists.infradead.org;
	Sat, 25 Jul 2026 13:15:08 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 471FD600AA;
	Sat, 25 Jul 2026 13:15:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6F57B1F000E9;
	Sat, 25 Jul 2026 13:15:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784985307;
	bh=PDBeDRga6CAJFTofuPKkM0gbfdY9oTzTYuyONSr4uz0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VACC1jKBV5JMuNmUzYmDkvuhh8bR/cLWP92Y+28v4dKzBJYI8z9T8NNa2VLt1Zd/c
	 4MR3UI4lkqZDVRHQF5XhjaQOBxOlGLmrcCUirt5apPlUR4oYyiZkUbUjgBcnlf+wcd
	 h9x0+RGbO6CILjBHqfoq3lF/kvh7LX+sTqQ7nA33V8vh7HLuCy5PyiZnvOqzMwpdR7
	 oEjyEzhOZwytQL8GktqAnMHk29C82yLPdHaX0S4NNo0czf6jOXYq0yvY8vuLwfNxD2
	 MzE+x86j+a3MKuQ2uF8fpNWFIBzQmE/B3dS11qmNx9SHYsmuvNRKsap81A+EiLjHFb
	 3LINK9MgaPnIg==
Date: Sat, 25 Jul 2026 13:15:04 +0000
From: Yixun Lan <dlan@kernel.org>
To: Zhengyu He <hezhy472013@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Mark Brown <broonie@kernel.org>, Alex Elder <elder@kernel.org>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-spi@vger.kernel.org, wefu@redhat.com,
	Cody Kang <cody.kang.hk@outlook.com>
Subject: Re: [PATCH 3/4] riscv: dts: spacemit: add SPI controllers for K3
Message-ID: <20260725131504-GKE77545@kernel.org>
References: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-0-969a1b0f783f@gmail.com>
 <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-3-969a1b0f783f@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260717-k3-com260-spi-v7-2-rc2-b4-preview-20260716-v1-3-969a1b0f783f@gmail.com>
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

On 07:45 Fri 17 Jul     , Zhengyu He wrote:
> Add the SPI controller nodes for K3.
> 
> Signed-off-by: Cody Kang <cody.kang.hk@outlook.com>
> Signed-off-by: Zhengyu He <hezhy472013@gmail.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3.dtsi | 49 +++++++++++++++++++++++++++++++++++-
>  1 file changed, 48 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3.dtsi b/arch/riscv/boot/dts/spacemit/k3.dtsi
> index 19fc9b49668e..dc44b5c77d41 100644
> --- a/arch/riscv/boot/dts/spacemit/k3.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3.dtsi
> @@ -5,8 +5,10 @@
>   */
>  
>  #include <dt-bindings/clock/spacemit,k3-clocks.h>
> -#include <dt-bindings/reset/spacemit,k3-resets.h>
>  #include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/reset/spacemit,k3-resets.h>
> +
> +#include "k3-pdma.h"
>  
>  /dts-v1/;
>  
> @@ -927,6 +929,21 @@ pwm7: pwm@d401bc00 {
>  			status = "disabled";
>  		};
>  
> +		spi3: spi@d401c000 {
> +			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
> +			reg = <0x0 0xd401c000 0x0 0x30>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&syscon_apbc CLK_APBC_SPI3>,
> +				 <&syscon_apbc CLK_APBC_SPI3_BUS>;
> +			clock-names = "core", "bus";
> +			resets = <&syscon_apbc RESET_APBC_SPI3>;
> +			interrupts = <55 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&pdma K3_PDMA_SSP3_RX>, <&pdma K3_PDMA_SSP3_TX>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
>  		pwm8: pwm@d4020000 {
>  			compatible = "spacemit,k3-pwm", "marvell,pxa910-pwm";
>  			reg = <0x0 0xd4020000 0x0 0x10>;
> @@ -1081,6 +1098,36 @@ uart10: serial@d401f000 {
>  			status = "disabled";
>  		};
>  
> +		spi0: spi@d4040000 {
> +			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
> +			reg = <0x0 0xd4040000 0x0 0x30>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&syscon_apbc CLK_APBC_SPI0>,
> +				 <&syscon_apbc CLK_APBC_SPI0_BUS>;
> +			clock-names = "core", "bus";
> +			resets = <&syscon_apbc RESET_APBC_SPI0>;
> +			interrupts = <283 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&pdma K3_PDMA_SSP0_RX>, <&pdma K3_PDMA_SSP0_TX>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@d4040800 {
> +			compatible = "spacemit,k3-spi", "spacemit,k1-spi";
> +			reg = <0x0 0xd4040800 0x0 0x30>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			clocks = <&syscon_apbc CLK_APBC_SPI1>,
> +				 <&syscon_apbc CLK_APBC_SPI1_BUS>;
> +			clock-names = "core", "bus";
> +			resets = <&syscon_apbc RESET_APBC_SPI1>;
> +			interrupts = <282 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&pdma K3_PDMA_SSP1_RX>, <&pdma K3_PDMA_SSP1_TX>;
> +			dma-names = "rx", "tx";
> +			status = "disabled";
> +		};
> +
>  		syscon_mpmu: system-controller@d4050000 {
>  			compatible = "spacemit,k3-syscon-mpmu";
>  			reg = <0x0 0xd4050000 0x0 0x10000>;
> 
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
