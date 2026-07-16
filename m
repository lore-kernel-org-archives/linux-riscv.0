Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD0AC44511
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Jul 2026 16:25:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cSYN3Hh/yHcXN+V+wiTrTqo98PCj0vg2ifxFSYf0Pmo=; b=4AcxIer2mFKt4n
	tJjvqv/WhwFz5/bHVwdRP9WZOmXH7BETBeBIW3vXWJq/v4G1ZG8v3daPu5dfJ/t2gv5LUuUgtJyCA
	Mg5hBz6CEKd/+WPUFFREMz9IZMCkabo9xcVNeGLYhHSw1RDI1C3Ufqvos7Gs2H3a/pb5jqzelIk68
	0jiAazAWjTRW2nmYzUSIq4MLf43/QGbMKsRNikxheTYpGtSRHNEoJ7myPS2AtbgPgsrQ8nTk9mwol
	4km8nP69Ukj4sKlq99TZFVZXnZAJpuEv6+X0awDP9MDK3WCxbHVF5lPuhNYbNLt26led7vpQ7g24v
	04LchxaL1MyD/XCiLcVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOtM-000000009GJ-0Vc3;
	Thu, 16 Jul 2026 16:24:56 +0000
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkOtJ-000000009Ex-0W5w
	for linux-riscv@lists.infradead.org;
	Thu, 16 Jul 2026 16:24:54 +0000
Received: by mail-lf1-x131.google.com with SMTP id 2adb3069b0e04-5b14d1f9315so5294482e87.2
        for <linux-riscv@lists.infradead.org>; Thu, 16 Jul 2026 09:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219090; x=1784823890; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RSZBcC6t0s89vlVCT1axHaMNqKajOMFVpHnvbGuqj04=;
        b=PTw2Oh722N4Ia1fDVJrs7AB8wjg8aVRYHWpM6CmsUn6gr9W8cyUyuGilkXAEY2rd10
         h/yYomHTQQ6SIqEeLRHtMzBKhnjapoH6x7hs41rIVDHHz9lVdnjdtC9JJZ5NTI6dgRlm
         1EWIoR56xFN17rOSthR4m39I14876TFXay/AjkaUfa9kSRuO4NIwcr35pNB5PL22xvTy
         kKMLpxaDH/2I5dcz56IOrwk60YF1aCHGnN95UDuzLyKil6EyGlPQalJieU6h3YgCcJ0p
         5p45RnQAnm5sBUdJt10F10Ko4rsrebB/PlojygAgTi12TDV/wuTSdS/i9pTqxxNNibwk
         Qf5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219090; x=1784823890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RSZBcC6t0s89vlVCT1axHaMNqKajOMFVpHnvbGuqj04=;
        b=NO0N98+uV4D+BBfFT0/x0gkWmeTouG6HCunOoGilwgWh7glcdByUhi0Hx+Zu9hlO5D
         xhXsrRLd3icehGWkOBse+/7yhFjySTxOT4mBypi8g6oDm76A0y0ny6ZsufWji0aLFOmX
         QwHdkUEGo43sGrDEDZUzm6YVEoBCANMTf0yMOdsujFJ31TOwv1cVD0wcGJrRWgIGCMVo
         4KhqDrjsaJz69PBa18dvfFJ6WIQRB4l8Ws7qraT9xQhKyrP/n8Q+IZSApu+NOr5jMDdr
         4Yg9ZXyxz0G3nVJEC7+1rP3v2+xMOYwjy5w5yCCjAPGCP/CL4ByZAvM7Uum2xSPNrcb8
         UHrw==
X-Forwarded-Encrypted: i=1; AHgh+Rr/UNvlZwgZOez+ETqEjwIm/f+f4sSI/7Beg8nAbblr/OL1VbM3innktxknLdb6xFj0bTmPK6bYBghuLg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yxi4XVCAuH0eqxeWceTuqg2KbC7Q85pfZCnxq8ajaorQBBKe0S9
	ibsvdTi31J4XoHlN2QiCATYH2GuPdEBp2cJbuxNbJNCo/lLG7tkYlFtO
X-Gm-Gg: AfdE7cn38cSI2XeoobPWckhNd6OsbhdbWIR1yvqbEkItqOGSJthUnBxG8bGOe4Rylz8
	TMBkCR7tyzzcXeWGI2VyrltIjdpEnpfaXSgQRs7QrSA+sg4IeDU7Q788VaN4V16WlYtxYpZT7Pi
	pWY1tWDucqNOyojfxGp8SzXfXx+cofNtzUyZhAuCoQbuy0ViwghGaheQ0Rm13BazUiNNPJIw7eF
	9XQP/DfN3jbMgnvjt9XZrAnRSMj9Gf4qsadDcxFXhlObA39mwNvCKYrHBXac/cRuqwKl6pjc4UT
	XgNFj2/ZXdy5/gkNGOC/sql6k/2n101ZaXG6re3ddFRw5afLCqN96coxBgRB6tMSs6HTOTabRGi
	EzDSBCcVuQwBLwiKu14QrdSf7Aw98ixSTz9yHRX8tKY29z9JAhzNYEyTmP8tGhKlo9XrIUDeAxo
	Vg1hSOl5X1adubXz+V
X-Received: by 2002:ac2:5b84:0:b0:5ae:b11d:c8c5 with SMTP id 2adb3069b0e04-5b1582aa617mr2050351e87.43.1784219090057;
        Thu, 16 Jul 2026 09:24:50 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b15e15869asm1337106e87.51.2026.07.16.09.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 09:24:49 -0700 (PDT)
Date: Thu, 16 Jul 2026 18:24:48 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 1/3] riscv: mm: Use ASID in update_mmu_cache()
Message-ID: <alkD_YBF1HhbycqX@soda.int.kasm.eu>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-2-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715132009.10634-2-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260716_092453_191886_6E9FB848 
X-CRM114-Status: GOOD (  21.59  )
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

Hi,

On 2026-07-15 21:20:07 +0800, Xu Lu wrote:
> Only flush TLB entries for the specified mm in update_mmu_cache_range().
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  arch/riscv/include/asm/pgtable.h  | 4 +++-
>  arch/riscv/include/asm/tlbflush.h | 5 +++++
>  arch/riscv/mm/tlbflush.c          | 5 -----
>  3 files changed, 8 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 5d5756bda82e..9926556099ae 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -568,6 +568,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  		struct vm_area_struct *vma, unsigned long address,
>  		pte_t *ptep, unsigned int nr)
>  {
> +	unsigned long asid = get_mm_asid(vma->vm_mm);
> +

It seems the old version of this patch is still used (at least in
next-202650716, 15ce1d7c4ddfe0dff00fcaee4ccaeef3efbc62c6), which means
asid is not initialised here. We instead have:

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 5d5756bda82e..755495a542cc 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -568,6 +568,8 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 		struct vm_area_struct *vma, unsigned long address,
 		pte_t *ptep, unsigned int nr)
 {
+	unsigned long asid;
+
 	/*
 	 * Svvptc guarantees that the new valid pte will be visible within
 	 * a bounded timeframe, so when the uarch does not cache invalid
@@ -583,10 +585,11 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
 	 * Relying on flush_tlb_fix_spurious_fault would suffice, but
 	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
 	 */
+	asid = get_mm_asid(vma->vm_mm);
 	while (nr--)
-		local_flush_tlb_page(address + nr * PAGE_SIZE);
-
+		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
 }
+
 #define update_mmu_cache(vma, addr, ptep) \
 	update_mmu_cache_range(NULL, vma, addr, ptep, 1)
 

This means that patch 2 of this series will use the uninitialised asid
for local_svinval_vma() and I get the same behaviour as before (hang on
initramfs). If I revert the two patches of this series which are in next
and apply this again it's fine.

Regards,
Klara Modin

>  	/*
>  	 * Svvptc guarantees that the new valid pte will be visible within
>  	 * a bounded timeframe, so when the uarch does not cache invalid
> @@ -584,7 +586,7 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
>  	while (nr--)
> -		local_flush_tlb_page(address + nr * PAGE_SIZE);
> +		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
>  
>  }
>  #define update_mmu_cache(vma, addr, ptep) \
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index eed0abc40514..7c2cd5cc92d3 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -15,6 +15,11 @@
>  #define FLUSH_TLB_NO_ASID       ((unsigned long)-1)
>  
>  #ifdef CONFIG_MMU
> +static inline unsigned long get_mm_asid(struct mm_struct *mm)
> +{
> +	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
> +}
> +
>  static inline void local_flush_tlb_all(void)
>  {
>  	__asm__ __volatile__ ("sfence.vma" : : : "memory");
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 8404530ec00f..73c226f719c7 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -110,11 +110,6 @@ static void __ipi_flush_tlb_range_asid(void *info)
>  	local_flush_tlb_range_asid(d->start, d->size, d->stride, d->asid);
>  }
>  
> -static inline unsigned long get_mm_asid(struct mm_struct *mm)
> -{
> -	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
> -}
> -
>  static void __flush_tlb_range(struct mm_struct *mm,
>  			      const struct cpumask *cmask,
>  			      unsigned long start, unsigned long size,
> -- 
> 2.39.5
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
