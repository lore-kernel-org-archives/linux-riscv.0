Return-Path: <SRS0=Ai3O=KJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C39F2C433ED
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 15:20:50 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2E85D61457
	for <linux-riscv@archiver.kernel.org>; Fri, 14 May 2021 15:20:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2E85D61457
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=XoeZVD0s7Yh3o6b6Kq9yfVD3S3DuUaY6XgdCSO/L0k0=; b=Zj+B7x6RIYaXdj+mDyPPmsacW
	kKmQ1VufVTKaflichvwG0DPqOFItv/Hz3ZdFhQHEV25IT06c+bhu86FJuRbBKfeKqy3R5U+JbC3By
	LUjQjrgoRr1pIhNBrxZJvIpkcLH9gtioFH+iaLexqYOyeiWy7cTMlisS2QeFPGQK0lG45vsL/KPoX
	3d7MHRpwFoBUCVYL3e1Po0SXVRY4QzgF0vxfCJSuL5oyb7TMgTJ8POX0jgq87AddBsUmz8rRX9W5t
	/WJoVhEqO1q+aCTlKYUp8xRY7tJl31L4j45iD8yzQNqLogHro/8Hw1ccWN+scMaFV+0wPMBBPQK6Y
	YVHxSq9Pg==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lhZc7-008O1P-O2; Fri, 14 May 2021 15:20:31 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhZc5-008O13-KI
 for linux-riscv@desiato.infradead.org; Fri, 14 May 2021 15:20:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:Cc:To:Subject:Message-ID
 :Date:From:In-Reply-To:References:MIME-Version:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=OUtJdEoTp2E5reOLxrwFg0FEHgUh9mJq9am3px70vxo=; b=avHP3QxyaE+JMb91dZCjYrc8ty
 e8c7QC+PqRCtgD0nVTaXxPUkzXAMwn/c3PHRUb4cJ4ayVVvpbCTHsyvrjOJ3ojYSlXC9EelhtX67Z
 ociaCw7mlzt4joM4yZQJY65vMCHM0LdiK44U3I+oWizIzpUhlnNyeqozje52KuNiycusu2LJFEo5B
 mps5U+PkNBKApsFRU1Na/QPpRWTF0qbKd0A4sb5W4stZ5Hhx1LNUGl+3uPWb41AUSUirSLw+HHL1z
 AeLcsGEtYyOwT5FvhoSFA6K/FNGbsN/oO/NvAIP34+MIGHHQticBlXIsRB9bH6quf/Mwrezwx6IGB
 163HGIGQ==;
Received: from mail-ot1-x335.google.com ([2607:f8b0:4864:20::335])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lhZc2-00C4nS-K3
 for linux-riscv@lists.infradead.org; Fri, 14 May 2021 15:20:28 +0000
Received: by mail-ot1-x335.google.com with SMTP id
 u25-20020a0568302319b02902ac3d54c25eso26788326ote.1
 for <linux-riscv@lists.infradead.org>; Fri, 14 May 2021 08:20:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=OUtJdEoTp2E5reOLxrwFg0FEHgUh9mJq9am3px70vxo=;
 b=ExnpX06y3XJ21mt9usdh2O3KZNtrIa6RUkQ9fHy94A4+viP5UjetMSS6qHA1EYo66k
 i3ygvXWEryAT4ug2cUz7O5I3cRN9h85yc1iA8P5WpI+TywttwjJp3dTbVi8ziigv3mmW
 RWYFEH9bVv8rraoGl0YqpfkswuWNysT0tqf8F+1IpVJy+ixAxk0vvyN4SZM4QCTF6tqX
 ZCXiPDZ4L4Av5adpYkwF6OktOOEZe6r85PFRplgCSAkJRlaDn9+73axA7LVTUrlM2q+k
 71YSAy7s63SKfNcb0NqTsSXlO8xqBdvfbip66DSOd+pc2EKVfr0iMSNC2mi38uzwiFl8
 eYxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=OUtJdEoTp2E5reOLxrwFg0FEHgUh9mJq9am3px70vxo=;
 b=NvtQ5VAum9Sa2dM+iIN9eKKr5hbFY3oMmM0kpg5EbpJnaqYyieGZX9RyYLy/neQ/LA
 hyHRT7elChofJFvvqEBQ+bZOI8P+WjOGYZ3rd+etCt5Br8dgwlg7Wl/SJyXDO+NQQHZD
 lVyDCDQkz2MigsvErsiE/6+RN2XNSZQFrj9XDVr3QxBULfVTvWVq73QcP7EPbp0ZkY68
 1yCii/N3RWVz3YteoHN5NPjmb1agAeqCycKGAN5ZCNQ4TllIYDI+UBH6GH3CgnNuWeyO
 84CW6TtprAQ/r6tWlt3VPg8dWrJa8vEhmJpZAIb4Ne1V9jQPh6w4rLXO8gdW/XKZzSKJ
 ra0A==
X-Gm-Message-State: AOAM533cp3Plss1QZfqk4OdUzo7GN6OIqOx8ZqSqjago8E8PdCHYfSPM
 lAv6n2SVUwSIq96+fgKOJMwimQWp3HMTJLAUF9w4UQ==
X-Google-Smtp-Source: ABdhPJxH9nGYBL/yhdfH66VQoMarpQjIrk9WZmG+j9VyZb+D8KSGVokvDOkMdGxcy48nFWyZ3phTrOFS+w2Z1Vq1lcM=
X-Received: by 2002:a9d:7a54:: with SMTP id z20mr25363513otm.17.1621005622590; 
 Fri, 14 May 2021 08:20:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210514034432.2004082-1-liushixin2@huawei.com>
In-Reply-To: <20210514034432.2004082-1-liushixin2@huawei.com>
From: Marco Elver <elver@google.com>
Date: Fri, 14 May 2021 17:20:10 +0200
Message-ID: <CANpmjNMN2xQ28nsqUzE+XJ_muHUT+EGdCTCDhvLH2hMMxuTidQ@mail.gmail.com>
Subject: Re: [PATCH RFC v2] riscv: Enable KFENCE for riscv64
To: Liu Shixin <liushixin2@huawei.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Potapenko <glider@google.com>, 
 Dmitry Vyukov <dvyukov@google.com>, linux-riscv@lists.infradead.org, 
 LKML <linux-kernel@vger.kernel.org>, kasan-dev <kasan-dev@googlegroups.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210514_082026_699300_D03C2615 
X-CRM114-Status: GOOD (  25.47  )
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

On Fri, 14 May 2021 at 05:11, Liu Shixin <liushixin2@huawei.com> wrote:
> Add architecture specific implementation details for KFENCE and enable
> KFENCE for the riscv64 architecture. In particular, this implements the
> required interface in <asm/kfence.h>.
>
> KFENCE requires that attributes for pages from its memory pool can
> individually be set. Therefore, force the kfence pool to be mapped at
> page granularity.
>
> I tested this patch using the testcases in kfence_test.c and all passed.
>
> Signed-off-by: Liu Shixin <liushixin2@huawei.com>

Acked-by: Marco Elver <elver@google.com>


> ---
> v1->v2: Change kmalloc() to pte_alloc_one_kernel() for allocating pte.
>
>  arch/riscv/Kconfig              |  1 +
>  arch/riscv/include/asm/kfence.h | 51 +++++++++++++++++++++++++++++++++
>  arch/riscv/mm/fault.c           | 11 ++++++-
>  3 files changed, 62 insertions(+), 1 deletion(-)
>  create mode 100644 arch/riscv/include/asm/kfence.h
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index c426e7d20907..000d8aba1030 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -64,6 +64,7 @@ config RISCV
>         select HAVE_ARCH_JUMP_LABEL_RELATIVE
>         select HAVE_ARCH_KASAN if MMU && 64BIT
>         select HAVE_ARCH_KASAN_VMALLOC if MMU && 64BIT
> +       select HAVE_ARCH_KFENCE if MMU && 64BIT
>         select HAVE_ARCH_KGDB
>         select HAVE_ARCH_KGDB_QXFER_PKT
>         select HAVE_ARCH_MMAP_RND_BITS if MMU
> diff --git a/arch/riscv/include/asm/kfence.h b/arch/riscv/include/asm/kfence.h
> new file mode 100644
> index 000000000000..c25d67e0b8ba
> --- /dev/null
> +++ b/arch/riscv/include/asm/kfence.h
> @@ -0,0 +1,51 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +
> +#ifndef _ASM_RISCV_KFENCE_H
> +#define _ASM_RISCV_KFENCE_H
> +
> +#include <linux/kfence.h>
> +#include <linux/pfn.h>
> +#include <asm-generic/pgalloc.h>
> +#include <asm/pgtable.h>
> +
> +static inline bool arch_kfence_init_pool(void)
> +{
> +       int i;
> +       unsigned long addr;
> +       pte_t *pte;
> +       pmd_t *pmd;
> +
> +       for (addr = (unsigned long)__kfence_pool; is_kfence_address((void *)addr);
> +            addr += PAGE_SIZE) {
> +               pte = virt_to_kpte(addr);
> +               pmd = pmd_off_k(addr);
> +
> +               if (!pmd_leaf(*pmd) && pte_present(*pte))
> +                       continue;
> +
> +               pte = pte_alloc_one_kernel(&init_mm);
> +               for (i = 0; i < PTRS_PER_PTE; i++)
> +                       set_pte(pte + i, pfn_pte(PFN_DOWN(__pa((addr & PMD_MASK) + i * PAGE_SIZE)), PAGE_KERNEL));
> +
> +               set_pmd(pmd, pfn_pmd(PFN_DOWN(__pa(pte)), PAGE_TABLE));
> +               flush_tlb_kernel_range(addr, addr + PMD_SIZE);
> +       }
> +
> +       return true;
> +}
> +
> +static inline bool kfence_protect_page(unsigned long addr, bool protect)
> +{
> +       pte_t *pte = virt_to_kpte(addr);
> +
> +       if (protect)
> +               set_pte(pte, __pte(pte_val(*pte) & ~_PAGE_PRESENT));
> +       else
> +               set_pte(pte, __pte(pte_val(*pte) | _PAGE_PRESENT));
> +
> +       flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> +
> +       return true;
> +}
> +
> +#endif /* _ASM_RISCV_KFENCE_H */
> diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
> index 096463cc6fff..aa08dd2f8fae 100644
> --- a/arch/riscv/mm/fault.c
> +++ b/arch/riscv/mm/fault.c
> @@ -14,6 +14,7 @@
>  #include <linux/signal.h>
>  #include <linux/uaccess.h>
>  #include <linux/kprobes.h>
> +#include <linux/kfence.h>
>
>  #include <asm/ptrace.h>
>  #include <asm/tlbflush.h>
> @@ -45,7 +46,15 @@ static inline void no_context(struct pt_regs *regs, unsigned long addr)
>          * Oops. The kernel tried to access some bad page. We'll have to
>          * terminate things with extreme prejudice.
>          */
> -       msg = (addr < PAGE_SIZE) ? "NULL pointer dereference" : "paging request";
> +       if (addr < PAGE_SIZE)
> +               msg = "NULL pointer dereference";
> +       else {
> +               if (kfence_handle_page_fault(addr, regs->cause == EXC_STORE_PAGE_FAULT, regs))
> +                       return;
> +
> +               msg = "paging request";
> +       }
> +
>         die_kernel_fault(msg, addr, regs);
>  }
>
> --
> 2.18.0.huawei.25
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
