Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9AAC4451B
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jul 2026 18:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=oGqISLkemQYgjjn3dAyFENKvpQeHuWuCFFO89lbmYwk=; b=Fa0cqk8ebWJVzJ
	eB7zgPK6xNi4y0aOBAOZgX//mSoL/2I88nrh9sa7K43y9mJHfhogxt8H4LKvHpzt9mVni2+CoV6xl
	sBLg7Iom4w7HBv69+fGqdF4k6X2xXN/wdIvn2nkjGuKmnVI0zTgNUHL/0V8aL0wBS2tU8IFOaLw49
	Oxen4A9ydyXAKb2Y3prHuG4gtOCVb/3fAOU/Xx2CVqXolXNz5VS62q/UDSR9omMAyBBhmOrW4l+6H
	z1jhfoBo6d7DDDUWgpvcSYcx3BrwwZ7RRuK0h0H+ORqTvda5mSOyM0Lu3hG9zQUL3Y6rOmGhz2zdH
	UUx1hAVFl0MaWbDm1mlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknDc-000000030SM-3wZJ;
	Fri, 17 Jul 2026 18:23:28 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wknDZ-000000030Q5-10rt
	for linux-riscv@lists.infradead.org;
	Fri, 17 Jul 2026 18:23:26 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-7eb4d8a21a8so3073063a34.2
        for <linux-riscv@lists.infradead.org>; Fri, 17 Jul 2026 11:23:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sifive.com; s=google; t=1784312603; x=1784917403; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7/x99+YWXurkUlAyRnUvEwjop2UH7IBd1L93Vp2i1TU=;
        b=I3lf6WtLzXTvIrx28Gv1mhgJHz+V2fRaGp042RzqtjwEt+6tB06GhY3BtIxd7EXvb2
         6P/tvfC7M71uKWxZgCcQbGMFMqAWdjsVv33/J+pj1e0QE3d1/Db0l0Ig/JjXE/10ZOpE
         2C7AeogEWPfWzblD9VZOk0Tq3kTCkejERO74nvndKhsmsg/x9YDeMt2q1L8y4c7JkR3W
         UvJzer/AX38Rq7RnGDkQs7HUbmNNdmPM22UffB28kadYjkjp2DVaWvr/l//PN/XgB3su
         DeVdz1EXlgwlp+iZaoBKm7jlNuwRR35VMW23bmi5JCvorR7X3fXNCLc4BYspz8bGTBDH
         kPIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784312603; x=1784917403;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7/x99+YWXurkUlAyRnUvEwjop2UH7IBd1L93Vp2i1TU=;
        b=m6tB7BXTcYD8lb8195A8shtosRYJbjtlU87rLDOcYFtHAjrRKE1eDruZA0BsC+g4FD
         9D2FdWVX2QFpafBWuJCPnU9TeSvtx7rMPded6ZjqUrDZ+RFngC5fzklIbYn6fnfutoid
         M6qVb7dsSLdFwCd32cxdwFPBhytimdeiwFpqRzDw/OYoj7q0/xQoEFcqUOdE6pYI3hVo
         mTox76Zspq542jOU3f8ISyumtoPSMS4G9J4+znMBV2Om0tibWtaxbhtvNKhwxkcngfkC
         8UysDcn0HKiV4QVNeqWpoE88gcLLzSYVaUTSIcQTofY/XiqHZalMSiaABPxVuPI41OyL
         BEaQ==
X-Gm-Message-State: AOJu0YxL2+eLipFUjvMckbUjsen9OekEUiaqBftewyXOX2ZXfk9JiOuf
	VvRN73t4ZJUVAKKaI7y6OgfQuU5uBEG9UljBlVtU+1GEMY4X724HTLgL2ozhIVIoICw=
X-Gm-Gg: AfdE7cnOAyw3d5s/2GM6hOGlZUD79GG6qLcXyXYSHbh0ze/R8F63VWzK+sHlVS7B+He
	fLjHXgfIfSl+LsUoIEZdpjMMmtdlxU4cRD50KUoGAT8cvENXmhPGpNAAl3Q7joKZllsXTzMtHLU
	TaZHeq23NguyKk7c3ZypXar/TMJSEcnYeUmNEUFrPYA7U2ELlwtytNxvAIh8HF0cWipGvMV9stD
	p9gHW8pS836tb2mJuzR+ukv+BX82nToW1Oh1FV1nB2+1rXQcWVvsQG6fzvTfrcl5GL2ffixJhHZ
	Nuk2ohfc9V9SVgbfk79cgeDYToN1+2gmgIA8U/3HZvBDBNbvXuM3i8JFUohk2E9QSksDYpXfx09
	UFXyOqZo0IFyoYGnSllNgji5U4FYG+gq1F5CyeDDhzc6mWGz03b2PEnzpU++Wqx+lHGC/wSyBYF
	/M2M961UWnjWfK6Q1hWUqDPXYMGw==
X-Received: by 2002:a05:6830:314d:b0:7dc:db3c:1d82 with SMTP id 46e09a7af769-7ed9aa17f21mr1807714a34.10.1784312603483;
        Fri, 17 Jul 2026 11:23:23 -0700 (PDT)
Received: from [100.64.0.1] ([170.85.103.109])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7edaf94c13csm1835702a34.16.2026.07.17.11.23.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Jul 2026 11:23:23 -0700 (PDT)
Message-ID: <84a2bc54-3f2c-403f-92c5-d7cdc15d4072@sifive.com>
Date: Fri, 17 Jul 2026 13:23:21 -0500
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] riscv: mm: Apply Svinval in update_mmu_cache()
To: Xu Lu <luxu.kernel@bytedance.com>, paul.walmsley@sifive.com,
 klarasmodin@gmail.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
 alex@ghiti.fr
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 apw@canonical.com, joe@perches.com
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-3-luxu.kernel@bytedance.com>
Content-Language: en-US
From: Samuel Holland <samuel.holland@sifive.com>
In-Reply-To: <20260715132009.10634-3-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260717_112325_310189_1C432C9B 
X-CRM114-Status: GOOD (  17.73  )
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

Hi Xu Lu,

On 2026-07-15 8:20 AM, Xu Lu wrote:
> Use Svinval in update_mmu_cache_range() when the extension is available.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  arch/riscv/include/asm/pgtable.h  |  8 ++++++++
>  arch/riscv/include/asm/tlbflush.h | 18 ++++++++++++++++++
>  arch/riscv/mm/tlbflush.c          | 18 ------------------
>  3 files changed, 26 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 9926556099ae..823805cc465a 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -578,6 +578,14 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVVPTC))
>  		return;
>  
> +	if (riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)) {
> +		local_sfence_w_inval();
> +		while (nr--)
> +			local_sinval_vma(address + nr * PAGE_SIZE, asid);
> +		local_sfence_inval_ir();
> +		return;
> +	}
> +

This duplicates the logic in local_flush_tlb_range_threshold_asid(). If you
exported local_flush_tlb_range_mm(), you could use that here without rearranging
any of the other functions, and it also be able to reuse the threshold logic,
which is important on platforms that set local_flush_tlb_range_mm = 1 to always
do full-address-space flushes.

Regards,
Samuel

>  	/*
>  	 * The kernel assumes that TLBs don't cache invalid entries, but
>  	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
> diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
> index 7c2cd5cc92d3..9636d07fe9ee 100644
> --- a/arch/riscv/include/asm/tlbflush.h
> +++ b/arch/riscv/include/asm/tlbflush.h
> @@ -20,6 +20,24 @@ static inline unsigned long get_mm_asid(struct mm_struct *mm)
>  	return mm ? cntx2asid(atomic_long_read(&mm->context.id)) : FLUSH_TLB_NO_ASID;
>  }
>  
> +static inline void local_sfence_inval_ir(void)
> +{
> +	asm volatile(SFENCE_INVAL_IR() ::: "memory");
> +}
> +
> +static inline void local_sfence_w_inval(void)
> +{
> +	asm volatile(SFENCE_W_INVAL() ::: "memory");
> +}
> +
> +static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
> +{
> +	if (asid != FLUSH_TLB_NO_ASID)
> +		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
> +	else
> +		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
> +}
> +
>  static inline void local_flush_tlb_all(void)
>  {
>  	__asm__ __volatile__ ("sfence.vma" : : : "memory");
> diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
> index 73c226f719c7..962db300a166 100644
> --- a/arch/riscv/mm/tlbflush.c
> +++ b/arch/riscv/mm/tlbflush.c
> @@ -11,24 +11,6 @@
>  
>  #define has_svinval()	riscv_has_extension_unlikely(RISCV_ISA_EXT_SVINVAL)
>  
> -static inline void local_sfence_inval_ir(void)
> -{
> -	asm volatile(SFENCE_INVAL_IR() ::: "memory");
> -}
> -
> -static inline void local_sfence_w_inval(void)
> -{
> -	asm volatile(SFENCE_W_INVAL() ::: "memory");
> -}
> -
> -static inline void local_sinval_vma(unsigned long vma, unsigned long asid)
> -{
> -	if (asid != FLUSH_TLB_NO_ASID)
> -		asm volatile(SINVAL_VMA(%0, %1) : : "r" (vma), "r" (asid) : "memory");
> -	else
> -		asm volatile(SINVAL_VMA(%0, zero) : : "r" (vma) : "memory");
> -}
> -
>  /*
>   * Flush entire TLB if number of entries to be flushed is greater
>   * than the threshold below.


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
