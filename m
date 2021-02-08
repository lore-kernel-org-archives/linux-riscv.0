Return-Path: <SRS0=+l7Y=HK=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67204C433DB
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 10:49:41 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D04BF64E5D
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Feb 2021 10:49:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D04BF64E5D
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:Message-ID:
	Subject:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=zm0W0rFyiQD4Ukf2vQ0idRMV1HzmwWuEopv4qNjuFD0=; b=0AgTCeVC1kHMgxDHGTib5muVB
	SKR1SFk8fa907KQT0NEZDukLWOOZzt1l/igVrBTzZQ17/noYvQsUpddvDCEklKgucPtuJ3sxQKuuF
	PP7VpsMXBm3exl9ShcZjxeBvak9lcNNG9+A7MO776vxjx6RNqA2eExJp6muaX/CVNTzzsFuX4IP8J
	XrRRrE3FD8JnNMbH0pQ8k7kgDRQTCVrU1q0SHm6VCK/jnDM5aqGY2Dt0tTaCFqows7f+tnoBbhaDq
	7wrJToN6Cvd1ukcLWjt8JhRpnTYh1G8BljTRy4T3lbX8ImsVnV/i8HCzGc5eoAGzhZd79E3YYi+Jg
	Mpc3p5YEg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l946l-000110-OO; Mon, 08 Feb 2021 10:49:31 +0000
Received: from mx2.suse.de ([195.135.220.15])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l946f-0000yP-FX; Mon, 08 Feb 2021 10:49:27 +0000
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1612781364; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AoNPQu/CYREU8WklaThDeR8slY2WA4SdP9WlHLHnBzw=;
 b=jma/SuHJFiVwWmdQgxuuc5UeAWopcfBTEw8DCQRtoftzdON6/M5kdrXEyR3vdFiEHz5+3z
 +k49ofL8c4eTE7h3/Kadmh5PQ6WOsbRHozNCmH84n+jx2ZjkfHcB/bfE9B5UepeC/waV30
 P1KXrH4oDz6ocDZLYC+6hSCotDNBb+I=
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id C2769AD62;
 Mon,  8 Feb 2021 10:49:23 +0000 (UTC)
Date: Mon, 8 Feb 2021 11:49:22 +0100
From: Michal Hocko <mhocko@suse.com>
To: Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v17 07/10] mm: introduce memfd_secret system call to
 create "secret" memory areas
Message-ID: <YCEXMgXItY7xMbIS@dhcp22.suse.cz>
References: <20210208084920.2884-1-rppt@kernel.org>
 <20210208084920.2884-8-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210208084920.2884-8-rppt@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210208_054925_787887_53CEF6AC 
X-CRM114-Status: GOOD (  39.36  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Mon 08-02-21 10:49:17, Mike Rapoport wrote:
> From: Mike Rapoport <rppt@linux.ibm.com>
> 
> Introduce "memfd_secret" system call with the ability to create memory
> areas visible only in the context of the owning process and not mapped not
> only to other processes but in the kernel page tables as well.
> 
> The secretmem feature is off by default and the user must explicitly enable
> it at the boot time.
> 
> Once secretmem is enabled, the user will be able to create a file
> descriptor using the memfd_secret() system call. The memory areas created
> by mmap() calls from this file descriptor will be unmapped from the kernel
> direct map and they will be only mapped in the page table of the owning mm.

Is this really true? I guess you meant to say that the memory will
visible only via page tables to anybody who can mmap the respective file
descriptor. There is nothing like an owning mm as the fd is inherently a
shareable resource and the ownership becomes a very vague and hard to
define term.

> The file descriptor based memory has several advantages over the
> "traditional" mm interfaces, such as mlock(), mprotect(), madvise(). It
> paves the way for VMMs to remove the secret memory range from the process;

I do not understand how it helps to remove the memory from the process
as the interface explicitly allows to add a memory that is removed from
all other processes via direct map.

> there may be situations where sharing is useful and file descriptor based
> approach allows to seal the operations.

It would be great to expand on this some more.

> As secret memory implementation is not an extension of tmpfs or hugetlbfs,
> usage of a dedicated system call rather than hooking new functionality into
> memfd_create(2) emphasises that memfd_secret(2) has different semantics and
> allows better upwards compatibility.

What is this supposed to mean? What are differences?

> The secret memory remains accessible in the process context using uaccess
> primitives, but it is not exposed to the kernel otherwise; secret memory
> areas are removed from the direct map and functions in the
> follow_page()/get_user_page() family will refuse to return a page that
> belongs to the secret memory area.
> 
> Once there will be a use case that will require exposing secretmem to the
> kernel it will be an opt-in request in the system call flags so that user
> would have to decide what data can be exposed to the kernel.
>
> Removing of the pages from the direct map may cause its fragmentation on
> architectures that use large pages to map the physical memory which affects
> the system performance. However, the original Kconfig text for
> CONFIG_DIRECT_GBPAGES said that gigabyte pages in the direct map "... can
> improve the kernel's performance a tiny bit ..." (commit 00d1c5e05736
> ("x86: add gbpages switches")) and the recent report [1] showed that "...
> although 1G mappings are a good default choice, there is no compelling
> evidence that it must be the only choice". Hence, it is sufficient to have
> secretmem disabled by default with the ability of a system administrator to
> enable it at boot time.

OK, this looks like a reasonable compromise for the initial
implementation. Documentation of the command line parameter should be
very explicit about this though.

> The secretmem mappings are locked in memory so they cannot exceed
> RLIMIT_MEMLOCK. Since these mappings are already locked an attempt to
> mlock() secretmem range would fail and mlockall() will ignore secretmem
> mappings.

What about munlock?

> Pages in the secretmem regions are unevictable and unmovable to avoid
> accidental exposure of the sensitive data via swap or during page
> migration.
> 
> A page that was a part of the secret memory area is cleared when it is
> freed to ensure the data is not exposed to the next user of that page.
> 
> The following example demonstrates creation of a secret mapping (error
> handling is omitted):
> 
> 	fd = memfd_secret(0);
> 	ftruncate(fd, MAP_SIZE);
> 	ptr = mmap(NULL, MAP_SIZE, PROT_READ | PROT_WRITE,
> 		   MAP_SHARED, fd, 0);

Please also list usecases which you are aware of as well.

I am also missing some more information about the implementation. E.g.
does this memory live on an unevictable LRU and therefore participates
into stats. What about memcg accounting. What is the cross fork (CoW)/exec
behavior. How is the memory reflected in OOM situation? Is a shared
mapping enforced?

Anyway, thanks for improving the changelog. This is definitely much more
informative.

> [1] https://lore.kernel.org/linux-mm/213b4567-46ce-f116-9cdf-bbd0c884eb3c@linux.intel.com/

I have only glanced through the implementation and it looks sane. I will
have a closer look later but this should be pretty simple with the
proposed semantic.
-- 
Michal Hocko
SUSE Labs

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
