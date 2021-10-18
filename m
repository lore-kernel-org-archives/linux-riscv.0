Return-Path: <SRS0=TYB+=PG=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B56FDC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 10:45:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8219B61002
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Oct 2021 10:45:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8219B61002
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=suse.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=rocRpm1K2JXGkDgdBhHxJ2N47Z9uLhTRNQQQaL8QnyA=; b=cF8y6o2mhEbh1q
	cJGUu+xfhfLJJIvY3egLTPtuaJsRJjpJo+kodxXTaSF6Iv+FfL+ZMypMPfflweSXl8mKTrw8Cu872
	NS3rKdR54fJpg4/EfATEpyAj3bZdkcHuEI5TdCr9Zwkrd2y+sFQ2Qowwe+Q2Ir44NzTUeT471rtyB
	3LoBQ/Py+UGXM4vXV6Pjw/CGiLblFt57echGivbxZbeW0Qt6B3FYRvn/yhyAnZFGl+Bhv3bODFCDR
	xAUsaSEca3aHNkqlJktftHEFPwwwMDbi5y7T8CLOPlrgdP5WHC60/pQCiw3g/4IN2tqbYTHYgQKTb
	vROkeMsjO8320slE4XSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mcQ9E-00F6GZ-S6; Mon, 18 Oct 2021 10:45:41 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mcPjv-00Ey8D-MY
 for linux-riscv@lists.infradead.org; Mon, 18 Oct 2021 10:19:34 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 7CAE31FD79;
 Mon, 18 Oct 2021 10:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
 t=1634552366; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOXmerCnaJwQcxrGTYNbpRPalnhSmqAzz0pWYAYZ5Qo=;
 b=DzL9pIaLMpfOUDOV24COilkbRbw4Zz03OVIMeFIvKy0jrLRIjKjUVrYo1E6xQSlaoJiMkr
 ivmVDcSbU982BGrV4FEhvOUv2sbqZmkoH5LdMylpFwi3HCkh9B0ni8TIAluXo2q8Ds/4G7
 mK11rHw/9kXtIiS4yQX063c9dKeL93w=
Received: from suse.cz (unknown [10.100.216.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 136C9A3BCD;
 Mon, 18 Oct 2021 10:19:23 +0000 (UTC)
Date: Mon, 18 Oct 2021 12:19:20 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@redhat.com>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Thomas Gleixner <tglx@linutronix.de>,
 Borislav Petkov <bp@alien8.de>, x86@kernel.org,
 "H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@redhat.com>,
 Jiri Kosina <jikos@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
 Joe Lawrence <joe.lawrence@redhat.com>,
 Colin Ian King <colin.king@canonical.com>,
 Masami Hiramatsu <mhiramat@kernel.org>,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>,
 Nicholas Piggin <npiggin@gmail.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-csky@vger.kernel.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org,
 =?utf-8?B?546L6LSH?= <yun.wang@linux.alibaba.com>,
 Guo Ren <guoren@kernel.org>
Subject: Re: [PATCH] tracing: Have all levels of checks prevent recursion
Message-ID: <YW1KKCFallDG+E01@alley>
References: <20211015110035.14813389@gandalf.local.home>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211015110035.14813389@gandalf.local.home>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211018_031931_941438_ADE53E62 
X-CRM114-Status: GOOD (  33.52  )
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

On Fri 2021-10-15 11:00:35, Steven Rostedt wrote:
> From: "Steven Rostedt (VMware)" <rostedt@goodmis.org>
> 
> While writing an email explaining the "bit = 0" logic for a discussion on
> making ftrace_test_recursion_trylock() disable preemption, I discovered a
> path that makes the "not do the logic if bit is zero" unsafe.
> 
> Since we want to encourage architectures to implement all ftrace features,
> having them slow down due to this extra logic may encourage the
> maintainers to update to the latest ftrace features. And because this
> logic is only safe for them, remove it completely.
> 
>  [*] There is on layer of recursion that is allowed, and that is to allow
>      for the transition between interrupt context (normal -> softirq ->
>      irq -> NMI), because a trace may occur before the context update is
>      visible to the trace recursion logic.
> 
> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index a9f9c5714e65..168fdf07419a 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -165,40 +147,29 @@ static __always_inline int trace_test_and_set_recursion(unsigned long ip, unsign
>  	unsigned int val = READ_ONCE(current->trace_recursion);
>  	int bit;
>  
> -	/* A previous recursion check was made */
> -	if ((val & TRACE_CONTEXT_MASK) > max)
> -		return 0;

@max parameter is no longer used.

> -
>  	bit = trace_get_context_bit() + start;
>  	if (unlikely(val & (1 << bit))) {
>  		/*
>  		 * It could be that preempt_count has not been updated during
>  		 * a switch between contexts. Allow for a single recursion.
>  		 */
> -		bit = TRACE_TRANSITION_BIT;
> +		bit = TRACE_CTX_TRANSITION + start;

I just want to be sure that I understand it correctly.

The transition bit is the same for all contexts. It will allow one
recursion only in one context.

IMHO, the same problem (not-yet-updated preempt_count) might happen
in any transition between contexts: normal -> soft IRQ -> IRQ -> NMI.

Well, I am not sure what exacly it means "preempt_count has not been
updated during a switch between contexts."

   Is it that a function in the interrupt entry code is traced before
   preempt_count is updated?

   Or that an interrupt entry is interrupted by a higher level
   interrupt, e.g. IRQ entry code interrupted by NMI?


I guess that it is the first case. It would mean that the above
function allows one mistake (one traced funtion in an interrupt entry
code before the entry code updates preempt_count).

Do I get it correctly?
Is this what we want?


Could we please update the comment? I mean to say if it is a race
or if we trace a function that should not get traced.

>  		if (val & (1 << bit)) {
>  			do_ftrace_record_recursion(ip, pip);
>  			return -1;
>  		}
> -	} else {
> -		/* Normal check passed, clear the transition to allow it again */
> -		val &= ~(1 << TRACE_TRANSITION_BIT);
>  	}
>  
>  	val |= 1 << bit;
>  	current->trace_recursion = val;
>  	barrier();
>  
> -	return bit + 1;
> +	return bit;
>  }
>  
>  static __always_inline void trace_clear_recursion(int bit)
>  {
> -	if (!bit)
> -		return;
> -
>  	barrier();
> -	bit--;
>  	trace_recursion_clear(bit);
>  }

Otherwise, the change looks great. It simplifies that logic a lot.
I think that I start understanding it ;-)

Best Regards,
Petr

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
