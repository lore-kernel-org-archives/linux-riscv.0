Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF65FC47DD9
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Mar 2024 02:56:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4kOS0fSNE2Ma+beIps2ZkX8dSn68KhTL+BtJCFMcyE4=; b=F4kHaS7g2p38w3
	G/bgjvHPs63/2ow6ff48xA2XRSwP2oOyOWkY8poADZaAYvM0rq5QPWL1WHAj3IAJCNGHPO9XCKFVK
	BKFi/gpFRWNX5Q3iT7RXmy/dGI9KaqzbuPHwVZJnhglA1ayzi4UY4Xr4pSCrndvsC+h9mpZJX9DuT
	s4gTQjeqbF8qX+OLBAoRzK8y3EjLdWdiZNE4An+FPHCr4mgVriS+wFXT3OF6hriAfOVAngpHa76Tb
	hO1BEHdY90/YhX2MDmGj5AQWj7MrvR8HauxfePU4QRnV0tiBnv2Yj0oQN9L0xgpUMukGWQ2zZ6Rwg
	yiGznmspjb4LWSNzGHFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roaW3-0000000EmUt-3h66;
	Mon, 25 Mar 2024 02:56:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roaVz-0000000EmSg-48S0
	for linux-riscv@bombadil.infradead.org;
	Mon, 25 Mar 2024 02:56:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:Mime-Version:References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=MRpfwkLw8yh3XtTCVeBjtycVOkp+KWDfcVWDc2KERbU=; b=n2H/Wjgu01Lkgcc0vBGhXjR5jw
	L/sLVcsDeCfZtv9grfXHPd69oJ+xpMkZrmUNyUvw3bft9oWtX46Ku1+m0WDTctufTE4NIqdB+IkY7
	j7epd7A3KNSHUANa4cUVAk5pG9FcnCxNY7S9l8ksSavGcnxfR7qx+vVVlFZc1J+bxzEx5y7ElUef6
	dsKUJBWwitq3pf1WJa9DUf2xMgVGESL5KIMTvZpFA/Qjaa6h55xC4JU0KGPZwCRw1ywFrzX6UMkhI
	epCJHO2Cwt/xPXxpybras0/3LdUNr/Zj/eJUfjkVffxxgJviyxpcfKaneLA0Tq0aHWmG6yg+5GF6N
	ZNzKC3Eg==;
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1roaVv-0000000GMZ1-1H3e
	for linux-riscv@lists.infradead.org;
	Mon, 25 Mar 2024 02:56:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9024160AFF;
	Mon, 25 Mar 2024 02:56:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF26BC4166A;
	Mon, 25 Mar 2024 02:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711335397;
	bh=E4Gupy+0VVe9CrPx+0mwhOlgYTkTvmZYdnz0CfC1Lok=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=X1Dfb70qVYA9ARqb5qkFx37laM/St6cBAG6a4Ox29cQd3RGkzd3tQOKQOh0tNFMGF
	 4dhfKcXP7UITVsHE5K7Zw3GfxMs90OGzI5WsfiRLWr9wA6zYaEhF+CR2k6QcIOTHe1
	 /RahuwCvoQw7OgeEdPN4DQIvvBj01QYpaRYlnt7DB6MEXlEXStqETYZ8bHI71+GBGF
	 SSQPWVQUASiXzO6S3Iptc+UEcQcfS+Dvh05jUDMi6Fi0bDi6Mtigwyk6MMDQlMTHhE
	 sE+To8AMMxv3xh3p9sDpe36Vj6n5C5A2N35zKs4fGg2WZPZbSJxef0WgfWGXQLQxH8
	 5t7hTfFB2AFcw==
Date: Mon, 25 Mar 2024 11:56:32 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-riscv@lists.infradead.org, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
 <aou@eecs.berkeley.edu>, linux-kernel@vger.kernel.org, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>,
 Masami Hiramatsu <mhiramat@kernel.org>, linux-trace-kernel@vger.kernel.org,
 Calvin Owens <jcalvinowens@gmail.com>
Subject: Re: [PATCH v2] arch/riscv: Enable kprobes when CONFIG_MODULES=n
Message-Id: <20240325115632.04e37297491cadfbbf382767@kernel.org>
In-Reply-To: <20240323232908.13261-1-jarkko@kernel.org>
References: <20240323232908.13261-1-jarkko@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_025644_190776_AA90B56F 
X-CRM114-Status: GOOD (  35.42  )
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

Hi Jarkko,

On Sun, 24 Mar 2024 01:29:08 +0200
Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Tracing with kprobes while running a monolithic kernel is currently
> impossible due the kernel module allocator dependency.
> 
> Address the issue by allowing architectures to implement module_alloc()
> and module_memfree() independent of the module subsystem. An arch tree
> can signal this by setting HAVE_KPROBES_ALLOC in its Kconfig file.
> 
> Realize the feature on RISC-V by separating allocator to module_alloc.c
> and implementing module_memfree().

Even though, this involves changes in arch-independent part. So it should
be solved by generic way. Did you checked Calvin's thread?

https://lore.kernel.org/all/cover.1709676663.git.jcalvinowens@gmail.com/

I think, we'd better to introduce `alloc_execmem()`,
CONFIG_HAVE_ALLOC_EXECMEM and CONFIG_ALLOC_EXECMEM at first

  config HAVE_ALLOC_EXECMEM
	bool

  config ALLOC_EXECMEM
	bool "Executable trampline memory allocation"
	depends on MODULES || HAVE_ALLOC_EXECMEM

And define fallback macro to module_alloc() like this.

#ifndef CONFIG_HAVE_ALLOC_EXECMEM
#define alloc_execmem(size, gfp)	module_alloc(size)
#endif

Then, introduce a new dependency to kprobes

  config KPROBES
  	bool "Kprobes"
	select ALLOC_EXECMEM

and update kprobes to use alloc_execmem and remove module related
code from it.

You also should consider using IS_ENABLED(CONFIG_MODULE) in the code to
avoid using #ifdefs.

Finally, you can add RISCV implementation patch of HAVE_ALLOC_EXECMEM in the
next patch.

Thank you,


> 
> Link: https://www.sochub.fi # for power on testing new SoC's with a minimal stack
> Link: https://lore.kernel.org/all/20220608000014.3054333-1-jarkko@profian.com/ # continuation
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v2:
> - Better late than never right? :-)
> - Focus only to RISC-V for now to make the patch more digestable. This
>   is the arch where I use the patch on a daily basis to help with QA.
> - Introduce HAVE_KPROBES_ALLOC flag to help with more gradual migration.
> ---
>  arch/Kconfig                     |  8 +++++++-
>  arch/riscv/Kconfig               |  1 +
>  arch/riscv/kernel/Makefile       |  5 +++++
>  arch/riscv/kernel/module.c       | 11 -----------
>  arch/riscv/kernel/module_alloc.c | 28 ++++++++++++++++++++++++++++
>  kernel/kprobes.c                 | 10 ++++++++++
>  kernel/trace/trace_kprobe.c      | 18 ++++++++++++++++--
>  7 files changed, 67 insertions(+), 14 deletions(-)
>  create mode 100644 arch/riscv/kernel/module_alloc.c
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index a5af0edd3eb8..c931f1de98a7 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -52,7 +52,7 @@ config GENERIC_ENTRY
>  
>  config KPROBES
>  	bool "Kprobes"
> -	depends on MODULES
> +	depends on MODULES || HAVE_KPROBES_ALLOC
>  	depends on HAVE_KPROBES
>  	select KALLSYMS
>  	select TASKS_RCU if PREEMPTION
> @@ -215,6 +215,12 @@ config HAVE_OPTPROBES
>  config HAVE_KPROBES_ON_FTRACE
>  	bool
>  
> +config HAVE_KPROBES_ALLOC
> +	bool
> +	help
> +	  Architectures that select this option are capable of allocating memory
> +	  for kprobes withou the kernel module allocator.
> +
>  config ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	bool
>  	help
> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
> index e3142ce531a0..4f1b925e83d8 100644
> --- a/arch/riscv/Kconfig
> +++ b/arch/riscv/Kconfig
> @@ -132,6 +132,7 @@ config RISCV
>  	select HAVE_KPROBES if !XIP_KERNEL
>  	select HAVE_KPROBES_ON_FTRACE if !XIP_KERNEL
>  	select HAVE_KRETPROBES if !XIP_KERNEL
> +	select HAVE_KPROBES_ALLOC if !XIP_KERNEL
>  	# https://github.com/ClangBuiltLinux/linux/issues/1881
>  	select HAVE_LD_DEAD_CODE_DATA_ELIMINATION if !LD_IS_LLD
>  	select HAVE_MOVE_PMD
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index 604d6bf7e476..46318194bce1 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -73,6 +73,11 @@ obj-$(CONFIG_SMP)		+= cpu_ops.o
>  
>  obj-$(CONFIG_RISCV_BOOT_SPINWAIT) += cpu_ops_spinwait.o
>  obj-$(CONFIG_MODULES)		+= module.o
> +ifeq ($(CONFIG_MODULES),y)
> +obj-y				+= module_alloc.o
> +else
> +obj-$(CONFIG_KPROBES)		+= module_alloc.o
> +endif
>  obj-$(CONFIG_MODULE_SECTIONS)	+= module-sections.o
>  
>  obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
> diff --git a/arch/riscv/kernel/module.c b/arch/riscv/kernel/module.c
> index 5e5a82644451..cc324b450f2e 100644
> --- a/arch/riscv/kernel/module.c
> +++ b/arch/riscv/kernel/module.c
> @@ -905,17 +905,6 @@ int apply_relocate_add(Elf_Shdr *sechdrs, const char *strtab,
>  	return 0;
>  }
>  
> -#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> -void *module_alloc(unsigned long size)
> -{
> -	return __vmalloc_node_range(size, 1, MODULES_VADDR,
> -				    MODULES_END, GFP_KERNEL,
> -				    PAGE_KERNEL, VM_FLUSH_RESET_PERMS,
> -				    NUMA_NO_NODE,
> -				    __builtin_return_address(0));
> -}
> -#endif
> -
>  int module_finalize(const Elf_Ehdr *hdr,
>  		    const Elf_Shdr *sechdrs,
>  		    struct module *me)
> diff --git a/arch/riscv/kernel/module_alloc.c b/arch/riscv/kernel/module_alloc.c
> new file mode 100644
> index 000000000000..3d9aa8dbca8a
> --- /dev/null
> +++ b/arch/riscv/kernel/module_alloc.c
> @@ -0,0 +1,28 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + *  Copyright (c) 2017 Zihao Yu
> + *  Copyright (c) 2024 Jarkko Sakkinen
> + */
> +
> +#include <linux/mm.h>
> +#include <linux/moduleloader.h>
> +#include <linux/vmalloc.h>
> +#include <asm/sections.h>
> +
> +#if defined(CONFIG_MMU) && defined(CONFIG_64BIT)
> +void *module_alloc(unsigned long size)
> +{
> +	return __vmalloc_node_range(size, 1, MODULES_VADDR,
> +				    MODULES_END, GFP_KERNEL,
> +				    PAGE_KERNEL, 0, NUMA_NO_NODE,
> +				    __builtin_return_address(0));
> +}
> +
> +void module_memfree(void *module_region)
> +{
> +	if (in_interrupt())
> +		pr_warn("In interrupt context: vmalloc may not work.\n");
> +
> +	vfree(module_region);
> +}
> +#endif
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 9d9095e81792..2c583ab6efc4 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -1580,6 +1580,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  		goto out;
>  	}
>  
> +#ifdef CONFIG_MODULES
>  	/* Check if 'p' is probing a module. */
>  	*probed_mod = __module_text_address((unsigned long) p->addr);
>  	if (*probed_mod) {
> @@ -1603,6 +1604,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  			ret = -ENOENT;
>  		}
>  	}
> +#endif
> +
>  out:
>  	preempt_enable();
>  	jump_label_unlock();
> @@ -2482,6 +2485,7 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Remove all symbols in given area from kprobe blacklist */
>  static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
>  {
> @@ -2499,6 +2503,7 @@ static void kprobe_remove_ksym_blacklist(unsigned long entry)
>  {
>  	kprobe_remove_area_blacklist(entry, entry + 1);
>  }
> +#endif /* CONFIG_MODULES */
>  
>  int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
>  				   char *type, char *sym)
> @@ -2564,6 +2569,7 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
>  	return ret ? : arch_populate_kprobe_blacklist();
>  }
>  
> +#ifdef CONFIG_MODULES
>  static void add_module_kprobe_blacklist(struct module *mod)
>  {
>  	unsigned long start, end;
> @@ -2665,6 +2671,7 @@ static struct notifier_block kprobe_module_nb = {
>  	.notifier_call = kprobes_module_callback,
>  	.priority = 0
>  };
> +#endif /* CONFIG_MODULES */
>  
>  void kprobe_free_init_mem(void)
>  {
> @@ -2724,8 +2731,11 @@ static int __init init_kprobes(void)
>  	err = arch_init_kprobes();
>  	if (!err)
>  		err = register_die_notifier(&kprobe_exceptions_nb);
> +
> +#ifdef CONFIG_MODULES
>  	if (!err)
>  		err = register_module_notifier(&kprobe_module_nb);
> +#endif
>  
>  	kprobes_initialized = (err == 0);
>  	kprobe_sysctls_init();
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index c4c6e0e0068b..f8fbd5e76dda 100644
> --- a/kernel/trace/trace_kprobe.c
> +++ b/kernel/trace/trace_kprobe.c
> @@ -111,6 +111,7 @@ static nokprobe_inline bool trace_kprobe_within_module(struct trace_kprobe *tk,
>  	return strncmp(module_name(mod), name, len) == 0 && name[len] == ':';
>  }
>  
> +#ifdef CONFIG_MODULES
>  static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  {
>  	char *p;
> @@ -129,6 +130,7 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  
>  	return ret;
>  }
> +#endif /* CONFIG_MODULES */
>  
>  static bool trace_kprobe_is_busy(struct dyn_event *ev)
>  {
> @@ -608,7 +610,11 @@ static int append_trace_kprobe(struct trace_kprobe *tk, struct trace_kprobe *to)
>  
>  	/* Register k*probe */
>  	ret = __register_trace_kprobe(tk);
> -	if (ret == -ENOENT && !trace_kprobe_module_exist(tk)) {
> +#ifdef CONFIG_MODULES
> +	if (ret == -ENOENT && trace_kprobe_module_exist(tk))
> +		ret = 0;
> +#endif /* CONFIG_MODULES */
> +	if (ret == -ENOENT) {
>  		pr_warn("This probe might be able to register after target module is loaded. Continue.\n");
>  		ret = 0;
>  	}
> @@ -655,7 +661,11 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
>  
>  	/* Register k*probe */
>  	ret = __register_trace_kprobe(tk);
> -	if (ret == -ENOENT && !trace_kprobe_module_exist(tk)) {
> +#ifdef CONFIG_MODULES
> +	if (ret == -ENOENT && trace_kprobe_module_exist(tk))
> +		ret = 0;
> +#endif /* CONFIG_MODULES */
> +	if (ret == -ENOENT) {
>  		pr_warn("This probe might be able to register after target module is loaded. Continue.\n");
>  		ret = 0;
>  	}
> @@ -670,6 +680,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Module notifier call back, checking event on the module */
>  static int trace_kprobe_module_callback(struct notifier_block *nb,
>  				       unsigned long val, void *data)
> @@ -704,6 +715,7 @@ static struct notifier_block trace_kprobe_module_nb = {
>  	.notifier_call = trace_kprobe_module_callback,
>  	.priority = 1	/* Invoked after kprobe module callback */
>  };
> +#endif /* CONFIG_MODULES */
>  
>  static int count_symbols(void *data, unsigned long unused)
>  {
> @@ -1897,8 +1909,10 @@ static __init int init_kprobe_trace_early(void)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_MODULES
>  	if (register_module_notifier(&trace_kprobe_module_nb))
>  		return -EINVAL;
> +#endif /* CONFIG_MODULES */
>  
>  	return 0;
>  }
> -- 
> 2.44.0
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
