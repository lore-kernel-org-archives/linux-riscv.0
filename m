Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91F6DC4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 11:06:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 134322224A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 11:06:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Q1hct/U+";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RRd3R7qk"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 134322224A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:From:
	References:To:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=JfBIs16HmKRS+lBAhJh4V+ZrTwKjpSClSS5ZqijUfsI=; b=Q1hct/U+6pJuUBA3Ey8lqa/Xl
	Dh7NCqQcSdrbRqFSKm98ybw3GtnjATDML/sT3r0l/yMbjWYX45SxvBTrWEUGM2PxcdsBgXPOLQBxf
	8sl4sejIsV2W9WPP/Bzc5dWcms2dfcc4WCJnVVDSdSm6MY49KUgTm6rynwxCp5MdXwbZFhgL2F01q
	0tBuj9i+mOIZ4vMUCYjxpDyL/YLJpOmRRjP0NEKKNsMd1QRA7nHCasrKqaRKVNk/vbTNZ92E8N1B6
	YIG20PLqb0JMSHL1Dp9JVyLSSILUgI11EVZZLgYDXz2BldPadAKz9osaePR2ZDIBge/YsUxUaQ0T/
	3ztmrWufw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX0Jx-0005iI-Hy; Mon, 26 Oct 2020 11:05:49 +0000
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX0Jm-0005cU-UG
 for linux-riscv@lists.infradead.org; Mon, 26 Oct 2020 11:05:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1603710338;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=uR3SoUQ38JQhR3FzkH7b6r+ChPHdaTScYhjRwjs5L+4=;
 b=RRd3R7qkPlRxT4hgR7TPTDgZKr4Q92aypTANGJ+v8gRKqcI76UqTFT7qNmWbn5Z14xe0HB
 1PE3A4pKlAYviD6NEAtDem3q6vU1aZ+0Am5RVqDPipMPkKX/st+PSGuXYZcglIFppnXt43
 HKi5JdPNRCdSo3PNlvnxy9epa1w1kaY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-301-pGgOFeOzOUSKAoeWEvAb1w-1; Mon, 26 Oct 2020 07:05:30 -0400
X-MC-Unique: pGgOFeOzOUSKAoeWEvAb1w-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 87FB0101F7B0;
 Mon, 26 Oct 2020 11:05:25 +0000 (UTC)
Received: from [10.36.113.62] (ovpn-113-62.ams2.redhat.com [10.36.113.62])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 00EE61043269;
 Mon, 26 Oct 2020 11:05:14 +0000 (UTC)
Subject: Re: [PATCH 1/4] mm: introduce debug_pagealloc_map_pages() helper
To: Mike Rapoport <rppt@kernel.org>, Andrew Morton <akpm@linux-foundation.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-2-rppt@kernel.org>
From: David Hildenbrand <david@redhat.com>
Organization: Red Hat GmbH
Message-ID: <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
Date: Mon, 26 Oct 2020 12:05:13 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.3.1
MIME-Version: 1.0
In-Reply-To: <20201025101555.3057-2-rppt@kernel.org>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_070539_084280_71A1A818 
X-CRM114-Status: GOOD (  33.74  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Peter Zijlstra <peterz@infradead.org>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 Paul Mackerras <paulus@samba.org>, Pavel Machek <pavel@ucw.cz>,
 "H. Peter Anvin" <hpa@zytor.com>, sparclinux@vger.kernel.org,
 Christoph Lameter <cl@linux.com>, Will Deacon <will@kernel.org>,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Michael Ellerman <mpe@ellerman.id.au>, x86@kernel.org,
 Mike Rapoport <rppt@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, Ingo Molnar <mingo@redhat.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Len Brown <len.brown@intel.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Vasily Gorbik <gor@linux.ibm.com>,
 linux-pm@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
 David Rientjes <rientjes@google.com>, Borislav Petkov <bp@alien8.de>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Thomas Gleixner <tglx@linutronix.de>, linux-arm-kernel@lists.infradead.org,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, linux-kernel@vger.kernel.org,
 Pekka Enberg <penberg@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Joonsoo Kim <iamjoonsoo.kim@lge.com>, "Edgecombe,
 Rick P" <rick.p.edgecombe@intel.com>, linuxppc-dev@lists.ozlabs.org,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On 25.10.20 11:15, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the
> kernel direct mapping after free_pages(). The pages than need to be
> mapped back before they could be used. Theese mapping operations use 
> __kernel_map_pages() guarded with with debug_pagealloc_enabled().
> 
> The only place that calls __kernel_map_pages() without checking
> whether DEBUG_PAGEALLOC is enabled is the hibernation code that
> presumes availability of this function when ARCH_HAS_SET_DIRECT_MAP
> is set. Still, on arm64, __kernel_map_pages() will bail out when
> DEBUG_PAGEALLOC is not enabled but set_direct_map_invalid_noflush()
> may render some pages not present in the direct map and hibernation
> code won't be able to save such pages.
> 
> To make page allocation debugging and hibernation interaction more
> robust, the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP
> has to be made more explicit.
> 
> Start with combining the guard condition and the call to 
> __kernel_map_pages() into a single debug_pagealloc_map_pages()
> function to emphasize that __kernel_map_pages() should not be called
> without DEBUG_PAGEALLOC and use this new function to map/unmap pages
> when page allocation debug is enabled.
> 
> As the only remaining user of kernel_map_pages() is the hibernation
> code, mode that function into kernel/power/snapshot.c closer to a
> caller.

s/mode/move/

> 
> Signed-off-by: Mike Rapoport <rppt@linux.ibm.com> --- 
> include/linux/mm.h      | 16 +++++++--------- kernel/power/snapshot.c
> | 11 +++++++++++ mm/memory_hotplug.c     |  3 +-- mm/page_alloc.c
> |  6 ++---- mm/slab.c               |  8 +++----- 5 files changed, 24
> insertions(+), 20 deletions(-)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h index
> ef360fe70aaf..14e397f3752c 100644 --- a/include/linux/mm.h +++
> b/include/linux/mm.h @@ -2927,21 +2927,19 @@ static inline bool
> debug_pagealloc_enabled_static(void) #if
> defined(CONFIG_DEBUG_PAGEALLOC) ||
> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) extern void
> __kernel_map_pages(struct page *page, int numpages, int enable);
> 
> -/* - * When called in DEBUG_PAGEALLOC context, the call should most
> likely be - * guarded by debug_pagealloc_enabled() or
> debug_pagealloc_enabled_static() - */ -static inline void 
> -kernel_map_pages(struct page *page, int numpages, int enable) 
> +static inline void debug_pagealloc_map_pages(struct page *page, +
> int numpages, int enable) { -	__kernel_map_pages(page, numpages,
> enable); +	if (debug_pagealloc_enabled_static()) +
> __kernel_map_pages(page, numpages, enable); } + #ifdef
> CONFIG_HIBERNATION extern bool kernel_page_present(struct page
> *page); #endif	/* CONFIG_HIBERNATION */ #else	/*
> CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */ -static
> inline void -kernel_map_pages(struct page *page, int numpages, int
> enable) {} +static inline void debug_pagealloc_map_pages(struct page
> *page, +					     int numpages, int enable) {} #ifdef
> CONFIG_HIBERNATION static inline bool kernel_page_present(struct page
> *page) { return true; } #endif	/* CONFIG_HIBERNATION */ diff --git
> a/kernel/power/snapshot.c b/kernel/power/snapshot.c index
> 46b1804c1ddf..fa499466f645 100644 --- a/kernel/power/snapshot.c +++
> b/kernel/power/snapshot.c @@ -76,6 +76,17 @@ static inline void
> hibernate_restore_protect_page(void *page_address) {} static inline
> void hibernate_restore_unprotect_page(void *page_address) {} #endif
> /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> 
> +#if defined(CONFIG_DEBUG_PAGEALLOC) ||
> defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) +static inline void 
> +kernel_map_pages(struct page *page, int numpages, int enable) +{ +
> __kernel_map_pages(page, numpages, enable); +} +#else +static inline
> void +kernel_map_pages(struct page *page, int numpages, int enable)
> {} +#endif +

That change should go into a separate patch.


For the debug_pagealloc_map_pages() parts

Reviewed-by: David Hildenbrand <david@redhat.com>


-- 
Thanks,

David / dhildenb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
