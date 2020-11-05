Return-Path: <SRS0=pYMt=EL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27D11C55178
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 16:18:21 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4392F20739
	for <linux-riscv@archiver.kernel.org>; Thu,  5 Nov 2020 16:18:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="vvnTBYGD";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel-dk.20150623.gappssmtp.com header.i=@kernel-dk.20150623.gappssmtp.com header.b="o2TZpQ9r"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4392F20739
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=kernel.dk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:In-Reply-To:MIME-Version:Date:Message-ID:References:To:From:Subject:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7T4rnAu2IRrW1U//IY1tDEiAtHYfC3NIV6WBOZP0iY=; b=vvnTBYGDwpn24mmUWOkYmAZZCE
	CgNdaoIyqVomaabDhfNt6VV1It8tOxFTT03LPKhqMpJV94j1XJkrRJgLBOtYCurFWQ+590qbTfw69
	p1Gp5HkLUKqRDPl2JgJJsud54Y2nIgBdZtIVOjetkFPM9JaH8VDBGyK/UDeV/TWnkSszg8hDSdAlN
	eMgIoeli84AV3qTED/j4fdXtytNRufhbqoBlYae0HYw9sWTg8IuhFgQU1dlHhowWuLgPL0oiiNnbW
	/l5R/NqTZDb8NR1QkjbvxDvAbvrwmKyCUKygu2MPOilkfJ2m+akiZ37qHRz/rWjyHlhD67wiOYq5f
	DzdcZ/JA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kahxX-0003yV-20; Thu, 05 Nov 2020 16:17:59 +0000
Received: from mail-il1-x141.google.com ([2607:f8b0:4864:20::141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kahxU-0003y7-F7
 for linux-riscv@lists.infradead.org; Thu, 05 Nov 2020 16:17:57 +0000
Received: by mail-il1-x141.google.com with SMTP id x7so1879532ili.5
 for <linux-riscv@lists.infradead.org>; Thu, 05 Nov 2020 08:17:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kernel-dk.20150623.gappssmtp.com; s=20150623;
 h=subject:from:to:references:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=oJ3djDSGRHmt1eUFKbE+TLUdnNJXKusGspS7dyWFlO0=;
 b=o2TZpQ9r191LomQ28oY+oRw+vGAkuEIzLjVP12YQ1JpAN4wpvkgtMGU811UCfh5UWA
 gKOoGzNOoNOO1TOW/2LE+K9U/e+HG8IoYr30S7fPik1Q2mNJ0lZOVccvgQ0l0mLd3ROJ
 oZKNYLJ0F5XbRMBiMb/khlhbpEdHr3Z8aN2xHPt8i656Ja8q28D7RV3xyphd3YQ6Mrjo
 6D2Dl/veSvaS75Nkhg5SHt+IQWcaiiI1+2/NbRVi53TTukP2330D6tv55CZAnVqADfZO
 nRvCaiEEgkZsBtJ/Us26aaionLibVipTWkohtkJOXz1MK0ejK8BC8RdSIW4YW3QjJVZz
 N6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:from:to:references:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=oJ3djDSGRHmt1eUFKbE+TLUdnNJXKusGspS7dyWFlO0=;
 b=BPqvOQ8EU96/l4GO4XCl+sxyy1/YDzvYZnfT5g+x5vkMeNuzSbA2ACFwht61ABpsAx
 HjGTf7Dip7lwg/yEg/P11X6FR+7v+Vede6i1iToGQrOXlRv+T3/KuGi8uKRX3nYfOQUn
 fNvXjecQfnhQecHJONngZCE+eMCVokh4PboIkBLiY32zO2FgH5+4dEDB314i5kI5wEf7
 L2JZcAKEZAHycMEG6GcCHv1rg8DuvBeHBF52iQHVlGcMKvUba7SVUKwZE+BBEVjAAasj
 Eib9odN/q3Y3dvJMGAObu6xZCiKwyiB0wXmx8Wqaei2obYaelCsOogzE5PPuyprSSz9g
 nV+w==
X-Gm-Message-State: AOAM530Ij5JiVYCwjPlD9IpDObdN+ulAxS0JIUem60LBDgcJY2RRr165
 1inZYtqPGtKVA3WVWZbjBjiI+sCLzMMj0g==
X-Google-Smtp-Source: ABdhPJz3p4zuDwj+/5QM3OXGZR8ftGKy+Jsvc0i4aYKtOahAN7HSv8DazEL1+QDC5wvlJYFihoi50Q==
X-Received: by 2002:a92:5409:: with SMTP id i9mr2273328ilb.67.1604593074386;
 Thu, 05 Nov 2020 08:17:54 -0800 (PST)
Received: from [192.168.1.30] ([65.144.74.34])
 by smtp.gmail.com with ESMTPSA id e4sm1517550ill.70.2020.11.05.08.17.53
 for <linux-riscv@lists.infradead.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Nov 2020 08:17:53 -0800 (PST)
Subject: Re: [PATCH] riscv: add support for TIF_NOTIFY_SIGNAL
From: Jens Axboe <axboe@kernel.dk>
To: linux-riscv@lists.infradead.org
References: <71abc829-29df-06fb-a6d4-6e32b7042af8@kernel.dk>
Message-ID: <6ea57b87-b23a-52e3-3fe7-1c5deaaa31c4@kernel.dk>
Date: Thu, 5 Nov 2020 09:17:53 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <71abc829-29df-06fb-a6d4-6e32b7042af8@kernel.dk>
Content-Language: en-US
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201105_111756_534346_A2CBCF0A 
X-CRM114-Status: GOOD (  22.06  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
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

Gentle nudge on this one.

On 10/29/20 10:20 AM, Jens Axboe wrote:
> Wire up TIF_NOTIFY_SIGNAL handling for riscv.
> 
> Cc: linux-riscv@lists.infradead.org
> Signed-off-by: Jens Axboe <axboe@kernel.dk>
> ---
> 
> 5.11 has support queued up for TIF_NOTIFY_SIGNAL, see this posting
> for details:
> 
> https://lore.kernel.org/io-uring/20201026203230.386348-1-axboe@kernel.dk/
> 
> As part of that work, I'm adding TIF_NOTIFY_SIGNAL support to all archs,
> as that will enable a set of cleanups once all of them support it. I'm
> happy carrying this patch if need be, or it can be funelled through the
> arch tree. Let me know.
> 
>  arch/riscv/include/asm/thread_info.h | 5 ++++-
>  arch/riscv/kernel/signal.c           | 2 +-
>  2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/riscv/include/asm/thread_info.h b/arch/riscv/include/asm/thread_info.h
> index a390711129de..97bf5a1575d2 100644
> --- a/arch/riscv/include/asm/thread_info.h
> +++ b/arch/riscv/include/asm/thread_info.h
> @@ -74,6 +74,7 @@ struct thread_info {
>  #define TIF_SYSCALL_TRACEPOINT  6       /* syscall tracepoint instrumentation */
>  #define TIF_SYSCALL_AUDIT	7	/* syscall auditing */
>  #define TIF_SECCOMP		8	/* syscall secure computing */
> +#define TIF_NOTIFY_SIGNAL	9	/* signal notifications exist */
>  
>  #define _TIF_SYSCALL_TRACE	(1 << TIF_SYSCALL_TRACE)
>  #define _TIF_NOTIFY_RESUME	(1 << TIF_NOTIFY_RESUME)
> @@ -82,9 +83,11 @@ struct thread_info {
>  #define _TIF_SYSCALL_TRACEPOINT	(1 << TIF_SYSCALL_TRACEPOINT)
>  #define _TIF_SYSCALL_AUDIT	(1 << TIF_SYSCALL_AUDIT)
>  #define _TIF_SECCOMP		(1 << TIF_SECCOMP)
> +#define _TIF_NOTIFY_SIGNAL	(1 << TIF_NOTIFY_SIGNAL)
>  
>  #define _TIF_WORK_MASK \
> -	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED)
> +	(_TIF_NOTIFY_RESUME | _TIF_SIGPENDING | _TIF_NEED_RESCHED | \
> +	 _TIF_NOTIFY_SIGNAL)
>  
>  #define _TIF_SYSCALL_WORK \
>  	(_TIF_SYSCALL_TRACE | _TIF_SYSCALL_TRACEPOINT | _TIF_SYSCALL_AUDIT | \
> diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
> index bc6841867b51..469aef8ed922 100644
> --- a/arch/riscv/kernel/signal.c
> +++ b/arch/riscv/kernel/signal.c
> @@ -310,7 +310,7 @@ asmlinkage __visible void do_notify_resume(struct pt_regs *regs,
>  					   unsigned long thread_info_flags)
>  {
>  	/* Handle pending signal delivery */
> -	if (thread_info_flags & _TIF_SIGPENDING)
> +	if (thread_info_flags & (_TIF_SIGPENDING | _TIF_NOTIFY_SIGNAL))
>  		do_signal(regs);
>  
>  	if (thread_info_flags & _TIF_NOTIFY_RESUME)
> 


-- 
Jens Axboe


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
