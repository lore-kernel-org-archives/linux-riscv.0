Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA12AC282D1
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 01:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E6KFyhkKE4Iq9fbzsj7VycVsPsLiS5+8YY5DX/MW+Ek=; b=kAvZJOfy6aNKAN
	4YOwP+WMys4I6oI9yAGN3zNml2+3pb6+AGv9n0dPeHahyZzADCqVrYobDGEmiqauoM9i2Jk0breOs
	+TWDE9vYfEnoXe2v7b9Z09yx26wy/PQWcZXHQF8G3ApHp3aYTdanPWdHWREIbqyqVrrvNyK3naKPA
	B9jc+IDsQ9YrQbiezTJLi9T6puE9X4nqQkVklILXM+qSiIhZOb0vSV8vuRkRHppuh7adDiTI/O/j3
	NcSc48XHnTuKbdM4L0LwYAcmerDkcYCyp+g7vQruMaDlbr0e7/o8QVlnzAz77vs9aYC9Tz1ytVNXv
	X+5xt9aiy/sxi00ytIwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMxV-0000000CrY8-0Lmk;
	Fri, 07 Mar 2025 01:57:05 +0000
Received: from mail-qk1-x733.google.com ([2607:f8b0:4864:20::733])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqMwB-0000000CrIN-2dsw
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 01:55:45 +0000
Received: by mail-qk1-x733.google.com with SMTP id af79cd13be357-7be6fdeee35so265738085a.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Mar 2025 17:55:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741312542; x=1741917342; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=CnB820XmRIOqOOR99gcezJiiPyY61vMTKT3r5Ay3K/8=;
        b=NRZvMwdN0eWqxxYP5LgGJUaRqjbnO46P4XdWCCbpvS3JzMjw3BYAXbSlkc8hi1jQ+w
         +f+FvJVZIqvohcvhuuRfQcy5WIakkUGNGzwA1Ne+50/K06snhJYmBycAwQCB9Cd7oT4S
         nKKku/jhLxJ+t3MbZ16CneRQ1GxBLXZNeRmivLch2I8qjurmUvy02XkDnFoD9INUdQzT
         +7bTuPI8hqQtwhn15mCSqZyKklibxaGgX95xqv6a0W5J4KYVVlBEcEInt9x6m1JRc7+z
         QEX9WisAQS26WuN91y6M52SHxJY4Ts7nDUkD8sV3Ygp4kkUeGacxMkGmbt4T0B0PCkMJ
         CmDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741312542; x=1741917342;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnB820XmRIOqOOR99gcezJiiPyY61vMTKT3r5Ay3K/8=;
        b=R1vKSZsrop7SVBD8EUtkLnRPvHhUS/VIl2zX4CJ91BI82FytNx3SwTkhz4wi37irzC
         HqNIdzbLT+5fP1gSLvJZ33piK9u/dXByI2iAKSZJGPDEjatXmYdYavsc6l2igC/ZAIAp
         Fqb28IGpKGtEwKx07eSa9wBULjSSTKN6sxAkGjEvAhLrMOa3e+xXP6BF9/rK8GM0cXJr
         RqangGUd5esAdGRGKpw6ZLSpmWFmUt2VcFli4f6ekxspz2NWNrL+UbYHhJwbK8ldaveR
         Oj7ZhFjHAGqKZIpLTU4GGIh3d640ii2v5uH4buC3UbZQ11ulCY1zuYoGPD8bYeTYOYDH
         JFBQ==
X-Gm-Message-State: AOJu0YznGkcgMkIyzo+vEbkLtBB/dvVl+GdjlNrGzIwcBR3TCEThQ5Ud
	UHcjrwKvYMmegT6+rNmydwsuoLA6RYGmgXqTtPSA1rpgfDfsSjzD
X-Gm-Gg: ASbGncvI0ia23Vkwz4+9s98sd0L8ko/MJVd5kU30P2Z7YsvO8M6YY31OxDeHjVkvgL7
	fJmvP7aSmEySQo1SbuyLiwRTxV2l63UznSpmC9cRwd7m/3ZIgVWcmD8Hok8DUYRygfO4yVvNd4T
	tK+v6nYoOwa5w4/KQZnVbWyZOmYXNti5B3379AP85FW2jZnswzcwdSdCLtaiiTcYDm/KnjJ2Nhi
	arVA+4I2EP3cReY5R54ImevrKVkxjxIcUm4sgnHleTllo7hmMwhHOCGNs1fgWuxx1WKKFKgRHmI
	QSOdpW2Br/1Jq9g66GaK
X-Google-Smtp-Source: AGHT+IEhk9cw6y94YXFfzejXMM/qsbiaq30VZ1R51o4YMU4MUQ3DOSzkmoemtDhtTBQwJetuR8isjg==
X-Received: by 2002:a05:620a:8719:b0:7c3:d6a7:6eea with SMTP id af79cd13be357-7c4e168b8b7mr226719685a.21.1741312542344;
        Thu, 06 Mar 2025 17:55:42 -0800 (PST)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id af79cd13be357-7c3e551102csm168635885a.101.2025.03.06.17.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Mar 2025 17:55:41 -0800 (PST)
Date: Fri, 7 Mar 2025 09:55:15 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Haylen Chu <heylenay@4d2.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Haylen Chu <heylenay@outlook.com>, Yixun Lan <dlan@gentoo.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
	Inochi Amaoto <inochiama@outlook.com>, Chen Wang <unicornxdotw@foxmail.com>, 
	Jisheng Zhang <jszhang@kernel.org>, Meng Zhang <zhangmeng.kevin@linux.spacemit.com>
Subject: Re: [PATCH v5 5/5] riscv: dts: spacemit: Add clock tree for Spacemit
 K1
Message-ID: <2isaev6ys2fn2u6lnyudvnjam34fggr5tqh7afajwdjbdp5rvr@ajokoevhqq4p>
References: <20250306175750.22480-2-heylenay@4d2.org>
 <20250306175750.22480-7-heylenay@4d2.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250306175750.22480-7-heylenay@4d2.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_175543_686429_D1695016 
X-CRM114-Status: GOOD (  14.97  )
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

On Thu, Mar 06, 2025 at 05:57:51PM +0000, Haylen Chu wrote:
> Describe the PLL and system controllers that're capable of generating
> clock signals in the devicetree.
> 
> Signed-off-by: Haylen Chu <heylenay@4d2.org>
> ---
>  arch/riscv/boot/dts/spacemit/k1.dtsi | 79 ++++++++++++++++++++++++++++
>  1 file changed, 79 insertions(+)
> 
> diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
> index c670ebf8fa12..09a9100986b1 100644
> --- a/arch/riscv/boot/dts/spacemit/k1.dtsi
> +++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
> @@ -3,6 +3,8 @@
>   * Copyright (C) 2024 Yangyu Chen <cyy@cyyself.name>
>   */
>  
> +#include <dt-bindings/clock/spacemit,k1-ccu.h>
> +
>  /dts-v1/;
>  / {
>  	#address-cells = <2>;
> @@ -306,6 +308,40 @@ cluster1_l2_cache: l2-cache1 {
>  		};
>  	};
>  
> +	clocks {

> +		#address-cells = <0x2>;
> +		#size-cells = <0x2>;
> +		ranges;

why setting this?

> +
> +		vctcxo_1m: clock-1m {
> +			compatible = "fixed-clock";

> +			clock-frequency = <1000000>;

Should the frequency this move to the board file?
I do not think these clock are in the soc.
This applys to all clock below.

> +			clock-output-names = "vctcxo_1m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_24m: clock-24m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <24000000>;
> +			clock-output-names = "vctcxo_24m";
> +			#clock-cells = <0>;
> +		};
> +
> +		vctcxo_3m: clock-3m {
> +			compatible = "fixed-clock";
> +			clock-frequency = <3000000>;
> +			clock-output-names = "vctcxo_3m";
> +			#clock-cells = <0>;
> +		};
> +
> +		osc_32k: clock-32k {
> +			compatible = "fixed-clock";
> +			clock-frequency = <32000>;
> +			clock-output-names = "osc_32k";
> +			#clock-cells = <0>;
> +		};
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -314,6 +350,17 @@ soc {
>  		dma-noncoherent;
>  		ranges;
>  
> +		syscon_apbc: system-control@d4015000 {
> +			compatible = "spacemit,k1-syscon-apbc";
> +			reg = <0x0 0xd4015000 0x0 0x1000>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		uart0: serial@d4017000 {
>  			compatible = "spacemit,k1-uart", "intel,xscale-uart";
>  			reg = <0x0 0xd4017000 0x0 0x100>;
> @@ -409,6 +456,38 @@ pinctrl: pinctrl@d401e000 {
>  			reg = <0x0 0xd401e000 0x0 0x400>;
>  		};
>  
> +		syscon_mpmu: system-controller@d4050000 {
> +			compatible = "spacemit,k1-syscon-mpmu";
> +			reg = <0x0 0xd4050000 0x0 0x209c>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pll: system-control@d4090000 {
> +			compatible = "spacemit,k1-pll";
> +			reg = <0x0 0xd4090000 0x0 0x1000>;
> +			clocks = <&vctcxo_24m>;
> +			spacemit,mpmu = <&syscon_mpmu>;
> +			#clock-cells = <1>;
> +		};
> +
> +		syscon_apmu: system-control@d4282800 {
> +			compatible = "spacemit,k1-syscon-apmu";
> +			reg = <0x0 0xd4282800 0x0 0x400>;
> +			clocks = <&osc_32k>, <&vctcxo_1m>, <&vctcxo_3m>,
> +				 <&vctcxo_24m>;
> +			clock-names = "osc", "vctcxo_1m", "vctcxo_3m",
> +				      "vctcxo_24m";
> +			#clock-cells = <1>;
> +			#power-domain-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
>  		plic: interrupt-controller@e0000000 {
>  			compatible = "spacemit,k1-plic", "sifive,plic-1.0.0";
>  			reg = <0x0 0xe0000000 0x0 0x4000000>;
> -- 
> 2.48.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
