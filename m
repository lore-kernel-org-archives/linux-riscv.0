Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B059AE7716E
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Dec 2024 15:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jsUFSw8BQ3W21nIOZUlHdf+vLlLUTS7HbDM87nC6LRE=; b=Gh+Pf3Si2BKu5HHkJ+rs4oynx+
	MwiRIl5CNpXOQtoidUydVgDaBZyRDGDMzFqm8M2uY+R/aBR/AMaut18HNpCgQwmICJxlcYTNdg49m
	3/NUgowqXJLk8cioQ7KvmV6vF/uFy8av9x7YaYIwy65GuIVE/JYoCF96KmI2YFW4YdMtgkSUBpkG/
	z+pm3O6cXOqQ1x1VrL9EHkvsZk9uCS6HGXgcGd6SxC2o7Mk26bRCPNKuYkw5jEjlMtVSrPAFmSzGL
	YUeHfJCf2zsoYNeCsuLgsuiTTNNz95P2gUVC7IQTppThkppoXPr+dV06UyWQJR2227WxUeRbq+kRT
	MTD3aQHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrAG-0000000CyQo-3Uqz;
	Wed, 04 Dec 2024 15:19:44 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrAD-0000000CyP9-0NXB
	for linux-riscv@lists.infradead.org;
	Wed, 04 Dec 2024 15:19:43 +0000
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 3ED7840CE4
	for <linux-riscv@lists.infradead.org>; Wed,  4 Dec 2024 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1733325571;
	bh=mT6saqI3kUrpS1by1WPPwkqD7keXMeGTbVJLvZHkNkU=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=HB1iovpUhdyYSP+mSpkG6x/61vpv+abUxfnQwq5GQpPa/GrcAKHa/26g7Uzk0YK4z
	 9RofIy83jhFsXI7tQr2C5T0FFfxEwpHTLrvQ5AmTET3f8EpmgwkMfi4iPBY7clmOBl
	 map6YFqCjuhH0C+ZGNsfqEGD/2yVJ3LWIt6e1sjZZ1+FS9ooDYpUKAmX+dDAHk3sqb
	 sL2kkGFMtSKrOIiQYdCgTOwqd3bNiK9gKnIKwVx+In+3f7RjZWjZZoceAFjXV/1UDP
	 tjU36YRbtnsharZpAQFUjBzLMmgTH6q/AyMy5jC/xND0dzXr/umjnvJQ4p/ewxmlKc
	 dB8jvMDB/+lXA==
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-5f1e9fac321so810656eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 04 Dec 2024 07:19:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733325569; x=1733930369;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mT6saqI3kUrpS1by1WPPwkqD7keXMeGTbVJLvZHkNkU=;
        b=e5UgwhFCHpSgNj+zWFi0BHRXnnsO7sYi2dYM6gWKhFcFGAkQIHBV0DbgZPpXSxHlNS
         691bgTO2Sr+iiCaLf5XMmDFrhI7X8s0XPYeczSEYRMxHmUCWWr5KOBO87evxmWMi7FqQ
         81W0zS2o8cGG2cSOYKBMojrcm/CmaxhtaFHYEiWG4rVC9eak0fxFs3HvPM9UJviV9lmS
         l+7ml68sOXXJ+VaL5j8l0WaVBwRGxiNh8LI1OnLOz129By2o7dQ4n2r7auZocPfaIUEH
         JKCqcJyLs/O+yLWhqhTBuq84c7EVxt2SxoJm/pLt2AdGKwYEZA0qf+yQ0jiHufXrMCWE
         de4Q==
X-Forwarded-Encrypted: i=1; AJvYcCXRSFIiSn3QZ+2jcR4lc2G33xFD5ITPEpTI01yqTQc7emUcya29ajDFW4eC4mrvNsjVtmMCuIgNiZSCmA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxWNFub7LtO76AE9s8iAMlfIk1tkQ/i5z8x4kzxtcqL35fgy1sv
	Ua4Tk8AFqHDBIqiQU9WKMetxRzU0sYNEHiu3b+7cdSeFkck9vopTzIdWS+GnX1dv1ps1kVpCOi+
	qlbmTx0JrCFimrbQjjJ3/MmGSxiJ7xSgw6nTclz7FTm4tzH6ucBmfJmgBi+B9a8Xi39z7Co4VV/
	q3CRdQysL5Du/P5SgUmG5eeTWPO1xz2Ni0xmhQhjapNzl4uLttigTXtAZc
X-Gm-Gg: ASbGncvfjwBHWJNvZxXZZw6Dw99GTaD9JBZevRJHGu+cgjui2d3PaGRIrboAepEE7T8
	Nt720ADAxNeOLwhtp7nxUbpz7QLwHgfAoLWvyAmXgA/CdAfUzSMqzB1BrV6I/
X-Received: by 2002:a05:6820:1e10:b0:5f1:dc89:fa85 with SMTP id 006d021491bc7-5f25b131ff8mr4435724eaf.3.1733325569641;
        Wed, 04 Dec 2024 07:19:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEYwLk9Qr3DA7xA9lz+xOHZPQK14U34Jh9h4Le9KlnSbh+Bl4LotmHax0+v3W1xjiGt64wfnRfDdpr4eIKywwE=
X-Received: by 2002:a05:6820:1e10:b0:5f1:dc89:fa85 with SMTP id
 006d021491bc7-5f25b131ff8mr4435690eaf.3.1733325569341; Wed, 04 Dec 2024
 07:19:29 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 4 Dec 2024 15:19:28 +0000
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241204111424.263055-1-bigunclemax@gmail.com>
References: <20241204111424.263055-1-bigunclemax@gmail.com>
Mime-Version: 1.0
Date: Wed, 4 Dec 2024 15:19:28 +0000
Message-ID: <CAJM55Z-YAMtRN=K5KxCH1+++Xw4uMM_c49z8tGzi3snU+-KrYA@mail.gmail.com>
Subject: Re: [PATCH v1] riscv: dts: thead: Fix TH1520 emmc and shdci clock rate
To: bigunclemax@gmail.com
Cc: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_071941_454623_76A799BA 
X-CRM114-Status: GOOD (  23.64  )
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

bigunclemax@ wrote:
> From: Maksim Kiselev <bigunclemax@gmail.com>
>
> In accordance with LicheePi 4A BSP the clock that comes to emmc/sdhci
> is 198Mhz.
>
> But changing from fixed-clock to CLK_EMMC_SDIO leads to increasing input
> clock from 198Mhz to 792Mhz. Because the CLK_EMMC_SDIO is actually 792Mhz.
>
> Therefore calculation of output SDCLK is incorrect now.
> The mmc driver sets the divisor to 4 times larger than it should be
> and emmc/sd works 4 times slower.
>
> This can be confirmed with fio test:
> Sequential read of emmc with fixed 198Mz clock:
> READ: bw=289MiB/s (303MB/s)
>
> Sequential read with CLK_EMMC_SDIO clock:
> READ: bw=82.6MiB/s (86.6MB/s)
>
> Let's fix this issue by providing fixed-factor-clock that divides
> CLK_EMMC_SDIO by 4 for emmc/sd nodes.

Thanks for finding this bug!

However, this feels like a work-around for a bug in the clock driver, and even
if there is a fixed factor divider somewhere this should probably be modelled
by the clock driver. Did you look into the documentation[1] and try to figure
out where eMMC clock comes from and where the /4 is missing?

There is also a vendor tree somewhere with a much more complete clock driver.
Drew do you remember where it is? Maybe it's worth looking at how that driver
models the eMMC clocks.

[1]: https://openbeagle.org/beaglev-ahead/beaglev-ahead/-/blob/main/docs/TH1520%20System%20User%20Manual.pdf

/Emil

>
> Fixes: 03a20182e1e0 ("riscv: dts: thead: change TH1520 mmc nodes to use clock controller")
> Signed-off-by: Maksim Kiselev <bigunclemax@gmail.com>
> ---
>  arch/riscv/boot/dts/thead/th1520.dtsi | 14 +++++++++++---
>  1 file changed, 11 insertions(+), 3 deletions(-)
>
> diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> index acfe030e803a..6c20965cd10c 100644
> --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> @@ -229,6 +229,14 @@ stmmac_axi_config: stmmac-axi-config {
>  		snps,blen = <0 0 64 32 0 0 0>;
>  	};
>
> +	sdhci_clk: sdhci-clock {
> +		compatible = "fixed-factor-clock";
> +		clocks = <&clk CLK_EMMC_SDIO>;
> +		#clock-cells = <0>;
> +		clock-div = <4>;
> +		clock-mult = <1>;
> +	};
> +
>  	soc {
>  		compatible = "simple-bus";
>  		interrupt-parent = <&plic>;
> @@ -328,7 +336,7 @@ emmc: mmc@ffe7080000 {
>  			compatible = "thead,th1520-dwcmshc";
>  			reg = <0xff 0xe7080000 0x0 0x10000>;
>  			interrupts = <62 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_EMMC_SDIO>;
> +			clocks = <&sdhci_clk>;
>  			clock-names = "core";
>  			status = "disabled";
>  		};
> @@ -337,7 +345,7 @@ sdio0: mmc@ffe7090000 {
>  			compatible = "thead,th1520-dwcmshc";
>  			reg = <0xff 0xe7090000 0x0 0x10000>;
>  			interrupts = <64 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_EMMC_SDIO>;
> +			clocks = <&sdhci_clk>;
>  			clock-names = "core";
>  			status = "disabled";
>  		};
> @@ -346,7 +354,7 @@ sdio1: mmc@ffe70a0000 {
>  			compatible = "thead,th1520-dwcmshc";
>  			reg = <0xff 0xe70a0000 0x0 0x10000>;
>  			interrupts = <71 IRQ_TYPE_LEVEL_HIGH>;
> -			clocks = <&clk CLK_EMMC_SDIO>;
> +			clocks = <&sdhci_clk>;
>  			clock-names = "core";
>  			status = "disabled";
>  		};
> --
> 2.45.2
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
