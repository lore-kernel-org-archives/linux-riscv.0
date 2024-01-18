Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D661AC4707B
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jan 2024 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7fk5HJdnAxn3tGHxMxjcwPFSBAYDHYK+aSSnsKnZgrw=; b=a1gF0QA70JCUxV
	tBFPKkw6Enzk9PJnl6vZ6nSYQoEL08ERHgf8OrQme0PE1+QCRl9HavMZu7oV6hITCwNFxsOYeqQQT
	hYFUeOL1uKdCRH6hFEuyTEOOFOcq5l94spYMGEXPdJ6oMROcAUmVUma847l11K1K4UXBY/PmlXt8t
	oksu+Kmd8rZTFLD1TzFM/zp1Bvg0y9oc0PT7wptuDhWVlyIgxXAnAxRwm7+dgx/1zvMowqBumMUex
	kXCiFU4TjoGisC6iBtA9EVUAZHyvjnyTY38w8T9DPQYjhm1eq/Cuo4bpjwhPiRC9qbwHtnlhQzasr
	M+92OHq5E4CBZQ1oLagQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQOgn-002HSm-37;
	Thu, 18 Jan 2024 09:27:57 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQOgk-002HRg-12;
	Thu, 18 Jan 2024 09:27:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 65880CE1EF7;
	Thu, 18 Jan 2024 09:27:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CA1BC43390;
	Thu, 18 Jan 2024 09:27:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705570071;
	bh=OdevsDZe2JFSnufBy9YDpl2ctaeieZIOsJdm8U6jml0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ntNZPhFfiYF48VAF0GU9/xT6e6ghwtvNk9U40W2fEiJaySGZ1fHbDr8o+4XheyjuV
	 PAwlta+HRFlWfkYL9xPrIvNT5hz4rw8Sh8Y50lpDXUzd7nNwOzomtm3HVH2sRe4Zdn
	 JhCJH+SNZPf2/MF2N454jgdSX4ZamjFSCCkZJUQ4=
Date: Thu, 18 Jan 2024 10:27:48 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Huang Shijie <shijie@os.amperecomputing.com>
Cc: patches@amperecomputing.com, rafael@kernel.org,
	paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu,
	yury.norov@gmail.com, kuba@kernel.org, vschneid@redhat.com,
	mingo@kernel.org, akpm@linux-foundation.org, vbabka@suse.cz,
	rppt@kernel.org, tglx@linutronix.de, jpoimboe@kernel.org,
	ndesaulniers@google.com, mikelley@microsoft.com,
	mhiramat@kernel.org, arnd@arndb.de, linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org, mark.rutland@arm.com, mpe@ellerman.id.au,
	linuxppc-dev@lists.ozlabs.org, chenhuacai@kernel.org,
	jiaxun.yang@flygoat.com, linux-mips@vger.kernel.org,
	cl@os.amperecomputing.com
Subject: Re: [PATCH] init: refactor the generic cpu_to_node for NUMA
Message-ID: <2024011820-path-throat-b7c8@gregkh>
References: <20240118031412.3300-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240118031412.3300-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_012754_711594_AC1A9B67 
X-CRM114-Status: GOOD (  19.33  )
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

On Thu, Jan 18, 2024 at 11:14:12AM +0800, Huang Shijie wrote:
> (0) We list the ARCHs which support the NUMA:
>        arm64, loongarch, powerpc, riscv,
>        sparc, mips, s390, x86,

I do not understand this format, what are you saying here?

Have you read the kernel documentation for how to write changelog texts?
It doesn't say "list a bunch of things", it's a bit more descriptive.

> 
> (1) Some ARCHs in (0) override the generic cpu_to_node(), such as:
>        sparc, mips, s390, x86.
> 
>     Since these ARCHs have their own cpu_to_node(), we do not care
>     about them.
> 
> (2) The ARCHs enable NUMA and use the generic cpu_to_node.
>     From (0) and (1), we can know that four ARCHs support NUMA and
>     use the generic cpu_to_node:
>         arm64, loongarch, powerpc, riscv,
> 
>     The generic cpu_to_node depends on percpu "numa_node".
> 
>     (2.1) The loongarch sets "numa_node" in:
>           start_kernel --> smp_prepare_boot_cpu()
> 
>     (2.2) The arm64, powerpc, riscv set "numa_node" in:
>        	  start_kernel --> arch_call_rest_init() --> rest_init()
>        	               --> kernel_init() --> kernel_init_freeable()
>                        --> smp_prepare_cpus()
> 
>     (2.3) The first place calling the cpu_to_node() is early_trace_init():
>           start_kernel --> early_trace_init()--> __ring_buffer_alloc()
> 	               --> rb_allocate_cpu_buffer()
> 
>     (2.4) So it safe for loongarch. But for arm64, powerpc and riscv,
>           there are at least four places in the common code where
> 	  the cpu_to_node() is called before it is initialized:
> 	   a.) early_trace_init()         in kernel/trace/trace.c
> 	   b.) sched_init()               in kernel/sched/core.c
> 	   c.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   d.) workqueue_init_early()     in kernel/workqueue.c
> 
> (3) In order to fix the issue, the patch refactors the generic cpu_to_node:
>     (3.1) change cpu_to_node to function pointer,
>           and export it for kernel modules.
> 
>     (3.2) introduce _cpu_to_node() which is the original cpu_to_node().
> 
>     (3.3) introduce smp_prepare_boot_cpu_start() to wrap the original
>           smp_prepare_boot_cpu(), and set cpu_to_node with
> 	  early_cpu_to_node which works fine for arm64, powerpc,
> 	  riscv and loongarch.
> 
>     (3.4) introduce smp_prepare_cpus_done() to wrap the original
>           smp_prepare_cpus().
> 	  The "numa_node" is ready after smp_prepare_cpus(),
> 	  then set cpu_to_node with _cpu_to_node().

When you start listing different things in a changelog, that's a hint to
the reviewer to say "please break this up" as patches need to do only
one thing at a time.  As I can't follow the above text at all, that's
all the review comments I'm able to give here, sorry.

But as-is, this isn't acceptable :(

thanks,

greg k-h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
