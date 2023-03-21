Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8DBFFC6FD1D
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 14:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0Y9zoijU1CLLfB/5vBLQ4WUCmEfW7YXKDgOFs83rghE=; b=H/ZyVvr0oFyjcD
	JmNFtXHMXNXxVktfYfMP39FlVBjOqt5e9/9J3ChHUVxvHan2eCkl3+Ri0Jj2AZrWT1ljMp8hfmpiJ
	7G3+HZKPd3VTMbXrWpHFrb3BgxBj5y4c6I1cB4qoKCImq4tQue+HBeccrnGnHG81G3OrZ6Vq44gFH
	Zacw5rV/5L0JugtOmTgO1OhtLzpd6Qa+/xZAR1EOl/z6szELhFSlgqXYB30i9bCEKoA5DfkHSwfFn
	OWTuuO2esw+xPWVvvy8gUsQ8Jlxjuuy9MPgec4QGl2hEc1Lny4+LuNmxd3c1B2iKb4lNPrBEeFM32
	jSViCla/pLC+P6Z8TVEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecuu-00Chyx-2F;
	Tue, 21 Mar 2023 14:24:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pecui-00Chra-2B;
	Tue, 21 Mar 2023 14:24:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 397B6AD7;
	Tue, 21 Mar 2023 07:25:18 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.54.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4ADBD3F6C4;
	Tue, 21 Mar 2023 07:24:31 -0700 (PDT)
Date: Tue, 21 Mar 2023 14:24:28 +0000
From: Mark Rutland <mark.rutland@arm.com>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: mhiramat@kernel.org, rostedt@goodmis.org, linux@armlinux.org.uk,
	will@kernel.org, catalin.marinas@arm.com, palmer@dabbelt.com,
	paul.walmsley@sifive.com, tglx@linutronix.de,
	dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
	xiehuan09@gmail.com, dinghui@sangfor.com.cn,
	huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
	linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <ZBm+HKK9laIXAdsc@FVFF77S0Q05N>
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
 <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230320131650.482594-2-pengdonglin@sangfor.com.cn>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_072437_038941_28489ABE 
X-CRM114-Status: GOOD (  27.87  )
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

On Mon, Mar 20, 2023 at 06:16:49AM -0700, Donglin Peng wrote:
> When using the function_graph tracer to analyze system call failures,
> it can be time-consuming to analyze the trace logs and locate the kernel
> function that first returns an error. This change aims to simplify the
> process by recording the function return value to the 'retval' member of
> 'ftrace_graph_ent' and printing it when outputing the trace log.
> 
> New trace options are introduced: funcgraph-retval and graph_retval_hex.
> The former is used to control whether to display the return value, while
> the latter is used to control the display format of the reutrn value.
> 
> Note that even if a function's return type is void, a return value will
> still be printed, so just ignore it.
> 
> Currently, this modification supports the following commonly used
> processor architectures: x86_64, x86, arm64, arm, riscv.
> 
> Here is an example:
> 
> I want to attach the demo process to a cpu cgroup, but it failed:
> 
> echo `pidof demo` > /sys/fs/cgroup/cpu/test/tasks
> -bash: echo: write error: Invalid argument
> 
> The strace logs tells that the write system call returned -EINVAL(-22):
> ...
> write(1, "273\n", 4)                    = -1 EINVAL (Invalid argument)
> ...
> 
> Use the following commands to capture trace logs when calling the write
> system call:
> 
> cd /sys/kernel/debug/tracing/
> echo 0 > tracing_on
> echo > trace
> echo *sys_write > set_graph_function
> echo *spin* > set_graph_notrace
> echo *rcu* >> set_graph_notrace
> echo *alloc* >> set_graph_notrace
> echo preempt* >> set_graph_notrace
> echo kfree* >> set_graph_notrace
> echo $$ > set_ftrace_pid
> echo function_graph > current_tracer
> echo 1 > tracing_on
> echo `pidof demo` > /sys/fs/cgroup/cpu/test/tasks
> echo 0 > tracing_on
> echo 1 > options/funcgraph-retval
> cat trace > ~/trace.log
> 
> Search the error code -22 directly in the file trace.log and find the
> first function that return -22, then read the function code to get the
> root cause.
> 
> ...
> 
>  1)          | cgroup_migrate() {
>  1) 0.651 us |   cgroup_migrate_add_task(); /* = 0xffff93fcfd346c00 */
>  1)          |   cgroup_migrate_execute() {
>  1)          |     cpu_cgroup_can_attach() {
>  1)          |       cgroup_taskset_first() {
>  1) 0.732 us |         cgroup_taskset_next(); /* = 0xffff93fc8fb20000 */
>  1) 1.232 us |       } /* cgroup_taskset_first = 0xffff93fc8fb20000 */
>  1) 0.380 us |       sched_rt_can_attach(); /* = 0x0 */
>  1) 2.335 us |     } /* cpu_cgroup_can_attach = -22 */
>  1) 4.369 us |   } /* cgroup_migrate_execute = -22 */
>  1) 7.143 us | } /* cgroup_migrate = -22 */
> 
> ...
> 
> Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>

> diff --git a/arch/arm64/kernel/entry-ftrace.S b/arch/arm64/kernel/entry-ftrace.S
> index 350ed81324ac..d1a5d76e6d72 100644
> --- a/arch/arm64/kernel/entry-ftrace.S
> +++ b/arch/arm64/kernel/entry-ftrace.S
> @@ -276,7 +276,15 @@ SYM_CODE_START(return_to_handler)
>  	stp x4, x5, [sp, #32]
>  	stp x6, x7, [sp, #48]
>  
> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> +	/*
> +	 * Pass both the function return values in the register x0 and x1
> +	 * to ftrace_return_to_handler.
> +	 */
> +	mov	x2, x29			//     parent's fp
> +#else
>  	mov	x0, x29			//     parent's fp
> +#endif
>  	bl	ftrace_return_to_handler// addr = ftrace_return_to_hander(fp);
>  	mov	x30, x0			// restore the original return address


Please don't make the calling convention of the asm change depending on a
selectable config option.

We already store the regs here; I'd be happy to make that a struct ftrace_regs
and pass a pointer to that to C code. Then it's be easy to acquire the value
you want in the exact same way as upon entry, and it'll work even if we decide
to return a structure by value somewhere (as that can use registers x2-x7 too).

Thanks,
Mark.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
