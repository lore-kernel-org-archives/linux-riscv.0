Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DBA5C7EE29
	for <linux-riscv@archiver.kernel.org>; Fri,  9 Jun 2023 17:19:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8IYPFa60SMi5emAtHYOMQMFBTcKlXT1C6LCcjtZQ3uQ=; b=47KZz8U7BhEpTp
	ytXPQIufucbQjTAPvA7bQmz3tu4906yqkZBILojsZyGW3gszSvQ+0HLQjYr7Ij+IuNmaAw7+jJC8V
	dXEDPuYTuU87NiUrEWqE7Jn0ZoIDZJa9FJXrJXBcIQUHNaDtH9PghbtCrb3wLYoQKrGG1nVJcH73P
	uh4tCfmzBNe50+1F6mU0k3aMiXIFXcMrnEj55eXNeQUAAiA+9EBl0QxwZIZREX0dOriRkLMjUdZ0Y
	70bjISO2YWlIb870hWt5pwChiXFS/tUWzBB7dg96un5fFl6pjalyIyObriiaVHwTQy8upfdRQrK9s
	LYQyCr1JlubPymSpvxeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1q7flu-00DiNE-1t;
	Fri, 09 Jun 2023 17:19:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1q7flr-00DiM1-1F;
	Fri, 09 Jun 2023 17:19:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id ED30F617D0;
	Fri,  9 Jun 2023 17:19:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42F0EC433EF;
	Fri,  9 Jun 2023 17:19:27 +0000 (UTC)
Date: Fri, 9 Jun 2023 13:19:24 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
 rmk+kernel@armlinux.org.uk, palmer@dabbelt.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, tglx@linutronix.de, dave.hansen@linux.intel.com,
 x86@kernel.org, bp@alien8.de, hpa@zytor.com, chenhuacai@kernel.org,
 zhangqing@loongson.cn, kernel@xen0n.name, mingo@redhat.com,
 peterz@infradead.org, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, loongarch@lists.linux.dev,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v11 4/8] arm64: ftrace: Enable
 HAVE_FUNCTION_GRAPH_RETVAL
Message-ID: <20230609131924.5ff89413@gandalf.local.home>
In-Reply-To: <ZILxZ6wrYUnnxT/E@arm.com>
References: <cover.1680954589.git.pengdonglin@sangfor.com.cn>
	<c78366416ce93f704ae7000c4ee60eb4258c38f7.1680954589.git.pengdonglin@sangfor.com.cn>
	<ZILxZ6wrYUnnxT/E@arm.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230609_101931_478926_7232D7FB 
X-CRM114-Status: GOOD (  17.42  )
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

On Fri, 9 Jun 2023 10:31:19 +0100
Catalin Marinas <catalin.marinas@arm.com> wrote:

> On Sat, Apr 08, 2023 at 05:42:18AM -0700, Donglin Peng wrote:
> > The previous patch ("function_graph: Support recording and printing
> > the return value of function") has laid the groundwork for the for
> > the funcgraph-retval, and this modification makes it available on
> > the ARM64 platform.
> > 
> > We introduce a new structure called fgraph_ret_regs for the ARM64
> > platform to hold return registers and the frame pointer. We then
> > fill its content in the return_to_handler and pass its address to
> > the function ftrace_return_to_handler to record the return value.
> > 
> > Reviewed-by: Mark Rutland <mark.rutland@arm.com>
> > Tested-by: Mark Rutland <mark.rutland@arm.com>
> > Signed-off-by: Donglin Peng <pengdonglin@sangfor.com.cn>  
> 
> We fully trust Mark's reviews ;) but just in case you need an official
> maintainer ack:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks Catalin, that does help.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
