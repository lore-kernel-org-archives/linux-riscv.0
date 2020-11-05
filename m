Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ECC2C00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 11:34:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA5022078E
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 11:34:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0VKJdKmA";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="O5NamY7Z"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BA5022078E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E13wskFOiWixLxlLRVHCslwZJn42BPj97jDnmUYw4r4=; b=0VKJdKmANDmouAYHHsxtTUMC7
	rEyoJ+gTHQ90MlWwT1F6W2MCvXfSqadsi7YMq6m1nCmdSQJWClwahAkpAVR2y3soqkM91gGG30S+d
	K59/nUGKeEronF5voKe/Fr5Ngk870fbDBR8ths6MgHSh9jrvyqfIycYWScVXK4Z0OSS/GMW4PHwBw
	mA2cb4yFcD0vx82Umm3F5CMqBQRw/eD9jo9F0iJDDgYUiQ48w21jGSiGdhuJVo9cYMYbBg71OCRh4
	nnVTBjfzxNZI8katZ4DBSA65t25gwMftlDATLdZLb01GfgvB4tO9oaae3d1hkPyPPgnVoHumQeKs7
	cZss7zNcw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kadWl-0001ns-Pk; Thu, 05 Nov 2020 11:34:03 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadWd-0001jx-Hm; Thu, 05 Nov 2020 11:33:57 +0000
Received: from kernel.org (unknown [2.55.183.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B88CD2078E;
 Thu,  5 Nov 2020 11:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604576034;
 bh=XF8AFYO6bCr4yR/xfLGLwsLQBboi2XjYzZ3lYdi07mQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=O5NamY7Z8bpeRF5e27pgfGmymIeBQK9j8XG2gMXDjk8aw+eMLitnhVpAzHAcLwHhk
 Sau6clNChqmtpHyfG8qukI1nlUaCTcmwOyX21+Rglf3ECyVc+/suIMbLHw9rP9no/V
 w2/7NKEKvUcFmM9Q4PjHmX+gHCO2wRPhSdhuvRyw=
Date: Thu, 5 Nov 2020 13:33:33 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 2/4] PM: hibernate: make direct map manipulations more
 explicit
Message-ID: <20201105113333.GY4879@kernel.org>
References: <20201103162057.22916-1-rppt@kernel.org>
 <20201103162057.22916-3-rppt@kernel.org>
 <9a0780b4-35f8-0ded-c473-d8ab4a26ade5@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <9a0780b4-35f8-0ded-c473-d8ab4a26ade5@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_063355_830932_B86E13BC 
X-CRM114-Status: GOOD (  37.43  )
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
Cc: "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
 linuxppc-dev@lists.ozlabs.org, "David S. Miller" <davem@davemloft.net>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, Nov 04, 2020 at 06:40:28PM +0100, Vlastimil Babka wrote:
> On 11/3/20 5:20 PM, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> > 
> > When DEBUG_PAGEALLOC or ARCH_HAS_SET_DIRECT_MAP is enabled a page may be
> > not present in the direct map and has to be explicitly mapped before it
> > could be copied.
> > 
> > Introduce hibernate_map_page() that will explicitly use
> > set_direct_map_{default,invalid}_noflush() for ARCH_HAS_SET_DIRECT_MAP case
> > and debug_pagealloc_map_pages() for DEBUG_PAGEALLOC case.
> > 
> > The remapping of the pages in safe_copy_page() presumes that it only
> > changes protection bits in an existing PTE and so it is safe to ignore
> > return value of set_direct_map_{default,invalid}_noflush().
> > 
> > Still, add a pr_warn() so that future changes in set_memory APIs will not
> > silently break hibernation.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> > Reviewed-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> 
> Acked-by: Vlastimil Babka <vbabka@suse.cz>
> 
> The bool param is a bit more acceptable here, being a private API. But if
> debug_pagealloc_map_pages() becomes split, then it might be easier to split
> this one too...

Let's split here as well.

> > ---
> >   include/linux/mm.h      | 12 ------------
> >   kernel/power/snapshot.c | 32 ++++++++++++++++++++++++++++++--
> >   2 files changed, 30 insertions(+), 14 deletions(-)
> > 
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index 1fc0609056dc..14e397f3752c 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -2927,16 +2927,6 @@ static inline bool debug_pagealloc_enabled_static(void)
> >   #if defined(CONFIG_DEBUG_PAGEALLOC) || defined(CONFIG_ARCH_HAS_SET_DIRECT_MAP)
> >   extern void __kernel_map_pages(struct page *page, int numpages, int enable);
> > -/*
> > - * When called in DEBUG_PAGEALLOC context, the call should most likely be
> > - * guarded by debug_pagealloc_enabled() or debug_pagealloc_enabled_static()
> > - */
> > -static inline void
> > -kernel_map_pages(struct page *page, int numpages, int enable)
> > -{
> > -	__kernel_map_pages(page, numpages, enable);
> > -}
> > -
> >   static inline void debug_pagealloc_map_pages(struct page *page,
> >   					     int numpages, int enable)
> >   {
> > @@ -2948,8 +2938,6 @@ static inline void debug_pagealloc_map_pages(struct page *page,
> >   extern bool kernel_page_present(struct page *page);
> >   #endif	/* CONFIG_HIBERNATION */
> >   #else	/* CONFIG_DEBUG_PAGEALLOC || CONFIG_ARCH_HAS_SET_DIRECT_MAP */
> > -static inline void
> > -kernel_map_pages(struct page *page, int numpages, int enable) {}
> >   static inline void debug_pagealloc_map_pages(struct page *page,
> >   					     int numpages, int enable) {}
> >   #ifdef CONFIG_HIBERNATION
> > diff --git a/kernel/power/snapshot.c b/kernel/power/snapshot.c
> > index 46b1804c1ddf..57d54b9d84bb 100644
> > --- a/kernel/power/snapshot.c
> > +++ b/kernel/power/snapshot.c
> > @@ -76,6 +76,34 @@ static inline void hibernate_restore_protect_page(void *page_address) {}
> >   static inline void hibernate_restore_unprotect_page(void *page_address) {}
> >   #endif /* CONFIG_STRICT_KERNEL_RWX  && CONFIG_ARCH_HAS_SET_MEMORY */
> > +static inline void hibernate_map_page(struct page *page, int enable)
> > +{
> > +	if (IS_ENABLED(CONFIG_ARCH_HAS_SET_DIRECT_MAP)) {
> > +		unsigned long addr = (unsigned long)page_address(page);
> > +		int ret;
> > +
> > +		/*
> > +		 * This should not fail because remapping a page here means
> > +		 * that we only update protection bits in an existing PTE.
> > +		 * It is still worth to have a warning here if something
> > +		 * changes and this will no longer be the case.
> > +		 */
> > +		if (enable)
> > +			ret = set_direct_map_default_noflush(page);
> > +		else
> > +			ret = set_direct_map_invalid_noflush(page);
> > +
> > +		if (ret) {
> > +			pr_warn_once("Failed to remap page\n");
> > +			return;
> > +		}
> > +
> > +		flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
> > +	} else {
> > +		debug_pagealloc_map_pages(page, 1, enable);
> > +	}
> > +}
> > +
> >   static int swsusp_page_is_free(struct page *);
> >   static void swsusp_set_page_forbidden(struct page *);
> >   static void swsusp_unset_page_forbidden(struct page *);
> > @@ -1355,9 +1383,9 @@ static void safe_copy_page(void *dst, struct page *s_page)
> >   	if (kernel_page_present(s_page)) {
> >   		do_copy_page(dst, page_address(s_page));
> >   	} else {
> > -		kernel_map_pages(s_page, 1, 1);
> > +		hibernate_map_page(s_page, 1);
> >   		do_copy_page(dst, page_address(s_page));
> > -		kernel_map_pages(s_page, 1, 0);
> > +		hibernate_map_page(s_page, 0);
> >   	}
> >   }
> > 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
