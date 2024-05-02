Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5BE8C4345F
	for <linux-riscv@archiver.kernel.org>; Thu,  2 May 2024 23:07:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=WJQO5EVtOBXiERUO9CefcIxUtVmAdb11jKN51BJt5cw=; b=2KTnV3F4lWVMyX
	iIXFiogMNaKfbSDCphrRkfEaGHZXshdVYNPIDO9RGBwTt3zYmjcvTX/KLNxzC83w8oXnWj2Ag87Oj
	ZGtZwcDd7yg8OXYG2x2j20J/O8xSQhGpU0JzWEFRuRFpiFGUI6QJeIL/9W540i5p+Ce6CUFuFr3cX
	IAsEIGO75nzURf7oj9ZlUGxYzLj4hswDrQ87LOkWPe8tLKsafnVzHF1Lu9E68TEbKZwxPzdpP/aWu
	PCEknSSe6dKl1pdEFl7+8DNmLsg5MbuZYZGHnuF5cZLj9YkfKi7hILD17mte67O0ZI5sw92IMQ1xe
	zfYnBJCBLzKh7sNtcBxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2fWE-0000000ECmQ-217w;
	Thu, 02 May 2024 23:07:14 +0000
Received: from mcgrof by bombadil.infradead.org with local (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2fW5-0000000ECkp-3WzA;
	Thu, 02 May 2024 23:07:05 +0000
Date: Thu, 2 May 2024 16:07:05 -0700
From: Luis Chamberlain <mcgrof@kernel.org>
To: Liviu Dudau <liviu@dudau.co.uk>
Cc: Mike Rapoport <rppt@kernel.org>, linux-kernel@vger.kernel.org,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
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
	Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
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
Message-ID: <ZjQcmcA0sNH7jfD7@bombadil.infradead.org>
References: <20240429121620.1186447-1-rppt@kernel.org>
 <Zi_K4K-j-VB_WI4i@bombadil.infradead.org>
 <ZjQYvOYgURx9/+d0@bart.dudau.co.uk>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZjQYvOYgURx9/+d0@bart.dudau.co.uk>
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

On Thu, May 02, 2024 at 11:50:36PM +0100, Liviu Dudau wrote:
> On Mon, Apr 29, 2024 at 09:29:20AM -0700, Luis Chamberlain wrote:
> > On Mon, Apr 29, 2024 at 03:16:04PM +0300, Mike Rapoport wrote:
> > > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > > 
> > > Hi,
> > > 
> > > The patches are also available in git:
> > > https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git/log/?h=execmem/v7
> > > 
> > > v7 changes:
> > > * define MODULE_{VADDR,END} for riscv32 to fix the build and avoid
> > >   #ifdefs in a function body
> > > * add Acks, thanks everybody
> > 
> > Thanks, I've pushed this to modules-next for further exposure / testing.
> > Given the status of testing so far with prior revisions, in that only a
> > few issues were found and that those were fixed, and the status of
> > reviews, this just might be ripe for v6.10.
> 
> Looks like there is still some work needed. I've picked up next-20240501
> and on arch/mips with CONFIG_MODULE_COMPRESS_XZ=y and CONFIG_MODULE_DECOMPRESS=y
> I fail to load any module:
> 
> # modprobe rfkill
> [11746.539090] Invalid ELF header magic: != ELF
> [11746.587149] execmem: unable to allocate memory
> modprobe: can't load module rfkill (kernel/net/rfkill/rfkill.ko.xz): Out of memory
> 
> The (hopefully) relevant parts of my .config:

Thanks for the report! Any chance we can get you to try a bisection? I
think it should take 2-3 test boots. To help reduce scope you try modules-next:

https://git.kernel.org/pub/scm/linux/kernel/git/mcgrof/linux.git/log/?h=modules-next

Then can you check by resetting your tree to commmit 3fbe6c2f820a76 (mm:
introduce execmem_alloc() and execmem_free()"). I suspect that should
boot, so your bad commit would be the tip 3c2c250cb3a5fbb ("bpf: remove
CONFIG_BPF_JIT dependency on CONFIG_MODULES of").

That gives us only a few commits to bisect:

git log --oneline 3fbe6c2f820a76bc36d5546bda85832f57c8fce2..
3c2c250cb3a5 (HEAD -> modules-next, korg/modules-next) bpf: remove CONFIG_BPF_JIT dependency on CONFIG_MODULES of
11e8e65cce5c kprobes: remove dependency on CONFIG_MODULES
e10cbc38697b powerpc: use CONFIG_EXECMEM instead of CONFIG_MODULES where appropriate
4da3d38f24c5 x86/ftrace: enable dynamic ftrace without CONFIG_MODULES
13ae3d74ee70 arch: make execmem setup available regardless of CONFIG_MODULES
460bbbc70a47 powerpc: extend execmem_params for kprobes allocations
e1a14069b5b4 arm64: extend execmem_info for generated code allocations
971e181c6585 riscv: extend execmem_params for generated code allocations
0fa276f26721 mm/execmem, arch: convert remaining overrides of module_alloc to execmem
022cef244287 mm/execmem, arch: convert simple overrides of module_alloc to execmem

With 2-3 boots we should be to tell which is the bad commit.

  Luis

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
