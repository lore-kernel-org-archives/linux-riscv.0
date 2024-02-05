Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6328AC4828D
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Feb 2024 23:09:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/b3eTO0vyVTxQk9V4Fh9ovHTtkaSC8hFkE2zMCjRRX4=; b=aDxybscZHfGvpx
	/5vXRyI0AundBslB/8xUoP4ejNscYQKEzUDkpWXsOjDt4x3DwXq6WvzXwJ9nbLSD0QiBbmYwHov6K
	pPSBxFYvP5Dh53stO00aJeCdjkxj1x2s+r2sqNPNZwZzMTa3kHoRbLlcLPwBWm2f9Jmtr3mcOTfPe
	dGKck+JkZ0PoGiSVjzbfYNKTbxsq3NYnLXaS9KZajDfvs6B1G9MVf5oGVT9nfgR7TleX9dIHdjyFA
	cvKYoYqv6ZWTbkOQTW6E7PzMqtSuZOX21s1FRaX2aKinCkyupJT9HbB2lLDDiVRkMYuPSAZX6hGPE
	D/F66b6QRvVwr0t+ViZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX85e-00000005WdZ-1Bf8;
	Mon, 05 Feb 2024 23:09:26 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rX85a-00000005WdA-2Xvq
	for linux-riscv@lists.infradead.org;
	Mon, 05 Feb 2024 23:09:24 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1d746856d85so37242035ad.0
        for <linux-riscv@lists.infradead.org>; Mon, 05 Feb 2024 15:09:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1707174561; x=1707779361; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSwq0kqDcJFU0BRDFanOctiB1Z+4ozxhyzWWA6dFk0s=;
        b=1ps2SNApmPxP8a2YU3A22dlGVq9KC3bCLzUraUpp2zpwPXwrFyaRPId4ovBn6DyXix
         1vVhkiXv0hKs/T5fJoQEziXHvAyEN2yYJznuuL5HXYtJ6zMMdNq8BVKQoq24NXmoT+1F
         TnBkjedbiIE077ZKelYAb9tI2FNr49g+eSOiPGgmM8PFw9ZqPIGDOXoCRe0REabJftcO
         pybgd5Q8KHTd7iwTcIRuf92XAjW4+WT/iKJJ8u/K7AarcVbkCLtSksoKv4ABOxYDlsDI
         8GK5oyA+3+k8wmSKR2VBsQ9DUTOvQ5ghQnwf0ojl7sEcct4GkijX8Eu18kkU2uEVrCfZ
         uRSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707174561; x=1707779361;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nSwq0kqDcJFU0BRDFanOctiB1Z+4ozxhyzWWA6dFk0s=;
        b=LuZ5kx5OSkx9V0p+O7yNustwKieWc982t6FzjOREZGSIa1/vTVveiQgFNhD206y2qS
         a9yxAw3/cs7+srYRgKBLUx9UlpjjBHwbjANzg31NI+yMzEuw0QoppC+rDcR1gkKf3wHG
         je/xCv3gk/RMz4B6o7TC1VzWxlnrn9aocim8m0YCZ1Utdueoc3c1jLAGVM+8dCelWspU
         lID+KlVeClcfPi24STAxieW2E6xnN1NZskttrXU+Rb5cn4/uraTG+O4KUg0ZHqRIWcvC
         FdOuPa9+RBpNqzxmaLrbpytuvyj9EMzTQverMBJgt1ehgo9UZXwJOSZ2Lj9WTkzvqEhX
         hcCQ==
X-Gm-Message-State: AOJu0YzIxOaP9pA7kVajNG1i7ry0uHyW7C8XaPGJDzJclMkT6X0LEjTI
	eCT0JH5AvWyrzV/m9DsMhtvIXq5u2YxYjSQMbxAwvP9IIvBiGeUL5FZeYygdHm4=
X-Google-Smtp-Source: AGHT+IGWMSVP4g1RkkGppscPVtyZNu/IY0rg2dbT54+40Cs+tkHyOIqM7on6+FJVjo9rViYIkkpgsA==
X-Received: by 2002:a17:902:bc45:b0:1d9:8cd8:acff with SMTP id t5-20020a170902bc4500b001d98cd8acffmr941573plz.62.1707174561185;
        Mon, 05 Feb 2024 15:09:21 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCXKI30Vl6WZduHvlKzCNdPAifq8CEQxrTFOAWDyKxPHczXy/jrjnvAi+a6hMW/JpVitKZhL3OZkYjKA4oJYZnkRPmTKAGO7uDO8PM5lxtZUnPutBFCx7p6POaymKGn15culFuICFPYwWXseNLX+iqzD3goBLbH5ucc/HKkn7i5suEOdspDOg7mi9mvFEDjsizrroAECI7dLzw==
Received: from ghost ([12.44.203.122])
        by smtp.gmail.com with ESMTPSA id e6-20020a170902744600b001d93bb0c9c8sm414955plt.85.2024.02.05.15.09.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Feb 2024 15:09:20 -0800 (PST)
Date: Mon, 5 Feb 2024 15:09:18 -0800
From: Charlie Jenkins <charlie@rivosinc.com>
To: Alexandre Ghiti <alexghiti@rivosinc.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] riscv: Only flush the mm icache when setting an exec pte
Message-ID: <ZcFqnm5/odPzQoHK@ghost>
References: <20240202124711.256146-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240202124711.256146-1-alexghiti@rivosinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240205_150922_827258_1B9C8E36 
X-CRM114-Status: GOOD (  24.95  )
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

On Fri, Feb 02, 2024 at 01:47:11PM +0100, Alexandre Ghiti wrote:
> We used to emit a flush_icache_all() whenever a dirty executable
> mapping is set in the page table but we can instead call
> flush_icache_mm() which will only send IPIs to cores that currently run
> this mm and add a deferred icache flush to the others.
> 
> The number of calls to sbi_remote_fence_i() (tested without IPI
> support):
> 
> With a simple buildroot rootfs:
> * Before: ~5k
> * After :  4 (!)
> 
> Tested on HW, the boot to login is ~4.5% faster.
> 
> With an ubuntu rootfs:
> * Before: ~24k
> * After : ~13k
> 
> Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> ---
>  arch/riscv/include/asm/pgtable.h | 14 +++++++-------
>  arch/riscv/mm/cacheflush.c       |  4 ++--
>  arch/riscv/mm/pgtable.c          |  2 +-
>  3 files changed, 10 insertions(+), 10 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
> index 0c94260b5d0c..058cfa89dd29 100644
> --- a/arch/riscv/include/asm/pgtable.h
> +++ b/arch/riscv/include/asm/pgtable.h
> @@ -513,12 +513,12 @@ static inline void set_pte(pte_t *ptep, pte_t pteval)
>  	WRITE_ONCE(*ptep, pteval);
>  }
>  
> -void flush_icache_pte(pte_t pte);
> +void flush_icache_pte(struct mm_struct *mm, pte_t pte);
>  
> -static inline void __set_pte_at(pte_t *ptep, pte_t pteval)
> +static inline void __set_pte_at(struct mm_struct *mm, pte_t *ptep, pte_t pteval)
>  {
>  	if (pte_present(pteval) && pte_exec(pteval))
> -		flush_icache_pte(pteval);
> +		flush_icache_pte(mm, pteval);
>  
>  	set_pte(ptep, pteval);
>  }
> @@ -529,7 +529,7 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  	page_table_check_ptes_set(mm, ptep, pteval, nr);
>  
>  	for (;;) {
> -		__set_pte_at(ptep, pteval);
> +		__set_pte_at(mm, ptep, pteval);
>  		if (--nr == 0)
>  			break;
>  		ptep++;
> @@ -541,7 +541,7 @@ static inline void set_ptes(struct mm_struct *mm, unsigned long addr,
>  static inline void pte_clear(struct mm_struct *mm,
>  	unsigned long addr, pte_t *ptep)
>  {
> -	__set_pte_at(ptep, __pte(0));
> +	__set_pte_at(mm, ptep, __pte(0));
>  }
>  
>  #define __HAVE_ARCH_PTEP_SET_ACCESS_FLAGS	/* defined in mm/pgtable.c */
> @@ -707,14 +707,14 @@ static inline void set_pmd_at(struct mm_struct *mm, unsigned long addr,
>  				pmd_t *pmdp, pmd_t pmd)
>  {
>  	page_table_check_pmd_set(mm, pmdp, pmd);
> -	return __set_pte_at((pte_t *)pmdp, pmd_pte(pmd));
> +	return __set_pte_at(mm, (pte_t *)pmdp, pmd_pte(pmd));
>  }
>  
>  static inline void set_pud_at(struct mm_struct *mm, unsigned long addr,
>  				pud_t *pudp, pud_t pud)
>  {
>  	page_table_check_pud_set(mm, pudp, pud);
> -	return __set_pte_at((pte_t *)pudp, pud_pte(pud));
> +	return __set_pte_at(mm, (pte_t *)pudp, pud_pte(pud));
>  }
>  
>  #ifdef CONFIG_PAGE_TABLE_CHECK
> diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
> index b0774993c0f3..3e234e95d952 100644
> --- a/arch/riscv/mm/cacheflush.c
> +++ b/arch/riscv/mm/cacheflush.c
> @@ -85,12 +85,12 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
>  #endif /* CONFIG_SMP */
>  
>  #ifdef CONFIG_MMU
> -void flush_icache_pte(pte_t pte)
> +void flush_icache_pte(struct mm_struct *mm, pte_t pte)
>  {
>  	struct folio *folio = page_folio(pte_page(pte));
>  
>  	if (!test_bit(PG_dcache_clean, &folio->flags)) {
> -		flush_icache_all();
> +		flush_icache_mm(mm, false);
>  		set_bit(PG_dcache_clean, &folio->flags);
>  	}
>  }
> diff --git a/arch/riscv/mm/pgtable.c b/arch/riscv/mm/pgtable.c
> index ef887efcb679..533ec9055fa0 100644
> --- a/arch/riscv/mm/pgtable.c
> +++ b/arch/riscv/mm/pgtable.c
> @@ -10,7 +10,7 @@ int ptep_set_access_flags(struct vm_area_struct *vma,
>  			  pte_t entry, int dirty)
>  {
>  	if (!pte_same(ptep_get(ptep), entry))
> -		__set_pte_at(ptep, entry);
> +		__set_pte_at(vma->vm_mm, ptep, entry);
>  	/*
>  	 * update_mmu_cache will unconditionally execute, handling both
>  	 * the case that the PTE changed and the spurious fault case.
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv

Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
