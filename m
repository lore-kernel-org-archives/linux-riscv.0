Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3402EC7EE37
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 10:09:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8qfMxeiDutL70v0McF+0e/STg+HSCq3OmbK+yUDd1r0=; b=sdT3CTvxMYTYm1
	TV60uBffTy634PtB2GrnacAYkGkHmBcWtpiwnxYPCuxfdw+csN4U6u9b8DsQigPC23EBDq3mVZi6S
	6EpOIopGDmJcXsO3Zz9sKShln1UIe1joPh+TXAqMTVnp0Y9a0Jl/moEpA8+xKlyxAKKqTth4ywa93
	4Ub8QmTh/+Pepj7FCqiHUuzdqVxRQiC3iRDlEvzeMXK1RBf+G55Os8IUmbCVMA2N3e+IKxZTMENMe
	wUiC44m/HZNTfYptie2BTiek/mXmSl4USSpUP4mehBJP+DMLJQR4Bp7Tk02YQJXpViW+ApGFEbgFs
	o1yIfmi2sLsC3kiTgBbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q679r-00ExtF-09;
	Mon, 05 Jun 2023 10:09:51 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q679m-00ExrO-1S;
	Mon, 05 Jun 2023 10:09:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2B9CBD75;
	Mon,  5 Jun 2023 03:10:28 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.24.244])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8F8793F793;
	Mon,  5 Jun 2023 03:09:37 -0700 (PDT)
Date: Mon, 5 Jun 2023 11:09:34 +0100
From: Mark Rutland <mark.rutland@arm.com>
To: Mike Rapoport <rppt@kernel.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>,
	linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Russell King <linux@armlinux.org.uk>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH 00/13] mm: jit/text allocator
Message-ID: <ZH20XkD74prrdN4u@FVFF77S0Q05N>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605092040.GB3460@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_030946_586344_0DC1B962 
X-CRM114-Status: GOOD (  54.00  )
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

On Mon, Jun 05, 2023 at 12:20:40PM +0300, Mike Rapoport wrote:
> On Fri, Jun 02, 2023 at 10:35:09AM +0100, Mark Rutland wrote:
> > On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> > > On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > > > For a while I have wanted to give kprobes its own allocator so that it can work
> > > > even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> > > > the modules area.
> > > > 
> > > > Given that, I think these should have their own allocator functions that can be
> > > > provided independently, even if those happen to use common infrastructure.
> > > 
> > > How much memory can kprobes conceivably use? I think we also want to try
> > > to push back on combinatorial new allocators, if we can.
> > 
> > That depends on who's using it, and how (e.g. via BPF).
> > 
> > To be clear, I'm not necessarily asking for entirely different allocators, but
> > I do thinkg that we want wrappers that can at least pass distinct start+end
> > parameters to a common allocator, and for arm64's modules code I'd expect that
> > we'd keep the range falblack logic out of the common allcoator, and just call
> > it twice.
> > 
> > > > > Several architectures override module_alloc() because of various
> > > > > constraints where the executable memory can be located and this causes
> > > > > additional obstacles for improvements of code allocation.
> > > > > 
> > > > > This set splits code allocation from modules by introducing
> > > > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > > > > sites of module_alloc() and module_memfree() with the new APIs and
> > > > > implements core text and related allocation in a central place.
> > > > > 
> > > > > Instead of architecture specific overrides for module_alloc(), the
> > > > > architectures that require non-default behaviour for text allocation must
> > > > > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > > > > returns a pointer to that structure. If an architecture does not implement
> > > > > jit_alloc_arch_params(), the defaults compatible with the current
> > > > > modules::module_alloc() are used.
> > > > 
> > > > As above, I suspect that each of the callsites should probably be using common
> > > > infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> > > > sense, since the parameters for each case may need to be distinct.
> > > 
> > > I don't see how that follows. The whole point of function parameters is
> > > that they may be different :)
> > 
> > What I mean is that jit_alloc_arch_params() tries to aggregate common
> > parameters, but they aren't actually common (e.g. the actual start+end range
> > for allocation).
> 
> jit_alloc_arch_params() tries to aggregate architecture constraints and
> requirements for allocations of executable memory and this exactly what
> the first 6 patches of this set do.
> 
> A while ago Thomas suggested to use a structure that parametrizes
> architecture constraints by the memory type used in modules [1] and Song
> implemented the infrastructure for it and x86 part [2].
> 
> I liked the idea of defining parameters in a single structure, but I
> thought that approaching the problem from the arch side rather than from
> modules perspective will be better starting point, hence these patches.
> 
> I don't see a fundamental reason why a single structure cannot describe
> what is needed for different code allocation cases, be it modules, kprobes
> or bpf. There is of course an assumption that the core allocations will be
> the same for all the users, and it seems to me that something like 
> 
> * allocate physical memory if allocator caches are empty
> * map it in vmalloc or modules address space
> * return memory from the allocator cache to the caller
> 
> will work for all usecases.
> 
> We might need separate caches for different cases on different
> architectures, and a way to specify what cache should be used in the
> allocator API, but that does not contradict a single structure for arch
> specific parameters, but only makes it more elaborate, e.g. something like
> 
> enum jit_type {
> 	JIT_MODULES_TEXT,
> 	JIT_MODULES_DATA,
> 	JIT_KPROBES,
> 	JIT_FTRACE,
> 	JIT_BPF,
> 	JIT_TYPE_MAX,
> };
> 
> struct jit_alloc_params {
> 	struct jit_range	ranges[JIT_TYPE_MAX];
> 	/* ... */
> };
> 
> > > Can you give more detail on what parameters you need? If the only extra
> > > parameter is just "does this allocation need to live close to kernel
> > > text", that's not that big of a deal.
> > 
> > My thinking was that we at least need the start + end for each caller. That
> > might be it, tbh.
> 
> Do you mean that modules will have something like
> 
> 	jit_text_alloc(size, MODULES_START, MODULES_END);
> 
> and kprobes will have
> 
> 	jit_text_alloc(size, KPROBES_START, KPROBES_END);
> ?

Yes.

> It sill can be achieved with a single jit_alloc_arch_params(), just by
> adding enum jit_type parameter to jit_text_alloc().

That feels backwards to me; it centralizes a bunch of information about
distinct users to be able to shove that into a static array, when the callsites
can pass that information. 

What's *actually* common after separating out the ranges? Is it just the
permissions?

If we want this to be able to share allocations and so on, why can't we do this
like a kmem_cache, and have the callsite pass a pointer to the allocator data?
That would make it easy for callsites to share an allocator or use a distinct
one.

Thanks,
Mark.

> [1] https://lore.kernel.org/linux-mm/87v8mndy3y.ffs@tglx/ 
> [2] https://lore.kernel.org/all/20230526051529.3387103-1-song@kernel.org
> 
> > Thanks,
> > Mark.
> 
> -- 
> Sincerely yours,
> Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
