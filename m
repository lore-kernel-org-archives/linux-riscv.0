Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F97C54E64
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Mar 2024 00:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LW3nK9t3H21TNfajlTLGaqH9uUbX6ugW8Y95kPbzMKA=; b=jI3FlVKyMuurc9
	1dffGdU5VzxPpdTDCScLty46QByfN4Q4AM7Hx8NMApSb+mRY7hzWgnVN8GrrL/FUDeqAvh8cSo1Lm
	0Ry+PmDpmzmrGZ26dEZ9iubK6nugM+3iZEduNAQ2j11Ok5L3v2qzKuclYdTp1Mju9eI1D7RYLOdA1
	coV9yzuEq5GDN1XxByMa4g5rTeLvx5LutBKW/Mt9LttheK2+6Ed1CedgUYHjeg2evNwiEaZooCeok
	gkh6S4WtwhexTORnykmKcBrWm37Ss4JDoXlAVlL3h/1o0KH9mZrn/qaHcZmkipwAKGQk8PkQar7x/
	N7XLWV8qIhV7mZwXnrSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rov9M-00000002Z1v-17FI;
	Tue, 26 Mar 2024 00:58:48 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rov9I-00000002Z0p-1r9e
	for linux-riscv@lists.infradead.org;
	Tue, 26 Mar 2024 00:58:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 3180ACE1DC2;
	Tue, 26 Mar 2024 00:58:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B506AC433F1;
	Tue, 26 Mar 2024 00:58:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711414721;
	bh=ZgrP8MpHzoNve7A8nppVCLKTKCEDf09JrPVPfzzGAp4=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=l2wu+PcVtBv6ZNWEsZaHx+JqsYjnx/nIN7SFMQh+dxVkcQXd4WJ1xN/2mmvxpvSI/
	 9jF2Z5AWOHOHd1znNp6lXZDHK0f1K9wcwna6BFyJXCzGVYP9TNScTK3cQghkv740nn
	 rShKhJ/4ByTB0V5V2a79lPVbj2nVn7+or2pgaA8LKEGAcVMjOc/JMAfeTCHm02CBqK
	 4q4TJ3Klvm3tsoi/274nMa4taZAFAn7+Y0i2UeiXZQ9jcoriYb1gdA1/7g+nLfBhq6
	 c5ViivsZqEGL7DjaIiCF2rzB1vXLNJ7Fgl5dPsaUs0CpGbQssgoo3exY1yx+uz0o1E
	 vt05Q64L4s7pA==
Date: Tue, 26 Mar 2024 09:58:36 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: linux-riscv@lists.infradead.org, Masami Hiramatsu <mhiramat@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-kernel@vger.kernel.org, Luis Chamberlain <mcgrof@kernel.org>,
 linux-modules@vger.kernel.org, "Naveen N . Rao"
 <naveen.n.rao@linux.ibm.com>, Anil S Keshavamurthy
 <anil.s.keshavamurthy@intel.com>, "David S . Miller" <davem@davemloft.net>
Subject: Re: [PATCH v5 1/2] kprobes: textmem API
Message-Id: <20240326095836.f43d259b7747269a7c0b9d23@kernel.org>
In-Reply-To: <20240325215502.660-1-jarkko@kernel.org>
References: <20240325215502.660-1-jarkko@kernel.org>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240325_175844_874210_169E4F18 
X-CRM114-Status: GOOD (  39.61  )
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

On Mon, 25 Mar 2024 23:55:01 +0200
Jarkko Sakkinen <jarkko@kernel.org> wrote:

> Tracing with kprobes while running a monolithic kernel is currently
> impossible because CONFIG_KPROBES depends on CONFIG_MODULES because it uses
> the kernel module allocator.
> 
> Introduce alloc_textmem() and free_textmem() for allocating executable
> memory. If an arch implements these functions, it can mark this up with
> the HAVE_ALLOC_EXECMEM kconfig flag.
> 
> At first this feature will be used for enabling kprobes without
> modules support for arch/riscv.
> 
> Link: https://lore.kernel.org/all/20240325115632.04e37297491cadfbbf382767@kernel.org/
> Suggested-by: Masami Hiramatsu <mhiramat@kernel.org>
> Signed-off-by: Jarkko Sakkinen <jarkko@kernel.org>
> ---
> v5:
> - alloc_execmem() was missing GFP_KERNEL parameter. The patch set did
>   compile because 2/2 had the fixup (leaked there when rebasing the
>   patch set).
> v4:
> - Squashed a couple of unrequired CONFIG_MODULES checks.
> - See https://lore.kernel.org/all/D034M18D63EC.2Y11D954YSZYK@kernel.org/
> v3:
> - A new patch added.
> - For IS_DEFINED() I need advice as I could not really find that many
>   locations where it would be applicable.
> ---
>  arch/Kconfig                | 16 +++++++++++++++-
>  include/linux/execmem.h     | 13 +++++++++++++
>  kernel/kprobes.c            | 17 ++++++++++++++---
>  kernel/trace/trace_kprobe.c |  8 ++++++++
>  4 files changed, 50 insertions(+), 4 deletions(-)
>  create mode 100644 include/linux/execmem.h
> 
> diff --git a/arch/Kconfig b/arch/Kconfig
> index a5af0edd3eb8..33ba68b7168f 100644
> --- a/arch/Kconfig
> +++ b/arch/Kconfig
> @@ -52,8 +52,8 @@ config GENERIC_ENTRY
>  
>  config KPROBES
>  	bool "Kprobes"
> -	depends on MODULES
>  	depends on HAVE_KPROBES
> +	select ALLOC_EXECMEM
>  	select KALLSYMS
>  	select TASKS_RCU if PREEMPTION
>  	help
> @@ -215,6 +215,20 @@ config HAVE_OPTPROBES
>  config HAVE_KPROBES_ON_FTRACE
>  	bool
>  
> +config HAVE_ALLOC_EXECMEM
> +	bool
> +	help
> +	  Architectures that select this option are capable of allocating executable
> +	  memory, which can be used by subsystems but is not dependent of any of its
> +	  clients.
> +
> +config ALLOC_EXECMEM
> +	bool "Executable (trampoline) memory allocation"
> +	depends on MODULES || HAVE_ALLOC_EXECMEM
> +	help
> +	  Select this for executable (trampoline) memory. Can be enabled when either
> +	  module allocator or arch-specific allocator is available.
> +
>  config ARCH_CORRECT_STACKTRACE_ON_KRETPROBE
>  	bool
>  	help
> diff --git a/include/linux/execmem.h b/include/linux/execmem.h
> new file mode 100644
> index 000000000000..ae2ff151523a
> --- /dev/null
> +++ b/include/linux/execmem.h
> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +#ifndef _LINUX_EXECMEM_H
> +#define _LINUX_EXECMEM_H
> +
> +#ifdef CONFIG_HAVE_ALLOC_EXECMEM
> +void *alloc_execmem(unsigned long size, gfp_t gfp);
> +void free_execmem(void *region);
> +#else
> +#define alloc_execmem(size, gfp)	module_alloc(size)
> +#define free_execmem(region)		module_memfree(region)
> +#endif
> +
> +#endif /* _LINUX_EXECMEM_H */
> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 9d9095e81792..87fd8c14a938 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -44,6 +44,7 @@
>  #include <asm/cacheflush.h>
>  #include <asm/errno.h>
>  #include <linux/uaccess.h>
> +#include <linux/execmem.h>
>  
>  #define KPROBE_HASH_BITS 6
>  #define KPROBE_TABLE_SIZE (1 << KPROBE_HASH_BITS)
> @@ -113,17 +114,17 @@ enum kprobe_slot_state {
>  void __weak *alloc_insn_page(void)
>  {
>  	/*
> -	 * Use module_alloc() so this page is within +/- 2GB of where the
> +	 * Use alloc_execmem() so this page is within +/- 2GB of where the
>  	 * kernel image and loaded module images reside. This is required
>  	 * for most of the architectures.
>  	 * (e.g. x86-64 needs this to handle the %rip-relative fixups.)
>  	 */
> -	return module_alloc(PAGE_SIZE);
> +	return alloc_execmem(PAGE_SIZE, GFP_KERNEL);
>  }
>  
>  static void free_insn_page(void *page)
>  {
> -	module_memfree(page);
> +	free_execmem(page);
>  }
>  
>  struct kprobe_insn_cache kprobe_insn_slots = {
> @@ -1580,6 +1581,7 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  		goto out;
>  	}
>  
> +#ifdef CONFIG_MODULES

You don't need this block, because these APIs have dummy functions.

>  	/* Check if 'p' is probing a module. */
>  	*probed_mod = __module_text_address((unsigned long) p->addr);
>  	if (*probed_mod) {

So this block never be true if !CONFIG_MODULES automatically, and it should be
optimized out by compiler.

> @@ -1603,6 +1605,8 @@ static int check_kprobe_address_safe(struct kprobe *p,
>  			ret = -ENOENT;
>  		}
>  	}
> +#endif
> +
>  out:
>  	preempt_enable();
>  	jump_label_unlock();
> @@ -2482,6 +2486,7 @@ int kprobe_add_area_blacklist(unsigned long start, unsigned long end)
>  	return 0;
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Remove all symbols in given area from kprobe blacklist */
>  static void kprobe_remove_area_blacklist(unsigned long start, unsigned long end)
>  {
> @@ -2499,6 +2504,7 @@ static void kprobe_remove_ksym_blacklist(unsigned long entry)
>  {
>  	kprobe_remove_area_blacklist(entry, entry + 1);
>  }
> +#endif /* CONFIG_MODULES */

I think this block should be moved right before remove_module_kprobe_blacklist().
Then we can gather the code depending on modules in one place.

>  
>  int __weak arch_kprobe_get_kallsym(unsigned int *symnum, unsigned long *value,
>  				   char *type, char *sym)
> @@ -2564,6 +2570,7 @@ static int __init populate_kprobe_blacklist(unsigned long *start,
>  	return ret ? : arch_populate_kprobe_blacklist();
>  }
>  
> +#ifdef CONFIG_MODULES
>  static void add_module_kprobe_blacklist(struct module *mod)
>  {
>  	unsigned long start, end;
> @@ -2665,6 +2672,7 @@ static struct notifier_block kprobe_module_nb = {
>  	.notifier_call = kprobes_module_callback,
>  	.priority = 0
>  };
> +#endif /* CONFIG_MODULES */

So, keep the kprobe_module_nb outside of this #ifdef as I sed.


>  
>  void kprobe_free_init_mem(void)
>  {
> @@ -2724,8 +2732,11 @@ static int __init init_kprobes(void)
>  	err = arch_init_kprobes();
>  	if (!err)
>  		err = register_die_notifier(&kprobe_exceptions_nb);
> +
> +#ifdef CONFIG_MODULES
>  	if (!err)
>  		err = register_module_notifier(&kprobe_module_nb);
> +#endif

Then we don't need this #ifdef.

>  
>  	kprobes_initialized = (err == 0);
>  	kprobe_sysctls_init();
> diff --git a/kernel/trace/trace_kprobe.c b/kernel/trace/trace_kprobe.c
> index c4c6e0e0068b..af70bb1e9c3a 100644
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
> @@ -129,6 +130,9 @@ static nokprobe_inline bool trace_kprobe_module_exist(struct trace_kprobe *tk)
>  
>  	return ret;
>  }
> +#else
> +#define trace_kprobe_module_exist(tk) false /* aka a module never exists */
> +#endif /* CONFIG_MODULES */
>  
>  static bool trace_kprobe_is_busy(struct dyn_event *ev)
>  {
> @@ -670,6 +674,7 @@ static int register_trace_kprobe(struct trace_kprobe *tk)
>  	return ret;
>  }
>  
> +#ifdef CONFIG_MODULES
>  /* Module notifier call back, checking event on the module */
>  static int trace_kprobe_module_callback(struct notifier_block *nb,
>  				       unsigned long val, void *data)
> @@ -704,6 +709,7 @@ static struct notifier_block trace_kprobe_module_nb = {
>  	.notifier_call = trace_kprobe_module_callback,
>  	.priority = 1	/* Invoked after kprobe module callback */
>  };
> +#endif /* CONFIG_MODULES */

As I similar to the above, let's move trace_kprobe_module_nb outside
of #ifdef.

>  
>  static int count_symbols(void *data, unsigned long unused)
>  {
> @@ -1897,8 +1903,10 @@ static __init int init_kprobe_trace_early(void)
>  	if (ret)
>  		return ret;
>  
> +#ifdef CONFIG_MODULES
>  	if (register_module_notifier(&trace_kprobe_module_nb))
>  		return -EINVAL;
> +#endif /* CONFIG_MODULES */

And remove this #ifdef.

Thank you!

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
