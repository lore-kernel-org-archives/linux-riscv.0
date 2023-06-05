Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33D7AC77B73
	for <linux-riscv@archiver.kernel.org>; Mon,  5 Jun 2023 21:13:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJ5KhxmRvxENf+bgFi92rDN9ieHmHUwWJzca4Q4iKtw=; b=K3reknPjmbUGOC
	L/VcYRtZ/Wg//BRa7VfmIfO/K2mxBWsrTtV5L11e4bTq1VPTk8sBvxLjH868aontN+7Dj2QEEWzIE
	9nsQhjhrEqc9HPmWXVXqAULtxwpORlEwWb3jeBYsNBEunzKwD6RuqrZ8/ndBi8UGOF/iZ6OjeDbYl
	h11LUPX5CeirhKW654pxt5rcWxkjTljyrG+NGSLkJ71a+V6vdevQAX/akyMz5cNunxXRqR8oD0KX+
	A+T5Vsn/i/e8LVOkF+MiZIXHZk5tXEFySGBU+Go4Kde/yF2/pSgjKVUuTRTnOuXkNMg67wnfiikWG
	6huyKLkvwrUt7j0gwYkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HWN-00GoVI-1j;
	Mon, 05 Jun 2023 21:13:47 +0000
Received: from out-39.mta0.migadu.com ([2001:41d0:1004:224b::27])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q6HWK-00GoT0-1F
	for linux-riscv@lists.infradead.org;
	Mon, 05 Jun 2023 21:13:46 +0000
Date: Mon, 5 Jun 2023 17:13:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1685999618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=oI/D2KsCHwim00FnKX8JEpI3trD4/Ay4oLN6y5jMs+w=;
	b=Ou0t5k0wdLvYQe4I1KiKwwoZvxsvVwlNJliRyeWssvJBsu1TjLT0R5xnAEF8ghzWl5EIl9
	wvjRxKwXo9+fHBI+ActLKXfymEdPx4wflBDdlUy8yktx25QJFLEuEOLWYXAN1GppOyjRcm
	hR70f2tpuOItMjMDbRE2yoaC4QllkuI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Kent Overstreet <kent.overstreet@linux.dev>
To: Mike Rapoport <rppt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org,
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
Message-ID: <ZH5P+iKOnoqYjbPq@moria.home.lan>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230605092040.GB3460@kernel.org>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230605_141344_586911_41DC9858 
X-CRM114-Status: GOOD (  48.50  )
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

Why would we actually need different enums for modules_text, kprobes,
ftrace and bpf? Why can't we treat all text allocations the same?

The reason we can't do that currently is because modules need to go in a
128Mb region on some archs, and without sub page allocation
bpf/kprobes/etc. burn a full page for each allocation. But we're doing
sub page allocation - right?

That leaves module data - which really needs to be split out into rw,
ro, ro_after_init - but I'm not sure we'd even want the same API for
those, they need fairly different page permissions handling.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
