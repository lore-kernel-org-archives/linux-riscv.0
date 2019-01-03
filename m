Return-Path: <SRS0=QYSg=PL=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C5B3C43387
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 05:46:03 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F31DB20883
	for <infradead-linux-riscv@archiver.kernel.org>; Thu,  3 Jan 2019 05:46:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UKZdU+V2";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="noQNsS3w"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F31DB20883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=cYLVeRiPQLET7TJuJQuaXWC2fbp0g+z547ZlTesnUjg=; b=UKZdU+V2upcAyU
	JS8MOkkkf0GgQgr6GGwAqICPSIUX5wax5ak+kFV2mc6+RtQRF8dSjfNwJXthPXcXIuVvO1jboVXZ6
	J8x+QNlxmf7JhHMGmBix3zhhRHXbRHT19Cg4UFrGUqcH06MlTPt/3l+fZjoz7xELwdtfGMyRHc1Ve
	zlCvk9sP86Dw0N1KdxxyvUwyxHCAlJejVuJKOsW837vG+oogrNIzWDjyumOxSDdWTt8Ym+Un2Qcyt
	8fTC8lEXrcY5jwUbzBOLkEhf3JTFeSGT52oPKs/l+yQ4G7B6l7GmE0kJzsZzfeVoW/kQl0tvl95LE
	xw0bt64EAfXiIIFzHOPw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gevpR-0005eG-F1; Thu, 03 Jan 2019 05:46:01 +0000
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gevpO-0005dk-9D
 for linux-riscv@lists.infradead.org; Thu, 03 Jan 2019 05:46:00 +0000
Received: by mail-pf1-x444.google.com with SMTP id 64so16176254pfr.9
 for <linux-riscv@lists.infradead.org>; Wed, 02 Jan 2019 21:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=g+vz4pPvmeQuaxVMah67xFgUjNCUPF9/TsQuGb3t6j0=;
 b=noQNsS3wDH9oXeRvqCnsKwgRj6+ooPS01tKCo06zlL8cvEKmE3mcH4pq2sevtG2CEL
 UFO0y171XRC8FP0N+FmjkX48I2bfwtRJyQpwTHWAsVRkQduYlP8UVFkam8VDt72eThN3
 76U5v6HCY755WJp0U4uzQeOx50zrc6KA5zT3b8uTfKNelitju9eq3NSF5t2s+meMReFw
 GNhxoha05HHGAMgu41hOBELVxY0C/anSlj+w8fBrYVdw5efhEKvbEBOTO97Y4AQp88J/
 6g9PqP9UwkGuxo3c3RNW3g5Cz7u8PHDA3m6qrQRL6cNUKt6TckTNvvf7K49REiWsc3HT
 YBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=g+vz4pPvmeQuaxVMah67xFgUjNCUPF9/TsQuGb3t6j0=;
 b=mR6rTuIiOmVNsMsEFBCZrpPGGHTLpglY2qVEK9ZIH1+HVGKR21Q/X90ut+XKYl9n+m
 lLdeww85MLJMnxgh2ToSt8CyOrQWCOhepen3B1VeM0NnThg0QkGfJwlhR82JlGXqijNQ
 kTYRRz9rI8X7nWiKp1OWkBygQaOOQWX2VXoxlQCxaC3CoBT83bsv0JdbwxuCsECgYoUa
 xWiHcpuXdmGre2Dp99RtN3CxNxaGbDcqKqp7v6J9diEIU/UpozUiRPkZVLmqk0jrPVeF
 3Cg8H0loZ4HcQV+D1io8/qRn6AlqwonnBO9M+JU9BvdzDDi4fO8C+Cdfa7MJ+pucriWL
 m+CQ==
X-Gm-Message-State: AJcUukd/cIygcKYRZQwJO9He0OFVEIOnPIYez6aYFJu4YR0JOCxx/NG6
 mIUUeSnVfMqouCWH4tx5Ua8=
X-Google-Smtp-Source: ALg8bN5f8nI5PviGz1VxnK5EsmLniW1VrGXqWwjoB5iyycn4/Wr0iugrhCna1AR9MIbrHo3we2FpeQ==
X-Received: by 2002:a65:590b:: with SMTP id f11mr15955116pgu.60.1546494357036; 
 Wed, 02 Jan 2019 21:45:57 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
 by smtp.gmail.com with ESMTPSA id o8sm105518525pfa.42.2019.01.02.21.45.55
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 02 Jan 2019 21:45:56 -0800 (PST)
Date: Wed, 2 Jan 2019 21:45:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Chen <vincentc@andestech.com>
Subject: Re: [PATCH] RISC-V: Add _TIF_NEED_RESCHED check for kernel thread
 when CONFIG_PREEMPT=y
Message-ID: <20190103054555.GA30904@roeck-us.net>
References: <1546486353-23115-1-git-send-email-vincentc@andestech.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1546486353-23115-1-git-send-email-vincentc@andestech.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190102_214558_351465_3C2E7D5E 
X-CRM114-Status: GOOD (  16.33  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, aou@eecs.berkeley.edu, arnd@arndb.de,
 palmer@sifive.com, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

On Thu, Jan 03, 2019 at 11:32:33AM +0800, Vincent Chen wrote:
> The cond_resched() can be used to yield the CPU resource if
> CONFIG_PREEMPT is not defined. Otherwise, cond_resched() is a dummy
> function. In order to avoid kernel thread occupying entire CPU,
> when CONFIG_PREEMPT=y, the kernel thread needs to follow the
> rescheduling mechanism like a user thread.
> 
> Signed-off-by: Vincent Chen <vincentc@andestech.com>

This patch seems to do the trick. I no longer see a problem with
CONFIG_PREEMPT=y and the various lock torture tests enabled, as
previously reported.

Nice catch and fix.

Tested-by: Guenter Roeck <linux@roeck-us.net>

Guenter

> ---
>  arch/riscv/kernel/asm-offsets.c |    1 +
>  arch/riscv/kernel/entry.S       |   18 +++++++++++++++++-
>  2 files changed, 18 insertions(+), 1 deletions(-)
> 
> diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
> index 6a92a2f..dac9834 100644
> --- a/arch/riscv/kernel/asm-offsets.c
> +++ b/arch/riscv/kernel/asm-offsets.c
> @@ -39,6 +39,7 @@ void asm_offsets(void)
>  	OFFSET(TASK_STACK, task_struct, stack);
>  	OFFSET(TASK_TI, task_struct, thread_info);
>  	OFFSET(TASK_TI_FLAGS, task_struct, thread_info.flags);
> +	OFFSET(TASK_TI_PREEMPT_COUNT, task_struct, thread_info.preempt_count);
>  	OFFSET(TASK_TI_KERNEL_SP, task_struct, thread_info.kernel_sp);
>  	OFFSET(TASK_TI_USER_SP, task_struct, thread_info.user_sp);
>  	OFFSET(TASK_TI_CPU, task_struct, thread_info.cpu);
> diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
> index 13d4826..728b72d 100644
> --- a/arch/riscv/kernel/entry.S
> +++ b/arch/riscv/kernel/entry.S
> @@ -144,6 +144,10 @@ _save_context:
>  	REG_L x2,  PT_SP(sp)
>  	.endm
>  
> +#if !IS_ENABLED(CONFIG_PREEMPT)
> +#define resume_kernel restore_all
> +#endif
> +
>  ENTRY(handle_exception)
>  	SAVE_ALL
>  
> @@ -228,7 +232,7 @@ ret_from_exception:
>  	REG_L s0, PT_SSTATUS(sp)
>  	csrc sstatus, SR_SIE
>  	andi s0, s0, SR_SPP
> -	bnez s0, restore_all
> +	bnez s0, resume_kernel
>  
>  resume_userspace:
>  	/* Interrupts must be disabled here so flags are checked atomically */
> @@ -250,6 +254,18 @@ restore_all:
>  	RESTORE_ALL
>  	sret
>  
> +#if IS_ENABLED(CONFIG_PREEMPT)
> +resume_kernel:
> +	REG_L s0, TASK_TI_PREEMPT_COUNT(tp)
> +	bnez s0, restore_all
> +need_resched:
> +	REG_L s0, TASK_TI_FLAGS(tp)
> +	andi s0, s0, _TIF_NEED_RESCHED
> +	beqz s0, restore_all
> +	call preempt_schedule_irq
> +	j need_resched
> +#endif
> +
>  work_pending:
>  	/* Enter slow path for supplementary processing */
>  	la ra, ret_from_exception

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
