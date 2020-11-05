Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BE4BC00A89
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 11:42:39 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ECF4E2071A
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 11:42:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="woC5vS1f";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="HHJruZEG"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ECF4E2071A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=GikfdZiTzfOebwi4B6io/y3WkUKJCqKUmymOc1S0nMs=; b=woC5vS1frljSW0EZmgH0HQAyB
	qza7Z+jDEDQ7BcePTLeld9yIqIBbJ9U7bhJKaWsbhVqTfj+NePE9U58Pyb8btnv1pW3hb/YraH/Aw
	XjIki+3AblDWknfWVjO45W6LZY6I24O8WdLui+jTVzDMvuweaFCseqAweo3l1rp3NXOmIGFt5skyM
	IrzwnVnYwifMVyMlZpWQdtErDT+47h1dKGHZUyuy6/bVqqMK1ZPuTxwNFfz54FX1znV8Pts3KBYDK
	kxW2qAwrmC6zVwvCvnW+UAcZAfSN44PodJXz4a4GyklJj1hMIQusslCmGafhpX0siUPmuIkRVlloy
	7KMb8Pq+w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kadew-0003eO-34; Thu, 05 Nov 2020 11:42:30 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kadeq-0003bZ-9g; Thu, 05 Nov 2020 11:42:25 +0000
Received: from kernel.org (unknown [2.55.183.164])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 2AF252071A;
 Thu,  5 Nov 2020 11:42:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1604576542;
 bh=wBBJASevkpsRXZMXJL2OiMK6CtZhq8iWhEgufgr/S4E=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=HHJruZEGepbkqow1qhwuCKDkVoe/lpKxogvFghtL/5RowA6qyrxSq531Gliqcbzyu
 tDTgfPvrJ9vN7jvSKObEIq9kiRh1xeaKbxhp+zX6zw46ZOu6eW7fSqiBEMlywA8zjt
 Ph/W2QEvA7Z47iM8NgnnYxvGybdML21CtLacZNig=
Date: Thu, 5 Nov 2020 13:42:00 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Vlastimil Babka <vbabka@suse.cz>
Subject: Re: [PATCH v4 3/4] arch, mm: restore dependency of
 __kernel_map_pages() of DEBUG_PAGEALLOC
Message-ID: <20201105114200.GZ4879@kernel.org>
References: <20201103162057.22916-1-rppt@kernel.org>
 <20201103162057.22916-4-rppt@kernel.org>
 <f9c1dc66-fc60-db4d-9670-0271adb2ed07@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f9c1dc66-fc60-db4d-9670-0271adb2ed07@suse.cz>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_064224_600799_FB07D103 
X-CRM114-Status: GOOD (  30.79  )
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
Cc: David Hildenbrand <david@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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

On Wed, Nov 04, 2020 at 07:02:20PM +0100, Vlastimil Babka wrote:
> On 11/3/20 5:20 PM, Mike Rapoport wrote:
> > From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Subject should have "on DEBUG_PAGEALLOC" ?
> 
> > The design of DEBUG_PAGEALLOC presumes that __kernel_map_pages() must never
> > fail. With this assumption is wouldn't be safe to allow general usage of
> > this function.
> > 
> > Moreover, some architectures that implement __kernel_map_pages() have this
> > function guarded by #ifdef DEBUG_PAGEALLOC and some refuse to map/unmap
> > pages when page allocation debugging is disabled at runtime.
> > 
> > As all the users of __kernel_map_pages() were converted to use
> > debug_pagealloc_map_pages() it is safe to make it available only when
> > DEBUG_PAGEALLOC is set.
> > 
> > Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
> > Acked-by: David Hildenbrand <david@redhat.com>
> > Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
> > ---
> >   arch/Kconfig                     |  3 +++
> >   arch/arm64/Kconfig               |  4 +---
> >   arch/arm64/mm/pageattr.c         |  8 ++++++--
> >   arch/powerpc/Kconfig             |  5 +----
> >   arch/riscv/Kconfig               |  4 +---
> >   arch/riscv/include/asm/pgtable.h |  2 --
> >   arch/riscv/mm/pageattr.c         |  2 ++
> >   arch/s390/Kconfig                |  4 +---
> >   arch/sparc/Kconfig               |  4 +---
> >   arch/x86/Kconfig                 |  4 +---
> >   arch/x86/mm/pat/set_memory.c     |  2 ++
> >   include/linux/mm.h               | 10 +++++++---
> >   12 files changed, 26 insertions(+), 26 deletions(-)
> > 
> > diff --git a/arch/Kconfig b/arch/Kconfig
> > index 56b6ccc0e32d..56d4752b6db6 100644
> > --- a/arch/Kconfig
> > +++ b/arch/Kconfig
> > @@ -1028,6 +1028,9 @@ config HAVE_STATIC_CALL_INLINE
> >   	bool
> >   	depends on HAVE_STATIC_CALL
> > +config ARCH_SUPPORTS_DEBUG_PAGEALLOC
> > +	bool
> > +
> >   source "kernel/gcov/Kconfig"
> >   source "scripts/gcc-plugins/Kconfig"
> > diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> > index 1d466addb078..a932810cfd90 100644
> > --- a/arch/arm64/Kconfig
> > +++ b/arch/arm64/Kconfig
> > @@ -71,6 +71,7 @@ config ARM64
> >   	select ARCH_USE_QUEUED_RWLOCKS
> >   	select ARCH_USE_QUEUED_SPINLOCKS
> >   	select ARCH_USE_SYM_ANNOTATIONS
> > +	select ARCH_SUPPORTS_DEBUG_PAGEALLOC
> >   	select ARCH_SUPPORTS_MEMORY_FAILURE
> >   	select ARCH_SUPPORTS_SHADOW_CALL_STACK if CC_HAVE_SHADOW_CALL_STACK
> >   	select ARCH_SUPPORTS_ATOMIC_RMW
> > @@ -1025,9 +1026,6 @@ config HOLES_IN_ZONE
> >   source "kernel/Kconfig.hz"
> > -config ARCH_SUPPORTS_DEBUG_PAGEALLOC
> > -	def_bool y
> > -
> >   config ARCH_SPARSEMEM_ENABLE
> >   	def_bool y
> >   	select SPARSEMEM_VMEMMAP_ENABLE
> > diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> > index 1b94f5b82654..439325532be1 100644
> > --- a/arch/arm64/mm/pageattr.c
> > +++ b/arch/arm64/mm/pageattr.c
> > @@ -155,7 +155,7 @@ int set_direct_map_invalid_noflush(struct page *page)
> >   		.clear_mask = __pgprot(PTE_VALID),
> >   	};
> > -	if (!rodata_full)
> > +	if (!debug_pagealloc_enabled() && !rodata_full)
> >   		return 0;
> >   	return apply_to_page_range(&init_mm,
> > @@ -170,7 +170,7 @@ int set_direct_map_default_noflush(struct page *page)
> >   		.clear_mask = __pgprot(PTE_RDONLY),
> >   	};
> > -	if (!rodata_full)
> > +	if (!debug_pagealloc_enabled() && !rodata_full)
> >   		return 0;
> >   	return apply_to_page_range(&init_mm,
> 
> I don't understand these two hunks. Previous patch calls this for
> hibernation when CONFIG_ARCH_HAS_SET_DIRECT_MAP, which is true for arm64.
> Why suddenly this starts to depend on debug_pagealloc_enabled()?

I was confused about this for quite a long :)

On arm64 the changes to direct^w linear map are allowed when 

	debug_page_alloc() || rodata_full

In hibernation we essentially have now

	if (1)
		set_direct_map(something)
	else
		debug_page_alloc_map()

With debug_pagealloc enabled but with rodata_full disabled arm64
versions of set_direct_map_*() will become a nop, so a page that was
unmapped by debug_pagealloc() will not be mapped back.

I'm still puzzled how hibernation might ever need to save a free page,
but that's another story.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
