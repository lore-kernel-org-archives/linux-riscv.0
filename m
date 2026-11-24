Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70402606A322
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Nov 2026 12:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jmSZLBb6;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Nut/R6kb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=IKSJFPS4dJ5G+Je+mqXclApm3nauyaoRcO/YFfw5CJI=; b=jmSZLBb6i1N+0AiMTQ4DPYctJL
	mULvaJsh+N1IcTP0vQuN3PJnd7NRJuh5jM0k0ozs8dSdKIm4jyvRaujI/iOuKCEzfPJj1+ZZxaQue
	ZpyDkHZMhYQvkuo+8hb85upnNQsY4LDkudiAj+SBLottMO0c2v+GtIfpzK4TrcBFTmMuMKklvxS8C
	mIs+cIDOredne8JywAvseMNrYRyfDzKufPtHdc9ei9c5t/YBCu3pVDM3mtIX0dBwup5W/fnnmD/WI
	NFQNCkflmcobQHpQaVTi5DCKhlgzVd1JrF+QW1S3FBurn5Q907ohUoH+d6qNgilSSLrRl9hIzg30X
	jR3ebUHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpTh-00000006V1r-0ZtR;
	Tue, 24 Nov 2026 12:18:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xVpTg-00000006V1T-0gI0
	for linux-riscv@lists.infradead.org;
	Tue, 24 Nov 2026 12:18:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7AE9642E19;
	Tue, 24 Nov 2026 12:18:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7A0D01F000C4;
	Tue, 24 Nov 2026 12:18:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795522707;
	bh=9DJ6K8UlN2WFYWzRF3rnpLOfRL53TWJIyKZUaCCPjo8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Nut/R6kb4s+vaddUvD5f2DQzubzUDpMkWRsKtji7g+7nZ0SwtmxuNZtu7KK5qTmGI
	 xKnbmer6NDKDoA93/o/+hfpMveoJjLLtn7aIxQEKRIBYIpv9AnCTKjAotP2Ps1iAlH
	 JiZQZwOy9T6fiYQjUZF5CCnAfQnE5N8YOsMYVFgMjS1sLMqSUg/ykruN4ahNoIrI9F
	 84U1rhZnEyud7WtgGo3SVuvdwf4Cl6b5Zm6xI1reFsKzOKZpKi4WIznAetF3tAz5gw
	 4Fk3/62T+l7m+VTx5Ps0Tbk/CuPOs6jVPVEje5UmKUWxxpEPKprp/NA4TFeoJ/bnq5
	 YdK35nA/68hEA==
Date: Tue, 24 Nov 2026 12:18:23 +0000
From: Yixun Lan <dlan@kernel.org>
To: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] riscv: dts: spacemit: k3-com260: Move SD card to the
 module
Message-ID: <20261124121823-GKL100890@kernel.org>
References: <20261105-k3-com260-module-sd-nor-mac-v1-0-138b39d74602@linux.spacemit.com>
 <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20261105-k3-com260-module-sd-nor-mac-v1-2-138b39d74602@linux.spacemit.com>
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Troy,

On 08:23 Thu 05 Nov     , Troy Mitchell wrote:
> The SD card slot, its power supply and the signal-voltage switching
> circuitry reside on the K3 CoM260 module. Describing the slot only in
> the IFX carrier board leaves other CoM260 carriers without this shared
> hardware description.
> 
> Move the SD controller configuration into the module include without
> changing its properties, so every carrier using the module inherits it.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
>  arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts | 17 -----------------
>  arch/riscv/boot/dts/spacemit/k3-com260.dtsi    | 17 +++++++++++++++++
>  2 files changed, 17 insertions(+), 17 deletions(-)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> index 6e295bc6f196..38809d01df82 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260-ifx.dts
> @@ -111,20 +111,3 @@ hub_3_0: hub@2 {
>  &usb3b_u2phy {
>  	status = "okay";
>  };
> -
> -&sdhci0 {
> -	pinctrl-names = "default","uhs";
> -	pinctrl-0 = <&mmc1_cfg>;
> -	pinctrl-1 = <&mmc1_uhs_cfg>;
> -	bus-width = <4>;
> -	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> -	no-mmc;
> -	no-sdio;
> -	disable-wp;
> -	cap-sd-highspeed;
> -	vqmmc-supply = <&aldo1>;
> -	sd-uhs-sdr25;
> -	sd-uhs-sdr50;
> -	sd-uhs-sdr104;
> -	status = "okay";
> -};
> diff --git a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> index 054bfff7413a..f2df797a2c80 100644
> --- a/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k3-com260.dtsi
> @@ -233,6 +233,23 @@ phy1: ethernet-phy@1 {
>  	};
>  };
>  
> +&sdhci0 {
> +	pinctrl-names = "default","uhs";
> +	pinctrl-0 = <&mmc1_cfg>;
> +	pinctrl-1 = <&mmc1_uhs_cfg>;
> +	bus-width = <4>;
> +	cd-gpios = <&gpio K3_GPIO(4) GPIO_ACTIVE_HIGH>;
> +	no-mmc;
> +	no-sdio;
> +	disable-wp;
> +	cap-sd-highspeed;
> +	vqmmc-supply = <&aldo1>;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	status = "okay";
> +};
> +
>  &uart0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&uart0_0_cfg>;
> 
> -- 
> 2.56.0
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
