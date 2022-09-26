Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 323E3C32771
	for <linux-riscv@archiver.kernel.org>; Mon, 26 Sep 2022 18:36:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Nh0ZiPiT84EpRrJBhZRaMcOopuAP3uRkP4pMM6oVp4=; b=itOroyAZRskR6r
	9UgAB+E4WWmw82EwluapEw2hRy6YqwhMOAuGZM8yNZhv09eSplq3MMFa8msST3Lr6XCOH/99ecZ8z
	kcYZ65rR+1+ZB34Ei9WKcsWwzb/D+4FToe4VuktGkRpPJsAXqchu88j6eqlIVgQgJD2e1Re3Y1qJJ
	5bCMn9P2Ufk/0vhr8leZPTGTGbUdQz2gqsSN6GFdUCgJ2vG9LrT8JUcaYPKmRGS5AUGTK6rd0UczJ
	QTySAFq/4peOWL47vfspEXLfYD9G1JMsu0ubM3cn7o4X5nLzgmdwHZfTdYCTFXo+9be53rpjsLtmU
	X+kV9POQw0ANmTMAxt1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocsxo-006I4l-GS; Mon, 26 Sep 2022 18:36:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ocsxk-006I44-SY
	for linux-riscv@lists.infradead.org; Mon, 26 Sep 2022 18:36:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 538BB6120E;
	Mon, 26 Sep 2022 18:36:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E743AC433D6;
	Mon, 26 Sep 2022 18:36:14 +0000 (UTC)
Date: Mon, 26 Sep 2022 14:37:23 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Liao Chang <liaochang1@huawei.com>
Cc: <mingo@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Masami Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] kprobes: Mark ftrace mcount handler functions nokprobe
Message-ID: <20220926143723.73032f8c@gandalf.local.home>
In-Reply-To: <20220919084533.42318-1-liaochang1@huawei.com>
References: <20220919084533.42318-1-liaochang1@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220926_113616_992850_18FF46C5 
X-CRM114-Status: GOOD (  18.01  )
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

On Mon, 19 Sep 2022 16:45:33 +0800
Liao Chang <liaochang1@huawei.com> wrote:

> Mark ftrace mcount handler functions nokprobe since probing on these
> functions probably reaches mcount recursivly during kprobe breakpoint
> handler for some architecture(tested for riscv, arm64), and reenter
> kprobe is treated as a fatal error, causes kernel panic.

This looks to me that the affected archs should be made more robust for this
case than to add this to the generic code.

-- Steve


> 
> Pesudo code below demonstrate this problem:
> 
>   mcount
>     function_trace_call (probed)
>       arch_breakpoint_handler
>         arch_setup_singlestep [mcount]
>           function_trace_call (probed)
>             arch_breakpoint_handler
>               reenter_kprobe
>                 BUG
> 
> Signed-off-by: Liao Chang <liaochang1@huawei.com>
> ---
>  kernel/trace/trace_functions.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
> index 9f1bfbe105e8..440a678a8c7c 100644
> --- a/kernel/trace/trace_functions.c
> +++ b/kernel/trace/trace_functions.c
> @@ -16,6 +16,7 @@
>  #include <linux/ftrace.h>
>  #include <linux/slab.h>
>  #include <linux/fs.h>
> +#include <linux/kprobes.h>
>  
>  #include "trace.h"
>  
> @@ -194,6 +195,7 @@ function_trace_call(unsigned long ip, unsigned long parent_ip,
>  
>  	ftrace_test_recursion_unlock(bit);
>  }
> +NOKPROBE_SYMBOL(function_trace_call);
>  
>  #ifdef CONFIG_UNWINDER_ORC
>  /*
> @@ -245,6 +247,7 @@ function_stack_trace_call(unsigned long ip, unsigned long parent_ip,
>  	atomic_dec(&data->disabled);
>  	local_irq_restore(flags);
>  }
> +NOKPROBE_SYMBOL(function_stack_trace_call);
>  
>  static inline bool is_repeat_check(struct trace_array *tr,
>  				   struct trace_func_repeats *last_info,
> @@ -321,6 +324,7 @@ function_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
>  out:
>  	ftrace_test_recursion_unlock(bit);
>  }
> +NOKPROBE_SYMBOL(function_no_repeats_trace_call);
>  
>  static void
>  function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
> @@ -363,6 +367,7 @@ function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
>  	atomic_dec(&data->disabled);
>  	local_irq_restore(flags);
>  }
> +NOKPROBE_SYMBOL(function_stack_no_repeats_trace_call);
>  
>  static struct tracer_opt func_opts[] = {
>  #ifdef CONFIG_STACKTRACE


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
