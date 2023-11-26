Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44315C4167B
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Nov 2023 15:36:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=Xjih4uCl1q9ATuSRr46XRXa8o9jmbuAy21gYqzEz3Lg=; b=Q3YQUr0+O+ETc8izUFVcz0aAwS
	8ghImRTLjaqpkz4377W0IoMqcGKGfZW90BudRWHeUjWJXDiD/ynJfA/mKD8jzqnqlf8leswMnepfh
	ZHuECZ6mNbkiFxEeh7e8ebZ9T4ZZRi7bk5LmLnMhRaI8meBnr9bTxTPpWNqsHA3MXCm+pcv6ClCqq
	Vu6Lhf7c4Q/AQMyQ6iZq9vFXP7IyGjDCr7Jy22nmiRe1lfDYG+s5Hz9bM+jiFD85oPui/XcebWXTf
	XhlGvNpnr8davyrdmHUiJ49mKlprBekb9LDI5LNMgJitTLkNrPMQdSQQYeLlMFWKPneSk6fYuDchL
	2/gv3rgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7HAp-00COc0-16;
	Sun, 26 Nov 2023 15:35:55 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r7HAk-00COW6-1e
	for linux-riscv@lists.infradead.org;
	Sun, 26 Nov 2023 15:35:53 +0000
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 107A441527
	for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701012946;
	bh=XKvEfE/yT+1u6a5zCoBgvHyNpleLhtsW9IihC1CtfgY=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=QuQ2hnbzOdmjQTzOrN5UKqDY8TitkA7LUk8K3ZxfX7KE2TD5VtTM8sq/+y5Yd8PG3
	 J6CyBQa31rkfKDFvquyJo+xAX9LOPdCMn11yxYDgpj3/+IJWa19jAzZxlX9qWacVf9
	 GWe8gGJFyUcOgeBagFsy3ZWRrAny5xTDJhtLIbR9840JfDFf+5vXw8t4Li6BflYMCN
	 oBFB6vQYv+coDoOc7zsFKiCEiEgF/NCAwlO/SMclJE8E0XtiGd1CVoTQ+INuevOaee
	 eadzABWyRSSOV02mmvenSvN0DYQndjIG0XE0Uvcc1uUJDhmcfoSOx7JQOTC3C8Y23L
	 wMmqtzkxlO9hA==
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-58a3be29c95so4351444eaf.0
        for <linux-riscv@lists.infradead.org>; Sun, 26 Nov 2023 07:35:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701012944; x=1701617744;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XKvEfE/yT+1u6a5zCoBgvHyNpleLhtsW9IihC1CtfgY=;
        b=vfbCFblPfkVumLjMepbdCAX7PlSca6NzqUNgzi2/b4AcmgFsogQznI1sdNMhFo3Op1
         L8v32sdTFEq1mjXMqYEtYY6W5QWmYBX5WzjJLGc0+zytMnnFSdaDt0lcmMq5cs7GpJji
         DfyZW5cM86ywpJGS3vsrcBP6BOEg0uJKvhjDawrW9kJ3wYsUv/wZ7R2fdi6mCJEQbty8
         UjOuf8K2KZU+Vpg+91ky3PDDd8VZ+bQrQ3Vlz/U3aT3DcLkZK+yJP6TfADbGbdhnCZxc
         IWpYXOteWdbX2AISJPqQoMhDVwotHWlpMkheQAW8LXvqRE98vvtC7rhjVLzgC1VN0P5o
         Yqzw==
X-Gm-Message-State: AOJu0YyPNFrL+n+tyPbWG5QsGRj/zufeyfnV37oGxu0107/YmSVloJsN
	qKq0+I60a5fLq2uq9o5/Udc5K/zR894crD9U4K21dla8iL4bWPenRbG3y73eIs2C7cK+azosuIK
	yKAyXXpTX8He07ITuSVzM/JukPd0J3UNBL7nMydMgS22uG8sOCF7jXhJ1UxEzVg==
X-Received: by 2002:a05:6870:3c8b:b0:1f5:c6f9:b76d with SMTP id gl11-20020a0568703c8b00b001f5c6f9b76dmr12642873oab.49.1701012944496;
        Sun, 26 Nov 2023 07:35:44 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGPyr6YtnSTxDyRnhJ4O+RkJcUnFuikgx1HgSKh7dR1BpfbqeB2EhGJO7dnreod0RXfNNu8Voklx2OIMwDo9gc=
X-Received: by 2002:a05:6870:3c8b:b0:1f5:c6f9:b76d with SMTP id
 gl11-20020a0568703c8b00b001f5c6f9b76dmr12642845oab.49.1701012944216; Sun, 26
 Nov 2023 07:35:44 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Sun, 26 Nov 2023 16:35:43 +0100
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231126-unlighted-favorably-4627f2361a59@spud>
References: <20231126-unlighted-favorably-4627f2361a59@spud>
Mime-Version: 1.0
Date: Sun, 26 Nov 2023 16:35:43 +0100
Message-ID: <CAJM55Z8-xJfxeV1xJrKXDpsGV05QV4C3JP3myRRBEq6dNfdPLQ@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: microchip: move timebase-frequency to mpfs.dtsi
To: Conor Dooley <conor@kernel.org>, linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>, 
	Daire McNamara <daire.mcnamara@microchip.com>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_073551_161138_79DB874D 
X-CRM114-Status: GOOD (  19.13  )
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

Conor Dooley wrote:
> From: Conor Dooley <conor.dooley@microchip.com>
>
> The timebase-frequency on PolarFire SoC is not set by an oscillator on
> the board, but rather by an internal divider, so move the property to
> mpfs.dtsi.
>
> This looks to be copy-pasta from the SiFive Unleashed as the comments
> in both places were almost identical. In the Unleashed's case this looks
> to actually be valid, as the clock is provided by a crystal on the PCB.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Makes sense to me.

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
> CC: Conor Dooley <conor.dooley@microchip.com>
> CC: Daire McNamara <daire.mcnamara@microchip.com>
> CC: Rob Herring <robh+dt@kernel.org>
> CC: Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
> CC: Paul Walmsley <paul.walmsley@sifive.com>
> CC: Palmer Dabbelt <palmer@dabbelt.com>
> CC: linux-riscv@lists.infradead.org
> CC: devicetree@vger.kernel.org
> ---
>  arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts | 7 -------
>  arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts | 7 -------
>  arch/riscv/boot/dts/microchip/mpfs-polarberry.dts | 7 -------
>  arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts    | 7 -------
>  arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts    | 7 -------
>  arch/riscv/boot/dts/microchip/mpfs.dtsi           | 1 +
>  6 files changed, 1 insertion(+), 35 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> index 90b261114763..dce96f27cc89 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-icicle-kit.dts
> @@ -8,9 +8,6 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>
> -/* Clock frequency (in Hz) of the rtcclk */
> -#define RTCCLK_FREQ		1000000
> -
>  / {
>  	model = "Microchip PolarFire-SoC Icicle Kit";
>  	compatible = "microchip,mpfs-icicle-reference-rtlv2210", "microchip,mpfs-icicle-kit",
> @@ -29,10 +26,6 @@ chosen {
>  		stdout-path = "serial1:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <RTCCLK_FREQ>;
> -	};
> -
>  	leds {
>  		compatible = "gpio-leds";
>
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
> index 184cb36a175e..a8d623ee9fa4 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-m100pfsevp.dts
> @@ -10,9 +10,6 @@
>  #include "mpfs.dtsi"
>  #include "mpfs-m100pfs-fabric.dtsi"
>
> -/* Clock frequency (in Hz) of the rtcclk */
> -#define MTIMER_FREQ	1000000
> -
>  / {
>  	model = "Aries Embedded M100PFEVPS";
>  	compatible = "aries,m100pfsevp", "microchip,mpfs";
> @@ -33,10 +30,6 @@ chosen {
>  		stdout-path = "serial1:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <MTIMER_FREQ>;
> -	};
> -
>  	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x0 0x40000000>;
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> index c87cc2d8fe29..ea0808ab1042 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
> @@ -6,9 +6,6 @@
>  #include "mpfs.dtsi"
>  #include "mpfs-polarberry-fabric.dtsi"
>
> -/* Clock frequency (in Hz) of the rtcclk */
> -#define MTIMER_FREQ	1000000
> -
>  / {
>  	model = "Sundance PolarBerry";
>  	compatible = "sundance,polarberry", "microchip,mpfs";
> @@ -22,10 +19,6 @@ chosen {
>  		stdout-path = "serial0:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <MTIMER_FREQ>;
> -	};
> -
>  	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x0 0x2e000000>;
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
> index 013cb666c72d..f9a890579438 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-sev-kit.dts
> @@ -6,9 +6,6 @@
>  #include "mpfs.dtsi"
>  #include "mpfs-sev-kit-fabric.dtsi"
>
> -/* Clock frequency (in Hz) of the rtcclk */
> -#define MTIMER_FREQ		1000000
> -
>  / {
>  	#address-cells = <2>;
>  	#size-cells = <2>;
> @@ -28,10 +25,6 @@ chosen {
>  		stdout-path = "serial1:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <MTIMER_FREQ>;
> -	};
> -
>  	reserved-memory {
>  		#address-cells = <2>;
>  		#size-cells = <2>;
> diff --git a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> index e0797c7e1b35..d1120f5f2c01 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> +++ b/arch/riscv/boot/dts/microchip/mpfs-tysom-m.dts
> @@ -11,9 +11,6 @@
>  #include "mpfs.dtsi"
>  #include "mpfs-tysom-m-fabric.dtsi"
>
> -/* Clock frequency (in Hz) of the rtcclk */
> -#define MTIMER_FREQ		1000000
> -
>  / {
>  	model = "Aldec TySOM-M-MPFS250T-REV2";
>  	compatible = "aldec,tysom-m-mpfs250t-rev2", "microchip,mpfs";
> @@ -34,10 +31,6 @@ chosen {
>  		stdout-path = "serial1:115200n8";
>  	};
>
> -	cpus {
> -		timebase-frequency = <MTIMER_FREQ>;
> -	};
> -
>  	ddrc_cache_lo: memory@80000000 {
>  		device_type = "memory";
>  		reg = <0x0 0x80000000 0x0 0x30000000>;
> diff --git a/arch/riscv/boot/dts/microchip/mpfs.dtsi b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> index a6faf24f1dba..266489d43912 100644
> --- a/arch/riscv/boot/dts/microchip/mpfs.dtsi
> +++ b/arch/riscv/boot/dts/microchip/mpfs.dtsi
> @@ -13,6 +13,7 @@ / {
>  	cpus {
>  		#address-cells = <1>;
>  		#size-cells = <0>;
> +		timebase-frequency = <1000000>;
>
>  		cpu0: cpu@0 {
>  			compatible = "sifive,e51", "sifive,rocket0", "riscv";
> --
> 2.39.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
