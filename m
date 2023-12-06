Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14DBCC4167B
	for <linux-riscv@archiver.kernel.org>; Wed,  6 Dec 2023 10:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:
	Mime-Version:References:In-Reply-To:From:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=jOYddx8s5hQUXEST0W57hDimIE/gGX7fzRUOZoGHfp8=; b=PJVNViyB/LhHV7qCUgyi/6jYKl
	iKLS6EVStuDj3SiQjuDmWQ7FlU9oqezRiBCEIh19NW/s4KhbDlIUJ4b1pFF3JjVL/kcJ3Z5U3sLqv
	kb787PNhKAtHx42Y/YiO2C5gc0RmtDdO9RucGcrmqfNuelZs5yNZr6rpaJ21kBHKtUh4iktCjFAoV
	Fe8a949v+IASB0EHffR8NodxIJytlCSVz+LRl15+EPsmvJHhfYbVQ4tfug/nG6E7LefJYpHLYnVV2
	rJHzUa6y+AO4QPoJdBOe9xpTlCFvRMHnYs0gk2zFxs6E5ISyAS+9JGqxherBxfplwfWnNTDPXXmmC
	K4M8zO7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoq5-009eWo-04;
	Wed, 06 Dec 2023 10:09:09 +0000
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAoq1-009eUf-2Q
	for linux-riscv@lists.infradead.org;
	Wed, 06 Dec 2023 10:09:07 +0000
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com [209.85.167.70])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A18C140821
	for <linux-riscv@lists.infradead.org>; Wed,  6 Dec 2023 10:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
	s=20210705; t=1701857340;
	bh=AqWoFNYysK0tdV0YeJun1QToBYa0Z8FAZWlnxm20ym0=;
	h=From:In-Reply-To:References:Mime-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type;
	b=DwjNPhfZjZKQJ+pkntTst/oUdOJNFj/v5hkG3IaDEMxg5WZoxj4DPbpxnZUPIWnsR
	 05Yde7hc9lOlRToLx2H9nF+XXLJVlf8HD0G6bjmq3bSO6uh3L9Fu3woVSie3yCo7Fb
	 uiUYFLxyjFD/t9pLvVoUs9c1pQdyPwtMNWzFDWMXpNNyxuCKa80lw80ZnZlAk/2XlA
	 hbicQ5ZqcXB6AVFWc60TnWxH51pnlAl93YSAOn63JucRvbGjIZb12zRw632hOPRczx
	 ZWbnQVEUhsIXEA43mzHw+dRnmZ6OZthy3qeJEnXeRluPk0iqHrR05gzPGAmPaYCS/E
	 GQnEWYOgj4AhQ==
Received: by mail-lf1-f70.google.com with SMTP id 2adb3069b0e04-50be2a0e81eso3753918e87.1
        for <linux-riscv@lists.infradead.org>; Wed, 06 Dec 2023 02:09:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701857340; x=1702462140;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=AqWoFNYysK0tdV0YeJun1QToBYa0Z8FAZWlnxm20ym0=;
        b=mWJ0F1hXWx9cO8snT27RazUxcA3EUpSaXUmeJH+qBTQq20lIAsuv9mC15UPihpV8q7
         R71qh4OqObDBXh3jlXU1VS8Qw6Coqv3xEWac2WkzU2xU11Is0xa/wZ1Aky/n0ac1Vvfr
         BFoeTuzATE1iFpNvSzCT+7FMcZiJ4LoHwAqhZ+d3E0OQxXEPB+BCrqPDTcH+dTZGHdoe
         6LuGU73XAs7sOJRbs3OxXTOnxYD2le81kx+Zt7pOQ78+Z/qmERz3vb5B+c6YSHfDntsU
         7gMl61C8d2aPjIG1gJBhqMZfUIksRGaxOCAbWEp6+3rxtIm11joxvQwwTOgsnzurpbEp
         DFqw==
X-Gm-Message-State: AOJu0YymSBGc3cSFDA7AhmHUSaxB+TkDA6nfGkY1SWCFYvWnJoUapM2F
	e97HyR1qhRSg5lLNy6ezS97ultL2NL2H1sJLoirQWaBZbmQRgUktaG+bvHTVEaEiSoY62l3FHOu
	VBawq6SnSApwOasRN2cANTUdFaEr61P38ORThJCi+1BquUpDuCIHE5NYPgnsUgw==
X-Received: by 2002:a05:6512:5d7:b0:50b:f32c:4d with SMTP id o23-20020a05651205d700b0050bf32c004dmr387795lfo.136.1701857339889;
        Wed, 06 Dec 2023 02:08:59 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEdJQnx21lgo677Y/w22hAazVC3Yypb1Mi9jGIFZ5ofssNYc7Abs2AMBwvoktWnU2ZF6MV9GexmQoAcnQyWfbI=
X-Received: by 2002:a05:6512:5d7:b0:50b:f32c:4d with SMTP id
 o23-20020a05651205d700b0050bf32c004dmr387775lfo.136.1701857339589; Wed, 06
 Dec 2023 02:08:59 -0800 (PST)
Received: from 348282803490 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 6 Dec 2023 04:08:57 -0600
From: Emil Renner Berthing <emil.renner.berthing@canonical.com>
In-Reply-To: <20231206-th1520_mmc_dts-v8-1-69220e373e8f@baylibre.com>
References: <20231206-th1520_mmc_dts-v8-0-69220e373e8f@baylibre.com> <20231206-th1520_mmc_dts-v8-1-69220e373e8f@baylibre.com>
Mime-Version: 1.0
Date: Wed, 6 Dec 2023 04:08:57 -0600
Message-ID: <CAJM55Z_sG2CFZo_MmeTCVz43rRBi9cbjajprWM8MspMZuF9tEg@mail.gmail.com>
Subject: Re: [PATCH v8 1/4] riscv: defconfig: Enable mmc and dma drivers for
 T-Head TH1520
To: Drew Fustini <dfustini@baylibre.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
	Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	Conor Dooley <conor@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc: Jason Kridner <jkridner@beagleboard.org>, Robert Nelson <robertcnelson@beagleboard.org>, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231206_020906_115834_E1DFD4E3 
X-CRM114-Status: GOOD (  11.50  )
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

Drew Fustini wrote:
> Enable the mmc controller driver and dma controller driver needed for
> T-Head TH1520 based boards, like the LicheePi 4A and BeagleV-Ahead, to
> boot from eMMC storage.
>
> Reviewed-by: Guo Ren <guoren@kernel.org>
> Signed-off-by: Drew Fustini <dfustini@baylibre.com>

Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>

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
>
> --
> 2.34.1
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
