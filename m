Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45799EB64DA
	for <linux-riscv@archiver.kernel.org>; Thu, 20 Jul 2023 10:03:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/p78rlmZ6S1In3km3H+dh3dhzfIAagML2ynU2VyoBsQ=; b=RzKTMYqHgJAf3S
	5mqBrDw4M31e6+vV6JxNep8pfxE/J22+3Xx9eofkdSpaV5Zw6tBZt8jzd1zXUKyG7hLXLZQIcI8no
	R0Tj5INqm7zrp2ct60agYeL3L3wbf2/YHfiGCXmemIhs2RGzM6wSW7QfBYDWu7pfB10EVucCctwjT
	Z1X0MY0x/btj1vjtt4Q3ZDUJVLA94CJ+njFc3G9q7RpvmdkClFW83Zlhfz0reztmQz4PdC09EDlxI
	bBN5r4Mp52D226HvnUV7VhWfvquEGmfGjFfaMy0+E6Z7B/MYJHOD8nlj293M3UpdnYIwwi5AEBBYJ
	y87HD/XVxI/G942z86FA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQVU-00Afec-2A;
	Thu, 20 Jul 2023 10:03:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMQVT-00Afde-0W;
	Thu, 20 Jul 2023 10:03:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=nuhCzIGqu8FaCqoUP3/byzqApARTJ1bBGEwoC2rjsM0=; b=dYdiUPqmktYX5niWT8w+RFFkw4
	6sr/lwz5kTAxDEE6UgX3snst21ndZ9stnHStxWWYMerxZCe0eC6m5OdPtuGEExFqMiK9Qp9h1KbsN
	WEBAxXBAfvRUPi7XwTk6H0ebLC20zgLA7fsXBdLZkz/R3AuTVM9dcFuy7bEfRzsAFQJMrbiGSjppi
	eoj5U7SWRD4lQs7LyrchPIOgzMzGo9nrkno+iZ7FBrNQ8bG4/epB5o38PJABN12d13QTsvN4/H0pP
	rMi++skovD8SJRyi2wn3Cc8tp7D+BywLj8L1EHo2KOLEUHNWapDTMjHWQJTSX00VsKGWU86JbsBwj
	1nEw4PWQ==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMPQe-00FRUo-0e;
	Thu, 20 Jul 2023 08:54:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 88A2F61941;
	Thu, 20 Jul 2023 08:54:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7CBDC433C8;
	Thu, 20 Jul 2023 08:54:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1689843264;
	bh=nLUVvJJOl4QJGI6Kn3sQ8QCjl89R0J5mJFa8dm5XKOw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PuKy3faF1XLn+PHZ7cjaF0uhzIpt8UmxXHlCkcxcysHntuAtgxenMOR0jiqzOaym1
	 WMWgGa+uRvXPjZrWBFBGv038GXrBCyQv80gd0Hc45CQIyyzeMQ82Xaq3ITNm+SYtxo
	 7gvtuugiUYygCScpbVFonOTqCAun5VzD6KVdXP8kD65xKrylzVr11GmSFEDCzkxtVT
	 Q5YLU8AzeJyj7oiLMJZZJ6aCwC/Qi2kX+Q8rqNd9QgbjenTCySbXtXzS2WeAv6NkFU
	 XQgNFCeQsS6eP/C71+pUsdXl355/AKUAswk/sIPsN/gxf6FufuEDrrFaYRAvJ0ZCdI
	 ibNd7XIk2nm/g==
Date: Thu, 20 Jul 2023 11:53:52 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
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
Message-ID: <20230720085352.GN1901145@kernel.org>
References: <20230601101257.530867-1-rppt@kernel.org>
 <ZHjDU/mxE+cugpLj@FVFF77S0Q05N.cambridge.arm.com>
 <ZHjgIH3aX9dCvVZc@moria.home.lan>
 <ZHm3zUUbwqlsZBBF@FVFF77S0Q05N>
 <20230605092040.GB3460@kernel.org>
 <ZH20XkD74prrdN4u@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZH20XkD74prrdN4u@FVFF77S0Q05N>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230720_095435_803715_38606915 
X-CRM114-Status: GOOD (  62.49  )
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

On Mon, Jun 05, 2023 at 11:09:34AM +0100, Mark Rutland wrote:
> On Mon, Jun 05, 2023 at 12:20:40PM +0300, Mike Rapoport wrote:
> > On Fri, Jun 02, 2023 at 10:35:09AM +0100, Mark Rutland wrote:
> > > On Thu, Jun 01, 2023 at 02:14:56PM -0400, Kent Overstreet wrote:
> > > > On Thu, Jun 01, 2023 at 05:12:03PM +0100, Mark Rutland wrote:
> > > > > For a while I have wanted to give kprobes its own allocator so that it can work
> > > > > even with CONFIG_MODULES=n, and so that it doesn't have to waste VA space in
> > > > > the modules area.
> > > > > 
> > > > > Given that, I think these should have their own allocator functions that can be
> > > > > provided independently, even if those happen to use common infrastructure.
> > > > 
> > > > How much memory can kprobes conceivably use? I think we also want to try
> > > > to push back on combinatorial new allocators, if we can.
> > > 
> > > That depends on who's using it, and how (e.g. via BPF).
> > > 
> > > To be clear, I'm not necessarily asking for entirely different allocators, but
> > > I do thinkg that we want wrappers that can at least pass distinct start+end
> > > parameters to a common allocator, and for arm64's modules code I'd expect that
> > > we'd keep the range falblack logic out of the common allcoator, and just call
> > > it twice.
> > > 
> > > > > > Several architectures override module_alloc() because of various
> > > > > > constraints where the executable memory can be located and this causes
> > > > > > additional obstacles for improvements of code allocation.
> > > > > > 
> > > > > > This set splits code allocation from modules by introducing
> > > > > > jit_text_alloc(), jit_data_alloc() and jit_free() APIs, replaces call
> > > > > > sites of module_alloc() and module_memfree() with the new APIs and
> > > > > > implements core text and related allocation in a central place.
> > > > > > 
> > > > > > Instead of architecture specific overrides for module_alloc(), the
> > > > > > architectures that require non-default behaviour for text allocation must
> > > > > > fill jit_alloc_params structure and implement jit_alloc_arch_params() that
> > > > > > returns a pointer to that structure. If an architecture does not implement
> > > > > > jit_alloc_arch_params(), the defaults compatible with the current
> > > > > > modules::module_alloc() are used.
> > > > > 
> > > > > As above, I suspect that each of the callsites should probably be using common
> > > > > infrastructure, but I don't think that a single jit_alloc_arch_params() makes
> > > > > sense, since the parameters for each case may need to be distinct.
> > > > 
> > > > I don't see how that follows. The whole point of function parameters is
> > > > that they may be different :)
> > > 
> > > What I mean is that jit_alloc_arch_params() tries to aggregate common
> > > parameters, but they aren't actually common (e.g. the actual start+end range
> > > for allocation).
> > 
> > jit_alloc_arch_params() tries to aggregate architecture constraints and
> > requirements for allocations of executable memory and this exactly what
> > the first 6 patches of this set do.
> > 
> > A while ago Thomas suggested to use a structure that parametrizes
> > architecture constraints by the memory type used in modules [1] and Song
> > implemented the infrastructure for it and x86 part [2].
> > 
> > I liked the idea of defining parameters in a single structure, but I
> > thought that approaching the problem from the arch side rather than from
> > modules perspective will be better starting point, hence these patches.
> > 
> > I don't see a fundamental reason why a single structure cannot describe
> > what is needed for different code allocation cases, be it modules, kprobes
> > or bpf. There is of course an assumption that the core allocations will be
> > the same for all the users, and it seems to me that something like 
> > 
> > * allocate physical memory if allocator caches are empty
> > * map it in vmalloc or modules address space
> > * return memory from the allocator cache to the caller
> > 
> > will work for all usecases.
> > 
> > We might need separate caches for different cases on different
> > architectures, and a way to specify what cache should be used in the
> > allocator API, but that does not contradict a single structure for arch
> > specific parameters, but only makes it more elaborate, e.g. something like
> > 
> > enum jit_type {
> > 	JIT_MODULES_TEXT,
> > 	JIT_MODULES_DATA,
> > 	JIT_KPROBES,
> > 	JIT_FTRACE,
> > 	JIT_BPF,
> > 	JIT_TYPE_MAX,
> > };
> > 
> > struct jit_alloc_params {
> > 	struct jit_range	ranges[JIT_TYPE_MAX];
> > 	/* ... */
> > };
> > 
> > > > Can you give more detail on what parameters you need? If the only extra
> > > > parameter is just "does this allocation need to live close to kernel
> > > > text", that's not that big of a deal.
> > > 
> > > My thinking was that we at least need the start + end for each caller. That
> > > might be it, tbh.
> > 
> > Do you mean that modules will have something like
> > 
> > 	jit_text_alloc(size, MODULES_START, MODULES_END);
> > 
> > and kprobes will have
> > 
> > 	jit_text_alloc(size, KPROBES_START, KPROBES_END);
> > ?
> 
> Yes.
> 
> > It sill can be achieved with a single jit_alloc_arch_params(), just by
> > adding enum jit_type parameter to jit_text_alloc().
> 
> That feels backwards to me; it centralizes a bunch of information about
> distinct users to be able to shove that into a static array, when the callsites
> can pass that information. 
> 
> What's *actually* common after separating out the ranges? Is it just the
> permissions?

Even if for some architecture the only common thing are the permissions,
having a definition for code allocations in a single place an improvement.
The diffstat of the patches is indeed positive (even without comments), but
having a single structure that specifies how the code should be allocated
would IMHO actually reduce the maintenance burden.

And features like caching of large pages and sub-page size allocations are
surely will be easier to opt-in this way.
 
> If we want this to be able to share allocations and so on, why can't we do this
> like a kmem_cache, and have the callsite pass a pointer to the allocator data?
> That would make it easy for callsites to share an allocator or use a distinct
> one.

I've looked into doing this like a kmem_cache with call sites passing the
allocator data, and this gets really hairy. For each user we need to pass
the arch specific parameters to that user, create a cache there and only
then the cache can be used. Since we don't have hooks to setup any of the
users in the arch code, the initialization gets more complex than shoving
everything into an array.

I think that jit_alloc(type, size) is the best way to move forward to let
different users choose their ranges and potentially caches. Differentiation
by the API name will explode even now and it'll get worse if/when new users
will show up and we can't even force users to avoid using PC-relative
addressing because, e.g. RISC-V explicitly switched their BPF JIT to use
that.
 
> Thanks,
> Mark.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
