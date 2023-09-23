Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD1DCE7A88
	for <linux-riscv@archiver.kernel.org>; Sat, 23 Sep 2023 16:24:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=KPeeZ0vFl2KGKjQZqunG66iHy8XKI3WyqmItDgUsF2U=; b=rDHKbDMqaR7gs1
	mOwtJrmAf7vLzr4BSTpPi7Z4bLr3Xv0W8tBt94lQ9lo0GMT0pfH4N+hZO2utC9+zhIdgTPD0oFuIc
	5TObvxNoTnMKZ6WT/y9LEFOPXMYiq/YYIBJw4oItgJxv6shxlV+ArlRyaB7CEb4aLw6vITCBiU9oA
	c78EpbkwuRPwJpeW0MotaPf8fYP3DzhYhpdA0stnm+QeYJFvTE5x6PLYn6xDa1otXIygJ+J4eLCBH
	WsS/7V4uiFPXbhRiu+xCVlrRdTMUeJdxz7XtNtkYFCOrQ8ONcGhrH0voa4A3wHK3TozzytyV4j1Y+
	4cjYQukKMk4vlu5VeWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5R1-00BCF8-1W;
	Sat, 23 Sep 2023 16:24:47 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qk5Qx-00BCCS-1H;
	Sat, 23 Sep 2023 16:24:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 53F84B80092;
	Sat, 23 Sep 2023 16:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C213C433C8;
	Sat, 23 Sep 2023 16:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695486280;
	bh=LPa0vOpCN9uFCJLwT0Mv83PIALUPvGiZjoSaYDcpsJE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XbZg7GgD8+BmM0EbIou3DUcf1HdG1quOywXNpDmhicICfIw73rq/zzU/h/vI/qZDp
	 XFUEPcYb9UPuknO3UuH9df8jDX6Y2cSrJ80wg4ZDDFpWgi05sPMcC4MzWe2C0cyCeu
	 nP6/UDcZM95kD65En58LM92KcpcWG3KRH0guTPfrV4zfxxO4soUJ8uiNt0flLBa+d0
	 BLkPfitclvMDS0vd51IsKv7CF8IIIdzK9/P0gBrSPMYS98N2ZZq1Bne2bq5a34spi2
	 CfuytAh2slWgJP4aWqKBet8FSXiJNiOrIpHAN1uhuJKdaS5HEKlew5LP5bm2Q0OAmM
	 QvG1TNKlGHcFw==
Date: Sat, 23 Sep 2023 19:23:40 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
	=?iso-8859-1?Q?Bj=F6rn_T=F6pel?= <bjorn@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	"David S. Miller" <davem@davemloft.net>,
	Dinh Nguyen <dinguyen@kernel.org>,
	Heiko Carstens <hca@linux.ibm.com>, Helge Deller <deller@gmx.de>,
	Huacai Chen <chenhuacai@kernel.org>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nadav Amit <nadav.amit@gmail.com>,
	"Naveen N. Rao" <naveen.n.rao@linux.ibm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Puranjay Mohan <puranjay12@gmail.com>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
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
Subject: Re: [PATCH v3 08/13] riscv: extend execmem_params for generated code
 allocations
Message-ID: <20230923162340.GM3303@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-9-rppt@kernel.org>
 <6d686c54-078d-8d71-d4e2-c754cf92c557@ghiti.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <6d686c54-078d-8d71-d4e2-c754cf92c557@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230923_092443_731264_C7B02D33 
X-CRM114-Status: GOOD (  27.02  )
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

On Fri, Sep 22, 2023 at 12:37:07PM +0200, Alexandre Ghiti wrote:
> Hi Mike,
> 
> On 18/09/2023 09:29, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > The memory allocations for kprobes and BPF on RISC-V are not placed in
> > the modules area and these custom allocations are implemented with
> > overrides of alloc_insn_page() and  bpf_jit_alloc_exec().
> > 
> > Slightly reorder execmem_params initialization to support both 32 and 64
> > bit variants, define EXECMEM_KPROBES and EXECMEM_BPF ranges in
> > riscv::execmem_params and drop overrides of alloc_insn_page() and
> > bpf_jit_alloc_exec().
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >   arch/riscv/kernel/module.c         | 21 ++++++++++++++++++++-
> >   arch/riscv/kernel/probes/kprobes.c | 10 ----------
> >   arch/riscv/net/bpf_jit_core.c      | 13 -------------
> >   3 files changed, 20 insertions(+), 24 deletions(-)
> > 
> > diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> > index 343a0edfb6dd..31505ecb5c72 100644
> > --- a/arch/riscv/kernel/module.c
> > +++ b/arch/riscv/kernel/module.c
> > @@ -436,20 +436,39 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
> >   	return 0;
> >   }
> > -#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> > +#ifdef CONFIG_MMU
> >   static struct execmem_params execmem_params __ro_after_init = {
> >   	.ranges = {
> >   		[EXECMEM_DEFAULT] = {
> >   			.pgprot = PAGE_KERNEL,
> >   			.alignment = 1,
> >   		},
> > +		[EXECMEM_KPROBES] = {
> > +			.pgprot = PAGE_KERNEL_READ_EXEC,
> > +			.alignment = 1,
> > +		},
> > +		[EXECMEM_BPF] = {
> > +			.pgprot = PAGE_KERNEL,
> > +			.alignment = 1,
> 
> 
> Not entirely sure it is the same alignment (sorry did not go through the
> entire series), but if it is, the alignment above ^ is not the same that is
> requested by our current bpf_jit_alloc_exec() implementation which is
> PAGE_SIZE.
 
This literally translates vmalloc() in alloc_insn_page() to a set of
parameters, so "1" comes from there. And using alignment of 1 with
vmalloc() implicitly sets it to PAGE_SIZE.

> > +		},
> >   	},
> >   };
> >   struct execmem_params __init *execmem_arch_params(void)
> >   {
> > +#ifdef CONFIG_64BIT
> >   	execmem_params.ranges[EXECMEM_DEFAULT].start = MODULES_VADDR;
> >   	execmem_params.ranges[EXECMEM_DEFAULT].end = MODULES_END;
> > +#else
> > +	execmem_params.ranges[EXECMEM_DEFAULT].start = VMALLOC_START;
> > +	execmem_params.ranges[EXECMEM_DEFAULT].end = VMALLOC_END;
> > +#endif
> > +
> > +	execmem_params.ranges[EXECMEM_KPROBES].start = VMALLOC_START;
> > +	execmem_params.ranges[EXECMEM_KPROBES].end = VMALLOC_END;
> > +
> > +	execmem_params.ranges[EXECMEM_BPF].start = BPF_JIT_REGION_START;
> > +	execmem_params.ranges[EXECMEM_BPF].end = BPF_JIT_REGION_END;
> >   	return &execmem_params;
> >   }
> > diff --git a/arch/riscv/kernel/probes/kprobes.c b/arch/riscv/kernel/probes/kprobes.c
> > index 2f08c14a933d..e64f2f3064eb 100644
> > --- a/arch/riscv/kernel/probes/kprobes.c
> > +++ b/arch/riscv/kernel/probes/kprobes.c
> > @@ -104,16 +104,6 @@ int __kprobes arch_prepare_kprobe(struct kprobe *p)
> >   	return 0;
> >   }
> > -#ifdef CONFIG_MMU
> > -void *alloc_insn_page(void)
> > -{
> > -	return  __vmalloc_node_range(PAGE_SIZE, 1, VMALLOC_START, VMALLOC_END,
> > -				     GFP_KERNEL, PAGE_KERNEL_READ_EXEC,
> > -				     VM_FLUSH_RESET_PERMS, NUMA_NO_NODE,
> > -				     __builtin_return_address(0));
> > -}
> > -#endif
> > -
> >   /* install breakpoint in text */
> >   void __kprobes arch_arm_kprobe(struct kprobe *p)
> >   {
> > diff --git a/arch/riscv/net/bpf_jit_core.c b/arch/riscv/net/bpf_jit_core.c
> > index 7b70ccb7fec3..c8a758f0882b 100644
> > --- a/arch/riscv/net/bpf_jit_core.c
> > +++ b/arch/riscv/net/bpf_jit_core.c
> > @@ -218,19 +218,6 @@ u64 bpf_jit_alloc_exec_limit(void)
> >   	return BPF_JIT_REGION_SIZE;
> >   }
> > -void *bpf_jit_alloc_exec(unsigned long size)
> > -{
> > -	return __vmalloc_node_range(size, PAGE_SIZE, BPF_JIT_REGION_START,
> > -				    BPF_JIT_REGION_END, GFP_KERNEL,
> > -				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> > -				    __builtin_return_address(0));
> > -}
> > -
> > -void bpf_jit_free_exec(void *addr)
> > -{
> > -	return vfree(addr);
> > -}
> > -
> >   void *bpf_arch_text_copy(void *dst, void *src, size_t len)
> >   {
> >   	int ret;
> 
> 
> Otherwise, you can add:
> 
> Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
> 
> Thanks,
> 
> Alex
> 
> 

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
