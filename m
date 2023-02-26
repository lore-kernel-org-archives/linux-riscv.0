Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E278DC6FA8E
	for <linux-riscv@archiver.kernel.org>; Sun, 26 Feb 2023 16:45:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g4XycyOkmIAX9MP65V02Lq39ehQ+ldovA7QPVhWSPKI=; b=BGhwSpUNLDjG/5
	38xiECMAVEMXhmn6qdVp1VP3/tiebDc8hSUhrmRRzKq5+01sxVZQtyDFNhQyCAsMt4WY0+C00UlbO
	VUxR7LU58zlMETbnhZ+0FN35mBgkjeXttaar0Z1dqNx1cj+Ku3B8xLNdQ7Zwc8rsfNb6CjUMqcrzn
	VK1gPm/XC/aqMf603YPg6A4Xn1FhbKHoC1F5X83YkSwkTdsxl2cBFX7o8ISvRyVU26dc+G1FukTWe
	TZT/FGlf1YaswK/JWSsiIV94UgrT6Ci5+jP4c45QxIHGl0qhggF9lhHkWwexu++2GSZtq9HL4d5WV
	ziTZw3/kqy7ilpsUDa2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWK8n-007a7W-T3; Sun, 26 Feb 2023 16:44:49 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pWK8k-007a72-HR
	for linux-riscv@lists.infradead.org; Sun, 26 Feb 2023 16:44:48 +0000
Received: by mail-wm1-x329.google.com with SMTP id d41-20020a05600c4c2900b003e9e066550fso2465037wmp.4
        for <linux-riscv@lists.infradead.org>; Sun, 26 Feb 2023 08:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ocj2R23WDknAZNtiIVt3IW9MrBrM5xCTWqwgy1N+IqI=;
        b=TMYvOa2MEdtxVrJma4tnZyGFUMCuBCIu3k7h9+WtXgzPzpbJ5z/YUgJpWMA/oZEo5N
         mgFpcmPwCDagOB96K2BJxXbI5Qj29zVzCtlTIZk7SdkH3OF5I+dvSxPOULIz2P6BOrow
         vG+P/b3jJ3TSwWpTyJw9ILd3eoBOquR+TCJw+L2J6Q05gR+4gonZS+lxCMFDjvfOHtsV
         XtnNJr5KzncWJ0ZjaTRhM6pJAqbuaDbyMda4QhyUTD6XjzUD50zMRCqarZZzuAVjjVFr
         ccIJ6qZRrqZx89W755bONFXWL7Ek9hMQGQRtUw8pjchlPi2j/krcTENFAlkdTzU29dNn
         ZNeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ocj2R23WDknAZNtiIVt3IW9MrBrM5xCTWqwgy1N+IqI=;
        b=RmuuwqHmRWXJp8BnmBC6BsuWtxg+F0UQdB4QhuS2zRAdiHJW0pMjogIdN5fsQWimiv
         015cYvae6uo865k5fqv3Tm6y5oDeqaI/82b8QjN4Jfx+NoT359YlDK6uGw+BLrxRxanx
         8kiMHgFp3DlwhRV7Tw+pFbfgBJLiUhrQxR/bGVJdYsRYjOc54hqy1p25EdkKQGwYhmYi
         yiKQDNgtY0SyTaTrcMOKw/2IlBlaJECSAV2365LeSY5IoQt5BARBHIEiOCP70qFS157L
         lZnsnuo+LIfxG+Rq0xjKToTgraxKK3rqGJnROha9vCk29O/LMMDONFs8ck0D7WO09LVk
         1FwA==
X-Gm-Message-State: AO0yUKW8k8kr/2CY4QnIz/hJVv46V0D6Ci0VFP9D8VJRKscuB1AKH4L9
	z4O//eUubQl/kX+3j7qarSu8WA==
X-Google-Smtp-Source: AK7set85WMifA8RqMsuFmKb2O6ubbft7kyOg7T5hC17Bm/ZgEXzhLVpiF0wESGHsFa+iTUW5VOVqPQ==
X-Received: by 2002:a05:600c:358f:b0:3eb:3300:1d13 with SMTP id p15-20020a05600c358f00b003eb33001d13mr4728730wmq.14.1677429884420;
        Sun, 26 Feb 2023 08:44:44 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id p20-20020a05600c359400b003daf7721bb3sm10560323wmq.12.2023.02.26.08.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Feb 2023 08:44:44 -0800 (PST)
Date: Sun, 26 Feb 2023 17:44:42 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: Sergey Matyukevich <geomatsi@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Zong Li <zong.li@sifive.com>, Guo Ren <guoren@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Guo Ren <guoren@linux.alibaba.com>,
	Sergey Matyukevich <sergey.matyukevich@syntacore.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>, stable@vger.kernel.org
Subject: Re: [PATCH 2/2] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <20230226164442.lqrmpkwsaqj3og7x@orel>
References: <20230226150137.1919750-1-geomatsi@gmail.com>
 <20230226150137.1919750-3-geomatsi@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230226150137.1919750-3-geomatsi@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230226_084446_605666_A4C39EB7 
X-CRM114-Status: GOOD (  35.56  )
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

On Sun, Feb 26, 2023 at 06:01:37PM +0300, Sergey Matyukevich wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
> 
> After use_asid_allocator is enabled, the userspace application will
> crash by stale TLB entries. Because only using cpumask_clear_cpu without
> local_flush_tlb_all couldn't guarantee CPU's TLB entries were fresh.
> Then set_mm_asid would cause the user space application to get a stale
> value by stale TLB entry, but set_mm_noasid is okay.
> 
> Here is the symptom of the bug:
> unhandled signal 11 code 0x1 (coredump)
>    0x0000003fd6d22524 <+4>:     auipc   s0,0x70
>    0x0000003fd6d22528 <+8>:     ld      s0,-148(s0) # 0x3fd6d92490
> => 0x0000003fd6d2252c <+12>:    ld      a5,0(s0)
> (gdb) i r s0
> s0          0x8082ed1cc3198b21       0x8082ed1cc3198b21
> (gdb) x /2x 0x3fd6d92490
> 0x3fd6d92490:   0xd80ac8a8      0x0000003f
> The core dump file shows that register s0 is wrong, but the value in
> memory is correct. Because 'ld s0, -148(s0)' used a stale mapping entry
> in TLB and got a wrong result from an incorrect physical address.
> 
> When the task ran on CPU0, which loaded/speculative-loaded the value of
> address(0x3fd6d92490), then the first version of the mapping entry was
> PTWed into CPU0's TLB.
> When the task switched from CPU0 to CPU1 (No local_tlb_flush_all here by
> asid), it happened to write a value on the address (0x3fd6d92490). It
> caused do_page_fault -> wp_page_copy -> ptep_clear_flush ->
> ptep_get_and_clear & flush_tlb_page.
> The flush_tlb_page used mm_cpumask(mm) to determine which CPUs need TLB
> flush, but CPU0 had cleared the CPU0's mm_cpumask in the previous
> switch_mm. So we only flushed the CPU1 TLB and set the second version
> mapping of the PTE. When the task switched from CPU1 to CPU0 again, CPU0
> still used a stale TLB mapping entry which contained a wrong target
> physical address. It raised a bug when the task happened to read that
> value.
> 
>    CPU0                               CPU1
>    - switch 'task' in
>    - read addr (Fill stale mapping
>      entry into TLB)
>    - switch 'task' out (no tlb_flush)
>                                       - switch 'task' in (no tlb_flush)
>                                       - write addr cause pagefault
>                                         do_page_fault() (change to
>                                         new addr mapping)
>                                           wp_page_copy()
>                                             ptep_clear_flush()
>                                               ptep_get_and_clear()
>                                               & flush_tlb_page()
>                                         write new value into addr
>                                       - switch 'task' out (no tlb_flush)
>    - switch 'task' in (no tlb_flush)
>    - read addr again (Use stale
>      mapping entry in TLB)
>      get wrong value from old phyical
>      addr, BUG!
> 
> The solution is to keep all CPUs' footmarks of cpumask(mm) in switch_mm,
> which could guarantee to invalidate all stale TLB entries during TLB
> flush.
> 
> Fixes: 65d4b9c53017 ("RISC-V: Implement ASID allocator")
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> Signed-off-by: Guo Ren <guoren@kernel.org>
> Tested-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Tested-by: Zong Li <zong.li@sifive.com>
> Tested-by: Sergey Matyukevich <sergey.matyukevich@syntacore.com>
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> Cc: stable@vger.kernel.org
> 
> ---
>  arch/riscv/mm/context.c | 30 ++++++++++++++++++++----------
>  1 file changed, 20 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 7acbfbd14557..0f784e3d307b 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -205,12 +205,24 @@ static void set_mm_noasid(struct mm_struct *mm)
>  	local_flush_tlb_all();
>  }
>  
> -static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
> +static inline void set_mm(struct mm_struct *prev,
> +			  struct mm_struct *next, unsigned int cpu)
>  {
> -	if (static_branch_unlikely(&use_asid_allocator))
> -		set_mm_asid(mm, cpu);
> -	else
> -		set_mm_noasid(mm);
> +	/*
> +	 * The mm_cpumask indicates which harts' TLBs contain the virtual
> +	 * address mapping of the mm. Compared to noasid, using asid
> +	 * can't guarantee that stale TLB entries are invalidated because
> +	 * the asid mechanism wouldn't flush TLB for every switch_mm for
> +	 * performance. So when using asid, keep all CPUs footmarks in
> +	 * cpumask() until mm reset.
> +	 */
> +	cpumask_set_cpu(cpu, mm_cpumask(next));
> +	if (static_branch_unlikely(&use_asid_allocator)) {
> +		set_mm_asid(next, cpu);
> +	} else {
> +		cpumask_clear_cpu(cpu, mm_cpumask(prev));
> +		set_mm_noasid(next);
> +	}
>  }
>  
>  static int __init asids_init(void)
> @@ -264,7 +276,8 @@ static int __init asids_init(void)
>  }
>  early_initcall(asids_init);
>  #else
> -static inline void set_mm(struct mm_struct *mm, unsigned int cpu)
> +static inline void set_mm(struct mm_struct *prev,
> +			  struct mm_struct *next, unsigned int cpu)
>  {
>  	/* Nothing to do here when there is no MMU */
>  }
> @@ -317,10 +330,7 @@ void switch_mm(struct mm_struct *prev, struct mm_struct *next,
>  	 */
>  	cpu = smp_processor_id();
>  
> -	cpumask_clear_cpu(cpu, mm_cpumask(prev));
> -	cpumask_set_cpu(cpu, mm_cpumask(next));
> -
> -	set_mm(next, cpu);
> +	set_mm(prev, next, cpu);
>  
>  	flush_icache_deferred(next, cpu);
>  }
> -- 
> 2.39.2
>

This is identical to what I reviewed before, so my r-b could have been
kept, anyway here it is again

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
