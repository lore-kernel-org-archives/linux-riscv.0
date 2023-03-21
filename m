Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66BC1C74A5B
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Mar 2023 14:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hPDZuj5uUk1kiSznnLgQHWW8obOAp/IFr7hZZOVE+44=; b=R48sm/QZMAmg4K
	t0wpszqOS01QyupvrwzHifParROYw55xYsgfg5A0YSBOI4/+fM2qJq/JmCYarMoTbM/5Fw+1tmnFC
	8RITMoWHVWj+bxXwei3iBfwUFSqEmPIlCupm+kXopzku5C+TIZ86NZDSqFTSAMu4NiLQ2COkUIvRo
	69XhJAE3VdUW9IRciGVSarQUBDs3e9ubjV2VeOTCF/2F7rcw7/W3Zv+i7XDL2qz9qgVLBAfRV8v4d
	4nRCy44IMS330c6NAF48YFraO6i9/JVPFVE/7OrC2mGdC//YUQUFHuRvkhlOCFJ2lJFedBKSq/KI5
	dE2VYMvGfCXW+c9AhsmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pedE0-00Cmtj-2v;
	Tue, 21 Mar 2023 14:44:32 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pedDn-00Cmpy-2S;
	Tue, 21 Mar 2023 14:44:21 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5FA1AB816AA;
	Tue, 21 Mar 2023 14:44:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E28B9C4339C;
	Tue, 21 Mar 2023 14:44:14 +0000 (UTC)
Date: Tue, 21 Mar 2023 10:44:13 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Florian Kauer <florian.kauer@linutronix.de>
Cc: Donglin Peng <pengdonglin@sangfor.com.cn>, mhiramat@kernel.org,
 linux@armlinux.org.uk, mark.rutland@arm.com, will@kernel.org,
 catalin.marinas@arm.com, palmer@dabbelt.com, paul.walmsley@sifive.com,
 tglx@linutronix.de, dave.hansen@linux.intel.com, x86@kernel.org,
 mingo@redhat.com, xiehuan09@gmail.com, dinghui@sangfor.com.cn,
 huangcun@sangfor.com.cn, dolinux.peng@gmail.com,
 linux-trace-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230321104413.43a81ffb@gandalf.local.home>
In-Reply-To: <2eeef5a3-cbe7-7a01-489a-87c5ac00adf7@linutronix.de>
References: <20230320131650.482594-1-pengdonglin@sangfor.com.cn>
	<20230320131650.482594-2-pengdonglin@sangfor.com.cn>
	<2eeef5a3-cbe7-7a01-489a-87c5ac00adf7@linutronix.de>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230321_074419_996873_5A4F6609 
X-CRM114-Status: GOOD (  21.00  )
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

On Tue, 21 Mar 2023 15:09:40 +0100
Florian Kauer <florian.kauer@linutronix.de> wrote:

> On 20.03.23 14:16, Donglin Peng wrote:
> > When using the function_graph tracer to analyze system call failures,
> > it can be time-consuming to analyze the trace logs and locate the kernel
> > function that first returns an error. This change aims to simplify the
> > process by recording the function return value to the 'retval' member of
> > 'ftrace_graph_ent' and printing it when outputing the trace log.  
> 
> I just came across your patch by pure luck and it helped me a lot
> to trace down a problem I had, thanks!
> 
> So you can have my
> Tested-by: Florian Kauer <florian.kauer@linutronix.de>
>  
> > New trace options are introduced: funcgraph-retval and graph_retval_hex.  
> 
> I would personally prefer to have the second option scoped better, so for example
> "funcgraph-retval-hex".

That could be an ftrace option.

Anyway, could you tell us your use case, and that could go into the change
log of this patch as "one use case that this helped with".

Thanks,

-- Steve


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
