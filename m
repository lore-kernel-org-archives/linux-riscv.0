Return-Path: <SRS0=aw4H=SL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E285C282DA
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 16:47:49 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D05DF2084C
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  9 Apr 2019 16:47:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="AL5rgAfH";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="HpebeSCY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D05DF2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=+GR0LDF8FLkNz8qCx5SRUEUOzKaemac3EUPmhmI1Hwc=; b=AL5rgAfH8/PZNnFptJ6pARgEf
	O83Rgrk06Hmc1l2ndkHhy4HzZSR0DY4LUbpAkS2vzfgvb+PJqLLf0hJRDv7E4q2UQuYR+U6hRTIA8
	rkgR9mbBIKshokRPz3eJJ0hMj9AcwtaOafnBE5We9lUJ231CGi9l8m4OFO4mw0U4aBxTpcC2E8WUS
	dErwcNrwZAauQxOkwMCWeRnz21nsFeO2Uyjg+6N5gkjBjsV887Go9qQYWY2HPQ7BRPn8vBYkDmzRl
	Pw5D3eFYMj2ErWhslOhjk2d6/hcraq41a/QTwVqnn77LYcqa9iXmBPG+boZA6ygZFdLKQ4+P+NZdy
	1+FiQefIQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hDtuV-0004lC-Ou; Tue, 09 Apr 2019 16:47:47 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hDtuS-0004kp-R8
 for linux-riscv@lists.infradead.org; Tue, 09 Apr 2019 16:47:46 +0000
Received: by mail-pl1-x643.google.com with SMTP id f36so5260654plb.5
 for <linux-riscv@lists.infradead.org>; Tue, 09 Apr 2019 09:47:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=6aIEQqr4R4gOfrOi3rct1WB74s6+yXjXiuBb4szBCf4=;
 b=HpebeSCYawoEcbMN+6QuFlLUe77fo+zVLwaoDIZOLV+pPN4YfcP9AzhfgGYU2mcOD8
 c7KwNSsgVqIAsT8WBXXBHXQ8P5hFLRZKKnaYmSR7RWSA0vcFfb3+riseNRcWNcpwdvmd
 ku4Ex83SjfDt9OBKo/+Sn7z8zJzUXd1i9ltsT1BtRzt4ocNr0L8mAX70oOFbPzUWylPg
 2bAnmw4w7TOCbvikHk8bSL8bKdntRAwqiko9ks3/XQWw+4q2sanBI7dikOfaPcrSomhY
 XO1mpUSde4fHQQ5nLdAdC8YqCGYprmM3WcgY40ZBomdQcpTnIf2n2n8G29yr3Eq0rjE/
 hCkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=6aIEQqr4R4gOfrOi3rct1WB74s6+yXjXiuBb4szBCf4=;
 b=Ch9iB7QmiOQaNfuwQ7gda0w1ZIbqbK+F5TcVkUTXZZJc/a+3iBOq/mJ9tm5wskpWkf
 hgdFyyZy2CgjZi+DXaSuW+Zpdb98odw12BWm4U/sjd/AWQL/kYus8pYLOWhyVRL0Wjc8
 R7MsO8vHsgDOCNXtu8bYrDcUSiyfnt1DFtqxfbFHcqE/WBNbFPUkWigjpQgef0015lx0
 BKE2V6jaPjyOfskT5xA9GVNAXrBDZ+L7P8DNKuRNsCauGkYVNXIJ/r+5ZZ0RTSx+Ts1i
 Zr9vtBVRvnTIP6XeE5aFIXnmqr7W197Vo7myfYdyj6PbZD24jN5VjUtcRwCUYpEMZEDG
 dbgw==
X-Gm-Message-State: APjAAAXryzwXwDYFY/MzIuI07XMV78gCWCBPdoAX4RrYIOx7fs5Ux4nJ
 0VWHhQsNtIL6JzhoKey2H1DUzg==
X-Google-Smtp-Source: APXvYqzLaQ6c4Z/yB7ObwPHC6aofumcMt318eZxT1bLBkiWxy6ZlT7XyuFIjaba5ff7kYfl+ke8SjQ==
X-Received: by 2002:a17:902:7d8f:: with SMTP id
 a15mr4403219plm.3.1554828464064; 
 Tue, 09 Apr 2019 09:47:44 -0700 (PDT)
Received: from localhost ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id b13sm26527071pfd.12.2019.04.09.09.47.42
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 09 Apr 2019 09:47:43 -0700 (PDT)
Date: Tue, 09 Apr 2019 09:47:43 -0700 (PDT)
X-Google-Original-Date: Tue, 09 Apr 2019 09:47:31 PDT (-0700)
Subject: Re: [PATCH 2/3] RISC-V: Make setup_vm() independent of GCC code model
In-Reply-To: <20190312220752.128141-3-anup.patel@wdc.com>
From: Palmer Dabbelt <palmer@sifive.com>
To: Anup Patel <Anup.Patel@wdc.com>
Message-ID: <mhng-3d9a3b8a-2d5d-4db8-b8b0-4ef410a9ad52@palmer-si-x1c4>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190409_094744_910173_17D3EABD 
X-CRM114-Status: GOOD (  23.81  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: aou@eecs.berkeley.edu, Anup Patel <Anup.Patel@wdc.com>,
 linux-kernel@vger.kernel.org, rppt@linux.ibm.com,
 Christoph Hellwig <hch@infradead.org>, Atish Patra <Atish.Patra@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Tue, 12 Mar 2019 15:08:16 PDT (-0700), Anup Patel wrote:
> The setup_vm() must access kernel symbols in a position independent way
> because it will be called from head.S with MMU off.
>
> If we compile kernel with cmodel=medany then PC-relative addressing will
> be used in setup_vm() to access kernel symbols so it works perfectly fine.
>
> Although, if we compile kernel with cmodel=medlow then either absolute
> addressing or PC-relative addressing (based on whichever requires fewer
> instructions) is used to access kernel symbols in setup_vm(). This can
> break setup_vm() whenever any absolute addressing is used to access
> kernel symbols.
>
> With the movement of setup_vm() from kernel/setup.c to mm/init.c, the
> setup_vm() is now broken for cmodel=medlow but it works perfectly fine
> for cmodel=medany.
>
> This patch fixes setup_vm() and makes it independent of GCC code model
> by accessing kernel symbols relative to kernel load address instead of
> assuming PC-relative addressing.

I think we ended up with a cleaner solution as 387181dcdb6c ("RISC-V: Always 
compile mm/init.c with cmodel=medany and notrace"), but let me know if I missed 
something here.

>
> Fixes: 6f1e9e946f0b ("RISC-V: Move setup_vm() to mm/init.c")
> Signed-off-by: Anup Patel <anup.patel@wdc.com>
> ---
>  arch/riscv/kernel/head.S |  1 +
>  arch/riscv/mm/init.c     | 71 ++++++++++++++++++++++++++--------------
>  2 files changed, 47 insertions(+), 25 deletions(-)
>
> diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
> index fe884cd69abd..7966262b4f9d 100644
> --- a/arch/riscv/kernel/head.S
> +++ b/arch/riscv/kernel/head.S
> @@ -62,6 +62,7 @@ clear_bss_done:
>  
>  	/* Initialize page tables and relocate to virtual addresses */
>  	la sp, init_thread_union + THREAD_SIZE
> +	la a0, _start
>  	call setup_vm
>  	call relocate
>  
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index b379a75ac6a6..f35299f2f3d5 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -172,55 +172,76 @@ void __set_fixmap(enum fixed_addresses idx, phys_addr_t phys, pgprot_t prot)
>  	}
>  }
>  
> -asmlinkage void __init setup_vm(void)
> +static inline void *__early_va(void *ptr, uintptr_t load_pa)
>  {
>  	extern char _start;
> +	uintptr_t va = (uintptr_t)ptr;
> +	uintptr_t sz = (uintptr_t)(&_end) - (uintptr_t)(&_start);
> +
> +	if (va >= PAGE_OFFSET && va < (PAGE_OFFSET + sz))
> +		return (void *)(load_pa + (va - PAGE_OFFSET));
> +	return (void *)va;
> +}
> +
> +asmlinkage void __init setup_vm(uintptr_t load_pa)
> +{
>  	uintptr_t i;
> -	uintptr_t pa = (uintptr_t) &_start;
> +#ifndef __PAGETABLE_PMD_FOLDED
> +	pmd_t *pmdp;
> +#endif
> +	pgd_t *pgdp;
> +	phys_addr_t map_pa;
> +	pgprot_t tableprot = __pgprot(_PAGE_TABLE);
>  	pgprot_t prot = __pgprot(pgprot_val(PAGE_KERNEL) | _PAGE_EXEC);
>  
> -	va_pa_offset = PAGE_OFFSET - pa;
> -	pfn_base = PFN_DOWN(pa);
> +	va_pa_offset = PAGE_OFFSET - load_pa;
> +	pfn_base = PFN_DOWN(load_pa);
>  
>  	/* Sanity check alignment and size */
>  	BUG_ON((PAGE_OFFSET % PGDIR_SIZE) != 0);
> -	BUG_ON((pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
> +	BUG_ON((load_pa % (PAGE_SIZE * PTRS_PER_PTE)) != 0);
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
> -	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN((uintptr_t)trampoline_pmd),
> -			__pgprot(_PAGE_TABLE));
> -	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(pa), prot);
> +	pgdp = __early_va(trampoline_pg_dir, load_pa);
> +	map_pa = (uintptr_t)__early_va(trampoline_pmd, load_pa);
> +	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(map_pa), tableprot);
> +	trampoline_pmd[0] = pfn_pmd(PFN_DOWN(load_pa), prot);
> +
> +	pgdp = __early_va(swapper_pg_dir, load_pa);
>  
>  	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
>  		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
>  
> -		swapper_pg_dir[o] =
> -			pfn_pgd(PFN_DOWN((uintptr_t)swapper_pmd) + i,
> -				__pgprot(_PAGE_TABLE));
> +		map_pa = (uintptr_t)__early_va(swapper_pmd, load_pa);
> +		pgdp[o] = pfn_pgd(PFN_DOWN(map_pa) + i, tableprot);
>  	}
> +	pmdp = __early_va(swapper_pmd, load_pa);
>  	for (i = 0; i < ARRAY_SIZE(swapper_pmd); i++)
> -		swapper_pmd[i] = pfn_pmd(PFN_DOWN(pa + i * PMD_SIZE), prot);
> +		pmdp[i] = pfn_pmd(PFN_DOWN(load_pa + i * PMD_SIZE), prot);
>  
> -	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pmd),
> -				__pgprot(_PAGE_TABLE));
> +	map_pa = (uintptr_t)__early_va(fixmap_pmd, load_pa);
> +	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(map_pa), tableprot);
> +	pmdp = __early_va(fixmap_pmd, load_pa);
> +	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
>  	fixmap_pmd[(FIXADDR_START >> PMD_SHIFT) % PTRS_PER_PMD] =
> -		pfn_pmd(PFN_DOWN((uintptr_t)fixmap_pte),
> -				__pgprot(_PAGE_TABLE));
> +		pfn_pmd(PFN_DOWN(map_pa), tableprot);
>  #else
> -	trampoline_pg_dir[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN(pa), prot);
> +	pgdp = __early_va(trampoline_pg_dir, load_pa);
> +	pgdp[(PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(load_pa), prot);
> +
> +	pgdp = __early_va(swapper_pg_dir, load_pa);
>  
>  	for (i = 0; i < (-PAGE_OFFSET)/PGDIR_SIZE; ++i) {
>  		size_t o = (PAGE_OFFSET >> PGDIR_SHIFT) % PTRS_PER_PGD + i;
>  
> -		swapper_pg_dir[o] =
> -			pfn_pgd(PFN_DOWN(pa + i * PGDIR_SIZE), prot);
> +		pgdp[o] = pfn_pgd(PFN_DOWN(load_pa + i * PGDIR_SIZE), prot);
>  	}
>  
> -	swapper_pg_dir[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> -		pfn_pgd(PFN_DOWN((uintptr_t)fixmap_pte),
> -				__pgprot(_PAGE_TABLE));
> +	map_pa = (uintptr_t)__early_va(fixmap_pte, load_pa);
> +	pgdp[(FIXADDR_START >> PGDIR_SHIFT) % PTRS_PER_PGD] =
> +		pfn_pgd(PFN_DOWN(map_pa), tableprot);
>  #endif
>  }
> -- 
> 2.17.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
