Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B73DBC6FD1D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 14:14:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=sxsKphPRLIHsAPJCT008E2RNoWE47iAS8TP+hd4FhDM=; b=HjSHxyS5dZ2hA5
	C1Ngh5IrHq1njexZe1epiWzBpXFY8utU4Mk+ihc/2Vcjfqh1gDzLS0iQRpn3y/t1uc4MrMOHO4XNW
	UTIBLKWjDwVY4He3hemDYR535zdp5R64KTN59wJ6kgsEwq9Cayr91/WjExUARfXINvDR9X/wnZ+5d
	006iR7LkNaO97JB6D9bdjrnH4UvCy/JwrTYjBVM9XEPsHLzT/mgJhBiQehSyeeDdhaWTR7pWFl8R6
	tDAIVfHgLEwMo0p2iC7CmoUBxIzFsKiJVTYIgEtW+2qzujozhbduYISfvm52F7yiLIWJ7rDn/COJc
	rBs3kQ+K/gaAzZBa+PlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcRtA-00DZyP-2Y;
	Wed, 15 Mar 2023 14:14:00 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcRt6-00DZwG-0p;
	Wed, 15 Mar 2023 14:13:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A675B81E0A;
	Wed, 15 Mar 2023 14:13:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5443C4339C;
	Wed, 15 Mar 2023 14:13:50 +0000 (UTC)
Date: Wed, 15 Mar 2023 10:13:48 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 mingo@redhat.com, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230315101348.1234c7f5@gandalf.local.home>
In-Reply-To: <20230315134911.GD2006103@hirez.programming.kicks-ass.net>
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
	<20230315133911.958741-2-pengdonglin@sangfor.com.cn>
	<20230315134911.GD2006103@hirez.programming.kicks-ass.net>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_071356_465640_E33C7496 
X-CRM114-Status: GOOD (  16.15  )
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

On Wed, 15 Mar 2023 14:49:11 +0100
Peter Zijlstra <peterz@infradead.org> wrote:

> > diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
> > index 1265ad519249..35ac9c58dc77 100644
> > --- a/arch/x86/kernel/ftrace_64.S
> > +++ b/arch/x86/kernel/ftrace_64.S
> > @@ -348,6 +348,10 @@ SYM_CODE_START(return_to_handler)
> >  	movq %rax, (%rsp)
> >  	movq %rdx, 8(%rsp)
> >  	movq %rbp, %rdi
> > +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> > +	/* Pass the function return value to ftrace_return_to_handler */
> > +	movq %rax, %rsi
> > +#endif
> >  
> >  	call ftrace_return_to_handler  
> 
> What about the case of double register return values (when the value
> is returned in the A,D pair) ?

Is there anything that does that in 64 bit kernels?

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
