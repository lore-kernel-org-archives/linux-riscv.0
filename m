Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74415C25B6B
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 08:58:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4nGWd3oKzL2uIIM8UI0Y3usrGnVosf1vOe7gwdirPcY=; b=dV6lMlqwlQhFmX
	XWQu+oud82OxSBaAHnJtjH73Vr3QDEJ8QTlw0/AYkCHdlg2rbont7yFk3CXPZwXNQDxmBaTMr22Fk
	YZD8qwIVA5TRqS0HHM0UsN4R1DZsSc0huWs0XGEKJevQbemt4+wv7zGHODkrlHAKPtk7D3s1Hx+qt
	MWnC0lt7UqPucRq/ZUTtk+CU54QTFeSDGZsR85l2W5TOGh66F/h9t+ZAaGw0VpASYgBEmigpfC+f1
	N0W8rpSZ5+hkcdnO8cezkaxPXSFmUPfxu25vEJEVEP+nZ5JbC5gvBBCrfblSpFKqwQTkAXtGN4Chg
	s0kMNG/9lu/vg/eVNE1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwCC-00E1JA-2F;
	Thu, 26 Oct 2023 08:58:28 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwC8-00E1Fu-0t;
	Thu, 26 Oct 2023 08:58:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7009FCE3E47;
	Thu, 26 Oct 2023 08:58:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9B0BC433C7;
	Thu, 26 Oct 2023 08:58:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698310701;
	bh=daj1kZsVxPjd+zO39ZAev3zCXUc1FaedBgbX73nudCk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r2IeoKsV+mJJpE6z2XsX1iIp24lKjd2VIwT/xdGbzM4QJ1z6/95hZgo8dTrbqyffN
	 8DV48I6gafiHJ1W+sQ7xkSCEWs1Wh3ihhaTtNnOomkd5rdfUSH/VyEwenBw8FyxoGy
	 dhmaO/Bq2xkkYLIg5jb3D7re45cnRROW7gfrE4czIzlLWldF8At6B9lE0w5M6vGi01
	 k5USZIeXtTxyoNfpdwZ4lyaGy8S4FOFzwfuRadAU3111ZEEfuMlEZmph7ucAT6ZG1d
	 z6H7920gFiqm1FRnq/jWuFKwHTDrcmSHuk47fqo8k/MnZWV2iXv2IEUOtl8o74ARYW
	 oZPw5JfD44y3w==
Date: Thu, 26 Oct 2023 11:58:00 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Will Deacon <will@kernel.org>
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
	Thomas Gleixner <tglx@linutronix.de>, bpf@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-mips@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	linux-parisc@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, loongarch@lists.linux.dev,
	netdev@vger.kernel.org, sparclinux@vger.kernel.org, x86@kernel.org
Subject: Re: [PATCH v3 04/13] mm/execmem, arch: convert remaining overrides
 of module_alloc to execmem
Message-ID: <20231026085800.GK2824@kernel.org>
References: <20230918072955.2507221-1-rppt@kernel.org>
 <20230918072955.2507221-5-rppt@kernel.org>
 <20231023171420.GA4041@willie-the-truck>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231023171420.GA4041@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_015824_664445_02BDAC83 
X-CRM114-Status: GOOD (  36.16  )
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

Hi Will,

On Mon, Oct 23, 2023 at 06:14:20PM +0100, Will Deacon wrote:
> Hi Mike,
> 
> On Mon, Sep 18, 2023 at 10:29:46AM +0300, Mike Rapoport wrote:
> > From: "Mike Rapoport (IBM)" <rppt@kernel.org>
> > 
> > Extend execmem parameters to accommodate more complex overrides of
> > module_alloc() by architectures.
> > 
> > This includes specification of a fallback range required by arm, arm64
> > and powerpc and support for allocation of KASAN shadow required by
> > arm64, s390 and x86.
> > 
> > The core implementation of execmem_alloc() takes care of suppressing
> > warnings when the initial allocation fails but there is a fallback range
> > defined.
> > 
> > Signed-off-by: Mike Rapoport (IBM) <rppt@kernel.org>
> > ---
> >  arch/arm/kernel/module.c     | 38 ++++++++++++---------
> >  arch/arm64/kernel/module.c   | 57 ++++++++++++++------------------
> >  arch/powerpc/kernel/module.c | 52 ++++++++++++++---------------
> >  arch/s390/kernel/module.c    | 52 +++++++++++------------------
> >  arch/x86/kernel/module.c     | 64 +++++++++++-------------------------
> >  include/linux/execmem.h      | 14 ++++++++
> >  mm/execmem.c                 | 43 ++++++++++++++++++++++--
> >  7 files changed, 167 insertions(+), 153 deletions(-)
> 
> [...]
> 
> > diff --git a/arch/arm64/kernel/module.c b/arch/arm64/kernel/module.c
> > index dd851297596e..cd6320de1c54 100644
> > --- a/arch/arm64/kernel/module.c
> > +++ b/arch/arm64/kernel/module.c
> > @@ -20,6 +20,7 @@
> >  #include <linux/random.h>
> >  #include <linux/scs.h>
> >  #include <linux/vmalloc.h>
> > +#include <linux/execmem.h>
> >  
> >  #include <asm/alternative.h>
> >  #include <asm/insn.h>
> > @@ -108,46 +109,38 @@ static int __init module_init_limits(void)
> >  
> >  	return 0;
> >  }
> > -subsys_initcall(module_init_limits);
> >  
> > -void *module_alloc(unsigned long size)
> > +static struct execmem_params execmem_params __ro_after_init = {
> > +	.ranges = {
> > +		[EXECMEM_DEFAULT] = {
> > +			.flags = EXECMEM_KASAN_SHADOW,
> > +			.alignment = MODULE_ALIGN,
> > +		},
> > +	},
> > +};
> > +
> > +struct execmem_params __init *execmem_arch_params(void)
> >  {
> > -	void *p = NULL;
> > +	struct execmem_range *r = &execmem_params.ranges[EXECMEM_DEFAULT];
> >  
> > -	/*
> > -	 * Where possible, prefer to allocate within direct branch range of the
> > -	 * kernel such that no PLTs are necessary.
> > -	 */
> 
> Why are you removing this comment? I think you could just move it next
> to the part where we set a 128MiB range.
 
Oops, my bad. Will add it back.

> > -	if (module_direct_base) {
> > -		p = __vmalloc_node_range(size, MODULE_ALIGN,
> > -					 module_direct_base,
> > -					 module_direct_base + SZ_128M,
> > -					 GFP_KERNEL | __GFP_NOWARN,
> > -					 PAGE_KERNEL, 0, NUMA_NO_NODE,
> > -					 __builtin_return_address(0));
> > -	}
> > +	module_init_limits();
> 
> Hmm, this used to be run from subsys_initcall(), but now you're running
> it _really_ early, before random_init(), so randomization of the module
> space is no longer going to be very random if we don't have early entropy
> from the firmware or the CPU, which is likely to be the case on most SoCs.

Well, it will be as random as KASLR. Won't that be enough?
 
> > diff --git a/mm/execmem.c b/mm/execmem.c
> > index f25a5e064886..a8c2f44d0133 100644
> > --- a/mm/execmem.c
> > +++ b/mm/execmem.c
> > @@ -11,12 +11,46 @@ static void *execmem_alloc(size_t size, struct execmem_range *range)
> >  {
> >  	unsigned long start = range->start;
> >  	unsigned long end = range->end;
> > +	unsigned long fallback_start = range->fallback_start;
> > +	unsigned long fallback_end = range->fallback_end;
> >  	unsigned int align = range->alignment;
> >  	pgprot_t pgprot = range->pgprot;
> > +	bool kasan = range->flags & EXECMEM_KASAN_SHADOW;
> > +	unsigned long vm_flags  = VM_FLUSH_RESET_PERMS;
> > +	bool fallback  = !!fallback_start;
> > +	gfp_t gfp_flags = GFP_KERNEL;
> > +	void *p;
> >  
> > -	return __vmalloc_node_range(size, align, start, end,
> > -				   GFP_KERNEL, pgprot, VM_FLUSH_RESET_PERMS,
> > -				   NUMA_NO_NODE, __builtin_return_address(0));
> > +	if (PAGE_ALIGN(size) > (end - start))
> > +		return NULL;
> > +
> > +	if (kasan)
> > +		vm_flags |= VM_DEFER_KMEMLEAK;
> 
> Hmm, I don't think we passed this before on arm64, should we have done?

It was there on arm64 before commit 8339f7d8e178 ("arm64: module: remove
old !KASAN_VMALLOC logic").
There's no need to pass VM_DEFER_KMEMLEAK when KASAN_VMALLOC is enabled and
arm64 always selects KASAN_VMALLOC with KASAN.

And for the generic case, I should have made the condition to check for
KASAN_VMALLOC as well.
 
> Will

-- 
Sincerely yours,
Mike.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
