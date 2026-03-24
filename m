Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6933F532F5
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Mar 2026 09:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VHoogJoq0s+uXjO9HPsdCjx7/pHysqMgIpaIBAhTrxs=; b=ikmDXGXyGcTYZE
	xVq6JzyZdDCb8x+kpCq2UMpNosjdQZJQlZ8bHcLEue0N/J6QJG6HDasrsvPQBosEpyj4xVWOxizxW
	DzqOUhU1J7mTBCrdWZRB74ZTTPx9OD0O414SZBgLIuD3agRQSaEk1nojpOdqmUh5mhChBSyKFvRBT
	y7LyR0YSr1JgfkQAO+EjdLb+pSwKOOeLkuT/Wqk9FByJZhbNl8NNfJHmFlglVPKqo9+jrwGesyzaB
	yTpHKN9+mrtheSM0P5vJOcUOsGDA4mRSATmwX3uuhppFGOzWSTnIXbZBVe3xNo2OuUh31q2H8GLmo
	+zz8oWqAYnvoS5HUKTOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xed-000000012Qj-1KCz;
	Tue, 24 Mar 2026 09:02:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xeb-000000012Qc-3vsX
	for linux-riscv@lists.infradead.org;
	Tue, 24 Mar 2026 09:02:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E5EA9600AC;
	Tue, 24 Mar 2026 09:02:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5EFC2BC9E;
	Tue, 24 Mar 2026 09:02:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774342944;
	bh=gfQBMPeoX7S6iuyUT/yJJOwsqJIPItQmTlz9liVZE/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nkmhxkT/AUfREdS7sbFT32yhFqr8AFFHJiPDTHp1nZBM4Sx/rdHPk1xbfJbUJ7BQz
	 Ng0C+2y6SyZc/a3/lX67/gM746c0qDqGeyJldtmowAda7W8UKb0YDIyNMqDF8LLOZ4
	 8Fss1p0RNHn3+yHAUZo64y0x8AOLAliPMf9TMOmZx1NuCYET5VcCyXnwiOz1vRFGHK
	 l0m3AzY0hzzgeDeGZ2L76D12ZUkdgxbC+vmumK3OdR39z3NZd1/GihSLAnricOf9Ja
	 jWv9T2YjXuYYUhWBqfNgBe+b794PTFDXS1vZQ9ulD9Uv1XYWnCe958IszTpCJcPnrC
	 9IZXtS1nXXhDA==
Date: Tue, 24 Mar 2026 17:02:20 +0800
From: Yixun Lan <dlan@kernel.org>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V ARCHITECTURE" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>
Subject: Re: [PATCH 4/6] riscv: dts: spacemit: enable QSPI and add SPI NOR on
 Milk-V Jupiter
Message-ID: <20260324090220-GKA739629@kernel.org>
References: <20260322203356.2206927-1-aurelien@aurel32.net>
 <20260322203356.2206927-5-aurelien@aurel32.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260322203356.2206927-5-aurelien@aurel32.net>
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

Hi Aurelien,

On 21:28 Sun 22 Mar     , Aurelien Jarno wrote:
> Add the QSPI controller node for the Milk-V Jupiter board and describe
> the attached SPI NOR flash (GD25Q64E).
> 
> The flash supports a frequency up to 133MHz (80 MHz for reads), and the
> SoC supports a frequency up to 104 MHz. However tests have shown that
> the flash is not reliably detected above 26.5 MHz, consistent with
> frequency used in the vendor kernel. Therefore, use this frequency.
> 
..
> The m25p,fast-read properties is taken from the vendor kernel.
> 
So long as this is verified and works fine on board?

> Add a corresponding flash partition layout, matching the layout and the
> names used in the vendor U-Boot.
> 
..
> Also add the bootph-pre-ram property to make the device tree usable by
> early firmware/bootloaders without modification, as U-Boot is stored on
> this NOR flash.
Is the dtb file actually used by U-Boot? I'd highly doubt about this,
if not the case or has not been tested, I'd suggest then not to add
this property..

> 
> Signed-off-by: Aurelien Jarno <aurelien@aurel32.net>
> ---
>  .../boot/dts/spacemit/k1-milkv-jupiter.dts    | 44 ++++++++++++++++++-
>  1 file changed, 43 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> index 836311c3f035c..05ab5df50be51 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts
> @@ -173,7 +173,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
>  
> -			buck4 {
> +			buck4_3v3: buck4 {
>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-ramp-delay = <5000>;
> @@ -256,6 +256,48 @@ dldo7 {
>  	};
>  };
>  
> +&qspi {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&qspi_cfg>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <26500000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <4>;
> +		vcc-supply = <&buck4_3v3>; /* QSPI_VCC1833 */
> +		m25p,fast-read;
> +		bootph-pre-ram;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			bootinfo@0 {
> +				reg = <0x0 0x10000>;
> +			};
> +			private@10000 {
> +				reg = <0x10000 0x10000>;
> +			};
> +			fsbl@20000 {
> +				reg = <0x20000 0x40000>;
> +			};
> +			env@60000 {
> +				reg = <0x60000 0x10000>;
> +			};
> +			opensbi@70000 {
> +				reg = <0x70000 0x30000>;
> +			};
> +			uboot@a00000 {
> +				reg = <0xa0000 0x760000>;
> +			};
> +		};
> +	};
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_2_cfg>;
> -- 
> 2.51.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
