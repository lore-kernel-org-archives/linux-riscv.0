Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA52EB64DD
	for <linux-riscv@archiver.kernel.org>; Mon,  7 Aug 2023 08:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rXPwyjRD9rx1IIaKesf7q+ue28DntGUbk0yWBdbdFno=; b=crN5xwDYeabnv2
	S1MmyiPwXdnb0QzVuHnXUVr0SZEG8cdiyYXFJ+IxF7j2Q0t73+o4d+FitQ5Kyp8hNsclNgHHm+ax9
	ZyxrbnCG3TXfzMLQ/EX2te+TySS12Ea4lYGPOWaHBkeqa4v4oQ7okZ+NTDiATtt6NJWT7fmuceCYl
	CCJRVrTek/OO+g1uEQb3PAuD9ITpWYkrEvGn8bGAR7Soc2PdM7UJmbDybnGg0rdBCsfezSxFphYOE
	8gLLsUvw9Oq2ARn4f/gmEYHZ1twwxHZl3Uuql1TSRpt0xqz9kN11G5SVzwYiBsW4pcPaBb5ZDZJYR
	2lfhWg8BmBtJfeE9kh9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvTa-00GQd9-2h;
	Mon, 07 Aug 2023 08:20:30 +0000
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qSvTY-00GQbf-1e
	for linux-riscv@lists.infradead.org;
	Mon, 07 Aug 2023 08:20:29 +0000
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-51e2a6a3768so5804551a12.0
        for <linux-riscv@lists.infradead.org>; Mon, 07 Aug 2023 01:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1691396425; x=1692001225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X/3aPcv01OzN39IUD/aX9hP4XVkcpINkY5fZPomzhTU=;
        b=PVv4YJO4RBn7OA3++k0468r7BbExuUQyBP+0fuCyf8NiGwU9ulLb0NuvXxuUQDex5u
         0Ko3JrFQFM2kHrnHIjA1iCVnbvwOdAdiJaMQ5GT2SoZpqReMRSTlQWML9Pv1V3QdFt7x
         Go93snSTsJEnD3CEU5BvZ69yag3oJPHpoEc0BmgXh2pzeQNKdJEVmuhwBFyUxGi0rv87
         vi+XnRTq3DmeNAe4YeJkvuJvhQ8hFYlvhRxF/0KVQDYOTES/x9jbBnSSJWv3My5YhGew
         kKYg9qqVAo3QlGLYApMbN6PaJyWWeZJO5wxoACI+N+x/Ucem551AzjiZT6HP+Awc4yzH
         eMXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691396425; x=1692001225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X/3aPcv01OzN39IUD/aX9hP4XVkcpINkY5fZPomzhTU=;
        b=Nf9rgeAsDS3h5rAw5Affec9cNyP3EOG+iBKCBZ4ag8Pu6DBqzIs4II8wsFMAycP6Q0
         06DQvCWjHRp9v/CHYgB7EqIEEo7b5cLi3pj8fj8wVupZhVgI5cs5i1NWHhQssDxoiOe6
         sJt2/dytI6M/WWAgr5BeP3Jqanobz3cMp2THBIqVpsfxRMu7pf0lcz2ffSQO0CQa3Nsr
         MRo9XtfdNbGiBjFr0sDRoSv/WoG4CyuqSh7d0KAd3dkVNclZdCfbTz+RQ1r1ReA7p0t9
         haPMFJM58XjOsYR2XY9zsZ3d11pEoRBLR7IntBrEMlYBRElMJm7EFTF+w4SGHpSmz8Dl
         2v1w==
X-Gm-Message-State: AOJu0Yztqxh6QBzxvSIL8IGvahyiXqEeMilXve2TZzL9hyt+dyGsv8FQ
	BTekPoNKB/BGrLx9B8XtBxg/9g==
X-Google-Smtp-Source: AGHT+IG6bTLsou3LPOGQGdFM9cCRg9PxjTO2zzfPl5N+ZCSlyhpUhGftqSn9l1/Ee8JS/rtN2WArPg==
X-Received: by 2002:a17:907:1dc3:b0:99b:f44e:6daa with SMTP id og3-20020a1709071dc300b0099bf44e6daamr6734142ejc.62.1691396424949;
        Mon, 07 Aug 2023 01:20:24 -0700 (PDT)
Received: from localhost (212-5-140-29.ip.btc-net.bg. [212.5.140.29])
        by smtp.gmail.com with ESMTPSA id k19-20020a17090666d300b00991dfb5dfbbsm4837363ejp.67.2023.08.07.01.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Aug 2023 01:20:24 -0700 (PDT)
Date: Mon, 7 Aug 2023 11:20:20 +0300
From: Andrew Jones <ajones@ventanamicro.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org, 
	linux-pci@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Len Brown <lenb@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Daniel Lezcano <daniel.lezcano@linaro.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Anup Patel <anup@brainfault.org>, Marc Zyngier <maz@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, Robert Moore <robert.moore@intel.com>, 
	Haibo Xu <haibo1.xu@intel.com>, Conor Dooley <conor.dooley@microchip.com>, 
	Atish Kumar Patra <atishp@rivosinc.com>, kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH v1 03/21] RISC-V: ACPI: Fix acpi_os_ioremap to return
 iomem address
Message-ID: <20230807-4fa96c8f505a601dd758ec2e@orel>
References: <20230803175916.3174453-1-sunilvl@ventanamicro.com>
 <20230803175916.3174453-4-sunilvl@ventanamicro.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230803175916.3174453-4-sunilvl@ventanamicro.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230807_012028_554332_D4592EC4 
X-CRM114-Status: GOOD (  19.86  )
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

On Thu, Aug 03, 2023 at 11:28:58PM +0530, Sunil V L wrote:
> acpi_os_ioremap() currently is a wrapper to memremap() on
> RISC-V. But the callers of acpi_os_ioremap() expect it to
> return __iomem address and hence sparse tool reports a new
> warning. Fix this issue by type casting to  __iomem type.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202307230357.egcTAefj-lkp@intel.com/
> Fixes: a91a9ffbd3a5 ("RISC-V: Add support to build the ACPI core")
> Signed-off-by: Sunil V L <sunilvl@ventanamicro.com>
> ---
>  arch/riscv/include/asm/acpi.h | 2 +-
>  arch/riscv/kernel/acpi.c      | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/acpi.h b/arch/riscv/include/asm/acpi.h
> index f71ce21ff684..d5604d2073bc 100644
> --- a/arch/riscv/include/asm/acpi.h
> +++ b/arch/riscv/include/asm/acpi.h
> @@ -19,7 +19,7 @@ typedef u64 phys_cpuid_t;
>  #define PHYS_CPUID_INVALID INVALID_HARTID
>  
>  /* ACPI table mapping after acpi_permanent_mmap is set */
> -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
> +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size);
>  #define acpi_os_ioremap acpi_os_ioremap
>  
>  #define acpi_strict 1	/* No out-of-spec workarounds on RISC-V */
> diff --git a/arch/riscv/kernel/acpi.c b/arch/riscv/kernel/acpi.c
> index 5ee03ebab80e..56cb2c986c48 100644
> --- a/arch/riscv/kernel/acpi.c
> +++ b/arch/riscv/kernel/acpi.c
> @@ -215,9 +215,9 @@ void __init __acpi_unmap_table(void __iomem *map, unsigned long size)
>  	early_iounmap(map, size);
>  }
>  
> -void *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
> +void __iomem *acpi_os_ioremap(acpi_physical_address phys, acpi_size size)
>  {
> -	return memremap(phys, size, MEMREMAP_WB);
> +	return (void __iomem *)memremap(phys, size, MEMREMAP_WB);
>  }
>  
>  #ifdef CONFIG_PCI
> -- 
> 2.39.2
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
