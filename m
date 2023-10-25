Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF25EC07545
	for <linux-riscv@archiver.kernel.org>; Wed, 25 Oct 2023 13:45:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=462B2Tavwu03HG8B6ex4LjvMmTyJbJo014AhP1Fn2tM=; b=aw9J/E++0ZlP8g8d9AdH8Tr+aY
	durGk1vu5zE/FU1KGlsbVEGIdrGQ5iIWaCmKGdtZy/4HbW5XlN8JKvXkoPz7ew45oh8CWHqyeKUMi
	NOFSNhQEmNNepObMWsWzBwKxwaXBRBDnSsvX6OPx0ZMr0RvK1oWHBNJfpylg/flWWwztkoAfyiGPc
	ESPefxu4XZ1t/dcRI177hJyo+JSCHvhMxGvkkuKyWdXvIdnPalJdc6IGxnSTegJfCTvi6cMylr93n
	s+3k4cbzVr7o6ZMWb6/i4wqSFdwHsAOKpkXW3CO6E4XWcXCfqrq6f9gDw/AJH4NlzG9dhqGYg9lzB
	BEmMobtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qveCi-00CR49-2e;
	Wed, 25 Oct 2023 13:45:48 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qveCf-00CR3m-1R
	for linux-riscv@lists.infradead.org;
	Wed, 25 Oct 2023 13:45:46 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 10E9840621
	for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 13:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1698241541;
	bh=+60nkze2sRRgfeFsZmoFML77ioPwo/jReraRdMDEs5A=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=gXXGGt6tMw99lTGXANzK+uLRJ1KxSj4TdHucyyiab1RjnNRqQJKl2Z9t/pUDgb72K
	 xZB1OZCidOULl/B1FkafeCAW0PVjMr0ZiXn56kLq4a00WITjF4yut8Xi42J2hEklDt
	 TzJef9Z9lNcOMVT6D+qLAsPX2oYowrKB7VosHOJBuL2NZ8VcbGxeWvHHH2eZ3VxIZm
	 At7QWmMcKcut4iOKfMKgEM0xuPiyINOAQ6gYFscgRvAaPFCwhoObaoWx9qkjXVxf1o
	 NwUreYjOethZK35nwJhg4RtLtGCQot3fai4VCz4zY94ePRtvu+9Ot8hKPZeNkJl6yk
	 65ByvLdmEkW1A==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-41cdce61dcbso68317991cf.3
        for <linux-riscv@lists.infradead.org>; Wed, 25 Oct 2023 06:45:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698241540; x=1698846340;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+60nkze2sRRgfeFsZmoFML77ioPwo/jReraRdMDEs5A=;
        b=v5I2B6stiHmkPnI9i+tbMKbmMzMeRRh/F3Taj7QH9hbpwIg5cQQ1gPIlY2x0KT+z+O
         lqVTtptWgrEn/dAo4+C7HqtXyECKtuhcnmZDd5Bz1Rhpqv1TcJeidM4r57ETMKA+ok42
         hJ+LR8ovjbbecaXjSHSO2O+KBdbRZrr12pJ+v0tgizmZ4DeZ2SDirzYqaohpFHa1n7zV
         pZRD9mjge2M83Cj41iOSGErmc/V9ctWRaZ73FokH72JszyMGVruoFjsRMFGhJCX2EBX3
         p+Uuh9aO6gLrN1H8jbuG4kFrlUT9osnL6mjI3hWrdBGf5uxuG/ctLf16UbXyFZg1/zO0
         Yyfw==
X-Gm-Message-State: AOJu0Yz3mFZGjILpOSjd+LQLoKKTRE84ODmzdyKaKSAfz0xjr566Gtwi
	+vnzCMFGA83n39Nar8+lDqH+UyZlBisxUS3G9lCZvVZ1IJV3wHNMdMzSeQegxqXIOSzofmuOw4Y
	TBzYUDHyF6s5Omg47MqOSkVrmyEu8AJWLTJZ0uuctIxocVUOXPxOCQOXF82Tdwg==
X-Received: by 2002:a05:622a:546:b0:418:2242:7823 with SMTP id m6-20020a05622a054600b0041822427823mr19590885qtx.32.1698241540170;
        Wed, 25 Oct 2023 06:45:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOVt8UpkWDt9syG2uUYq+GKDBm1AQ/uLpT42Eg0N4uYLR9c2VyMtFdKW/1yQYgIadYQ81RXcVGJLbHiSFOWBI=
X-Received: by 2002:a05:622a:546:b0:418:2242:7823 with SMTP id
 m6-20020a05622a054600b0041822427823mr19590867qtx.32.1698241539921; Wed, 25
 Oct 2023 06:45:39 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 25 Oct 2023 06:45:39 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231020103741.557735-4-william.qiu@starfivetech.com>
References: <20231020103741.557735-1-william.qiu@starfivetech.com> <20231020103741.557735-4-william.qiu@starfivetech.com>
Mime-Version: 1.0
Date: Wed, 25 Oct 2023 06:45:39 -0700
Message-ID: <CAJM55Z9aR0rwK9CSyGw_YJP8VN5sKax1JH6bPEaiX_gjkE049g@mail.gmail.com>
Subject: Re: [PATCH v6 3/4] riscv: dts: starfive: jh7110: Add PWM node and
 pins configuration
To: William Qiu <william.qiu@starfivetech.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-pwm@vger.kernel.org
Cc: Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Thierry Reding <thierry.reding@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, 
	Hal Feng <hal.feng@starfivetech.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_064545_694951_8B528721 
X-CRM114-Status: GOOD (  12.07  )
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

William Qiu wrote:
> Add OpenCores PWM controller node and add PWM pins configuration
> on VisionFive 2 board.
>
> Signed-off-by: William Qiu <william.qiu@starfivetech.com>
> Reviewed-by: Hal Feng <hal.feng@starfivetech.com>
> ---
>  .../jh7110-starfive-visionfive-2.dtsi         | 22 +++++++++++++++++++
>  arch/riscv/boot/dts/starfive/jh7110.dtsi      |  9 ++++++++
>  2 files changed, 31 insertions(+)
>
> diff --git a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> index 12ebe9792356..63d16a6a4e12 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110-starfive-visionfive-2.dtsi
> @@ -268,6 +268,12 @@ reserved-data@600000 {
>  	};
>  };
>
> +&pwm {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pwm_pins>;
> +	status = "okay";
> +};
> +

Hi William,

I just noticed this node reference is out of order. The references should be
sorted alphabetically.

/Emil

>  &spi0 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&spi0_pins>;
> @@ -402,6 +408,22 @@ GPOEN_SYS_SDIO1_DATA3,
>  		};
>  	};
>
> +	pwm_pins: pwm-0 {
> +		pwm-pins {
> +			pinmux = <GPIOMUX(46, GPOUT_SYS_PWM_CHANNEL0,
> +					      GPOEN_SYS_PWM0_CHANNEL0,
> +					      GPI_NONE)>,
> +				 <GPIOMUX(59, GPOUT_SYS_PWM_CHANNEL1,
> +					      GPOEN_SYS_PWM0_CHANNEL1,
> +					      GPI_NONE)>;
> +			bias-disable;
> +			drive-strength = <12>;
> +			input-disable;
> +			input-schmitt-disable;
> +			slew-rate = <0>;
> +		};
> +	};
> +
>  	spi0_pins: spi0-0 {
>  		mosi-pins {
>  			pinmux = <GPIOMUX(52, GPOUT_SYS_SPI0_TXD,
> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> index e85464c328d0..4024165d4538 100644
> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
> @@ -736,6 +736,15 @@ spi6: spi@120a0000 {
>  			status = "disabled";
>  		};
>
> +		pwm: pwm@120d0000 {
> +			compatible = "starfive,jh71x0-pwm";
> +			reg = <0x0 0x120d0000 0x0 0x10000>;
> +			clocks = <&syscrg JH7110_SYSCLK_PWM_APB>;
> +			resets = <&syscrg JH7110_SYSRST_PWM_APB>;
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +
>  		sfctemp: temperature-sensor@120e0000 {
>  			compatible = "starfive,jh7110-temp";
>  			reg = <0x0 0x120e0000 0x0 0x10000>;
> --
> 2.34.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
