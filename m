Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9223AC04FFE
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Apr 2024 13:48:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V4KNWoqnPLb+8jCmR27ZLRX1iLHpTyf2uV7vHl/Zeas=; b=KROsCpiljWGFPk
	Ym0f6BUhdfu7FeUlNrQ7JmwUnO8lU+4fmDsWWj3dDPv081mq50Af8mPSkuXnmVY/COsVjdCck6Lej
	uZA2kG3XTFDeRfJP0yASVvTR9L0bk5tp3OFge4h3NPH1EsWNLm0Fx7TIMebaKKXbUZbraoBQjKNXA
	1s0GQ41Iinnr+/U18AHAb15fQXMZs4aUayOMJ+LB+GwWeSrDfj40Za1Ft1Kh/zOc7EPxyog5noXnA
	T7rpKGG1o+aDVf5YNegvXFJeaTuzXXQXHxEBxxKZLWQwPjfF8tDXNNTV/gXu3BUYO+bMxaoIeR0Rh
	SZQKr7pukFOkyMFkIrag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RMh-00000002znc-0MYI;
	Mon, 29 Apr 2024 13:48:19 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1RMe-00000002zkk-0AEc
	for linux-riscv@lists.infradead.org;
	Mon, 29 Apr 2024 13:48:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7009ACE0B94;
	Mon, 29 Apr 2024 13:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 427D1C113CD;
	Mon, 29 Apr 2024 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714398492;
	bh=2OmxYBcG8kYWa15/HKPOVgxwdgSzJ8/xMevqt/hqwIo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=lyORC9o2Lm+u2avM+eOyj/ccYiyuxZQLnwqOF6FZV49QnzRN+Dcvvb8f+L/I+DIcc
	 bR6gzWrxR06bLVpEA1X1PfPHzCF0nDSdsFIGgv/R/Ztx7jvyn/LZvp5GTSxbA3X+Ea
	 5Q5++mVTUse/so5L++FV3pac1nAd6FyimPuc/dQPplc7m0nyf+JoSS48zL0c07gOKG
	 +Q9TxDTXUAv++YZPpMLvDQVzMH1VHt+BXIScwupTc1u15EnhRP870WSg23oHheSEFh
	 X/E2DhZuUkcbr1ov6EZLQFmBffBmxl2jf1fX5T3O6khvfYPOQWnrKD7j3rIrd7dwdJ
	 AMHlyJcx5ffMw==
Date: Mon, 29 Apr 2024 22:48:03 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, Mark Rutland
 <mark.rutland@arm.com>, Guo Ren <guoren@kernel.org>, Huacai Chen
 <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Nicholas
 Piggin <npiggin@gmail.com>, Christophe Leroy <christophe.leroy@csgroup.eu>,
 "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, "Naveen N. Rao"
 <naveen.n.rao@linux.ibm.com>, Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>, Christian Borntraeger
 <borntraeger@linux.ibm.com>, Sven Schnelle <svens@linux.ibm.com>, Thomas
 Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav
 Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 linux-kernel@vger.kernel.org, linux-trace-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, loongarch@lists.linux.dev,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org
Subject: Re: [PATCH] kprobe/ftrace: bail out if ftrace was killed
Message-Id: <20240429224803.49d420b514e22d51412e1602@kernel.org>
In-Reply-To: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
References: <20240426225834.993353-1-stephen.s.brennan@oracle.com>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_064816_580079_D8DD19AD 
X-CRM114-Status: GOOD (  28.48  )
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

Hi Stephen,

On Fri, 26 Apr 2024 15:58:34 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> If an error happens in ftrace, ftrace_kill() will prevent disarming
> kprobes. Eventually, the ftrace_ops associated with the kprobes will be
> freed, yet the kprobes will still be active, and when triggered, they
> will use the freed memory, likely resulting in a page fault and panic.

Hmm, indeed.

> 
> This behavior can be reproduced quite easily, by creating a kprobe and
> then triggering a ftrace_kill(). For simplicity, we can simulate an
> ftrace error with a kernel module like [1]:
> 
> [1]: https://github.com/brenns10/kernel_stuff/tree/master/ftrace_killer
> 
>   sudo perf probe --add commit_creds
>   sudo perf trace -e probe:commit_creds
>   # In another terminal
>   make
>   sudo insmod ftrace_killer.ko  # calls ftrace_kill(), simulating bug
>   # Back to perf terminal
>   # ctrl-c
>   sudo perf probe --del commit_creds
> 
> After a short period, a page fault and panic would occur as the kprobe
> continues to execute and uses the freed ftrace_ops. While ftrace_kill()
> is supposed to be used only in extreme circumstances, it is invoked in
> FTRACE_WARN_ON() and so there are many places where an unexpected bug
> could be triggered, yet the system may continue operating, possibly
> without the administrator noticing. If ftrace_kill() does not panic the
> system, then we should do everything we can to continue operating,
> rather than leave a ticking time bomb.

OK, the patch looks good to me.

Acked-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thanks!

> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
> 
> Apologies for the wide net cast here. I recognize that a change like this
> may need to be split up and go through arch-specific trees. I hoped to get
> feedback on the patch itself. If it's satisfactory and the architecture
> maintainers prefer it split out, I'm glad to do it. Thanks!
> 
>  arch/csky/kernel/probes/ftrace.c     | 3 +++
>  arch/loongarch/kernel/ftrace_dyn.c   | 3 +++
>  arch/parisc/kernel/ftrace.c          | 3 +++
>  arch/powerpc/kernel/kprobes-ftrace.c | 3 +++
>  arch/riscv/kernel/probes/ftrace.c    | 3 +++
>  arch/s390/kernel/ftrace.c            | 3 +++
>  arch/x86/kernel/kprobes/ftrace.c     | 3 +++
>  include/linux/ftrace.h               | 2 ++
>  8 files changed, 23 insertions(+)
> 
> diff --git a/arch/csky/kernel/probes/ftrace.c b/arch/csky/kernel/probes/ftrace.c
> index 834cffcfbce3..3931bf9f707b 100644
> --- a/arch/csky/kernel/probes/ftrace.c
> +++ b/arch/csky/kernel/probes/ftrace.c
> @@ -12,6 +12,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe_ctlblk *kcb;
>  	struct pt_regs *regs;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/loongarch/kernel/ftrace_dyn.c b/arch/loongarch/kernel/ftrace_dyn.c
> index 73858c9029cc..82c952cb5be0 100644
> --- a/arch/loongarch/kernel/ftrace_dyn.c
> +++ b/arch/loongarch/kernel/ftrace_dyn.c
> @@ -287,6 +287,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	struct kprobe_ctlblk *kcb;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/parisc/kernel/ftrace.c b/arch/parisc/kernel/ftrace.c
> index 621a4b386ae4..3660834f54c3 100644
> --- a/arch/parisc/kernel/ftrace.c
> +++ b/arch/parisc/kernel/ftrace.c
> @@ -206,6 +206,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/powerpc/kernel/kprobes-ftrace.c b/arch/powerpc/kernel/kprobes-ftrace.c
> index 072ebe7f290b..85eb55aa1457 100644
> --- a/arch/powerpc/kernel/kprobes-ftrace.c
> +++ b/arch/powerpc/kernel/kprobes-ftrace.c
> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long nip, unsigned long parent_nip,
>  	struct pt_regs *regs;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(nip, parent_nip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/riscv/kernel/probes/ftrace.c b/arch/riscv/kernel/probes/ftrace.c
> index 7142ec42e889..8814fbe4c888 100644
> --- a/arch/riscv/kernel/probes/ftrace.c
> +++ b/arch/riscv/kernel/probes/ftrace.c
> @@ -11,6 +11,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe_ctlblk *kcb;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/s390/kernel/ftrace.c b/arch/s390/kernel/ftrace.c
> index c46381ea04ec..ccbe8ccf945b 100644
> --- a/arch/s390/kernel/ftrace.c
> +++ b/arch/s390/kernel/ftrace.c
> @@ -296,6 +296,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe *p;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/arch/x86/kernel/kprobes/ftrace.c b/arch/x86/kernel/kprobes/ftrace.c
> index dd2ec14adb77..c73f9ab7ff50 100644
> --- a/arch/x86/kernel/kprobes/ftrace.c
> +++ b/arch/x86/kernel/kprobes/ftrace.c
> @@ -21,6 +21,9 @@ void kprobe_ftrace_handler(unsigned long ip, unsigned long parent_ip,
>  	struct kprobe_ctlblk *kcb;
>  	int bit;
>  
> +	if (unlikely(ftrace_is_dead()))
> +		return;
> +
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (bit < 0)
>  		return;
> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 54d53f345d14..ba83e99c1fbe 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -399,6 +399,7 @@ int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *a
>  #define register_ftrace_function(ops) ({ 0; })
>  #define unregister_ftrace_function(ops) ({ 0; })
>  static inline void ftrace_kill(void) { }
> +static inline int ftrace_is_dead(void) { return 0; }
>  static inline void ftrace_free_init_mem(void) { }
>  static inline void ftrace_free_mem(struct module *mod, void *start, void *end) { }
>  static inline int ftrace_lookup_symbols(const char **sorted_syms, size_t cnt, unsigned long *addrs)
> @@ -914,6 +915,7 @@ static inline bool is_ftrace_trampoline(unsigned long addr)
>  
>  /* totally disable ftrace - can not re-enable after this */
>  void ftrace_kill(void);
> +int ftrace_is_dead(void);
>  
>  static inline void tracer_disable(void)
>  {
> -- 
> 2.39.3
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
