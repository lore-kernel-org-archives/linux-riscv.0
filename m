Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2276CD1356D
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 16:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=DdCGgUpaDiz0aIVwkzIooWQ5T5ETIpnZhQ3r8JLM4wY=; b=uh468RZfsWmyd0YVTRvLKjtaN/
	rZp1OQgfnKsHKnDsxdSftQ+gCN3F67xgl99bTd0aIttl3X3035UpU35MDeNhHvhUHxgtUjbYTzLxo
	21NUpQ/j4Qwfzy6F7HOLNr4TnWfXM1sYLbQULCKv/CVXuUhRiSd1Tr2gjRhhNe64DJeZzFLL7LW0T
	jlVRms1/B4VNZ7uHnoaVFhsVS43BEjWRbe5XEq0oR9SycW8Ozqx3+ozpteImiW2TfdpPy6s880p1N
	Z1PsVQTqxGZhPNt9hzzPyrGxti3R+SsrQIFEHW7sxiK/OhlRIt/qiftoa/WmjE2NlyEk92xxF9skb
	3vsHwL2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t56F6-00000008Xr9-08ZX;
	Sun, 27 Oct 2024 16:35:52 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t56F1-00000008XqY-3SUE
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 16:35:50 +0000
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com [209.85.161.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 7C5EC3F2AF
	for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 16:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730046943;
	bh=AS3d1idyi67yhm3sH0WkCViihKLdaz8goaiNUlUugUw=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=tjJ+D6ZHJ1egn9pKOX//QiNsiKnEjbm5wXa7mmv8QnQwSVMR/PYQEE5j5TlfUvALn
	 KMRKNYmV4w8btmAKuMZXxVPqeoDrFEd/zyy6cZ9zq8L1scc2VPjPxYsTvzg6YxRMdp
	 iUaHMVL8BuTykYOS4HNY9G3HJ0ShJkRQsx8u04BnUoPED7jXRGZwm385q6d27m7ali
	 WMcq7fOOvXr7GcVwL3eQO4x2CeM6vkV0IxR2+mFAXly6jpWQ2nj8h7Zy5lhk1qbq9P
	 qF3EO2S61Eoa2vm6uFebGqyaC1fCiXKkAdLXSDW1CzNp2L3BkfMoEOG8tK63kSVlrX
	 STJ2kwVTq4z5A==
Received: by mail-oo1-f72.google.com with SMTP id 006d021491bc7-5eb832f845bso2936697eaf.3
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 09:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730046942; x=1730651742;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AS3d1idyi67yhm3sH0WkCViihKLdaz8goaiNUlUugUw=;
        b=a9f5sfARt6fg3VHM0VeLFGzTnUQXkmjC1GRBY/r1WW7ldM60BbzDJvfXMs25wdY0iE
         QqT6TaBu11fU6DOUigfpsxRLiu/jLX87FRcneLCGZgMIw7cc1KED8LE2eOppU4ezIidw
         3qoTjDKWbjJ46YM9FXBuIXhdR4vY2UbMdSxWLQRcY0P+LIl/rqH8kJu7CjnF1ZR7bE5F
         WyVfkGNz/Tmv+bfRMTb49FCvDC/sb44CMuYu6aNjioOgIa45m7ZJtYbucZeqVzQ6sPJT
         /16CdXDIqHZDW8+l+XPFQQCIxvGjiye72QKJfN7ctrU53v8vh/cPqxlVv+NCfq0hvBEJ
         DlYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVi7uvv/zfciasv5VkTRNW00XdkcEj6QQYq3m3qvUymsBeZ/KmZapWBwMSgtS9vuSVbxMaSMTUXgqqzqw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwliAtmwXjKEY74m/AMlDPbUdPPHFrpbFAcU3rCed17vgyeSXBM
	5YyBkIMt+UKzDCiESeuYWFRKxugR0LTtQF/FuNCzPt857dkW6kf8FfsDket5nhM3u9CflvDzrV5
	vSEtPH8zjvqI4vZopfoSrYx4a0Fj/UcnVOOapQXUX7zw2ya06uKrX/whcLBlOsiiWSvJEqJANJ/
	Yud9oRaKQO18OwscZGBtwSZDzhEsXCO7wCe3HHryPLJOtypGkid0txXpsJ
X-Received: by 2002:a05:6870:d146:b0:25e:1610:9705 with SMTP id 586e51a60fabf-29051b02dbbmr3856652fac.2.1730046942123;
        Sun, 27 Oct 2024 09:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGUm8dRcl5FUlikyMPXfT5+z8OZ8NQmE4kXNKT5ygN0pDp+fWfRSCfmaW6cV2Gqzx+DXyDyNOUUgC8HIji1dHw=
X-Received: by 2002:a05:6870:d146:b0:25e:1610:9705 with SMTP id
 586e51a60fabf-29051b02dbbmr3856618fac.2.1730046941756; Sun, 27 Oct 2024
 09:35:41 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 27 Oct 2024 09:35:41 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241027144448.1813611-2-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com> <20241027144448.1813611-2-guodong@riscstar.com>
Mime-Version: 1.0
Date: Sun, 27 Oct 2024 09:35:41 -0700
Message-ID: <CAJM55Z-xxbUY9nyjt8TsqzknY4NNUiqJEi1XeLK-ytFpjDVvOg@mail.gmail.com>
Subject: Re: [PATCH v6 1/5] riscv: dts: starfive: jh7110-common: revised
 device node
To: Guodong Xu <guodong@riscstar.com>, Conor Dooley <conor@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Emil Renner Berthing <kernel@esmil.dk>, rafal@milecki.pl, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Heiko Stuebner <heiko.stuebner@cherry.de>, Michael Zhu <michael.zhu@starfivetech.com>, 
	Drew Fustini <drew@beagleboard.org>, Alexandru Stan <ams@frame.work>, Daniel Schaefer <dhs@frame.work>, 
	Sandie Cao <sandie.cao@deepcomputing.io>, Yuning Liang <yuning.liang@deepcomputing.io>, 
	Huiming Qiu <huiming.qiu@deepcomputing.io>, Alex Elder <elder@riscstar.com>, linux@frame.work, 
	devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_093548_296046_21EE85A7 
X-CRM114-Status: GOOD (  18.31  )
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

Guodong Xu wrote:
> Earlier this year a new DTSI file was created to define common
> properties for the StarFive VisionFive 2 and Milk-V Mars boards,
> both of which use the StarFive JH7110 SoC.  The Pine64 Star64
> board has also been added since that time.
>
> Some of the nodes defined in "jh7110-common.dtsi" are enabled in
> that file because all of the boards including it "want" them
> enabled.
>
> An upcoming patch enables another JH7110 board, but for that
> board not all of these common nodes should be enabled.  Prepare
> for supporting the new board by avoiding enabling these nodes in
> "jh711-common.dtsi", and enable them instead in these files:

jh7110-common.dtsi

>    jh7110-milkv-mars.dts
>    jh7110-pine64-star64.dts
>    jh7110-starfive-visionfive-2.dtsi
>
> Signed-off-by: Alex Elder <elder@riscstar.com>
> Signed-off-by: Guodong Xu <guodong@riscstar.com>
> ---
> v6: New patch
>
>  .../boot/dts/starfive/jh7110-common.dtsi      |  5 -----
>  .../boot/dts/starfive/jh7110-milkv-mars.dts   | 17 ++++++++++++++++
>  .../dts/starfive/jh7110-pine64-star64.dts     | 17 ++++++++++++++++
>  .../jh7110-starfive-visionfive-2.dtsi         | 20 +++++++++++++++++++
>  4 files changed, 54 insertions(+), 5 deletions(-)
>

From here..

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c7771b3b6475..9e77f79ec162 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
>  .../boot/dts/starfive/jh7110-common.dtsi      |  5 -----
>  .../boot/dts/starfive/jh7110-milkv-mars.dts   | 17 ++++++++++++++++
>  .../dts/starfive/jh7110-pine64-star64.dts     | 17 ++++++++++++++++
>  .../jh7110-starfive-visionfive-2.dtsi         | 20 +++++++++++++++++++
>  4 files changed, 54 insertions(+), 5 deletions(-)

..to here seems to be added by mistake. At least my "git am" wouldn't apply it
like this.

With that fixed this looks good to me, thanks.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> diff --git a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> index c7771b3b6475..9e77f79ec162 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-common.dtsi
> @@ -176,7 +176,6 @@ csi2rx_to_camss: endpoint {
>  &gmac0 {
>  	phy-handle = <&phy0>;
>  	phy-mode = "rgmii-id";
> -	status = "okay";
>
>  	mdio {
>  		#address-cells = <1>;
> @@ -196,7 +195,6 @@ &i2c0 {
>  	i2c-scl-falling-time-ns = <510>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&i2c0_pins>;
> -	status = "okay";
>  };
>
>  &i2c2 {
> @@ -311,7 +309,6 @@ &pcie1 {
>  &pwmdac {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pwmdac_pins>;
> -	status = "okay";
>  };
>
>  &qspi {
> @@ -350,13 +347,11 @@ uboot@100000 {
>  &pwm {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pwm_pins>;
> -	status = "okay";
>  };
>
>  &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>;
> -	status = "okay";
>
>  	spi_dev0: spi@0 {
>  		compatible = "rohm,dh2228fv";
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> index 5cb9e99e1dac..66ad3eb2fd66 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-milkv-mars.dts
> @@ -15,6 +15,11 @@ &gmac0 {
>  	starfive,tx-use-rgmii-clk;
>  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
>  	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	status = "okay";
>  };
>
>  &pcie0 {
> @@ -35,3 +40,15 @@ &phy0 {
>  	rx-internal-delay-ps = <1500>;
>  	tx-internal-delay-ps = <1500>;
>  };
> +
> +&pwm {
> +	status = "okay";
> +};
> +
> +&pwmdac {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> index b720cdd15ed6..dbc8612b8464 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> +++ b/arch/riscv/boot/dts/starfive/jh7110-pine64-star64.dts
> @@ -18,6 +18,7 @@ &gmac0 {
>  	starfive,tx-use-rgmii-clk;
>  	assigned-clocks = <&aoncrg JH7110_AONCLK_GMAC0_TX>;
>  	assigned-clock-parents = <&aoncrg JH7110_AONCLK_GMAC0_RMII_RTX>;
> +	status = "okay";
>  };
>
>  &gmac1 {
> @@ -39,6 +40,10 @@ phy1: ethernet-phy@1 {
>  	};
>  };
>
> +&i2c0 {
> +	status = "okay";
> +};
> +
>  &pcie1 {
>  	status = "okay";
>  };
> @@ -63,3 +68,15 @@ &phy1 {
>  	motorcomm,tx-clk-10-inverted;
>  	motorcomm,tx-clk-100-inverted;
>  };
> +
> +&pwm {
> +	status = "okay";
> +};
> +
> +&pwmdac {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 18f38fc790a4..ef93a394bb2f 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -13,6 +13,10 @@ aliases {
>  	};
>  };
>
> +&gmac0 {
> +	status = "okay";
> +};
> +
>  &gmac1 {
>  	phy-handle = <&phy1>;
>  	phy-mode = "rgmii-id";
> @@ -29,6 +33,10 @@ phy1: ethernet-phy@1 {
>  	};
>  };
>
> +&i2c0 {
> +	status = "okay";
> +};
> +
>  &mmc0 {
>  	non-removable;
>  };
> @@ -40,3 +48,15 @@ &pcie0 {
>  &pcie1 {
>  	status = "okay";
>  };
> +
> +&pwm {
> +	status = "okay";
> +};
> +
> +&pwmdac {
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
