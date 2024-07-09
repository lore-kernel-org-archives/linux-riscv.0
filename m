Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2874C3DA41
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 04:50:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CKGXdFdci1v5KfQu05KgnpaL3FSqhP7YsbAZZ174ons=; b=f6fA0qx6TV5eOP
	cCY1jnqL8mXV8zd2V+U2ONhQpJzVcDbgN+ETORt3R+d8zNVBtxpJzX5oCML6nuR/DnKjaWP1PPhBB
	oWKPO4z/s8lwOZ7s5xp2htEYiW5l966oK5oO3SFCJAUtDjnY72/rM+5ciIgFq6YQlT4pPu14NRQDE
	eZszswQ8rr1HJ2PWkAWZ++lGbILoPFihKete62o8TvBngnWD29jgf6BJasGjFYTs+GOK1+0QK5ov/
	eznwEbkY4jQkxug2YJiir9sCDd1+QYkIbJeFWfbVhjgM5g1T0sOxbOsMmmfuEP6NzjFhGRNJPdPFg
	9jcIjhTBWv6ebH9pJdaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR2nl-00000005srJ-0Yqh;
	Tue, 09 Jul 2024 04:50:05 +0000
Received: from mail-ot1-x332.google.com ([2607:f8b0:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR2nh-00000005sqW-1Os9
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 04:50:03 +0000
Received: by mail-ot1-x332.google.com with SMTP id 46e09a7af769-7036e383089so920865a34.2
        for <linux-riscv@lists.infradead.org>; Mon, 08 Jul 2024 21:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1720500600; x=1721105400; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ycv9RhTx/iOnhQoNsrsfVpohBzhfYYYI7kq2z4uFvQM=;
        b=nbFPZ7YdMc3CDyOw0cRBi6hesyKXqjJaVNaWGjuN36liUokjh+TyJqTOVmP3vz9F18
         liPXeOSIjY3I16jBZOypj9neCRDvB1t1AphiNYtLhdFakGRPBzzQS5rUdxO+2/22wtCG
         cqd7RYKPkQvyLi2APD6vpKC/iAcxpmoX7k8IWxUq5slBrSv00/ZxZcoz/++Wi4/HDQOX
         r+2dXiiadMD659FfZFccXsVOeGX5/XlgcwoW+jl8DD1zFk8/gkKGmDeYHnOOfM6/R3OW
         41izA1SraIPx3KtQIIez2kVfm3p22bYkKpTwHs/UmnDY9PVg+P/01zbAKL89KcmFLFUi
         d1xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720500600; x=1721105400;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ycv9RhTx/iOnhQoNsrsfVpohBzhfYYYI7kq2z4uFvQM=;
        b=JpSONtjbWM6W7ULTl4Y4/zdixs8IZy5MVcN9KTgae42deF0DaUsWxmaTbWgOvcjX7l
         /ZXu66dUEnUWoGAIK91+HIDX5Nub8+nEeSTviuFsFxmaSOrNBzVS5m3m8lkcNDQnr8O1
         qAOEr7ousER69m0ApyH7giRbfjxvj2xUOm0rUH+YjTI+Jf7SNGSnZ/LUKfz2nUZBiZQa
         aXpk7vIbdlG3ScBnOTjkHdbw1ZycF47FrdQqyx2Bx7/9JSPDPKufz9jOP9+lpKM1dfr5
         DMEzjHmcy+ZmFh6fnyc/gvBFQxXxcoBk22ecUZ3GtGQwMSOyGiEIlpQAhIvrOawNkNbM
         fKow==
X-Forwarded-Encrypted: i=1; AJvYcCXW6ol+tQZKfC6ABHWtMktgiIS512c44hOLit59KhPLVBtmoD16lmgksauthma+ox/AwZkC+aXyZLQtreju92r8ynA3410ODPxrSK+I8LUE
X-Gm-Message-State: AOJu0Ywo9oWA3dwmHe/+leum0/rwjHv6Ai6j8eJvFRAdKgLvdpVnU5nK
	G17CP2bzRdTC6S5368XTHz0v7v/XfZZkPTwJsCFSiJqGzJPqtMZARbB6Bq+5+A8=
X-Google-Smtp-Source: AGHT+IEUrIMXwNj2TxtgtdUBPo5hBWRpqg2MgnyY1yttQtF1VzkezDbpHzFV8pIGCqU1nGPoUfx/1w==
X-Received: by 2002:a05:6830:22fb:b0:703:6dce:3ad5 with SMTP id 46e09a7af769-70375a17ad6mr1607568a34.22.1720500599721;
        Mon, 08 Jul 2024 21:49:59 -0700 (PDT)
Received: from sunil-laptop ([106.51.187.237])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-70374f6b5easm302098a34.14.2024.07.08.21.49.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jul 2024 21:49:59 -0700 (PDT)
Date: Tue, 9 Jul 2024 10:19:50 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	rafael.j.wysocki@intel.com, ajones@ventanamicro.com,
	conor.dooley@microchip.com, aou@eecs.berkeley.edu,
	palmer@dabbelt.com, paul.walmsley@sifive.com
Subject: Re: [PATCH v2 1/1] RISC-V: ACPI: Enable SPCR table for console
 output on RISC-V
Message-ID: <ZozBbibw+CyYsqeR@sunil-laptop>
References: <20240502073751.102093-1-jeeheng.sia@starfivetech.com>
 <20240502073751.102093-2-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240502073751.102093-2-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240708_215001_582413_552D90AB 
X-CRM114-Status: GOOD (  20.45  )
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

On Thu, May 02, 2024 at 12:37:51AM -0700, Sia Jee Heng wrote:
> The ACPI SPCR code has been used to enable console output for ARM64 and
> X86. The same code can be reused for RISC-V. Furthermore, SPCR table is
> mandated for headless system as outlined in the RISC-V BRS
> Specification, chapter 6.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  arch/riscv/Kconfig       |  1 +
>  arch/riscv/kernel/acpi.c | 12 +++++++++++-
>  2 files changed, 12 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index be09c8836d56..ff2e270bbe01 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -14,6 +14,7 @@ config RISCV
>  	def_bool y
>  	select ACPI_GENERIC_GSI if ACPI
>  	select ACPI_REDUCED_HARDWARE_ONLY if ACPI
> +	select ACPI_SPCR_TABLE if ACPI
>  	select ARCH_DMA_DEFAULT_COHERENT
>  	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
>  	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index e619edc8b0cc..43a12c00ae8b 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -17,7 +17,9 @@
>  #include <linux/efi.h>
>  #include <linux/io.h>
>  #include <linux/memblock.h>
> +#include <linux/of_fdt.h>
>  #include <linux/pci.h>
> +#include <linux/serial_core.h>
>  
>  int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
>  int acpi_disabled = 1;
> @@ -131,7 +133,7 @@ void __init acpi_boot_table_init(void)
>  	if (param_acpi_off ||
>  	    (!param_acpi_on && !param_acpi_force &&
>  	     efi.acpi20 == EFI_INVALID_TABLE_ADDR))
> -		return;
> +		goto done;
>  
>  	/*
>  	 * ACPI is disabled at this point. Enable it in order to parse
> @@ -151,6 +153,14 @@ void __init acpi_boot_table_init(void)
>  		if (!param_acpi_force)
>  			disable_acpi();
>  	}
> +
> +done:
> +	if (acpi_disabled) {
> +		if (earlycon_acpi_spcr_enable)
> +			early_init_dt_scan_chosen_stdout();
> +	} else {
> +		acpi_parse_spcr(earlycon_acpi_spcr_enable, true);
> +	}
LGTM.

Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks,
Sunil
>  }
>  
>  static int acpi_parse_madt_rintc(union acpi_subtable_headers *header, const unsigned long end)
> -- 
> 2.34.1
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
