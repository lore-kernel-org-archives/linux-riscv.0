Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 030E0106ACFE
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 00:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SlxqdGkDRrUgrOgJxC7QeABZOsRGWdsHFMr4uv0X+4=; b=AXKTc+KETKOioU
	0jjPnRG+m/21gABLdRFSILVrPWZ5Xcox29eiQ5bftyaN/fltGhrgYWnMeIApxCFDvI6ORBzSVcwGu
	e/I5oAzw4xoHEU4P5TsG38OnH9W3vp5/M8UPkkKqqFL0ziRqV19x9MV14PXc4emFHLCvcnFeAkidL
	hkEYXboCkLqadIolhzaLZE2tU+74Jlxx7Z3TZMij1HG8pScUxwFjxwSAhoWWJX/nxe9MhQ7t9QBIN
	6NBjuAcpxNIKM1fVnimcibo8SOz526c1BlJn8gQrVRVYtAkXs+UXALKQi+MgW+3PaJ/wPScNFR3g1
	hQAaxZqh68nWSh7kJH8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0q2w-0000000FrHN-3NCZ;
	Fri, 13 Mar 2026 00:06:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0q2v-0000000FrGE-2Ewt
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 00:06:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5BACC61335;
	Fri, 13 Mar 2026 00:06:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B59ABC19424;
	Fri, 13 Mar 2026 00:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773360388;
	bh=ADruU6Qu0lyTOOBhcf4gScXwICP2AoS82nL0uCZVEiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OLiCTbuIcfSCLyQtk52o9rUKoG3xJXGHmOUwJGzEmgjajwdkwVlhH22xbMzFnxQ9z
	 xbECItjLHUzqR8lNGCrxgrZxVnGDoX/1whKg2+Cb9axF5pnMLuPJ5Fs54jyE4pImMD
	 KMBEhLtnuDWVDboXE0S1BjXcAF8WtThK39ASceE6ZEtBFIfss6wuCf7d+yoeGL9D/m
	 fJBkAiHiylPIfDyRpJ2NUxTyJPzYnBGBMDyq9nCZ/fk2mN1PovkYCuoJVEyl0H2imz
	 lGO1NbmkuVhQubvKM1wg4iR7MAtdHfd4SBKCn6pj2C1tv4L5t3ZJTy2OMb7iTDw6/W
	 9tG/xaAuAECjQ==
Date: Fri, 13 Mar 2026 08:06:25 +0800
From: Yixun Lan <dlan@kernel.org>
To: Han Gao <gaohan@iscas.ac.cn>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v2 2/4] riscv: dts: spacemit: Define fixed regulators for
 OrangePi RV2
Message-ID: <20260313000625-GKI302167@kernel.org>
References: <20260310161853.3900605-1-gaohan@iscas.ac.cn>
 <20260310161853.3900605-3-gaohan@iscas.ac.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260310161853.3900605-3-gaohan@iscas.ac.cn>
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

Hi Han,

On 00:18 Wed 11 Mar     , Han Gao wrote:
> Define the DC power input and the 4v power as fixed regulator supplies.
> 
> Signed-off-by: Han Gao <gaohan@iscas.ac.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 93880ba7bdfe..55b3d8d7f7f1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -23,6 +23,25 @@ chosen {
>  		stdout-path = "serial0";
>  	};
>  
> +	reg_dc_in: regulator-dc-in-12v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "dc_in_12v";
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +	};
As Trevor pointed out in another thread[1], rv2 use 5v type-c in,
and I bet this is a copy-and-paste error..

And for name I'd suggest to simply use: regulator-vcc-in-5v

Link: https://lore.kernel.org/r/20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com [1]

> +
> +	reg_vcc_4v: regulator-vcc-4v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_4v";
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		vin-supply = <&reg_dc_in>;
> +	};
> +
>  	leds {
>  		compatible = "gpio-leds";
>  
> -- 
> 2.47.3
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
