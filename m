Return-Path: <SRS0=J8tV=BB=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 166DDC433E4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 01:45:06 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D8F902073A
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2020 01:45:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="0YDnN2R7";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=google.com header.i=@google.com header.b="XQHFTK8T"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org D8F902073A
Authentication-Results: mail.kernel.org; dmarc=fail (p=reject dis=none) header.from=google.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Type:
	Content-Transfer-Encoding:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:In-Reply-To:Subject:
	Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	 bh=p9ISEqBFk+HjD11bbXUKyWTefJmMOTsa60AknvGovuw=; b=0YDnN2R76ZrhMgpaTyGFokqM5
	w7eSMUIoormfuiK8asNfx6fMvjMk4d4QIQMWU6OJZc6EjUpWPXGWcnYXpgxrlICjMuLElu9MUXrgJ
	+/SvsbTfMQL1a+KHdkRFyC24MUB/AHkTNRwZQgYi/MfeKwNPb6TrszC90XdQnMSmeCby+TKI4Unqb
	VmybA87cqHu0OJVTu0ALpqWiyrJUqwAXr7wOqrmXtmsZm8bMCCGTlf4yj10cdtYG6PVjfxVZcLjYd
	7Ps8SIzOoxQzEZYPIRB7VZLehk/97nADSukypiM8TWUp219uBMm8q2NqlVIOIMJaiLT4MKLPXlMF6
	6sbOTiCbg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jy3oW-0008IR-Et; Wed, 22 Jul 2020 01:44:56 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jy3oU-0008HY-57
 for linux-riscv@lists.infradead.org; Wed, 22 Jul 2020 01:44:54 +0000
Received: by mail-pl1-x642.google.com with SMTP id p1so186666pls.4
 for <linux-riscv@lists.infradead.org>; Tue, 21 Jul 2020 18:44:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=yRf1KkzEQtnGqiMsmmJMd1M1Ly6X4XyFRu3fx8vPXY0=;
 b=XQHFTK8TLwZMhMuzQyIKFEykOxgVlgNBf9kaI3gUbbLyJWGbwT3FRt8tHlFdtILJ4c
 162oajiVIQqH8z1mqFu5PRaz343GNQwde5dW8LT3G148vliNleRUs5HvY7OBsX/0nzdO
 qbhS0vkY3rnvqHNeTlOB854yvG8n6FdfxEyDRdnQFrtELcOJgj8NCiPdmISu8WcAqbdO
 AoShQJKs6FsZDnsSYHlYzxKbnJKmrMQBX9SwdOH5Ew0MP8n1r5T9Je3XFJt6wqvJUUmR
 yvTngVKx+sAR2oB9r5jHVsZ4bpXAi6kMAHBA61m52VwIXLg+hopolQSiecm6SQUxU24l
 L7yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=yRf1KkzEQtnGqiMsmmJMd1M1Ly6X4XyFRu3fx8vPXY0=;
 b=c4eQoiBU8r+06Zq30wHj25Lsk6WQRNMesnG11iYEoIitPXDadPlWauXzHJz8a7+7XL
 A3srmb5VM0QZPgZQoNqPNB9amTPTQB0XWjYi/ijZ4cijNn/1Qp7s6fE+w5+U4Y+Vg9mO
 AmDHf6yzqbs8XQsG9DYQQzGttM7mwcPI+wBvIVNug/UjzyLg86FYpVYhPyUy8urLr15r
 S4SqyBBNL1NhNHjvtQDqfVptPYeuHCdlBSegeNU9Oiy6HiQNa0vZ+fS2LEraIC5Zkjzc
 1nye7aC+zmQ9MRdWjLGscoye9ZL9tf4p0pSuQdkOX81JlrdXMB9L8ba+lrKuQN3mFwOY
 NBJg==
X-Gm-Message-State: AOAM5302dqsY8pFGY7E9ctywqV/NU5rYzbfqLPs/OU3THN2/6hdS3JbQ
 SEzaiOxeinzrxBVaInIGzHicOQvuheI=
X-Google-Smtp-Source: ABdhPJwywb/lnJmZV4jLcblWIs0VYXUeViGyBDggD6qYivCicW5bfW11E23m5aEUiqrPdmqQ4G5gHA==
X-Received: by 2002:a17:90a:4fa2:: with SMTP id
 q31mr8100898pjh.178.1595382290361; 
 Tue, 21 Jul 2020 18:44:50 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 4sm18359304pgk.68.2020.07.21.18.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Jul 2020 18:44:49 -0700 (PDT)
Date: Tue, 21 Jul 2020 18:44:49 -0700 (PDT)
X-Google-Original-Date: Tue, 21 Jul 2020 18:44:46 PDT (-0700)
Subject: Re: [PATCH] riscv: Cleanup unnecessary define in asm-offset.c
In-Reply-To: <1594561309-65026-1-git-send-email-guoren@kernel.org>
From: Palmer Dabbelt <palmerdabbelt@google.com>
To: guoren@kernel.org
Message-ID: <mhng-6e379a55-7e6a-46aa-8faa-011756333d92@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200721_214454_227457_2499B39C 
X-CRM114-Status: GOOD (  14.71  )
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
Cc: linux-riscv@lists.infradead.org, guoren@linux.alibaba.com,
 guoren@kernel.org, linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Sun, 12 Jul 2020 06:41:49 PDT (-0700), guoren@kernel.org wrote:
> From: Guo Ren <guoren@linux.alibaba.com>
>
>  - TASK_THREAD_SP is duplicated define
>  - TASK_STACK is no use at all
>  - Don't worry about thread_info's offset in task_struct, have
>    a look on comment in include/linux/sched.h:
>
> struct task_struct {
> 	/*
> 	 * For reasons of header soup (see current_thread_info()), this
> 	 * must be the first element of task_struct.
> 	 */
> 	struct thread_info		thread_info;
>
> Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
> ---
>  arch/riscv/kernel/asm-offsets.c | 3 ---
>  arch/riscv/kernel/entry.S       | 5 -----
>  2 files changed, 8 deletions(-)
>
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 07cb9c1..db20344 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -27,9 +27,6 @@ void asm_offsets(void)
>  	OFFSET(TASK_THREAD_S9, task_struct, thread.s[9]);
>  	OFFSET(TASK_THREAD_S10, task_struct, thread.s[10]);
>  	OFFSET(TASK_THREAD_S11, task_struct, thread.s[11]);
> -	OFFSET(TASK_THREAD_SP, task_struct, thread.sp);
> -	OFFSET(TASK_STACK, task_struct, stack);
> -	OFFSET(TASK_TI, task_struct, thread_info);
>  	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
>  	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index cae7e6d..3e8707e 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -389,12 +389,7 @@ ENTRY(__switch_to)
>  	lw a4, TASK_TI_CPU(a1)
>  	sw a3, TASK_TI_CPU(a1)
>  	sw a4, TASK_TI_CPU(a0)
> -#if TASK_TI != 0
> -#error "TASK_TI != 0: tp will contain a 'struct thread_info', not a 'struct task_struct' so get_current() won't work."
> -	addi tp, a1, TASK_TI
> -#else
>  	move tp, a1
> -#endif

Seems reasonable.  That was really there to save anyone who got bit by the
conversion to to THREAD_INFO_IN_TASK.

I've added a comment and put this on for-next.

Thanks!

>  	ret
>  ENDPROC(__switch_to)

Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
