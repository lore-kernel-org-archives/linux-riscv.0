Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 531C5C3DA5D
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jul 2024 16:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YVWTw3ZZXTB93W/d1NMge2vG1VHn4ya6FxGrU8aCOKo=; b=2ffh40lkkxZTmU
	1p+cs+jAX9J8TPc7exxCN+Ct5vmK4k29UojQCOCkCZA6YKlhOf9jzshypwU/V3ixbzAj+joxkfRUh
	5S8ovhsL7mlvOanyk6VPLSGFtKGvfZ7jU2g3FIeWeE8U3/Q4kz3hXTEz0AdLgANIAVSbup1uiWrsQ
	ZkX06wrV2D9qOOJoDDM0xLX/fmYa4tHSMmzJc+CoeR+nvn5/jO5OyCgPObircx1eQKWaUja42PawM
	cdBVQ/hAUNhdAFp58egXA7SuCfVzqfgO47xAZMv3Cq4cVb8DCm6OL6sPQYiFOKNsch+vao1YSZE52
	gSYJ2sD3opnYUAADdg4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVwKP-0000000A83P-0zSH;
	Mon, 22 Jul 2024 16:56:01 +0000
Received: from mail-io1-xd29.google.com ([2607:f8b0:4864:20::d29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sVwKL-0000000A82U-3POQ
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jul 2024 16:55:59 +0000
Received: by mail-io1-xd29.google.com with SMTP id ca18e2360f4ac-7f684710ff5so131478839f.1
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jul 2024 09:55:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1721667356; x=1722272156; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TJpVkFcz3oaAIdPa6wr9FjtOTD92km5BRGfQ47Tp1rg=;
        b=IwTRnn99hRyd1YyHY5L+q0XMFAXsQR3BaxoZRbSArvUYhLjCVJ9l9X08STikVuMVdU
         MXlKoB/tWNo0SSG9DTc7gxK5KBWXmsSpV2cieN3aTfNKdOsOItOf/KhMPhpCwgvUcPT8
         W6ZkkgLz+t234zN7aQxN8KcOVqxiFa+c/0e4zRDl0u5v1QIrh8CFKaJicSLmGucLy/fD
         DOV9mky4x/d6f+MXrdPqaXVp4+sTR5qgT0EULP/p7xTdWE+Cs/hxn+TJ2jf2tAMbUqiV
         +872nFPRROWMOj0agb+WELOSeJT/jMReK9B2GCvUAxISNCEMLnaurN64nC55Vb0ZqbKA
         IeHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721667356; x=1722272156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TJpVkFcz3oaAIdPa6wr9FjtOTD92km5BRGfQ47Tp1rg=;
        b=h5c36tEOC8OqzIF/tWenqNNrp44ytsaBYZTh2mk8W8eHyde6BezRr5XEDDAxofqhA4
         DyyX3fLUFxp7O+bHin7DIH8nN8+QIxjSdmnyJYQ3q8eXnTI7RZicUdQleWQEDxMY5fIy
         NnbTErd9JR7Y9nk0SVoBU43RI3KkDMXnBnol77OJeWIRGdmD/bA0ABUPt9iWSfS9PXxK
         woVcUT+pf24l+SerGRBsFKLE8Nvqp/AJsPci0dcp75fJafWUp+Huayx2T7Hp46DcGHim
         W1AN4vZyvMG+XRkA7A1mYxzp3dk9rLpTd/P4vSA2N+40ZojK576a4LbNI7LjqCaehvH5
         kZIw==
X-Forwarded-Encrypted: i=1; AJvYcCULgAz9KRK4VBZ5LKBCeWYFeJ7U9wyPKfzF3mUC5nr5pUDXZPqRIF01fUz5jiOivvTIgp4ZIDOvn3Dx6IM+ZX6x2HWbb4+zrU1a+HZbkM+t
X-Gm-Message-State: AOJu0YwVi31m1nWde8Xci9Zq+VIO+dOyhFXUxn/hduWVyjDa2/tIDbue
	Gzv6g1mz6uVUfQz+DuSWP61LvZrQiizruKsxhW0IMzm4CQrIRaisKo7wcYPVcJw=
X-Google-Smtp-Source: AGHT+IF6DZcN4m8qC/kqVtmMb4RhqugcHjLxIwZZ8uE+ZCC+rM98YEmL0kMFn4CSRlFeKKenBvE4TQ==
X-Received: by 2002:a05:6602:27d2:b0:7fa:244c:bfe9 with SMTP id ca18e2360f4ac-81ab6a10342mr675109439f.1.1721667355857;
        Mon, 22 Jul 2024 09:55:55 -0700 (PDT)
Received: from localhost ([140.82.166.162])
        by smtp.gmail.com with ESMTPSA id ca18e2360f4ac-819aba10e3bsm253873339f.7.2024.07.22.09.55.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 09:55:55 -0700 (PDT)
Date: Mon, 22 Jul 2024 11:55:54 -0500
From: Andrew Jones <ajones@ventanamicro.com>
To: Yunhui Cui <cuiyunhui@bytedance.com>
Cc: punit.agrawal@bytedance.com, paul.walmsley@sifive.com, 
	palmer@dabbelt.com, aou@eecs.berkeley.edu, akpm@linux-foundation.org, 
	surenb@google.com, peterx@redhat.com, alexghiti@rivosinc.com, willy@infradead.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] riscv/mm/fault: add show_pte() before die()
Message-ID: <20240722-a0d01590ba9ec0e0cc18ac74@orel>
References: <20240722042037.27934-1-cuiyunhui@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240722042037.27934-1-cuiyunhui@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240722_095557_874297_49AF7FA1 
X-CRM114-Status: GOOD (  17.85  )
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

On Mon, Jul 22, 2024 at 12:20:37PM GMT, Yunhui Cui wrote:
> When the kernel displays "Unable to handle kernel paging request at
> virtual address", we would like to confirm the status of the virtual
> address in the page table. So add show_pte() before die().
> 
> Signed-off-by: Yunhui Cui <cuiyunhui@bytedance.com>
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/mm/fault.c | 53 +++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 53 insertions(+)
> 
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 5224f3733802..666d282a8bf4 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -22,6 +22,58 @@
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
> +
> +	pr_alert("Current %s pgtable: %luK pagesize, %d-bit VAs, pgdp=0x%016lx\n",
> +		 current->comm, PAGE_SIZE/SZ_1K, VA_BITS,
> +		 (mm == &init_mm ? __pa_symbol(mm->pgd) :
> +		 (unsigned long)virt_to_phys(mm->pgd)));

nit: unnecessary () around the ternary.

> +
> +	pgdp = pgd_offset(mm, addr);
> +	pgd = pgdp_get(pgdp);
> +	pr_alert("[%016lx] pgd=%016lx", addr, pgd_val(pgd));
> +	if (pgd_none(pgd) || pgd_bad(pgd) || pgd_leaf(pgd))
> +		goto out;
> +
> +	p4dp = p4d_offset(pgdp, addr);
> +	p4d = p4dp_get(p4dp);
> +	pr_cont(", p4d=%016lx", p4d_val(p4d));
> +	if (p4d_none(p4d) || p4d_bad(p4d) || p4d_leaf(p4d))
> +		goto out;
> +
> +	pudp = pud_offset(p4dp, addr);
> +	pud = pudp_get(pudp);
> +	pr_cont(", pud=%016lx", pud_val(pud));
> +	if (pud_none(pud) || pud_bad(pud) || pud_leaf(pud))
> +		goto out;
> +
> +	pmdp = pmd_offset(pudp, addr);
> +	pmd = pmdp_get(pmdp);
> +	pr_cont(", pmd=%016lx", pmd_val(pmd));
> +	if (pmd_none(pmd) || pmd_bad(pmd) || pmd_leaf(pmd))
> +		goto out;
> +
> +	ptep = pte_offset_map(pmdp, addr);
> +	if (!ptep)
> +		goto out;
> +
> +	pte = ptep_get(ptep);
> +	pr_cont(", pte=%016lx", pte_val(pte));
> +	pte_unmap(ptep);
> +out:
> +	pr_cont("\n");
> +}
> +
>  static void die_kernel_fault(const char *msg, unsigned long addr,
>  		struct pt_regs *regs)
>  {
> @@ -31,6 +83,7 @@ static void die_kernel_fault(const char *msg, unsigned long addr,
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

Reviewed-by: Andrew Jones <ajones@ventanamicro.com>

Thanks,
drew

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
