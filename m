Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D646EC44501
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jul 2026 18:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=AMchPQ4yEtKlNw4gmW19T9iH9b5w06/nKhQyDNxeFow=; b=ZoaHflb2MVGgan
	GnzHkAofaeckY6ET/xOHEz+PRTa/l9T4LiKIwngnN+hIj2RYJvlX216dVAd0DikB/QnTwwX2glvp5
	6lNjPGZiPTe0V/FDTkzAOlT8brVvDYgrBpWSe+pOAAkvKQAtlBo5CUmLcjfcN9twJzSJ6yFSz3DPE
	JJTd6FnB3iKB1b2vDkximwO8MDl9oQAI0LfA0pbPu3NATXar+cn+4T8xBAXdbnNLzB/dQ2yoh/Nzm
	co4XDA9eG2yDKJez5YP57Hc1YJyeIM/g0BzQxMOPUtCYTxY8gzedCmjT1YBXharRWcgswjPrp6lQF
	nuAAk2/TN9JZc6jxdhXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4Fc-0000000FfCS-3eEQ;
	Wed, 15 Jul 2026 18:22:33 +0000
Received: from mail-lj1-x232.google.com ([2a00:1450:4864:20::232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wk4FY-0000000FfBc-2ZgX
	for linux-riscv@lists.infradead.org;
	Wed, 15 Jul 2026 18:22:30 +0000
Received: by mail-lj1-x232.google.com with SMTP id 38308e7fff4ca-39c7fd21b63so42323681fa.0
        for <linux-riscv@lists.infradead.org>; Wed, 15 Jul 2026 11:22:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784139746; x=1784744546; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TOZk9QruTQyTuzhFKvlY61eCbbJ/6Q27kBXayZAfD38=;
        b=jrc50InKUZ7XffCI2CU73yY6+udEOeKH1UnT1fyYme1kP5iM0AgCOHTyE8pUdf72YS
         YVogaI68H+5c1GWUFtsNk0o/tSnBXynOA77FWhYG3kWAaig/gKt9m8i6+cCQrwTI9Xyd
         FfvtbPZ/X1lJmIOfhW55CqLZslrfrQTh/IvcValfxsaoLPU0rmU21rfYeFBrm/f+GjWh
         YKBfmZ4KmY70Xbd0q93Twl8nv8vvOc1OTuwshIJNTeltjOQhZwZb88INmUDT10xsH4ZH
         c2hATMJjCTkEJvSvsdaWN5RZOrDqAuO2GOo0kTwGNMP4QQcXprG19B3TGeawVRd4eg9k
         uYkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784139746; x=1784744546;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TOZk9QruTQyTuzhFKvlY61eCbbJ/6Q27kBXayZAfD38=;
        b=dv7SNpJpMHo+geSEuX8WHZG++hgslQ4QeyRagPGZKDLUIiJnoigviCzN7GRXM0JAZe
         CiKcE+ZEily/6hDm5aq+n1ghaFWMl6K91ZKWTUbRE3q0jW0Hu3Xp1EQhTlIcvH1S3SNB
         35HMsZBDt9NVlc8qfQXF8ykyLzC14hSp/+kPIQCPrdhv6Cr3m9B8RpxZ3hrsYkf7EmaX
         H48X5qnUekRvd/uLFUnim2TX1jg5MO+Re2aAmq8d2BorMMdrluibczkfMfMm3xURxKo4
         uu2NoUI7gUM0S4crXSr5jqj8DOKHa1nvegk4X5d26rEJ1CveI0B7/f2cXW/4KgKUXE0V
         EHBg==
X-Forwarded-Encrypted: i=1; AHgh+RrYI4OuAyafq3FY53HRLCYyg6iohnoY4PP49lBIbBxCAgCEuL4L/EHj+SO7b8R2lN3FVpctg9SzZ6utyg==@lists.infradead.org
X-Gm-Message-State: AOJu0YxXLkZNjzZD5xpBlMmlm6yLWUhAEtfwa1PLrzReVNs3zxm4HaTC
	3fVzb0q5mxqzDhDPhNqAXE9lT02Lz7iY2zb48u6PiJ4F9OCYpvtbGgtslAPTFA==
X-Gm-Gg: AfdE7cn99JbSnj+Ik1free4Z23UuxrJnLh0kv4tBaW8BgOqdS0GeSDIJ1pJm4IENtsm
	YO39qEkUcfdry092NztKBmOnyCXoBo96zO621/8VUMfdDZ8pZ5PPqVO25iz401fv8+wa8jFaJk9
	tfkpzJggLYX6yEe0Y9KhrJ0d2ofT9yoLCImTJWQEbm0gGhZiiCHgWDRBeaVwDPBhszZH6LKrgmF
	gVGEE/Yq5/b40b7aGXBgDRvsocx07p/nEiAHHl7rD5M2NqGGJpiQt7TIqw+mM1dGi78yKjmL0ep
	CjhvMmBtGTbKhszFW9WIkzce2GZ1xA0hdOSBAhJm6TD210IebcS0D+0G2B45bgpo8nzi1EbP3nd
	gZDppIRIsE2VdNBfsmyG03N17Qn1ZnbcLXm6Rz8NZWaFwcXSp2t8b9ky7w0tNRcEfc2RzSefvcG
	dCNlw65O7dsHJEIE87yzN+G317HN0=
X-Received: by 2002:a2e:a98e:0:b0:39c:628c:15ec with SMTP id 38308e7fff4ca-39daa822609mr19800191fa.23.1784139745916;
        Wed, 15 Jul 2026 11:22:25 -0700 (PDT)
Received: from localhost (soda.int.kasm.eu. [2001:678:a5c:1202:7b92:9ac1:b9ef:5287])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-39c849174ebsm39803721fa.7.2026.07.15.11.22.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 11:22:23 -0700 (PDT)
Date: Wed, 15 Jul 2026 20:22:22 +0200
From: Klara Modin <klarasmodin@gmail.com>
To: Xu Lu <luxu.kernel@bytedance.com>
Cc: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
	apw@canonical.com, joe@perches.com
Subject: Re: [PATCH v2 2/3] riscv: mm: Apply Svinval in update_mmu_cache()
Message-ID: <alfO7SMOMstFvt25@soda.int.kasm.eu>
References: <20260715132009.10634-1-luxu.kernel@bytedance.com>
 <20260715132009.10634-3-luxu.kernel@bytedance.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260715132009.10634-3-luxu.kernel@bytedance.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_112229_723727_F4FE6C12 
X-CRM114-Status: GOOD (  19.14  )
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

On 2026-07-15 21:20:08 +0800, Xu Lu wrote:
> Use Svinval in update_mmu_cache_range() when the extension is available.
> 
> Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>

This version works fine for me.

Thanks,
Tested-by: Klara Modin <klarasmodin@gmail.com>

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
> -- 
> 2.39.5
> 

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
