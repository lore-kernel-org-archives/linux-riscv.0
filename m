Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 128E7D1AD2E
	for <linux-riscv@archiver.kernel.org>; Wed, 16 Oct 2024 08:51:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AXDyIdLhkDqV4Zi2brG+D8WL7dlzkoo+HAmY/2crbT8=; b=IOcIqtRyOzS+/N
	t93bMdvAm74KSjy2FYXdEpSA6G2HyCs5FUg5Zei8dXfLdbI7ud4ZH2hsSA6zQd2DzdU2bLdn7dp7c
	mYkoJQW1UBWw2TdpMtByWxkcKIy8KlQVA1e5TxImSDizKYQMZlMCldjJ7aUL12D3HfHdXqbsGKfh/
	X17n/FfO8uniGf3D3soTsak6X2iDegAQ0lV/lkHyTyUkOWxK8REu2cQ7VuTvCkAjDzMbVQbzJp0WI
	dgZtt8/5jyOE5YT9kDUT0Xx7RK/iXr/KWDbx1rlb4coMgP8uyjObh+ihQI/G9uUq0l6EqZZnQSpSU
	CtcMzdNkuyWmytvPYttA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0zkg-0000000B6m8-0S5Q;
	Wed, 16 Oct 2024 08:51:30 +0000
Received: from mail-ot1-x32a.google.com ([2607:f8b0:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0ziO-0000000B6BR-3LzK
	for linux-riscv@lists.infradead.org;
	Wed, 16 Oct 2024 08:49:10 +0000
Received: by mail-ot1-x32a.google.com with SMTP id 46e09a7af769-7157c329d93so3170610a34.3
        for <linux-riscv@lists.infradead.org>; Wed, 16 Oct 2024 01:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1729068547; x=1729673347; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=yhbVQyfRkW94fc9SRqBIvGYEHn8LmJMPO3GJTuoNbLk=;
        b=N6qWVEglpELDKDD5/Ir/wLuo+JPuGEref3litT19V+MG5hVTiExHBigaY5COhkr9LS
         4JeaJI4QgGjzgUmjJslNY8yKvYc6aR3cGs6OHgZNu3WzXVP3DKiwibjsr+IVLBn1bver
         UQo9C8VXHfG1IB3ZDjZ3icUEqZF1WPG2dj1zYtgJiy9pWEkeYG+wBli9rONR3CBwPEr7
         vLv2T6pByWgEtgs5Bb8pESWIVA3nPaFKxVuABNUrChopKY/6klT7tzRXc/iCIs9otMvx
         5NLUMj03rfk+lQXzRLJAXOZkb2i9X29gxRlRP4AXc4cQMi70ZYS9vhdCmkbXMyOJ1NWr
         zOxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729068547; x=1729673347;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yhbVQyfRkW94fc9SRqBIvGYEHn8LmJMPO3GJTuoNbLk=;
        b=Ij6bCB1UvgzfHriQvWwW+HgoM/yOivE+GvjMRk2QsvYGJagottUdsycuWi9hH2veE+
         XIOWnteIrHm7weTtLdSKbsguvI0618AnuW7koHIt4G6VJVIoYI5EpFMRSgdCEFUKPFgQ
         Uum2Kd39DfRGBOI0iaKkKEjuulpMdSzKtYZS6H5P2ZhCsN78CWN9MnxcbEw/YHpoT0fT
         juGQowPEEl4FNyI5ZsOs50P0HaOXwWr0pa8FgjD278avJmdn8B4G7y3efzq/5dmpNSXF
         w7YeFevFzLZAyR8bTTvgA5U+2Xrii1+lDLc32HvjpCg6YDNmk3gXAgYKIBhEg3fBn8np
         lbjQ==
X-Forwarded-Encrypted: i=1; AJvYcCUscVb/ZtvxMBZkjlu9gCWEf/m5varHjj3bPdyrf2q4GlMJUrMmidnBZOMjG0JDHI2yfHt7VBP4V4dRbw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yx0hmAKwe+abnMLMtRho40isGF9JUc3hPhu8fZ8vAs5g3N2nNid
	q+cS3K+CxoC2UJkKrBnW5GApBWsraw9BYu91kWPYr0Pqxl1Blo8GaareKNd446o=
X-Google-Smtp-Source: AGHT+IHX6rhmfA7N9aepcCXGWg+aLVBjn3PwoP8vJv4Eo4/lvnu7ZU5x91ThivPntsl/7ggjwaAxNw==
X-Received: by 2002:a05:6830:63cb:b0:710:f38a:191c with SMTP id 46e09a7af769-717d6411af5mr16721457a34.11.1729068546855;
        Wed, 16 Oct 2024 01:49:06 -0700 (PDT)
Received: from sunil-laptop ([106.51.192.229])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5eb4eee7f3csm651965eaf.47.2024.10.16.01.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Oct 2024 01:49:05 -0700 (PDT)
Date: Wed, 16 Oct 2024 14:18:55 +0530
From: Sunil V L <sunilvl@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com,
	palmer@dabbelt.com, aou@eecs.berkeley.edu, alexghiti@rivosinc.com,
	conor.dooley@microchip.com, rafael.j.wysocki@intel.com,
	haibo1.xu@intel.com, jeeheng.sia@starfivetech.com,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] RISC-V: ACPI: fix early_ioremap to early_memremap
Message-ID: <Zw9991h7QtX2S__m@sunil-laptop>
References: <20241014130141.86426-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20241014130141.86426-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_014908_862553_FDD0BDDD 
X-CRM114-Status: GOOD (  17.30  )
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

On Mon, Oct 14, 2024 at 09:01:41PM +0800, Yunhui Cui wrote:
> When SVPBMT is enabled, __acpi_map_table() will directly access the
> data in DDR through the IO attribute, rather than through hardware
> cache consistency, resulting in incorrect data in the obtained ACPI
> table.
> 
> The log: ACPI: [ACPI:0x18] Invalid zero length.
> 
> We do not assume whether the bootloader flushes or not. We should
> access in a cacheable way instead of maintaining cache consistency
> by software.
> 
> Fixes: 3b426d4b5b14 ("RISC-V: ACPI : Fix for usage of pointers in different address space")
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/kernel/acpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 6e0d333f57e5..2fd29695a788 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -210,7 +210,7 @@ void __init __iomem *__acpi_map_table(unsigned long phys, unsigned long size)
>  	if (!size)
>  		return NULL;
>  
> -	return early_ioremap(phys, size);
> +	return early_memremap(phys, size);
>  }
>  
>  void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
> @@ -218,7 +218,7 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
>  	if (!map || !size)
>  		return;
>  
> -	early_iounmap(map, size);
> +	early_memunmap(map, size);
>  }
>  
Reviewed-by: Sunil V L <sunilvl@ventanamicro.com>

Thanks,
Sunil

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
