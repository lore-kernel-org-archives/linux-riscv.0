Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86903C61DA4
	for <linux-riscv@archiver.kernel.org>; Sat, 18 Mar 2023 16:40:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=80GfcTBY7dvQdy422+qIf8ZJAFUp1ePyA+yujjn/T4o=; b=fFrZUwglJ3Y6El
	GKlIGGrFtoSqxlCV1rECkfVD2FoiI72oClfgL6jOyQkk8jaSa7a1jXsPPiaeSDWxIR2kx6B9nSKz2
	mOmsg7GA3nMWBbdrWtl0n8O0Ta05LTxFUvjyu/MJHW7sCS6MUeRr+RFWvuduhApAxfb7fAuvSoENi
	g7xGl8qtNyzsU5XoSQZD+fR5SAbqE9a6089qfcb2vWytyjbVRqCovIBKQWCkEwrjd1K1JFLau4vTc
	aUv5Jwf1IKvZI1rugzjK63l5ZxwJI+5qpK/QMGLnDqpiKnElDW64q/1epCKx5/tssECP09oOFEhF+
	uO2WG0M/o9LZnSxHuMTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdZbl-0050qd-16;
	Sat, 18 Mar 2023 16:40:41 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdZbf-0050pQ-2F;
	Sat, 18 Mar 2023 16:40:37 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 582A8B8091A;
	Sat, 18 Mar 2023 16:40:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EEBFC433EF;
	Sat, 18 Mar 2023 16:40:30 +0000 (UTC)
Date: Sat, 18 Mar 2023 12:40:28 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Donglin Peng <pengdonglin@sangfor.com.cn>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, mhiramat@kernel.org,
 mark.rutland@arm.com, will@kernel.org, catalin.marinas@arm.com,
 palmer@dabbelt.com, paul.walmsley@sifive.com, tglx@linutronix.de,
 dave.hansen@linux.intel.com, x86@kernel.org, mingo@redhat.com,
 xiehuan09@gmail.com, dinghui@sangfor.com.cn, huangcun@sangfor.com.cn,
 dolinux.peng@gmail.com, linux-trace-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/2] function_graph: Support recording and printing
 the return value of function
Message-ID: <20230318124028.4faf75d1@rorschach.local.home>
In-Reply-To: <34781b74-8d3e-a7e6-9abe-e8d45d680eec@sangfor.com.cn>
References: <20230315133911.958741-1-pengdonglin@sangfor.com.cn>
	<20230315133911.958741-2-pengdonglin@sangfor.com.cn>
	<ZBOkY8FkqgoBfzQ2@shell.armlinux.org.uk>
	<34781b74-8d3e-a7e6-9abe-e8d45d680eec@sangfor.com.cn>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230318_094035_901182_F886E488 
X-CRM114-Status: GOOD (  17.61  )
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

On Fri, 17 Mar 2023 10:49:49 +0800
Donglin Peng <pengdonglin@sangfor.com.cn> wrote:

> > So, really it depends what size of return value we want to report.
> > Also, please bear in mind that where a function returns a 32-bit
> > value, that will be in r0, and r1 will be whatever happened to be
> > in it at function exit - there's no defined value for r1.
> >   
> 
> Thank you. I will document this as a limitation of fgraph return value.
> It can just cover most cases at present and I think the r0 is enough.

One thing we could possibly do here is to use BTF or objtool to denote
the return value of each function and use 2 bits of the ftrace
rec->flags to state that it is:

0 - void
1 - 1 word size return
2 - 2 word size return

I believe we can get access to the function's rec via the return call
(or add that access) and pass both words to the return function, and
then the return callback can use this lookup to determine what values
are useful or not.

In any case, I would suggest passing both regs to the callback, and for
now just ignore the second reg until we can come up with a way to
differentiate each function.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
