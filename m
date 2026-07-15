Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53028C44508
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 01:14:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vVP07IzesanqY+9wQ+YYOZ+LXcJcfLuRqji5/nnZlSU=; b=LgXyF2rZZKbqN2
	fkWWlVeXe9YbNzRxkCoLNWlGWhRMVbYzjxnHArY3k0XCIVfCkehaR9HBJ6ugYSkK0Y+MiusmVQmbF
	8HRscW0+QSCaU834xuA90kn4bGddT0mi9pa6kvs1bvtfZOHBo080+KhoiR7+gbXOPatIPsCgDGtSc
	35549eidWISc67d4xHIIt+TLvhQecw+vWrH6WCYjnK4rDCOmHwUlKlnFEuF/3efjHhWYIIbD5VLW8
	H7Ex4KgXUnriN+IC9vOyA07jq+rJKteRTrTLoH/BbQt+B3eiwHGrzfiLqZiXhD+IoAG6SSJc8I+qJ
	UqZG8iwOcHFGF4JEWmfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoCl-0000000DXJC-32vO;
	Wed, 15 Jul 2026 01:14:31 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjoCj-0000000DXIb-2b0M
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 01:14:30 +0000
Received: by mail-lf1-x134.google.com with SMTP id 2adb3069b0e04-5b01cb18515so4600139e87.2
        for <linux-riscv@lists.infradead.org>; Tue, 14 Jul 2026 18:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784078067; x=1784682867; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CdOsTQfXE50dQ/gtPaAu82kIIO4TZ1iHe040cbYLQyo=;
        b=kgKFdngCyKXPpiqf19O4lr3PbOcswcrk/2wGegh686g/ltshjbBoHRWY/tzARAMDYT
         L+hu87+9lYjeyrYNkIZSvnUFtk4CcyRMSXjmLA+oocP+gzACPeBrOEXgwNc9+VF1o/Q7
         S15dwd0fX2AAzdPlF5AJP3+2+O5ZWC5S/psjcEzOu1/zrOPBGh9G9EOu4APqm0zQLBlT
         wbFVEDTqF8r+A1HRe7g8QiiA2a4zRJMTqkhjX7wmFEYXNbFblHLpHTEuHYLsVGpTJ4Ci
         J7LzlC0d50sQQgdYEqGifV5gI/VZoiYwFgjPXWn+xJizZWAjUk4XbwNKZANaLSksycFx
         t+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784078067; x=1784682867;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CdOsTQfXE50dQ/gtPaAu82kIIO4TZ1iHe040cbYLQyo=;
        b=S5+6pSXQArUxULD8rxNfglEyUc2JeqE/4CWnCEC2LHFYh2WiSeen+6t+WNpevWl2KR
         HNd9QgaIwMHg2IELNZo0th7BLS+e/Pikn4eTFE2itbd+ivEqIhRm5m3xnz/jmEtszyb3
         7xbaD9IpaQ2ktI9hLmd3ZkuByamTgnSdeqRrxpvwSdHnkO9ZQEcund0+9nB7OyAMEV42
         KvgSBouBUH7DXoHlYHbtV1c8E/YLeXf+9WP6EOIQBjilInf145tOmT3HIle1SlQSG3BC
         8Mzmci74ZupQJRm6s2wyy5qwP5blt/ZziavRjBSSVRQ7sOfoXWbljE/PdO5RDnKCxRyu
         6Zyw==
X-Forwarded-Encrypted: i=1; AHgh+RrcH4o3lwnhyWG006udXJA9asMS8MCY8ogdJJLt02qcCX4hvN55LGEIqqhIrJXIstO6yOFWRpnY4ZQJeA==@lists.infradead.org
X-Gm-Message-State: AOJu0YyVSQBQOGMTK4Hx5czul76pOorj4uCsjDIrO5o0lEshVAgek5sw
	Ku5GJ4eFnohufBnasZW+hAs4RHsb8QWR8vhGSvjeKGMHgf3N3S5W5OLO
X-Gm-Gg: AfdE7cmrWz9CfjAZUH4jx8GV3PtyX8iKULWJCJsME82wOF12xh99EN9VJio1XjgRKEw
	mVZS7Y/MXSodrCedsM6ljvvvM3Q58xjEiUv/DrvSYgXM7dRbO6bcKaIHSphoiFqx1OCfPK2UpHp
	bigFEmXZzJvCFsbCKH2k5k0dnwai/90Un9CAKedxpKSWjPL4TsVpOFaDVrLcHlYBO9721fKYuw6
	PESvgw7C7Q7Ff+jRXcLP3gV1Jgqn8S/0ineQxPvxRC1jNAz51v1MiiFsRi1nhUijNCoyTQKaPO5
	mipJqxbp1GcSYVDJk4NQeHWlYbIm9f1cO22j1cvJ3e9OAxOZF9YrkgZG4MhxiirQyWq2g6kySfT
	+jrRgp2xBq+G2ejpGyf0/mSZvMno5BYf0PdS0e+3e29ebcW9gU1vpC1vMAtGTphMMbZTPNPaHJo
	7KvYh1yzTCaHESZj+XUDcos9Qcn8Z3OXySQB1IE5xhP3Zqgzmk
X-Received: by 2002:a05:6512:3b8a:b0:5b0:bc3:dc06 with SMTP id 2adb3069b0e04-5b159b74eebmr874120e87.26.1784078066758;
        Tue, 14 Jul 2026 18:14:26 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b0531606ecsm3150123e87.80.2026.07.14.18.14.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jul 2026 18:14:26 -0700 (PDT)
Date: Wed, 15 Jul 2026 03:14:25 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH RESEND 1/2] riscv: mm: Apply svinval in update_mmu_cache()
Message-ID: <albbQtulrnpOmmBp@soda.int.kasm.eu>
References: <20250901114141.5438-1-luxu.kernel@bytedance.com>
 <20250901114141.5438-2-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20250901114141.5438-2-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_181429_677079_1ACD039C 
X-CRM114-Status: GOOD (  16.73  )
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

On 2025-09-01 19:41:40 +0800, Xu Lu wrote:
> Only flush tlb of the specified mm, and apply svinval if available.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
> ---
>  arch/riscv/include/asm/pgtable.h  | 16 +++++++++++++++-
>  arch/riscv/include/asm/tlbflush.h | 23 +++++++++++++++++++++++
>  arch/riscv/mm/tlbflush.c          | 23 -----------------------
>  3 files changed, 38 insertions(+), 24 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 91697fbf1f901..165cd02d51629 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -495,9 +495,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  		struct vm_area_struct *vma, unsigned long address,
>  		pte_t *ptep, unsigned int nr)
>  {
> +	int i;
> +	unsigned long asid = get_mm_asid(vma->vm_mm);
> +
>  	asm goto(ALTERNATIVE("nop", "j %l[svvptc]", 0, RISCV_ISA_EXT_SVVPTC, 1)
>  		 : : : : svvptc);
>  
> +	asm goto(ALTERNATIVE("nop", "j %l[svinval]", 0, RISCV_ISA_EXT_SVINVAL, 1)
> +		 : : : : svinval);
> +
>  	/*
>  	 * The kernel assumes that TLBs don't cache invalid entries, but
>  	 * in RISC-V, SFENCE.VMA specifies an ordering constraint, not a
> @@ -506,7 +512,15 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  	 * the extra traps reduce performance.  So, eagerly SFENCE.VMA.
>  	 */
>  	while (nr--)
> -		local_flush_tlb_page(address + nr * PAGE_SIZE);
> +		local_flush_tlb_page_asid(address + nr * PAGE_SIZE, asid);
> +	return;
> +
> +svinval:
> +	local_sfence_w_inval();

> +	for (i = 0; i < nr; i++)
> +		local_sinval_vma(address + nr * PAGE_SIZE, asid);

Probably should be

 +	for (i = 0; i < nr; i++)
 +		local_sinval_vma(address + i * PAGE_SIZE, asid);

instead. My BPI-f3 hangs when entering the initramfs with the original
patch. Reverting also fixes it.

> +	local_sfence_inval_ir();
> +	return;
>  
>  svvptc:;
>  	/*

Regards,
Klara Modin

...

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
