Return-Path: <SRS0=nroh=PD=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B3158C433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 03:39:23 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6DA9160231
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Oct 2021 03:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6DA9160231
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/gAcasRLAhNvasULJoo9+QZF0PsV8mvYkG4c7f8TNIs=; b=H9C71Yfv+wea7v
	eLGwYLZM7aiCz9ugLNBQWGXhneF3sVUCwavMT48f2MNRDK8Dld3hedjPrhJevHXLJXqWk7vsPEu8j
	I31NuR31+CUPfV+sNDbr+lkGENIM8oamrHTBMZhbRmMF335NWWd0lZkDpQqGuPz2HXidtcrG1ZSsp
	k06yI3XYIprQTLcWwfYduPDQy7Mcq/eL5mCjcRXG5ZffRWbpf+FlmGA33X4kddI7l27xYG8tr8lRt
	rmWFqW9zoSbE2sRl+YcXh+pcp7PhQqnSnDKSyALFsDuGdlXfgSIvP+lNdVZVafNhbNdfJCYgnSmmc
	iX5MVQQlrgWTIDtFR8TQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mbE3w-005KRJ-AO; Fri, 15 Oct 2021 03:39:16 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mbE3t-005KQG-Ls
 for linux-riscv@lists.infradead.org; Fri, 15 Oct 2021 03:39:15 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 038EC610D2;
 Fri, 15 Oct 2021 03:39:09 +0000 (UTC)
Date: Thu, 14 Oct 2021 23:39:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Petr Mladek <pmladek@suse.com>
Cc: =?UTF-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>, Guo Ren
 <guoren@kernel.org>, Ingo Molnar <mingo@redhat.com>, "James E.J. Bottomley"
 <James.Bottomley@hansenpartnership.com>, Helge Deller <deller@gmx.de>,
 Michael Ellerman <mpe@ellerman.id.au>, Benjamin Herrenschmidt
 <benh@kernel.crashing.org>, Paul Mackerras <paulus@samba.org>, Paul
 Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org, "H. Peter Anvin"
 <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina
 <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>, Joe Lawrence
 <joe.lawrence@redhat.com>, Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>, "Peter Zijlstra (Intel)"
 <peterz@infradead.org>, Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang
 <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-parisc@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 live-patching@vger.kernel.org
Subject: Re: [PATCH v3 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
Message-ID: <20211014233907.15f13f62@oasis.local.home>
In-Reply-To: <YWhJP41cNwDphYsv@alley>
References: <609b565a-ed6e-a1da-f025-166691b5d994@linux.alibaba.com>
 <7e4738b5-21d4-c4d0-3136-a096bbb5cd2c@linux.alibaba.com>
 <YWhJP41cNwDphYsv@alley>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211014_203913_775612_EC138000 
X-CRM114-Status: GOOD (  15.48  )
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

On Thu, 14 Oct 2021 17:14:07 +0200
Petr Mladek <pmladek@suse.com> wrote:

>   /**
>    * ftrace_test_recursion_trylock - tests for recursion in same context
>    *
>    * Use this for ftrace callbacks. This will detect if the function
>    * tracing recursed in the same context (normal vs interrupt),
>    *
>    * Returns: -1 if a recursion happened.
> -  *           >= 0 if no recursion
> +  *           >= 0 if no recursion (success)
> +  *
> +  * Disables the preemption on success. It is just for a convenience.
> +  * Current users needed to disable the preemtion for some reasons.
>    */

I started replying to this explaining the difference between bit not
zero and a bit zero, and I think I found a design flaw that can allow
unwanted recursion.

It's late and I'm about to go to bed, but I may have a new patch to fix
this before this gets added, as the fix will conflict with this patch,
and the fix will likely need to go to stable.

Stay tuned.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
