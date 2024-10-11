Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED6D2D24462
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Oct 2024 00:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g7rDz4a54pz2qoawMTBscgRKjFqgsIcqaAjA/UTcsnc=; b=2R5F3AyFHsZ4OF
	ZGuV7MWW+ZSpalwTbwnlXC3/VYlfufdYiHwAEyNfm3id7wQCZsPM077paJo/4NZErYKIqyQanlQB+
	UWdHBzKsvD+HwiczS2TRU7bpZ2C9EOBh/ibsZNSGC8i1ftq+z1K7taWMDDZUJBj862Tt3JHa4LwaJ
	EjlaU6+54sgAO4CkE0aiNTkIwtf12dT0LPrpl9e9CjFZC/X85z8OQA+4mqU0gS5dK2IUf1nEcqJds
	tQ2/fc0prjk2MV/OdE7oEN8Gb4Yfq+MwUAPQ5RQPRmf9yZAJcrvA42jO/Z/C5HgxhB8Xh1lmHCf4Z
	F/SX25l1KqGvo4e+yInA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sz3HX-0000000Ek3a-2eii;
	Fri, 11 Oct 2024 00:13:23 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sz3G9-0000000EjjP-2TOg;
	Fri, 11 Oct 2024 00:11:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BF6A15C5AB4;
	Fri, 11 Oct 2024 00:11:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F66DC4CECD;
	Fri, 11 Oct 2024 00:11:52 +0000 (UTC)
Date: Thu, 10 Oct 2024 20:12:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Linux Trace Kernel
 <linux-trace-kernel@vger.kernel.org>, linux-arm-kernel@lists.infradead.org,
 loongarch@lists.linux.dev, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>, "x86@kernel.org"
 <x86@kernel.org>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
 Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers
 <mathieu.desnoyers@efficios.com>, Mark Rutland <mark.rutland@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, Naveen N Rao
 <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Alexander Gordeev
 <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH] ftrace: Make ftrace_regs abstract from direct use
Message-ID: <20241010201200.729d4fcb@gandalf.local.home>
In-Reply-To: <202410110707.uHvgl9S7-lkp@intel.com>
References: <20241007204743.41314f1d@gandalf.local.home>
	<202410110707.uHvgl9S7-lkp@intel.com>
X-Mailer: Claws Mail 3.20.0git84 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241010_171157_766757_F8111D0E 
X-CRM114-Status: GOOD (  19.53  )
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

On Fri, 11 Oct 2024 08:00:21 +0800
kernel test robot <lkp@intel.com> wrote:

> Hi Steven,
> 
> kernel test robot noticed the following build errors:

Hmm,

I wonder if we can not waste resources if a v2 version of a patch is sent
out. Not sure when this was picked up, but I sent out an updated version
with this fixed yesterday.

  https://lore.kernel.org/all/20241008230628.958778821@goodmis.org/

-- Steve


> 
> [auto build test ERROR on next-20241004]
> [cannot apply to s390/features arm64/for-next/core powerpc/next powerpc/fixes linus/master v6.12-rc2 v6.12-rc1 v6.11 v6.12-rc2]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Steven-Rostedt/ftrace-Make-ftrace_regs-abstract-from-direct-use/20241008-084930
> base:   next-20241004
> patch link:    https://lore.kernel.org/r/20241007204743.41314f1d%40gandalf.local.home
> patch subject: [PATCH] ftrace: Make ftrace_regs abstract from direct use
> config: um-allnoconfig (https://download.01.org/0day-ci/archive/20241011/202410110707.uHvgl9S7-lkp@intel.com/config)
> compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241011/202410110707.uHvgl9S7-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202410110707.uHvgl9S7-lkp@intel.com/
> 
> All errors (new ones prefixed by >>):
> 
>    In file included from kernel/time/time.c:31:
>    In file included from include/linux/timekeeper_internal.h:10:
>    In file included from include/linux/clocksource.h:22:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from kernel/time/time.c:31:
>    In file included from include/linux/timekeeper_internal.h:10:
>    In file included from include/linux/clocksource.h:22:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from kernel/time/time.c:31:
>    In file included from include/linux/timekeeper_internal.h:10:
>    In file included from include/linux/clocksource.h:22:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    In file included from kernel/time/time.c:33:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:10:
>    In file included from include/linux/perf_event.h:52:
>    In file included from include/linux/ftrace.h:23:
>    In file included from ./arch/um/include/generated/asm/ftrace.h:1:
> >> include/asm-generic/ftrace.h:5:2: error: unterminated conditional directive  
>        5 | #ifndef __ASM_GENERIC_FTRACE_H__
>          |  ^
>    12 warnings and 1 error generated.
> --
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:9:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:548:31: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      548 |         val = __raw_readb(PCI_IOBASE + addr);
>          |                           ~~~~~~~~~~ ^
>    include/asm-generic/io.h:561:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      561 |         val = __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:37:51: note: expanded from macro '__le16_to_cpu'
>       37 | #define __le16_to_cpu(x) ((__force __u16)(__le16)(x))
>          |                                                   ^
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:9:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:574:61: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      574 |         val = __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + addr));
>          |                                                         ~~~~~~~~~~ ^
>    include/uapi/linux/byteorder/little_endian.h:35:51: note: expanded from macro '__le32_to_cpu'
>       35 | #define __le32_to_cpu(x) ((__force __u32)(__le32)(x))
>          |                                                   ^
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:9:
>    In file included from include/linux/hardirq.h:11:
>    In file included from arch/um/include/asm/hardirq.h:5:
>    In file included from include/asm-generic/hardirq.h:17:
>    In file included from include/linux/irq.h:20:
>    In file included from include/linux/io.h:14:
>    In file included from arch/um/include/asm/io.h:24:
>    include/asm-generic/io.h:585:33: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      585 |         __raw_writeb(value, PCI_IOBASE + addr);
>          |                             ~~~~~~~~~~ ^
>    include/asm-generic/io.h:595:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      595 |         __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:605:59: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      605 |         __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
>          |                                                       ~~~~~~~~~~ ^
>    include/asm-generic/io.h:693:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      693 |         readsb(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:701:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      701 |         readsw(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:709:20: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      709 |         readsl(PCI_IOBASE + addr, buffer, count);
>          |                ~~~~~~~~~~ ^
>    include/asm-generic/io.h:718:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      718 |         writesb(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:727:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      727 |         writesw(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    include/asm-generic/io.h:736:21: warning: performing pointer arithmetic on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
>      736 |         writesl(PCI_IOBASE + addr, buffer, count);
>          |                 ~~~~~~~~~~ ^
>    In file included from kernel/time/hrtimer.c:30:
>    In file included from include/linux/syscalls.h:93:
>    In file included from include/trace/syscall.h:7:
>    In file included from include/linux/trace_events.h:10:
>    In file included from include/linux/perf_event.h:52:
>    In file included from include/linux/ftrace.h:23:
>    In file included from ./arch/um/include/generated/asm/ftrace.h:1:
> >> include/asm-generic/ftrace.h:5:2: error: unterminated conditional directive  
>        5 | #ifndef __ASM_GENERIC_FTRACE_H__
>          |  ^
>    kernel/time/hrtimer.c:121:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      121 |         [CLOCK_REALTIME]        = HRTIMER_BASE_REALTIME,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:122:22: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      122 |         [CLOCK_MONOTONIC]       = HRTIMER_BASE_MONOTONIC,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:123:21: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      123 |         [CLOCK_BOOTTIME]        = HRTIMER_BASE_BOOTTIME,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:124:17: warning: initializer overrides prior initialization of this subobject [-Winitializer-overrides]
>      124 |         [CLOCK_TAI]             = HRTIMER_BASE_TAI,
>          |                                   ^~~~~~~~~~~~~~~~
>    kernel/time/hrtimer.c:119:27: note: previous initialization is here
>      119 |         [0 ... MAX_CLOCKS - 1]  = HRTIMER_MAX_CLOCK_BASES,
>          |                                   ^~~~~~~~~~~~~~~~~~~~~~~
>    16 warnings and 1 error generated.
> 
> 
> vim +5 include/asm-generic/ftrace.h
> 
> 38f5bf84bd588a GuanXuetao 2011-01-15 @5  #ifndef __ASM_GENERIC_FTRACE_H__
> 38f5bf84bd588a GuanXuetao 2011-01-15  6  #define __ASM_GENERIC_FTRACE_H__
> 38f5bf84bd588a GuanXuetao 2011-01-15  7  
> 


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
