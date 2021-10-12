Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC68DC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:29:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5F36760E97
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:29:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5F36760E97
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7IWyKjmsto+vYegQbMkgZBiL2oiACYc/Ri1qrvk7TLY=; b=oDKW9RNzcuKJoB
	AkJiXtYV6+NjDLCJdoDTtsScxgTrRfxvrUIdJx5OHbUNOCogYkOy87zqAvNJG1dTU8wD3tDFKckTS
	uQ41WiyLsDPcYYDnDwE9Jmsx2EqlFochJq9PMHrS4+Q8BtvIye2W5xwN/5W9nslrswW7uh7RPG7DY
	1X5vdHHod5Vj4Wlu55sIz7IrVx/+sHLQbWPHJDOBV4lX2xG+/4NnAOlMi+j2Q4/hhEQmL8Zsl+c1C
	5pODVs97gOF/fkSdD2TDtbS0H2n/gqf+tDJZ6r+6GNPDo0u/Zg/I7XDgaddWEXCddWet8uN4qRRAa
	IvYxZ2tgm0tIXhjAQeNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maGuN-00ClEx-Eb; Tue, 12 Oct 2021 12:29:27 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maGuK-00ClDn-FX
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 12:29:25 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8122460E74;
 Tue, 12 Oct 2021 12:29:21 +0000 (UTC)
Date: Tue, 12 Oct 2021 08:29:20 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Guo Ren
 <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@HansenPartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Petr Mladek <pmladek@suse.com>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
Message-ID: <20211012082920.1f8d6557@gandalf.local.home>
In-Reply-To: <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
 <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_052924_547959_D88D006C 
X-CRM114-Status: GOOD (  17.73  )
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

On Tue, 12 Oct 2021 14:24:43 +0200 (CEST)
Miroslav Benes <mbenes@suse.cz> wrote:

> > +++ b/kernel/livepatch/patch.c
> > @@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
> >  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
> >  	if (WARN_ON_ONCE(bit < 0))
> >  		return;
> > -	/*
> > -	 * A variant of synchronize_rcu() is used to allow patching functions
> > -	 * where RCU is not watching, see klp_synchronize_transition().
> > -	 */
> > -	preempt_disable_notrace();
> > 
> >  	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
> >  				      stack_node);
> > @@ -120,7 +115,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
> >  	klp_arch_set_pc(fregs, (unsigned long)func->new_func);
> > 
> >  unlock:
> > -	preempt_enable_notrace();
> >  	ftrace_test_recursion_unlock(bit);
> >  }  
> 
> I don't like this change much. We have preempt_disable there not because 
> of ftrace_test_recursion, but because of RCU. ftrace_test_recursion was 
> added later. Yes, it would work with the change, but it would also hide 
> things which should not be hidden in my opinion.

Agreed, but I believe the change is fine, but requires a nice comment to
explain what you said above.

Thus, before the "ftrace_test_recursion_trylock()" we need:

	/*
	 * The ftrace_test_recursion_trylock() will disable preemption,
	 * which is required for the variant of synchronize_rcu() that is
	 * used to allow patching functions where RCU is not watching.
	 * See klp_synchronize_transition() for more details.
	 */

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
