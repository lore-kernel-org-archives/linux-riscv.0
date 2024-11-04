Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4009D132DE
	for <linux-riscv@archiver.kernel.org>; Mon,  4 Nov 2024 15:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=24iE4cnPdODTkRl9Yjya/6UJu3V3j5qBnkw4LZzT3Kw=; b=ecaP06x6ZPztb5vxSPrk/ABQox
	fML2W7z9VAT787NPvnCGkJG9/izQnzGwFcB0vqpNjpUP1qmF6T6vAU7J40oLiVJvLJsIwL6GuxcL/
	8ZfHh5HNk8ucKrUoVISMGZOOhs3HmA5/nXRKzTy7JF0xJV8NSMaKlRxPdf05G/lzpYCKRKyecGBtl
	uskdYvEgQ0Fi6tLJNFGVPhSMNTFEmOkYH154k0R5QfLwTrzm9B+NPJS8E6jgb0MZQa1kVzGFaopn7
	aZpprY5C3HQ27MA0WSiXZqLwgs+Ym55KmrhsxPrC0MYfHwdxqdyDwh5cz1QNlhjBdmJtyjrkzYqVG
	ddCVDj8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7z5k-0000000EDp2-3J6x;
	Mon, 04 Nov 2024 15:34:08 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7yy4-0000000ECZ6-2GHI
	for linux-riscv@lists.infradead.org;
	Mon, 04 Nov 2024 15:26:14 +0000
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EC1103F28A
	for <linux-riscv@lists.infradead.org>; Mon,  4 Nov 2024 15:26:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1730733967;
	bh=nLr3ejFwtoxSfGD1Ta6KgkGyD7K+B1kTs0x5zuGkEZk=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kVzrRKxlsAvcQ3jCLNGGtXvEV5QYknKX2pgQ2w2m4AZV5GQso5vCArh3wQzjsquac
	 ZAYJGg2JJjLAc6gVntmxz7MXeGyeIn3phYGCud1GeEdHUPaayHPC8byy5QITjXu8JZ
	 YysEpPIAPQArKSTZz/CKTmLUw7rQyVf4JtlyxqhuvOZF1uwONYla3d2beEqAau9qGC
	 3Y5r/ORdwVxziQKCcDVTGDrGAo6BcnryvBS6KYh6wAG8evWjuvGi6hcDcPNrqH8BGX
	 jbOZ3Y+hOj3Pu0XYFnSLUTIKFeTfUFiQ2V6a7OZ2TGFhgLAplN3mljlbYYeiaIZlB0
	 5qq4aMga/BmdQ==
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-2885c5af51cso6426822fac.3
        for <linux-riscv@lists.infradead.org>; Mon, 04 Nov 2024 07:26:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730733967; x=1731338767;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nLr3ejFwtoxSfGD1Ta6KgkGyD7K+B1kTs0x5zuGkEZk=;
        b=uDcdV86K4JvZnI54WD93gHZ4FDUH0AsfwEIoGO9JnB7kMAgIXd2JYnLZIekALJz88K
         Gto6G5ARN6npkuri52pRCR2g+r0RgOivJUkakFBdiKIsMGUC5xoJdKP6cKJdeC/6LPe2
         bXxX1doRpXoFU/bCtlZKfL0kb7wMj/Y2oSYFnyM7oAKz9OWbgrejRJVV1weTezX2Ohuu
         UMkmOwDvdoBxEy7cXRjD7dmfGY8tJygSrcv3uxsXPmfWLeu7uWqwqtbfRzwFKjHn4G0E
         qWKSbHAR64VgIjPKP741Cwo51fthRHUaeYYW8qNKodh2E8ZOU4tgwIjgMR3Sw2IIdkzQ
         E9Tw==
X-Forwarded-Encrypted: i=1; AJvYcCU2nPGT/gG5VpVktb0nZ77HaietqgtGSXquhYc7pe5Pc0xXSSHHQbTkSaecBzfEek2ykJUyUw45vJ9LJg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx+zcnPCeRsmCPKDGrHO/CnDiCAx3x/BOGQQn2OIE2d0bkRNLqe
	wOF2NyAY/DcGCTceEs4b2V+U7v8KMNXxGSUJUCAlZ/cHVcRAuGfcKoWE3VVxmdMQx8BsQy6n2nO
	0r9BFQSp2OnFikGYJErpy0ZewKXekDxIDuKQc/Ppkk9E4YUFqUGRkeapUmW4IvKa9F7nTrN/5rX
	WIMriLwaPYrENPDiTkV6HbwoNPIESu+Ip2IQbYM7HnMWjuAuBcj7lviJzk
X-Received: by 2002:a05:6870:288b:b0:288:9adc:3670 with SMTP id 586e51a60fabf-2949f014f50mr9303470fac.29.1730733966805;
        Mon, 04 Nov 2024 07:26:06 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFI6nEYtynrseYyifqqJ8kASO1RznklWY9IpKRVpE1rUdJvI3XiQYgw4TZWQo4G/Mik6kNigtEeGNqK5f7LQ4I=
X-Received: by 2002:a05:6870:288b:b0:288:9adc:3670 with SMTP id
 586e51a60fabf-2949f014f50mr9303458fac.29.1730733966540; Mon, 04 Nov 2024
 07:26:06 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 4 Nov 2024 07:26:06 -0800
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20241102000843.1301099-12-samuel.holland@sifive.com>
References: <20241102000843.1301099-1-samuel.holland@sifive.com> <20241102000843.1301099-12-samuel.holland@sifive.com>
Mime-Version: 1.0
Date: Mon, 4 Nov 2024 07:26:06 -0800
Message-ID: <CAJM55Z-caGvqZXDTtbj0LknAJVgj1s5_p0SaN3kJog1950L0yg@mail.gmail.com>
Subject: Re: [PATCH 11/11] riscv: dts: starfive: jh7100: Use physical memory
 ranges for DMA
To: Samuel Holland <samuel.holland@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	linux-riscv@lists.infradead.org, Conor Dooley <conor@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	Emil Renner Berthing <kernel@esmil.dk>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_072612_936429_92215492 
X-CRM114-Status: GOOD (  22.47  )
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

Samuel Holland wrote:
> JH7100 provides a physical memory region which is a noncached alias of
> normal cacheable DRAM. Now that Linux can apply PMAs by selecting
> between aliases of a physical memory region, any page of DRAM can be
> marked as noncached for use with DMA, and the preallocated DMA pool is
> no longer needed. This allows portable kernels to boot on JH7100 boards.
>
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
>
>  arch/riscv/Kconfig.errata                     | 19 ------------
>  .../boot/dts/starfive/jh7100-common.dtsi      | 30 ++++---------------
>  2 files changed, 6 insertions(+), 43 deletions(-)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 2806ed7916c7..fc2c7fb2caff 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -53,25 +53,6 @@ config ERRATA_SIFIVE_CIP_1200
>
>  	  If you don't know what to do here, say "Y".
>
> -config ERRATA_STARFIVE_JH7100
> -	bool "StarFive JH7100 support"
> -	depends on ARCH_STARFIVE
> -	depends on !DMA_DIRECT_REMAP
> -	depends on NONPORTABLE
> -	select DMA_GLOBAL_POOL

Hi Samuel,

Thank you for working on this!

The JH7100 still need the RISCV_NONSTANDARD_CACHE_OPS from the sifive-ccache
driver for streaming DMA, so if I just remove the 3 lines above instead of the
whole ERRATE_STARFIVE_JH7110 (and enable RISCV_ISA_SVPBMT) this series works on
my Starlight board.

> -	select RISCV_DMA_NONCOHERENT
> -	select RISCV_NONSTANDARD_CACHE_OPS
> -	select SIFIVE_CCACHE
> -	default n
> -	help
> -	  The StarFive JH7100 was a test chip for the JH7110 and has
> -	  caches that are non-coherent with respect to peripheral DMAs.
> -	  It was designed before the Zicbom extension so needs non-standard
> -	  cache operations through the SiFive cache controller.
> -
> -	  Say "Y" if you want to support the BeagleV Starlight and/or
> -	  StarFive VisionFive V1 boards.
> -
>  config ERRATA_THEAD
>  	bool "T-HEAD errata"
>  	depends on RISCV_ALTERNATIVE
> diff --git a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> index ae1a6aeb0aea..34885fe40e2d 100644
> --- a/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> +++ b/arch/riscv/boot/dts/starfive/jh7100-common.dtsi
> @@ -9,8 +9,14 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/leds/common.h>
>  #include <dt-bindings/pinctrl/pinctrl-starfive-jh7100.h>
> +#include <dt-bindings/riscv/physical-memory.h>
>
>  / {
> +	riscv,physical-memory-regions =
> +		<0x00 0x00000000 0x40 0x00000000 (PMA_RW | PMA_IO) 0x0>,
> +		<0x00 0x80000000 0x08 0x00000000 (PMA_RWXA | PMA_NONCOHERENT_MEMORY) 0x0>,
> +		<0x10 0x00000000 0x08 0x00000000 (PMA_RWX | PMA_NONCACHEABLE_MEMORY | PMR_ALIAS(1)) 0x0>;
> +

The size and placement of the DMA pool was kind of arbitrary but the above is
a feature of the SoC, so should be moved to jh7100.dtsi instead.

>  	aliases {
>  		mmc0 = &sdio0;
>  		mmc1 = &sdio1;
> @@ -42,30 +48,6 @@ led-ack {
>  		};
>  	};
>
> -	reserved-memory {
> -		#address-cells = <2>;
> -		#size-cells = <2>;
> -		ranges;
> -
> -		dma-reserved@fa000000 {
> -			reg = <0x0 0xfa000000 0x0 0x1000000>;
> -			no-map;
> -		};
> -
> -		linux,dma@107a000000 {
> -			compatible = "shared-dma-pool";
> -			reg = <0x10 0x7a000000 0x0 0x1000000>;
> -			no-map;
> -			linux,dma-default;
> -		};
> -	};
> -
> -	soc {
> -		dma-ranges = <0x00 0x80000000 0x00 0x80000000 0x00 0x7a000000>,
> -			     <0x00 0xfa000000 0x10 0x7a000000 0x00 0x01000000>,
> -			     <0x00 0xfb000000 0x00 0xfb000000 0x07 0x85000000>;
> -	};
> -
>  	wifi_pwrseq: wifi-pwrseq {
>  		compatible = "mmc-pwrseq-simple";
>  		reset-gpios = <&gpio 37 GPIO_ACTIVE_LOW>;
> --
> 2.45.1
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
