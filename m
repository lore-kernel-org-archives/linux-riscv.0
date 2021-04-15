Return-Path: <SRS0=wvp3=JM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4CCBC433B4
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 22:44:21 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D906A61026
	for <linux-riscv@archiver.kernel.org>; Thu, 15 Apr 2021 22:44:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D906A61026
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=axtens.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:References:In-Reply-To:
	Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p1NQKD5D+3+bw7JlkB+fd27t7oLrxgH4E/1XJxHySG8=; b=L5jqVx6Xu4NKZKBWSrAwKzFb6
	5GP932bQPHPWKipqP1D3ZFeQ8d/acAIm5dlzYrLbaMnI5nuu4ZqxwUmnyAfE0KQxPRCFr416Fty6m
	9VgLvz0pJZo4G3tVBe1e81tD8uQtWPuht+FrqU2CpkWlZvHLs94SzU/l7Oc9URIvOXJRkpKDZubyt
	ABRZYNICzcBt4sZ5c9arl/IB9znkduHVTREKrPP9fMU1uL+gI63qzPtN/7S5ch7A2a3IdqEZSahd9
	kOX2y+KAsYzyt+tQ6nDOnxnB1cSYey8CCBuGMtD/dLypRDtlivijAj5OzAoUXWf9rMuupaVehiLP4
	I2784V18g==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lXAiO-00HZCx-F3; Thu, 15 Apr 2021 22:44:00 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXAiA-00HZBp-8V
 for linux-riscv@desiato.infradead.org; Thu, 15 Apr 2021 22:43:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Type:MIME-Version:Message-ID:
 Date:References:In-Reply-To:Subject:Cc:To:From:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=JY3LY8etXyosEeu5nfWlhvzebGDT/edrkrlKplV2R0Q=; b=WnTl1phs7AVmowgCChp/QftTor
 vtVF4h9sa/EvjNfiEA9LVQYpWxrjXzg0Yuscfttxg8GyB5/mB5NQ/g0N2ge9GFss2EhDpyj+yFbhR
 7LhhkeY0Q+AR8tjSJZiXkDCRnZxHBIRwIwIFR/EZU/ZpUH6sbz95G1GYvEVRVwK3dqSf6JDz1yQwF
 i8X/EMMO/sW8yLKdyOvQ0ogVTVSEMQ77SI+zNehGKJdr1FREFOGpZCgJA808Mcw1rdTHE8IfLT/b0
 IAP3YxeZB4ufPZ91skkDF84AHacKjRg/PYpwZWzIcnd4PlFnqQEHREl+e8WzuDPCC0HqObLTUqPgC
 FhUwBaVg==;
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lXAi7-008x2i-E1
 for linux-riscv@lists.infradead.org; Thu, 15 Apr 2021 22:43:45 +0000
Received: by mail-pl1-x630.google.com with SMTP id m18so10712971plc.13
 for <linux-riscv@lists.infradead.org>; Thu, 15 Apr 2021 15:43:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=axtens.net; s=google;
 h=from:to:cc:subject:in-reply-to:references:date:message-id
 :mime-version; bh=JY3LY8etXyosEeu5nfWlhvzebGDT/edrkrlKplV2R0Q=;
 b=LGwG/jXjcqstX7vCLunH2tlSTh6FEg3VqmVYhhwaWMbz1gRpN9Dc+pKMBttZG4F2eH
 +nk8aBQ2fPJnJhVZ2Nv5ytsKTlagBaosP37szFwCRj8Ib0f+ZQBXZ6lPne4jFGq86Bs7
 Yl/AWNZNO+DwuQ/A/1FVG7uXMXFQ0Bg71mqpI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:in-reply-to:references:date
 :message-id:mime-version;
 bh=JY3LY8etXyosEeu5nfWlhvzebGDT/edrkrlKplV2R0Q=;
 b=SrRgxexswWXV43X++tvtxLSc6o3RlXSHMebcDvgvGzFZYdfsCm0toqvSiuPWaKKXFn
 jYbkuhgrCsF+zz8HCafMWoRecGw/daX8wQCfNPNtvgLHSA+p7miWOVmQSlQZsG2h7ntv
 jc/ZJoJRG2ON5Tfh3R6HcFW1ndsqjScON2PxfcbaRgbMMNWTYbHayJtMEBop8ZcyhGgE
 2L0Vl7UcllyM2wkv2MlUP3Bb6NmgWjj0ru7eMpwdSEmN2+vs61U91CKSePYMlGbTy3iX
 wQHm0E2fY4n2ILYyPSF+TuWiFEbwJniHImRheUw5XJ5wbI9C/br9U0CZF24NYUhnKSYK
 7Zsg==
X-Gm-Message-State: AOAM533oktoOABfjm4TTIKs0yNI9Aapy9yaLAatc3mMAM6QzAeT3nR48
 8boRI6BtoEeA/D4MPvwyuQOd5w==
X-Google-Smtp-Source: ABdhPJyqfJG8J3NRw4PtXWUZy53AS96UfvtUYllUApPaRqPEmjx1X+9e6E5OLIVUTnR/j6EwfW2Icg==
X-Received: by 2002:a17:90a:17a3:: with SMTP id
 q32mr6358434pja.224.1618526621918; 
 Thu, 15 Apr 2021 15:43:41 -0700 (PDT)
Received: from localhost
 (2001-44b8-111e-5c00-3f8b-a64e-9a27-b872.static.ipv6.internode.on.net.
 [2001:44b8:111e:5c00:3f8b:a64e:9a27:b872])
 by smtp.gmail.com with ESMTPSA id h22sm2980650pfn.55.2021.04.15.15.43.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Apr 2021 15:43:41 -0700 (PDT)
From: Daniel Axtens <dja@axtens.net>
To: Christophe Leroy <christophe.leroy@csgroup.eu>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Steven Price <steven.price@arm.com>, akpm@linux-foundation.org
Cc: linux-arch@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-kernel@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org,
 x86@kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v1 1/5] mm: pagewalk: Fix walk for hugepage tables
In-Reply-To: <733408f48b1ed191f53518123ee6fc6d42287cc6.1618506910.git.christophe.leroy@csgroup.eu>
References: <cover.1618506910.git.christophe.leroy@csgroup.eu>
 <733408f48b1ed191f53518123ee6fc6d42287cc6.1618506910.git.christophe.leroy@csgroup.eu>
Date: Fri, 16 Apr 2021 08:43:38 +1000
Message-ID: <877dl3184l.fsf@dja-thinkpad.axtens.net>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210415_154343_485195_2AF2FAEF 
X-CRM114-Status: GOOD (  24.75  )
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

Hi Christophe,

> Pagewalk ignores hugepd entries and walk down the tables
> as if it was traditionnal entries, leading to crazy result.
>
> Add walk_hugepd_range() and use it to walk hugepage tables.
>
> Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
> ---
>  mm/pagewalk.c | 54 +++++++++++++++++++++++++++++++++++++++++++++------
>  1 file changed, 48 insertions(+), 6 deletions(-)
>
> diff --git a/mm/pagewalk.c b/mm/pagewalk.c
> index e81640d9f177..410a9d8f7572 100644
> --- a/mm/pagewalk.c
> +++ b/mm/pagewalk.c
> @@ -58,6 +58,32 @@ static int walk_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	return err;
>  }
>  
> +static int walk_hugepd_range(hugepd_t *phpd, unsigned long addr,
> +			     unsigned long end, struct mm_walk *walk, int pdshift)
> +{
> +	int err = 0;
> +#ifdef CONFIG_ARCH_HAS_HUGEPD
> +	const struct mm_walk_ops *ops = walk->ops;
> +	int shift = hugepd_shift(*phpd);
> +	int page_size = 1 << shift;
> +
> +	if (addr & (page_size - 1))
> +		return 0;
> +
> +	for (;;) {
> +		pte_t *pte = hugepte_offset(*phpd, addr, pdshift);
> +
> +		err = ops->pte_entry(pte, addr, addr + page_size, walk);
> +		if (err)
> +			break;
> +		if (addr >= end - page_size)
> +			break;
> +		addr += page_size;
> +	}

Initially I thought this was a somewhat unintuitive way to structure
this loop, but I see it parallels the structure of walk_pte_range_inner,
so I think the consistency is worth it.

I notice the pte walking code potentially takes some locks: does this
code need to do that?

arch/powerpc/mm/hugetlbpage.c says that hugepds are protected by the
mm->page_table_lock, but I don't think we're taking it in this code.

> +#endif
> +	return err;
> +}
> +
>  static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  			  struct mm_walk *walk)
>  {
> @@ -108,7 +134,10 @@ static int walk_pmd_range(pud_t *pud, unsigned long addr, unsigned long end,
>  				goto again;
>  		}
>  
> -		err = walk_pte_range(pmd, addr, next, walk);
> +		if (is_hugepd(__hugepd(pmd_val(*pmd))))
> +			err = walk_hugepd_range((hugepd_t *)pmd, addr, next, walk, PMD_SHIFT);
> +		else
> +			err = walk_pte_range(pmd, addr, next, walk);
>  		if (err)
>  			break;
>  	} while (pmd++, addr = next, addr != end);
> @@ -157,7 +186,10 @@ static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
>  		if (pud_none(*pud))
>  			goto again;
>  
> -		err = walk_pmd_range(pud, addr, next, walk);
> +		if (is_hugepd(__hugepd(pud_val(*pud))))
> +			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
> +		else
> +			err = walk_pmd_range(pud, addr, next, walk);

I'm a bit worried you might end up calling into walk_hugepd_range with
ops->pte_entry == NULL, and then jumping to 0.

static int walk_pud_range(p4d_t *p4d, unsigned long addr, unsigned long end,
			  struct mm_walk *walk)
{
...
        pud = pud_offset(p4d, addr);
	do {
                ...
                if ((!walk->vma && (pud_leaf(*pud) || !pud_present(*pud))) ||
		    walk->action == ACTION_CONTINUE ||
		    !(ops->pmd_entry || ops->pte_entry)) <<< THIS CHECK
			continue;
                ...
		if (is_hugepd(__hugepd(pud_val(*pud))))
			err = walk_hugepd_range((hugepd_t *)pud, addr, next, walk, PUD_SHIFT);
		else
			err = walk_pmd_range(pud, addr, next, walk);
		if (err)
			break;
	} while (pud++, addr = next, addr != end);

walk_pud_range will proceed if there is _either_ an ops->pmd_entry _or_
an ops->pte_entry, but walk_hugepd_range will call ops->pte_entry
unconditionally.

The same issue applies to walk_{p4d,pgd}_range...

Kind regards,
Daniel

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
