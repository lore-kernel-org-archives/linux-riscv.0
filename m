Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 271E7C43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 06:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sa2S/UYCYckcRERguBFmkG7LqqMZ8r8U4Iy+CbgoDug=; b=F/8El8jN1RAlfc
	wF0EUApshsRLUlYwix13E0zlOXYlrAotTUjUU8KDHydQJPpnk+QDKZ3qhy5xkGWrPAyzqSoBvqa+t
	/66nHaqhvYlYgGf6wKcQinm1SrtUl9yQDP8DJM16xbRNRnx6bYh0Gmi27cB/SrtRHfl9MG5ezqI4J
	66lsOBQjqbE2N5RgXQFn4VvIJWMnw9zOkll7kNqLFE1PIekCVFyX9kBH5tZMspExz8tLNUHWGDzMd
	JBX/UTVPToAxx2XsTQlEEto/6Cu/NGKtEBeEUjmASIsMsNCNNSK/o9moHPv26czdUlo+Hu8zpdIxK
	h+jK95awrX8M00jo2qRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMFe-0000000GRwV-1Hcc;
	Wed, 08 Jul 2026 06:59:22 +0000
Received: from out30-101.freemail.mail.aliyun.com ([115.124.30.101])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whMFb-0000000GRw6-1Yzn
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 06:59:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783493957; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=VqOzBHcezIdJbCw9H20f4ApkMFhu+ojhnSlVxGo7tKM=;
	b=no+u8D2g1UUReVfqYg5XbJb+Zrp7Bju+RU/+EU3IFgomgM9/fDak3rlF30AFAXX44M/b1a8k7pHgZHnhXDlqHt6MD7kOW2c2u5BmzGhD8DsoQSulsYJxa3F/qBZj2AiHKoSZuKe1kDc3S1vGeSnNI0tPIbDTwVcFMOE1Sv0/Cy4=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R681e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X6gnBaq_1783493952;
Received: from 30.246.161.237(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X6gnBaq_1783493952 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 08 Jul 2026 14:59:14 +0800
Message-ID: <9228c07a-8879-41de-ba87-b9f879648ba8@linux.alibaba.com>
Date: Wed, 8 Jul 2026 14:59:11 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 4/7] riscv: stacktrace: introduce stack-bound
 tracking helpers
To: Wang Han <wanghan@linux.alibaba.com>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org,
 Oleg Nesterov <oleg@redhat.com>, Steven Rostedt <rostedt@goodmis.org>,
 Masami Hiramatsu <mhiramat@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
 Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Namhyung Kim <namhyung@kernel.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Jiri Olsa <jolsa@kernel.org>, Ian Rogers <irogers@google.com>,
 Adrian Hunter <adrian.hunter@intel.com>, James Clark
 <james.clark@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Shuah Khan <shuah@kernel.org>, oliver.yang@linux.alibaba.com,
 zhuo.song@linux.alibaba.com, jkchen@linux.alibaba.com,
 Marcos Paulo de Souza <mpdesouza@suse.com>, linux-kernel@vger.kernel.org,
 linux-trace-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org,
 live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260629072713.3273743-1-wanghan@linux.alibaba.com>
 <20260629072713.3273743-5-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260629072713.3273743-5-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_235919_772047_3CD86D26 
X-CRM114-Status: GOOD (  20.95  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org



On 6/29/26 3:27 PM, Wang Han wrote:
> A reliable unwinder needs to validate that every frame record it reads
> is fully contained in a known kernel stack, and it needs to refuse to
> walk back into a stack it has already left. Add the building blocks
> for that:
> 
>    * struct stack_info / struct unwind_state in a new
>      asm/stacktrace/common.h, modelled on the arm64 reference
>      implementation.
>    * stackinfo_get_irq() / stackinfo_get_task() / stackinfo_get_overflow()
>      plus the corresponding on_*_stack() predicates in asm/stacktrace.h,
>      so callers can ask "is this object on stack X?" by stack kind
>      rather than open-coded address arithmetic.
>    * unwind_init_common(), unwind_find_stack() and
>      unwind_consume_stack() helpers that enforce the
>      forward-progress-only invariant required for reliability.
> 
> No existing user is wired up to these helpers in this commit; the
> unwinder switch comes in a follow-up. The header changes leave
> on_thread_stack() with the same semantics as before, just expressed in
> terms of the new helpers.
> 
> Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
> ---
>   arch/riscv/include/asm/stacktrace.h        |  65 ++++++++-
>   arch/riscv/include/asm/stacktrace/common.h | 159 +++++++++++++++++++++
>   2 files changed, 222 insertions(+), 2 deletions(-)
>   create mode 100644 arch/riscv/include/asm/stacktrace/common.h
> 
> diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
> index b1495a7e06ce..bc87c4940379 100644
> --- a/arch/riscv/include/asm/stacktrace.h
> +++ b/arch/riscv/include/asm/stacktrace.h
> @@ -3,8 +3,13 @@
>   #ifndef _ASM_RISCV_STACKTRACE_H
>   #define _ASM_RISCV_STACKTRACE_H
>   
> +#include <linux/percpu.h>
>   #include <linux/sched.h>
> +#include <linux/sched/task_stack.h>
> +
> +#include <asm/irq_stack.h>
>   #include <asm/ptrace.h>
> +#include <asm/stacktrace/common.h>
>   
>   struct stackframe {
>   	unsigned long fp;
> @@ -16,14 +21,70 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
>   extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
>   			   const char *loglvl);
>   
> -static inline bool on_thread_stack(void)
> +/*
> + * IRQ stack accessors
> + */
> +static inline struct stack_info stackinfo_get_irq(void)
> +{
> +	unsigned long low = (unsigned long)raw_cpu_read(irq_stack_ptr);

 From https://sashiko.dev/#/patchset/20260629072713.3273743-1-wanghan%40linux.alibaba.com

Will this cause a link error when CONFIG_IRQ_STACKS is disabled?
Looking at arch/riscv/kernel/irq.c, irq_stack_ptr is defined inside an
#ifdef CONFIG_IRQ_STACKS block. Since stackinfo_get_irq() unconditionally
references it here, it seems this might result in an undefined reference
to irq_stack_ptr during linking.

Should this accessor be conditionally compiled, or should it provide a
fallback when CONFIG_IRQ_STACKS is not set?

Thanks.
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
