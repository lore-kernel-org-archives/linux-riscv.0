Return-Path: <SRS0=S+R5=LD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFB72C48BCD
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 11:01:32 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 744B76136D
	for <linux-riscv@archiver.kernel.org>; Wed,  9 Jun 2021 11:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 744B76136D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:Cc:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=olRbFqI2/7KiFSbLRNMaae/BKhSARaE1MlJ/ICvK8HI=; b=iXgckD0DDff+D5jpq6g8GHuiih
	vVbG3kZEgzov7KLnasgkJvoDE5ftMUFz2nGvUOD/m0UeyHYmWsiNwUat+DIVi/jlXI0IIcGdFvMjT
	AUNHvLVmN76g54HxOOe7eJU4Rrvb8gO8FLDdP99kU1YTAzdTzsrYQg1rokHixM+ESF0ZVYk1vHWHx
	Br56v09rU2TLBbY/V+xj18ZmA0KXuBfvYI95kXYwavZNyUaARtceYAvxrf/gOwqBF9Dga1c6C1Bj/
	VFknepNI5awh7Y+Zqv/hbIL2nVeW0cL4H8gvKtS88INtcxk2P7YxiJ+wNwXdbBTmC7u0/wk+3cBTN
	lsHANDGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lqvxR-00DDQC-TM; Wed, 09 Jun 2021 11:01:13 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lqvua-00DCBT-4E
 for linux-riscv@lists.infradead.org; Wed, 09 Jun 2021 10:58:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1623236295;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=2Gdg9+tpOx626Ezvggt1xE7D6QrGInTamndBpZke/4o=;
 b=X/JH4frm23e51OvL+AzU/aGWN4rwxW2nutCDtOm9LyTOJ/rzwK4RgqtIqNDskkViAY0b6j
 QsdxlegHTDekdhcER9oIYr8BV3Fi9hIVng/rQ/W7RX39u3ZqNYbFp3mtJVvbGCdRe5Vq6D
 0dJzVXNeFzQMfVoJmLP17f8BVs/C8FM=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-1YNVgll1MQOz0jBF76sAKg-1; Wed, 09 Jun 2021 06:58:14 -0400
X-MC-Unique: 1YNVgll1MQOz0jBF76sAKg-1
Received: by mail-wr1-f70.google.com with SMTP id
 f22-20020a5d58f60000b029011634e39889so10575602wrd.7
 for <linux-riscv@lists.infradead.org>; Wed, 09 Jun 2021 03:58:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:organization
 :message-id:date:user-agent:mime-version:in-reply-to
 :content-language:content-transfer-encoding;
 bh=2Gdg9+tpOx626Ezvggt1xE7D6QrGInTamndBpZke/4o=;
 b=NQHUqbzQGeYI15lMis9TVLK+nd+lMm+iwZflfpvVqpxJxj/G2HYe9RlWdywGb+9bMa
 6E/qFnIG9c1vLqH39xTXeBB/f/EyTLVDE+mjbjDgt2W5LESb20AsS2LwZyz5dVjBJj1U
 GQuHN3QG4h/Q9O/NweXAoCwx6r0ggZhYpl0xWbHcdC8tdZ9BnO9W9W/WiOOInO3Y19E1
 KMQr5okGlmuWKqBqXNcCQXiSydsCL3AQjhbmzIkmPlSIYRXQiM4s5EVQueWg/BgJIiCh
 yoDX1G9wfJ8u2Q1ngXttrIknYQJaszo9VqpT1rbyb3zanhPR1ekSQ460iOTEYWs2+SJb
 J5YA==
X-Gm-Message-State: AOAM5316CESebcQ2k+JG8fTTuo7a3fFuNThpdFQ5JhCF5vKs60RdZJ0U
 5ndaSanyKHgL0+QZGAaje57Qgn3lwgkgq4nxLwQCKIEq3iDsF/+WS6rTdn9GKRiIp9inLg1HbnR
 4sAvmnN7wRVRtWA9d+gh93cNub4FN
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr27256979wrx.144.1623236292858; 
 Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxANfssiXPPwd5jXqSLFwZZmn/VQ6v6aq6x8NxYxZ6oulxycL5+UbfQGME/wwP7BrwnDfbhqg==
X-Received: by 2002:a5d:6b81:: with SMTP id n1mr27256934wrx.144.1623236292583; 
 Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
Received: from [192.168.3.132] (p5b0c611d.dip0.t-ipconnect.de. [91.12.97.29])
 by smtp.gmail.com with ESMTPSA id
 o3sm24218939wrm.78.2021.06.09.03.58.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 09 Jun 2021 03:58:12 -0700 (PDT)
Subject: Re: [PATCH 9/9] mm: replace CONFIG_FLAT_NODE_MEM_MAP with
 CONFIG_FLATMEM
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
 <20210602105348.13387-10-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat
Message-ID: <5dc2c695-06c9-671f-a77d-24db56485041@redhat.com>
Date: Wed, 9 Jun 2021 12:58:11 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210602105348.13387-10-rppt@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=david@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210609_035816_321416_349A5232 
X-CRM114-Status: GOOD (  26.33  )
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
> After removal of the DISCONTIGMEM memory model the FLAT_NODE_MEM_MAP
> configuration option is equivalent to FLATMEM.
> 
> Drop CONFIG_FLAT_NODE_MEM_MAP and use CONFIG_FLATMEM instead.
> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> ---
>   include/linux/mmzone.h | 4 ++--
>   kernel/crash_core.c    | 2 +-
>   mm/Kconfig             | 4 ----
>   mm/page_alloc.c        | 6 +++---
>   mm/page_ext.c          | 2 +-
>   5 files changed, 7 insertions(+), 11 deletions(-)
> 
> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> index ad42f440c704..2698cdbfbf75 100644
> --- a/include/linux/mmzone.h
> +++ b/include/linux/mmzone.h
> @@ -775,7 +775,7 @@ typedef struct pglist_data {
>   	struct zonelist node_zonelists[MAX_ZONELISTS];
>   
>   	int nr_zones; /* number of populated zones in this node */
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP	/* means !SPARSEMEM */
> +#ifdef CONFIG_FLATMEM	/* means !SPARSEMEM */
>   	struct page *node_mem_map;
>   #ifdef CONFIG_PAGE_EXTENSION
>   	struct page_ext *node_page_ext;
> @@ -865,7 +865,7 @@ typedef struct pglist_data {
>   
>   #define node_present_pages(nid)	(NODE_DATA(nid)->node_present_pages)
>   #define node_spanned_pages(nid)	(NODE_DATA(nid)->node_spanned_pages)
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   #define pgdat_page_nr(pgdat, pagenr)	((pgdat)->node_mem_map + (pagenr))
>   #else
>   #define pgdat_page_nr(pgdat, pagenr)	pfn_to_page((pgdat)->node_start_pfn + (pagenr))
> diff --git a/kernel/crash_core.c b/kernel/crash_core.c
> index 53eb8bc6026d..2b8446ea7105 100644
> --- a/kernel/crash_core.c
> +++ b/kernel/crash_core.c
> @@ -483,7 +483,7 @@ static int __init crash_save_vmcoreinfo_init(void)
>   	VMCOREINFO_OFFSET(page, compound_head);
>   	VMCOREINFO_OFFSET(pglist_data, node_zones);
>   	VMCOREINFO_OFFSET(pglist_data, nr_zones);
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   	VMCOREINFO_OFFSET(pglist_data, node_mem_map);
>   #endif
>   	VMCOREINFO_OFFSET(pglist_data, node_start_pfn);
> diff --git a/mm/Kconfig b/mm/Kconfig
> index bffe4bd859f3..ded98fb859ab 100644
> --- a/mm/Kconfig
> +++ b/mm/Kconfig
> @@ -55,10 +55,6 @@ config FLATMEM
>   	def_bool y
>   	depends on !SPARSEMEM || FLATMEM_MANUAL
>   
> -config FLAT_NODE_MEM_MAP
> -	def_bool y
> -	depends on !SPARSEMEM
> -
>   #
>   # SPARSEMEM_EXTREME (which is the default) does some bootmem
>   # allocations when sparse_init() is called.  If this cannot
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 8f08135d3eb4..f039736541eb 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6444,7 +6444,7 @@ static void __meminit zone_init_free_lists(struct zone *zone)
>   	}
>   }
>   
> -#if !defined(CONFIG_FLAT_NODE_MEM_MAP)
> +#if !defined(CONFIG_FLATMEM)
>   /*
>    * Only struct pages that correspond to ranges defined by memblock.memory
>    * are zeroed and initialized by going through __init_single_page() during
> @@ -7241,7 +7241,7 @@ static void __init free_area_init_core(struct pglist_data *pgdat)
>   	}
>   }
>   
> -#ifdef CONFIG_FLAT_NODE_MEM_MAP
> +#ifdef CONFIG_FLATMEM
>   static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>   {
>   	unsigned long __maybe_unused start = 0;
> @@ -7289,7 +7289,7 @@ static void __ref alloc_node_mem_map(struct pglist_data *pgdat)
>   }
>   #else
>   static void __ref alloc_node_mem_map(struct pglist_data *pgdat) { }
> -#endif /* CONFIG_FLAT_NODE_MEM_MAP */
> +#endif /* CONFIG_FLATMEM */
>   
>   #ifdef CONFIG_DEFERRED_STRUCT_PAGE_INIT
>   static inline void pgdat_set_deferred_range(pg_data_t *pgdat)
> diff --git a/mm/page_ext.c b/mm/page_ext.c
> index df6f74aac8e1..293b2685fc48 100644
> --- a/mm/page_ext.c
> +++ b/mm/page_ext.c
> @@ -191,7 +191,7 @@ void __init page_ext_init_flatmem(void)
>   	panic("Out of memory");
>   }
>   
> -#else /* CONFIG_FLAT_NODE_MEM_MAP */
> +#else /* CONFIG_FLATMEM */
>   
>   struct page_ext *lookup_page_ext(const struct page *page)
>   {
> 

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
