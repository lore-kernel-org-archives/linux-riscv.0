Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B27CE7C4E7
	for <linux-riscv@archiver.kernel.org>; Wed,  4 Oct 2023 17:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zP9+5qgYyWuUWTrDQ3RR9GjamQkVyQxYQk4OyUMENKQ=; b=Lqg0oTTmd+gaJs
	y0D4wQIrGmjNjA9o6qwjapU/oPAXznIKCiAbsS175NL6dMd9nw2SCZXCDCa+6O6bV4yumvfseOuR1
	d+YF1md0tXmThNkuWI65MUHDlFc2O1jDzo/uaV470ce9Mwt2rLrtApDlZ2b+Cp/G1YTTa18OnX++U
	Az0pT7O8MqWtzcXwXm3na30+yGOkQ0Yl2ajGOjhCkGSFEmNDaU4Isr27O1g+QpRy8XkjX4AJWXwZv
	KnywHuKQOhjrTwj3YGAebGAcYPD9mx6p7IdzuudQ7+3iJZRtzFbD8gCIUI8IMallp8NlZdHmDYbyS
	H5NVJpdrHadP3QEJ0wRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5tn-000cz4-0p;
	Wed, 04 Oct 2023 17:43:03 +0000
Received: from mail-pl1-x62d.google.com ([2607:f8b0:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qo5ti-000cyG-29
	for linux-riscv@lists.infradead.org;
	Wed, 04 Oct 2023 17:43:01 +0000
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1bdf4752c3cso17473825ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 04 Oct 2023 10:42:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1696441377; x=1697046177; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PAz1DFCYnOrFN4tIroBsTa6sPFO/dCrdBUsEUFQEyNU=;
        b=auCFCR8W/thiKqIWf52SAw2WgydfosaqLjVzfu1j6OeifILbgbKmkVdkQ4yCbaVtsa
         ubN6W+EVOQ6XGzwkZDW39iKKUr++whs+m+6/JWYZ8bE+IavAoAS2lfYqZBPNsh0yQ5m/
         iDLSb7PEZnGaZgAsEhTkzH+KBBphpqB7ENpRAJMma9kvykNjU08BzGQBJQmZhqKg1+Hx
         sDGKaiDXsFtaSg0D9b/23ThEp2OvmOna5bR0uUXIoTg52Ir6iXnenYdmfJSHlckFX/F5
         vjwx8UIcjK/0wghqr41Rxf+QQjyp+6J3p+YRRJbHD0R3Zs0f7mQ2O6s/43hWmTDuC5Zp
         4yow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1696441377; x=1697046177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PAz1DFCYnOrFN4tIroBsTa6sPFO/dCrdBUsEUFQEyNU=;
        b=xQ71iQR0Na3sk6atwPHtGqwi6O3HLExLOuRKsG2MUHq1TZWmGi31XFlJxvJJVyuc/t
         wI+jSmVh9XCT6TUp7GQJg0WqxPi1ltZYdm0nQu8zAbQ9N6Z6hMFsdVHJRhqbjglX4X3j
         FbkA95TT14nyk0Ahx4g7YtJabkPpS+7N0eqdNdfG1sgwrZGrtAJbj4UAjrbX1dDF3Q7B
         TZPU3ZRUVVj04jOlVlkD5pgoLWZhaMQle65rkwwM2SIoqwSg8xuqrDzygMNL8GG+uyUo
         nhAPK65okhvUQ7iPPZ7XvctkhHl5fbxfOFGE5gC65v41gF2Fg3JdrMr8hwsky6yzCqGN
         VGFQ==
X-Gm-Message-State: AOJu0YwLJkmW/9d+dExSaA+J6LuvytGKIg0s04IA+LngkrIzmPOuOnAv
	Wur4EBYgynhOsiuX6+FoaN3lzA==
X-Google-Smtp-Source: AGHT+IGCU8SV8LgeVtV8MEhdZCojuC38BkViH9No+0IHftNGmQ/M48mEVbfFLmkXJV2TQfY+9EjP+w==
X-Received: by 2002:a17:903:25c3:b0:1c5:76b6:d4f7 with SMTP id jc3-20020a17090325c300b001c576b6d4f7mr2813402plb.36.1696441376967;
        Wed, 04 Oct 2023 10:42:56 -0700 (PDT)
Received: from x1 ([2601:1c2:1800:f680:95a1:7b5c:a766:5db1])
        by smtp.gmail.com with ESMTPSA id c1-20020a170903234100b001b9c960ffeasm3993160plh.47.2023.10.04.10.42.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Oct 2023 10:42:56 -0700 (PDT)
Date: Wed, 4 Oct 2023 10:42:53 -0700
From: Drew Fustini <dfustini@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>
Subject: Re: [PATCH] soc: renesas: make ARCH_R9A07G043 (riscv version) depend
 on NONPORTABLE
Message-ID: <ZR2kHfUXmQ9jwQC9@x1>
References: <20231004150856.2540-1-jszhang@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231004150856.2540-1-jszhang@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231004_104258_922948_34B1D939 
X-CRM114-Status: GOOD (  23.44  )
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

On Wed, Oct 04, 2023 at 11:08:56PM +0800, Jisheng Zhang wrote:
> Drew found "CONFIG_DMA_GLOBAL_POOL=y causes ADMA buffer alloc to fail"
> the log looks like:
> [    3.741083] mmc0: Unable to allocate ADMA buffers - falling back to standard DMA
> 
> The logic is: generic riscv defconfig selects ARCH_RENESAS then
> ARCH_R9A07G043 which selects DMA_GLOBAL_POOL, which assumes all
> non-dma-coherent riscv platforms have a dma global pool, this assumption
> seems not correct. And I believe DMA_GLOBAL_POOL should not be
> selected by ARCH_SOCFAMILIY, instead, only ARCH under some specific
> conditions can select it globaly, for example NOMMU ARM and so on,
> because it's designed for special cases such as "nommu cases where
> non-cacheable memory lives in a fixed place in the physical address
> map" as pointed out by Robin.
> 
> Fix the issue by making ARCH_R9A07G043 (riscv version) depend on
> NONPORTABLE, thus generic defconfig won't select ARCH_R9A07G043 by
> default. And even for random config case, there will be less debug
> effort once we see NONPORTABLE is enabled.
> 
> Reported-by: Drew Fustini <dfustini@baylibre.com>
> Closes: https://lore.kernel.org/linux-riscv/ZRuamJuShOnvP1pr@x1/
> Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required configs for RZ/Five SoC")
> Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
> ---
>  drivers/soc/renesas/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
> index 5a75ab64d1ed..12040ce116a5 100644
> --- a/drivers/soc/renesas/Kconfig
> +++ b/drivers/soc/renesas/Kconfig
> @@ -333,6 +333,7 @@ if RISCV
>  
>  config ARCH_R9A07G043
>  	bool "RISC-V Platform support for RZ/Five"
> +	depends on NONPORTABLE
>  	select ARCH_RZG2L
>  	select AX45MP_L2_CACHE if RISCV_DMA_NONCOHERENT
>  	select DMA_GLOBAL_POOL
> -- 
> 2.40.1
> 

Tested-by: Drew Fustini <dfustini@baylibre.com>

With this patch, I can use the defconfig and sdhci-of-dwcmshc driver is
able to use ADMA mode without needing to add shared-dma-pool to dts:

# zcat /proc/config.gz |grep DMA_GLOBAL_POOL
# dtc -I fs /sys/firmware/devicetree/base/ 2>/dev/null |grep pool
# dmesg |grep ADMA
[    3.910269] mmc0: SDHCI controller on ffe7080000.mmc [ffe7080000.mmc] using ADMA 64-bit


Thanks,
Drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
