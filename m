Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16847CCD185
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:57:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R6r7OGqIL4+0gPnd028/8yQ1Sy+1lNKE5WlTzmWorIM=; b=wbgnghpfCVmAQ4
	TdmLduTa0bl/O6WPa1z/dsBLhnvL5VHPwH4dTSqKWiOFl4XxM6ZEkGKUXlJ6tA6Zoa3UkS8O7iIpU
	FOQuOKj966prTr7kUalVlaQD6wRKCRVVgOe5PThUFx6lJMlhaIi45oIT6jcref8Kd6q2GwZFAV6p6
	dfmuAtWvwCc4TnQqDP73Ttj03MBVhecfOmmsxtM0bmkmb/X3zkHikA/L30TyOH4k4rfE+wacEFjmS
	sm1kN1ArAN03RIY4Q+7D+DhD0pvlLdTW049Au/qiDWklIELiIuD9c6xkQhH4YlZzCXo6oo8wevNUu
	FS+zUNkKQY7YKDBUoFcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7OrC-00000009g9M-1gBJ;
	Sat, 11 Oct 2025 01:57:14 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Or9-00000009g8z-3YqL
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:57:13 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-27edcbcd158so29911855ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147831; x=1760752631; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=eHTSJHwY1yibK3NZWh/Q68kzDMLrWU3aH+eDUXwCRpA=;
        b=eLChzroUQj0UrATRoiVaDwHrgeOXLXQCKdtwul43FlwLLzfBQve2XId/LT41zK675B
         X5YR+wFwVEPnwiwF8eLQtKLhV0vJNpGDVxjmFIn/zqxWwofnytqSLla6eZxKAXcBQohR
         oyGso91z4xobiO6E2qvDvW+5yEab4edy5XREgeHxOCCHHzc/0ZwLpdiYbjamzkgR460W
         gkw5OAaKJ1yDuDyb8B6hQ6XCRb6Xyi4sLCXSAtye4qbwsx7t4G2GJgjqYoqlsV7fZ4w4
         FGENSlZ/1YOJKIav+rlq5ybsETnkWBPY1lR+9P3Xy+vRy56XjI90HQoIbJqPDib67qdN
         dsng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147831; x=1760752631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eHTSJHwY1yibK3NZWh/Q68kzDMLrWU3aH+eDUXwCRpA=;
        b=X/W49qjTvKf+JQMOM0UZzPvxvqEPSgVziZ8UwY9KTNmAzWfB1sig9fTGxLvv7VXIYr
         pwsqNLmb+0h6eGGGuIEd9qyj8zCrsATPDBNowWGfAbYY+ssfDVT5wQj6XAfXiauENyCg
         fzRhCE6NiAd3gBvQtiD9y1yqgbUyl6pnMK4J8QZJp8y+GWebwvpeSJLSTxcz0Sx2LeHz
         66IZJFzpcyF6TdAqDsx6hTwGzu7R0ti0jFXi3v/SiuAboeraUQMWrZjuS52vP5ldf97A
         Pq7z6Z9AO/Fba1/0PqpBPLE1OgnEtvzaFWlapc4PdonPxFgCcNuattiWbh6xO7p541v6
         Hrvw==
X-Forwarded-Encrypted: i=1; AJvYcCXpSz5lmuOk8Ypu9mOeepV7brAfk3spwn/JQaYj/GyFUFapM3i9ukd3k883zeeWOJZhMYmyx9O1sVaZNQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwEQeJWmvm1C+CUOEoKcqf7h6t09kn8sSdPKfS62t/K0nXAO6i3
	zX4eE7GFWhhAlnH2487o5mpQv81IjOHr4+chEyPUuv8daJqyzA/Rpuz5aSUGENpwZew=
X-Gm-Gg: ASbGncuQIX1vwBdI0IObxp3v+SG5bhfo92kf5R86aMAEKGhi0j+t6Aa7HDYkgIBHrVi
	pXwlXh9Cg+xtntVcVLXmikS7bz5PSY9ah8rpRU+GBofH22iENai1HN9S6cvaAYJmfpsMeP4347g
	o/xx/eOS6h7x1HeuVgIrr+NDmWjcUJclcKw7qfoZseZ/0w6CrnMMDYkl26ZE2ePBqL03pFQN5P2
	o5PBQtiihDfU5wrjjMn1BvudSOiOFo5L5VhbvrTIPFrctxQ0oYwQeGeFFSAxflQ0R19jri3ALo1
	9c4m071GTFrjkmANgpa2sGOKwiueSmXwBCgfRDHxvc21VaKX2r0pm+f0mGTlG482JmIqfRgCbHd
	H+mBnO0/i3gv4l/hGEY50lcXY1+qfKlA3T4MbMSmi
X-Google-Smtp-Source: AGHT+IFc5FAAft1OfRzVanzQWGtZ/tg/QAdN+bH6b1aigX28GF4mdggE7OEsu26WE+5GHtCW7IZH5w==
X-Received: by 2002:a17:902:fc4c:b0:282:ee0e:5991 with SMTP id d9443c01a7336-290272b54abmr170693615ad.30.1760147830782;
        Fri, 10 Oct 2025 18:57:10 -0700 (PDT)
Received: from localhost ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-29034f56c04sm69598565ad.110.2025.10.10.18.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:57:10 -0700 (PDT)
Date: Sat, 11 Oct 2025 09:56:28 +0800
From: Inochi Amaoto <inochiama@gmail.com>
To: Joshua Milas <josh.milas@gmail.com>, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, unicorn_wang@outlook.com, 
	inochiama@gmail.com, paul.walmsley@sifive.com, palmer@dabbelt.com, 
	aou@eecs.berkeley.edu, alex@ghiti.fr, alexander.sverdlin@gmail.com, 
	rabenda.cn@gmail.com, thomas.bonnefille@bootlin.com, chao.wei@sophgo.com, 
	liujingqi@lanxincomputing.com
Cc: devicetree@vger.kernel.org, sophgo@lists.linux.dev, 
	linux-riscv@lists.infradead.org
Subject: Re: [PATCH 2/3] arm64: dts: sophgo: add initial Milk-V Duo S board
 support
Message-ID: <hkdnjyldwr4watvizsju4qcvpvkb3mtt5rathaooembpceyufx@ega5xrqj6v3y>
References: <20251011014811.28521-1-josh.milas@gmail.com>
 <20251011014811.28521-3-josh.milas@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20251011014811.28521-3-josh.milas@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_185711_916096_085480D7 
X-CRM114-Status: GOOD (  16.46  )
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

On Fri, Oct 10, 2025 at 09:48:10PM -0400, Joshua Milas wrote:
> This adds initial arm64 support for the Milk-V Duo S board
> [1] making it possible to boot Linux to the command line.
> 
> Link: https://milkv.io/duo-s [1]
> 
> Signed-off-by: Joshua Milas <josh.milas@gmail.com>
> ---
>  arch/arm64/boot/dts/sophgo/Makefile           |   1 +
>  .../boot/dts/sophgo/sg2000-milkv-duo-s.dts    | 110 ++++++++++++++++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> 
> diff --git a/arch/arm64/boot/dts/sophgo/Makefile b/arch/arm64/boot/dts/sophgo/Makefile
> index 94f52cd7d994..68aace728223 100644
> --- a/arch/arm64/boot/dts/sophgo/Makefile
> +++ b/arch/arm64/boot/dts/sophgo/Makefile
> @@ -1,2 +1,3 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-module-01-evb.dtb
> +dtb-$(CONFIG_ARCH_SOPHGO) += sg2000-milkv-duo-s.dtb
> diff --git a/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> new file mode 100644
> index 000000000000..e9afad6fd106
> --- /dev/null
> +++ b/arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-s.dts
> @@ -0,0 +1,110 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/pinctrl/pinctrl-sg2000.h>
> +#include "sg2000.dtsi"
> +
> +/ {
> +	model = "Milk-V Duo S";
> +	compatible = "milkv,duo-s", "sophgo,sg2000";
> +
> +	aliases {
> +		mmc0 = &sdhci0;
> +		serial0 = &uart0;
> +		serial1 = &uart1;
> +		serial2 = &uart2;
> +		serial3 = &uart3;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&osc {
> +	clock-frequency = <25000000>;
> +};
> +
> +&dmac {
> +	status = "okay";
> +};
> +
> +&emmc {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	cap-mmc-hw-reset;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&gmac0 {
> +	status = "okay";
> +};
> +
> +&i2c1 {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	status = "okay";
> +};
> +
> +&i2c4 {
> +	status = "okay";
> +};
> +
> +&mdio {
> +	status = "okay";
> +};
> +
> +&saradc {
> +	status = "okay";
> +};
> +
> +&sdhci0 {
> +	bus-width = <4>;
> +	no-1-8-v;
> +	disable-wp;
> +	status = "okay";
> +};
> +
> +&sdhci1 {
> +	bus-width = <4>;
> +	cap-sdio-irq;
> +	no-mmc;
> +	no-sd;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&spi0 {
> +	status = "okay";
> +};
> +
> +&spi3 {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	status = "okay";
> +};
> +
> -- 
> 2.51.0
> 

Only enable device that can be accessed directly. These devices share
some pins and only one of them can be used. I suggest enabling devices
that are accessed by default (which means it is compatible with the
vendor kernel).

This advice also applys to the riscv dts.

Regards,
Inochi

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
