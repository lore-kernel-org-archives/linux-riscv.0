Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6094DC44536
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Jul 2026 14:01:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Sr4IEnbvgt1A4J7OeURW9skE1KuofGCSnxhKFGyvN88=; b=n7WrOYmzhjVqdT
	FwUEmKI2u58pCjASygXKtyoFjLslpsNu8VEaY3o9LssZPO88JHP2ZE3r3RsG9JRBClW13asXzamHM
	Q1ONQ3lUOthkXFKkKHM1viuc4lNLEtqpXbZxARkB6evM7jRI8xux+EWAV8iu8Z/ZkAX4mZwwkruMy
	NwJNaJgYe3S7Mvxp2ktfA10wkV5TvfSzGSZZGeXDGAxERWQSavYg5Kce1Pqv8x5UCd0jawVxD7b48
	giaOmQ5ci3neciTQyfrd/GvuNxZhUt4sxBCbD/utZtvgxkPsxIr2/Sjb8wcU+eoU7ofsYcGNbeuN4
	tWlcbM8dWYWM1oDjidnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVT-0000000By5H-1lqx;
	Wed, 22 Jul 2026 14:01:07 +0000
Received: from mail-pf1-x436.google.com ([2607:f8b0:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmXVQ-0000000By4X-2kdC
	for linux-riscv@lists.infradead.org;
	Wed, 22 Jul 2026 14:01:05 +0000
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-84e0a4334b6so1535621b3a.0
        for <linux-riscv@lists.infradead.org>; Wed, 22 Jul 2026 07:01:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784728864; x=1785333664; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kmw/vOOFxAmrHxAo+1GzxM/5GGe32N4p7+qg3hLMUYs=;
        b=q8b4ZNnEiRGA2ZkniEyB33KF92MrxDw5SFdk/TG5ke2e6kKv2VZXvzxA+KVjj2d8W1
         0iWKGlHeA70mq0Sy5g2eWbSBwGfQMGhfabq6cFKoZxKfCZDcA0hBSJNgT135BGG6lXQf
         3wRTDaNHbukFRiL9AT8J1tjfH5FWkHoVvl/5D2XTTp6qOrFYV3A1VYgJFb9vzLIl94Uk
         kN5W7MAdWt/L7kLY/XH8tTtSCApkberIuDFHAIah9fchcquK/1Gu8VBtONlQQXWn2uWD
         6LeWpgPC5BiCjIecex0K5VYNT1+1q4MGWwk6+5BrTFLP1zHoI5sLyBtPHSCTNs8ucOHC
         8w7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728864; x=1785333664;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kmw/vOOFxAmrHxAo+1GzxM/5GGe32N4p7+qg3hLMUYs=;
        b=JQRf9CsfY90MM+DutPDrKnrH4G6IMlTWOP3ojOkSm9T1cs0q3B20wHQPMc3ckBP4+w
         ogtKKjKN5IAqWxDpJDAHAFpUoDZcUmvTWjg0CIzNacT/y4drJ6r2/pDkQjjp+asnr2UY
         YYKoEPIjgDkxra0rGi7emrZxEdzu2zUUvUFpxWBilGBEF03YwTEWb0+hwAcpS1d9vHcY
         SMCNo5IQ6dcIyEJ14CU/WK+TwR4myLVfUwpxmGxe7eLSCbH02DrMp+AYFj/iMAemcdcg
         UFL1QN3tG72jNPUuZfBHF4Cn/1fOywhHNbx5LXsBl/llFca5qHavQz49Sa1WRl1vUrid
         wERQ==
X-Forwarded-Encrypted: i=1; AHgh+RqTJGX6OAbmojR6nsGuYad64A5hX+/skWKdd8S5ttqw31cnaycD5F6SOd/oOW6NP1OzQDUAzaRTCeKeHw==@lists.infradead.org
X-Gm-Message-State: AOJu0YxPGrBsRwgnwSp+ueaDgoy2nIqT4+S1pJxIEqJkPZhd+GAjBU9I
	6S9F8S0gF7Ec8ubltAZ4z10feZhHWKgdbDJg/2aEymSKE2AQeBACapZE
X-Gm-Gg: AR+sD11mOdemeIXs/j4PFNkzmk8zSSJLfIf1Ni+6fUKGw6dgkpDrUpg1GT9viFrHahm
	8DCOPg0D0IW3sX2dsdUdayPhfmpu3kIIFIYSrKUWemBfnss+OaEEWNPNYlkNkA6pb1SwFWbzHNw
	oUpjvZypF2YPPukHXYhlpt8YQg5A/yA25zgISNyKjrkdSwXr72q0ltPY8VGL1QQJcCNSdL1/DpG
	eMkFuYu4/cQE9GaWvQ/jkpWj/CBd3T40qqp5s6+9WFcBd6guanTWzNHaSqsNTNa0bPllBY097RO
	qhOxsOqgLMYgiPg8OYMs8b4ZjuBAvMC34GUnGMErwXfbeNeg7N/4tqz/JL63aXAMo81LxyVCMLW
	8XCuG5I0hvTm6sVWjmLPZeZ8VdVw9Pbj4e9qqsfIxjdBUKwovq5U8ZyjBox9YT000hvfGAh/UqT
	doPH7vEP3vo5bC+FNlJo+Jx7K4P9kriKtbKqmLDrCZXvnbZE0=
X-Received: by 2002:a05:6a00:1f09:b0:845:c662:2be with SMTP id d2e1a72fcca58-84c2946f795mr22779930b3a.42.1784728856923;
        Wed, 22 Jul 2026 07:00:56 -0700 (PDT)
Received: from computer.goose-salary.ts.net ([2a09:bac5:40b2:277d::3ef:c9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbb8f1a8a1fsm1242281a12.26.2026.07.22.07.00.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:00:56 -0700 (PDT)
From: Varun R Mallya <varunrmallya@gmail.com>
To: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	eddyz87@gmail.com,
	memxor@gmail.com,
	bjorn@kernel.org,
	pulehui@huawei.com
Cc: alex@ghiti.fr,
	martin.lau@linux.dev,
	song@kernel.org,
	yonghong.song@linux.dev,
	jolsa@kernel.org,
	emil@etsalapatis.com,
	puranjay@kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	bpf@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	varunrmallya@gmail.com
Subject: [PATCH bpf-next v3 2/6] riscv, stacktrace: Pass sp and fp to the walk_stackframe() callback
Date: Wed, 22 Jul 2026 19:30:09 +0530
Message-ID: <20260722140015.1982158-3-varunrmallya@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722140015.1982158-1-varunrmallya@gmail.com>
References: <20260722140015.1982158-1-varunrmallya@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_070104_705147_A199B60E 
X-CRM114-Status: GOOD (  17.73  )
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

Extend the walk_stackframe() consume callback so it receives the stack
pointer and frame pointer of each frame, in addition to the pc. The
extra state is needed by the BPF exceptions machinery.
bpf_throw() unwinds the kernel stack looking for the BPF program that
acts as the exception boundary and needs (pc, stack and frame pointers)
of that frame to invoke the exception callback in its stack context.

This mirrors what arm64 does, where kunwind_stack_walk() hands the full
unwind state to its consume functions and arch_stack_walk() adapts the
generic stack_trace_consume_fn via a small wrapper
(kunwind_consume_entry_data), so that a single unwinder serves the
generic stacktrace API and BPF alike.

The pc-only callbacks print_trace_address() and save_wchan() simply
gain ignored arguments, and arch_stack_walk() now adapts the generic
stack_trace_consume_fn with a wrapper struct. In the
!CONFIG_FRAME_POINTER variant there is no frame pointer to report, so
pass the scan position as sp and 0 as fp.

Signed-off-by: Varun R Mallya <varunrmallya@gmail.com>
---
 arch/riscv/include/asm/stacktrace.h |  5 +++-
 arch/riscv/kernel/stacktrace.c      | 39 +++++++++++++++++++++++------
 2 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce..fd1ff04a040e 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -11,8 +11,11 @@ struct stackframe {
 	unsigned long ra;
 };
 
+typedef bool (*walk_stackframe_fn)(void *arg, unsigned long pc,
+				   unsigned long sp, unsigned long fp);
+
 extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-				    bool (*fn)(void *, unsigned long), void *arg);
+				    walk_stackframe_fn fn, void *arg);
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..30b369dd2815 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -46,7 +46,7 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 }
 
 void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+			     walk_stackframe_fn fn, void *arg)
 {
 	unsigned long fp, sp, pc;
 	int graph_idx = 0;
@@ -71,7 +71,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	for (;;) {
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
+		/* pc belongs to the function whose frame pointer is fp */
+		if (unlikely(!__kernel_text_address(pc) ||
+			     (level++ >= 0 && !fn(arg, pc, sp, fp))))
 			break;
 
 		if (unlikely(!fp_is_valid(fp, sp)))
@@ -91,7 +93,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 						   &frame->ra);
 			if (pc >= (unsigned long)handle_exception &&
 			    pc < (unsigned long)&ret_from_exception_end) {
-				if (unlikely(!fn(arg, pc)))
+				if (unlikely(!fn(arg, pc, sp, fp)))
 					break;
 
 				pc = ((struct pt_regs *)sp)->epc;
@@ -105,7 +107,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 #else /* !CONFIG_FRAME_POINTER */
 
 void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+	struct pt_regs *regs, walk_stackframe_fn fn, void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -127,7 +129,8 @@ void notrace walk_stackframe(struct task_struct *task,
 
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
+		if (__kernel_text_address(pc) &&
+		    unlikely(!fn(arg, pc, (unsigned long)ksp, 0)))
 			break;
 		pc = READ_ONCE_NOCHECK(*ksp++);
 	}
@@ -135,7 +138,8 @@ void notrace walk_stackframe(struct task_struct *task,
 
 #endif /* CONFIG_FRAME_POINTER */
 
-static bool print_trace_address(void *arg, unsigned long pc)
+static bool print_trace_address(void *arg, unsigned long pc,
+				unsigned long sp, unsigned long fp)
 {
 	const char *loglvl = arg;
 
@@ -155,7 +159,8 @@ void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
 	dump_backtrace(NULL, task, loglvl);
 }
 
-static bool save_wchan(void *arg, unsigned long pc)
+static bool save_wchan(void *arg, unsigned long pc,
+		       unsigned long sp, unsigned long fp)
 {
 	if (!in_sched_functions(pc)) {
 		unsigned long *p = arg;
@@ -176,10 +181,28 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
+struct walk_stackframe_consume_entry_data {
+	stack_trace_consume_fn consume_entry;
+	void *cookie;
+};
+
+static bool walk_stackframe_consume_entry(void *arg, unsigned long pc,
+					  unsigned long sp, unsigned long fp)
+{
+	struct walk_stackframe_consume_entry_data *data = arg;
+
+	return data->consume_entry(data->cookie, pc);
+}
+
 noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
-	walk_stackframe(task, regs, consume_entry, cookie);
+	struct walk_stackframe_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+	};
+
+	walk_stackframe(task, regs, walk_stackframe_consume_entry, &data);
 }
 
 /*
-- 
2.55.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
