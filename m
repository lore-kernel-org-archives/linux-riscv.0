Return-Path: <SRS0=oP9+=KQ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27ECDC433B4
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 05:29:53 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 82DE0613AC
	for <linux-riscv@archiver.kernel.org>; Fri, 21 May 2021 05:29:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 82DE0613AC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=beagleboard.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eGYrnYe1Ak3xHYt8KGhUQQLR9WAaBTA102RC/VKsnNE=; b=MscNFtfnB5JydtHETLz7AtKGio
	hVK+Hh8dPT8nFylX53Zh5yU58W9vHigf2mO9zAamWO12xVhtXhIbb2xwc4kkLzGJHSQlpa3wXhe6e
	xATewCTG4ZAqxG0i3sIzWKwy0V9x1tVwGjLIJM4GxznJwUuSqkVbHjw4+ESn3PJ9qsc5EDfX/4C0U
	fXn3rDh8n0raWsinYVk5JI5BDHnszTqNnNsRnj7YiOtuUYs84byWGOIJQOzwmE+Rub7fBoWGsx+C9
	Befm6CsA6VsdIUDU/IdUQ8VC2r2OvPKkovdjV1xQdCVX/gK0mzv2f4aj8E/Dd9d+jzWTdRX8AAtt0
	ykzYnTZA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ljxj4-003r6A-7z; Fri, 21 May 2021 05:29:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1ljxj0-003r5S-D1
 for linux-riscv@desiato.infradead.org; Fri, 21 May 2021 05:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=In-Reply-To:Content-Type:MIME-Version
 :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=PD8ZRlThGPxYAxiDIf2Pu3vD1iQxfpHbDJdu7x+SvUc=; b=Vst8W2DgaOmyAS5bXbM/fY323B
 XC+/WIdviMZcNFSFsQS6buBlawQqA9qIen9Dn1zq2t+6KhS6v4JlVOkxrhigj82fF7B8DJWGCBuH7
 09tV185vhIJcqC6eCGKuBdJbSaCD63UBmK/kuXnPhTQxEgFP3GN54aN4NP3up65+j20Pt4rCbiCUz
 PIpgs7xjec1a06pjre+NbF8jqeSk0tPHF6kkOOvW049Wfvtxl32mymJ2i4EnH+lxnBdx5dhdrUQQJ
 6j8xuHZhvrdlNrFZxiapK0VjhY8Ji9c6kIyDzWtOBe61Ulq5KyPAZoUPbHvN87v7nnf32fUKQ3X4W
 YrUh63mA==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljxix-00GpNq-1j
 for linux-riscv@lists.infradead.org; Fri, 21 May 2021 05:29:29 +0000
Received: by mail-pf1-x432.google.com with SMTP id s19so11843155pfe.8
 for <linux-riscv@lists.infradead.org>; Thu, 20 May 2021 22:29:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=beagleboard-org.20150623.gappssmtp.com; s=20150623;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=PD8ZRlThGPxYAxiDIf2Pu3vD1iQxfpHbDJdu7x+SvUc=;
 b=FkcLgj4GeXMypxvSFv0LLvRgUFSmpZEDV7QDc3DbrhDgGntTuYaXr4Kgpiuf/nGKyp
 hwoXu9kW1tXqST4W24ua8U6C5gjCYPgyAbU+faHlrLGhf1m4FM+xAr749VJQMw65H+fq
 U6iwtvn4W+y0bpvfZ8nMfyvlRaOjixZL3WXQmk58v4n3zhhVsfJ5Khhrz06r1e937Y3g
 ypy8GgmHg6kjknSDAn1N4GQtvQYdV67NRsog/0DlEX9Hp5PYV4Qh+Q3xt8PtGLTqJDV0
 6MM+fDpT6Hh+xIXJ4qRY1x9IvHsbJPjkqU41bKkxikHzp/IrtmktENtaAvrXK4DOgAEh
 WeqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=PD8ZRlThGPxYAxiDIf2Pu3vD1iQxfpHbDJdu7x+SvUc=;
 b=JTPij0MoVeJtepUpojE7JnsD+p9GAqRXzAkbQXY4osdUaYYeBdBP9ih+bOs8Ff2ldz
 HT3nnu0nO+Dw/su8nhZVfoIcAMDQGMX11ovGzraoSaHxre0quRVpfc2ltzMLOQPHKm0C
 tsn44EYfEuOvuV9dfpGZu9eTAa1MHa8zgJI65k1qrCUYzNyZbssI4Nc9L0xKEGkUGxql
 fWNo3DT0l1Chnxo43uUNkRNlf1sUH9Jzj0Yz5rEpLnMJ4FtvUbIvPMjq1njx/cY4o2yl
 3ZINz/IWFVoQLwSGZ/NpndwNbsk3luYJ6NScvSsaXV8EcSWJK21l+a7wmQYl5hbCnvuR
 iXHg==
X-Gm-Message-State: AOAM532p81wHN3GlAgs4/5sBkLq6u3D4DMNgxgeaSx6Fx5L6RebMHC6P
 8SadfqBjBQb10+E/IwSpFSVEUw==
X-Google-Smtp-Source: ABdhPJwaK0Z6O8PpagekiLs2WjAJmuBsk11tTLjPAYrRW4rPRFOjN4YAT1tM446qldpbRtEpgczwCg==
X-Received: by 2002:a63:a1c:: with SMTP id 28mr4548538pgk.440.1621574964851;
 Thu, 20 May 2021 22:29:24 -0700 (PDT)
Received: from x1 ([2601:1c0:4701:ae70:f2df:f6a3:c7:20de])
 by smtp.gmail.com with ESMTPSA id v8sm3344760pff.220.2021.05.20.22.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 May 2021 22:29:23 -0700 (PDT)
Date: Thu, 20 May 2021 22:29:21 -0700
From: Drew Fustini <drew@beagleboard.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Jisheng Zhang <jszhang@kernel.org>, Zong Li <zong.li@sifive.com>,
 Anup Patel <anup@brainfault.org>, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC] riscv: Map the kernel with correct permissions the
 first time
Message-ID: <20210521052921.GA3341864@x1>
References: <20210518152134.1772653-1-alex@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210518152134.1772653-1-alex@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210520_222927_180312_60A0AA36 
X-CRM114-Status: GOOD (  32.36  )
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

On Tue, May 18, 2021 at 05:21:34PM +0200, Alexandre Ghiti wrote:
> For 64b kernels, we map all the kernel with write and execute permissions
> and afterwards remove writability from text and executability from data.
> 
> For 32b kernels, the kernel mapping resides in the linear mapping, so we
> map all the linear mapping as writable and executable and afterwards we
> remove those properties for unused memory and kernel mapping as
> described above.
> 
> Change this behavior to directly map the kernel with correct permissions
> and avoid going through the whole mapping to fix the permissions.
> 
> At the same time, this fixes an issue introduced by commit 2bfc6cd81bd1
> ("riscv: Move kernel mapping outside of linear mapping") as reported
> here https://github.com/starfive-tech/linux/issues/17.
> 
> Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
> ---
> 
> This patchset was tested on:
> 
> * kernel:
> - rv32 with CONFIG_STRICT_KERNEL_RWX: OK
> - rv32 without CONFIG_STRICT_KERNEL_RWX: OK
> - rv64 with CONFIG_STRICT_KERNEL_RWX: OK
> - rv64 without CONFIG_STRICT_KERNEL_RWX: OK
> 
> * xipkernel:
> - rv32: build only
> - rv64: OK
> 
>  arch/riscv/include/asm/set_memory.h |  2 -
>  arch/riscv/kernel/setup.c           |  1 -
>  arch/riscv/mm/init.c                | 80 ++++++++++++++---------------
>  3 files changed, 38 insertions(+), 45 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
> index 086f757e8ba3..70154f012791 100644
> --- a/arch/riscv/include/asm/set_memory.h
> +++ b/arch/riscv/include/asm/set_memory.h
> @@ -16,13 +16,11 @@ int set_memory_rw(unsigned long addr, int numpages);
>  int set_memory_x(unsigned long addr, int numpages);
>  int set_memory_nx(unsigned long addr, int numpages);
>  int set_memory_rw_nx(unsigned long addr, int numpages);
> -void protect_kernel_text_data(void);
>  #else
>  static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
>  static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
> -static inline void protect_kernel_text_data(void) {}
>  static inline int set_memory_rw_nx(unsigned long addr, int numpages) { return 0; }
>  #endif
>  
> diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
> index 03901d3a8b02..1eb50e512056 100644
> --- a/arch/riscv/kernel/setup.c
> +++ b/arch/riscv/kernel/setup.c
> @@ -292,7 +292,6 @@ void __init setup_arch(char **cmdline_p)
>  	sbi_init();
>  
>  	if (IS_ENABLED(CONFIG_STRICT_KERNEL_RWX)) {
> -		protect_kernel_text_data();
>  		protect_kernel_linear_mapping_text_rodata();
>  	}
>  
> diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
> index 4faf8bd157ea..92b3184420a2 100644
> --- a/arch/riscv/mm/init.c
> +++ b/arch/riscv/mm/init.c
> @@ -436,6 +436,36 @@ asmlinkage void __init __copy_data(void)
>  }
>  #endif
>  
> +#ifdef CONFIG_STRICT_KERNEL_RWX
> +#define is_text_va(va)		({								\
> +		unsigned long _va = va;								\
> +		(_va < (unsigned long)__init_data_begin && _va >= (unsigned long)_start);	\
> +	})
> +
> +static inline __init pgprot_t pgprot_from_kernel_va(uintptr_t va)
> +{
> +	return is_text_va(va) ? PAGE_KERNEL_READ_EXEC : PAGE_KERNEL;
> +}
> +
> +void mark_rodata_ro(void)
> +{
> +	unsigned long rodata_start = (unsigned long)__start_rodata;
> +	unsigned long data_start = (unsigned long)_data;
> +
> +	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> +
> +	debug_checkwx();
> +}
> +#else
> +static inline __init pgprot_t pgprot_from_kernel_va(uintptr_t va)
> +{
> +	if (IS_ENABLED(CONFIG_32BIT))
> +		return PAGE_KERNEL_EXEC;
> +
> +	return (va < kernel_virt_addr) ? PAGE_KERNEL : PAGE_KERNEL_EXEC;
> +}
> +#endif
> +
>  /*
>   * setup_vm() is called from head.S with MMU-off.
>   *
> @@ -465,7 +495,8 @@ uintptr_t xiprom, xiprom_sz;
>  #define xiprom_sz      (*((uintptr_t *)XIP_FIXUP(&xiprom_sz)))
>  #define xiprom         (*((uintptr_t *)XIP_FIXUP(&xiprom)))
>  
> -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size,
> +					    __always_unused bool early)
>  {
>  	uintptr_t va, end_va;
>  
> @@ -484,7 +515,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>  				   map_size, PAGE_KERNEL);
>  }
>  #else
> -static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
> +static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size, bool early)
>  {
>  	uintptr_t va, end_va;
>  
> @@ -492,7 +523,7 @@ static void __init create_kernel_page_table(pgd_t *pgdir, uintptr_t map_size)
>  	for (va = kernel_virt_addr; va < end_va; va += map_size)
>  		create_pgd_mapping(pgdir, va,
>  				   load_pa + (va - kernel_virt_addr),
> -				   map_size, PAGE_KERNEL_EXEC);
> +				   map_size, early ? PAGE_KERNEL_EXEC : pgprot_from_kernel_va(va));
>  }
>  #endif
>  
> @@ -569,7 +600,7 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
>  	 * us to reach paging_init(). We map all memory banks later
>  	 * in setup_vm_final() below.
>  	 */
> -	create_kernel_page_table(early_pg_dir, map_size);
> +	create_kernel_page_table(early_pg_dir, map_size, true);
>  
>  #ifndef __PAGETABLE_PMD_FOLDED
>  	/* Setup early PMD for DTB */
> @@ -693,21 +724,15 @@ static void __init setup_vm_final(void)
>  		map_size = best_map_size(start, end - start);
>  		for (pa = start; pa < end; pa += map_size) {
>  			va = (uintptr_t)__va(pa);
> -			create_pgd_mapping(swapper_pg_dir, va, pa,
> -					   map_size,
> -#ifdef CONFIG_64BIT
> -					   PAGE_KERNEL
> -#else
> -					   PAGE_KERNEL_EXEC
> -#endif
> -					);
>  
> +			create_pgd_mapping(swapper_pg_dir, va, pa, map_size,
> +					   pgprot_from_kernel_va(va));
>  		}
>  	}
>  
>  #ifdef CONFIG_64BIT
>  	/* Map the kernel */
> -	create_kernel_page_table(swapper_pg_dir, PMD_SIZE);
> +	create_kernel_page_table(swapper_pg_dir, PMD_SIZE, false);
>  #endif
>  
>  	/* Clear fixmap PTE and PMD mappings */
> @@ -738,35 +763,6 @@ static inline void setup_vm_final(void)
>  }
>  #endif /* CONFIG_MMU */
>  
> -#ifdef CONFIG_STRICT_KERNEL_RWX
> -void __init protect_kernel_text_data(void)
> -{
> -	unsigned long text_start = (unsigned long)_start;
> -	unsigned long init_text_start = (unsigned long)__init_text_begin;
> -	unsigned long init_data_start = (unsigned long)__init_data_begin;
> -	unsigned long rodata_start = (unsigned long)__start_rodata;
> -	unsigned long data_start = (unsigned long)_data;
> -	unsigned long max_low = (unsigned long)(__va(PFN_PHYS(max_low_pfn)));
> -
> -	set_memory_ro(text_start, (init_text_start - text_start) >> PAGE_SHIFT);
> -	set_memory_ro(init_text_start, (init_data_start - init_text_start) >> PAGE_SHIFT);
> -	set_memory_nx(init_data_start, (rodata_start - init_data_start) >> PAGE_SHIFT);
> -	/* rodata section is marked readonly in mark_rodata_ro */
> -	set_memory_nx(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> -	set_memory_nx(data_start, (max_low - data_start) >> PAGE_SHIFT);
> -}
> -
> -void mark_rodata_ro(void)
> -{
> -	unsigned long rodata_start = (unsigned long)__start_rodata;
> -	unsigned long data_start = (unsigned long)_data;
> -
> -	set_memory_ro(rodata_start, (data_start - rodata_start) >> PAGE_SHIFT);
> -
> -	debug_checkwx();
> -}
> -#endif
> -
>  #ifdef CONFIG_KEXEC_CORE
>  /*
>   * reserve_crashkernel() - reserves memory for crash kernel
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

I believe there is new revision of this patch in development but I
wanted to say that I tested it on the BeagleV Starlight and it resolve
the W+X warning [1]:

  Checked W+X mappings: passed, no W+X pages found

I did this by removing b865eb8 ("riscv: mm: Fix W+X mappings at boot")
from Emil's starlight branch [1] and applying the patch from this email.

Thanks,
Drew

[1] https://gist.github.com/pdp7/023366257d1576672d0199221923b669
[2] https://github.com/esmil/linux/commits/starlight

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
