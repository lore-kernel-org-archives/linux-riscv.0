Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C85C7C4332F
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Nov 2022 08:29:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=wo2jfbBuANFEpdXVSGM/8yq1qSBryi/N6SuX2e4znLU=; b=dR//QZFHFmnFu1
	ZBq/GajHJC32e04rDAjxXrZRygN/vCx/r4haaC6juqOmRtH0JG7sSDAgCkXdR/ZEzzZzaRJEzrvOp
	IBviiJyDfGJX09csYEYHK3OGR02qJV2C1GeaQN5CjpjNh5SLBlBTcqKU+3QvXGrO0AEnaB8HZtSds
	zZkF++rIwPVS4qDXwunPIjNcwHYA3cYWeUA9wj6wHvXeiesXaOLVR0t2uP7Z20h4kjIakNlYzqCao
	H04zh8O90QOxGAf5IINGWgYzSbS9YFLXY1CRrMmHllu+AmFLJy4DDZQw0UtNz9zmGWHLycB5OAzLS
	kCiCySrUmYa9FSAWjnrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPPy-00EDzO-V1; Fri, 11 Nov 2022 08:29:42 +0000
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1otPPr-00EDwY-8c
	for linux-riscv@lists.infradead.org; Fri, 11 Nov 2022 08:29:37 +0000
Received: by mail-ej1-x62d.google.com with SMTP id f27so11057966eje.1
        for <linux-riscv@lists.infradead.org>; Fri, 11 Nov 2022 00:29:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Lf3giwAMiTL69iTsaWeEw2qtvmJtf21YI6fNdLPl8xY=;
        b=K6+uHl5cVWzocSa4VaSCNPJmC2aGjgNeNwXkrzp81/VEcm9IRSPo0Jtef7RLromQEM
         DlJu45EfyOTZOGy0dkqGjRFvTyUHI0c4vXViLVogbPVCuB38fOlPXI29LdZClY9m4V7w
         DzXwR9fAQOzb+AreQJ0UQHENe0QbfFffRls0QUUB4r4g6oYy6q7r1IYEBdXkJTD4w/sl
         vTHs2V8eJnOCY5LNIGScLu5Gmep7pBvy/korqQML0LOp3JTKYBEUir5RQc0IlAAqrvUw
         oLRcse9+0lp/TYn5y5ASJgebRqkoV5Q5xOitea+APB3heyumAN364iPCuM36E5pg/JwI
         jTIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lf3giwAMiTL69iTsaWeEw2qtvmJtf21YI6fNdLPl8xY=;
        b=U3L46q+B7bxVWdINsjgq9d8Q+CPYqyoYG6YHsxyaoUObIOGaI3OlCDqKqg8KiNLot4
         H5NCNCmkqaYXEvGboi8c0ntoD2bNT8t/7LIEOQOV81BH+10XIoiotPX+zquvRGeciKdF
         NMvIXLHTPlTfHzEjgipI4nDqICB0iiedcawicaj1bDLec1dIhVPuxvHMxIgXwE6Whc1i
         ULIOQoB8Q9LUZVUBmblcgUnlNvrnpHySal3eIYN22SLHTtyRXUZIq4EBM+Q6Sopp6cJX
         efxIKS//pt0ARLZa+rHr5wfmrNEppPgs1k+9Elmp3hiQoSMorzA/8TAbouOg+37CCsfs
         Je0A==
X-Gm-Message-State: ANoB5pnVNLhknT7BWYQIcpLffel3MjDxOaD0iyocYJNjIiKk7uldxti6
	hRroZN3+G/DUhGcRA9+ktDY3AA==
X-Google-Smtp-Source: AA0mqf6xej+sc2LVPlx6uboKpREw+PGVEQcTDqJl/Vk3BfmY7PDiEnM0ISche5Wu4wjzAxcevCdSsw==
X-Received: by 2002:a17:906:249a:b0:781:fcf6:e73a with SMTP id e26-20020a170906249a00b00781fcf6e73amr1024035ejb.352.1668155370806;
        Fri, 11 Nov 2022 00:29:30 -0800 (PST)
Received: from localhost (cst2-173-16.cust.vodafone.cz. [31.30.173.16])
        by smtp.gmail.com with ESMTPSA id hd16-20020a170907969000b007ab1b4cab9bsm590498ejc.224.2022.11.11.00.29.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Nov 2022 00:29:30 -0800 (PST)
Date: Fri, 11 Nov 2022 09:29:29 +0100
From: Andrew Jones <ajones@ventanamicro.com>
To: guoren@kernel.org
Cc: anup@brainfault.org, paul.walmsley@sifive.com, palmer@dabbelt.com,
	conor.dooley@microchip.com, heiko@sntech.de,
	philipp.tomsich@vrull.eu, alex@ghiti.fr, hch@lst.de,
	gary@garyguo.net, jszhang@kernel.org,
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Anup Patel <apatel@ventanamicro.com>,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: Re: [PATCH V3] riscv: asid: Fixup stale TLB entry cause application
 crash
Message-ID: <20221111082929.f5s5n53r63mkkney@kamzik>
References: <20221111075902.798571-1-guoren@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221111075902.798571-1-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221111_002935_370597_8A7F834D 
X-CRM114-Status: GOOD (  35.97  )
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

On Fri, Nov 11, 2022 at 02:59:02AM -0500, guoren@kernel.org wrote:
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
> Cc: Anup Patel <apatel@ventanamicro.com>
> Cc: Palmer Dabbelt <palmer@rivosinc.com>
> ---
> Changes in v3:
>  - Move set/clear cpumask(mm) into set_mm (Make code more pretty
>    with Andrew's advice)
>  - Optimize comment description
> 
> Changes in v2:
>  - Fixup nommu compile problem (Thx Conor, Also Reported-by: kernel
>    test robot <lkp@intel.com>)
>  - Keep cpumask_clear_cpu for noasid
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
> 2.36.1
>

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
