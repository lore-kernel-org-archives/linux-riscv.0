Return-Path: <SRS0=MdyL=PH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B439C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 02:02:35 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7E0BB61057
	for <linux-riscv@archiver.kernel.org>; Tue, 19 Oct 2021 02:02:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7E0BB61057
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=RDYHqvl6X5JusQlQeCymX2MAOi6XO325XsvDI0/QQjc=; b=ZiPOC9X3WqgbsU
	mjrgIIgoHABpkVw8YP+l/q7DdlG0oNHCidsTHKdL9C+RKzoTjsLv3DV8zDX0xaSOixo5piC6aPf69
	MuDhcFAhHuwGctAUfZD3phF9FldVJ/lxKzRD28mJkMM1Icm71Ea4ijnBoV+kvssh3nGkUZBGkzDKU
	N9MOI0XLRK/YU0pm8+y4DAeE+zfHN+rB3q4z6ITr9h5CpXPIYRJ+iBoGPqDU0mlFz6ucq9MM30egE
	IUvBo6hqJfGHi2DZo9PvYAgVLxlPq7IOZhMgjcTQn4M6yr+Z4FCn7MvpkEn2CBJPiXkmyfWAkTl3u
	ChwPavfr+lIk17G1qnEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mceSF-00HYqW-6i; Tue, 19 Oct 2021 02:02:15 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mceSC-00HYpG-NT
 for linux-riscv@lists.infradead.org; Tue, 19 Oct 2021 02:02:14 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D3B6A60ED4;
 Tue, 19 Oct 2021 02:02:06 +0000 (UTC)
Date: Mon, 18 Oct 2021 22:02:03 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>, Helge
 Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, Benjamin
 Herrenschmidt <benh@kernel.crashing.org>, Paul Mackerras
 <paulus@samba.org>, Paul Walmsley <paul.walmsley@sifive.com>, Palmer
 Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Thomas
 Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>,
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf
 <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, Miroslav Benes
 <mbenes@suse.cz>, Joe Lawrence <joe.lawrence@redhat.com>, Colin Ian King
 <colin.king@canonical.com>, Masami Hiramatsu <mhiramat@kernel.org>, "Peter
 Zijlstra (Intel)" <peterz@infradead.org>, Nicholas Piggin
 <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>,
 linux-csky@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org, =?UTF-8?B?546L6LSH?=
 <yun.wang@linux.alibaba.com>, Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <20211018220203.064a42ed@gandalf.local.home>
In-Reply-To: <YW1KKCFallDG+E01@alley>
References: <20211015110035.14813389@gandalf.local.home>
 <YW1KKCFallDG+E01@alley>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_190212_817637_B7B3C1EF 
X-CRM114-Status: GOOD (  21.71  )
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

On Mon, 18 Oct 2021 12:19:20 +0200
Petr Mladek <pmladek@suse.com> wrote:

> > -
> >  	bit = trace_get_context_bit() + start;
> >  	if (unlikely(val & (1 << bit))) {
> >  		/*
> >  		 * It could be that preempt_count has not been updated during
> >  		 * a switch between contexts. Allow for a single recursion.
> >  		 */
> > -		bit = TRACE_TRANSITION_BIT;
> > +		bit = TRACE_CTX_TRANSITION + start;  
>

[..]

> Could we please update the comment? I mean to say if it is a race
> or if we trace a function that should not get traced.

What do you think of this change?

diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
index 1d8cce02c3fb..24f284eb55a7 100644
--- a/include/linux/trace_recursion.h
+++ b/include/linux/trace_recursion.h
@@ -168,8 +168,12 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
 	bit = trace_get_context_bit() + start;
 	if (unlikely(val & (1 << bit))) {
 		/*
-		 * It could be that preempt_count has not been updated during
-		 * a switch between contexts. Allow for a single recursion.
+		 * If an interrupt occurs during a trace, and another trace
+		 * happens in that interrupt but before the preempt_count is
+		 * updated to reflect the new interrupt context, then this
+		 * will think a recursion occurred, and the event will be dropped.
+		 * Let a single instance happen via the TRANSITION_BIT to
+		 * not drop those events.
 		 */
 		bit = TRACE_TRANSITION_BIT;
 		if (val & (1 << bit)) {


-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
