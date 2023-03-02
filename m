Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64D1AC6FA8E
	for <linux-riscv@archiver.kernel.org>; Thu,  2 Mar 2023 03:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lhIkm9QS2pSmQIBmrirCb/v2nmjm47gUR8VzxtQKoCk=; b=y/uXBJuPqfkKWj
	zGLTiOj+HKOO0ZYnqr7XikOtiFbHugN9EXn8XhPl85T64Ln9mTLbBNEp6DN+/KpUVC9q0+PBeyS9L
	5TZwt4pxLVrHdcPOdHKh6byi0nDIJ8+d38PohUpbAxxzLJ41gkssxpOcyuROPGVESGnLqR8awRpMH
	W2ZEvbqZwe7emiIT/x598Hugrn0NwbhWYzfjWt71Xyn8bt5y6iQ7au8cL4LhSHhAmz56Yz8+pIJfu
	TnXk3uznlKoH5XbCI64w/iysKMaJ2YX7Bc8J0/hKv7c7ajcAMt7g3Bpx+EyRwH39voVfMOSq0PfMX
	FmiCmXezrJQdh0TyN+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZiy-000hGl-Ip; Thu, 02 Mar 2023 03:35:20 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pXZiu-000hG3-OI
	for linux-riscv@lists.infradead.org; Thu, 02 Mar 2023 03:35:18 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.53])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4PRxYP2spPzrSMq;
	Thu,  2 Mar 2023 11:34:33 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Thu, 2 Mar
 2023 11:35:12 +0800
Date: Thu, 2 Mar 2023 11:34:52 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Conor Dooley <conor@kernel.org>
CC: <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
	<linux-riscv@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
	Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, <changbin.du@huawei.com>,
	<hw.huiwang@huawei.com>
Subject: Re: [PATCH v4] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20230302033452.jxuhl7cpwzozf22k@M910t>
References: <20230301223853.1444332-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230301223853.1444332-1-conor@kernel.org>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230301_193517_231877_A76D00C4 
X-CRM114-Status: GOOD (  39.79  )
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

Reviewed-by: Changbin Du <changbin.du@huawei.com>

On Wed, Mar 01, 2023 at 10:38:53PM +0000, Conor Dooley wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> We're currently using stop_machine() to update ftrace & kprobes, which
> means that the thread that takes text_mutex during may not be the same
> as the thread that eventually patches the code.  This isn't actually a
> race because the lock is still held (preventing any other concurrent
> accesses) and there is only one thread running during stop_machine(),
> but it does trigger a lockdep failure.
> 
> This patch just elides the lockdep check during stop_machine.
> 
> Fixes: c15ac4fd60d5 ("riscv/ftrace: Add dynamic function tracer support")
> Suggested-by: Steven Rostedt <rostedt@goodmis.org>
> Reported-by: Changbin Du <changbin.du@gmail.com>
> Signed-off-by: Palmer Dabbelt <palmerdabbelt@google.com>
> Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
> ---
> Changes since v3 [<20230215164317.727657-1-conor@kernel.org>]:
> * rename the flag to riscv_patch_in_stop_machine as it is being used for
>   kprobes & ftrace, and just looked a bit odd.
> * implement Changbin's suggestion of checking the lock is held in
>   patch_text(), rather than set the flag in callers of patch_text().
> 
> Changes since v2 [<20220322022331.32136-1-palmer@rivosinc.com>]:
> * rebase on riscv/for-next as it as been a year.
> * incorporate Changbin's suggestion that init_nop should take the lock
>   rather than call prepare() & post_process().
> 
> Changes since v1 [<20210506071041.417854-1-palmer@dabbelt.com>]:
> * Use ftrace_arch_ocde_modify_{prepare,post_process}() to set the flag.
>   I remember having a reason I wanted the function when I wrote the v1,
>   but it's been almost a year and I forget what that was -- maybe I was
>   just crazy, the patch was sent at midnight.
> * Fix DYNAMIC_FTRACE=n builds.
> ---
>  arch/riscv/include/asm/ftrace.h |  7 +++++++
>  arch/riscv/kernel/ftrace.c      | 15 +++++++++++++--
>  arch/riscv/kernel/patch.c       | 26 +++++++++++++++++++++++---
>  3 files changed, 43 insertions(+), 5 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 9e73922e1e2e..41e0f4aa5243 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -107,8 +107,15 @@ do {									\
>  struct dyn_ftrace;
>  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  #define ftrace_init_nop ftrace_init_nop
> +extern int riscv_patch_in_stop_machine;
>  #endif
>  
> +#else /* CONFIG_DYNAMIC_FTRACE */
> +
> +#ifndef __ASSEMBLY__
> +#define riscv_patch_in_stop_machine 0
>  #endif
>  
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>  #endif /* _ASM_RISCV_FTRACE_H */
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 5bff37af4770..00cb8d51a0ec 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -11,14 +11,25 @@
>  #include <asm/cacheflush.h>
>  #include <asm/patch.h>
>  
> +int riscv_patch_in_stop_machine;
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  void ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
>  {
>  	mutex_lock(&text_mutex);
> +
> +	/*
> +	 * The code sequences we use for ftrace can't be patched while the
> +	 * kernel is running, so we need to use stop_machine() to modify them
> +	 * for now.  This doesn't play nice with text_mutex, we use this flag
> +	 * to elide the check.
> +	 */
> +	riscv_patch_in_stop_machine = true;
>  }
>  
>  void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
>  {
> +	riscv_patch_in_stop_machine = false;
>  	mutex_unlock(&text_mutex);
>  }
>  
> @@ -107,9 +118,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
>  {
>  	int out;
>  
> -	ftrace_arch_code_modify_prepare();
> +	mutex_lock(&text_mutex);
>  	out = ftrace_make_nop(mod, rec, MCOUNT_ADDR);
> -	ftrace_arch_code_modify_post_process();
> +	mutex_unlock(&text_mutex);
>  
>  	return out;
>  }
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 765004b60513..eef1243f6844 100644
> --- a/arch/riscv/kernel/patch.c
> +++ b/arch/riscv/kernel/patch.c
> @@ -11,6 +11,7 @@
>  #include <asm/kprobes.h>
>  #include <asm/cacheflush.h>
>  #include <asm/fixmap.h>
> +#include <asm/ftrace.h>
>  #include <asm/patch.h>
>  
>  struct patch_insn {
> @@ -59,8 +60,15 @@ static int patch_insn_write(void *addr, const void *insn, size_t len)
>  	 * Before reaching here, it was expected to lock the text_mutex
>  	 * already, so we don't need to give another lock here and could
>  	 * ensure that it was safe between each cores.
> +	 *
> +	 * We're currently using stop_machine() for ftrace & kprobes, and while
> +	 * that ensures text_mutex is held before installing the mappings it
> +	 * does not ensure text_mutex is held by the calling thread.  That's
> +	 * safe but triggers a lockdep failure, so just elide it for that
> +	 * specific case.
>  	 */
> -	lockdep_assert_held(&text_mutex);
> +	if (!riscv_patch_in_stop_machine)
> +		lockdep_assert_held(&text_mutex);
>  
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);
> @@ -121,13 +129,25 @@ NOKPROBE_SYMBOL(patch_text_cb);
>  
>  int patch_text(void *addr, u32 insn)
>  {
> +	int ret;
>  	struct patch_insn patch = {
>  		.addr = addr,
>  		.insn = insn,
>  		.cpu_count = ATOMIC_INIT(0),
>  	};
>  
> -	return stop_machine_cpuslocked(patch_text_cb,
> -				       &patch, cpu_online_mask);
> +	/*
> +	 * kprobes takes text_mutex, before calling patch_text(), but as we call
> +	 * calls stop_machine(), the lockdep assertion in patch_insn_write()
> +	 * gets confused by the context in which the lock is taken.
> +	 * Instead, ensure the lock is held before calling stop_machine(), and
> +	 * set riscv_patch_in_stop_machine to skip the check in
> +	 * patch_insn_write().
> +	 */
> +	lockdep_assert_held(&text_mutex);
> +	riscv_patch_in_stop_machine = true;
> +	ret = stop_machine_cpuslocked(patch_text_cb, &patch, cpu_online_mask);
> +	riscv_patch_in_stop_machine = false;
> +	return ret;
>  }
>  NOKPROBE_SYMBOL(patch_text);
> -- 
> 2.39.2
> 
> 
> _______________________________________________
> linux-riscv mailing list
> linux-riscv@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-riscv
> 

-- 
Cheers,
Changbin Du

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
