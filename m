Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BBFBECAAD5
	for <linux-riscv@archiver.kernel.org>; Wed,  7 Sep 2022 01:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nqO4/rltwqd2wczKoD0d6Oc4qSeotV92TpYPDnZ7W1Q=; b=TTIH+r8P74zg3s
	gNQrkKgnKU1nbINLq1Vdkk3yXhxce6x/VQ/bnFVj55fQSaSw5daoA7a56e6V9OCj9ypjpwgpvASdy
	sqkfJw0ZIn7YBMstFC9DNKJvcQ/F1UpqLtSvEz8bKa5nGgQGPcWL+lU5Qozdcg45oB5d32qB0VyUM
	TnOkSs+fwGM+lmT25fNwVO6t7pp1k+vxtWTKbxAG18eoY21nmkwD6yjcIad6SetjasVO9xLUQ7/Lo
	Za6vTbTk3UstPeGSs/IAGfHg5PR6rTcfjjW/3S44QtIWne/hIhKD9Rud8RJhQOHG4syT0Kvputx4p
	zDwxNU85Gn+66cDE/K5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVjbR-001Bxz-RE; Wed, 07 Sep 2022 01:11:41 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oVjbO-001BwT-JQ
	for linux-riscv@lists.infradead.org; Wed, 07 Sep 2022 01:11:40 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DEEF4616FD;
	Wed,  7 Sep 2022 01:11:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 530BFC433D6;
	Wed,  7 Sep 2022 01:11:36 +0000 (UTC)
Date: Tue, 6 Sep 2022 21:12:15 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Yipeng Zou <zouyipeng@huawei.com>
Cc: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <mingo@redhat.com>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <aou@eecs.berkeley.edu>, <liaochang1@huawei.com>, <chris.zjh@huawei.com>,
 Joel Fernandes <joel@joelfernandes.org>
Subject: Re: [PATCH 1/2] tracing: hold caller_addr to
 hardirq_{enable,disable}_ip
Message-ID: <20220906211215.0fe6183a@gandalf.local.home>
In-Reply-To: <20220901104515.135162-2-zouyipeng@huawei.com>
References: <20220901104515.135162-1-zouyipeng@huawei.com>
	<20220901104515.135162-2-zouyipeng@huawei.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220906_181138_715658_CF5CD1A9 
X-CRM114-Status: GOOD (  20.57  )
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

On Thu, 1 Sep 2022 18:45:14 +0800
Yipeng Zou <zouyipeng@huawei.com> wrote:

> Currently, The arguments passing to lockdep_hardirqs_{on,off} was fixed
> in CALLER_ADDR0.
> The function trace_hardirqs_on_caller should have been intended to use
> caller_addr to represent the address that caller wants to be traced.
> 
> For example, lockdep log in riscv showing the last {enabled,disabled} at
> __trace_hardirqs_{on,off} all the time(if called by):
> [   57.853175] hardirqs last  enabled at (2519): __trace_hardirqs_on+0xc/0x14
> [   57.853848] hardirqs last disabled at (2520): __trace_hardirqs_off+0xc/0x14
> 
> After use trace_hardirqs_xx_caller, we can get more effective information:
> [   53.781428] hardirqs last  enabled at (2595): restore_all+0xe/0x66
> [   53.782185] hardirqs last disabled at (2596): ret_from_exception+0xa/0x10

I'm going to mark this as stable and send it in my next push to Linus.

I'll also add:

Fixes: c3bc8fd637a96 ("tracing: Centralize preemptirq tracepoints and unify their usage")

The code was copied from functions that were originally called directly,
but now that they are called indirectly, CALLER_ADDR0 is not the right
thing to use.

Thanks!

-- Steve


> 
> Signed-off-by: Yipeng Zou <zouyipeng@huawei.com>
> ---
>  kernel/trace/trace_preemptirq.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/kernel/trace/trace_preemptirq.c b/kernel/trace/trace_preemptirq.c
> index 95b58bd757ce..1e130da1b742 100644
> --- a/kernel/trace/trace_preemptirq.c
> +++ b/kernel/trace/trace_preemptirq.c
> @@ -95,14 +95,14 @@ __visible void trace_hardirqs_on_caller(unsigned long caller_addr)
>  	}
>  
>  	lockdep_hardirqs_on_prepare();
> -	lockdep_hardirqs_on(CALLER_ADDR0);
> +	lockdep_hardirqs_on(caller_addr);
>  }
>  EXPORT_SYMBOL(trace_hardirqs_on_caller);
>  NOKPROBE_SYMBOL(trace_hardirqs_on_caller);
>  
>  __visible void trace_hardirqs_off_caller(unsigned long caller_addr)
>  {
> -	lockdep_hardirqs_off(CALLER_ADDR0);
> +	lockdep_hardirqs_off(caller_addr);
>  
>  	if (!this_cpu_read(tracing_irq_cpu)) {
>  		this_cpu_write(tracing_irq_cpu, 1);


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
