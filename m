Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 078ADEB64DC
	for <linux-riscv@archiver.kernel.org>; Sun, 25 Jun 2023 16:15:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=m88ckw8oJk9Z5SDKHFOXHP3Z89HV/Iq49/HXh+ptscM=; b=G722uc2jBvxPjl
	sUdl+MuXufIutFxbgkAw/HWG9iAV7VG4rWkHbJuKdxDonbaLnX6mewahXkxak2ya9r+RyMoO75DPY
	3dXQvjx6nllTrJTLS4JtiWPpJbGICNXW+41MvWjoA8LUtnkc5oBIygJ9EUBJaEAXMiT1BnVxsOE2C
	nEBRI1vTfZAF+WM9+cH5Am60diWmYVD2S76/SsIR2vUBltCca3knKFC3kiRFfGMMUlZpeGtiWaSMV
	K77pJhlMj5ShjNAyjskvG0+kdD6uCHVUtdLOBIlS5z4hjkk78Xnf5S+Y0BSNSCTCtwCW/oyHQndYO
	4cI5I6xN9jjFnsiWxXBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qDSOX-008HPn-2C;
	Sun, 25 Jun 2023 16:15:21 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qDSOR-008HNO-1j;
	Sun, 25 Jun 2023 16:15:17 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F114260BEE;
	Sun, 25 Jun 2023 16:15:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E463C433C8;
	Sun, 25 Jun 2023 16:15:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1687709714;
	bh=4/ubcrsJvqhBH/vtuVerDOnT8cLh0Z8x9NdrY0vOnlQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WstfenfqrQraRy6ufCoglL05809oMSEcRfUfndB4rQcusE2zI6TcMHkeBnayI84XA
	 LeozoS1GxcgX6ngSkoBmbS3qtRRxpB4XJfcJ0UBAlF7QFxeCg91BLDI10maMfpngYE
	 GUM0fRwCgV10clhNpI2PaQ4gob7CHex19G8gRldqPBuUpM78fGkBpM0UXT8ixelGSU
	 z1J5NhvB3QyMnCUu0HFkwD1i+NEXK0yL9AmrFlsQbZjM/QMXh/KkJhf0b8d0tCsjR9
	 O2Kt+FWy9X6r90AuucdbQ5DKiCYwwvRks6UN7t6Eai/BXzXsbKQsTn9de+dLQqBnA/
	 HFT91PEpPBRoA==
Date: Sun, 25 Jun 2023 19:14:17 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Andy Lutomirski <luto@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Kees Cook <keescook@chromium.org>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick P Edgecombe <rick.p.edgecombe@intel.com>,
	"Russell King (Oracle)" <linux@armlinux.org.uk>,
	Song Liu <song@kernel.org>, Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org, linux-mm@kvack.org,
	linux-modules@vger.kernel.org, linux-parisc@vger.kernel.org,
	linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
	loongarch@lists.linux.dev, netdev@vger.kernel.org,
	sparclinux@vger.kernel.org,
	the arch/x86 maintainers <x86@kernel.org>
Subject: Re: [PATCH v2 02/12] mm: introduce execmem_text_alloc() and
 jit_text_alloc()
Message-ID: <20230625161417.GK52412@kernel.org>
References: <20230616085038.4121892-1-rppt@kernel.org>
 <20230616085038.4121892-3-rppt@kernel.org>
 <f9a7eebe-d36e-4587-b99d-35d4edefdd14@app.fastmail.com>
 <20230618080027.GA52412@kernel.org>
 <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a17c65c6-863f-4026-9c6f-a04b659e9ab4@app.fastmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230625_091515_671391_D9A261A0 
X-CRM114-Status: GOOD (  56.51  )
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

On Mon, Jun 19, 2023 at 10:09:02AM -0700, Andy Lutomirski wrote:
> 
> On Sun, Jun 18, 2023, at 1:00 AM, Mike Rapoport wrote:
> > On Sat, Jun 17, 2023 at 01:38:29PM -0700, Andy Lutomirski wrote:
> >> On Fri, Jun 16, 2023, at 1:50 AM, Mike Rapoport wrote:
> >> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> >> >
> >> > module_alloc() is used everywhere as a mean to allocate memory for code.
> >> >
> >> > Beside being semantically wrong, this unnecessarily ties all subsystems
> >> > that need to allocate code, such as ftrace, kprobes and BPF to modules
> >> > and puts the burden of code allocation to the modules code.
> >> >
> >> > Several architectures override module_alloc() because of various
> >> > constraints where the executable memory can be located and this causes
> >> > additional obstacles for improvements of code allocation.
> >> >
> >> > Start splitting code allocation from modules by introducing
> >> > execmem_text_alloc(), execmem_free(), jit_text_alloc(), jit_free() APIs.
> >> >
> >> > Initially, execmem_text_alloc() and jit_text_alloc() are wrappers for
> >> > module_alloc() and execmem_free() and jit_free() are replacements of
> >> > module_memfree() to allow updating all call sites to use the new APIs.
> >> >
> >> > The intention semantics for new allocation APIs:
> >> >
> >> > * execmem_text_alloc() should be used to allocate memory that must reside
> >> >   close to the kernel image, like loadable kernel modules and generated
> >> >   code that is restricted by relative addressing.
> >> >
> >> > * jit_text_alloc() should be used to allocate memory for generated code
> >> >   when there are no restrictions for the code placement. For
> >> >   architectures that require that any code is within certain distance
> >> >   from the kernel image, jit_text_alloc() will be essentially aliased to
> >> >   execmem_text_alloc().
> >> >
> >> 
> >> Is there anything in this series to help users do the appropriate
> >> synchronization when the actually populate the allocated memory with
> >> code?  See here, for example:
> >
> > This series only factors out the executable allocations from modules and
> > puts them in a central place.
> > Anything else would go on top after this lands.
> 
> Hmm.
> 
> On the one hand, there's nothing wrong with factoring out common code. On
> the other hand, this is probably the right time to at least start
> thinking about synchronization, at least to the extent that it might make
> us want to change this API.  (I'm not at all saying that this series
> should require changes -- I'm just saying that this is a good time to
> think about how this should work.)
> 
> The current APIs, *and* the proposed jit_text_alloc() API, don't actually
> look like the one think in the Linux ecosystem that actually
> intelligently and efficiently maps new text into an address space:
> mmap().
> 
> On x86, you can mmap() an existing file full of executable code PROT_EXEC
> and jump to it with minimal synchronization (just the standard implicit
> ordering in the kernel that populates the pages before setting up the
> PTEs and whatever user synchronization is needed to avoid jumping into
> the mapping before mmap() finishes).  It works across CPUs, and the only
> possible way userspace can screw it up (for a read-only mapping of
> read-only text, anyway) is to jump to the mapping too early, in which
> case userspace gets a page fault.  Incoherence is impossible, and no one
> needs to "serialize" (in the SDM sense).
> 
> I think the same sequence (from userspace's perspective) works on other
> architectures, too, although I think more cache management is needed on
> the kernel's end.  As far as I know, no Linux SMP architecture needs an
> IPI to map executable text into usermode, but I could easily be wrong.
> (IIRC RISC-V has very developer-unfriendly icache management, but I don't
> remember the details.)
> 
> Of course, using ptrace or any other FOLL_FORCE to modify text on x86 is
> rather fraught, and I bet many things do it wrong when userspace is
> multithreaded.  But not in production because it's mostly not used in
> production.)
> 
> But jit_text_alloc() can't do this, because the order of operations
> doesn't match.  With jit_text_alloc(), the executable mapping shows up
> before the text is populated, so there is no atomic change from not-there
> to populated-and-executable.  Which means that there is an opportunity
> for CPUs, speculatively or otherwise, to start filling various caches
> with intermediate states of the text, which means that various
> architectures (even x86!) may need serialization.
> 
> For eBPF- and module- like use cases, where JITting/code gen is quite
> coarse-grained, perhaps something vaguely like:
> 
> jit_text_alloc() -> returns a handle and an executable virtual address,
> but does *not* map it there
> jit_text_write() -> write to that handle
> jit_text_map() -> map it and synchronize if needed (no sync needed on
> x86, I think)
> 
> could be more efficient and/or safer.
> 
> (Modules could use this too.  Getting alternatives right might take some
> fiddling, because off the top of my head, this doesn't match how it works
> now.)
> 
> To make alternatives easier, this could work, maybe (haven't fully
> thought it through):
> 
> jit_text_alloc()
> jit_text_map_rw_inplace() -> map at the target address, but RW, !X
> 
> write the text and apply alternatives
> 
> jit_text_finalize() -> change from RW to RX *and synchronize*
> 
> jit_text_finalize() would either need to wait for RCU (possibly extra
> heavy weight RCU to get "serialization") or send an IPI.

This essentially how modules work now. The memory is allocated RW, written
and updated with alternatives and then made ROX in the end with set_memory
APIs.

The issue with not having the memory mapped X when it's written is that we
cannot use large pages to map it. One of the goals is to have executable
memory mapped with large pages and make code allocator able to divide that
page among several callers.

So the idea was that jit_text_alloc() will have a cache of large pages
mapped ROX, will allocate memory from those caches and there will be
jit_update() that uses text poking for writing to that memory.

Upon allocation of a large page to increase the cache, that large page will
be "invalidated" by filling it with breakpoint instructions (e.g int3 on
x86)

To improve the performance of this process, we can write to !X copy and
then text_poke it to the actual address in one go. This will require some
changes to get the alternatives right.

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
