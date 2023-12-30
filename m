Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E687C4706F
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Dec 2023 02:42:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=7cshUmM3uqdWRaCa4nJj6smJ6SYvBFCq/aITI3YGIRc=; b=FPGZxDK6yBMgKzFdtX7bIKLsc9
	/leJRtV9JM7WGUT01h4O3SSkiGk5mHawjATVSl6yDKTdpemlE4H0PdOJVtrI05on5veM9o3z5hm6j
	R5AnKG5MemPygSEf8yvpjZeQ+UUq3lxm0JBdQz7fyo7cWdE2BvjVHf7ehJed1iC0i78hXLy7ipvtA
	qp8AswNi/JppiDt5OSUDKuvoPGx06nut7SgQ3wdP1OETnHPfPv6N9yDI0DJxKzJ2Ps4GJZi1+uXa5
	6nYv6J2Gbf/RwF9g+xeoEbiICcsPOM4NRoJ/AjrrxOUO3JaXTERChvrLJFHsnmSr3TZ8Rhd8iu0UD
	2XzHgfwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rJPIk-0020uv-2Q;
	Sat, 30 Dec 2023 02:42:14 +0000
Received: from mail-oi1-x232.google.com ([2607:f8b0:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rJPIg-0020sN-1W
	for linux-riscv@lists.infradead.org;
	Sat, 30 Dec 2023 02:42:13 +0000
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3bbbdf0b859so2920645b6e.3
        for <linux-riscv@lists.infradead.org>; Fri, 29 Dec 2023 18:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1703904122; x=1704508922; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PkMRDEc3q7i96HgJAw1IRoh+BsMy8VlyiKEtAyjrTsc=;
        b=FBNG/iexlJ8oChSEb5m/h4wrL2Mz1hB9xhpaHNGzTOryvxJObZ9UHpauLNG4W+eYan
         Swx+aGpzzZ7poifCno3jKgd9sDmQhzCBGkmXJdKU1J/o8YL7Y6jcq4Qgo3Rks9dxPx7L
         IurxiIbk0rLipM1rOfF3liEAnrQWvIHQCWSkp6bRLKQmaFYqe0hpJpcqTwNeyiaHvyPY
         04RoQ6SCWyA5lMKcqSm9Anbv1OEOMo91HmgP/seLW43h+JMWDK2IwJpEKBhwVKhTjmrS
         YdSw98U+uD2piyGXjRoJLZ5iOuN/ITD2G1hb28MXzwFhweHwcFW27wxxkALngqNg5Wmu
         rO+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703904122; x=1704508922;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PkMRDEc3q7i96HgJAw1IRoh+BsMy8VlyiKEtAyjrTsc=;
        b=pN52GPOfcmcut2jlgqzrzfbmEdJKfd4Eo0qW0maDmD6vlYCWNNPlGrkKheUOAYCEsv
         f3h6Mq+9H1wGsvIOZzrrtTIjMYECe/O3wR5VvqPvB2PQA2pnVV1UbXd/vq0kDYoGfK3X
         VsH/SB2ozozOrtEXrJku+SApdigbbuVZ+j9tbNQahT+DMtO2pkfGY6fWlsiH16Z50D9V
         qFRYAQCql/FCi21r761dT1IdqMAyT1s4Rzp6O0tpeZt0YFM4hliLWdHZysEGUpstsaqy
         1GR1AzXTGwT0+Cl0YdudHu8w+jDYPcPf7C3b+JLi7uxqmOcAs69Py8ZhG64GcdOyDGLB
         58LA==
X-Gm-Message-State: AOJu0YxKfXCheDNGD1+/UwEg26B/d2/0p5UvxCsIOoOj985HfkRW1rnV
	Ex0/9FY5amvGVWc5kC2vQuPpQJ/5MW7eEA==
X-Google-Smtp-Source: AGHT+IE2LtcyOE7VGF7LqxlgOpp/gooJgjcVuO2l8WC7IBsT5j/W/mrEzafOXAobKw1fwRCfOs5KKQ==
X-Received: by 2002:a05:6808:e8c:b0:3bb:edf8:c497 with SMTP id k12-20020a0568080e8c00b003bbedf8c497mr1147353oil.71.1703904121807;
        Fri, 29 Dec 2023 18:42:01 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id c18-20020aca1c12000000b003b3ec15d8ebsm2648397oic.5.2023.12.29.18.42.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Dec 2023 18:42:01 -0800 (PST)
Date: Fri, 29 Dec 2023 18:42:01 -0800 (PST)
X-Google-Original-Date: Fri, 29 Dec 2023 18:41:57 PST (-0800)
Subject: Re: [PATCH v7 1/4] riscv: defconfig: Enable mmc and dma drivers for T-Head TH1520
In-Reply-To: <20231129-th1520_mmc_dts-v7-1-c77fc19caa6f@baylibre.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  jszhang@kernel.org, guoren@kernel.org, wefu@redhat.com, Conor Dooley <conor@kernel.org>,
  robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, jkridner@beagleboard.org,
  robertcnelson@beagleboard.org, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
  devicetree@vger.kernel.org, dfustini@baylibre.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: dfustini@baylibre.com
Message-ID: <mhng-577f4913-06ac-4f80-8793-6336132d503e@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231229_184210_700426_D4494EC2 
X-CRM114-Status: GOOD (  15.57  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 29 Nov 2023 17:48:47 PST (-0800), dfustini@baylibre.com wrote:
> Enable the mmc controller driver and dma controller driver needed for
> T-Head TH1520 based boards, like the LicheePi 4A and BeagleV-Ahead, to
> boot from eMMC storage.
>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>
> ---
>  arch/riscv/configs/defconfig | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
> index 905881282a7c..e635dc9d1997 100644
> --- a/arch/riscv/configs/defconfig
> +++ b/arch/riscv/configs/defconfig
> @@ -214,6 +214,7 @@ CONFIG_MMC=y
>  CONFIG_MMC_SDHCI=y
>  CONFIG_MMC_SDHCI_PLTFM=y
>  CONFIG_MMC_SDHCI_CADENCE=y
> +CONFIG_MMC_SDHCI_OF_DWCMSHC=y
>  CONFIG_MMC_SPI=y
>  CONFIG_MMC_DW=y
>  CONFIG_MMC_DW_STARFIVE=y
> @@ -223,6 +224,7 @@ CONFIG_RTC_CLASS=y
>  CONFIG_RTC_DRV_SUN6I=y
>  CONFIG_DMADEVICES=y
>  CONFIG_DMA_SUN6I=m
> +CONFIG_DW_AXI_DMAC=y
>  CONFIG_RZ_DMAC=y
>  CONFIG_VIRTIO_PCI=y
>  CONFIG_VIRTIO_BALLOON=y

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case folks want to keep this with the DTS updates.  Thanks!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
