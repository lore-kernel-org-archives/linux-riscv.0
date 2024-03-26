Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D2D9C54E67
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:49:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:Subject:Cc:
	To:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Gj1kSNTIpgy4wVgJIpw/3YIXoYB5uBY+yCiOcwPJQ0w=; b=cZlxTvmc0CN7Ml
	Bz7Rgrdl51IqFl6HVwdfWDZfhkvHcKqfb/EtudjNSVuck54dJFCebBZoSpbLlRZWVBkpYdpa7TO+h
	xRziQsuDLhOHBF1Rf2nMjbEzn17l/LzX1CdTFczcxCf6I5YF/XqLQbsaSiWIJihzuG2EjeF3U2D8K
	hTAmVj4n+Wu6c1fjD3c2Y+xj5oRdZKVq8PPhNOrsIMgkKotkmqDzULEgTTR5RG87mrlDXtThMw3Yz
	3BQIcIBzkveSisw2ex57dbm4P2H3gzy21WPDzm6aEd+1u2dZ1UsCHow6oCtV/fQydSd5Disd89nBh
	ralRX32alI+wOg49bPlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9zf-00000005ZDi-2Pdq;
	Tue, 26 Mar 2024 16:49:47 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9zU-00000005Z5W-1Jv4
	for linux-riscv@bombadil.infradead.org;
	Tue, 26 Mar 2024 16:49:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:References:From:Subject:Cc
	:To:Message-Id:Date:Content-Type:Content-Transfer-Encoding:Mime-Version:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=c0AtHDp0TPaZddBRR8DLBacQ4NVYWlfUgA6KO+iWRYE=; b=PjszPf/v9cFU4d5DSZ5WFId3sG
	iHW8aHuU3BIdIF7fjuoOsIb4iK2G8uSSruvgpPnQoP78wjGStog//7WnUxGdPM5FvYtKnDd8l+8Gg
	85p0HcHpa+hBd3PoXij4CfOwgcVPBgjzRvPFK35ydyJ9BXOZWN9GPl5mLxSgJVflGv8VCPtuDIQk0
	JoY5DahVdh91M0W59wF6OQ9zRGOQhPEXGTUeBTzgKYUqxMslfwVR6IcEPG+H1IzjUvXfhcB1qkzKu
	rY4uhkYYq4Cu3Fksp9V9KjhvfMVht+zhm3NLGP83R9iO4Bb1aYc6x7leTZc0B2O1KQ6o9xoBvshVh
	y2luGn1g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rp9zQ-0000000HJSq-3jEk
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1DDF5612FF;
	Tue, 26 Mar 2024 16:49:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9400CC433C7;
	Tue, 26 Mar 2024 16:49:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711471770;
	bh=H2HpTU1EmHDoY/mcqae3NhFHA7uFSeakgfW/r6p76sQ=;
	h=Date:To:Cc:Subject:From:References:In-Reply-To:From;
	b=Rb1LiOVjtZh6e2NNbZ+rKw3OGvUoB+4Y12YHHS/D+WSBc0gCcc/iRQX3Ub2HGSj5F
	 Dt8yu94iSHRlIB+e3gelfxcGfDAcDl0IRzBJTkS5OTTrO66OGnqxCmnKd9PteK6mV/
	 m4zTp75pHeBPPkOckURWggi/akxlFKVQTH6IQNn1/W+6NILIvtJd4B9uNQ+iox0JgT
	 shYeK4DSLx5hgEDTFAyHfT3Mf2NjKSelhKZlpQJC0flSKpkt8Tt4MkUzZQDK0shRyT
	 TWqBnwyfjWMGzDHucKvIxZNyLYemKUuvwtI2g+euY2CHGQOQcxQtzy20QtBFxGATNR
	 yT1Ivng41AjmQ==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 18:49:25 +0200
Message-Id: <D03U3UZ4XBOW.66TLKVR1PKPH@kernel.org>
To: "Alexandre Ghiti" <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 <linux-modules@vger.kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Subject: Re: [PATCH v5 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <20240325215502.660-2-jarkko@kernel.org>
 <474ed846-672a-4ff0-9d53-cbf8192fee5f@ghiti.fr>
In-Reply-To: <474ed846-672a-4ff0-9d53-cbf8192fee5f@ghiti.fr>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_164933_215649_DB8A52BF 
X-CRM114-Status: GOOD (  36.31  )
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

On Tue Mar 26, 2024 at 3:57 PM EET, Alexandre Ghiti wrote:
> Hi Jarkko,
>
> On 25/03/2024 22:55, Jarkko Sakkinen wrote:
> > Tacing with kprobes while running a monolithic kernel is currently
> > impossible due the kernel module allocator dependency.
> >
> > Address the issue by implementing textmem API for RISC-V.
> >
> > Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
> > Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
> > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > ---
> > v5:
> > - No changes, expect removing alloc_execmem() call which should have
> >    been part of the previous patch.
> > v4:
> > - Include linux/execmem.h.
> > v3:
> > - Architecture independent parts have been split to separate patches.
> > - Do not change arch/riscv/kernel/module.c as it is out of scope for
> >    this patch set now.
> > v2:
> > - Better late than never right? :-)
> > - Focus only to RISC-V for now to make the patch more digestable. This
> >    is the arch where I use the patch on a daily basis to help with QA.
> > - Introduce HAVE_KPROBES_ALLOC flag to help with more gradual migration.
> > ---
> >   arch/riscv/Kconfig          |  1 +
> >   arch/riscv/kernel/Makefile  |  3 +++
> >   arch/riscv/kernel/execmem.c | 22 ++++++++++++++++++++++
> >   3 files changed, 26 insertions(+)
> >   create mode 100644 arch/riscv/kernel/execmem.c
> >
> > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > index e3142ce531a0..499512fb17ff 100644
> > --- a/arch/riscv/Kconfig
> > +++ b/arch/riscv/Kconfig
> > @@ -132,6 +132,7 @@ config RISCV
> >   	select HAVE_KPROBES if !XIP_KERNEL
> >   	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> >   	select HAVE_KRETPROBES if !XIP_KERNEL
> > +	select HAVE_ALLOC_EXECMEM if !XIP_KERNEL
> >   	# https://github.com/ClangBuiltLinux/linux/issues/1881
> >   	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
> >   	select HAVE_MOVE_PMD
> > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > index 604d6bf7e476..337797f10d3e 100644
> > --- a/arch/riscv/kernel/Makefile
> > +++ b/arch/riscv/kernel/Makefile
> > @@ -73,6 +73,9 @@ obj-$(CONFIG_SMP)		+= cpu_ops.o
> >   
> >   obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
> >   obj-$(CONFIG_MODULES)		+= module.o
> > +ifeq ($(CONFIG_ALLOC_EXECMEM),y)
> > +obj-y				+= execmem.o
> > +endif
> >   obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
> >   
> >   obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
> > diff --git a/arch/riscv/kernel/execmem.c b/arch/riscv/kernel/execmem.c
> > new file mode 100644
> > index 000000000000..3e52522ead32
> > --- /dev/null
> > +++ b/arch/riscv/kernel/execmem.c
> > @@ -0,0 +1,22 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
> > +
> > +#include <linux/mm.h>
> > +#include <linux/execmem.h>
> > +#include <linux/vmalloc.h>
> > +#include <asm/sections.h>
> > +
> > +void *alloc_execmem(unsigned long size, gfp_t /* gfp */)

Need to have the parameter name here. I guess this could just as well
pass through gfp to vmalloc from the caller as kprobes does call
module_alloc() with GFP_KERNEL set in RISC-V.

> > +{
> > +	return __vmalloc_node_range(size, 1, MODULES_VADDR,
> > +				    MODULES_END, GFP_KERNEL,
> > +				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> > +				    __builtin_return_address(0));
> > +}
>
>
> The __vmalloc_node_range() line ^^ must be from an old kernel since we 
> added VM_FLUSH_RESET_PERMS in 6.8, see 749b94b08005 ("riscv: Fix 
> module_alloc() that did not reset the linear mapping permissions").
>
> In addition, I guess module_alloc() should now use alloc_execmem() right?

Ack for the first comment. For the 2nd it is up to arch/<arch> to choose
whether to have shared or separate allocators.

So if you want I can change it that way but did not want to make the
call myself.

>
>
> > +
> > +void free_execmem(void *region)
> > +{
> > +	if (in_interrupt())
> > +		pr_warn("In interrupt context: vmalloc may not work.\n");
> > +
> > +	vfree(region);
> > +}
>
>
> I remember Mike Rapoport sent a patchset to introduce an API for 
> executable memory allocation 
> (https://lore.kernel.org/linux-mm/20230918072955.2507221-1-rppt@kernel.org/), 
> how does this intersect with your work? I don't know the status of his 
> patchset though.
>
> Thanks,
>
> Alex

I have also made a patch set for kprobes in the 2022:

https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/

I think this Calvin's, Mike's and my early patch set have the same
problem: they try to choke all architectures at once. And further,
Calvin's and Mike's work also try to cover also tracing subsystems
at once.

I feel that my relatively small patch set which deals only with
trivial kprobe (which is more in the leaf than e.g. bpf which
is more like orchestrator tool) and implements one arch of which
dog food I actually eat is a better starting point.

Arch code is always something where you need to have genuine
understanding so full architecture coverage from day one is
just too risky for stability. Linux is better off if people who
work on a  specific arch proactively will "fill the holes".

So the way I see my patch set is "lowest common denominator"
in both architecture axis and tracing subsystem axist. It should
not interfere that much with the other work (like bpf).

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
