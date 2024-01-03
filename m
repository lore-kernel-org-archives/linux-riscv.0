Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08DC7C3DA6E
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Jan 2024 16:16:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2rUfwiVWU0iilK2ZiRuU8zU+Nb88SNz8mmppXhtNLC0=; b=tPG1aW58bAzaB+
	h4Mxpd/DGVAyGkGw7HxuLSyUIBXnwLalRRKa2Y/RQGBpjuiQqqehasSHCMC3UgXed5I2Z6cIp6/1C
	r/Ts2iLGC2gT2CuDqSP3ngZlOc0OhpTzuw6x4KyOIv9YX94uyRW8WY4l1rWddA0lisW6DzYL0bwlt
	ZiZJjZCI5ImCgrsUxlBdMnH8oR+YVyHtzfSlHOTDBmCoHKrwSFkgQbwenwGZy3H2YBx9zjCgl2mDg
	8bi5wWeB7G3Eh9lffpRGFAc1p2ah8rkwvgmPjx2VJIi36flwlxkStZ9HTofpdy4LnkHvDdt0X4v4/
	1N/dZYCM847YnUtArbpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rL3uB-00BMEE-30;
	Wed, 03 Jan 2024 16:15:43 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rL2xZ-00BDv7-0B
	for linux-riscv@lists.infradead.org;
	Wed, 03 Jan 2024 15:15:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 43C24614B8;
	Wed,  3 Jan 2024 15:15:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3D84CC433C7;
	Wed,  3 Jan 2024 15:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704294907;
	bh=RERYlAnfEwJ6yjyyBYDUmO53kwh/sm8G92j6F6VTE+o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=k39ifGsG7hJqiX4VzXtNDzU7d+dMKFHWaYdlznt63uRqTUTArCSPYJgIJTe4jf+1k
	 QXsNVce+ofWLwhWwmA9EpGDuic1hESXQ2qE3jofzADEBI0+7ccSXrs/OgUYDsJEHzF
	 CQ248BfTX1PdCAk2RVXOceYWe5bMZGrlfgYxWavqSag05+l00AQezKDRFmNtj9F0/n
	 l5ci2ji3jHxOeg7sf4lderXtbRVibH3pwj/ob6ngG9BC5HnuVAG3dqI1LOyM4eRGAo
	 QaY+dxeNWj7mvuQMEtFV/UUVdSg94S47qm/w22cjcGme+BAFBuHJI7YFVp9R8nZrYC
	 LC+/S7oNw0GBg==
Date: Wed, 3 Jan 2024 23:02:24 +0800
From: Jisheng Zhang <jszhang@kernel.org>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: Re: [PATCH v4 12/12] riscv: mm: Always use an ASID to flush mm
 contexts
Message-ID: <ZZV3AAY3WIAq+sl9@xhacker>
References: <20240102220134.3229156-1-samuel.holland@sifive.com>
 <20240102220134.3229156-13-samuel.holland@sifive.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240102220134.3229156-13-samuel.holland@sifive.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240103_071509_140053_16848C43 
X-CRM114-Status: GOOD (  21.89  )
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

On Tue, Jan 02, 2024 at 02:00:49PM -0800, Samuel Holland wrote:
> Even if multiple ASIDs are not supported, using the single-ASID variant
> of the sfence.vma instruction preserves TLB entries for global (kernel)
> pages. So it is always more efficient to use the single-ASID code path.
> 
> Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
> ---
> 
> Changes in v4:
>  - There is now only one copy of __flush_tlb_range()
> 
> Changes in v2:
>  - Update both copies of __flush_tlb_range()
> 
>  arch/riscv/include/asm/mmu_context.h | 2 --
>  arch/riscv/mm/context.c              | 3 +--
>  arch/riscv/mm/tlbflush.c             | 3 +--
>  3 files changed, 2 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
> index 7030837adc1a..b0659413a080 100644
> --- a/arch/riscv/include/asm/mmu_context.h
> +++ b/arch/riscv/include/asm/mmu_context.h
> @@ -33,8 +33,6 @@ static inline int init_new_context(struct task_struct *tsk,
>  	return 0;
>  }
>  
> -DECLARE_STATIC_KEY_FALSE(use_asid_allocator);
> -
>  #include <asm-generic/mmu_context.h>
>  
>  #endif /* _ASM_RISCV_MMU_CONTEXT_H */
> diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
> index 3ca9b653df7d..20057085ab8a 100644
> --- a/arch/riscv/mm/context.c
> +++ b/arch/riscv/mm/context.c
> @@ -18,8 +18,7 @@
>  
>  #ifdef CONFIG_MMU
>  
> -DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
> -
> +static DEFINE_STATIC_KEY_FALSE(use_asid_allocator);

One of my optimization "riscv: tlb: avoid tlb flushing if fullmm == 1"
will make use of use_asid_allocator, so could we remove this modification?

>  static unsigned long num_asids;
>  
>  static atomic_long_t current_version;
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 5ec621545c69..39d80f56d292 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -84,8 +84,7 @@ static void __flush_tlb_range(struct mm_struct *mm, unsigned long start,
>  		if (cpumask_empty(cmask))
>  			return;
>  
> -		if (static_branch_unlikely(&use_asid_allocator))
> -			asid = cntx2asid(atomic_long_read(&mm->context.id));
> +		asid = cntx2asid(atomic_long_read(&mm->context.id));
>  	} else {
>  		cmask = cpu_online_mask;
>  	}
> -- 
> 2.42.0
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
