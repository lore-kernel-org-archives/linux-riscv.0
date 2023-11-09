Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D58D3C4332F
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Nov 2023 03:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=akheSsfgzgRwhUCnR67lThVS5mD1tYntJfkqWRqGB8g=; b=iVOHmJR5gh2ZBfCsTv7N2za2UV
	XenOzM+LeK8qt+MZWlWc9gXfOc6TwnXENwjzIpPKBSiutq8etTZJnUF6yUxiUG5lJRzd17gC5UOVm
	EvX2QFMwDtLpjsWV5rq9CDcsX2E5SWvPKxLI6Zy9ehU1s9BhSjVrhxeJ6SsG2t/Lnp5UHiZGD9MOc
	QStrsBhF+mVXcNm3AaBtN8vEu6YHDmgjRrFO6y3FMaoReD+56bQnn8BgijZSYZ63Y80hqtWLGOz5d
	HOwljz9uJF1BtDTd45sunoMYeBiNfUy42K7D6LrZrWByXmwdnuq/lOnf08Boy0tI1opUicmTrCxUA
	3gsULNLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r0w1O-005Ci5-30;
	Thu, 09 Nov 2023 03:47:58 +0000
Received: from mail-pg1-x529.google.com ([2607:f8b0:4864:20::529])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r0w1K-005ChK-0K
	for linux-riscv@lists.infradead.org;
	Thu, 09 Nov 2023 03:47:56 +0000
Received: by mail-pg1-x529.google.com with SMTP id 41be03b00d2f7-5bd5809f63aso309244a12.3
        for <linux-riscv@lists.infradead.org>; Wed, 08 Nov 2023 19:47:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1699501671; x=1700106471; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=T3uuAi3G0X6OpIHwR9Kx+exCB4k+x+TH2JOVCfjs18U=;
        b=NXKw+t3Z3Pi0aP887H2JIQ8elwg4oZICU16IsBa8ZOYacNFeTZz550HrH2mYlOZD9/
         4YXETohB0BdkFjxBJ4s5nwMMxiAmU3ApxLcRyH7KrBD7dK7o3u2nj/zUzj6MCvBdDiVH
         CHZ3Ci6wa9Zba+HXXk1Qh8HUWpJ14a9z+Gc1mQ4JvY8r9XPjsd8SDuRGiIwte8hyQCYK
         fcFM6/sHr1Uzo892nOaawwikLZCqJdpEZsG28YlmZpFk3B5Zz8sNJjXkTmF8W+tIU9P/
         8Gs9KReii/hCz8aGustCNv1hOC9lX20YQD209q7XP536nfdH3f+NyZOaWGJgAgvidplH
         NLKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699501671; x=1700106471;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3uuAi3G0X6OpIHwR9Kx+exCB4k+x+TH2JOVCfjs18U=;
        b=fWNkXg4wt9bD466BEEkpU37GvPbTQybR+1NmRLbsmJgBaWWrHQ09mjO3d10MTqegcN
         v3SfXmT7b4MgBjJk9ZkBqsDOzJoHbwAwCJmq6wr6tR2W3Eau4DxZ6pGB4ThytM3mQGTA
         t+XIXZ1KqoFcgdAX1PIz8J6xIRrjhdu2LYt7UGOUWR8/so67+s/cWytDIfnt8a7TFkbf
         XFlAHaUatWO/706g8dKARB5vDe5rOgIpyoci0TUoRcD3A1UTq4eEygxDAbAQd5WO87HI
         YSD0umqp406WN2ngG7FSRJ+M/QYgei7PoCGlYOSnMCQdP9yAmXsZcgXHj8mixd6zzPVj
         eN+A==
X-Gm-Message-State: AOJu0Yyq3cSw+qw1eBudNrfpuMigee5TTtwexgBnBML+tmtb/wRh1nL5
	tEsrCJlyfOosyZAp/nBDPSkSTA==
X-Google-Smtp-Source: AGHT+IGd95v1zf1mFgt3p+A2cD4Le4/ZKMGHeN96e3WanzcnJLKSR08bIEh6isDGiR4jdH35vgs7Bw==
X-Received: by 2002:a05:6a20:9f90:b0:174:63a9:2aa with SMTP id mm16-20020a056a209f9000b0017463a902aamr4999017pzb.18.1699501671292;
        Wed, 08 Nov 2023 19:47:51 -0800 (PST)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id z6-20020a170903018600b001b03a1a3151sm2426300plg.70.2023.11.08.19.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Nov 2023 19:47:49 -0800 (PST)
Date: Wed, 08 Nov 2023 19:47:49 -0800 (PST)
X-Google-Original-Date: Wed, 08 Nov 2023 19:47:45 PST (-0800)
Subject: Re: [PATCH] riscv: Support RANDOMIZE_KSTACK_OFFSET
In-Reply-To: <202311081552.062D21EB@keescook>
CC: songshuaishuai@tinylab.org, Paul Walmsley <paul.walmsley@sifive.com>,
  aou@eecs.berkeley.edu, guoren@kernel.org, Bjorn Topel <bjorn@rivosinc.com>, jszhang@kernel.org,
  Conor Dooley <conor.dooley@microchip.com>, andy.chiu@sifive.com, samitolvanen@google.com, coelacanthushex@gmail.com,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To: keescook@chromium.org
Message-ID: <mhng-32bb45f6-c7eb-4afb-a42a-a167a83ca760@palmer-ri-x1c9>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231108_194755_168585_2606735A 
X-CRM114-Status: GOOD (  26.34  )
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

On Wed, 08 Nov 2023 15:52:34 PST (-0800), keescook@chromium.org wrote:
> On Wed, Nov 01, 2023 at 02:44:23PM +0800, Song Shuai wrote:
>> Inspired from arm64's implement -- commit 70918779aec9
>> ("arm64: entry: Enable random_kstack_offset support")
>>
>> Add support of kernel stack offset randomization while handling syscall,
>> the offset is defaultly limited by KSTACK_OFFSET_MAX() (i.e. 10 bits).
>>
>> In order to avoid trigger stack canaries (due to __builtin_alloca) and
>> slowing down the entry path, use __no_stack_protector attribute to
>> disable stack protector for do_trap_ecall_u() at the function level.
>>
>> Signed-off-by: Song Shuai <songshuaishuai@tinylab.org>
>
> I can't speak to the correctness of the entropy level, but the usage of
> the helpers looks correct to me.

As far as I can tell the comment matches how the system behaves.  I'm 
not sure if that much entropy is useful.  I was poking around for a bit 
to try and figure that out, but after reading that comment at the top of 
include/linux/randomize_kstack.h I decided to stop ;)

So aside from those whitespace errors Damien pointed out,

Reviewed-by: Palmer Dabbelt <palmer@rivosinc.com>

It's too late for the merge window for me, but

Acked-by: Palmer Dabbelt <palmer@rivosinc.com>

in case someone else wants to take it still.  Otherwise I'll try and 
remember to pick it up right after the merge window, but with Plumbers 
things might be a bit clunky.

> Reviewed-by: Kees Cook <keescook@chromium.org>
>
> -Kees
>
>> ---
>> Testing with randomize_kstack_offset=y cmdline, lkdtm/stack-entropy.sh
>> showed appropriate stack offset instead of zero.
>> ---
>>  arch/riscv/Kconfig        |  1 +
>>  arch/riscv/kernel/traps.c | 18 +++++++++++++++++-
>>  2 files changed, 18 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
>> index d607ab0f7c6d..0e843de33f0c 100644
>> --- a/arch/riscv/Kconfig
>> +++ b/arch/riscv/Kconfig
>> @@ -100,6 +100,7 @@ config RISCV
>>  	select HAVE_ARCH_KGDB_QXFER_PKT
>>  	select HAVE_ARCH_MMAP_RND_BITS if MMU
>>  	select HAVE_ARCH_MMAP_RND_COMPAT_BITS if COMPAT
>> +	select HAVE_ARCH_RANDOMIZE_KSTACK_OFFSET
>>  	select HAVE_ARCH_SECCOMP_FILTER
>>  	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
>>  	select HAVE_ARCH_TRACEHOOK
>> diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
>> index 19807c4d3805..3f869b2d47c3 100644
>> --- a/arch/riscv/kernel/traps.c
>> +++ b/arch/riscv/kernel/traps.c
>> @@ -6,6 +6,7 @@
>>  #include <linux/cpu.h>
>>  #include <linux/kernel.h>
>>  #include <linux/init.h>
>> +#include <linux/randomize_kstack.h>
>>  #include <linux/sched.h>
>>  #include <linux/sched/debug.h>
>>  #include <linux/sched/signal.h>
>> @@ -296,9 +297,11 @@ asmlinkage __visible __trap_section void do_trap_break(struct pt_regs *regs)
>>  	}
>>  }
>>
>> -asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
>> +asmlinkage __visible __trap_section  __no_stack_protector
>> +void do_trap_ecall_u(struct pt_regs *regs)
>>  {
>>  	if (user_mode(regs)) {
>> +
>>  		long syscall = regs->a7;
>>
>>  		regs->epc += 4;
>> @@ -308,10 +311,23 @@ asmlinkage __visible __trap_section void do_trap_ecall_u(struct pt_regs *regs)
>>
>>  		syscall = syscall_enter_from_user_mode(regs, syscall);
>>
>> +		add_random_kstack_offset();
>> +
>>  		if (syscall >= 0 && syscall < NR_syscalls)
>>  			syscall_handler(regs, syscall);
>>  		else if (syscall != -1)
>>  			regs->a0 = -ENOSYS;
>> +		/*
>> +		 * Ultimately, this value will get limited by KSTACK_OFFSET_MAX(),
>> +		 * so the maximum stack offset is 1k bytes (10 bits).
>> +		 *
>> +		 * The actual entropy will be further reduced by the compiler when
>> +		 * applying stack alignment constraints: 16-byte (i.e. 4-bit) aligned
>> +		 * for RV32I or RV64I.
>> +		 *
>> +		 * The resulting 6 bits of entropy is seen in SP[9:4].
>> +		 */
>> +		choose_random_kstack_offset(get_random_u16());
>>
>>  		syscall_exit_to_user_mode(regs);
>>  	} else {
>> --
>> 2.20.1
>>

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
