Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C77DC5DF86
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Aug 2026 11:50:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8r9AQB9iUMf0f3LW63EaugV0F/l2ZSusxLk7CtshUJk=; b=Dn/t9vHArm+gAR
	hQKksfx0FAAEtGszgKo4jfg70gkhgEDydf3HyW8z+IvfTkzTp+12iXDz+S1yH6Y5rS8fAQ+mT8EtL
	ji+5lyMKYYafLe9S1ZncYUH7Jdf14GKl6vTl2qkJcqrOKzlm9YT/+JnJ9TH9Zaghe/aU8GGRICwCO
	5gk6CwQAWtscb7/UOV3Hlfuh/58LHCLqLul/TcqlgPzhSA1y9yXmtt0DFRhd1zNEhJnf8WaTnO8Ne
	9BKC9B82tE7nedGGRhrMtKGvB7ndY9fTra6qsuixyTf3ee8IMMspkb14TXzf+gkQhbB44B66z4HVS
	cZR7985A6CZdMsmWHpTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweo4-00000009hi8-3RlZ;
	Wed, 19 Aug 2026 11:50:08 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wweo2-00000009hhQ-0u3k
	for linux-riscv@lists.infradead.org;
	Wed, 19 Aug 2026 11:50:07 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-39da69c5ba3so9370341fa.1
        for <linux-riscv@lists.infradead.org>; Wed, 19 Aug 2026 04:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787140204; x=1787745004; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=;
        b=j7Ag2Bjpu8HaLr0c1tAvInr8240b+MniiQK212faYTTeK4A2ApQJklse7b7yp1u8eL
         m0FSZxD32jACt17Xqcadn/xgk67NORY8T562BWTWKEP3xEEU4U2nAL4FRdgD1jR/Wi0H
         gTWc7KWVO78RhmxbLC9QGxXY0mMJGhvXP8+8k7DEx638Blk6HtanDYpUWSUsjyclYfpY
         Ph+/b5VRMCx5NLfJXSiv7oyak2s6H+PFE/5EjagLmRBt3Jg08DSGS0sNs5Wn6QrWFTW/
         j6yaj7WlySF83893sYx0jyuKPOOLNE/M5eS/S7um+zxTB/0y7LjNpqu3q437bbHM3iKx
         ch7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787140204; x=1787745004;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qb8vbO35I9ReDoy08LYZaOcpJWIqiGdFJcRUGNTu904=;
        b=SQlOav1uj1/v3F1PGTeWcWmcXppOh7evS0amb2NIdCKNTVEukjcOCwwIyjDZCwIS3n
         IjjmR9Oprqusj2EtmARmbIV1HqzZFZc1KQx0yAgusMOa9cEcgYpmMGIDFML/NRdsBhHE
         OxYykjKIH+0ONwZDpa4r/MpovK6tWQYGkU3eO5DjfvR1pq382TrlGzTNLPmSewCf+3Rm
         rlFDQj6wGtVxF3D7ipyJeyX3P2MmhlTQb9CUS3N+OwmMhWH+kOi1JWI4R6+8b4DaLo+X
         E6bW1e6irG8k7M/Xbcs5YtZcUDz5kt8X1DJuviRpYuClF67wKZJdAJssEM5CKFFdqFUK
         y4sg==
X-Forwarded-Encrypted: i=1; AHgh+RrLrBwYWJd/A1hUcb/0wx9GInuHzdR3iB9jRYaorCHkxTQ/gLq8Puh2JfFNLIau11YxN+pR6NFUpKdC2A==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy9ZpzD2NiLssjiEcnDU/hK8WQUpJZzAffMSciRai0QkyCIJgYm
	XW8HGmOZP7ES5Q4oDA5zmfpqJ9s7O/coPVXeKFz+wxQaNP07VWkwIMqG
X-Gm-Gg: AR+sD12FZwkWrfwbOpPwlQtcrMm7p2GvHBE8jEvBjn9USaN4QMUE7PWjgVk/RjLO2Re
	5Vj9U3Q+gjy9TQQNCWMwVFsVp3uEKv71NYyIvUhokFbzzf9UkpH7t5nlvApBFheGeYs0+Jz7b9t
	GjxaeBoON4Oe16Aja4aerGiL434pb+yCUXUmd7HcmwFzph2hjlH5oYZ09E/IM7toglbk8kHowNX
	RUqLtx+nt0Mm/OC9LgaEWoDBTOpv67BKOK9ecuTKnVmavcwb6wcd5eWIv/RszCSw/f24ip0XojS
	FxNdO5tXhXcQWmbx17HABFEuABK98wGlcIfBLDmRY/Pe82NWsgv+FzIllgpShaMKCVAp30Hp9LO
	gX7Kp2w3ows1zJB4iLPjs1Ld3DQbg6ODiI0NhdCnUU7Sp0mjuvy4OWKsO/KK+rrYpspROPcVchI
	D7ASl9eWClFenkHT8BzJocB+OFe/r9NaQifeCuSAze42wAB0J5nrAIkPMo6w961DnlrcD501zu+
	lQysVqMQj7wRUT1h/U=
X-Received: by 2002:a05:651c:3135:b0:39b:48c1:8cd4 with SMTP id 38308e7fff4ca-3a18996bd7dmr7858151fa.7.1787140203900;
        Wed, 19 Aug 2026 04:50:03 -0700 (PDT)
Received: from pc636 (host-95-193-137-165.mobileonline.telia.com. [95.193.137.165])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3a18a8e8579sm4123321fa.0.2026.08.19.04.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 04:50:03 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 19 Aug 2026 13:49:58 +0200
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Adrian =?utf-8?Q?Barna=C5=9B?= <abarnas@google.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Alexandre Ghiti <alex@ghiti.fr>, Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Hildenbrand <david@kernel.org>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>, Ingo Molnar <mingo@redhat.com>,
	Len Brown <lenb@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>, Pavel Machek <pavel@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"H. Peter Anvin" <hpa@zytor.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vasily Gorbik <gor@linux.ibm.com>, WANG Xuerui <kernel@xen0n.name>,
	Will Deacon <will@kernel.org>, x86@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, linux-pm@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	loongarch@lists.linux.dev
Subject: Re: [PATCH 3/6] mm/vmalloc: constify vm parameter of
 get_vm_area_page_order()
Message-ID: <aoWYZk7xNfjwuzQ_@pc636>
References: <20260816-execmem-set-vm-perms-v0-2-v1-0-90944a3ad43f@kernel.org>
 <20260816-execmem-set-vm-perms-v0-2-v1-3-90944a3ad43f@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260816-execmem-set-vm-perms-v0-2-v1-3-90944a3ad43f@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260819_045006_275947_19CDB112 
X-CRM114-Status: GOOD (  18.51  )
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

On Sun, Aug 16, 2026 at 01:59:26PM +0300, Mike Rapoport (Microsoft) wrote:
> get_vm_area_page_order() and vm_area_page_order() do not need to modify
> struct vm_struct passed to them.
> 
> Constify the parameter.
> 
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> ---
>  mm/vmalloc.c | 4 ++--
>  mm/vmalloc.h | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index 6822f0fe9583..fc7993db4152 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3124,7 +3124,7 @@ EXPORT_SYMBOL(vm_map_ram);
>  
>  static struct vm_struct *vmlist __initdata;
>  
> -static inline unsigned int vm_area_page_order(struct vm_struct *vm)
> +static inline unsigned int vm_area_page_order(const struct vm_struct *vm)
>  {
>  #ifdef CONFIG_HAVE_ARCH_HUGE_VMALLOC
>  	return vm->page_order;
> @@ -3133,7 +3133,7 @@ static inline unsigned int vm_area_page_order(struct vm_struct *vm)
>  #endif
>  }
>  
> -unsigned int get_vm_area_page_order(struct vm_struct *vm)
> +unsigned int get_vm_area_page_order(const struct vm_struct *vm)
>  {
>  	return vm_area_page_order(vm);
>  }
> diff --git a/mm/vmalloc.h b/mm/vmalloc.h
> index 8866ddcff668..211869f36509 100644
> --- a/mm/vmalloc.h
> +++ b/mm/vmalloc.h
> @@ -12,7 +12,7 @@ void __init vmalloc_init(void);
>  int __must_check vmap_pages_range_noflush(unsigned long addr, unsigned long end,
>  		pgprot_t prot, struct page **pages,
>  		unsigned int page_shift, gfp_t gfp_mask);
> -unsigned int get_vm_area_page_order(struct vm_struct *vm);
> +unsigned int get_vm_area_page_order(const struct vm_struct *vm);
>  #else
>  static inline void vmalloc_init(void) {}
>  
> 
> -- 
> 2.53.0
> 
LGTM:

Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>

--
Uladzislau Rezki

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
