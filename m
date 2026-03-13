Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0D2106FD62
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 00:30:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=n60g1okgcBRbTyFvlKcNhhqhRC/AHqW9gXL/5rznhXg=; b=wIlHiSPWOuBPtO
	4MILXJOuZ5+uEADIhEG8mg2FIXtsvbfIztVETDR1doqKsWeVjBgdHrmn1942UVx96stLSwG9Aflv1
	Te1ZM2QPPehGEGessiqdBM3D+Z1qjpPPf+0osujj4qgx+jVFtA1ith0/7hFfKbX9hgAwGmwUO3eC2
	BHJspktrpQzvOKTf+3honVgb0xTCivJ+pC93qZ1cr7NoFIKLxfSs04TXwD+K1CnvBcXkmxVvORo3g
	m2o8A8jqvf5cgtexuyMuPrPfgzG2B6GzJs4HdkH/tBcl7gLOwMA0tBxgD1hjZm5KLUeeGayEn0D7j
	2hEv5BStSiIW3aGgM9zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qQO-0000000FvtJ-3y8M;
	Fri, 13 Mar 2026 00:30:44 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0qQO-0000000Fvt3-0pvD
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 00:30:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C79B61335;
	Fri, 13 Mar 2026 00:30:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 869AFC19424;
	Fri, 13 Mar 2026 00:30:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773361842;
	bh=yufSPKe+3LIlfMb2dw1jvZN41wg6MKFMPyYCOzToFtw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKgBE4nEadicyq9IVOKkobZgY4RSEMNfkKt88A9EjtxBOG+K2zZ5IbpwNVo6dXDTJ
	 cOtQIxWCEkrK3MWFxcZAfaqg6riJQLmri9Ytl/OvOCtS78WrfsyPAg4BS1bHtyOAHU
	 5qWH1rC3ni5MPniGi5thcPqIbcU8aTog1DR8GZ1AQ9m4nGsqugUkLduneH0Z+SxG0k
	 W8cPoB6LFnBtfjCiNm/cNflA2Jfh8AapdeHRH5vqE2IN/RcNLoh8vHSwcSEwM+DxLp
	 9mXggc9sIeB834d1gDduhK/EcSCbjmKxSLAQ8v/OOeL0Rr8P3T3LMc61NzLGMRp/gR
	 IUTlvjlt/Dc4w==
Date: Fri, 13 Mar 2026 08:30:40 +0800
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
Message-ID: <20260313003040-GKK302167@kernel.org>
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

I'd suggest to squash this one with patch 3 which it isn't necessary to
split the series into too fine pieces..

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

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
