Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E030C6FD20
	for <linux-riscv@archiver.kernel.org>; Fri, 24 Mar 2023 15:21:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OmGpIgJ0zMzQzwfWt7BN1dUioAwxLVtB+KUApvuLnb4=; b=LjgC4XJgqwdAGc
	yzGKyAMdBpvOeZPpdDlCoT6HHSZKvLVEedujcRIEbRzVAdBHrCaw2NhPprapAf5Fcy0H6a0HWJ1UL
	cKRa4irF+YDOKhnIaULt1zwFH4QVQnElTvaQ8VN9766zTkWAv4Lc7AU49n5Gvux6DQvo9JNnOdvH/
	gTOZkoZe5UnvMSD1u3fDomA6jaAjJE6tjmtPmhjyppAnIK904jnxR4DyTAZ3EYSI8G/UvPz452hsh
	hCscJBONP4j52RkfrGsi/ImIixIQuejHMGYGsj8z3/FarIb+o7hn0LXyFBBsKdQpZPjg/3+DDw6zc
	IzoWZMq1PuI/Jiz+TrDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjEM-004pja-2c;
	Fri, 24 Mar 2023 15:21:26 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pfjEI-004phf-2F;
	Fri, 24 Mar 2023 15:21:24 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id E4E7DB822E8;
	Fri, 24 Mar 2023 15:21:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4A70C433A8;
	Fri, 24 Mar 2023 15:21:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1679671279;
	bh=02GM7K6r27KRYha6EteRpwwTUBbmpkVxG9OyijKlG3g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fYn5+NeZtpXWi3nVp/4LLy8DH0H0ymzl9ykR3HGhR56lH3c2NdLc7Vq9e+nz6yGLM
	 th3lEHNjAcHCBgVNwpsDAEfKQW4MaCEZmWtunHGlBnrfdjyrj6dtyckAVr4AytNWP5
	 YoHlcyh9EHZLpMUfNtTxyT/IdQV32XFdbRz500HJrCQ7B2f3DEU8EIcFjArKBTNnl5
	 ITOUHbY65mucoIZhCnBong68mCzbzpAFuGBESgTkskfci1G2VXWa9Q9j1pHIxiB916
	 XgrZ1tXUn9nCbsGi93+pKgYS81I77gF95DX3iMV+WeX4Qo/HnMj3ISRhs917M91OiX
	 +DMCYejfbkXNw==
Date: Fri, 24 Mar 2023 15:21:13 +0000
From: Will Deacon <will@kernel.org>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Rob Herring <robh+dt@kernel.org>,
	Frank Rowand <frowand.list@gmail.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-mm@kvack.org
Subject: Re: [PATCH v8 3/4] arm64: Make use of memblock_isolate_memory for
 the linear mapping
Message-ID: <20230324152112.GD27199@willie-the-truck>
References: <20230316131711.1284451-1-alexghiti@rivosinc.com>
 <20230316131711.1284451-4-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230316131711.1284451-4-alexghiti@rivosinc.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230324_082123_025456_7FE8F686 
X-CRM114-Status: GOOD (  29.31  )
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

On Thu, Mar 16, 2023 at 02:17:10PM +0100, Alexandre Ghiti wrote:
> In order to isolate the kernel text mapping and the crash kernel
> region, we used some sort of hack to isolate thoses ranges which consisted
> in marking them as not mappable with memblock_mark_nomap.
> 
> Simply use the newly introduced memblock_isolate_memory function which does
> exactly the same but does not uselessly mark the region as not mappable.

But that's not what this patch does -- it's also adding special-case code
for kexec and, honestly, I'm struggling to see why this is improving
anything.

Can we leave the code like it is, or is there something else going on?

Will

> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/arm64/mm/mmu.c | 25 ++++++++++++++++---------
>  1 file changed, 16 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 6f9d8898a025..387c2a065a09 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -548,19 +548,18 @@ static void __init map_mem(pgd_t *pgdp)
>  
>  	/*
>  	 * Take care not to create a writable alias for the
> -	 * read-only text and rodata sections of the kernel image.
> -	 * So temporarily mark them as NOMAP to skip mappings in
> -	 * the following for-loop
> +	 * read-only text and rodata sections of the kernel image so isolate
> +	 * those regions and map them after the for loop.
>  	 */
> -	memblock_mark_nomap(kernel_start, kernel_end - kernel_start);
> +	memblock_isolate_memory(kernel_start, kernel_end - kernel_start);
>  
>  #ifdef CONFIG_KEXEC_CORE
>  	if (crash_mem_map) {
>  		if (defer_reserve_crashkernel())
>  			flags |= NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS;
>  		else if (crashk_res.end)
> -			memblock_mark_nomap(crashk_res.start,
> -			    resource_size(&crashk_res));
> +			memblock_isolate_memory(crashk_res.start,
> +						resource_size(&crashk_res));
>  	}
>  #endif
>  
> @@ -568,6 +567,17 @@ static void __init map_mem(pgd_t *pgdp)
>  	for_each_mem_range(i, &start, &end) {
>  		if (start >= end)
>  			break;
> +
> +		if (start == kernel_start)
> +			continue;
> +
> +#ifdef CONFIG_KEXEC_CORE
> +		if (start == crashk_res.start &&
> +		    crash_mem_map && !defer_reserve_crashkernel() &&
> +		    crashk_res.end)
> +			continue;
> +#endif
> +
>  		/*
>  		 * The linear map must allow allocation tags reading/writing
>  		 * if MTE is present. Otherwise, it has the same attributes as
> @@ -589,7 +599,6 @@ static void __init map_mem(pgd_t *pgdp)
>  	 */
>  	__map_memblock(pgdp, kernel_start, kernel_end,
>  		       PAGE_KERNEL, NO_CONT_MAPPINGS);
> -	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
>  
>  	/*
>  	 * Use page-level mappings here so that we can shrink the region
> @@ -603,8 +612,6 @@ static void __init map_mem(pgd_t *pgdp)
>  				       crashk_res.end + 1,
>  				       PAGE_KERNEL,
>  				       NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
> -			memblock_clear_nomap(crashk_res.start,
> -					     resource_size(&crashk_res));
>  		}
>  	}
>  #endif
> -- 
> 2.37.2
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
