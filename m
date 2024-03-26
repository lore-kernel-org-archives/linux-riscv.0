Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2B9AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 16:55:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:From:Subject:
	Cc:Message-Id:Date:Mime-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dAPK6nv2RPq6R7uDXi0DD48UIonIGMSjfUbS+vu+aIQ=; b=437Refs0okBYy3
	PNGO5SW9C7fDUYE0FdoBJhZYEezRLloQWCsOHLYdNVjzVBQchDp4CAEfpIYpCjpq0uN8OjTbqUXBG
	s3Y6Ey6mhE9qG/T7M0Ry/mIaHpmyHrCDdC5zfj/pRiY2ENJAz6rBWCInQpfuCSGw/IclfjwzqfbXM
	/DGdQUq6Wie8edPch5lYqEWo+3xIUJLjhKWUXx4g3wzcmUeXf9CXWjFz2/UscC2kMuf5mFY7wOr+C
	v/YkyC+W6jd+6HZ/KGDH0wWIZxnzF/OAGt3WmYZeL9T9Bc2ibF8Pjow39rg1CHN0NDk5CvqYUpgWX
	EpUESlu55IOjfL/lEdXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpA4e-00000005ayo-1rLd;
	Tue, 26 Mar 2024 16:54:56 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpA4a-00000005axK-3dPr
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 16:54:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 223DBCE2309;
	Tue, 26 Mar 2024 16:54:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4B28C433F1;
	Tue, 26 Mar 2024 16:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711472090;
	bh=kfvUE/tPrPQaCp2NEJWZn+NkD/GzFr+HXyYsWmXWBms=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=ft27l9pEEf4nP9p1LalDYbwgGlKP0QZMe2l/7Zy7s/yBZOZ/6AuibNn0ERZqdIWJY
	 7ROkwF/gi+ZOsOZNzcc5Pm0lgeBUUyaFisU2ZWpnIVR9OgGnUea9K+tq3tJpL/M9KF
	 Rveg6dZD2TyuiwQ8uRrd+CUa/hYrmGkzsFjpmVSjpfB/nwoHYzB1yWtRFIS+MUBXgE
	 B8cLjcZRQZxFm06+Bq523kTiY5VxDq/3HPZkldm9n4TMS8XUfuWXY3DCzL/lhAHrV7
	 TJzcNm1VDfyeiy9dg6JSnpQ2cvIzpt2vsBbQElU+oz00709fzcJW6KAn+lh9ughGkA
	 csNLdbHlWvQVg==
Mime-Version: 1.0
Date: Tue, 26 Mar 2024 18:54:45 +0200
Message-Id: <D03U7Y29RXR8.374E0V78LPHFF@kernel.org>
Cc: "Paul Walmsley" <paul.walmsley@sifive.com>, "Palmer Dabbelt"
 <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, "Luis Chamberlain" <mcgrof@kernel.org>,
 <linux-modules@vger.kernel.org>, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, "Anil S Keshavamurthy"
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 "Masami Hiramatsu" <mhiramat@kernel.org>
Subject: Re: [PATCH v5 2/2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
From: "Jarkko Sakkinen" <jarkko@kernel.org>
To: "Jarkko Sakkinen" <jarkko@kernel.org>, "Alexandre Ghiti"
 <alex@ghiti.fr>, <linux-riscv@lists.infradead.org>
X-Mailer: aerc 0.17.0
References: <20240325215502.660-1-jarkko@kernel.org>
 <20240325215502.660-2-jarkko@kernel.org>
 <474ed846-672a-4ff0-9d53-cbf8192fee5f@ghiti.fr>
 <D03U3UZ4XBOW.66TLKVR1PKPH@kernel.org>
In-Reply-To: <D03U3UZ4XBOW.66TLKVR1PKPH@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240326_095453_266579_677FBFB5 
X-CRM114-Status: GOOD (  43.02  )
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

On Tue Mar 26, 2024 at 6:49 PM EET, Jarkko Sakkinen wrote:
> On Tue Mar 26, 2024 at 3:57 PM EET, Alexandre Ghiti wrote:
> > Hi Jarkko,
> >
> > On 25/03/2024 22:55, Jarkko Sakkinen wrote:
> > > Tacing with kprobes while running a monolithic kernel is currently
> > > impossible due the kernel module allocator dependency.
> > >
> > > Address the issue by implementing textmem API for RISC-V.
> > >
> > > Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
> > > Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
> > > Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> > > ---
> > > v5:
> > > - No changes, expect removing alloc_execmem() call which should have
> > >    been part of the previous patch.
> > > v4:
> > > - Include linux/execmem.h.
> > > v3:
> > > - Architecture independent parts have been split to separate patches.
> > > - Do not change arch/riscv/kernel/module.c as it is out of scope for
> > >    this patch set now.
> > > v2:
> > > - Better late than never right? :-)
> > > - Focus only to RISC-V for now to make the patch more digestable. This
> > >    is the arch where I use the patch on a daily basis to help with QA.
> > > - Introduce HAVE_KPROBES_ALLOC flag to help with more gradual migration.
> > > ---
> > >   arch/riscv/Kconfig          |  1 +
> > >   arch/riscv/kernel/Makefile  |  3 +++
> > >   arch/riscv/kernel/execmem.c | 22 ++++++++++++++++++++++
> > >   3 files changed, 26 insertions(+)
> > >   create mode 100644 arch/riscv/kernel/execmem.c
> > >
> > > diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> > > index e3142ce531a0..499512fb17ff 100644
> > > --- a/arch/riscv/Kconfig
> > > +++ b/arch/riscv/Kconfig
> > > @@ -132,6 +132,7 @@ config RISCV
> > >   	select HAVE_KPROBES if !XIP_KERNEL
> > >   	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
> > >   	select HAVE_KRETPROBES if !XIP_KERNEL
> > > +	select HAVE_ALLOC_EXECMEM if !XIP_KERNEL
> > >   	# https://github.com/ClangBuiltLinux/linux/issues/1881
> > >   	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
> > >   	select HAVE_MOVE_PMD
> > > diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> > > index 604d6bf7e476..337797f10d3e 100644
> > > --- a/arch/riscv/kernel/Makefile
> > > +++ b/arch/riscv/kernel/Makefile
> > > @@ -73,6 +73,9 @@ obj-$(CONFIG_SMP)		+= cpu_ops.o
> > >   
> > >   obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
> > >   obj-$(CONFIG_MODULES)		+= module.o
> > > +ifeq ($(CONFIG_ALLOC_EXECMEM),y)
> > > +obj-y				+= execmem.o
> > > +endif
> > >   obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
> > >   
> > >   obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
> > > diff --git a/arch/riscv/kernel/execmem.c b/arch/riscv/kernel/execmem.c
> > > new file mode 100644
> > > index 000000000000..3e52522ead32
> > > --- /dev/null
> > > +++ b/arch/riscv/kernel/execmem.c
> > > @@ -0,0 +1,22 @@
> > > +// SPDX-License-Identifier: GPL-2.0-or-later
> > > +
> > > +#include <linux/mm.h>
> > > +#include <linux/execmem.h>
> > > +#include <linux/vmalloc.h>
> > > +#include <asm/sections.h>
> > > +
> > > +void *alloc_execmem(unsigned long size, gfp_t /* gfp */)
>
> Need to have the parameter name here. I guess this could just as well
> pass through gfp to vmalloc from the caller as kprobes does call
> module_alloc() with GFP_KERNEL set in RISC-V.
>
> > > +{
> > > +	return __vmalloc_node_range(size, 1, MODULES_VADDR,
> > > +				    MODULES_END, GFP_KERNEL,
> > > +				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> > > +				    __builtin_return_address(0));
> > > +}
> >
> >
> > The __vmalloc_node_range() line ^^ must be from an old kernel since we 
> > added VM_FLUSH_RESET_PERMS in 6.8, see 749b94b08005 ("riscv: Fix 
> > module_alloc() that did not reset the linear mapping permissions").
> >
> > In addition, I guess module_alloc() should now use alloc_execmem() right?
>
> Ack for the first comment. For the 2nd it is up to arch/<arch> to choose
> whether to have shared or separate allocators.
>
> So if you want I can change it that way but did not want to make the
> call myself.
>
> >
> >
> > > +
> > > +void free_execmem(void *region)
> > > +{
> > > +	if (in_interrupt())
> > > +		pr_warn("In interrupt context: vmalloc may not work.\n");
> > > +
> > > +	vfree(region);
> > > +}
> >
> >
> > I remember Mike Rapoport sent a patchset to introduce an API for 
> > executable memory allocation 
> > (https://lore.kernel.org/linux-mm/20230918072955.2507221-1-rppt@kernel.org/), 
> > how does this intersect with your work? I don't know the status of his 
> > patchset though.
> >
> > Thanks,
> >
> > Alex
>
> I have also made a patch set for kprobes in the 2022:
>
> https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/
>
> I think this Calvin's, Mike's and my early patch set have the same
> problem: they try to choke all architectures at once. And further,
> Calvin's and Mike's work also try to cover also tracing subsystems
> at once.
>
> I feel that my relatively small patch set which deals only with
> trivial kprobe (which is more in the leaf than e.g. bpf which
> is more like orchestrator tool) and implements one arch of which
> dog food I actually eat is a better starting point.
>
> Arch code is always something where you need to have genuine
> understanding so full architecture coverage from day one is
> just too risky for stability. Linux is better off if people who
> work on a  specific arch proactively will "fill the holes".
>
> So the way I see my patch set is "lowest common denominator"
> in both architecture axis and tracing subsystem axist. It should
> not interfere that much with the other work (like bpf).

Here also there is a lot of kconfig flag logic changes. I've verified
them but still I think we are better off if this stuff is put in the
wild first in small scale rather than spraying kernel with code changes
in the first run.

BR, Jarkko

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
