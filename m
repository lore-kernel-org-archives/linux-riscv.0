Return-Path: <SRS0=U004=PB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FA42C433F5
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 09:48:08 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BB1666008E
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Oct 2021 09:48:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BB1666008E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=suse.cz
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:Message-ID:
	In-Reply-To:Subject:cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8SaisWxy73WD3atDsZV7w3oIc8ufil0/OPzJC9b/wpU=; b=u/3Uvtmv9O1XYC
	5rhXRieHCnlX+ToRTEm32vanAVNQeKhbGS3DUggk1ZUj24TFCdNWX/Fxra5v3hYkivBYl/yPqVgj9
	iebYGtRkJ6jjQXEpaD38qSSnUkKwi3oMkaWVCvaRKPSoBeV8NQ0079WZ+8iOtZUTtpCoxcep5Smk/
	ljTQ5RCUI8mkDOCBn+GSCdX5BDgCJoQV2BhqDS4YRVObKTYAkUQOjBSOqOMGwv4FO+MS5Fzo/HDPy
	KStnRaGM1Kb/eNaYU6QHgYx2sJ4ySBMTpA0+XIogVsQH97BcZYZdZbDLPjHGBWOi8uLGN63qAGrlt
	IjaxNMsqLMxbHqR8EHOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1maarP-00Fp6Z-0z; Wed, 13 Oct 2021 09:47:43 +0000
Received: from smtp-out1.suse.de ([195.135.220.28])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1maZ6f-00FTM8-Ji
 for linux-riscv@lists.infradead.org; Wed, 13 Oct 2021 07:55:23 +0000
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 99BD022296;
 Wed, 13 Oct 2021 07:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634111719; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7IGip/6gbVvmHRaMhrhBlPAbqtmi4yf9VEPWWlaFeE=;
 b=Ej27NFvhi/+3F1LnXiuEvJ3SmzHirAxauJBsGjgulCIyOssPQw6F6KwTNa9IaM5Au65bVy
 pwr2XAZtxLt0rxZlJr0A7utwkQQTqhil/0XYYwHKx8ILmEECDzgVsKv24qdJ71W4uV3deH
 oxQvor4tfFIz/5mrWPBwtKjE3PhLc20=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634111719;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=i7IGip/6gbVvmHRaMhrhBlPAbqtmi4yf9VEPWWlaFeE=;
 b=+w9Az0Z3KJ2VxO6gzBE7ap3QeAyDlZfweavR7c1nDpq45ogh1GvakBs8gocNDgbltKk/J+
 vJikc3lgCt4lGSCQ==
Received: from pobox.suse.cz (pobox.suse.cz [10.100.2.14])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id 5FC20A3B88;
 Wed, 13 Oct 2021 07:55:18 +0000 (UTC)
Date: Wed, 13 Oct 2021 09:55:18 +0200 (CEST)
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
Subject: Re: [RESEND PATCH v2 1/2] ftrace: disable preemption between
 ftrace_test_recursion_trylock/unlock()
In-Reply-To: <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
Message-ID: <alpine.LSU.2.21.2110130948120.5647@pobox.suse.cz>
References: <b1d7fe43-ce84-0ed7-32f7-ea1d12d0b716@linux.alibaba.com>
 <75ee86ac-02f2-d687-ab1e-9c8c33032495@linux.alibaba.com>
User-Agent: Alpine 2.21 (LSU 202 2017-01-01)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211013_005521_903372_03FAF925 
X-CRM114-Status: GOOD (  20.38  )
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
> index a9f9c57..101e1fb 100644
> --- a/include/linux/trace_recursion.h
> +++ b/include/linux/trace_recursion.h
> @@ -208,13 +208,29 @@ static __always_inline void trace_clear_recursion(int bit)
>   * Use this for ftrace callbacks. This will detect if the function
>   * tracing recursed in the same context (normal vs interrupt),
>   *
> + * The ftrace_test_recursion_trylock() will disable preemption,
> + * which is required for the variant of synchronize_rcu() that is
> + * used to allow patching functions where RCU is not watching.
> + * See klp_synchronize_transition() for more details.
> + *

I think that you misunderstood. Steven proposed to put the comment before 
ftrace_test_recursion_trylock() call site in klp_ftrace_handler().

>   * Returns: -1 if a recursion happened.
>   *           >= 0 if no recursion
>   */
>  static __always_inline int ftrace_test_recursion_trylock(unsigned long ip,
>  							 unsigned long parent_ip)
>  {
> -	return trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	int bit;
> +
> +	bit = trace_test_and_set_recursion(ip, parent_ip, TRACE_FTRACE_START, TRACE_FTRACE_MAX);
> +	/*
> +	 * The zero bit indicate we are nested
> +	 * in another trylock(), which means the
> +	 * preemption already disabled.
> +	 */
> +	if (bit > 0)
> +		preempt_disable_notrace();
> +
> +	return bit;
>  }

[...]

> diff --git a/kernel/livepatch/patch.c b/kernel/livepatch/patch.c
> index e8029ae..6e66ccd 100644
> --- a/kernel/livepatch/patch.c
> +++ b/kernel/livepatch/patch.c
> @@ -52,11 +52,6 @@ static void notrace klp_ftrace_handler(unsigned long ip,

Here

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

Side note... the comment will eventually conflict with peterz's 
https://lore.kernel.org/all/20210929152429.125997206@infradead.org/.

Miroslav

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
