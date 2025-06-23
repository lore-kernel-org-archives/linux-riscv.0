Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D44C7EE30
	for <linux-riscv@archiver.kernel.org>; Tue, 24 Jun 2025 01:39:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=fQWF9GuQucNEqEbFkty53tnF+hAvMS5HaSJ0eqNjZJc=; b=3IWa1kvNJAaX6n3OfcCQSaOok1
	ul9iInhX4dvbox14oP2vUGnMA6gUp67SiXD6YwAyfyPRtu1/bsRahJqMVHU7nrtnZ1TPj+32D/VXP
	T/ibMaNlq6kaaUHVcimon73XR1CYBOAUi/yOZMbj4Vce0PZFU0Sd0r5RNkl25VQAL+Kg8USXBdTE0
	DZ9t+futDtf7QKFKmsJ4VdT8a7ogRYXZUKhJFkXsnqAyBMQpTN8TOS9+YFdA++9LZkaWlHqWeca3P
	30ONH6RemCTnxfYsCvF6vLsJCuYnacIwInWs55WjHj+ZxlGZLe1tZQI4oqJnZcwa+WPZ00eRdIC4h
	E1k7wd4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTscj-00000004ON7-3r7k;
	Tue, 24 Jun 2025 01:38:57 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTqS3-000000049yY-2TNO
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 23:19:48 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7490acf57b9so2681297b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 16:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1750720787; x=1751325587; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gw6GoMqApL8OI1pFqF47hahg0MqEAjgMuBlQV9Gc5uY=;
        b=oRT40D8mSI5Lhbh0IIcpI0dIX0uqDBCTZJ7VY1f+D4wUTyFEo5bChSo/5NJR7ksnRQ
         ivvfCpBZ4O7N/aZHo5hMd93xRwYGGvPaimrYI79haGzaxYAwLx+metdXvGdb+L9FIz9j
         tgl2jQjkYotPxr/XAWygtB8p9pQZ0chdbxJuKUNNTf8GUOXzV0Fk6XP7SE2OD5ug/Mjp
         NR2Bf/+BUEM7oOfuclHJCptfJBx6BR8yYkygApUIc+Wvm1n1ywJWFDE4eKg+KsdFllAB
         6PQMYB6yNlWdw9dLogt+A6CVAbaYDcnfHOXaVl/GaME6NCeR2qtwXhRMaVtGiYWsbopS
         ijrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750720787; x=1751325587;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gw6GoMqApL8OI1pFqF47hahg0MqEAjgMuBlQV9Gc5uY=;
        b=rOx3xUxMmw5/CMVlweWri3ouW8EVRWVhrBgsSzff7dV1g8lCfVQQRSj3s3sQeF+d3E
         BvBAzRKjWsQFnIw2id7PvmsBagdOJLBL/SsKnXDbXC9lPmrjp2M0uKgZC8DeKfqDfbr/
         HFiqj34oopo7cAKg97CggRAjXGP6lw2E23dpu/gOzZAU1e7kqLYZLBRUExuiDDe/nzWj
         0cGiCHWQgwKIIWxJ1ZuK/RZYwyNpIAk0MR2ntVyjV41is3R/ISS2+GjoZw2NK8dy8HBp
         O1TPMPeKZ2VvapVZulrmXQGpwnhehhET28c+JdnG2co3QrjWpWP1RhfsDnuc+owCCKCf
         8AEw==
X-Forwarded-Encrypted: i=1; AJvYcCVa5APrlwriKwx7g9Yhw2hNjStlOKbWgZLP3IX6aTD6jI2qmyVvodUZUr5bX8B/MoYVymnUQEtdYx7hPg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxaKUzVy5z3YuU5L0ZNAZ4Wyg289GhCzM8C7oQiRPnPm8nGp3fG
	1iBXlYwMNmnutpS5k6pL6lj7/DaGZPuJwAmkL/C5LmhL2OdWI3wYnoL6Fro2CdiolAg=
X-Gm-Gg: ASbGncuGP07IdB8P3jRji0lSLVjwIbfvGXNDdQHu5YJ5wAA7RvpY3W5QMff+YmUn1Yv
	etkhLf4XD95MgIXCvnFvTlcrN9gZGkfFCaYTSLZCj/CWeG+WHcOyWleCZ76ZVoeVW6h72LFpdG1
	u6o8wtkbG42TF5hlWViCurHGG2Qd9S12r2us2Sop5EBi5PApV0waZ5gqtOpkYxn428Fib3N6oiq
	qX+JG1DBuM8Gy0meWk+UgS06R3DVEFRWKWXv3o5PVgapSn4/LAMixlV48woXJCWpu63BvNum6LK
	L2PgfAVdsPv99UvH4FVZ2Afr3fjL0Vyj6e2S/Pc9lfNm1yH8ww0WbHf/vXEJ
X-Google-Smtp-Source: AGHT+IECSVjx/mmkypzRcN8ZzuvF0xqk1KDzf8++bj1/I4kCpcXXhWVnUjiOYCJWPfh8V+CjlVYRLg==
X-Received: by 2002:a05:6a00:14c1:b0:742:4545:2d2b with SMTP id d2e1a72fcca58-7490d66537fmr24687533b3a.3.1750720786597;
        Mon, 23 Jun 2025 16:19:46 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::4:8d10])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-749c8850c86sm234745b3a.112.2025.06.23.16.19.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 16:19:46 -0700 (PDT)
Date: Mon, 23 Jun 2025 16:19:46 -0700 (PDT)
X-Google-Original-Date: Mon, 23 Jun 2025 16:19:42 PDT (-0700)
Subject: Re: [PATCH V8 2/3] riscv: mm: Add soft-dirty page tracking support
In-Reply-To: <20250619065232.1786470-3-zhangchunyan@iscas.ac.cn>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
  Alexandre Ghiti <alex@ghiti.fr>, akpm@linux-foundation.org, linux-riscv@lists.infradead.org, debug@rivosinc.com,
  Vedvyas Shanbhogue <ved@rivosinc.com>, linux-kernel@vger.kernel.org, zhang.lyra@gmail.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: zhangchunyan@iscas.ac.cn
Message-ID: <mhng-2543F392-0764-425E-ACB2-C897B7834C6C@palmerdabbelt-mac>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_161947_861099_EAB41CD6 
X-CRM114-Status: GOOD (  27.39  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 18 Jun 2025 23:52:31 PDT (-0700), zhangchunyan@iscas.ac.cn wrote:
> The Svrsw60t59b extension allows to free the PTE reserved bits 60 and 59
> for software, this patch uses bit 59 for soft-dirty.
>
> To add swap PTE soft-dirty tracking, we borrow bit 3 which is available
> for swap PTEs on RISC-V systems.
>
> Signed-off-by: Chunyan Zhang <zhangchunyan@iscas.ac.cn>
> ---
>  arch/riscv/Kconfig                    |  1 +
>  arch/riscv/include/asm/pgtable-bits.h | 19 +++++++
>  arch/riscv/include/asm/pgtable.h      | 71 ++++++++++++++++++++++++++-
>  3 files changed, 89 insertions(+), 2 deletions(-)
>
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index 01e4c15bee12..5c787c09f4dc 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -141,6 +141,7 @@ config RISCV
>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>  	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>  	select HAVE_ARCH_SECCOMP_FILTER
> +	select HAVE_ARCH_SOFT_DIRTY if 64BIT && MMU && RISCV_ISA_SVRSW60T59B
>  	select HAVE_ARCH_STACKLEAK
>  	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>  	select HAVE_ARCH_TRACEHOOK
> diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
> index a8f5205cea54..a6fa871dc19e 100644
> --- a/arch/riscv/include/asm/pgtable-bits.h
> +++ b/arch/riscv/include/asm/pgtable-bits.h
> @@ -20,6 +20,25 @@
>
>  #define _PAGE_SPECIAL   (1 << 8)    /* RSW: 0x1 */
>  #define _PAGE_DEVMAP    (1 << 9)    /* RSW, devmap */
> +
> +#ifdef CONFIG_MEM_SOFT_DIRTY
> +
> +/* ext_svrsw60t59b: bit 59 for software dirty tracking */
> +#define _PAGE_SOFT_DIRTY						\
> +	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
> +	 (1UL << 59) : 0)

I haven't fully followed the code paths here, but it looks like we'll 
unconditionally enable VM_SOFTDIRTY and thus allow 
vma_soft_dirty_enabled() to return true even when we don't have support 
in hardware.

I'm not exactly sure what could go wrong there, but it seems like at 
least userspace could be told that soft dirty is around and thus get 
confused.  It also looks like debug_vm_pgtable() will start failing 
tests on these systems, which will probably trigger some bug reports.

At a bare minimum someone who understands the core MM code should look 
here.  Maybe the best way to do that is to convert those static 
CONFIG_MEM_SOFT_DIRTY checks to some sort of arch-implemented callback 
so this can be dynamic, and then see what people say?

> +/*
> + * Bit 3 is always zero for swap entry computation, so we
> + * can borrow it for swap page soft-dirty tracking.
> + */
> +#define _PAGE_SWP_SOFT_DIRTY						\
> +	((riscv_has_extension_unlikely(RISCV_ISA_EXT_SVRSW60T59B)) ?	\
> +	 _PAGE_EXEC : 0)
> +#else
> +#define _PAGE_SOFT_DIRTY	0
> +#define _PAGE_SWP_SOFT_DIRTY	0
> +#endif /* CONFIG_MEM_SOFT_DIRTY */
> +
>  #define _PAGE_TABLE     _PAGE_PRESENT
>
>  /*
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index a11816bbf9e7..efc2da97f124 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -434,7 +434,7 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
>
>  static inline pte_t pte_mkdirty(pte_t pte)
>  {
> -	return __pte(pte_val(pte) | _PAGE_DIRTY);
> +	return __pte(pte_val(pte) | _PAGE_DIRTY | _PAGE_SOFT_DIRTY);
>  }
>
>  static inline pte_t pte_mkclean(pte_t pte)
> @@ -467,6 +467,38 @@ static inline pte_t pte_mkhuge(pte_t pte)
>  	return pte;
>  }
>
> +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> +static inline bool pte_soft_dirty(pte_t pte)
> +{
> +	return !!(pte_val(pte) & _PAGE_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_mksoft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) | _PAGE_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_clear_soft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_SOFT_DIRTY));
> +}
> +
> +static inline bool pte_swp_soft_dirty(pte_t pte)
> +{
> +	return !!(pte_val(pte) & _PAGE_SWP_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_swp_mksoft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) | _PAGE_SWP_SOFT_DIRTY);
> +}
> +
> +static inline pte_t pte_swp_clear_soft_dirty(pte_t pte)
> +{
> +	return __pte(pte_val(pte) & ~(_PAGE_SWP_SOFT_DIRTY));
> +}
> +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> +
>  #ifdef CONFIG_RISCV_ISA_SVNAPOT
>  #define pte_leaf_size(pte)	(pte_napot(pte) ?				\
>  					napot_cont_size(napot_cont_order(pte)) :\
> @@ -819,6 +851,40 @@ static inline pud_t pud_mkspecial(pud_t pud)
>  }
>  #endif
>
> +#ifdef CONFIG_HAVE_ARCH_SOFT_DIRTY
> +static inline bool pmd_soft_dirty(pmd_t pmd)
> +{
> +	return pte_soft_dirty(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_mksoft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_mksoft_dirty(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_clear_soft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_clear_soft_dirty(pmd_pte(pmd)));
> +}
> +
> +#ifdef CONFIG_ARCH_ENABLE_THP_MIGRATION
> +static inline bool pmd_swp_soft_dirty(pmd_t pmd)
> +{
> +	return pte_swp_soft_dirty(pmd_pte(pmd));
> +}
> +
> +static inline pmd_t pmd_swp_mksoft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_mksoft_dirty(pmd_pte(pmd)));
> +}
> +
> +static inline pmd_t pmd_swp_clear_soft_dirty(pmd_t pmd)
> +{
> +	return pte_pmd(pte_swp_clear_soft_dirty(pmd_pte(pmd)));
> +}
> +#endif /* CONFIG_ARCH_ENABLE_THP_MIGRATION */
> +#endif /* CONFIG_HAVE_ARCH_SOFT_DIRTY */
> +
>  static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>  				pmd_t *pmdp, pmd_t pmd)
>  {
> @@ -1005,7 +1071,8 @@ static inline pud_t pud_modify(pud_t pud, pgprot_t newprot)
>   *
>   * Format of swap PTE:
>   *	bit            0:	_PAGE_PRESENT (zero)
> - *	bit       1 to 3:       _PAGE_LEAF (zero)
> + *	bit       1 to 2:	(zero)
> + *	bit            3:	_PAGE_SWP_SOFT_DIRTY
>   *	bit            5:	_PAGE_PROT_NONE (zero)
>   *	bit            6:	exclusive marker
>   *	bits      7 to 11:	swap type

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
