Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B22A5C00140
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Aug 2022 05:06:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FT6mJ3zIl3IvNZcB9Cs33KoUYo8TaW3V43FldP2hSM4=; b=Jlwlv/fdGtOzV3
	osm6OfASp/O1LGOVXHcEevfZaYMLjf4ud5Or9xN/OrCK+0qS2cixapWXVOumDjox0nTNMbmxHpcy1
	eZTkzcPFJKDa7Gsv2aVqnaG4Cm6dk6j4SUgFjaw1vneH4r7uiyEuuRNp5rUzdU3/V/J/RhNNfaPY+
	oGNBJacara2BKcgK2YteZBEmmXRmtKb6b/jwzpJaHlrDKmaSPSNAnGEUkBaMAQoDnkX698KVr7L1/
	ZUPapMrh39rY/F/2tLbZHCBGeNqAquVk83rGutrBC43w6QEJXdisunQu2n3ORz1AsQGhMK1ngiDGm
	aRUC/f3gDoRucQCMrHMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPd9v-006CcQ-KG; Sun, 21 Aug 2022 05:06:03 +0000
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oPd9s-006CWi-31
	for linux-riscv@lists.infradead.org; Sun, 21 Aug 2022 05:06:01 +0000
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-3376851fe13so182237217b3.6
        for <linux-riscv@lists.infradead.org>; Sat, 20 Aug 2022 22:05:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brainfault-org.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=YiU2Xvn2qxDx9JAzC0b5NS7/wFofs8hu2IbnTOy6ugY=;
        b=cvrZKJm6lX5T7VOULFvC4tncfPdAOgTG4FICCxxW5E3YU+2y4BVl8xcDRrX4Dyy/oH
         7p8ZV/CuBGMU95sb16qkfnyPomela9a1pT3fY+qgnOBZr6LsfNa5eK2xgiQ7hY5oE1yS
         ssJ4vuROb3SpO7vxJzsODH1RqStl/wFQ/HdbcE/CMdjkAE2Qrh1uFgwHqDjvJbEItAYN
         DD/YHEdpDt98vmM18MQVxDu7akRg0XWGepIHXGWdJLQoycnMAMGkdF5s68Q8jgVIe1x0
         vgBZ/623vmU/ZAQZY5nQHIs1lpADp1es7qj9QRckQtNbeVUPu1/FfKWxCK6utYmbAJxn
         sWnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=YiU2Xvn2qxDx9JAzC0b5NS7/wFofs8hu2IbnTOy6ugY=;
        b=UuOfWbpGZUxLrrDjAFubZEjU2y8v0OFno7OWk17RNr99lHllhrQABp4lRUv5UZ7ODp
         t9taX/wFUzBMjQGcYDWRTb9d3dQ9tJiVM5elHg3wzZ5qrfihDk3tOuyHe1M1IpGSRzwh
         gujZM620gwp5B6cVXtM+Sns/jlbAfgb0/Ygaks1VuRMQvdVr3fMO7bOjRSdc6OO1En1R
         3O9KxZqbnWHcFXR4L7+CFU0yQyEkVDq0WGiHNgEKkt7SvdYWM34H+Fy/T9RHsVqyYrqd
         kZWROKEq7tcSjv+IMmoVfipTSOF8avq00abB8O4HJmCskO06sqkpOaFY4vAT/rDa2HxF
         V2bg==
X-Gm-Message-State: ACgBeo3j9POrEC+1eeIJfVrHVxyedRTvUoPf/sqpMZVM0kt1ZgM1PwV+
	SOeQe4K1CC5LH3EIcb8ZmMUJqouhG1E5DROajBO0iw==
X-Google-Smtp-Source: AA6agR6k2S6F3dSjpvLw8Ek//0O+/wxHapE1H+nW/O/u/R2Lqcs8BdM9Q4bL1vkb7w/VG8B6BMiYqrN0Z8EkUCplu9A=
X-Received: by 2002:a5b:104:0:b0:68e:c5d0:d042 with SMTP id
 4-20020a5b0104000000b0068ec5d0d042mr14426842ybx.315.1661058357078; Sat, 20
 Aug 2022 22:05:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220821013926.8968-1-tjytimi@163.com>
In-Reply-To: <20220821013926.8968-1-tjytimi@163.com>
From: Anup Patel <anup@brainfault.org>
Date: Sun, 21 Aug 2022 10:35:45 +0530
Message-ID: <CAAhSdy1Qxwn=Eax6ECEkdRe=mQeL+J0TPCpOc1LMbN1y8-p4UQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1] riscv: make update_mmu_cache to support asid
To: Jinyu Tang <tjytimi@163.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alexandre.ghiti@canonical.com, guoren@kernel.org, akpm@linux-foundation.org, 
	heiko@sntech.de, panqinglin2020@iscas.ac.cn, unnanyong@huawei.com, 
	tongtiangen@huawei.com, anshuman.khandual@arm.com, atishp@rivosinc.com, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	falcon@tinylab.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220820_220600_445607_9EC70812 
X-CRM114-Status: GOOD (  18.90  )
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

On Sun, Aug 21, 2022 at 7:09 AM Jinyu Tang <tjytimi@163.com> wrote:
>
> The `update_mmu_cache` function in riscv flush tlb cache without asid
> information now, which will flush tlbs in other tasks' address space
> even if processor support asid. So add a new function
> `flush_tlb_local_one_page` to flush local one page whether processor
> supports asid or not. If asid is supported, this function will use it.
>
> Signed-off-by: Jinyu Tang <tjytimi@163.com>

This is already covered by PATCH6 of the IPI improvement series.
https://www.spinics.net/lists/kernel/msg4481428.html

Regards,
Anup

> ---
>  arch/riscv/include/asm/pgtable.h  |  2 +-
>  arch/riscv/include/asm/tlbflush.h |  2 ++
>  arch/riscv/mm/tlbflush.c          | 11 +++++++++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 7ec936910a96..09ccefa6b6c7 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -415,7 +415,7 @@ static inline void update_mmu_cache(struct vm_area_struct *vma,
>          * Relying on flush_tlb_fix_spurious_fault would suffice, but
>          * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>          */
> -       local_flush_tlb_page(address);
> +       flush_tlb_local_one_page(vma, address);
>  }
>
>  static inline void update_mmu_cache_pmd(struct vm_area_struct *vma,
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 801019381dea..120aeb1c6ecf 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -30,6 +30,7 @@ static inline void local_flush_tlb_page(unsigned long addr)
>  #if defined(CONFIG_SMP) && defined(CONFIG_MMU)
>  void flush_tlb_all(void);
>  void flush_tlb_mm(struct mm_struct *mm);
> +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_page(struct vm_area_struct *vma, unsigned long addr);
>  void flush_tlb_range(struct vm_area_struct *vma, unsigned long start,
>                      unsigned long end);
> @@ -42,6 +43,7 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
>
>  #define flush_tlb_all() local_flush_tlb_all()
>  #define flush_tlb_page(vma, addr) local_flush_tlb_page(addr)
> +#define flush_tlb_local_one_page(vma, addr) local_flush_tlb_page(addr)
>
>  static inline void flush_tlb_range(struct vm_area_struct *vma,
>                 unsigned long start, unsigned long end)
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 37ed760d007c..a2634ce55626 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -64,6 +64,17 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
>         put_cpu();
>  }
>
> +void flush_tlb_local_one_page(struct vm_area_struct *vma, unsigned long addr)
> +{
> +       if (static_branch_unlikely(&use_asid_allocator)) {
> +               unsigned long asid = atomic_long_read(&vma->vm_mm->context.id);
> +
> +               local_flush_tlb_page_asid(addr, asid);
> +       } else {
> +               local_flush_tlb_page(addr);
> +       }
> +}
> +
>  void flush_tlb_mm(struct mm_struct *mm)
>  {
>         __sbi_tlb_flush_range(mm, 0, -1, PAGE_SIZE);
> --
> 2.30.2
>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
