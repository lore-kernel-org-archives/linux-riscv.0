Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CD4CC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 00:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gD5oO9GW1QZo4UWnEErz3ks4/EhAYuc2FMT6xrhvaPE=; b=lcGWgza2Yi1CDS
	TGz43YDKweSyDKnMNx6h/mvNH7VACdxptHwH06YG//LlIzbddl07+hERnJg3Uhj8UIl3lkpGYi6w4
	3AJzsvgonV1H+edhjS9eZmrlYMPPVET4KflJFg94bcVgnpOuXodt7LLM2iTHePKCXltyCuCzWs4Sf
	EDLUVFP+BPJc/HMJVXGSYkSRw6e0h9H7inaRcAWlpd9/3DGyIALFLgz9wpWJjuPRz4GC+eXGRjmgy
	iPE2FrDWZFWtT5/0t7gJs6FBoZTyi4VR7krCXGl7Zw+ui7HtkaXmDS9lMc3vRZPNxSf4R4QJWhD4m
	0+eFgvd3NxsY6O3fjung==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2giD-0000000EPqo-2kMN;
	Fri, 03 May 2024 00:23:41 +0000
Received: from dliviu.plus.com ([80.229.23.120] helo=smtp.dudau.co.uk)
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2gi8-0000000EPoE-13U7;
	Fri, 03 May 2024 00:23:38 +0000
Received: from mail.dudau.co.uk (bart.dudau.co.uk [192.168.14.2])
	by smtp.dudau.co.uk (Postfix) with SMTP id 2D79141D12F0;
	Fri, 03 May 2024 01:23:31 +0100 (BST)
Received: by mail.dudau.co.uk (sSMTP sendmail emulation); Fri, 03 May 2024 01:23:31 +0100
Date: Fri, 3 May 2024 01:23:30 +0100
From: Liviu Dudau <liviu@dudau.co.uk>
To: Luis Chamberlain <mcgrof@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?utf-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Donald Dutile <ddutile@redhat.com>,
	Eric Chanudet <echanude@redhat.com>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Mark Rutland <mark.rutland@arm.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Russell King <linux@armlinux.org.uk>,
	Sam Ravnborg <sam@ravnborg.org>, Song Liu <song@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
	bpf@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v7 00/16] mm: jit/text allocator
Message-ID: <ZjQuggSFcO8FXSd2@bart.dudau.co.uk>
References: <20240429121620.1186447-1-rppt@kernel.org>
 <Zi_K4K-j-VB_WI4i@bombadil.infradead.org>
 <ZjQYvOYgURx9/+d0@bart.dudau.co.uk>
 <ZjQcmcA0sNH7jfD7@bombadil.infradead.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjQcmcA0sNH7jfD7@bombadil.infradead.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_172336_599480_31AA4F5E 
X-CRM114-Status: GOOD (  29.66  )
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

On Thu, May 02, 2024 at 04:07:05PM -0700, Luis Chamberlain wrote:
> On Thu, May 02, 2024 at 11:50:36PM +0100, Liviu Dudau wrote:
> > On Mon, Apr 29, 2024 at 09:29:20AM -0700, Luis Chamberlain wrote:
> > > On Mon, Apr 29, 2024 at 03:16:04PM +0300, Mike Rapoport wrote:
> > > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > > 
> > > > Hi,
> > > > 
> > > > The patches are also available in git:
> > > > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v7
> > > > 
> > > > v7 changes:
> > > > * define MODULE_{VADDR,END} for riscv32 to fix the build and avoid
> > > >   #ifdefs in a function body
> > > > * add Acks, thanks everybody
> > > 
> > > Thanks, I've pushed this to modules-next for further exposure / testing.
> > > Given the status of testing so far with prior revisions, in that only a
> > > few issues were found and that those were fixed, and the status of
> > > reviews, this just might be ripe for v6.10.
> > 
> > Looks like there is still some work needed. I've picked up next-20240501
> > and on arch/mips with CONFIG_MODULE_COMPRESS_XZ=y and CONFIG_MODULE_DECOMPRESS=y
> > I fail to load any module:
> > 
> > # modprobe rfkill
> > [11746.539090] Invalid ELF header magic: != ELF
> > [11746.587149] execmem: unable to allocate memory
> > modprobe: can't load module rfkill (kernel/net/rfkill/rfkill.ko.xz): Out of memory
> > 
> > The (hopefully) relevant parts of my .config:
> 
> Thanks for the report! Any chance we can get you to try a bisection? I
> think it should take 2-3 test boots. To help reduce scope you try modules-next:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=modules-next
> 
> Then can you check by resetting your tree to commmit 3fbe6c2f820a76 (mm:
> introduce execmem_alloc() and execmem_free()"). I suspect that should
> boot, so your bad commit would be the tip 3c2c250cb3a5fbb ("bpf: remove
> CONFIG_BPF_JIT dependency on CONFIG_MODULES of").
> 
> That gives us only a few commits to bisect:
> 
> git log --oneline 3fbe6c2f820a76bc36d5546bda85832f57c8fce2..
> 3c2c250cb3a5 (HEAD -> modules-next, korg/modules-next) bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
> 11e8e65cce5c kprobes: remove dependency on CONFIG_MODULES
> e10cbc38697b powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropriate
> 4da3d38f24c5 x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
> 13ae3d74ee70 arch: make execmem setup available regardless of CONFIG_MODULES
> 460bbbc70a47 powerpc: extend execmem_params for kprobes allocations
> e1a14069b5b4 arm64: extend execmem_info for generated code allocations
> 971e181c6585 riscv: extend execmem_params for generated code allocations
> 0fa276f26721 mm/execmem, arch: convert remaining overrides of module_alloc to execmem
> 022cef244287 mm/execmem, arch: convert simple overrides of module_alloc to execmem
> 
> With 2-3 boots we should be to tell which is the bad commit.

Looks like 0fa276f26721 is the first bad commit.

$ git bisect log
# bad: [3c2c250cb3a5fbbccc4a4ff4c9354c54af91f02c] bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
# good: [3fbe6c2f820a76bc36d5546bda85832f57c8fce2] mm: introduce execmem_alloc() and execmem_free()
git bisect start '3c2c250cb3a5' '3fbe6c2f820a76'
# bad: [460bbbc70a47e929b1936ca68979f3b79f168fc6] powerpc: extend execmem_params for kprobes allocations
git bisect bad 460bbbc70a47e929b1936ca68979f3b79f168fc6
# bad: [0fa276f26721e0ffc2ae9c7cf67dcc005b43c67e] mm/execmem, arch: convert remaining overrides of module_alloc to execmem
git bisect bad 0fa276f26721e0ffc2ae9c7cf67dcc005b43c67e
# good: [022cef2442870db738a366d3b7a636040c081859] mm/execmem, arch: convert simple overrides of module_alloc to execmem
git bisect good 022cef2442870db738a366d3b7a636040c081859
# first bad commit: [0fa276f26721e0ffc2ae9c7cf67dcc005b43c67e] mm/execmem, arch: convert remaining overrides of module_alloc to execmem

Maybe MIPS also needs a ARCH_WANTS_EXECMEM_LATE?

Best regards,
Liviu

> 
>   Luis
> 

-- 
Everyone who uses computers frequently has had, from time to time,
a mad desire to attack the precocious abacus with an axe.
       	   	      	     	  -- John D. Clark, Ignition!

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
