Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 936DCC98315
	for <linux-riscv@archiver.kernel.org>; Mon, 19 Jan 2026 03:03:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PhJTC3t8nrRQGmo5puH2npqGWT58qZC94iJyJBYi9Cc=; b=s4UnfnRHqfmokc
	msMTdJRQ5MugH86Bi5vKVpUrVhQWFCaUFveuj2Iu5uiWFnsYSBO4beoNoknTGyr2Gw/MZthUw6wFl
	G/TZk2F3n5cu8FsHWgFDU0stT80DnFvroYgKmao+vXz/eHal84QX3WKF0wCnlBG7XLjO11H0RbgDD
	eKJVdiuB2mi+/Fp/I5xYBDZ91U5jgZaM0VSugMIViaA8BTfGTmQ4+qo0Vrk172fpejCYhh+pyY6+i
	FJOzyAHaJqGxELlYEgoamZ7PUbXz9UepiK8ZwGbja1WSfXOEDN/0SuJwY2/yIjxxKpJkObSphmRU0
	OOBTY1eRW32BdxwpiaBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhfXg-00000001IWp-2jNO;
	Mon, 19 Jan 2026 03:03:00 +0000
Received: from woodpecker.gentoo.org ([140.211.166.183] helo=smtp.gentoo.org)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhfXe-00000001IW5-0gdW
	for linux-riscv@lists.infradead.org;
	Mon, 19 Jan 2026 03:02:59 +0000
Received: from localhost (unknown [116.232.27.242])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 7F6FD340E06;
	Mon, 19 Jan 2026 03:02:55 +0000 (UTC)
Date: Mon, 19 Jan 2026 11:02:51 +0800
From: Yixun Lan <dlan@gentoo.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	spacemit@lists.linux.dev
Subject: Re: [PATCH 2/2] riscv: dts: spacemit: add fixed regulators for
 OrangePi
Message-ID: <20260119030251-GYD47382@gentoo.org>
References: <20260116100001.208334-1-amadeus@jmu.edu.cn>
 <20260116100001.208334-2-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260116100001.208334-2-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260118_190258_236205_C8F55A67 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Chukun, 

On 18:00 Fri 16 Jan     , Chukun Pan wrote:
> Define the power input and the 4V / 3.3V power as fixed regulator
> supplies for the PMIC, PCIe and Wi-Fi.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi | 28 +++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> index b4808f258adf..c71c5bc1d341 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi.dtsi
> @@ -17,6 +17,34 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	pcie_vcc3v3: regulator-pcie-vcc3v3 {
can you follow the same name scheme with k1-bananapi-f3.dts?

also please add this regulator with explict consumer - pcie,
otherwise I see the patch isn't really useful

> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie_vcc3v3";
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +
> +	vcc_5v0: regulator-vcc-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_5v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	vcc4v0: regulator-vcc4v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc4v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
>  };
>  
>  &eth0 {
> -- 
> 2.25.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
