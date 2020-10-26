Return-Path: <SRS0=maVz=EB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B007C4363A
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 12:11:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 01AAF20809
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Oct 2020 12:11:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="iRPvtWTn";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="XZ7ByWGs";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="beAfxtxV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 01AAF20809
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E/1ICWQd7viH0hZaAhvgaUh90iB835G6IQNDkRdEmgw=; b=iRPvtWTnFI2HUtnJGF6za9+XA
	ZwiqpgjTrnRYiDAx1HwyrvOBo43B/SPa3rYV5uciI4M36r/Ca5+I3pkCi/1aNRA8nnoEdlZJ7b9Tk
	smT+uSj31LydkU1de0Cv6qgeXQEaObhXwZljUz5AKmYJj3BQjEeSoLwwZZaYgP4Xt8qhuIB07UXtu
	K1n3+zBNpGfA64OmPTgMOev2VP6FM3ZpYprmCGyKC9LYRmuTvfBCl+6nFJfQCXZ2KqaCgddLc39Hl
	ADfe279la3Lz9tSwkDVtJ/7kVqPNdj3undbR7h3CI0xdoptagINhxt/rwBTOQjFdF6jUho6rCQvMU
	ORMmC4u1Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kX1Ld-0003TJ-NI; Mon, 26 Oct 2020 12:11:37 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX1La-0003Oj-Jd; Mon, 26 Oct 2020 12:11:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=Iw88EVZquuLtr+JCzV79EkfWH/Dmoa06SsLSgTwAh6M=; b=XZ7ByWGsp1YlOKK34zZIDPIEHT
 ngIUasaeFVGVIY7YDJKIoByvj8ECqqs2CI/OCi/EaacCZcgQ8HZ4ZICctJz+zU3ziziKnZCA1aRDv
 HpsefrE+nWm902fIsYuW51VrzVupsydzBn3GD4xZtS79hZe2kp3MnOBgj27PIl+w6dWrCzugoBFga
 VwBTVOe4DLSIe1LXZIaO/vO+jaCZyaGzSV7BADAzOjj1YPWEalxEwxv4YEv3AHQkcUpdp6VEMLxe7
 zKpoa6foEZuL5rlfjNDvV0FtiODq6HWyZZn103gjK9OFgIT48h/seFSQW1b64W47ApEEYebGQkDBU
 YV8Q4OAQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by casper.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kX15a-00013v-5D; Mon, 26 Oct 2020 11:55:05 +0000
Received: from kernel.org (unknown [87.70.96.83])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 5891822265;
 Mon, 26 Oct 2020 11:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603713297;
 bh=JL5L+tjAdTtgTIzF1IyLb8dhJjCHzTjL2OJ0c6FU4w4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=beAfxtxVzIWG7/PQSB9oT8HrWkddsR0PDdaGNijlEC3AuMvcZUXxJY9R8puB77jj0
 rPlZw+P1uGuAIqPmVzWmAkw1wLYd5tKrK+EpdZCOH48DMhCjDSmOkzAPgP4u1ZC3/i
 Sc+DoqTEeolhEbCvCJLclcbZXLgz0JV5qw710moE=
Date: Mon, 26 Oct 2020 13:54:43 +0200
From: Mike Rapoport <rppt@kernel.org>
To: David Hildenbrand <david@redhat.com>
Subject: Re: [PATCH 1/4] mm: introduce debug_pagealloc_map_pages() helper
Message-ID: <20201026115443.GF1154158@kernel.org>
References: <20201025101555.3057-1-rppt@kernel.org>
 <20201025101555.3057-2-rppt@kernel.org>
 <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <8720c067-7dc5-2b02-918b-e54dd642bfd6@redhat.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201026_115502_855513_778CFEA2 
X-CRM114-Status: GOOD (  36.09  )
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
 Thomas Gleixner <tglx@linutronix.de>, Joonsoo Kim <iamjoonsoo.kim@lge.com>,
 linux-arm-kernel@lists.infradead.org, "Rafael J. Wysocki" <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, Pekka Enberg <penberg@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Edgecombe, Rick P" <rick.p.edgecombe@intel.com>,
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon, Oct 26, 2020 at 12:05:13PM +0100, David Hildenbrand wrote:
> On 25.10.20 11:15, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > When CONFIG_DEBUG_PAGEALLOC is enabled, it unmaps pages from the
> > kernel direct mapping after free_pages(). The pages than need to be
> > mapped back before they could be used. Theese mapping operations use 
> > __kernel_map_pages() guarded with with debug_pagealloc_enabled().
> > 
> > The only place that calls __kernel_map_pages() without checking
> > whether DEBUG_PAGEALLOC is enabled is the hibernation code that
> > presumes availability of this function when ARCH_HAS_SET_DIRECT_MAP
> > is set. Still, on arm64, __kernel_map_pages() will bail out when
> > DEBUG_PAGEALLOC is not enabled but set_direct_map_invalid_noflush()
> > may render some pages not present in the direct map and hibernation
> > code won't be able to save such pages.
> > 
> > To make page allocation debugging and hibernation interaction more
> > robust, the dependency on DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP
> > has to be made more explicit.
> > 
> > Start with combining the guard condition and the call to 
> > __kernel_map_pages() into a single debug_pagealloc_map_pages()
> > function to emphasize that __kernel_map_pages() should not be called
> > without DEBUG_PAGEALLOC and use this new function to map/unmap pages
> > when page allocation debug is enabled.
> > 
> > As the only remaining user of kernel_map_pages() is the hibernation
> > code, mode that function into kernel/power/snapshot.c closer to a
> > caller.
> 
> s/mode/move/
> 
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com> --- 
> > include/linux/mm.h      | 16 +++++++--------- kernel/power/snapshot.c
> > | 11 +++++++++++ mm/memory_hotplug.c     |  3 +-- mm/page_alloc.c
> > |  6 ++---- mm/slab.c               |  8 +++----- 5 files changed, 24
> > insertions(+), 20 deletions(-)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h index
> > ef360fe70aaf..14e397f3752c 100644 --- a/include/linux/mm.h +++
> > b/include/linux/mm.h @@ -2927,21 +2927,19 @@ static inline bool
> > debug_pagealloc_enabled_static(void) #if
> > defined(CONFIG_DEBUG_PAGEALLOC) ||
> > defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) extern void
> > __kernel_map_pages(struct page *page, int numpages, int enable);
> > 
> > -/* - * When called in DEBUG_PAGEALLOC context, the call should most
> > likely be - * guarded by debug_pagealloc_enabled() or
> > debug_pagealloc_enabled_static() - */ -static inline void 
> > -kernel_map_pages(struct page *page, int numpages, int enable) 
> > +static inline void debug_pagealloc_map_pages(struct page *page, +
> > int numpages, int enable) { -	__kernel_map_pages(page, numpages,
> > enable); +	if (debug_pagealloc_enabled_static()) +
> > __kernel_map_pages(page, numpages, enable); } + #ifdef
> > CONFIG_HIBERNATION extern bool kernel_page_present(struct page
> > *page); #endif	/* CONFIG_HIBERNATION */ #else	/*
> > CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */ -static
> > inline void -kernel_map_pages(struct page *page, int numpages, int
> > enable) {} +static inline void debug_pagealloc_map_pages(struct page
> > *page, +					     int numpages, int enable) {} #ifdef
> > CONFIG_HIBERNATION static inline bool kernel_page_present(struct page
> > *page) { return true; } #endif	/* CONFIG_HIBERNATION */ diff --git
> > a/kernel/power/snapshot.c b/kernel/power/snapshot.c index
> > 46b1804c1ddf..fa499466f645 100644 --- a/kernel/power/snapshot.c +++
> > b/kernel/power/snapshot.c @@ -76,6 +76,17 @@ static inline void
> > hibernate_restore_protect_page(void *page_address) {} static inline
> > void hibernate_restore_unprotect_page(void *page_address) {} #endif
> > /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> > 
> > +#if defined(CONFIG_DEBUG_PAGEALLOC) ||
> > defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP) +static inline void 
> > +kernel_map_pages(struct page *page, int numpages, int enable) +{ +
> > __kernel_map_pages(page, numpages, enable); +} +#else +static inline
> > void +kernel_map_pages(struct page *page, int numpages, int enable)
> > {} +#endif +
> 
> That change should go into a separate patch.
 
Hmm, I beleive you refer to moving kernel_map_pages() to snapshot.c,
right?

> For the debug_pagealloc_map_pages() parts
> 
> Reviewed-by: David Hildenbrand <david@redhat.com>
 
Thanks!

> -- 
> Thanks,
> 
> David / dhildenb
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
