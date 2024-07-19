Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFE35C3DA5D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jul 2024 14:33:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=5NjqV89ESkpX8vg33kpcR/73ouJRQry+uLNrlNkeUJ4=; b=uhEjtBBvUfChhB
	YklUgXtBGLbn2p7TOfNkJ1Dj1RU16e2wkIClsCtRgoOXEuzFZfnQ0ALBJ2LTXZH9iIy6/M5u+bA2v
	RO3zYbtZwVMPUkuz007+wz/Tx9roM7L80dQ3aKdTCmc6TwC2pGI6EwmswVU7mFER8pcfKYszZPyhw
	BjIJDrZiKSwj+lC593hmhbNx4I+67qLrBI+Fq7R50BLX/hJmiCiraKUngDpQMuf1VQjvGhPUBVETi
	xKxPiv/BH8JSdxAPgRsXk7+/ZgBN2K+dCe/XkrKgf3icPPV6iBB9QPZiHiQ3ktakz6yKW/lJYB9Xx
	eBfvlWAjehm8uaTQUz9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUofr-00000002x1L-05GF;
	Fri, 19 Jul 2024 14:33:31 +0000
Received: from mail-io1-xd34.google.com ([2607:f8b0:4864:20::d34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sUofn-00000002x0J-3xgg
	for linux-riscv@lists.infradead.org;
	Fri, 19 Jul 2024 14:33:29 +0000
Received: by mail-io1-xd34.google.com with SMTP id ca18e2360f4ac-816ca307407so67659039f.2
        for <linux-riscv@lists.infradead.org>; Fri, 19 Jul 2024 07:33:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721399607; x=1722004407; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=h+5kSwJTva1eAns96uDyGpry7vA7DpXDv3rx/8QGIlU=;
        b=I+Daf5vBYNibPgMrRnzX0xeRDgxbRSUYNFz7iYbfmUhhgshPZ87bJl+xy65cWLdsiT
         jaOzzREl2H86t3DRlyUBBEZ7rUTsUI6Xl6jUg9SBavtihvEWbqdjNcGT17nc+3jy3XP+
         y8i48YaZYVDfmdP1ZM9S0WnOgJdeln5IXa8QmXe3KQqRBHfHT6n5OCNm4fkbJi8b8seA
         qkMcH8N4oFnsaDitA0jBC6PpCY4DpsNKcSLctH7E/PNMTd0L8vpGh/HeRv2ToKWVoy73
         mtxJfcgksKWx/PjbAD7a1ScLIAmVdEh2E7pNZy8/OfosXlz0wIszCRHStPglarGoIiG1
         TTzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721399607; x=1722004407;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h+5kSwJTva1eAns96uDyGpry7vA7DpXDv3rx/8QGIlU=;
        b=ks01apwiJg3MbTTm8Y6+LnNiSdIsOurmYAYvm5mmKPxWl6Yt4aLmxTjjZYX6G1Ul6u
         n3RHbQmkajQNLb4/TfLyvren+eiMdFPJBzFQuxxzh1UnGkyPNCcnudtSpp4nn1BflqbC
         dv1D3xw7pByLVY3leHbULaXxIfe/cruaXpoqTuucbkdMmqubzGMxPMcvdI2fiKsUEfm1
         HzDq5m4rLm7p1FySN+6+DSjjRB5XX0ru+RVkhwBZx+CYqWJ0W3WQkX+YNCNug515ncg1
         lcuIMGMi6PfNnbPAUCj5eLgMZvdrxNOoUW4xywO7SFswBxWhESWBlSOiMXu3CYxrsAhA
         NXZA==
X-Forwarded-Encrypted: i=1; AJvYcCWfnFFN6s6IQdCmwOdoQzFonmFm5sG9JexgSxB/MmDf+VU5ifX9LGkDYWFfqZDicWDITQmL9cNLKNx7IEx74twBuNiuKargUkIsF4s/FLys
X-Gm-Message-State: AOJu0Yxo9ATEG+PeyxlJuMikmAmLrIBkMxdTGUjmArTgjGmY29hTOxr7
	tLLXP8b4LMW2rDV2i+Vk8/D51vNGk7I3RGE1/jHarwQdheA0C3lR0O5pBa9syHA=
X-Google-Smtp-Source: AGHT+IGBIH81UeXN6SlFXOdu4MLJzOYbz3k9slkbrwqR2dQNfRDz53dI22h9/1Fj7vJIqKpGwZawNQ==
X-Received: by 2002:a05:6602:1503:b0:804:fd88:3b08 with SMTP id ca18e2360f4ac-81710cc8de6mr1099772539f.10.1721399601959;
        Fri, 19 Jul 2024 07:33:21 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-4c2343d3230sm340001173.133.2024.07.19.07.32.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 07:32:30 -0700 (PDT)
Date: Fri, 19 Jul 2024 09:32:13 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	surenb@google.com, peterx@redhat.com, alexghiti@rivosinc.com, willy@infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv/mm/fault: add show_pte() before die()
Message-ID: <20240719-92015016b960e7153e97b39d@orel>
References: <20240718020935.12803-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240718020935.12803-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240719_073328_009138_532C53A2 
X-CRM114-Status: GOOD (  19.95  )
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

On Thu, Jul 18, 2024 at 10:09:35AM GMT, Yunhui Cui wrote:
> When the kernel displays "Unable to handle kernel paging request at
> virtual address", we would like to confirm the status of the virtual
> address in the page table. So add show_pte() before die().
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> ---
>  arch/riscv/mm/fault.c | 47 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 47 insertions(+)
> 
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 90d4ba36d1d0..dfe3ce38e16b 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -22,6 +22,52 @@
>  
>  #include "../kernel/head.h"
>  
> +static void show_pte(unsigned long addr)
> +{
> +	pgd_t *pgdp, pgd;
> +	p4d_t *p4dp, p4d;
> +	pud_t *pudp, pud;
> +	pmd_t *pmdp, pmd;
> +	pte_t *ptep, pte;
> +	struct mm_struct *mm = current->mm;
> +
> +	if (!mm)
> +		mm = &init_mm;

arm64 show_pte starts with a summary line where the pgtable type (swapper
vs. user), number of VA bits, and physical address of the pgd are
displayed. Should we add that too?

Thanks,
drew

> +	pgdp = pgd_offset(mm, addr);
> +	pgd = READ_ONCE(*pgdp);
> +	pr_alert("[%016lx] pgd=%016lx", addr, pgd_val(pgd));
> +	if (pgd_none(pgd) || pgd_bad(pgd))
> +		goto out;
> +
> +	p4dp = p4d_offset(pgdp, addr);
> +	p4d = READ_ONCE(*p4dp);
> +	pr_cont(", p4d=%016lx", p4d_val(p4d));
> +	if (p4d_none(p4d) || p4d_bad(p4d))
> +		goto out;
> +
> +	pudp = pud_offset(p4dp, addr);
> +	pud = READ_ONCE(*pudp);
> +	pr_cont(", pud=%016lx", pud_val(pud));
> +	if (pud_none(pud) || pud_bad(pud))
> +		goto out;
> +
> +	pmdp = pmd_offset(pudp, addr);
> +	pmd = READ_ONCE(*pmdp);
> +	pr_cont(", pmd=%016lx", pmd_val(pmd));
> +	if (pmd_none(pmd) || pmd_bad(pmd))
> +		goto out;
> +
> +	ptep = pte_offset_map(pmdp, addr);
> +	if (!ptep)
> +		goto out;
> +
> +	pte = READ_ONCE(*ptep);
> +	pr_cont(", pte=%016lx", pte_val(pte));
> +	pte_unmap(ptep);
> +out:
> +	pr_cont("\n");
> +}
> +
>  static void die_kernel_fault(const char *msg, unsigned long addr,
>  		struct pt_regs *regs)
>  {
> @@ -31,6 +77,7 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
>  		addr);
>  
>  	bust_spinlocks(0);
> +	show_pte(addr);
>  	die(regs, "Oops");
>  	make_task_dead(SIGKILL);
>  }
> -- 
> 2.39.2
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
