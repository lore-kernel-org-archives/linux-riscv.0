Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17AF4D39418
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Apr 2026 12:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MiDVNVWAf/lqj6tuN7IN2N1K65A/LyBuibIxfvXHvxU=; b=Xq/wBj8XVaP1oh
	eKsVlrT/v8lQA8ep/VndapsfWux060ES1wrW83n1i9oMzTBGndCaiXP8TcRRziatQdjc0p+G49DLF
	r0uy0tkmt0QRdc7yqTjaXiONR1oQharzb7usUniMeedzFxwz+fLjK7imDd4o8TjUhY6ON5hR5T0Iv
	9RFVpOriFfxbZbVrJ4BVz6kFNXfAkvZqZZ1JyoCe9rjph1YDHMnBPwJYQCrDxa4jE1s1biQeQudl2
	j7JghEx6xDBB9XSJGtEBrS2R+/bvUTC45sY7apMwmKZ7Vv1qDH2l6k2kEZcV/rzw1kDsz2zeG0+z+
	iawivGz9Pxz6qk1RAU4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8H2Z-0000000HZrs-1sfU;
	Thu, 02 Apr 2026 12:20:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8H2X-0000000HZrN-1O17
	for linux-riscv@lists.infradead.org;
	Thu, 02 Apr 2026 12:20:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DEBA440A5B;
	Thu,  2 Apr 2026 12:20:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68727C19423;
	Thu,  2 Apr 2026 12:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775132448;
	bh=Oh1AVW120dvv/mRAOesK1dOxVK8tD3RCPIJ1/D57Za8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WhxzViMSwXjtwwYYhrFmM8kZBO6+E5idYMSjGyOsI+tRS02KxxifluBX5pPFG/CfO
	 b6ZVRTWUD2Gm44BnkqbzDUa0r7wPWDqRxoTteAxacIn0uIJ6VQbvs+iqNqsAGPypxa
	 5e6HPOjz/876/q/j0xgmIh/iFzVlS2SBoB1Kzvsb9dLmT9JvVOVWcQyOUVZMydj16x
	 wA56KI941t/SHEc3+iSlC5ki32xrNHtXexIVuevW1XHOV7ou57Eg4i4pbrZy87FRe4
	 WlPwyZ4QV8VlGBhmMPTl0uY7yqZfzoNriPTkn1XePuNqZC1RBJZixw9OXZTwoAHiET
	 Ez3LXl4s2qrYg==
Date: Thu, 2 Apr 2026 20:20:45 +0800
From: Yixun Lan <dlan@kernel.org>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Rob Herring <robh@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor+dt@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, spacemit@lists.linux.dev
Subject: Re: [PATCH v2 3/3] riscv: dts: spacemit: enable USB3 on OrangePi RV2
Message-ID: <20260402122045-GKA1016296@kernel.org>
References: <20260402100007.110201-1-amadeus@jmu.edu.cn>
 <20260402100007.110201-4-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260402100007.110201-4-amadeus@jmu.edu.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_052049_567879_2F336A3D 
X-CRM114-Status: GOOD (  14.86  )
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

On 18:00 Thu 02 Apr     , Chukun Pan wrote:
> Enable the DWC3 USB3.0 controller and its associated PHY on
> the OrangePi RV2. The onboard GENESYS GL3523 Hub provides 3
> USB3 Type-A ports. Enable the corresponding VBUS regulator.

Can you work with Han for adding USB support[1]? this will simply
distribute our effort, and make the review process even harder

https://lore.kernel.org/all/0ec229e2fb138092672773f134d0739e70740ce0.1774974017.git.gaohan@iscas.ac.cn/ [1]
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  .../boot/dts/spacemit/k1-orangepi-rv2.dts     | 24 +++++++++++++++++++
>  1 file changed, 24 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> index 929b70d384b5..ab835c30dd86 100644
> --- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> +++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
> @@ -52,6 +52,20 @@ vcc4v0: regulator-vcc4v0 {
>  		regulator-max-microvolt = <4000000>;
>  		vin-supply = <&vcc_5v0>;
>  	};
> +
> +	vcc5v0_usb30: regulator-vcc5v0-usb30 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_usb30";
> +		enable-active-high;
> +		gpios = <&gpio K1_GPIO(123) GPIO_ACTIVE_HIGH>;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_5v0>;
> +	};
> +};
> +
> +&combo_phy {
> +	status = "okay";
>  };
>  
>  &eth0 {
> @@ -111,3 +125,13 @@ &uart0 {
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
> +	vbus-supply = <&vcc5v0_usb30>;
IMO, the vbus doesn't directly tie to dwc3 host, but to HUB's port
so I think this is still wrong, although it may work on the board..

> +	status = "okay";
> +};
> -- 
> 2.34.1
> 
> 

-- 
Yixun Lan (dlan)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
