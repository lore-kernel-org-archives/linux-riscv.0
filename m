Return-Path: <SRS0=Qta6=KR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D166C2B9F2
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 16:29:24 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id ADE8F60FE5
	for <linux-riscv@archiver.kernel.org>; Sat, 22 May 2021 16:29:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org ADE8F60FE5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Type:
	Content-Transfer-Encoding:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Mime-Version:Message-ID:To:From:CC:In-Reply-To:
	Subject:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=eXkxiEGIZYuU6dUodCibve/QBL7Yf7K1RCifFDjhp3E=; b=LnRmjfAvl+93GVjz9CXd2Wdzli
	0DLOdKchuvcmvDUvbVOgk01qVKi7tDNc87kSeW8L+7gZIMYfk7mv5GrZmv7Chk925gzPRRAcqXSDJ
	fzx6a1fKKZ6An1VoVor5acpjN2vpIjzr4cZhlw5qhZMKlckj1+OLG0RY/FEgm3tHe3/GoajoVpHsH
	9c2qlvQ9VJ/gWkswyQ5O+ouOE3bEXTiZiEv6/JLo1wodqXZgnAOL598F7wlZEGhQ8Vf92Q3BNnViq
	X5whioKJBTiPzUfTXEhhMQ1jneNII6bNy/jDRcY3TX6jNkTuio9BDNT9GBQkG6IiOlgYjqjaRILD5
	8lUXa3yA==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lkUUw-002mwc-Qv; Sat, 22 May 2021 16:29:10 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lkUUs-002mv6-1E
 for linux-riscv@desiato.infradead.org; Sat, 22 May 2021 16:29:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 Content-Type:Mime-Version:Message-ID:To:From:CC:In-Reply-To:Subject:Date:
 Sender:Reply-To:Content-ID:Content-Description:References;
 bh=/RjwXMDGGnLqgaP+DWL1fFHxiRPZNOvS4B48swsRTno=; b=I1FYPt/InHZzjPHg12xxWJKYo2
 eaOmyEiVsTyd89IqyPC0imcaB86krB2hwDIKTZUVToG8r1d8IyXlqPBeLFgmqSA1P1YEEF/Ew/1fE
 ytUZBNct/iFQVnA1p2ttaY0cWSrBT4iMzGqDWFhM4cFYD/CGeSOoCOdbXlxdbnZ/eivoZ3G6quLC0
 cQmjo/NOB1d7ZNEVG+58GvTg8HYbsaOmBMiVu2tkbYsLZ/k9VDx82Iih3utsFy02DNXOhH7w4dGz7
 5DPH02opAsI0TvtfAHQPnV3qIfIy/FCuP0NHozNqJJTt2QyIN63e0vAJc0GaoQNrzqamvbjcjCGrp
 IOM8jFTg==;
Received: from mail-pf1-x42f.google.com ([2607:f8b0:4864:20::42f])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lkUUo-0009Gv-Sm
 for linux-riscv@lists.infradead.org; Sat, 22 May 2021 16:29:04 +0000
Received: by mail-pf1-x42f.google.com with SMTP id d16so17254401pfn.12
 for <linux-riscv@lists.infradead.org>; Sat, 22 May 2021 09:29:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
 h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
 :content-transfer-encoding;
 bh=/RjwXMDGGnLqgaP+DWL1fFHxiRPZNOvS4B48swsRTno=;
 b=Yk9YcEOZYVBiMRvYaE90Pi5hY2g5vjGYFM9Km5zSuBd29JjSD/9m8S/v/cbSAYPoyM
 tFJw6tdHtPpuwXlqpyaIxqdtgSnYd4eCgQU3HYrElZ1OVlJB12QrOtTuzbv8+AbDg5KG
 4/aZJo0CGytDRppLMQiIQrCULMZZz//pPyXGMtFgF8exX04PQz1puII95xXz7ciFKZck
 Y2Fx9iyzlR/qD8qpuR0fB9LAWFyCVE3GTs/PCvtNAJ4AhD0bXyR3l3j62CNWmBxW2C7c
 olhL8+pc2BaEDqu6b13sbjdPuzCDcKN4Vk6++PDRsTwRbkqp38r2rGu4kf8aRyhUPyHh
 k91g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
 :mime-version:content-transfer-encoding;
 bh=/RjwXMDGGnLqgaP+DWL1fFHxiRPZNOvS4B48swsRTno=;
 b=Q1sG3hftEBLPg7elF0BHo2xjn/IO+TQAGtaQhQnEjNfhClUByDKeuIUfy8LwDl218s
 r3QZcpIyllqTqljnV33T95pgTa2e2OtLKAPopdS4UNZTYN6sAUo8pm7c3LYAIP701PUI
 hWpRCddCoTRkdQ5eMrfUgSjSH3tqXMf6ea0Zr1bWr3cvEom8tFrUiMKLxvCnmIafsWdx
 Kkhpb2JbiOGA6Tr+/a6B5HhF67GSU4/x4+IkNF3YVtQxTTL6nDAZ2FUP2b+IYplgQ3km
 8YXgnKVEAkKfj8hUATkid8cfbqVISom1+zwSzOQ0USRfHrKrYqZ7u/kP6ncqSkCIKBV9
 +OZw==
X-Gm-Message-State: AOAM530fL2e6XhobwyoCp3nPy0BEYfroigp0UVxLiubohkHA091jWXaQ
 RqhrklZnBsqgrv6At+Q8PfLlSA==
X-Google-Smtp-Source: ABdhPJx/Pj3xp/rwchxS8fQtYfwR9q2R8JILzlEMehK9apXsKpjwxWvONYFepuAKalp9Wo590QIVcA==
X-Received: by 2002:a63:e642:: with SMTP id p2mr4752588pgj.316.1621700941978; 
 Sat, 22 May 2021 09:29:01 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net.
 [76.210.143.223])
 by smtp.gmail.com with ESMTPSA id 204sm6844905pfy.56.2021.05.22.09.29.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 22 May 2021 09:29:01 -0700 (PDT)
Date: Sat, 22 May 2021 09:29:01 -0700 (PDT)
X-Google-Original-Date: Sat, 22 May 2021 09:28:58 PDT (-0700)
Subject: Re: [RFC PATCH] riscv: stacktrace: fix the riscv stacktrace when
 CONFIG_FRAME_POINTER enabled
In-Reply-To: <20210429070348.2167483-1-chenhuang5@huawei.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu,
 wangkefeng.wang@huawei.com, 0x7f454c46@gmail.com,
 linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, chenhuang5@huawei.com
From: Palmer Dabbelt <palmer@dabbelt.com>
To: chenhuang5@huawei.com
Message-ID: <mhng-75c14e1e-a23c-404b-a1f6-235e53bdb6f3@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210522_092902_958277_05E3F26B 
X-CRM114-Status: GOOD (  23.58  )
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

On Thu, 29 Apr 2021 00:03:48 PDT (-0700), chenhuang5@huawei.com wrote:
> As [1] and [2] said, the arch_stack_walk should not to trace itself, or it will
> leave the trace unexpectedly when called. The example is when we do "cat
> /sys/kernel/debug/page_owner", all pages' stack is the same.
>
> arch_stack_walk+0x18/0x20
> stack_trace_save+0x40/0x60
> register_dummy_stack+0x24/0x5e
> init_page_owner+0x2e
>
> So we use __builtin_frame_address(1) as the first frame to be walked. And mark
> the arch_stack_walk() noinline.
>
> We found that pr_cont will affact pages' stack whose task state is RUNNING when
> testing "echo t > /proc/sysrq-trigger". So move the place of pr_cont and mark
> the function dump_backtrace() noinline.
>
> Also we move the case when task == NULL into else branch, and test for it in
> "echo c > /proc/sysrq-trigger".
>
> [1] https://lore.kernel.org/lkml/20210319184106.5688-1-mark.rutland@arm.com/
> [2] https://lore.kernel.org/lkml/20210317142050.57712-1-chenjun102@huawei.com/
>
> Signed-off-by: Chen Huang <chenhuang5@huawei.com>
> ---
> In this way, some crash will loss the print info "Call trace:", likes that:
> # echo BUG > /sys/kernel/debug/provoke-crash/DIRECT
> [   61.774690] lkdtm: Performing direct entry BUG
> [   61.775350] ------------[ cut here ]------------
> [   61.775611] kernel BUG at drivers/misc/lkdtm/bugs.c:76!
> [   61.776073] Kernel BUG [#1]
> [   61.776319] Modules linked in:
> [   61.776696] CPU: 3 PID: 1 Comm: sh Not tainted 5.11.0-rc6-next-20210208-00013-gb16da2c3b9aa #132
> [   61.777185] Hardware name: riscv-virtio,qemu (DT)
> [   61.777594] epc : lkdtm_BUG+0x6/0x8
> [   61.777916]  ra : lkdtm_do_action+0x14/0x1c
> [   61.778212] epc : ffffffe00048a7e8 ra : ffffffe0006d71a8 sp : ffffffe07fedbd90
> [   61.778646]  gp : ffffffe0012e4208 tp : ffffffe07fed0000 t0 : ffffffe0012f2097
> [   61.779115]  t1 : ffffffe0012f2088 t2 : 0000000000000000 s0 : ffffffe07fedbda0
> [   61.779588]  s1 : 0000000000000010 a0 : ffffffe000c7fbb8 a1 : ffffffe001284d28
> [   61.780017]  a2 : 0000000000000010 a3 : 0000000000000000 a4 : c10724222fbe9200
> [   61.780473]  a5 : ffffffe00048a7e2 a6 : c0000000ffffefff a7 : 0000000000000064
> [   61.780932]  s2 : ffffffe000c7fbc8 s3 : ffffffe000d9e3f8 s4 : ffffffe081969000
> [   61.781405]  s5 : 000000000000004b s6 : 0000000000000004 s7 : ffffffe07fedbe80
> [   61.781872]  s8 : 0000003ffff987e4 s9 : 0000002ab0b7ac50 s10: 0000002ab0bacb90
> [   61.782336]  s11: 0000000000000000 t3 : 000000000000006c t4 : ffffffffffffffff
> [   61.782794]  t5 : 0000000000000037 t6 : ffffffe07fedbae8
> [   61.783158] status: 0000000000000120 badaddr: 0000000000000000 cause: 0000000000000003
> [   61.783680] [<ffffffe00048a7e8>] lkdtm_BUG+0x6/0x8
> [   61.784149] [<ffffffe0006d71a8>] lkdtm_do_action+0x14/0x1c
> [   61.784516] [<ffffffe00048a5ee>] direct_entry+0xc0/0x10a
> [   61.784849] [<ffffffe0002498ce>] full_proxy_write+0x42/0x6a
> [   61.785209] [<ffffffe000114b7c>] vfs_write+0x7e/0x218
> [   61.785562] [<ffffffe000114e84>] ksys_write+0x98/0xc0
> [   61.785904] [<ffffffe000114eba>] sys_write+0xe/0x16
> [   61.786275] [<ffffffe000003466>] ret_from_syscall+0x0/0x2
> [   61.787175] ---[ end trace 6919e7283b64f492 ]---
> [   61.787707] Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b
> [   61.788270] SMP: stopping secondary CPUs
> [   61.788934] ---[ end Kernel panic - not syncing: Attempted to kill init! exitcode=0x0000000b ]---
>
>  arch/riscv/kernel/stacktrace.c | 14 +++++++-------
>  1 file changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
> index 2b3e0cb90d78..bde85fc53357 100644
> --- a/arch/riscv/kernel/stacktrace.c
> +++ b/arch/riscv/kernel/stacktrace.c
> @@ -27,10 +27,10 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
>  		fp = frame_pointer(regs);
>  		sp = user_stack_pointer(regs);
>  		pc = instruction_pointer(regs);
> -	} else if (task == NULL || task == current) {
> -		fp = (unsigned long)__builtin_frame_address(0);
> -		sp = sp_in_global;
> -		pc = (unsigned long)walk_stackframe;
> +	} else if (task == current) {
> +		fp = (unsigned long)__builtin_frame_address(1);
> +		sp = (unsigned long)__builtin_frame_address(0);
> +		pc = (unsigned long)__builtin_return_address(0);
>  	} else {
>  		/* task blocked in __switch_to */
>  		fp = task->thread.s[0];
> @@ -106,15 +106,15 @@ static bool print_trace_address(void *arg, unsigned long pc)
>  	return true;
>  }
>
> -void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
> +noinline void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
>  		    const char *loglvl)
>  {
> -	pr_cont("%sCall Trace:\n", loglvl);
>  	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
>  }
>
>  void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
>  {
> +	pr_cont("%sCall Trace:\n", loglvl);
>  	dump_backtrace(NULL, task, loglvl);
>  }
>
> @@ -139,7 +139,7 @@ unsigned long get_wchan(struct task_struct *task)
>
>  #ifdef CONFIG_STACKTRACE
>
> -void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
> +noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
>  		     struct task_struct *task, struct pt_regs *regs)
>  {
>  	walk_stackframe(task, regs, consume_entry, cookie);

Thanks, this is on fixes.

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
