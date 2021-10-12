Return-Path: <SRS0=CTJ+=PA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAADBC433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:25:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 53F5460BD3
	for <linux-riscv@archiver.kernel.org>; Tue, 12 Oct 2021 12:25:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 53F5460BD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DHo81nvRaFNcSY5XC6RFIxG/7piF0AsCldBXw+Hsvr8=; b=UQ9Obhx1nOu9sZ
	O0KSXT9Thox6gUJdyEMyTZXjQKiisEeJtCq8Qq+mV8P03m+MbN2AqJ3mjSl+qblgT56HlfjAm/vOY
	h3mesy2pZLKs/Y/JseOUlY/9P+ATIerY3aXOga+qVDYFb7rXDZWgVKXhc9DN7K+I2t1o3SN6rye0A
	Eb174MmacrKBDattRjjlIfD9mKSQrddFbDWyg0XxK0NLFbuwnMEruBShRQuAj2grpVVyppWM/uKMJ
	AbgEu1izcoEhPjReufeBZ8vnfJuhJaqUR7n8jYmDM0dJO+Roc/7NeKzsBS1IRYiuWXehVjYg07MRY
	S0BaksScTd1/e9YsBjWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maGpw-00Ckoe-Lj; Tue, 12 Oct 2021 12:24:52 +0000
Received: from smtp-out2.suse.de ([195.135.220.29])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maGpu-00CkmV-1V
 for linux-riscv@lists.infradead.org; Tue, 12 Oct 2021 12:24:51 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out2.suse.de (Postfix) with ESMTP id 52F7E2008D;
 Tue, 12 Oct 2021 12:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634041486; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ak50EaVK3T2xTOor5Gd356wiLx9ZgAxHtCEMYkhSwNY=;
 b=NpEckCnyzfzZUxRiTtHccM6MSmoh8iAqzDmMQH3nvC9cklNV1aH2j0mqOYNL6LBcF1FeMn
 ZS7r6xkvovnOOVDfrUeNHLg+1IzJSOHmBmp9BmIxbCSlOHerYxzwJLnjrK76VmPaF4eviM
 Mtj7AQh9vh6k4vNWt1qYyojA7mlg/Nc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634041486;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=ak50EaVK3T2xTOor5Gd356wiLx9ZgAxHtCEMYkhSwNY=;
 b=Txq3fZPPSrbXYn9fRcHcLC8++QyRUHTnoTmwTaV7ZXHhoiXC5v/Y+ZRgg4PZ9Lgr86Iqhj
 AAWT2wwIZo5qkwCA==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id F220BA3B84;
 Tue, 12 Oct 2021 12:24:43 +0000 (UTC)
Date: Tue, 12 Oct 2021 14:24:43 +0200 (CEST)
From: Miroslav Benes <mbenes@suse.cz>
To: =?ISO-2022-JP?Q?=1B$B2&lV=1B=28J?= <yun.wang@linux.alibaba.com>
cc: Guo Ren <guoren@kernel.org>, Steven Rostedt <rostedt@goodmis.org>, 
 Ingo Molnar <mingo@redhat.com>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, Michael Ellerman <mpe@ellerman.id.au>, 
 Benjamin Herrenschmidt <benh@kernel.crashing.org>, 
 Paul Mackerras <paulus@samba.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Thomas Gleixner <tglx@linutronix.de>, Borislav Petkov <bp@alien8.de>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Kosina <jikos@kernel.org>, 
 Petr Mladek <pmladek@suse.com>, Joe Lawrence <joe.lawrence@redhat.com>, 
 Colin Ian King <colin.king@canonical.com>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 "Peter Zijlstra (Intel)" <peterz@infradead.org>, 
 Nicholas Piggin <npiggin@gmail.com>, Jisheng Zhang <jszhang@kernel.org>, 
 linux-csky@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
 linux-riscv@lists.infradead.org, live-patching@vger.kernel.org
Subject: Re: [PATCH 1/2] ftrace: disable preemption on the testing of recursion
In-Reply-To: <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
Message-ID: <alpine.LSU.2.21.2110121421260.3394@pobox.suse.cz>
References: <8c7de46d-9869-aa5e-2bb9-5dbc2eda395e@linux.alibaba.com>
 <a8756482-024c-c858-b3d1-1ffa9a5eb3f7@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211012_052450_257201_14CE89B7 
X-CRM114-Status: GOOD (  17.31  )
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

> diff --git a/include/linux/trace_recursion.h b/include/linux/trace_recursion.h
> index a9f9c57..805f9c4 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -214,7 +214,14 @@ static __always_inline void trace_clear_recursion(int bit)
>  static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>  							 unsigned long parent_ip)
>  {
> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	int bit;
> +
> +	preempt_disable_notrace();
> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	if (bit < 0)
> +		preempt_enable_notrace();
> +
> +	return bit;
>  }
> 
>  /**
> @@ -226,6 +233,7 @@ static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>  static __always_inline void ftrace_test_recursion_unlock(int bit)
>  {
>  	trace_clear_recursion(bit);
> +	preempt_enable_notrace();
>  }
> 
>  #endif /* CONFIG_TRACING */
> diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
> index e8029ae..6e66ccd 100644
> --- a/kernel/livepatch/patch.c
> +++ b/kernel/livepatch/patch.c
> @@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
>  	bit = ftrace_test_recursion_trylock(ip, parent_ip);
>  	if (WARN_ON_ONCE(bit < 0))
>  		return;
> -	/*
> -	 * A variant of synchronize_rcu() is used to allow patching functions
> -	 * where RCU is not watching, see klp_synchronize_transition().
> -	 */
> -	preempt_disable_notrace();
> 
>  	func = list_first_or_null_rcu(&ops->func_stack, struct klp_func,
>  				      stack_node);
> @@ -120,7 +115,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,
>  	klp_arch_set_pc(fregs, (unsigned long)func->new_func);
> 
>  unlock:
> -	preempt_enable_notrace();
>  	ftrace_test_recursion_unlock(bit);
>  }

I don't like this change much. We have preempt_disable there not because 
of ftrace_test_recursion, but because of RCU. ftrace_test_recursion was 
added later. Yes, it would work with the change, but it would also hide 
things which should not be hidden in my opinion.

Miroslav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
