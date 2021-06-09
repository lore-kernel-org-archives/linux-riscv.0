Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5BF1C48BCD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:57:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8748960FE5
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 10:57:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8748960FE5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xY+DkT9x9cuc7oXxQt4RUuaW1L57DBsDOyA0HqhZGxU=; b=sXziX0s1WLnI6giQ4o9ozJRnFW
	qDRgCD2SYI4SAKnLrHufyCMNKwBBAKZf2wgHy+7WdKaSPDbEuorBrcucgMPdQsl8crORKMFroqNsH
	lOCoQC763MkqED0Vsu/UenwGfIKpKnUivF3Ij7mOKW8K5fmMi6I4spODYjhtZFBXXXS48IJ72n4n9
	4dRMuwiJqu4Gi7jkmwQ2kRxU8iQ+2vaayQNAb9cIAIdR+Spu/LdSb9jJ4iIRY6x2BscrVOkyRilU9
	gzLverNP2UH1bsC4A3rMzxVtyGIglPyckS/+tcP1k1lDnK3y4qFegFK/Z0E7fjsXyuTJ4OxUPo6wX
	K5EGYlHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvt7-00DBLy-Mw; Wed, 09 Jun 2021 10:56:45 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvsC-00DAlQ-5L
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 10:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236147;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=8eJ75jP8VswGGJerrw0vTcQbjnv4lkuutS1tqnKekIs=;
 b=FPG8TD8moaSOEPvgSgepRE2nXpZ7Ng8goUh9oRSExPNUyNf36sUkLRmBKldJYSeVf9WY69
 MO/58tSzB7OCf3TPuQ4zIs0Kv5YZDNBQX9i9gsgHVG2G0lXTHMvlKNuxrTN9JCUcmoyyzL
 GbYjp4H06VAMOfvzhUA3jPbnHQym3YI=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-125-qfbhtJqiO0WFj56TmcJ50w-1; Wed, 09 Jun 2021 06:55:44 -0400
X-MC-Unique: qfbhtJqiO0WFj56TmcJ50w-1
Received: by mail-wr1-f70.google.com with SMTP id
 k25-20020a5d52590000b0290114dee5b660so10621459wrc.16
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 03:55:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=8eJ75jP8VswGGJerrw0vTcQbjnv4lkuutS1tqnKekIs=;
 b=AC706yWpa/JSV2zYbuUGpr1wvWPNGIx3exZpv87qTuLAAfftAheGDP0NAC+kG+2DZw
 5CCFdHJ6cYtNLXyaTjjGR3q2iJ0gME4Ce6oCufJ9k4MuOuz6er5rF9E5PNgwo6Q7Dazb
 UJPr8gioBIb9/zbMysGN1sz6atwhkpbSLXDswwPedQ8IheKhiAgtwWYJ1ehPwM3eoW7T
 mynSeBZxQudSRoXp0aFjSbz6A2b0nCQNsKXwPY0GjN6N9f79o/6rpQAH8N4YvuPzED1Q
 a84R78AXU5iFJPex0y3V9jU0JChMzrqh9cEPFo1HszWh852A01jfmefR7OkyTOlEtirb
 ivhQ==
X-Gm-Message-State: AOAM530pBnAwuE5p09NBvYg074wBYd/L37qaaAqEXU2mo8oP2eyq65ui
 FfzHJfAUEWFcrH+NzwtRup/FR8ALt3gH1K3yahh32OBzOAkvWBL0gjoQu1wxbsdVpITVGYu1lzY
 mCTQbtP6t3JMMYn5XP8t388I1b6Gc
X-Received: by 2002:a5d:5986:: with SMTP id n6mr17137230wri.60.1623236142821; 
 Wed, 09 Jun 2021 03:55:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwIGfmTwGC2TpIXNbv+PWtjaoi8HXZHgLLq9CIfPD3MO+tKk1vjDrGMDkIUZv5ZbdxqYiN+vw==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr17137201wri.60.1623236142550; 
 Wed, 09 Jun 2021 03:55:42 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 v17sm15896527wrp.36.2021.06.09.03.55.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:55:42 -0700 (PDT)
Subject: Re: [PATCH 6/9] arch, mm: remove stale mentions of DISCONIGMEM
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, 
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>, Jonathan Corbet
 <corbet@lwn.net>, Matt Turner <mattst88@gmail.com>,
 Mike Rapoport <rppt@linux.ibm.com>, Richard Henderson <rth@twiddle.net>,
 Vineet Gupta <vgupta@synopsys.com>, kexec@lists.infradead.org,
 linux-alpha@vger.kernel.org, linux-arch@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-mips@vger.kernel.org,
 linux-mm@kvack.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, linux-sh@vger.kernel.org,
 linux-snps-arc@lists.infradead.org, linux-xtensa@linux-xtensa.org,
 linuxppc-dev@lists.ozlabs.org, sparclinux@vger.kernel.org
References: <20210602105348.13387-1-rppt@kernel.org>
 <20210602105348.13387-7-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <84999e8d-fb52-a6a2-e467-f8cc7ac84325@redhat.com>
Date: Wed, 9 Jun 2021 12:55:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-7-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035548_351414_9345A5E7 
X-CRM114-Status: GOOD (  29.14  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 02.06.21 12:53, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> There are several places that mention DISCONIGMEM in comments or have stale
> code guarded by CONFIG_DISCONTIGMEM.
> 
> Remove the dead code and update the comments.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   arch/ia64/kernel/topology.c     | 5 ++---
>   arch/ia64/mm/numa.c             | 5 ++---
>   arch/mips/include/asm/mmzone.h  | 6 ------
>   arch/mips/mm/init.c             | 3 ---
>   arch/nds32/include/asm/memory.h | 6 ------
>   arch/xtensa/include/asm/page.h  | 4 ----
>   include/linux/gfp.h             | 4 ++--
>   7 files changed, 6 insertions(+), 27 deletions(-)
> 
> diff --git a/arch/ia64/kernel/topology.c b/arch/ia64/kernel/topology.c
> index 09fc385c2acd..3639e0a7cb3b 100644
> --- a/arch/ia64/kernel/topology.c
> +++ b/arch/ia64/kernel/topology.c
> @@ -3,9 +3,8 @@
>    * License.  See the file "COPYING" in the main directory of this archive
>    * for more details.
>    *
> - * This file contains NUMA specific variables and functions which can
> - * be split away from DISCONTIGMEM and are used on NUMA machines with
> - * contiguous memory.
> + * This file contains NUMA specific variables and functions which are used on
> + * NUMA machines with contiguous memory.
>    * 		2002/08/07 Erich Focht <efocht@ess.nec.de>
>    * Populate cpu entries in sysfs for non-numa systems as well
>    *  	Intel Corporation - Ashok Raj
> diff --git a/arch/ia64/mm/numa.c b/arch/ia64/mm/numa.c
> index 46b6e5f3a40f..d6579ec3ea32 100644
> --- a/arch/ia64/mm/numa.c
> +++ b/arch/ia64/mm/numa.c
> @@ -3,9 +3,8 @@
>    * License.  See the file "COPYING" in the main directory of this archive
>    * for more details.
>    *
> - * This file contains NUMA specific variables and functions which can
> - * be split away from DISCONTIGMEM and are used on NUMA machines with
> - * contiguous memory.
> + * This file contains NUMA specific variables and functions which are used on
> + * NUMA machines with contiguous memory.
>    *
>    *                         2002/08/07 Erich Focht <efocht@ess.nec.de>
>    */
> diff --git a/arch/mips/include/asm/mmzone.h b/arch/mips/include/asm/mmzone.h
> index b826b8473e95..7649ab45e80c 100644
> --- a/arch/mips/include/asm/mmzone.h
> +++ b/arch/mips/include/asm/mmzone.h
> @@ -20,10 +20,4 @@
>   #define nid_to_addrbase(nid) 0
>   #endif
>   
> -#ifdef CONFIG_DISCONTIGMEM
> -
> -#define pfn_to_nid(pfn)		pa_to_nid((pfn) << PAGE_SHIFT)
> -
> -#endif /* CONFIG_DISCONTIGMEM */
> -
>   #endif /* _ASM_MMZONE_H_ */
> diff --git a/arch/mips/mm/init.c b/arch/mips/mm/init.c
> index c36358758969..97f6ca341448 100644
> --- a/arch/mips/mm/init.c
> +++ b/arch/mips/mm/init.c
> @@ -454,9 +454,6 @@ void __init mem_init(void)
>   	BUILD_BUG_ON(IS_ENABLED(CONFIG_32BIT) && (_PFN_SHIFT > PAGE_SHIFT));
>   
>   #ifdef CONFIG_HIGHMEM
> -#ifdef CONFIG_DISCONTIGMEM
> -#error "CONFIG_HIGHMEM and CONFIG_DISCONTIGMEM dont work together yet"
> -#endif
>   	max_mapnr = highend_pfn ? highend_pfn : max_low_pfn;
>   #else
>   	max_mapnr = max_low_pfn;
> diff --git a/arch/nds32/include/asm/memory.h b/arch/nds32/include/asm/memory.h
> index 940d32842793..62faafbc28e4 100644
> --- a/arch/nds32/include/asm/memory.h
> +++ b/arch/nds32/include/asm/memory.h
> @@ -76,18 +76,12 @@
>    *  virt_to_page(k)	convert a _valid_ virtual address to struct page *
>    *  virt_addr_valid(k)	indicates whether a virtual address is valid
>    */
> -#ifndef CONFIG_DISCONTIGMEM
> -
>   #define ARCH_PFN_OFFSET		PHYS_PFN_OFFSET
>   #define pfn_valid(pfn)		((pfn) >= PHYS_PFN_OFFSET && (pfn) < (PHYS_PFN_OFFSET + max_mapnr))
>   
>   #define virt_to_page(kaddr)	(pfn_to_page(__pa(kaddr) >> PAGE_SHIFT))
>   #define virt_addr_valid(kaddr)	((unsigned long)(kaddr) >= PAGE_OFFSET && (unsigned long)(kaddr) < (unsigned long)high_memory)
>   
> -#else /* CONFIG_DISCONTIGMEM */
> -#error CONFIG_DISCONTIGMEM is not supported yet.
> -#endif /* !CONFIG_DISCONTIGMEM */
> -
>   #define page_to_phys(page)	(page_to_pfn(page) << PAGE_SHIFT)
>   
>   #endif
> diff --git a/arch/xtensa/include/asm/page.h b/arch/xtensa/include/asm/page.h
> index 37ce25ef92d6..493eb7083b1a 100644
> --- a/arch/xtensa/include/asm/page.h
> +++ b/arch/xtensa/include/asm/page.h
> @@ -192,10 +192,6 @@ static inline unsigned long ___pa(unsigned long va)
>   #define pfn_valid(pfn) \
>   	((pfn) >= ARCH_PFN_OFFSET && ((pfn) - ARCH_PFN_OFFSET) < max_mapnr)
>   
> -#ifdef CONFIG_DISCONTIGMEM
> -# error CONFIG_DISCONTIGMEM not supported
> -#endif
> -
>   #define virt_to_page(kaddr)	pfn_to_page(__pa(kaddr) >> PAGE_SHIFT)
>   #define page_to_virt(page)	__va(page_to_pfn(page) << PAGE_SHIFT)
>   #define virt_addr_valid(kaddr)	pfn_valid(__pa(kaddr) >> PAGE_SHIFT)
> diff --git a/include/linux/gfp.h b/include/linux/gfp.h
> index 11da8af06704..dbe1f5fc901d 100644
> --- a/include/linux/gfp.h
> +++ b/include/linux/gfp.h
> @@ -494,8 +494,8 @@ static inline int gfp_zonelist(gfp_t flags)
>    * There are two zonelists per node, one for all zones with memory and
>    * one containing just zones from the node the zonelist belongs to.
>    *
> - * For the normal case of non-DISCONTIGMEM systems the NODE_DATA() gets
> - * optimized to &contig_page_data at compile-time.
> + * For the case of non-NUMA systems the NODE_DATA() gets optimized to
> + * &contig_page_data at compile-time.
>    */
>   static inline struct zonelist *node_zonelist(int nid, gfp_t flags)
>   {
> 

Reviewed-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
