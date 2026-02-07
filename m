Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AFCEE0AF3
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Feb 2026 20:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HvsFKPNFUpvC1fL9l73h2lUCd6RW/d9LMhdEHDjPkII=; b=xeDnvxKx+yJsZJ
	sUxaDdZ8Oeirke9zbZnH7q62lbMuQeUhqXMmo/SsTEbMhwb+G5gCVwPoxRTXE2oFFnyEpGPdbZhVY
	h6YziEn8EZAE3ajwZHUaUC3c30sgIx97242ySrIOJte1MnZZPqWB2ypazLJuKHm+IPrBFnguFKb5h
	R/kGFdDt8dGdin09NSY7I74vW/n1BuQFbeET2UVSHmCVfgGiJLYC3RCoJUQIXUAZTyUxz2THGHpIG
	rmxkQyLj8qCLvNdkUIbT4S7Wftwz7+2PMpIU2BbKwBmmos+K1Dyo45OoMQf5HWsnEx1/09MAcy61n
	sjSBBP/mPe6iU760znag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voomK-0000000CkNr-0jd0;
	Sat, 07 Feb 2026 20:19:40 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voomI-0000000CkNM-0acM
	for linux-riscv@lists.infradead.org;
	Sat, 07 Feb 2026 20:19:39 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4806cc07ce7so33138465e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 07 Feb 2026 12:19:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770495576; x=1771100376; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LmE23qjtgb2EulsiY+c7A9BQzukrzPbX/0RgHfT6JCg=;
        b=h7sqsQYkvXQ+xsMSQ+qNqNk1GHNwzLA68aCB+WwXAw/9IW4FYnkhZ955a52Y3igSPO
         TzU6IMlgFTXr6q5zDV7R1fNi+GOBs2k/lFK1hYPEe7We85hIiTlWdi0yyd+3OdWvapxX
         QX6kx5KggCjaWen1+dzVX28tJpqgja1XmjY3+yRPm2CQrsg8e8X4Vm4fSHfqPz3bDnFs
         2pD75L/oE5b7l/wjurDdrsdcMe0mqGU8hfijTSAMFVOTuBqDtSi+9W+B75vgiIPAMoS2
         SqxnedfjMeD9nuqEjBHqe7Ka9UIeznGSV3GAULtFZ985uf6WgMZxm4I5OrSCTiZDLtvT
         ca0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770495576; x=1771100376;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LmE23qjtgb2EulsiY+c7A9BQzukrzPbX/0RgHfT6JCg=;
        b=Npp7FLgdvWoh7l5nvfkIftbnsgvQIelKZ1iCKCUX75GrhdZZqV0kl0KaFp0f/JfSn+
         K+xiL2tGJ0UKLDM2+7hjb7hw6yG4bastpNrSNfYUttPQUi+81zLvBJFSkCAltsFGATj7
         0psjZXMKl27QOq8iPKsHNZ+P4kiBB1BheANqC9XmgqwDUOEneKSax8SdiHqnBfvqvUs8
         MIB1l27L04ayBdA36Rxui7/Ar+nQJpCGjSHNYxIJjA4mgnpFWvV8nBSECzYsEoI/SBqR
         UIUOorOm0Z+le8DWkpz/IXw7z2bMPGgn04RuqvfJpMGIdV5oaHvvOKo25CsDVC9dH8As
         /ghw==
X-Forwarded-Encrypted: i=1; AJvYcCWJXICGliSSkeXjyisn8SH43k/nMkgFLwbJp3BXyCXVtc9i84Y0mBpk+OVQVkmRg3T42fo8EcCPzDErjw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxnB73P8XPngUPDYkPsdSu/XHYzGH+t6fayKMjezNPRuiwtiJoM
	Ijs8/JPs8op6BnSRGTZ4K0tqydi1mM9BabJN216o5oJ+KFgl2iubRdxN
X-Gm-Gg: AZuq6aKeJsJHlGoPcofAx74hM4QXaFanDBlmBavowINawn8USljS0q/n5Spc9JAlDaf
	q8v+5yEE8OTkgYl0EzAMx8fcc0A8gdVZLkgKv9ZF7bo6d4F/717J+I/wlEcHCMhK3jEjYiO552l
	+BIHNcNfdzi5uxRsJJvPmnFFIxlnyrRZNf61bM1altIp7x7y0eVs401EbJlVBaeCNLfw78/FQWu
	voLYr5WXYAZ8CHFi0GteB3Yi2bj45xrFLS0463kGC/LfcsU/yjrioR4fVKi344scWq+eyDiM5AM
	+dDmEKW1TY3wJm+U6jSMqtdu6vPW866weMvE3zWace+DiqOmxdD7nJMWU3hiwgjmj4uSrHw3PN5
	sWNh+kxd3QyyjKfY9NUK31fhJ3DuBzHWTUluooJ5Z1N8jduAK2M/NTRbxf6UQJeti7LQ9ALx0mC
	FRblsWBB+qrGKE4AVemlvRq4/gwhLOJohEXVEVdItQxBcp2FMMqD3ScM4rPN/+mxoPWqHJkIoSg
	29hVg4oXkON0SM=
X-Received: by 2002:a05:600c:4f8a:b0:480:3230:6c9b with SMTP id 5b1f17b1804b1-483201dd004mr94651865e9.7.1770495575929;
        Sat, 07 Feb 2026 12:19:35 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e752:9400:18cf:c773:ee86:c436? ([2a02:6b6f:e752:9400:18cf:c773:ee86:c436])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483206cc7d3sm131304355e9.5.2026.02.07.12.19.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Feb 2026 12:19:34 -0800 (PST)
Message-ID: <fd80736b-7b2a-4675-82a7-1902705c6361@gmail.com>
Date: Sat, 7 Feb 2026 20:19:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHv6 07/17] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, kernel-team@meta.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 loongarch@lists.linux.dev, linux-riscv@lists.infradead.org
References: <20260202155634.650837-1-kas@kernel.org>
 <20260202155634.650837-8-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20260202155634.650837-8-kas@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260207_121938_442304_718584CB 
X-CRM114-Status: GOOD (  33.71  )
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



On 02/02/2026 15:56, Kiryl Shutsemau wrote:
> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
> 
> For cases when size of struct page is power-of-2, change the encoding of
> compound_info to store a mask that can be applied to the virtual address
> of the tail page in order to access the head page. It is possible
> because struct page of the head page is naturally aligned with regards
> to order of the page.
> 
> The significant impact of this modification is that all tail pages of
> the same order will now have identical 'compound_info', regardless of
> the compound page they are associated with. This paves the way for
> eliminating fake heads.
> 
> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
> applied when the sizeof(struct page) is power-of-2. Having identical
> tail pages allows the same page to be mapped into the vmemmap of all
> pages, maintaining memory savings without fake heads.
> 
> If sizeof(struct page) is not power-of-2, there is no functional
> changes.
> 
> Limit mask usage to HugeTLB vmemmap optimization (HVO) where it makes
> a difference. The approach with mask would work in the wider set of
> conditions, but it requires validating that struct pages are naturally
> aligned for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> Reviewed-by: Zi Yan <ziy@nvidia.com>
> ---

Acked-by: Usama Arif <usamaarif642@gmail.com>

Small nit below:

>  include/linux/page-flags.h | 81 ++++++++++++++++++++++++++++++++++----
>  mm/slab.h                  | 16 ++++++--
>  mm/util.c                  | 16 ++++++--
>  3 files changed, 97 insertions(+), 16 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index d14a17ffb55b..8f2c7fbc739b 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -198,6 +198,29 @@ enum pageflags {
>  
>  #ifndef __GENERATING_BOUNDS_H
>  
> +/*
> + * For tail pages, if the size of struct page is power-of-2 ->compound_info
> + * encodes the mask that converts the address of the tail page address to
> + * the head page address.
> + *
> + * Otherwise, ->compound_info has direct pointer to head pages.
> + */
> +static __always_inline bool compound_info_has_mask(void)
> +{
> +	/*
> +	 * Limit mask usage to HugeTLB vmemmap optimization (HVO) where it
> +	 * makes a difference.
> +	 *
> +	 * The approach with mask would work in the wider set of conditions,
> +	 * but it requires validating that struct pages are naturally aligned
> +	 * for all orders up to the MAX_FOLIO_ORDER, which can be tricky.
> +	 */
> +	if (!IS_ENABLED(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP))
> +		return false;
> +
> +	return is_power_of_2(sizeof(struct page));
> +}
> +
>  #ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
>  DECLARE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
>  
> @@ -210,6 +233,10 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>  	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
>  		return page;
>  
> +	/* Fake heads only exists if compound_info_has_mask() is true */
> +	if (!compound_info_has_mask())
> +		return page;
> +
>  	/*
>  	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
>  	 * struct page. The alignment check aims to avoid access the fields (
> @@ -223,10 +250,14 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>  		 * because the @page is a compound page composed with at least
>  		 * two contiguous pages.
>  		 */
> -		unsigned long head = READ_ONCE(page[1].compound_info);
> +		unsigned long info = READ_ONCE(page[1].compound_info);
>  
> -		if (likely(head & 1))
> -			return (const struct page *)(head - 1);
> +		/* See set_compound_head() */
> +		if (likely(info & 1)) {
> +			unsigned long p = (unsigned long)page;
> +
> +			return (const struct page *)(p & info);
> +		}
>  	}
>  	return page;
>  }
> @@ -281,11 +312,26 @@ static __always_inline int page_is_fake_head(const struct page *page)
>  
>  static __always_inline unsigned long _compound_head(const struct page *page)
>  {
> -	unsigned long head = READ_ONCE(page->compound_info);
> +	unsigned long info = READ_ONCE(page->compound_info);
>  
> -	if (unlikely(head & 1))
> -		return head - 1;
> -	return (unsigned long)page_fixed_fake_head(page);
> +	/* Bit 0 encodes PageTail() */
> +	if (!(info & 1))
> +		return (unsigned long)page_fixed_fake_head(page);
> +
> +	/*
> +	 * If compound_info_has_mask() is false, the rest of compound_info is
> +	 * the pointer to the head page.
> +	 */
> +	if (!compound_info_has_mask())
> +		return info - 1;
> +
> +	/*
> +	 * If compoun_info_has_mask() is true the rest of the info encodes

s/compoun_info_has_mask/compound_info_has_mask/

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
