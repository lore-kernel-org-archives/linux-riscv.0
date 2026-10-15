Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E389BCC6B34
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Oct 2026 07:46:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ncNxPW67Ydev1SiohO8gDLOhFrCh8sgVMkHYaREuM2U=; b=GsQ9nQzkR1KW8o
	ulimKo9IsPZDGpL2XlONx3AHrFpCC/fVEuXEeT9RUZnQMsETFYybhH15NmNYlj94j8rfB2W3NarS7
	HDEn0HlFZXG9U3AXG9WIPAvvQEe1VlGK1DsLERvf4GP8UTmBNUlEO2EtSP15kDUWzUY3gNZJ8ic6o
	SH8OHeJyWnajsA0HcG+J8RM/WRZknyGwsm4AjFDb59gOFxKbCfxOKaVf8R/EZ+ZZWdd5SznZv8gSp
	C46t/Nh3aK8nyaTgJb6LCrYF95oWsj+tJVZiML/FuA9wvfZdP9Ic4uZsW3w/1iEduotLKo2YvWOcI
	6oLGRl6LJnhLdwSEapbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGAU-0000000H46Y-1pcJ;
	Thu, 15 Oct 2026 07:46:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHGAS-0000000H468-2r8Z
	for linux-riscv@lists.infradead.org;
	Thu, 15 Oct 2026 07:46:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C2B006022A;
	Thu, 15 Oct 2026 07:46:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAB4F1F000C4;
	Thu, 15 Oct 2026 07:46:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792050383;
	bh=QkqZG/OEwWJwbZzPLLwpQFxTbwuEuA7XEWKZ9tqbnB0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=A/H46poLF6DSrGnvDDatBj2zQa4/k7wjPuQhcY/jW4f3+NFllWuqOFGCktjHtrXFw
	 VoVTwzNFBaIzv+31E8G206VIR4KOl9YxpG2dGkPsNrgvMbHpPtKsNmjs0onHrgHAjS
	 v+cIlmV9qtcgUyhNyieYpfWnstne6zR1HG6YagyGDa5vc0aY5xUB0s6Y8B47Xw6FZT
	 Kf0JMGZrU18rrFv+IAnwEegXytfrylrh5nml2lJ47DJFB45X2ak1M3+KFWodnXZS7Q
	 Xank1trwOKbzsH45FTsKzHGrzTE6Zu2Ithf7U2tQqCuZiZ6A5qXX5ORBmd3zpv9kMI
	 /n4cXf+GMFkhA==
Date: Thu, 15 Oct 2026 07:46:21 +0000
From: Yixun Lan <dlan@kernel.org>
To: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	E Shattow <e@freeshell.de>, devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: mark K1 board boot devices
 bootph-pre-ram
Message-ID: <20261015074621-GKN26088@kernel.org>
References: <20261012235624.77993-1-alan.tseng.cs@gmail.com>
 <20261012235624.77993-3-alan.tseng.cs@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261012235624.77993-3-alan.tseng.cs@gmail.com>
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

Hi Hung-Chun,

Have two minor comments, see below

On 07:56 Tue 13 Oct     , Hung-Chun Tseng wrote:
> On K1 boards an SPL reads the board EEPROM (0x50 on i2c2) to identify
> the board, and before DRAM training it programs the P1 PMIC (0x41 on
> i2c8) rails buck1, buck3 and aldo1. Boards that boot from SPI NOR also
> need the flash on QSPI.
> 
> Mark these board peripherals, and the I2C buses they sit on,
> bootph-pre-ram on the boards that have them.
> 
> Assisted-by: claude-opus-5-5 dtbs_check
> Signed-off-by: Hung-Chun Tseng <alan.tseng.cs@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi | 7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts   | 7 +++++++
>  arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts | 8 ++++++++
>  arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts    | 8 ++++++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts  | 5 +++++
>  arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts  | 6 ++++++
>  6 files changed, 41 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> index 81c40df2a..6269d2ba7 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-cm6.dtsi
> @@ -64,6 +64,7 @@ &pdma {
>  };
>  
>  &i2c2 {
> +	bootph-pre-ram;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c2_0_cfg>;
>  	status = "okay";
> @@ -71,6 +72,7 @@ &i2c2 {
>  	eeprom@50 {
>  		compatible = "atmel,24c02";
>  		reg = <0x50>;
> +		bootph-pre-ram;
>  		vcc-supply = <&buck3_1v8>;
>  		pagesize = <16>;
>  		read-only;
> @@ -93,6 +95,7 @@ serial-number {
>  };
>  
>  &i2c8 {
> +	bootph-pre-ram;
We could move this to dtsi file, since all board share
same design which use i2c8 for connecting to pmic, the
reward would be that we no longer need to carry this
property all over board dts file.. similar we could do
for "i2c2", but I noticed k1-orangepi-rv2/r2s have no
eeprom enabled..

>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c8_cfg>;
>  	status = "okay";
> @@ -100,6 +103,7 @@ &i2c8 {
>  	pmic@41 {
>  		compatible = "spacemit,p1";
>  		reg = <0x41>;
> +		bootph-pre-ram;
>  		interrupts = <64>;
>  		vin1-supply = <&reg_vcc_4v>;
>  		vin2-supply = <&reg_vcc_4v>;
> @@ -113,6 +117,7 @@ pmic@41 {
>  
>  		regulators {
>  			buck1 {
> +				bootph-pre-ram;
U-Boot also carry "regulator-name" for this node, we
probably could also merge it here, but could do it in
another patch if want to limit this patch to "pre-ram"
change only

>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1050000>;
>  				regulator-ramp-delay = <5000>;
> @@ -127,6 +132,7 @@ buck2 {
>  			};
>  
>  			buck3_1v8: buck3 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <1800000>;
>  				regulator-ramp-delay = <5000>;
> @@ -155,6 +161,7 @@ buck6 {
>  			};
>  
>  			aldo1: aldo1 {
> +				bootph-pre-ram;
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3400000>;
>  				regulator-boot-on;

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
