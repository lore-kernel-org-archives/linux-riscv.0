Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D20FC6FD19
	for <linux-riscv@archiver.kernel.org>; Thu, 16 Mar 2023 12:39:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Mime-Version:References:In-Reply-To:
	Message-Id:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tG7y/I12mI4dSTsm14J64//ctsJvT4meY+6VziVmSZQ=; b=sd24s7SPvIu+6y
	fU2hy9AHDm4BYZ6Rc5sC/PXeVGO2u7Wcy4cWWjvk9IS3gwik4gIbfY+IfLkAHsYy2sU5zk+potFIY
	NRfHYKVZeE/BLlWjCrB4YESZx1nf8HkNBbARqojvas4zHuKGupkyoN7Sbtty6uNs9M0qQLNONBIB+
	75QWrEd5PPUjksbbqnN9+pAxSlzlU/P/DyIXpVG90mcg56hWyKsAoFNPBWPRewWBFZ2WfyVjQHVmt
	SWA1ZWADeo5RD9IVFSq61WBSRhTU08a0omHQ5EoWiU1DO4Ahswo0DlNbbHpfcC439wPGdyUJLlfTy
	zSJmu8tiijONzhbuaq2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcmtO-00GQ7O-2G;
	Thu, 16 Mar 2023 12:39:38 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pcmtK-00GQ66-0k;
	Thu, 16 Mar 2023 12:39:35 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 45531B82160;
	Thu, 16 Mar 2023 12:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4D76C433EF;
	Thu, 16 Mar 2023 12:39:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678970371;
	bh=kFvhACJwx9bZhyzisvpDgQzAutWLxqYdw6r6fSMMCso=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=mjj0O5yunvQi4KJeuDculdQpHv5/fW/DoGOUtrhmW0CLMCdukwcO7YYbw0NQ9pm97
	 kOqCA4uQwsJfPmjOmTwpY526Q7NdSjVLY6uGwLgKQ1t+Szfm9AyXfCefDqBF+24rqY
	 McpICDN7xMQYvzEVLh2KpctN1oGzzwLbk1j+O3OsvwpqGGw0r03ehDOPSabVIXQjY8
	 VxPApXkGlP9ou2r6kw7hSJzkz/UYHC4Bi+zvvQQ0J78pbfdfud4XaisDbQ+wPHed5J
	 fFqsutMiR4ZCLJYrnxbC8BfTble9TKcmUZFCuyDSgEsj7Fx+PCza1FIC7wU+rXFOp9
	 ebuWhUaAGKZ+g==
Date: Thu, 16 Mar 2023 21:39:25 +0900
From: Masami Hiramatsu (Google) <mhiramat@kernel.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: Peter Zijlstra <peterz@infradead.org>, Steven Rostedt
 <rostedt@goodmis.org>, mhiramat@kernel.org, linux@armlinux.org.uk,
 mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing
 the return value of function
Message-Id: <20230316213925.f958c648e25f723db86aa705@kernel.org>
In-Reply-To: <664f9fa1-da31-2be9-76d9-3eb08e08b7f9@sangfor.com.cn>
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
	<20230315133911.958741-2-pengdonglin@sangfor.com.cn>
	<20230315134911.GD2006103@hirez.programming.kicks-ass.net>
	<20230315101348.1234c7f5@gandalf.local.home>
	<20230315145757.GE2006103@hirez.programming.kicks-ass.net>
	<664f9fa1-da31-2be9-76d9-3eb08e08b7f9@sangfor.com.cn>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230316_053934_586851_B6224409 
X-CRM114-Status: GOOD (  25.16  )
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

On Thu, 16 Mar 2023 11:18:23 +0800
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> On 2023/3/15 22:57, Peter Zijlstra wrote:
> > On Wed, Mar 15, 2023 at 10:13:48AM -0400, Steven Rostedt wrote:
> >> On Wed, 15 Mar 2023 14:49:11 +0100
> >> Peter Zijlstra <peterz@infradead.org> wrote:
> >>
> >>>> diff --git a/arch/x86/kernel/ftrace_64.S b/arch/x86/kernel/ftrace_64.S
> >>>> index 1265ad519249..35ac9c58dc77 100644
> >>>> --- a/arch/x86/kernel/ftrace_64.S
> >>>> +++ b/arch/x86/kernel/ftrace_64.S
> >>>> @@ -348,6 +348,10 @@ SYM_CODE_START(return_to_handler)
> >>>>   	movq %rax, (%rsp)
> >>>>   	movq %rdx, 8(%rsp)
> >>>>   	movq %rbp, %rdi
> >>>> +#ifdef CONFIG_FUNCTION_GRAPH_RETVAL
> >>>> +	/* Pass the function return value to ftrace_return_to_handler */
> >>>> +	movq %rax, %rsi
> >>>> +#endif
> >>>>   
> >>>>   	call ftrace_return_to_handler
> >>>
> >>> What about the case of double register return values (when the value
> >>> is returned in the A,D pair) ?
> >>
> >> Is there anything that does that in 64 bit kernels?
> > 
> > Note sure; but I have a patch series that introduces cmpxchg128 and
> > friends. Most of the actual functions are __always_inline, but still,
> > the moment a compiler decides to break out a subfunction on a u128
> > boundary we're in luck.
> I have reviewed the kretprobe implementation and noticed that $retval
> only retrieves the value of pt_regs.ax, which is an unsigned long data
> type. I wrote a demo and tested it on an x86 machine, and found that
> $retval only shows the least significant 32 bits of retval.Therefore,I
> think it can be consistent with kretprobe.

Yeah, because it doesn't support 128bit type (u128/long long).
It is possible to support it, but I think we can just document this
as a limitation for fgraph return value. It is just for quickly trace
most of the return values.

Thank you,

> 
> static noinline unsigned long long test_retval_func(void)
> {
> 	unsigned long long value = 0x1234567887654321;
> 	return value;
> }
> 
> add a kretprobe event:
> echo 'r:myretprobe test_retval_func $retval:x64' > kprobe_events
> 
> the trace log:
> myretprobe: (retval_open+0x1c/0x2c [test_retval] <- test_retval_func) 
> arg1=0x87654321


-- 
Masami Hiramatsu (Google) <mhiramat@kernel.org>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
