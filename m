Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7878EC43458
	for <linux-riscv@archiver.kernel.org>; Wed,  8 Jul 2026 08:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=qcfLmU2G32CUzq9EYqtSx5MoJ35BcQ9SONwRcFli+aQ=; b=PVemBNXCpz49/a
	yQuNfpNDPRXfNwTDoYpSjCPuqNTbSt2PdkfeFa2GKGnqNrzlUtGnODhhXHnmc2OB+ZDC+4X+ZTPeW
	y0qLJBWCnw783YFxZa+8qy0VpuWZgdX/+SAT91+37/4FGrOHPNsBnjojETv8V9mJBHOJCsWPDvsbK
	+bljBHJKm4N65gU5JGGvE+JmLM5uu0jTIxWhLl8JXpxoVqhGfY5sK/L1P1pyRO9L1ykOUd2VDjTU+
	AOx8QKp8VgwsBvkGiRrhU3qsNXEc6mXlJY+u+inAArIeEaienOBqVRu47esNHYdIp6wK9PamkVEJL
	ufXqGgUPdgFjCkVE1lTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNJW-0000000GaAC-0aFn;
	Wed, 08 Jul 2026 08:07:26 +0000
Received: from out30-97.freemail.mail.aliyun.com ([115.124.30.97])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whNJT-0000000Ga9i-0iPB
	for linux-riscv@lists.infradead.org;
	Wed, 08 Jul 2026 08:07:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1783498041; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=7aX7B+3xkHbNhiVcp4PAYQLzOnDUqkKktfRxNWYRSCI=;
	b=TSI9Owt9xFK3U5bQlUri1HJ35iDcK98p5Wj7bR1IfzPOqUOG7bGCt6Fsp9bgDmvdgAScS2KdXjeb9kjdFyM2WQj76YOjBenDgO7hHntCduFoTbHwu1GGE4ectC0NmrLSM5VqfFxrmHuWzFEDlvkLv7h/9YdIYUujG3Sds2psbeQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R101e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037009110;MF=xueshuai@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X6h5OsU_1783498037;
Received: from 30.246.161.237(mailfrom:xueshuai@linux.alibaba.com fp:SMTPD_---0X6h5OsU_1783498037 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 08 Jul 2026 16:07:19 +0800
Message-ID: <9986b3bf-e80e-4ffc-afd6-6b82baa1e9d0@linux.alibaba.com>
Date: Wed, 8 Jul 2026 16:07:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 RESEND 2/7] riscv: stacktrace: disable KASAN and KCOV
 instrumentation for stacktrace.o
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
 <20260629072713.3273743-3-wanghan@linux.alibaba.com>
From: Shuai Xue <xueshuai@linux.alibaba.com>
In-Reply-To: <20260629072713.3273743-3-wanghan@linux.alibaba.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260708_010723_572030_31D9EDE1 
X-CRM114-Status: GOOD (  15.40  )
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
> KASAN records stack traces for every alloc/free, which means it walks
> the unwinder very frequently. Instrumenting the stack trace collection
> code itself adds substantial overhead and makes the traces themselves
> noisier.
> 
> KCOV instruments every basic-block edge. The unwinder is a hot path,
> especially with KASAN enabled, so KCOV instrumentation has the same kind
> of cost and noise problem here.
> 
> Mark stacktrace.o as not KASAN- or KCOV-instrumented, matching the x86
> treatment of its stack unwinding code. RISC-V keeps the relevant unwinder
> code in stacktrace.o, so a single translation-unit annotation covers the
> equivalent scope. This is a prerequisite preference for the upcoming
> reliable unwinder, but the change is valid on its own.
> 
> Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
> ---
>   arch/riscv/kernel/Makefile | 6 ++++++
>   1 file changed, 6 insertions(+)
> 
> diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
> index cabb99cadfb6..c565a72a36f3 100644
> --- a/arch/riscv/kernel/Makefile
> +++ b/arch/riscv/kernel/Makefile
> @@ -44,6 +44,12 @@ CFLAGS_REMOVE_return_address.o	= $(CC_FLAGS_FTRACE)
>   CFLAGS_REMOVE_sbi_ecall.o = $(CC_FLAGS_FTRACE)
>   endif
>   
> +# When KASAN is enabled, a stack trace is recorded for every alloc/free, which
> +# can significantly impact performance. Avoid instrumenting the stack trace
> +# collection code to minimize this impact.
> +KASAN_SANITIZE_stacktrace.o := n
> +KCOV_INSTRUMENT_stacktrace.o := n
> +
>   always-$(KBUILD_BUILTIN) += vmlinux.lds
>   
>   obj-y	+= head.o

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>

Thanks.
Shuai

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
