Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A474AC46CD2
	for <linux-riscv@archiver.kernel.org>; Tue,  2 Jan 2024 15:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hwohZiWCct0+QVHDsRHFcWpRzmTJ/uAzNA9f0GBannw=; b=NG3wrVOvaBN0rG
	tbOlRAywrw8N8SJOc0R6eIGwU+JcQ0VacpMkCCajhbF4vMAKQfZwIfmEMBSXmKBtNabStvS450ubT
	zIZGl8gaLoZhRlgPjLrQeo+BZqc5GOdPpp6N4BZNdC/K5Lqw8n/JIgpB1peJQqNXfvmjBvCOvxj8Q
	KkWusXUkeMcBWDDjrv2eIyWaWE+RaC/lT97DO3aFpGFNLkxYkXxqUwqgD5P96uBHEeRhh8vUPXq4F
	EqoJZGMvHmW4IQgj4BP3TTG4YPhe65Oz/ywnfUorG+y+GjpaTG3pG3RGN5V/AwBxC+Dvv1maC7cX7
	UD729JPIJ1HX8ZztdtMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgrK-008Oje-0w;
	Tue, 02 Jan 2024 15:39:14 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKgrG-008Oj8-2n
	for linux-riscv@lists.infradead.org;
	Tue, 02 Jan 2024 15:39:12 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-40d604b4b30so26578505e9.1
        for <linux-riscv@lists.infradead.org>; Tue, 02 Jan 2024 07:39:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1704209948; x=1704814748; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8PuIzcJWDs7Ycx+IDbB+TKZ/Gz1HLUaLNM0aewStBVA=;
        b=a25T/JWRkuPOo4eIeiovBHSRW+UUG+w7UqUV6NocSBP7aZEYuQnpkvbahHP7I2DdDx
         CW7DDzLoXRCojX+fQpd2kscSwHr7voqK2otpiKR/PYjqjitHhq3cC/LrCUhuZdxyBi0I
         pjPH+6YRLHTElBhh4Kl9YODNBrgvniFfC8JGvxXQzJYQ/kfaURRHDi0mu1QsmsKdFOzw
         dPNIfK8AzY5NsZFyHAVc5WD5pIMEL7xNNqTXAFOvn1kPIKKOOHWJrGoACdIump3UMYkL
         31H2HK7UmF/6vr56E/lwdjMsnSkXNNT4/kGwzIFZRX29vK8w7xas26f15JkEsryCZyOC
         hH6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704209948; x=1704814748;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8PuIzcJWDs7Ycx+IDbB+TKZ/Gz1HLUaLNM0aewStBVA=;
        b=pCNkvqZq8JeRAZdEUUUCdtWd28ROjfoX/5NWI+qUrCS111CFWwVuyxa+ikv0KcOU3L
         LfcG/TMo/3kQy91a0xEl06YpsXZn8WTrRFOn+QmLcKcdrOYyV8RqRtUOqldKH8kA/Oth
         AYOftqi80eYrIAEJ7URiKIkGCVT1UX+k8+u8Yab2rKV1Dlo5cllQSaRaq4t2HfSKafr/
         QTDzicZxgoTaqw9O4lZB6uiN6gv0xJ10qN2Gq8UoIXWRUfwNMHCXtki/CA1qjNgV/FvO
         jchcI4J/JjHdmNDdlMbr1ZafEm0jx9DUcOVnsGfqeLNYQGODC8penUmdL0EfWjbbKZyF
         uKmw==
X-Gm-Message-State: AOJu0Yy9KVTBnzPYl2WTM6VoclC2tmYGJETKE+3OS11zAAQ+fcTMQRUd
	IOBu2PLmqzs04bjpQ6Gfiecf4Pn8J51Mpg==
X-Google-Smtp-Source: AGHT+IG1N4DB7FVoiHTpO09/sHvmv28ZIzI+6/qYRY5XJbohkHs6MM1mD5mZprp39syqBQUmrgyESQ==
X-Received: by 2002:a05:600c:a084:b0:40d:8a52:c998 with SMTP id jh4-20020a05600ca08400b0040d8a52c998mr1072817wmb.17.1704209948254;
        Tue, 02 Jan 2024 07:39:08 -0800 (PST)
Received: from localhost (2001-1ae9-1c2-4c00-20f-c6b4-1e57-7965.ip6.tmcz.cz. [2001:1ae9:1c2:4c00:20f:c6b4:1e57:7965])
        by smtp.gmail.com with ESMTPSA id iv13-20020a05600c548d00b0040d30af488asm49891379wmb.40.2024.01.02.07.39.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jan 2024 07:39:07 -0800 (PST)
Date: Tue, 2 Jan 2024 16:39:06 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sia Jee Heng <jeeheng.sia@starfivetech.com>
Subject: Re: [RFC v1 1/1] RISC-V: ACPI: Enable SPCR table for console output
 on RISC-V
Message-ID: <20240102-1ddc9ec273fded1548ee586d@orel>
References: <20231229065405.235625-1-jeeheng.sia@starfivetech.com>
 <20231229065405.235625-2-jeeheng.sia@starfivetech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231229065405.235625-2-jeeheng.sia@starfivetech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_073910_927504_AC423252 
X-CRM114-Status: GOOD (  20.22  )
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
Cc: aou@eecs.berkeley.edu, rafael.j.wysocki@intel.com, linux-kernel@vger.kernel.org, conor.dooley@microchip.com, palmer@dabbelt.com, paul.walmsley@sifive.com, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Fri, Dec 29, 2023 at 02:54:05PM +0800, Sia Jee Heng wrote:
> The ACPI SPCR code has been used to enable console output for ARM64 and
> X86. The same code can be reused for RISC-V.
> 
> Vendor will enable/disable the SPCR table in the firmware based on the
> platform design. However, in cases where the SPCR table is not usable,
> a kernel parameter could be used to specify the preferred console.
> 
> Signed-off-by: Sia Jee Heng <jeeheng.sia@starfivetech.com>
> ---
>  arch/riscv/kernel/acpi.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index e619edc8b0cc..5ec2fdf9e09f 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -18,6 +18,7 @@
>  #include <linux/io.h>
>  #include <linux/memblock.h>
>  #include <linux/pci.h>
> +#include <linux/serial_core.h>
>  
>  int acpi_noirq = 1;		/* skip ACPI IRQ initialization */
>  int acpi_disabled = 1;
> @@ -151,6 +152,9 @@ void __init acpi_boot_table_init(void)
>  		if (!param_acpi_force)
>  			disable_acpi();
>  	}
> +
> +	if (!acpi_disabled)
> +		acpi_parse_spcr(earlycon_acpi_spcr_enable, true);

Both arm64 and loongarch call early_init_dt_scan_chosen_stdout() when
acpi_disabled and earlycon_acpi_spcr_enable are both true. Is that
not necessary for RISC-V?

Thanks,
drew

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
