Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA572C4321E
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 17:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=M7mlmnjPMcCM9dUphoebRS5fCwAJrIjwLD+Hss0bjow=; b=Hm+bg/RaNnLap9
	E+ZYpO1Qj38NSO3eC7HC03F9qsoHFSudone6ENFc3kVVxt9kdYBR+qyJ8mOjpQUUtgBkVGW1elNCQ
	W2wnigs3RNg9YdPMguf7N2Qw05UZU3oKYgwp6eTTwLg/jmmgQDqxI83Ucf0G9ZlFn74qb0SIMhnKL
	L7nHUi5QToCY57B+4fmd367Ku8T9cJhSlhAxzyTJqdq7E1kLwG9RfltFoIiNasMIdcfqYwapEHc1N
	83/CPzABFczKn/CSUuENov5BGiex8WNba/1NNSfsMjd3XXMZ0IR5ynd0qZne1b6x3NX15sg1jwkIP
	4VKME8hmktps7HHalLXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0nnJ-009Kxo-U4; Thu, 01 Dec 2022 17:56:22 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0ngL-009EB1-6l
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 17:49:10 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 8EA03620A1;
	Thu,  1 Dec 2022 17:49:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEDBCC433D7;
	Thu,  1 Dec 2022 17:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669916948;
	bh=ND2zlHSHHuuGHYwNjXAHSmKTCOCnsFtqcA19MkdHXMs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gFAr72gDCcBN0kR5qluhgiS/OMPUblkPgQxZEy+MqOw9j4h5rvEfbVFM3z9NLRXuJ
	 QSaSXsG18NWlvQ9qwV44TzkR8kpg/2+kBZGxD4reqF2Gi6B4pz++aIlxKAM3TE+1pP
	 +EaKLpo+wkd9KbJEEbLndFBX3thTgZsIPpBGUGydVVzgTwWFwPF2tc2zydekx/9C7t
	 cBFvS4fBKM7FAtw8Hel6dTTmYIxNZGJRvj8njWEyFhsyhSSCHr6ZTD0lBV5bRfZ4Ug
	 qIMRde8fDdkegHmgbWPZS/rRvqLm7eG4mPHZuxck4AVdPn3GBO5dqJpXEVcIwRGGxG
	 Fm0xWHegDzXLA==
Date: Thu, 1 Dec 2022 17:49:02 +0000
From: Conor Dooley <conor@kernel.org>
To: Yanhong Wang <yanhong.wang@starfivetech.com>
Cc: linux-riscv@lists.infradead.org, netdev@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	Richard Cochran <richardcochran@gmail.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Peter Geis <pgwipeout@gmail.com>
Subject: Re: [PATCH v1 7/7] riscv: dts: starfive: visionfive-v2: Add phy
 delay_chain configuration
Message-ID: <Y4jpDvXo/uj9ygLR@spud>
References: <20221201090242.2381-1-yanhong.wang@starfivetech.com>
 <20221201090242.2381-8-yanhong.wang@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221201090242.2381-8-yanhong.wang@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_094909_436812_90B9E763 
X-CRM114-Status: GOOD (  15.92  )
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

On Thu, Dec 01, 2022 at 05:02:42PM +0800, Yanhong Wang wrote:
> Add phy delay_chain configuration to support motorcomm phy driver for
> StarFive VisionFive 2 board.
> 
> Signed-off-by: Yanhong Wang <yanhong.wang@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-v2.dts         | 46 +++++++++++++++++++
>  1 file changed, 46 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> index c8946cf3a268..2868ef4c74ef 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-v2.dts
> @@ -15,6 +15,8 @@
>  
>  	aliases {
>  		serial0 = &uart0;
> +		ethernet0=&gmac0;
> +		ethernet1=&gmac1;

Please match the whitespace usage of the existing entry.

>  	};
>  
>  	chosen {
> @@ -114,3 +116,47 @@
>  	pinctrl-0 = <&uart0_pins>;
>  	status = "okay";
>  };
> +
> +&gmac0 {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	phy-handle = <&phy0>;
> +	status = "okay";
> +	mdio0 {

A line of whitespace before the child nodes too please :)

> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy0: ethernet-phy@0 {
> +			reg = <0>;
> +			rxc_dly_en = <1>;
> +			tx_delay_sel_fe = <5>;
> +			tx_delay_sel = <0xa>;
> +			tx_inverted_10 = <0x1>;
> +			tx_inverted_100 = <0x1>;
> +			tx_inverted_1000 = <0x1>;
> +		};
> +	};
> +};
> +
> +&gmac1 {
> +	status = "okay";
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +	phy-handle = <&phy1>;
> +	status = "okay";
> +	mdio1 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		compatible = "snps,dwmac-mdio";
> +		phy1: ethernet-phy@1 {
> +			reg = <1>;
> +			tx_delay_sel_fe = <5>;
> +			tx_delay_sel = <0>;
> +			rxc_dly_en = <0>;
> +			tx_inverted_10 = <0x1>;
> +			tx_inverted_100 = <0x1>;
> +			tx_inverted_1000 = <0x0>;
> +		};
> +	};
> +};
> -- 
> 2.17.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
