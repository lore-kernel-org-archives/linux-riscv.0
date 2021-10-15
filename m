Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E155C433F5
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 18:26:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5A3DA60FE3
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 18:26:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5A3DA60FE3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YkXvRvO4PhMJ2c9dBxyLlxw8GFYJFF1HPFSCTdilKrc=; b=Nl5ICtQZcg9irJ
	Mvo0BxLUZh+9UK7XHqATW7RsNIbHHDvgPNkbmgUUDGy7amvRmYYO6XPz1HniQnu50Q4GnBpLnuNwL
	+MF1ITP/oxqKfFL/IuR7aA4J4CAhj8MItkJlwvJloFIfWBPEyP4Do1fWWQx6NVNp94oo8A90DuMaa
	PYJtt8lUMhh2Xcp3XZQHn1XaT6gaQ+VqtgBS3w1X0sqDJQW/J8INLfDXt4vExXtzojXZjD7zspuHc
	OtVgGuQ1fDo1cLYOuqRGnEYlztYH266X5y/weTERGu1q8FwRWrte/2uBBKW5rlvlb6+NLkv7sozSs
	p1+LsYDzwx3jiA/bbAWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbRuM-008R2C-GA; Fri, 15 Oct 2021 18:26:18 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRuL-008R1X-5b
 for linux-riscv@bombadil.infradead.org; Fri, 15 Oct 2021 18:26:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=us4YosfodZgYMwFe8rJkfXK5dBQB718M3Lke3zJ1ToY=; b=cY0CRJ4SyOUVhj9UQyVxaRjiQw
 /1wr6TKwpWSzfpNTEbXEKVniDAC2ka6eybM+zn4dvXDqwYkZkvTR7v491RJDKTw//hD58xTRj4oSR
 0QlPPMnjn7Kj5Q69itBEQRhxFEDeXwGDeihgs8rBliRLbgQ1rALI78w76v8T7IV7afCS0Fz+4Wm/4
 JqW5/oOc7BvO/34prpputAko6YLKktrYcXK5QZw27hBqOhlswQg+31OoFJIp0mMSv5a8AOMHrtuWW
 Noym6xZO/FLCs8cS2lPtQPTbXYrAqWX9Q1Zx+cYlupXrs+iYell2Jzqq1JcZWRqrfVcDkMJ/NiCjB
 zMNudW1A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100]
 helo=worktop.programming.kicks-ass.net)
 by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbRt6-009CM0-0J; Fri, 15 Oct 2021 18:25:17 +0000
Received: by worktop.programming.kicks-ass.net (Postfix, from userid 1000)
 id 90BD19857C7; Fri, 15 Oct 2021 20:24:59 +0200 (CEST)
Date: Fri, 15 Oct 2021 20:24:59 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
 =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211015182459.GL174703@worktop.programming.kicks-ass.net>
References: <20211015110035.14813389@gandalf.local.home>
 <20211015161702.GF174703@worktop.programming.kicks-ass.net>
 <20211015133504.6c0a9fcc@gandalf.local.home>
 <20211015135806.72d1af23@gandalf.local.home>
 <20211015180429.GK174703@worktop.programming.kicks-ass.net>
 <20211015142033.72605b47@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015142033.72605b47@gandalf.local.home>
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

On Fri, Oct 15, 2021 at 02:20:33PM -0400, Steven Rostedt wrote:
> On Fri, 15 Oct 2021 20:04:29 +0200
> Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Fri, Oct 15, 2021 at 01:58:06PM -0400, Steven Rostedt wrote:
> > > Something like this:  
> > 
> > I think having one copy of that in a header is better than having 3
> > copies. But yes, something along them lines.
> 
> I was just about to ask you about this patch ;-)

Much better :-)

> diff --git a/kernel/events/internal.h b/kernel/events/internal.h
> index 228801e20788..c91711f20cf8 100644
> --- a/kernel/events/internal.h
> +++ b/kernel/events/internal.h
> @@ -206,11 +206,7 @@ DEFINE_OUTPUT_COPY(__output_copy_user, arch_perf_out_copy_user)
>  static inline int get_recursion_context(int *recursion)
>  {
>  	unsigned int pc = preempt_count();

Although I think we can do without that ^ line as well :-)

> -	unsigned char rctx = 0;
> -
> -	rctx += !!(pc & (NMI_MASK));
> -	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK));
> -	rctx += !!(pc & (NMI_MASK | HARDIRQ_MASK | SOFTIRQ_OFFSET));
> +	unsigned char rctx = interrupt_context_level();
>  
>  	if (recursion[rctx])
>  		return -1;

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
