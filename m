Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5219CA9ED2
	for <linux-riscv@archiver.kernel.org>; Mon, 12 Oct 2026 20:42:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WmG5pmOTq1wCzOHGZXnEi9U49ChLbba4o61qzHKBI/Y=; b=qICKrh5OTuFihR
	NqUohmXzMjDjUxqTbwOjKtbHM3Zz+ttwMZtKeTxYLbhv8kGzmmuxbipwRBrkucoJiE3dff4bpLAqf
	hpfR8sGf6wtODkM2QIzIVu1mOmLpYuuhim3IEHZB9d/D9P7Ob5YgbjBr803ah/iNPMqjSWgTsE9CP
	2LZg5g4vl2ai3qdGRehmUrNablscvUTzKN/wXqPFbBiFZT2MNVS3dxjdfzfOAMYJvKAVglDoEKi1w
	894U6Vtm/IN5eeddA+S3xblCMizXSeVdrWBez+g1bT7ANDsMDHQVtLS1L769CpYuIJF9fNmathRfy
	EkUc9a1f65k2LbtMRnzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMqp-0000000BUZe-26lF;
	Mon, 12 Oct 2026 20:42:27 +0000
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGMqn-0000000BUZ0-0NdJ
	for linux-riscv@lists.infradead.org;
	Mon, 12 Oct 2026 20:42:26 +0000
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-48c4be28b82so2197000f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 12 Oct 2026 13:42:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791837743; x=1792442543; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fqf3rGQ/R9PQCmxqvsD5ZLcC98lXYPCxdFatXGsliLY=;
        b=iADP/fhQ6EBbuf9uRWwh/ltZDFlYajGN0ouXWj/KkU8HndxeEJxOHp22v+Pgra2dAN
         Lmv+lK7/OG8B/NyPH4iK65xmdqoG8W2zmzdksQCMPTDwNTYVgeTF7+ykiDlZZVDvMPbP
         eGq1+k0Vnp9T/gcZEH0arnIPhFYdQAWRSdRV4ZiZ338ttzitWwk83TzFEiLhnxs+V1mh
         cuFnLvRtkHqdNJ5gM/3yn1pDZBCs/2rPSRjK/unsGjGRUAJLdK6WdG+CRJnzwEdLn0kl
         tWTYorFlKCyBFlJJSFMZjzAm5qoQVc474nX7QXup93N5YLC4xQgcduHq/8mkGHgSDVSF
         A2ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791837743; x=1792442543;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fqf3rGQ/R9PQCmxqvsD5ZLcC98lXYPCxdFatXGsliLY=;
        b=PK9KFz61a6CC2hyapodHaJYLpHZkYIX5RfzKKjSSWu9MQ7vu75cnBbR2sKsG+5dqsp
         xTZorpgGz9fJVmKHsACHQLi5HhhxNdFdr6zZgOZ7OFdcYb1ZbqrN8dAgWm40d1wdFmWN
         FcBklMgvlytX04qJ/j5989mF84dY9PF4tfwyTRIQ0AAZzuvabGuE0O6DqCDuHTRXMksT
         jaeswLsllptvy7elJr03l0BlJA/tdsuITHyonW2RyZF1faPftxLXLoGd45kbaYHJ9uYD
         awoBoOy7mSIyWUNcaXfP7fAqaUYkc1QbGCottN4M82DZvKZOb7dLIOrgmqBzilIkjTDA
         XCmw==
X-Forwarded-Encrypted: i=1; AKwUvByq0pyRCD1JRuJsNSZNYtSMufXhooNvLpAikGW7LN2/k2Wx57kxbdeFe+oeXoNz6NmLvFGhmnYyIT02EQ==@lists.infradead.org
X-Gm-Message-State: AFq9FYK8DEEmHKKl1/clIgg5O5vDH50bq2LOmLdJoTDe7kN3nzagbsDN
	eEto67JzF7N3ydcc/h7UTilkYk8RZt1dcQj6a8KK1PmR3++7B7cvszEp
X-Gm-Gg: AYBFou3oI9h8O05LCRumzTwb3UW31HlcJSOBKOdpbnkj4kTiG9TUZlGkRZ3BE+tLFTJ
	P0MJvyuccBs5iLEEDTb48TpJNOIpQTLnDwObopEXGbCh+Qs0WWB76EpQWQtX8zoS/pUSyy4NaM1
	9msOSdscbYj1RXwXGFOKVcEqhvbFO2MS/IAm0J0u8BGjmxf6exRfXm2IPHhsCnvDikaF8C+2gD0
	0n9AIYGqxiroV3JNkdgINFHVo6hfr9JGwXDxVM8OIOUfh895YPeU5k7PXQf5g21/qBQW/LrL0UW
	K0jLgmIXxQk5rMTTBD3Y+TdqLykYy5SqaOxzmd/rlrxHWJFTXxAIvBrw80Wvzuw+HCzoIDEfYtJ
	8klCf342jeS9uHcd5lEXAZWIVIiTKu/4PEqUv7iVBOvvDDA7QTbpqSo5QV4K7lXXC9qaJWz6iZJ
	1MajP3w7i+atwgJ8qPmK7G0PtX8R5xhwtoiXrwg0yRrqFWll5NQxgqAp5JnoupCqpPBQs3mZLWX
	FbdzBCnLF8m2hmiG9VCqVGZOWItlZIoCR15bzjiGIgLywD490llJjJ+EWYMejFgvO4/0bgM5ykX
	sqfZzNZrN8mfytrKjp7BbCrmO/VRBXmH6Z+6FGehpLS6uzSZYbV+rI+UrzwGSua675kNRJ34iVA
	=
X-Received: by 2002:adf:efc6:0:b0:486:e9ab:2b88 with SMTP id ffacd0b85a97d-48dbaadb11amr14086227f8f.24.1791837742943;
        Mon, 12 Oct 2026 13:42:22 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a8ab-0f01-016a-c770-797f-eaee.310.pool.telefonica.de. [2a02:3100:a8ab:f01:16a:c770:797f:eaee])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0ac3970sm1186179f8f.37.2026.10.12.13.42.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 12 Oct 2026 13:42:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Alexander Potapenko <glider@google.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	kasan-dev@googlegroups.com,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: Always inline on_thread_stack()
Date: Mon, 12 Oct 2026 22:42:11 +0200
Message-Id: <20261012204211.3351-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_134225_169475_003E623B 
X-CRM114-Status: GOOD (  13.27  )
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

With CONFIG_IRQ_STACKS=y, GCC may outline on_thread_stack().
CONFIG_KCOV_INSTRUMENT_ALL instruments it, and do_irq() calls it before
irq_enter_rcu() increments the hardirq count.

Normal KCOV records this interrupt coverage in the task's buffer, making
results timing-dependent.

With CONFIG_KCOV_SELFTEST=y, current->kcov_area remains NULL. In QEMU, a
timer interrupt called the helper before hardirq accounting. KCOV treated
it as task coverage and dereferenced NULL. Fault handling recursed to stack
overflow and stopped boot.

On a BeagleV Ahead, the unpatched kernel did not finish the selftest within
120 seconds. Three patched boots completed it and reached init.

Mark the helper __always_inline to keep it in noinstr do_irq(), following
commit 1894a4030582 ("x86: Always inline on_thread_stack() and
current_top_of_stack()"), which fixed the same out-of-line call from x86
noinstr code.

Fixes: 163e76cc6ef4 ("riscv: stack: Support HAVE_IRQ_EXIT_ON_IRQ_STACK")
Cc: stable@vger.kernel.org
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with GCC 15.2.0 and QEMU 10.2.1 on v7.3-rc7. Both images
used byte-identical configs and v7.3-rc7 rebases of these seven pending
patches (canonical commit IDs shown):

  3a25097bf845 kcov: use unsigned int for kcov_start() mode parameter
  e39a9c820c37 kcov: add kcov_pause()/kcov_resume() helpers
  ae2662563c3e hrtimer: pause KCOV during deferred rearm
  554af946139e sched: pause KCOV in __schedule()
  7f608b777204 sched: pause KCOV in try_to_wake_up()
  2ba73ec2a246 sched: pause KCOV in wake_up_new_task()
  5ee777070fac context_tracking: exclude from KCOV instrumentation

                              plain inline  __always_inline
KCOV selftest started                  yes              yes
KCOV selftest finished                  no              yes
Reached /init                           no              yes

The plain-inline image stopped after printing "kcov: running self test"
and reached the 45-second limit. The patched image reached /init in two
60-second runs. Those runs timed out after the marker because the test
/init deliberately loops.

The first common patch is a type prerequisite. The remaining pause and
exclusion changes suppress separate KCOV callbacks that otherwise obscure
this test. CONFIG_RISCV_ISA_V_PREEMPTIVE was disabled to avoid a separate
vector-entry callback. The only A/B source difference was this patch.

The same images were tested on a BeagleV Ahead (TH1520, four C910 CPUs).
The plain-inline image did not finish the selftest or reach /init during
120 seconds after the start message. It reported RCU stalls, and CPU 1
did not answer NMI requests. No panic or stack-overflow message was
printed. All three patched runs completed the selftest in about 0.301
seconds and reached /init.

 arch/riscv/include/asm/stacktrace.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..c7c991452e11 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -16,7 +16,7 @@ extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *re
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
-static inline bool on_thread_stack(void)
+static __always_inline bool on_thread_stack(void)
 {
 	return !(((unsigned long)(current->stack) ^ current_stack_pointer) & ~(THREAD_SIZE - 1));
 }

base-commit: 24a19b953e2a3d0ea5a8c4951a0ab8f32720c907
-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
