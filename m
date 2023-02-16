Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 175A0C61DA4
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Feb 2023 11:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:CC:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OqqWKSEHhlSmVYDVNyqOlhTGJINz3MXuOFaiPxpj/lE=; b=R+e3fH7wa8i23f
	IZnklnxyO7Z5q7dRHs2BylgWTZFBXffXjlPRDYiwS1XQWc3pnf5+xouaxoLAH9bd9+0XuQ/VCfoEK
	999kUbKoPX7ivAGt6VB1XKm8sUlOiFMRDd2aL9etUP68+cAeAKs4zFQRHVQ+kGWNTeG2EDZZxE1Ln
	OhIFpgqP7BNu8pZ5wnwHOIE72QYz+2Vph+1p5A6SATnb9EfrBuXj/AK+l4yKCuP/7Qn+DB/l5+l5h
	j5HWCPJJ3oU8RZl6KudDXoSbs6B0SwTVbxSQdAT12duAebkhEB0lqU9TnjCKXTGUDX3Zuyw6sbuE8
	F969OpMAvFBZuivLIwuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScUU-009wtp-Sn; Thu, 16 Feb 2023 11:31:54 +0000
Received: from szxga03-in.huawei.com ([45.249.212.189])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pScUR-009wsS-NC
	for linux-riscv@lists.infradead.org; Thu, 16 Feb 2023 11:31:54 +0000
Received: from kwepemi500013.china.huawei.com (unknown [172.30.72.53])
	by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4PHXj22TzbzFqRN;
	Thu, 16 Feb 2023 19:27:02 +0800 (CST)
Received: from M910t (10.110.54.157) by kwepemi500013.china.huawei.com
 (7.221.188.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.17; Thu, 16 Feb
 2023 19:31:46 +0800
Date: Thu, 16 Feb 2023 19:31:26 +0800
From: Changbin Du <changbin.du@huawei.com>
To: Conor Dooley <conor@kernel.org>
CC: <palmer@dabbelt.com>, Palmer Dabbelt <palmerdabbelt@google.com>,
	<linux-riscv@lists.infradead.org>, Steven Rostedt <rostedt@goodmis.org>,
	Changbin Du <changbin.du@gmail.com>, Palmer Dabbelt <palmer@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>, <changbin.du@huawei.com>
Subject: Re: [PATCH v3] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20230216113126.kio4uqovoo4p6ubm@M910t>
References: <20230215164317.727657-1-conor@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230215164317.727657-1-conor@kernel.org>
X-Originating-IP: [10.110.54.157]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemi500013.china.huawei.com (7.221.188.120)
X-CFilter-Loop: Reflected
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230216_033152_119835_03990005 
X-CRM114-Status: GOOD (  36.95  )
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

On Wed, Feb 15, 2023 at 04:43:17PM +0000, Conor Dooley wrote:
> From: Palmer Dabbelt <palmerdabbelt@google.com>
> 
> We're currently using stop_machine() to update ftrace, which means that
> the thread that takes text_mutex during ftrace_prepare() may not be the
> same as the thread that eventually patches the code.  This isn't
> actually a race because the lock is still held (preventing any other
> concurrent accesses) and there is only one thread running during
> stop_machine(), but it does trigger a lockdep failure.
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
> Resending this version as I am quite averse to deleting the assertion!
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
>  arch/riscv/kernel/patch.c       | 10 +++++++++-
>  3 files changed, 29 insertions(+), 3 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
> index 04dad3380041..3ac7609f4ee9 100644
> --- a/arch/riscv/include/asm/ftrace.h
> +++ b/arch/riscv/include/asm/ftrace.h
> @@ -81,8 +81,15 @@ do {									\
>  struct dyn_ftrace;
>  int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec);
>  #define ftrace_init_nop ftrace_init_nop
> +extern int riscv_ftrace_in_stop_machine;
>  #endif
>  
> +#else /* CONFIG_DYNAMIC_FTRACE */
> +
> +#ifndef __ASSEMBLY__
> +#define riscv_ftrace_in_stop_machine 0
>  #endif
>  
> +#endif /* CONFIG_DYNAMIC_FTRACE */
> +
>  #endif /* _ASM_RISCV_FTRACE_H */
> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 2086f6585773..661bfa72f359 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -11,14 +11,25 @@
>  #include <asm/cacheflush.h>
>  #include <asm/patch.h>
>  
> +int riscv_ftrace_in_stop_machine;
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
> +	riscv_ftrace_in_stop_machine = true;
>  }
>  
>  void ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
>  {
> +	riscv_ftrace_in_stop_machine = false;
>  	mutex_unlock(&text_mutex);
>  }
>  
> @@ -134,9 +145,9 @@ int ftrace_init_nop(struct module *mod, struct dyn_ftrace *rec)
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
> index 765004b60513..56b70271518d 100644
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
> +	 * We're currently using stop_machine() for ftrace, and while that
> +	 * ensures text_mutex is held before installing the mappings it does
> +	 * not ensure text_mutex is held by the calling thread.  That's safe
> +	 * but triggers a lockdep failure, so just elide it for that specific
> +	 * case.
>  	 */
> -	lockdep_assert_held(&text_mutex);
> +	if (!riscv_ftrace_in_stop_machine)
> +		lockdep_assert_held(&text_mutex);
>  
>  	if (across_pages)
>  		patch_map(addr + len, FIX_TEXT_POKE1);
This misses this function.

int patch_text(void *addr, u32 insn)
{
	struct patch_insn patch = {
		.addr = addr,
		.insn = insn,
		.cpu_count = ATOMIC_INIT(0),
	};

	return stop_machine_cpuslocked(patch_text_cb,
				       &patch, cpu_online_mask);
}

> -- 
> 2.39.1
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
