Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6EE6C4725D
	for <linux-riscv@archiver.kernel.org>; Fri, 19 Jan 2024 05:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1VJvafUaQ8yfxYsWcFOuU61QGhMV0wh1VQExAi3bLDE=; b=rf8jODNPu+R8om
	lsIEN4dWIqRXc74fCI41uH1+pv945qVrzRbOWHqA404IVewIvFObQ7o03f1caLskyqSTfC1Q99AQC
	TQwbBLG6TshBYf6IqkUTu0FD7vzv/VNQJ53iThEo16flwxPEJZDGKGkE9izIGP2bZPqI1RsrniG5g
	sjw9bvKVClAmw2yYueWeBpp/79OXQsVCoCvDZAttNWq5SpcRck8+NsPE6h0pw0N5ykYzKo3NBxabG
	DbmEQkNdZ4IPEvWmkGyEy70bW+E3ihQ8e+H8R0D+J7LK9Tz5fLIpj4SZdBtUO0Kc9j+a48L0hhyTL
	Cvh5ZuALxd7/pTctPWvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhYJ-004WQo-34;
	Fri, 19 Jan 2024 05:36:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQhYF-004WQ1-1O;
	Fri, 19 Jan 2024 05:36:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F2AD161083;
	Fri, 19 Jan 2024 05:35:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 076E6C433C7;
	Fri, 19 Jan 2024 05:35:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1705642551;
	bh=xwIvYirzcQSwftyIx5L3JhM83cF7QaQjlnMuqrVIBW0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RK5pRqjgi6Jn5tJ8rmDeMlYrbrTcn13P1in9jNFBBmtQye8lmAYZVLH5sgNDwDYcj
	 G/W7j8+u6jGvZIpeWfD/1/0yVMJWag21Fy71X8+gFqOwq+7MnSVVVpj0QefvOT3yE4
	 oCGZgYFbu705V1AUa+l476kv25eE1SK0a3p09xGI=
Date: Fri, 19 Jan 2024 06:35:48 +0100
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
Subject: Re: [PATCH] NUMA: Early use of cpu_to_node() returns 0 instead of
 the correct node id
Message-ID: <2024011937-multitude-yield-fd4d@gregkh>
References: <20240119033227.14113-1-shijie@os.amperecomputing.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20240119033227.14113-1-shijie@os.amperecomputing.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240118_213623_701526_02E0AA2B 
X-CRM114-Status: GOOD (  33.68  )
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

On Fri, Jan 19, 2024 at 11:32:27AM +0800, Huang Shijie wrote:
> During the kernel booting, the generic cpu_to_node() is called too early in
> arm64, powerpc and riscv when CONFIG_NUMA is enabled.
> 
> There are at least four places in the common code where
> the generic cpu_to_node() is called before it is initialized:
> 	   1.) early_trace_init()         in kernel/trace/trace.c
> 	   2.) sched_init()               in kernel/sched/core.c
> 	   3.) init_sched_fair_class()    in kernel/sched/fair.c
> 	   4.) workqueue_init_early()     in kernel/workqueue.c
> 
> In order to fix the bug, the patch changes generic cpu_to_node to
> function pointer, and export it for kernel modules.
> Introduce smp_prepare_boot_cpu_start() to wrap the original
> smp_prepare_boot_cpu(), and set cpu_to_node with early_cpu_to_node.
> Introduce smp_prepare_cpus_done() to wrap the original smp_prepare_cpus(),
> and set the cpu_to_node to formal _cpu_to_node().
> 
> Signed-off-by: Huang Shijie <shijie@os.amperecomputing.com>
> ---
>  drivers/base/arch_numa.c | 11 +++++++++++
>  include/linux/topology.h |  6 ++----
>  init/main.c              | 29 +++++++++++++++++++++++++++--
>  3 files changed, 40 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/base/arch_numa.c b/drivers/base/arch_numa.c
> index 5b59d133b6af..867a477fa975 100644
> --- a/drivers/base/arch_numa.c
> +++ b/drivers/base/arch_numa.c
> @@ -61,6 +61,17 @@ EXPORT_SYMBOL(cpumask_of_node);
>  
>  #endif
>  
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +int _cpu_to_node(int cpu)
> +{
> +	return per_cpu(numa_node, cpu);
> +}
> +int (*cpu_to_node)(int cpu);
> +EXPORT_SYMBOL(cpu_to_node);
> +#endif
> +#endif
> +
>  static void numa_update_cpu(unsigned int cpu, bool remove)
>  {
>  	int nid = cpu_to_node(cpu);
> diff --git a/include/linux/topology.h b/include/linux/topology.h
> index 52f5850730b3..e7ce2bae11dd 100644
> --- a/include/linux/topology.h
> +++ b/include/linux/topology.h
> @@ -91,10 +91,8 @@ static inline int numa_node_id(void)
>  #endif
>  
>  #ifndef cpu_to_node
> -static inline int cpu_to_node(int cpu)
> -{
> -	return per_cpu(numa_node, cpu);
> -}
> +extern int (*cpu_to_node)(int cpu);
> +extern int _cpu_to_node(int cpu);
>  #endif
>  
>  #ifndef set_numa_node
> diff --git a/init/main.c b/init/main.c
> index e24b0780fdff..b142e9c51161 100644
> --- a/init/main.c
> +++ b/init/main.c
> @@ -870,6 +870,18 @@ static void __init print_unknown_bootoptions(void)
>  	memblock_free(unknown_options, len);
>  }
>  
> +static void __init smp_prepare_boot_cpu_start(void)
> +{
> +	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	/* The early_cpu_to_node should be ready now. */
> +	cpu_to_node = early_cpu_to_node;
> +#endif
> +#endif
> +}
> +
>  asmlinkage __visible __init __no_sanitize_address __noreturn __no_stack_protector
>  void start_kernel(void)
>  {
> @@ -899,7 +911,7 @@ void start_kernel(void)
>  	setup_command_line(command_line);
>  	setup_nr_cpu_ids();
>  	setup_per_cpu_areas();
> -	smp_prepare_boot_cpu();	/* arch-specific boot-cpu hooks */
> +	smp_prepare_boot_cpu_start();
>  	boot_cpu_hotplug_init();
>  
>  	pr_notice("Kernel command line: %s\n", saved_command_line);
> @@ -1519,6 +1531,19 @@ void __init console_on_rootfs(void)
>  	fput(file);
>  }
>  
> +static void __init smp_prepare_cpus_done(unsigned int setup_max_cpus)
> +{
> +	/* Different ARCHs may override smp_prepare_cpus() */
> +	smp_prepare_cpus(setup_max_cpus);
> +
> +#ifdef CONFIG_USE_PERCPU_NUMA_NODE_ID
> +#ifndef cpu_to_node
> +	/* Change to the formal function. */
> +	cpu_to_node = _cpu_to_node;
> +#endif
> +#endif
> +}
> +
>  static noinline void __init kernel_init_freeable(void)
>  {
>  	/* Now the scheduler is fully set up and can do blocking allocations */
> @@ -1531,7 +1556,7 @@ static noinline void __init kernel_init_freeable(void)
>  
>  	cad_pid = get_pid(task_pid(current));
>  
> -	smp_prepare_cpus(setup_max_cpus);
> +	smp_prepare_cpus_done(setup_max_cpus);
>  
>  	workqueue_init();
>  
> -- 
> 2.40.1
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
