Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D6F3C27C53
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Jun 2024 09:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=+PBN1GX5qexXRH/T/hQ7isW94nyK4p8UdYOfAeA5GuM=; b=NQO7gTPrQoOhBYYfb+c2rZWDaf
	YWh0gdVkpAKHVJ79VVrriFpK+FygT2r0Hb/KK8Ln8y3goAs44s0X6sK5Z/Cv7MK4ljLUOlr28DgFL
	6/+NnPp8O8357ztcorgaz3RsAqw8t2VpZ8XgsXkf5alEXtse7rQVfkc9bqXjoXZh1HCT9yF9YcH4r
	ZNt7EYUvn54lNGRh+Ws4tbRDgxlypPGiRhY3HkgbwH3GRoKKUoM/4Z4GX+Z+kQgB13lhXZCkCbQws
	6NY+F6K1hUwQSCwJy+jSwnn/xOCf+hMG7byfQ3CzpHdM5JU50DOGfpQ92gvjuT6jjYhABBanydMKT
	nEAQaaMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKIW-0000000Bzgb-2VSa;
	Wed, 12 Jun 2024 09:29:40 +0000
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sHKIT-0000000Bzfx-2tqB
	for linux-riscv@lists.infradead.org;
	Wed, 12 Jun 2024 09:29:39 +0000
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 4A0AB40C8C
	for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 09:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1718184576;
	bh=kUwA32L35nw4VQIIPpcQ67EWF3RQ5dZhklB3PwVT3Xo=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=kJlWyiwsTZ0S61XQMeYa0n7V13B5Sp53FvGYsadqgNHK5Ro1OhTV8OXA6oOjPBBH7
	 hY0df4oBeGlWaMb0WqPeuZd4I/3B0/cL0RkCKabq3XeAlT7miC3FZQ62WnWpUZ4fCQ
	 3ploLgvmFJXloZhB4OP11W+SHFef4OS5FvUCGGKxr69IwQfkUTM63uMVvM1ck1tw7d
	 MqBwoI4Ds3F8CviJEQpfJAixNDtXl2cT9hb50adM0VrUsXo6owS9/lRaSxlwRsKqOz
	 V0rkoVEqYdpOanim6W6PylcfAyuo/tEk2jz89TIfv8i/0xdq/v0fRxvRHno4Y4VJTR
	 uowoiKYNUjWew==
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-43fd36ca920so67209701cf.1
        for <linux-riscv@lists.infradead.org>; Wed, 12 Jun 2024 02:29:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718184575; x=1718789375;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kUwA32L35nw4VQIIPpcQ67EWF3RQ5dZhklB3PwVT3Xo=;
        b=JaWFHS7i2vC3BqNZrFbJUzFwGUepMpYr3y35suWO++I6NPI3caJdwTYfDFjqvpzrY8
         e9Agb8iQXrNny4Vi1KAOCMAQNeCZU+ipy2RGewgEeBLfZPxySppF9+Lc6WvK0Tsxtz+h
         NHI2EC1UwPDyL82vCrceYyGgtONEvNRF/kC35yJBxSAyuN8CeUzaYbnxqLiNorPPsWnI
         QHlZCyraHvXfKyHDmAOQEU5Wq60SQIT0j3wIEnC7iEfm8wl/JQszT5/R7X/qBpHj3mIM
         HEaIPq+Fqw2rBjyNlOXkx9+BjQvGP5XlgNKeiI9zik7+IHM7at0RvxTQkjMsvcYS3Q8B
         f5wA==
X-Forwarded-Encrypted: i=1; AJvYcCUWnqmi8MOizPsYu9mMpPLUf5IWUkNYNVs9KY/8DmM3GEFgyJSFjvtsvHOW1rqGcNjNIanDurrcYvdnK5ilgxqCgQZg3EheGqTZBlGbRmrJ
X-Gm-Message-State: AOJu0YxYtvRCeNhvkzBHBFYr5Mqyv4IxsXTcOIitIjToE2kvmPXgrZei
	K+N2RpxJf+zVCqqQjaRTjIr0MIZXQjXaM1HoQZnhCxqYE5KIjbbPZqyBTHXYrGuGlLSWiqjxMMX
	djjwrrXYCEIubbKAWoH/s8weiJkz1wufJ6YdINZYKESq/YQSPWF/2TgVasVZnMYus/Pz7l4Oj5s
	y8lM7olq1bhdifzZV1ORUnxSvk5fy6ECbvY4kiuHQO6hnF953P+iDmQ8wD
X-Received: by 2002:ac8:7d16:0:b0:441:56cb:98e6 with SMTP id d75a77b69052e-4415abcbc24mr13974011cf.4.1718184575312;
        Wed, 12 Jun 2024 02:29:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyeSYlvQmdBPGei7wG+gbHZU+qCnBgf8EqYPmHBFL2wCKfa/pLQHu7jghaF0xyya5oj383e/rAxicZxFwepHM=
X-Received: by 2002:ac8:7d16:0:b0:441:56cb:98e6 with SMTP id
 d75a77b69052e-4415abcbc24mr13973711cf.4.1718184574752; Wed, 12 Jun 2024
 02:29:34 -0700 (PDT)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 12 Jun 2024 02:29:34 -0700
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20240610-crux-unloaded-93b701646454@wendy>
References: <20240610-vertical-frugally-a92a55427dd9@wendy> <20240610-crux-unloaded-93b701646454@wendy>
Mime-Version: 1.0
Date: Wed, 12 Jun 2024 02:29:34 -0700
Message-ID: <CAJM55Z-0f+SZpdZ_h=OZxEkXF-2RMXDoh4Qs+0SBe7opnWCJ2Q@mail.gmail.com>
Subject: Re: [PATCH v1 3/5] RISC-V: Add an MPFS erratum for PCIe
To: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org
Cc: conor@kernel.org, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Daire McNamara <daire.mcnamara@microchip.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Samuel Holland <samuel.holland@sifive.com>, devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240612_022937_881135_EDCD31D3 
X-CRM114-Status: GOOD (  30.40  )
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
> On PolarFire SoC the PCIe root port is limited to 32-bit addressing
> (both when acting as an AXI-Slave and as an AXI-Master) due to how it
> is connected to the processor core complex via a Fabric Interface
> Controller (FIC), rather than being part of the Microprocessor Subsystem
> (MSS) like the other hard peripherals.
> The AXI buses between the FIC and the MSS are true 64-bit buses, but the
> PCIe root port is (effectively) only attached to the lower 32-bits of
> each bus. As PolarFire SoC is an FPGA, several of Microchip's customers
> that did not want to suffer the penalty of bounce buffering inserted a
> "shim" in the FPGA fabric that would alter the address of the AXI-S
> transaction on the return path to the MSS (conceptually moving the 4GiB
> range that the root port can address via the AXI-S interface around
> 64-bit space to better cover where those customers had placed their
> DDR). PolarFire SoC has a memory map with various apertures into the
> physical DDR, and depending on the MSS' configuration, the FPGA design
> can control what physical memory addresses back each aperture.
>
> The main apertures, which are cached memory, lie at 0x10_0000_0000 and
> 0x8000_0000. There are also non-cached apertures at 0xC000_0000 and
> 0x14_0000_0000. The "default" configuration is to have each of apertures
> overlap.
>
> Some use-cases add a shim to the FPGA fabric that will re-route
> transactions from the 0x10_0000_0000 region to avoid bounce buffering
> for 64-bit addresses or because the aperture at 0x8000_0000 does not
> correspond to usable memory (perhaps an AMP context is using it or the
> designer chose not to place memory at the aperture's physical address).
> Other user-cases re-route them to the non-cached region at
> 0x14_0000_0000. If the latter is done,
> DMA for the PCIe root ports become non-coherent. Such a scheme is only
> possible because the SiFive ccache on PolarFire SoC can perform flush
> invalidation of the L1/L2 cache for these types of configuration.
>
> Add an Erratum to support this second type of configuration. Like the JH7100's
> non-coherent DMA option, this requires use of DMA_GLOBAL_POOL and is
> therefore incompatible with Zicbom.
>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

> ---
>  arch/riscv/Kconfig.errata | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
> index 2acc7d876e1fb..0a9e13efbe6b5 100644
> --- a/arch/riscv/Kconfig.errata
> +++ b/arch/riscv/Kconfig.errata
> @@ -21,6 +21,25 @@ config ERRATA_ANDES_CMO
>
>  	  If you don't know what to do here, say "Y".
>
> +config ERRATA_MICROCHIP
> +	bool "Microchip errata"
> +	depends on ARCH_MICROCHIP
> +	help
> +	  All Microchip errata Kconfig options depend on this option. Disabling
> +	  this option will disable all Microchip errata.
> +
> +config ERRATA_POLARFIRE_SOC_DMA_NON_COHERENT
> +	bool "Non-coherent DMA support for PolarFire SoC"
> +	depends on NONPORTABLE
> +	depends on ERRATA_MICROCHIP
> +	select DMA_GLOBAL_POOL
> +	select RISCV_NONSTANDARD_CACHE_OPS
> +	help
> +	  Enable support for non-coherent DMA on PolarFire SoC.
> +	  This support is not required for any peripherals in the MSS, but may
> +	  be required for peripherals in the FPGA fabric and is required for
> +	  the PCI root port to operate correctly, due to addressing limitations.
> +
>  config ERRATA_SIFIVE
>  	bool "SiFive errata"
>  	depends on RISCV_ALTERNATIVE
> --
> 2.43.2
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
