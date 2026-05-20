Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBDDCD4F54
	for <linux-riscv@archiver.kernel.org>; Wed, 20 May 2026 08:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zi71oQeyDprFzZPyE+1lTAz0S9ShzoRuuP3/QiufLJE=; b=kuQEwCILXbAqtG
	VZdSvxyQcorDZeW90+0Pma6J6+S/s10vGZZ3xhR5H4rf73IWYbJUYFyUiiplolpv5RnKIiI9laIdp
	CShPfqhTK042r9YeVZcYu5jCsOXo3eC+LXtk5QszVYLSGKBFbnH3he5OqgFHeos+xBvseh4r0MjUA
	FMFB1Un2kAKlFIlhZBG8FlM5kfZJjAB5jNphmMG/6JEAmsGwUq5gsjiromhG0/HTtqqnjD+c9/U5o
	Sy6a4RIGRAj2G/PHl3mpHD7a3KEXZ5ugntxwvvYxDyI8D7msxOvDHtZozWUHfqUqp1F3CN6UOWQhO
	LPZ6TklLN/xgGqgAQbxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc2B-00000003uIS-43Hb;
	Wed, 20 May 2026 08:12:07 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPc29-00000003uHR-2oT3
	for linux-riscv@lists.infradead.org;
	Wed, 20 May 2026 08:12:07 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4CB6742088;
	Wed, 20 May 2026 08:12:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B77591F000E9;
	Wed, 20 May 2026 08:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779264725;
	bh=p5jXKIXsDEpFifcmEEE6Bq+aFMDhGYXdAe/Ul0Di0wA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W3pFs3B+ttoH87zVNnXdVdSwOdN5ztY024RDDllGWHv/9eLtBDOHGrtiLSuk7P/f5
	 pgHNfUSzeBsVt2sm3VuUFEw6cjUlrVe1Ud5oT17GMK28B1KWv2y8Ph97lTXBj2aKDz
	 eOyn8Ig7PvmcL+zG87pEz1hIXLz3PuVhr36eUpmcAaLiN6p1vbuJrX4OY+hWOZPv2h
	 La8vO8xBbOn7YRBBfbUgRdy8MhIFWmt7Xz2vGivr5vP/d0mTIywdM9gxt91TasO24g
	 sm/7CLPSVoZ7BTVllwe86EYj391OAIjBRNOmPHA/4n6GpR5BWxTv2ZgWTLO1c3AB75
	 tAfaw9skiERHg==
Date: Wed, 20 May 2026 08:12:03 +0000
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 1/1] riscv: dts: spacemit: enable USB3 on OrangePi R2S
Message-ID: <20260520081203-GKB3708537@kernel.org>
References: <20260518100030.2354606-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260518100030.2354606-1-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260520_011205_727831_3E204D02 
X-CRM114-Status: GOOD (  13.94  )
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

On 18:00 Mon 18 May     , Chukun Pan wrote:
> Enable the DWC3 USB3.0 controller and its associated PHY on the
> OrangePi R2S. The USB regulator provides VBUS for USB2 and USB3
> ports, but the USB2 ports are handled by a separate controller.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

Reviewed-by: Yixun Lan <dlan@kernel.org>

> ---
> v2: Remove vin-supply for the vcc5v0_usb regulator.
> ---
>  .../boot/dts/spacemit/k1-orangepi-r2s.dts     | 23 +++++++++++++++++++
>  1 file changed, 23 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> index de75f6aac740..1ecc40749e5a 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-r2s.dts
> @@ -21,6 +21,19 @@ aliases {
>  	chosen {
>  		stdout-path = "serial0";
>  	};
> +
> +	vcc5v0_usb: regulator-vcc5v0-usb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(126) GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc5v0_usb";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +};
> +
> +&combo_phy {
> +	status = "okay";
>  };
>  
>  &emmc {
> @@ -90,3 +103,13 @@ &uart0 {
>  	pinctrl-0 = <&uart0_2_cfg>;
>  	status = "okay";
>  };
> +
> +&usbphy2 {
> +	status = "okay";
> +};
> +
> +&usb_dwc3 {
> +	dr_mode = "host";
> +	vbus-supply = <&vcc5v0_usb>;
> +	status = "okay";
> +};
> -- 
> 2.34.1
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
