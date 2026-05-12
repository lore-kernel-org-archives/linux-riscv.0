Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D4BCCD4F21
	for <linux-riscv@archiver.kernel.org>; Tue, 12 May 2026 11:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zjH3MGjueR2nUUX48HmCV24yKhDLhRur3W1ClKqifWE=; b=NAKLeSbv6iBN0G
	I69nHLJPzsgC0LGSszOBZoawe8L4MZu+5USCSGp+5zzPOw2mYUHHE+LjzvLdvS0xyUjjHA7eS4wfj
	fVONGuBThRfMkf0II4mzKNCX8W6PnmXCh3bf+RBODEueh6Vo4tawhZO1utib6eU4uzO7kWEnEFy/E
	6Wv7OPuMdUfALjps+dagGneM/NNcF4a5ZhIa3bPr7Mf4b7f/vnoxje0kIwRn1aDYL7NpKrK93yQtZ
	xDhTAk5ZE5AIEWxEf3EUHFKzEBaVvnuohzGT7OLjJsmf2kzco/ILmZHai44FyfPz4mQvwkfM+f89v
	p6wj6S9vh7mTWPvt4+NQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlXT-0000000GbDu-1ntF;
	Tue, 12 May 2026 11:44:39 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMlXS-0000000GbDk-206k
	for linux-riscv@lists.infradead.org;
	Tue, 12 May 2026 11:44:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id A3FA06001A;
	Tue, 12 May 2026 11:44:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04DFDC2BCB0;
	Tue, 12 May 2026 11:44:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778586277;
	bh=jJ9Y3G6YF8uK918acH5+bW7b74nfHZoPK01spE4GgWs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=N0kGPMUgQx6aegtAMTz00t7GSD8CaGdz/CHReN52DEJB4JlzI7zEsHqi0S0qXWjHH
	 rMJpj1bZ6adAn7QsDevyLm5jFvwvs0c/ib0lZ/PQ3RD1tbDLQ537dD4Y82NvyWMcOJ
	 zRloE2hHHvlak1cR5JfixyowSjNKK+j87CD3470jJsvZxdgtzPVJWTBfps5wK4YlgF
	 +yp8YgtQJHuMFTE3Fk33mQLVaDAxioOC/eoEsmdB2/JL/yl46abFAb7YiVMFOybgRy
	 1EXsTtGaUHsM+ZQ3qb/FClXEVVHZTxi9rD93qXibql4fH4OfuOg9QWa5QeKC/vnexE
	 Kg0+kKP5MjoFg==
Date: Tue, 12 May 2026 11:44:34 +0000
From: Yixun Lan <dlan@kernel.org>
To: Andre Heider <a.heider@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/6] riscv: dts: spacemit: k1-musepi-pro: enable QSPI
 and add SPI NOR
Message-ID: <20260512114434-GKI3624147@kernel.org>
References: <20260511111116.1109643-1-a.heider@gmail.com>
 <20260511111116.1109643-4-a.heider@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260511111116.1109643-4-a.heider@gmail.com>
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

Hi Andre,

On 13:11 Mon 11 May     , Andre Heider wrote:
> Add the QSPI controller node and describe the attached SPI NOR flash
> (Winbond W25Q64FWSSAQ).
> 
> Add a corresponding vendor flash partition layout.
> 
> Signed-off-by: Andre Heider <a.heider@gmail.com>
> ---
>  .../riscv/boot/dts/spacemit/k1-musepi-pro.dts | 43 ++++++++++++++++++-
>  1 file changed, 42 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> index 79415d760f162..7ebace0e46edb 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
> @@ -166,7 +166,7 @@ buck3_1v8: buck3 {
>  				regulator-always-on;
>  			};
>  
> -			buck4 {
> +			buck4_3v3: buck4 {
I'd prefer you make it right once in the first patch [1/6] which introduced this
regulator.. please fix all similar issues in this series..

>  				regulator-min-microvolt = <500000>;
>  				regulator-max-microvolt = <3300000>;
>  				regulator-ramp-delay = <5000>;
> @@ -249,6 +249,47 @@ dldo7 {
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
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	pinctrl-names = "default";
> -- 
> 2.53.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
