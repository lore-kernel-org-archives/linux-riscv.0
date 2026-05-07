Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00989CD3436
	for <linux-riscv@archiver.kernel.org>; Thu,  7 May 2026 02:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=uchh/dBTgILcavtS4liC/3MV/8RZVI3WAL+wP4TI3H8=; b=Sj/bwJKOaaEVa7
	rDCj9NFthvLRFjnMpPN8qG4LDvQRKGyoptkyv6vc5MeTjyD7TofPxOj88XfQZhI1F/1okgXTEtzLL
	QbHxvrhc6Blhb2kRgwfP4zkgp6hQzEozAXvw3yK3xvRMLa7sZDhyTf4UYpcbyFxTaWHS4mPtq+uWs
	GIxupniptYUI9fso8kU9sEIFbDPqmvl90S3K1CAYmBEdIJk+QKkaH36Xts18L1WC8SKNL07U+Qvej
	K/uGXHyAFH/bI+M0PyVG+RO9XhkzBXqkYlgk7ZcPSrh7a+0CPgLfMPa1VS8atmTOLm2spOUWHwIbJ
	bNDyc6g2o4M7qxwNgE6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKojy-00000002Z0s-2Csb;
	Thu, 07 May 2026 02:45:30 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKojw-00000002Z0a-46y8
	for linux-riscv@lists.infradead.org;
	Thu, 07 May 2026 02:45:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BB8EB6015B;
	Thu,  7 May 2026 02:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E609CC2BCB0;
	Thu,  7 May 2026 02:45:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778121927;
	bh=GVDgyNBjLVJtO0PjEWdPQZ+br1pnpWOGwCkKrGbMVKY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qpj1qYcrB2K6aLv1IaeZuNOwPCUdI+3QGKr40V78B/F3Nl90L20lL3c3Aa6ViiCxm
	 zpSZl9i4y5RsNk2dnVmrzlb0+2o2rQgyr58CEYhwizs5YUL15KfkQCEUyGVScjLrdy
	 naDPsrm67kPdWXE0BrEvbefGTDoQaQdhD1tnMBHk4XRV4unHxDD3ALSbb7G+VT4wtd
	 WkNwusG5+NN+trr0hYEH1g9URbJb1iGbc4E21AbRrBF4Eu2oUEXpKhPszLF8tT3ilz
	 oUhcjLj9pzn9fP3aGM30K5QG8RwC7iLAtbYPKr8/hxv6BO6aaBSEnLofKASeIRpy+3
	 TO36e5KAClafw==
Date: Thu, 7 May 2026 02:45:24 +0000
From: Yixun Lan <dlan@kernel.org>
To: Anand Moon <linux.amoon@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:RISC-V SPACEMIT SoC Support" <linux-riscv@lists.infradead.org>,
	"open list:RISC-V SPACEMIT SoC Support" <spacemit@lists.linux.dev>,
	open list <linux-kernel@vger.kernel.org>,
	Han Gao <gaohan@iscas.ac.cn>, Ze Huang <huang.ze@linux.dev>,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: Re: [PATCH v2 1/4] riscv: dts: spacemit: k1-bananapi-f3: Add
 vcc5v0_sys regulator for Banana Pi F3
Message-ID: <20260507024524-GKA3579608@kernel.org>
References: <20260502051906.8160-1-linux.amoon@gmail.com>
 <20260502051906.8160-2-linux.amoon@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260502051906.8160-2-linux.amoon@gmail.com>
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

Hi Anand,

On 10:48 Sat 02 May     , Anand Moon wrote:
> Define the system 5V fixed regulator (vcc5v0_sys) supplied by the
> DC input. As per the schematics, vcc5v0_sys is the input power source
> for the VCC5V0_HUB and 5V_VBUS reglators. Update these regulators
> to correctly reference vcc5v0_sys as their parent (vin-supply).
> 
> Cc: Han Gao <gaohan@iscas.ac.cn>
> Cc: Ze Huang <huang.ze@linux.dev>
> Cc: Chukun Pan <amadeus@jmu.edu.cn>
> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
> ---
>  arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> index 5790d927b93d..9727ecdd9f6b 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
> @@ -50,6 +50,16 @@ reg_dc_in: regulator-dc-in-12v {
>  		regulator-always-on;
>  	};
>  
> +	reg_vcc5v0_sys: regulator-vcc5v0-sys {
This will fall into the catogery of "non-controllable & serve no devices"
see similar comment for 'reg_dc_in' which raised by Krzysztof

https://lore.kernel.org/all/6530526f-59ca-4753-a068-46c62a1a1fed@kernel.org/

or should I ask, what's the real problem if regulator has no vin-supply?
Any probe failure or something bad happen? (besides /sys/../regulator_summay)

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>  	reg_vcc_4v: regulator-vcc-4v {
>  		compatible = "regulator-fixed";
>  		regulator-name = "vcc_4v";
> @@ -66,6 +76,7 @@ regulator-usb3-vbus-5v {
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
>  		regulator-always-on;
> +		vin-supply = <&reg_vcc5v0_sys>;
>  		gpio = <&gpio K1_GPIO(97) GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> @@ -75,6 +86,7 @@ usb3_hub_5v: regulator-usb3-hub-5v {
>  		regulator-name = "USB30_HUB";
>  		regulator-min-microvolt = <5000000>;
>  		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&reg_vcc5v0_sys>;
>  		gpio = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
>  		enable-active-high;
>  	};
> -- 
> 2.50.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
