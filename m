Return-Path: <SRS0=WRFO=IO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74FFCC433DB
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 05:06:12 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 102E96513C
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Mar 2021 05:06:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 102E96513C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=brainfault.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:
	References:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=4XKWglxNt0TdfyW1Gp0pWqSXEsSjQ2BFrUEyxS/AKAc=; b=nSIDECEL5WjrFERVGKoDDVyDC
	iTSMaZWtXy4znaIHnZCxjkVUHMZxktTT7cvBhqolbiOlIvieU78VgvvpEjgen1gB4Xy8rLzYr7rnq
	84DJD1pyea4z9texacdXgkfQFhhKVLuGwL4NElHZ5O+CrgEjfGj8u6ulELAtUhEagzhqSWcWzAtT9
	eKm/v5ahdkaAI2CYG6GlG2IzbToigP9iInq5LrbmDjrDH0DOnvRF0Jak/91JdmP/tbsvBO6Cj6vKw
	NlqdX/SgVXKeIaaHkZQf1GXqIu+UsalaLz3mWCkyWDW1hlwVSh7mZV8l7Q3ZwyZgY9Dbb/Qiirfwf
	FLw7CMqBA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lM1tz-00HQfO-Ls; Tue, 16 Mar 2021 05:05:56 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lM1tu-00HQeG-Gv
 for linux-riscv@lists.infradead.org; Tue, 16 Mar 2021 05:05:54 +0000
Received: by mail-wr1-x42d.google.com with SMTP id j2so9753930wrx.9
 for <linux-riscv@lists.infradead.org>; Mon, 15 Mar 2021 22:05:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=brainfault-org.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+rZPaiH/yLq0MFAG35XUjXrCO0vB48E4LQTZ529JMwM=;
 b=yzKHB/sj0OrojWnnyNv5CkC4WHXtNIJLI1b1CsWFdrfmC5WfyBbkiUxDe++33+yQvE
 7f8eseKsakhlg40g2gBu+kfGQkxMfqyuyKPSkcv7n6IfGktuGzdq6OzDYah+RcJ1yyRg
 NkWwMqKbG2G49SrT2aeIPzvrFBuRfBjzMH2zd85igOUJsdJJcdq652pfqu64R36UPnqH
 GKfTSvifu6E76jvNiKTcSJf234VaDFSWLGUS3ZI2nvE6u8pldceXL0o/8uHnf4gmhIKM
 s7LUL/yMg9GrNdNZvjpaK3jV/ddFaloOnVrv0z0bhMpyGmpiYx8aLMdhlht1wDe320wR
 LdMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+rZPaiH/yLq0MFAG35XUjXrCO0vB48E4LQTZ529JMwM=;
 b=XvtscAEg0lGNCjh6qPm1dSeQaW6ZLIsARv/lvvG1AbtMn8u2lu35tAp/L1mqf/l0yx
 xIIKNXM6QqI9Ash+M4cSF/+lwgUgOlb7l/4LytOPfrE35iC3W9hmt8NzzPMgoYewiyn1
 grP6vjtisCA1AztZifThu7sxA++ZhbRZ7SKTw1NQg/I96LhY/3V6soD66e8tt96Zmj/J
 QP8K0tMgvJBb4K1vL/5YUq/8tyjfBESt18SiHgcSmdlwLRBDTS8b8Y7HfbFXoRl2B4s2
 n04alZIk5vqx9/kFn8yO7WvTexTM/vdPyG0hUz8zyCDUbtbmd3cjqVPd1dvVMHtqNDWe
 wm0w==
X-Gm-Message-State: AOAM532+K7ETaGGIuOQBLgJGuvHQoeDHmsHw8uivdlrHzYH9/vafoalS
 m9bZTWiX7HCfXZKlkKyUZkLoA8hszUCYEXUgZRmLbw==
X-Google-Smtp-Source: ABdhPJxXkpJb4tW52fMmIx4jAzy+Kw374RtzHxkfzAZabF5T1ohxVHpJRhZ6rYBTD41wHDr5gn9s3bsMyVTCZHXvvD4=
X-Received: by 2002:adf:9544:: with SMTP id 62mr2695924wrs.128.1615871149865; 
 Mon, 15 Mar 2021 22:05:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210316015328.13516-1-liu@jiuyang.me>
 <20210316034638.16276-1-liu@jiuyang.me>
In-Reply-To: <20210316034638.16276-1-liu@jiuyang.me>
From: Anup Patel <anup@brainfault.org>
Date: Tue, 16 Mar 2021 10:35:38 +0530
Message-ID: <CAAhSdy3eEXtba_ebUnPW_OUHRMKsg+O9sBx_DHAmrkTUCfHXNg@mail.gmail.com>
Subject: Re: [PATCH] Insert SFENCE.VMA in function set_pte_at for RISCV
To: Jiuyang Liu <liu@jiuyang.me>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Andrew Waterman <waterman@eecs.berkeley.edu>,
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>, 
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>, 
 Kefeng Wang <wangkefeng.wang@huawei.com>, Zong Li <zong.li@sifive.com>, 
 Greentime Hu <greentime.hu@sifive.com>,
 linux-riscv <linux-riscv@lists.infradead.org>, 
 "linux-kernel@vger.kernel.org List" <linux-kernel@vger.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210316_050551_972771_95743100 
X-CRM114-Status: GOOD (  25.77  )
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

+Alex

On Tue, Mar 16, 2021 at 9:20 AM Jiuyang Liu <liu@jiuyang.me> wrote:
>
> This patch inserts SFENCE.VMA after modifying PTE based on RISC-V
> specification.
>
> arch/riscv/include/asm/pgtable.h:
> 1. implement pte_user, pte_global and pte_leaf to check correspond
> attribute of a pte_t.

Adding pte_user(), pte_global(), and pte_leaf() is fine.

>
> 2. insert SFENCE.VMA in set_pte_at based on RISC-V Volume 2, Privileged
> Spec v. 20190608 page 66 and 67:
> If software modifies a non-leaf PTE, it should execute SFENCE.VMA with
> rs1=x0. If any PTE along the traversal path had its G bit set, rs2 must
> be x0; otherwise, rs2 should be set to the ASID for which the
> translation is being modified.
> If software modifies a leaf PTE, it should execute SFENCE.VMA with rs1
> set to a virtual address within the page. If any PTE along the traversal
> path had its G bit set, rs2 must be x0; otherwise, rs2 should be set to
> the ASID for which the translation is being modified.
>
> arch/riscv/include/asm/tlbflush.h:
> 1. implement get_current_asid to get current program asid.
> 2. implement local_flush_tlb_asid to flush tlb with asid.

As per my understanding, we don't need to explicitly invalidate local TLB
in set_pte() or set_pet_at() because generic Linux page table management
(<linux>/mm/*) will call the appropriate flush_tlb_xyz() function after page
table updates. Also, just local TLB flush is generally not sufficient because
a lot of page tables will be used accross on multiple HARTs.

>
> Signed-off-by: Jiuyang Liu <liu@jiuyang.me>
> ---
>  arch/riscv/include/asm/pgtable.h  | 27 +++++++++++++++++++++++++++
>  arch/riscv/include/asm/tlbflush.h | 12 ++++++++++++
>  2 files changed, 39 insertions(+)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index ebf817c1bdf4..5a47c60372c1 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -222,6 +222,16 @@ static inline int pte_write(pte_t pte)
>         return pte_val(pte) & _PAGE_WRITE;
>  }
>
> +static inline int pte_user(pte_t pte)
> +{
> +       return pte_val(pte) & _PAGE_USER;
> +}
> +
> +static inline int pte_global(pte_t pte)
> +{
> +       return pte_val(pte) & _PAGE_GLOBAL;
> +}
> +
>  static inline int pte_exec(pte_t pte)
>  {
>         return pte_val(pte) & _PAGE_EXEC;
> @@ -248,6 +258,11 @@ static inline int pte_special(pte_t pte)
>         return pte_val(pte) & _PAGE_SPECIAL;
>  }
>
> +static inline int pte_leaf(pte_t pte)
> +{
> +       return pte_val(pte) & (_PAGE_READ | _PAGE_WRITE | _PAGE_EXEC);
> +}
> +
>  /* static inline pte_t pte_rdprotect(pte_t pte) */
>
>  static inline pte_t pte_wrprotect(pte_t pte)
> @@ -358,6 +373,18 @@ static inline void set_pte_at(struct mm_struct *mm,
>                 flush_icache_pte(pteval);
>
>         set_pte(ptep, pteval);
> +
> +       if (pte_present(pteval)) {
> +               if (pte_leaf(pteval)) {
> +                       local_flush_tlb_page(addr);
> +               } else {
> +                       if (pte_global(pteval))
> +                               local_flush_tlb_all();
> +                       else
> +                               local_flush_tlb_asid();
> +
> +               }
> +       }
>  }
>
>  static inline void pte_clear(struct mm_struct *mm,
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 394cfbccdcd9..1f9b62b3670b 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -21,6 +21,18 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  {
>         __asm__ __volatile__ ("sfence.vma %0" : : "r" (addr) : "memory");
>  }
> +
> +static inline unsigned long get_current_asid(void)
> +{
> +       return (csr_read(CSR_SATP) >> SATP_ASID_SHIFT) & SATP_ASID_MASK;
> +}
> +
> +static inline void local_flush_tlb_asid(void)
> +{
> +       unsigned long asid = get_current_asid();
> +       __asm__ __volatile__ ("sfence.vma x0, %0" : : "r" (asid) : "memory");
> +}
> +
>  #else /* CONFIG_MMU */
>  #define local_flush_tlb_all()                  do { } while (0)
>  #define local_flush_tlb_page(addr)             do { } while (0)
> --
> 2.30.2
>
>
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Regards,
Anup

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
