Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A899C6FA82
	for <linux-riscv@archiver.kernel.org>; Tue, 27 Sep 2022 15:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VmYFnsu3TWZIBDir1kgBH6w1TJe3ZBaCbqX3dOTmXHY=; b=FCkj1L482Y9n+P
	haPhjJCLO1YGTfEMw3sKKdbk5KBPUM+JXCxpXVGqZ0GxtL7jXltuKKBw/jrrddwF0ehEtHvejYsdf
	9TOcOhdz0m4UZqQyRqN36E1EhkMWB8Flu2DBpX/o4BHKK0M8d/mdswtlBkFDRQXJGmkNAO/sqafjo
	uGTNXZiV37SV0jApOrGKD6kHXvKNOJ+tZtee63Rrs5scC4nBpQsymN7uZdl4oobsFxBk42jDO/D0p
	/QzCUZwiunN/Nz3bcytoO8qhKoY8HAiYn9lsfbe99NJeRs+SLvpdMaeCTZrmnYGOE0vM3rP1kV3W0
	at9js/kAByBUBk6QyJOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCPy-00BQUT-Od; Tue, 27 Sep 2022 15:22:42 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1odCPk-00BQON-Il
	for linux-riscv@lists.infradead.org; Tue, 27 Sep 2022 15:22:30 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 950FFB81C5E;
	Tue, 27 Sep 2022 15:22:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E7F4C433C1;
	Tue, 27 Sep 2022 15:22:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664292145;
	bh=QmLw/TjdTbZMk0yxbSJlr4Sq2FohgZRJCVBwkR7Rxow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=kq2hZQmaa5BVFRi8SYTc/sPtaiRrDaGI1e/k738eny5YzoA+lDsX3pLzZkS6mT7gH
	 Y/zWuYNZnPqy0dbG+pHRaNZUoemRv/h29eR5nU9QDIZ6tGdUhGKCkOTaJz/sHobyx5
	 sgaomVNSSGcgJoJfNKz9YULPxBB8E62SaqyiTp/t4xGRpNqqbAdmB1XzesAZorm3kl
	 Y9zWe1o3P+hkS1kTYhgIXTG9la3OF9RjXx6o9WkaEIOUDc9nBFGXJt/NPRcKxEmBNi
	 13nWxfqCkq9tJKj9+dQwJ/525RWu0cSDO6XhJPxr02AgxkxuwoKYw+WZaX6VLoVEEi
	 KH6mbVzuTrxGw==
Date: Wed, 28 Sep 2022 00:22:21 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Liao Chang <liaochang1@huawei.com>, <mingo@redhat.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Masami
 Hiramatsu <mhiramat@kernel.org>
Subject: Re: [PATCH] kprobes: Mark ftrace mcount handler functions nokprobe
Message-Id: <20220928002221.ddda8e26e3034180e33ad24e@kernel.org>
In-Reply-To: <20220926143723.73032f8c@gandalf.local.home>
References: <20220919084533.42318-1-liaochang1@huawei.com>
	<20220926143723.73032f8c@gandalf.local.home>
X-Mailer: Sylpheed 3.7.0 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220927_082228_974672_6E1DC7CB 
X-CRM114-Status: GOOD (  20.94  )
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

On Mon, 26 Sep 2022 14:37:23 -0400
Steven Rostedt <rostedt@goodmis.org> wrote:

> On Mon, 19 Sep 2022 16:45:33 +0800
> Liao Chang <liaochang1@huawei.com> wrote:
> 
> > Mark ftrace mcount handler functions nokprobe since probing on these
> > functions probably reaches mcount recursivly during kprobe breakpoint
> > handler for some architecture(tested for riscv, arm64), and reenter
> > kprobe is treated as a fatal error, causes kernel panic.
> 
> This looks to me that the affected archs should be made more robust for this
> case than to add this to the generic code.

Yeah, kprobes (arch specific code) itself shouldn't be traced by ftrace usually.

Thank you,

> 
> -- Steve
> 
> 
> > 
> > Pesudo code below demonstrate this problem:
> > 
> >   mcount
> >     function_trace_call (probed)
> >       arch_breakpoint_handler
> >         arch_setup_singlestep [mcount]
> >           function_trace_call (probed)
> >             arch_breakpoint_handler
> >               reenter_kprobe
> >                 BUG
> > 
> > Signed-off-by: Liao Chang <liaochang1@huawei.com>
> > ---
> >  kernel/trace/trace_functions.c | 5 +++++
> >  1 file changed, 5 insertions(+)
> > 
> > diff --git a/kernel/trace/trace_functions.c b/kernel/trace/trace_functions.c
> > index 9f1bfbe105e8..440a678a8c7c 100644
> > --- a/kernel/trace/trace_functions.c
> > +++ b/kernel/trace/trace_functions.c
> > @@ -16,6 +16,7 @@
> >  #include <linux/ftrace.h>
> >  #include <linux/slab.h>
> >  #include <linux/fs.h>
> > +#include <linux/kprobes.h>
> >  
> >  #include "trace.h"
> >  
> > @@ -194,6 +195,7 @@ function_trace_call(unsigned long ip, unsigned long parent_ip,
> >  
> >  	ftrace_test_recursion_unlock(bit);
> >  }
> > +NOKPROBE_SYMBOL(function_trace_call);
> >  
> >  #ifdef CONFIG_UNWINDER_ORC
> >  /*
> > @@ -245,6 +247,7 @@ function_stack_trace_call(unsigned long ip, unsigned long parent_ip,
> >  	atomic_dec(&data->disabled);
> >  	local_irq_restore(flags);
> >  }
> > +NOKPROBE_SYMBOL(function_stack_trace_call);
> >  
> >  static inline bool is_repeat_check(struct trace_array *tr,
> >  				   struct trace_func_repeats *last_info,
> > @@ -321,6 +324,7 @@ function_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
> >  out:
> >  	ftrace_test_recursion_unlock(bit);
> >  }
> > +NOKPROBE_SYMBOL(function_no_repeats_trace_call);
> >  
> >  static void
> >  function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
> > @@ -363,6 +367,7 @@ function_stack_no_repeats_trace_call(unsigned long ip, unsigned long parent_ip,
> >  	atomic_dec(&data->disabled);
> >  	local_irq_restore(flags);
> >  }
> > +NOKPROBE_SYMBOL(function_stack_no_repeats_trace_call);
> >  
> >  static struct tracer_opt func_opts[] = {
> >  #ifdef CONFIG_STACKTRACE
> 


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
