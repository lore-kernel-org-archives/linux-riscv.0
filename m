Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9FEACA1010
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Sep 2025 14:38:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xVEMY+it+mpcBAixXUqfSniGqAt9fVFsw2NQwlI3t+E=; b=suPRtL+YbztGQb
	ZY1vYBAfctLJMdOsZp+rn0tN3W+vD+hYViOxLNeyG5+Om2uJbXf5Ik4/sXRBCq5OLq9IAgDndypH5
	rXmgkW9qSp2g/b0WQUDmSaPF2mpRz+bUoQRq77HqN6ILz9IDEpAMlrp73tAlQyAUjx+w9LUKP2GHl
	Le/ZtsZGPlbb8/iv3TiB7VrI26QLgZB7c9xUgxee4txVQh6S0E54PljbT5en00gYFcE7atucaW2Ls
	S3jje/Q2L2iamIcrQ0KxHzcuXIQAQGa5sDo0HvCdnTNTa6UoQ6BYNbXMlzm+v/nWst//gVy9tdZlH
	Z3dk4nEhGENP0WD9b8gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuXZg-00000002Q0Y-1sQK;
	Fri, 05 Sep 2025 14:38:00 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuUam-00000001NAG-2aaD
	for linux-riscv@lists.infradead.org;
	Fri, 05 Sep 2025 11:26:57 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e96d8722c6eso2224076276.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Sep 2025 04:26:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20230601.gappssmtp.com; s=20230601; t=1757071615; x=1757676415; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yNzF16PbnrymzXw8XwNj1X2cjJHo1hQQnEraT/RlzJM=;
        b=iDDrBrlHlcxGEZHKZEZvpJsYStyeJ6dIZL8wPdh7nouLYXZ3rbls8jB1geZKiS9cG+
         PAyNVHvq3IxS49XFos8oyJ00c2y4PUkvT2gpgc+xLVhMA+H0Tqo+QEwdC7Z/LX8uDZiY
         6HrK/p2XUHfNHeJTlEgob2sOFbeCRbIXzwl0pc+2FrYhwBFHnhMvABIq8ouQmGev6cSe
         1BzHLen8z2xeBvq7YceYV8kVwPEotGe8HAyrXhmsmWZn/FrvZW4/awNmxpKus0NFH+NF
         iNfwqWEA4azHUv78aP1eBGxhb6sZBBEcjGqibVPlxK0C+O3eB8XLbAvSBNpR/KO513EC
         gJdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757071615; x=1757676415;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yNzF16PbnrymzXw8XwNj1X2cjJHo1hQQnEraT/RlzJM=;
        b=NWvISCN4xr7cNLZNsZZ9KIuf++tXeugbZWz62JaBc9lNhR4yNSGWEJlrrPDfwmsB22
         4y73xmCr+So2INelKVu21eEMvJ+F68xw3qdIImJDPaeE2h+7xdfrh+wZwwdEQsSN3gwf
         5HkoRZwS4v2c41YUMt7WJOZVAp5jt6mrG7ULe+DP+HUN2VSXbsqbjxbFm2KBokodZJeh
         LpjD2qnVz2TLae0vHD+rGbH1LTu6nXQPJROOxK/p8aXDv3IRlVNlOeQ7vYqZJ3H/y7pZ
         6Tc8/A5EqYsfWhFKoG9t1AIq4rXLFcFWQV8+RPUatWTK1Y4EYg8RnFqn1VBO49GEugn+
         e12Q==
X-Forwarded-Encrypted: i=1; AJvYcCUGiLokNf73tD5f7UBzdj4+yV8peYcWafytEzOgIyk8PEJzrlE4hZJqEBg4QuAgRHYz656lDaIi5/u2IA==@lists.infradead.org
X-Gm-Message-State: AOJu0YxFdqpx6qRmpoA3Cx4Ey10GuIO5D3O7qEeziKaolbc83eg4Mj1p
	wRGF5y/XUFsF6CKcm8Ooo7/bEo7g94Dcl2Xdz9fA+tdH0jnSJDMqvIRlP5JN5UZ0sck=
X-Gm-Gg: ASbGncuPrld8MSJx/JGqNjByeH/UH89MU+Q6V/3Ko0PT7A/GA8sz2pS2zIFHLpKZ+QI
	4RKe8V7AIFoRVGHJoWNzNy+YqwUSLikbcADZdn1a17MQlAuPjmadNA5T/tbKlXSsFqkULphMz2Y
	+5kxN2sl7RmS9GH5jLRavs4WImTCc6TJdaZ1yUDfeNZITg04SfwCUiQrp7uquYTTJvg8p3yzoW2
	SxQnrjhFb8oVA0muK734nF8b78Ev9GHO4EvplPZSJpytdykQrPzvh0M1F+92Yr1blQenzOiPiO5
	P7nGAfD+URF4dvIZRo/pTc9JeNJQFMvvky9s+9TSK5dn4gA3DhppmOeL1Od4XgpXDJoDTrmioc4
	epI/GQSw41K+4kBdlDg==
X-Google-Smtp-Source: AGHT+IEXVquWXmj0Yd3oyr4uhZoLxM2opNHaeihf8Xp8KBtnXc2guOYW42U1nSR+kmrTjCZ7Op/enQ==
X-Received: by 2002:a05:6902:18ce:b0:e96:fac0:60bc with SMTP id 3f1490d57ef6-e98a58455f2mr22114649276.41.1757071615282;
        Fri, 05 Sep 2025 04:26:55 -0700 (PDT)
Received: from [10.0.3.24] ([50.227.229.138])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e9bbdf504e0sm3031724276.11.2025.09.05.04.26.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Sep 2025 04:26:54 -0700 (PDT)
Message-ID: <1513d5fd-14ef-4cd0-a9a5-1016e9be6540@kernel.dk>
Date: Fri, 5 Sep 2025 05:26:53 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 19/37] mm/gup: remove record_subpages()
To: David Hildenbrand <david@redhat.com>, linux-kernel@vger.kernel.org
Cc: Alexander Potapenko <glider@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Brendan Jackman <jackmanb@google.com>, Christoph Lameter <cl@gentwo.org>,
 Dennis Zhou <dennis@kernel.org>, Dmitry Vyukov <dvyukov@google.com>,
 dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 iommu@lists.linux.dev, io-uring@vger.kernel.org,
 Jason Gunthorpe <jgg@nvidia.com>, Johannes Weiner <hannes@cmpxchg.org>,
 John Hubbard <jhubbard@nvidia.com>, kasan-dev@googlegroups.com,
 kvm@vger.kernel.org, "Liam R. Howlett" <Liam.Howlett@oracle.com>,
 Linus Torvalds <torvalds@linux-foundation.org>, linux-arm-kernel@axis.com,
 linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
 linux-ide@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-mmc@vger.kernel.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Marco Elver <elver@google.com>, Marek Szyprowski <m.szyprowski@samsung.com>,
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>,
 Muchun Song <muchun.song@linux.dev>, netdev@vger.kernel.org,
 Oscar Salvador <osalvador@suse.de>, Peter Xu <peterx@redhat.com>,
 Robin Murphy <robin.murphy@arm.com>, Suren Baghdasaryan <surenb@google.com>,
 Tejun Heo <tj@kernel.org>, virtualization@lists.linux.dev,
 Vlastimil Babka <vbabka@suse.cz>, wireguard@lists.zx2c4.com, x86@kernel.org,
 Zi Yan <ziy@nvidia.com>
References: <20250901150359.867252-1-david@redhat.com>
 <20250901150359.867252-20-david@redhat.com>
 <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
Content-Language: en-US
From: Jens Axboe <axboe@kernel.dk>
In-Reply-To: <5090355d-546a-4d06-99e1-064354d156b5@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250905_042656_672781_97E286CE 
X-CRM114-Status: GOOD (  25.69  )
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

On 9/5/25 12:41 AM, David Hildenbrand wrote:
> On 01.09.25 17:03, David Hildenbrand wrote:
>> We can just cleanup the code by calculating the #refs earlier,
>> so we can just inline what remains of record_subpages().
>>
>> Calculate the number of references/pages ahead of times, and record them
>> only once all our tests passed.
>>
>> Signed-off-by: David Hildenbrand <david@redhat.com>
>> ---
>>   mm/gup.c | 25 ++++++++-----------------
>>   1 file changed, 8 insertions(+), 17 deletions(-)
>>
>> diff --git a/mm/gup.c b/mm/gup.c
>> index c10cd969c1a3b..f0f4d1a68e094 100644
>> --- a/mm/gup.c
>> +++ b/mm/gup.c
>> @@ -484,19 +484,6 @@ static inline void mm_set_has_pinned_flag(struct mm_struct *mm)
>>   #ifdef CONFIG_MMU
>>     #ifdef CONFIG_HAVE_GUP_FAST
>> -static int record_subpages(struct page *page, unsigned long sz,
>> -               unsigned long addr, unsigned long end,
>> -               struct page **pages)
>> -{
>> -    int nr;
>> -
>> -    page += (addr & (sz - 1)) >> PAGE_SHIFT;
>> -    for (nr = 0; addr != end; nr++, addr += PAGE_SIZE)
>> -        pages[nr] = page++;
>> -
>> -    return nr;
>> -}
>> -
>>   /**
>>    * try_grab_folio_fast() - Attempt to get or pin a folio in fast path.
>>    * @page:  pointer to page to be grabbed
>> @@ -2967,8 +2954,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>>       if (pmd_special(orig))
>>           return 0;
>>   -    page = pmd_page(orig);
>> -    refs = record_subpages(page, PMD_SIZE, addr, end, pages + *nr);
>> +    refs = (end - addr) >> PAGE_SHIFT;
>> +    page = pmd_page(orig) + ((addr & ~PMD_MASK) >> PAGE_SHIFT);
>>         folio = try_grab_folio_fast(page, refs, flags);
>>       if (!folio)
>> @@ -2989,6 +2976,8 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>>       }
>>         *nr += refs;
>> +    for (; refs; refs--)
>> +        *(pages++) = page++;
>>       folio_set_referenced(folio);
>>       return 1;
>>   }
>> @@ -3007,8 +2996,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>>       if (pud_special(orig))
>>           return 0;
>>   -    page = pud_page(orig);
>> -    refs = record_subpages(page, PUD_SIZE, addr, end, pages + *nr);
>> +    refs = (end - addr) >> PAGE_SHIFT;
>> +    page = pud_page(orig) + ((addr & ~PUD_MASK) >> PAGE_SHIFT);
>>         folio = try_grab_folio_fast(page, refs, flags);
>>       if (!folio)
>> @@ -3030,6 +3019,8 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>>       }
>>         *nr += refs;
>> +    for (; refs; refs--)
>> +        *(pages++) = page++;
>>       folio_set_referenced(folio);
>>       return 1;
>>   }
> 
> Okay, this code is nasty. We should rework this code to just return the nr and receive a the proper
> pages pointer, getting rid of the "*nr" parameter.
> 
> For the time being, the following should do the trick:
> 
> commit bfd07c995814354f6b66c5b6a72e96a7aa9fb73b (HEAD -> nth_page)
> Author: David Hildenbrand <david@redhat.com>
> Date:   Fri Sep 5 08:38:43 2025 +0200
> 
>     fixup: mm/gup: remove record_subpages()
>         pages is not adjusted by the caller, but idnexed by existing *nr.
>         Signed-off-by: David Hildenbrand <david@redhat.com>
> 
> diff --git a/mm/gup.c b/mm/gup.c
> index 010fe56f6e132..22420f2069ee1 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2981,6 +2981,7 @@ static int gup_fast_pmd_leaf(pmd_t orig, pmd_t *pmdp, unsigned long addr,
>                 return 0;
>         }
>  
> +       pages += *nr;
>         *nr += refs;
>         for (; refs; refs--)
>                 *(pages++) = page++;
> @@ -3024,6 +3025,7 @@ static int gup_fast_pud_leaf(pud_t orig, pud_t *pudp, unsigned long addr,
>                 return 0;
>         }
>  
> +       pages += *nr;
>         *nr += refs;
>         for (; refs; refs--)
>                 *(pages++) = page++;
> 

Tested as fixing the issue for me, thanks.

-- 
Jens Axboe

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
