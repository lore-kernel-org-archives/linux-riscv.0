Return-Path: <SRS0=NJ9D=AF=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB250C433E2
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:03:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9CD2920857
	for <linux-riscv@archiver.kernel.org>; Wed, 24 Jun 2020 09:03:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="O3vReyoM";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="EebCq36d"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9CD2920857
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe
	:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:To:From:
	Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B627ky7PKccnqfpBtLkmMkSE2hEW3OuBK0V6+qtUmZw=; b=O3vReyoMIOyHykccenjdcy8rNc
	TPi9EAAR/sczWkhIeKa5tqiiAIg7Tha5mNpSpblLu0AoXzyl8ld5tj/ZbbbAaCSk99wq0vscfrW98
	WtzMglYrtMCFuimn9wD/xYeTJ6ztJsH8wg3kBG7IS/FKw90YPvFeAE8cTzjZxsSYPz7VMO0tfWZq4
	tY5z3Pvmu+FtpUJJt63v5MY9sM7ZJcBS2SOPUoxZNnXPmbf0+0ORZG1inpW/t49bU7Vwwv9p+fOuf
	ueYsillspFAmAIEEgOjk9OK9UqRHohFyW96eiK/MCpfMw4T+2u/kgEQx3fXwWWSpWf4bN9YComqOp
	2kco28GA==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jo1Je-0001EB-QA; Wed, 24 Jun 2020 09:03:34 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jo1Jb-0001C9-Sa
 for linux-riscv@lists.infradead.org; Wed, 24 Jun 2020 09:03:32 +0000
Received: by mail-pl1-x641.google.com with SMTP id d12so825141ply.1
 for <linux-riscv@lists.infradead.org>; Wed, 24 Jun 2020 02:03:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=APwDQH63ewaL2qHEi/Ing1YzxCpzIwvDW/C7xU97WY0=;
 b=EebCq36d0n00dZfafkmwSeo5Kh9YCqdxCmikfSs628rB+ud+0owUwlvXwPQg9kQ7PW
 cQyhyg3uX2G3fcuHZ0KTGxyo/v+/FM1RwL0P8xNU5HdiqJs3yUMnpofHSczVhW2v4+kd
 rUA+IuQ0tpZdFa8hlW8P9aY0jW31mSmr8O7VXhO9EPj3ouHcv/0z0xXrfdCBByyY6U/3
 bo2I7Buym1YxdatSOSSqTpY9Ntnnl4g+P4bFWkdxALJalVHhKYQM66m2v71FOSby38cs
 lIJAyzNEBH/+ewOfe7bJCgRRs6BsODQ5nI9q8K+3perwfUXyr5XvfoUPWyUfwpzisfoq
 EG+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=APwDQH63ewaL2qHEi/Ing1YzxCpzIwvDW/C7xU97WY0=;
 b=dcddIz0aTh/CttNSrAuaYVtOXHp4IUBGUoC5aAdOgTMbhn8kgUiek04wxCp1AubIkw
 /VlbAqIzkgjVkRwNHzMBrg2n7NJdWbYiZFNEOR5oWkhsemOLQuhZtD6BVHQDZaC1QR2n
 bwIVng5l/qVZgm8dAvivqFv73uYf0S6RcIiLi+W5u87jgdZ5NWsbIQOtZ5m9x51yeq8Y
 7TtTWLuCjzTR7gRBzy6I/v/fGOhL1dO2XNEyyKpaQYbmxybOZ3RGnDdFSKu6fNC8t+7a
 qCUbTaCbd3CtWqicYDxkSZmMd0brvhRM0VJ9oWtqeyHeXrNN1QjD/2uThSbOpZ3eJY+F
 8wZg==
X-Gm-Message-State: AOAM531yXWs2Dh97FuGOMVgghb8UAltG6YJq7km+RWfgTZXdu5ttDLq+
 8cZ/itvO4wpf5HtZxBCOx42qtg==
X-Google-Smtp-Source: ABdhPJxtISH0SfgZOfx/uwGsVvKIQ1d9K61asvDGx9hoUzFaDYg3+j/yH5O3Rkcq+SMAOv6bat4HqQ==
X-Received: by 2002:a17:90a:a116:: with SMTP id
 s22mr26713129pjp.202.1592989409684; 
 Wed, 24 Jun 2020 02:03:29 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (114-34-229-221.HINET-IP.hinet.net. [114.34.229.221])
 by smtp.gmail.com with ESMTPSA id v1sm8062046pfn.210.2020.06.24.02.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Jun 2020 02:03:29 -0700 (PDT)
From: Greentime Hu <greentime.hu@sifive.com>
To: greentime.hu@sifive.com, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org, aou@eecs.berkeley.edu, palmer@dabbelt.com,
 paul.walmsley@sifive.com, guoren@linux.alibaba.com
Subject: [PATCH v2 2/2] riscv: Enable context tracking
Date: Wed, 24 Jun 2020 17:03:16 +0800
Message-Id: <1d89d5a6b54ca3d3203cb02ff4548b4eb9820c61.1592989082.git.greentime.hu@sifive.com>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <cover.1592989082.git.greentime.hu@sifive.com>
References: <cover.1592989082.git.greentime.hu@sifive.com>
MIME-Version: 1.0
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

This patch implements and enables context tracking for riscv (which is a
prerequisite for CONFIG_NO_HZ_FULL support)

It adds checking for previous state in the entry that all excepttions and
interrupts goes to and calls context_tracking_user_exit() if it comes from
user space. It also calls context_tracking_user_enter() if it will return
to user space before restore_all.

This patch is tested with the dynticks-testing testcase in
qemu-system-riscv64 virt machine and Unleashed board.
git://git.kernel.org/pub/scm/linux/kernel/git/frederic/dynticks-testing.git

We can see the log here. The tick got mostly stopped during the execution
of the user loop.

                        _-----=> irqs-off
                       / _----=> need-resched
                      | / _---=> hardirq/softirq
                      || / _--=> preempt-depth
                      ||| /     delay
     TASK-PID   CPU#  ||||    TIMESTAMP  FUNCTION
        | |       |   ||||       |         |
   <idle>-0     [001] d..2   604.183512: sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=taskset next_pid=273 next_prio=120
user_loop-273   [001] d.h1   604.184788: hrtimer_expire_entry: hrtimer=000000002eda5fab function=tick_sched_timer now=604176096300
user_loop-273   [001] d.s2   604.184897: workqueue_queue_work: work struct=00000000383402c2 function=vmstat_update workqueue=00000000f36d35d4 req_cpu=1 cpu=1
user_loop-273   [001] dns2   604.185039: tick_stop: success=0 dependency=SCHED
user_loop-273   [001] dn.1   604.185103: tick_stop: success=0 dependency=SCHED
user_loop-273   [001] d..2   604.185154: sched_switch: prev_comm=taskset prev_pid=273 prev_prio=120 prev_state=R+ ==> next_comm=kworker/1:1 next_pid=46 next_prio=120
    <...>-46    [001] ....   604.185194: workqueue_execute_start: work struct 00000000383402c2: function vmstat_update
    <...>-46    [001] d..2   604.185266: sched_switch: prev_comm=kworker/1:1 prev_pid=46 prev_prio=120 prev_state=I ==> next_comm=taskset next_pid=273 next_prio=120
user_loop-273   [001] d.h1   604.188812: hrtimer_expire_entry: hrtimer=000000002eda5fab function=tick_sched_timer now=604180133400
user_loop-273   [001] d..1   604.189050: tick_stop: success=1 dependency=NONE
user_loop-273   [001] d..2   614.251386: sched_switch: prev_comm=user_loop prev_pid=273 prev_prio=120 prev_state=X ==> next_comm=swapper/1 next_pid=0 next_prio=120
   <idle>-0     [001] d..2   614.315391: sched_switch: prev_comm=swapper/1 prev_pid=0 prev_prio=120 prev_state=R ==> next_comm=taskset next_pid=276 next_prio=120

Signed-off-by: Greentime Hu <greentime.hu@sifive.com>
---
 arch/riscv/Kconfig        |  1 +
 arch/riscv/kernel/entry.S | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 128192e14ff2..17520e11815b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -52,6 +52,7 @@ config RISCV
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ASM_MODVERSIONS
+	select HAVE_CONTEXT_TRACKING
 	select HAVE_COPY_THREAD_TLS
 	select HAVE_DMA_CONTIGUOUS if MMU
 	select HAVE_EBPF_JIT if MMU
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index cae7e6d4c7ef..6ed579fc1073 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -97,6 +97,14 @@ _save_context:
 	la gp, __global_pointer$
 .option pop
 
+#ifdef CONFIG_CONTEXT_TRACKING
+	/* If previous state is in user mode, call context_tracking_user_exit. */
+	andi a0, s1, SR_SPP
+	bnez a0, skip_context_tracking
+	call context_tracking_user_exit
+
+skip_context_tracking:
+#endif
 	la ra, ret_from_exception
 	/*
 	 * MSB of cause differentiates between
@@ -137,6 +145,17 @@ _save_context:
 	tail do_trap_unknown
 
 handle_syscall:
+#ifdef CONFIG_CONTEXT_TRACKING
+	/* Recover a0 - a7 for system calls */
+	REG_L x10, PT_A0(sp)
+	REG_L x11, PT_A1(sp)
+	REG_L x12, PT_A2(sp)
+	REG_L x13, PT_A3(sp)
+	REG_L x14, PT_A4(sp)
+	REG_L x15, PT_A5(sp)
+	REG_L x16, PT_A6(sp)
+	REG_L x17, PT_A7(sp)
+#endif
 	 /* save the initial A0 value (needed in signal handlers) */
 	REG_S a0, PT_ORIG_A0(sp)
 	/*
@@ -205,6 +224,10 @@ resume_userspace:
 	andi s1, s0, _TIF_WORK_MASK
 	bnez s1, work_pending
 
+#ifdef CONFIG_CONTEXT_TRACKING
+	call context_tracking_user_enter
+#endif
+
 	/* Save unwound kernel stack pointer in thread_info */
 	addi s0, sp, PT_SIZE_ON_STACK
 	REG_S s0, TASK_TI_KERNEL_SP(tp)
-- 
2.27.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
