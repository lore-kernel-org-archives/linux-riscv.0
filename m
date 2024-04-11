Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82F09C001CC
	for <linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2024 18:00:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SNZ8K0RuD+QSEE7QG3GV3tpYoARThB1mudVGqxlKGQg=; b=LzjwgxkSaBLQiE
	UOJTLlZ3YjGMbCyDyrA7x/cacwNgN1RA9rAhGfVX8Ox6UvfQ3sikH/I4t4aTKBdAFAbk4Io33crYf
	9lH42nScnOJmjSVFb4dixJPqSKm4A22fqez37Fto1NZY+Ru8NzZnxLgUnyej2Trg5fN+pA+08dDZG
	RgiQkNuAP+cmpO1L55fvRBwSokMsFazfLzdMGNF1Tr1cTYDOlCMvCVvZRotPXvT8SDPh6d8YLx+Er
	df8Um9QiaQGHhbiR3iQ27xPQdEDTyH/6xEtTwe7CAS/mMwpkRqoJWlN+jCzwnEMgv3wZDZ/9wlkYb
	hskNLBTbiDPMrjPut60g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyj2-0000000DXZq-3on6;
	Thu, 11 Apr 2024 18:00:40 +0000
Received: from out-177.mta1.migadu.com ([2001:41d0:203:375::b1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ruyiv-0000000DXUA-30RW
	for linux-riscv@lists.infradead.org;
	Thu, 11 Apr 2024 18:00:36 +0000
Date: Thu, 11 Apr 2024 14:00:23 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1712858430;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hugd8ugKeGXlWiLmTwUcSwxtoNqEbzFWRyiumV4I0QI=;
	b=F6A8Ql6YjuHeVhFhvCjRCHtt6+j5Zmavb6rBRVS2UPMjaUzBr8Uy9YMXKrMLS6Bdu93QAe
	+1JDwGCXhSmYXVX/GYkUtjra2ilUH2ndkI9p7bCt0GDxnXoAiXvPRveKB1Tl7czCP5mSyl
	LwnxqSrFPBMBfyHHV7aQPCs6G/4zVIs=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-kernel@vger.kernel.org, Alexandre Ghiti <alexghiti@rivosinc.com>, 
	Andrew Morton <akpm@linux-foundation.org>, =?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"David S. Miller" <davem@davemloft.net>, Dinh Nguyen <dinguyen@kernel.org>, 
	Donald Dutile <ddutile@redhat.com>, Eric Chanudet <echanude@redhat.com>, 
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>, 
	Huacai Chen <chenhuacai@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Michael Ellerman <mpe@ellerman.id.au>, 
	Nadav Amit <nadav.amit@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Puranjay Mohan <puranjay12@gmail.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>, Thomas Gleixner <tglx@linutronix.de>, 
	Will Deacon <will@kernel.org>, bpf@vger.kernel.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev, netdev@vger.kernel.org, 
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v4 00/15] mm: jit/text allocator
Message-ID: <v52bizaflxzrxqk2wtuek2m2juwbzr6jxnpzlvtswkarcaejow@kd7tygzbmijs>
References: <20240411160051.2093261-1-rppt@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240411160051.2093261-1-rppt@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_110034_166732_0013B8B2 
X-CRM114-Status: GOOD (  31.14  )
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

On Thu, Apr 11, 2024 at 07:00:36PM +0300, Mike Rapoport wrote:
> From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> 
> Hi,
> 
> Since v3 I looked into making execmem more of an utility toolbox, as we
> discussed at LPC with Mark Rutland, but it was getting more hairier than
> having a struct describing architecture constraints and a type identifying
> the consumer of execmem.
> 
> And I do think that having the description of architecture constraints for
> allocations of executable memory in a single place is better that having it
> spread all over the place.
> 
> The patches available via git:
> https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v4
> 
> v4 changes:
> * rebase on v6.9-rc2
> * rename execmem_params to execmem_info and execmem_arch_params() to
>   execmem_arch_setup()
> * use single execmem_alloc() API instead of execmem_{text,data}_alloc() (Song)
> * avoid extra copy of execmem parameters (Rick)
> * run execmem_init() as core_initcall() except for the architectures that
>   may allocated text really early (currently only x86) (Will)
> * add acks for some of arm64 and riscv changes, thanks Will and Alexandre
> * new commits:
>   - drop call to kasan_alloc_module_shadow() on arm64 because it's not
>     needed anymore
>   - rename MODULE_START to MODULES_VADDR on MIPS
>   - use CONFIG_EXECMEM instead of CONFIG_MODULES on powerpc as per Christophe:
>     https://lore.kernel.org/all/79062fa3-3402-47b3-8920-9231ad05e964@csgroup.eu/
> 
> v3: https://lore.kernel.org/all/20230918072955.2507221-1-rppt@kernel.org
> * add type parameter to execmem allocation APIs
> * remove BPF dependency on modules
> 
> v2: https://lore.kernel.org/all/20230616085038.4121892-1-rppt@kernel.org
> * Separate "module" and "others" allocations with execmem_text_alloc()
> and jit_text_alloc()
> * Drop ROX entailment on x86
> * Add ack for nios2 changes, thanks Dinh Nguyen
> 
> v1: https://lore.kernel.org/all/20230601101257.530867-1-rppt@kernel.org
> 
> = Cover letter from v1 (sligtly updated) =
> 
> module_alloc() is used everywhere as a mean to allocate memory for code.
> 
> Beside being semantically wrong, this unnecessarily ties all subsystmes
> that need to allocate code, such as ftrace, kprobes and BPF to modules and
> puts the burden of code allocation to the modules code.
> 
> Several architectures override module_alloc() because of various
> constraints where the executable memory can be located and this causes
> additional obstacles for improvements of code allocation.
> 
> A centralized infrastructure for code allocation allows allocations of
> executable memory as ROX, and future optimizations such as caching large
> pages for better iTLB performance and providing sub-page allocations for
> users that only need small jit code snippets.
> 
> Rick Edgecombe proposed perm_alloc extension to vmalloc [1] and Song Liu
> proposed execmem_alloc [2], but both these approaches were targeting BPF
> allocations and lacked the ground work to abstract executable allocations
> and split them from the modules core.
> 
> Thomas Gleixner suggested to express module allocation restrictions and
> requirements as struct mod_alloc_type_params [3] that would define ranges,
> protections and other parameters for different types of allocations used by
> modules and following that suggestion Song separated allocations of
> different types in modules (commit ac3b43283923 ("module: replace
> module_layout with module_memory")) and posted "Type aware module
> allocator" set [4].
> 
> I liked the idea of parametrising code allocation requirements as a
> structure, but I believe the original proposal and Song's module allocator
> was too module centric, so I came up with these patches.
> 
> This set splits code allocation from modules by introducing execmem_alloc()
> and and execmem_free(), APIs, replaces call sites of module_alloc() and
> module_memfree() with the new APIs and implements core text and related
> allocations in a central place.
> 
> Instead of architecture specific overrides for module_alloc(), the
> architectures that require non-default behaviour for text allocation must
> fill execmem_info structure and implement execmem_arch_setup() that returns
> a pointer to that structure. If an architecture does not implement
> execmem_arch_setup(), the defaults compatible with the current
> modules::module_alloc() are used.
> 
> Since architectures define different restrictions on placement,
> permissions, alignment and other parameters for memory that can be used by
> different subsystems that allocate executable memory, execmem APIs
> take a type argument, that will be used to identify the calling subsystem
> and to allow architectures to define parameters for ranges suitable for that
> subsystem.
> 
> The new infrastructure allows decoupling of BPF, kprobes and ftrace from
> modules, and most importantly it paves the way for ROX allocations for
> executable memory.

It looks like you're just doing API cleanup first, then improving the
implementation later?

Patch set looks nice and clean; previous versions did seem to leak too
much arch/module details (or perhaps we were just bikeshedding too much
;) - but the API first approach is nice.

Looking forward to seeing this merged.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
