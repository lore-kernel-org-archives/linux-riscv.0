Return-Path: <SRS0=VC1f=KB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_2
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48446C433B4
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:20:28 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4CD6E61104
	for <linux-riscv@archiver.kernel.org>; Thu,  6 May 2021 13:20:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4CD6E61104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=goodmis.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=5zPNVvxiYD7t3gEPMOeORHcWjf2o3G68cchJG4YdXXY=; b=nQYXhfJm6I9krPQk3sNNMMHwv
	O5XZIhw18sZuR1AZ6mLJur0X7d0OBmTRr3BqaJKR3DyX4FHs6tLIk9KbERaBL+YyOK6ZTdAWEfj0l
	RuiC4tGqgttORKz54vzJBIgHrPrc59uRVRS0v9BHKBSOFW8jUB9Fq6cs0FWp8eMAcc/qsS0YTVHE+
	8AJzgNg8Gj2d7u0HVlEgyHdM0Bq6auDkxROrXru71eCxxSBKSwcY368no1T7gY6tgttFUyex2U0yA
	TIvNMwnh6IZDPw9U4ULIFKF60mVouloeQyOj2h/TzAoGG0hy68MS6lG8cKOKIgTS6n/mOey94Lpcn
	slFFg+i2w==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ledvG-004Icf-Ao; Thu, 06 May 2021 13:20:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledvE-004IcZ-Lw
 for linux-riscv@desiato.infradead.org; Thu, 06 May 2021 13:20:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
 From:Date:Sender:Reply-To:Content-ID:Content-Description;
 bh=4yXICiluDg+AzIXh0EygQLTni+dT/+L2Nulb804NVEU=; b=xp6/XUL0kEpaHWMgkl7Rlux9d+
 EcBrKCAhZ5vXXp/j3kAzhsywnjyq6t6bfUSY+FAw5NVjtdiK5YddejOYpAkqDVrYWwOkPqSZ9UdBl
 KM+aZvcYqAMYyN4D+tK4bAHALBlnUvh3dcGaFpV2nFv5iVczRqD2cjz2Kj41Vs1guS6ZGq/TRGMoP
 vIdrQA/hFcTcqplcyaDHcs/3YJRy+eYa7xE8ZLyoXv73APCKfVz4hXqqJlULxhcsnS2BXFrFX2kKP
 iCN0r+3triBygUq5Ie9CK/thgKX6FlwMv8czzj2reOQWLGaXMWTJ/ktTw1DBj8otOObdr63IdTWZm
 fwHqCxhw==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ledvB-0063Ma-Lm
 for linux-riscv@lists.infradead.org; Thu, 06 May 2021 13:20:07 +0000
Received: from gandalf.local.home (cpe-66-24-58-225.stny.res.rr.com
 [66.24.58.225])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 42473610EA;
 Thu,  6 May 2021 13:20:02 +0000 (UTC)
Date: Thu, 6 May 2021 09:20:00 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org, mingo@redhat.com, Paul Walmsley
 <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, mhiramat@kernel.org,
 zong.li@sifive.com, guoren@linux.alibaba.com, Atish Patra
 <Atish.Patra@wdc.com>, linux-kernel@vger.kernel.org,
 kernel-team@android.com, Palmer Dabbelt <palmerdabbelt@google.com>,
 Changbin Du <changbin.du@gmail.com>
Subject: Re: [PATCH] RISC-V: Don't check text_mutex during stop_machine
Message-ID: <20210506092000.26fd392b@gandalf.local.home>
In-Reply-To: <20210506071041.417854-1-palmer@dabbelt.com>
References: <20210506071041.417854-1-palmer@dabbelt.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210506_062005_782179_E8C0CDF0 
X-CRM114-Status: GOOD (  21.28  )
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

On Thu,  6 May 2021 00:10:41 -0700
Palmer Dabbelt <palmer@dabbelt.com> wrote:

> diff --git a/arch/riscv/kernel/ftrace.c b/arch/riscv/kernel/ftrace.c
> index 7f1e5203de88..da2405652f1d 100644
> --- a/arch/riscv/kernel/ftrace.c
> +++ b/arch/riscv/kernel/ftrace.c
> @@ -11,6 +11,8 @@
>  #include <asm/cacheflush.h>
>  #include <asm/patch.h>
>  
> +int riscv_ftrace_in_stop_machine;
> +
>  #ifdef CONFIG_DYNAMIC_FTRACE
>  int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
>  {
> @@ -232,3 +234,16 @@ int ftrace_disable_ftrace_graph_caller(void)
>  }
>  #endif /* CONFIG_DYNAMIC_FTRACE */
>  #endif /* CONFIG_FUNCTION_GRAPH_TRACER */
> +
> +void arch_ftrace_update_code(int command)
> +{
> +	/*
> +	 * The code sequences we use for ftrace can't be patched while the
> +	 * kernel is running, so we need to use stop_machine() to modify them
> +	 * for now.  This doesn't play nice with text_mutex, we use this flag
> +	 * to elide the check.
> +	 */
> +	riscv_ftrace_in_stop_machine = true;
> +	ftrace_run_stop_machine(command);
> +	riscv_ftrace_in_stop_machine = false;
> +}
> diff --git a/arch/riscv/kernel/patch.c b/arch/riscv/kernel/patch.c
> index 0b552873a577..7983dba477f0 100644

This would work, but my suggestion was to do it without having to add this
arch function. Because the caller of this is:

static void ftrace_run_update_code(int command)
{
	int ret;

	ret = ftrace_arch_code_modify_prepare();
	FTRACE_WARN_ON(ret);
	if (ret)
		return;

	/*
	 * By default we use stop_machine() to modify the code.
	 * But archs can do what ever they want as long as it
	 * is safe. The stop_machine() is the safest, but also
	 * produces the most overhead.
	 */
	arch_ftrace_update_code(command);

	ret = ftrace_arch_code_modify_post_process();
	FTRACE_WARN_ON(ret);
}


Where you already have two hooks that you use to take the text_mutex before
calling arch_ftrace_update_code().

In RISC-V those are:

int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
{
        mutex_lock(&text_mutex);
        return 0;
}

int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
{
        mutex_unlock(&text_mutex);
        return 0;
}

Where all you have to do is change them to:

int ftrace_arch_code_modify_prepare(void) __acquires(&text_mutex)
{
        mutex_lock(&text_mutex);
	riscv_ftrace_in_stop_machine = true;
        return 0;
}

int ftrace_arch_code_modify_post_process(void) __releases(&text_mutex)
{
	riscv_ftrace_in_stop_machine = false;
        mutex_unlock(&text_mutex);
        return 0;
}

And you have the exact same affect. Those functions are only used before
calling the stop machine code you have.

-- Steve

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
