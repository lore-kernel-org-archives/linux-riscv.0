Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 977B1CD11DF
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 18:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6VgO8TAq5vK5f5AIlH1yPhyYW3RcbiwwFcGAttxV0BY=; b=INiZkFdX8soeGD
	XTaDcrlk1nD3WNEqtMx0BhaXwLObJrEflHsdccYqqTHkvKxUpQpQoaiuWMDLbfgg/1lCTb+ChMSge
	59CAQYnO3+PNdZRD3efqoSlLRd16O5YWiL1yabS/I2S9usudIzMcw6VktfLD8MxIpxiVeFi7p8IFn
	Q7ZQnXUX90Js5meKz8kazY18IxfvpxJ7+rM2E7uKZdtRrh4yPFkBOVJBcbyQCsh3W0oQbyXRu0cY5
	lIV6rVe6XoMARtRFP/AW8Njkpw4W7XHk83GAU1q+iGAQ8c78pDlD1xW0oEPuevR3mbw/9J65qPCPi
	5WZqHhx9Et464pHwdKfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpug2-0000000FDWf-1r2w;
	Thu, 28 Mar 2024 18:40:38 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpufx-0000000FDUO-405o
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 18:40:35 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4149532da36so9050525e9.0
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 11:40:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651231; x=1712256031; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAOQkTdKXTaBL7Qciv0ydA9PkCnbK+OLuX0dvpnwkyo=;
        b=GMWQf6VHB7sXMuiExQSogXPm2ynE4q44AHvzGhYD32q8Bzr7bHVOBPTnj0z1mnsPj7
         kloXmLrnIMCq1G40Jva1yMvBc5u65jhbOUMLq8PN0y9S2buktDrGfwYElKZIbU2bPnZ+
         Mlcq0ekuHgn2VwIjAob3TTVMwiQjZIx6hKnPsxtQtW1eQFjpCH7UzgAwNUaYD3EkQ9dY
         fncWHKU+VHbwBjZJ02/bYLeEdcScxCRS8Q3z6YkvaInqAyiUKRt0bIGr/j4leykkvrNH
         FMjLP0+kTaYMA5t+khLbUpVEeYczFlJiu7LdF+AehxFBGUGxf4NmEgB4gxyWIyV3UFCb
         Lm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651231; x=1712256031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wAOQkTdKXTaBL7Qciv0ydA9PkCnbK+OLuX0dvpnwkyo=;
        b=gWv7Vv87QaNm+AuNC56TTP+jzfbgEYMeZjaTN2bNzyfcsvKUwmtkFN9nJWnfI2Xb8z
         fM1XgBd7XX3HzdSLVtw0ijavsq80/Wj82GZl06CKJiGjY0zXJrBiRumTeBsCjLiKFPHZ
         xs6bRKLkpOLSx9nIu7L83agSuqOseMn2cAAMF7z4YOJ3vzLzcGgPeMIqsWqUXzRoMb9j
         vs5M1lbnbC6jHyyjafQBYYEaZubYksIkUHLd3YKAKLNO440A0t7nm5694i/zijt79bxq
         ZNzVfVYAirs8W8GippZo9Wa0sWPI1axVsQP5YscNX6XF4bUEV//1T0dfQwUm7gGnKjBU
         Df2A==
X-Forwarded-Encrypted: i=1; AJvYcCXetOZqy6qZd4wZq1nx79fqm3+POG+uRyHzf/jyq1vXoGtu/fQy6IVClmoG4o2csWeGryXZdk4Rs++8V1oE2fnu9EYdbzeO1E0e47uJO+L0
X-Gm-Message-State: AOJu0YyUx05bMw0Ats6fWRmlY+NyR+D+qNJZ/OvjMcxjbkKMzd9geWvy
	RuAmaKGgwFl+YoVtJTT7jiNsNhxRnaoD1m+Y5HzTf1QjespUgX2e
X-Google-Smtp-Source: AGHT+IGkeYHwiRZkr52SSP8OsgcXPmyzoOnpkNo7qZq10LSJmGPGKaRRqPv8tAL/pYZXos9qB/4zPw==
X-Received: by 2002:a05:600c:3c8c:b0:414:a69:f0b1 with SMTP id bg12-20020a05600c3c8c00b004140a69f0b1mr140663wmb.13.1711651231344;
        Thu, 28 Mar 2024 11:40:31 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id g15-20020a05600c4ecf00b0041493009a8bsm6272490wmq.11.2024.03.28.11.40.31
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2024 11:40:31 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: puranjay12@gmail.com
Subject: [PATCH 2/2] riscv: stacktrace: make walk_stackframe() more robust
Date: Thu, 28 Mar 2024 18:40:20 +0000
Message-Id: <20240328184020.34278-3-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240328184020.34278-1-puranjay12@gmail.com>
References: <20240328184020.34278-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_114034_019757_0E84C75B 
X-CRM114-Status: GOOD (  16.43  )
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

Currently walk_stackframe() provides only a cookie and the PC to the
consume_entry function. This doesn't allow the implementation of
advanced stack walkers that need access to SP and FP as well.

Change walk_stackframe to provide a struct unwind_state to the
consume_entry function. This unwind_state has all information that is
available to walk_stackframe. The information provided to the callback
will not always be live/useful, the callback would be aware of the
different configurations the information in unwind_state can be.

For example: if CONFIG_FRAME_POINTER is not available, unwind_state->fp
will always be zero.

This commit doesn't make any functional changes.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/kernel/stacktrace.c | 55 ++++++++++++++++++++++++++++++----
 1 file changed, 49 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index e28f7b2e4b6a6..92c41c87b267b 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -14,15 +14,26 @@
 
 #include <asm/stacktrace.h>
 
+struct unwind_state {
+	unsigned long fp;
+	unsigned long sp;
+	unsigned long pc;
+	struct pt_regs *regs;
+	struct task_struct *task;
+};
+
+typedef bool (*unwind_consume_fn)(void *cookie, const struct unwind_state *state);
+
 #ifdef CONFIG_FRAME_POINTER
 
 extern asmlinkage void ret_from_exception(void);
 
 static __always_inline void
 walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-		bool (*fn)(void *, unsigned long), void *arg)
+		unwind_consume_fn fn, void *arg)
 {
 	unsigned long fp, sp, pc;
+	struct unwind_state state;
 	int level = 0;
 
 	if (regs) {
@@ -40,12 +51,17 @@ walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 		sp = task->thread.sp;
 		pc = task->thread.ra;
 	}
+	state.task = task;
+	state.regs = regs;
 
 	for (;;) {
 		unsigned long low, high;
 		struct stackframe *frame;
 
-		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, pc))))
+		state.sp = sp;
+		state.fp = fp;
+		state.pc = pc;
+		if (unlikely(!__kernel_text_address(pc) || (level++ >= 0 && !fn(arg, &state))))
 			break;
 
 		/* Validate frame pointer */
@@ -64,7 +80,10 @@ walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 			pc = ftrace_graph_ret_addr(current, NULL, frame->ra,
 						   &frame->ra);
 			if (pc == (unsigned long)ret_from_exception) {
-				if (unlikely(!__kernel_text_address(pc) || !fn(arg, pc)))
+				state.sp = sp;
+				state.fp = fp;
+				state.pc = pc;
+				if (unlikely(!__kernel_text_address(pc) || !fn(arg, &state)))
 					break;
 
 				pc = ((struct pt_regs *)sp)->epc;
@@ -79,9 +98,10 @@ walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 
 static __always_inline void
 walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-		bool (*fn)(void *, unsigned long), void *arg)
+		unwind_consume_fn fn, void *arg)
 {
 	unsigned long sp, pc;
+	struct unwind_state state;
 	unsigned long *ksp;
 
 	if (regs) {
@@ -99,9 +119,14 @@ walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	if (unlikely(sp & 0x7))
 		return;
 
+	state.task = task;
+	state.regs = regs;
+	state.sp = sp;
+	state.fp = 0;
 	ksp = (unsigned long *)sp;
 	while (!kstack_end(ksp)) {
-		if (__kernel_text_address(pc) && unlikely(!fn(arg, pc)))
+		state.pc = pc;
+		if (__kernel_text_address(pc) && unlikely(!fn(arg, &state)))
 			break;
 		pc = READ_ONCE_NOCHECK(*ksp++) - 0x4;
 	}
@@ -109,10 +134,28 @@ walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 
 #endif /* CONFIG_FRAME_POINTER */
 
+struct unwind_consume_entry_data {
+	stack_trace_consume_fn consume_entry;
+	void *cookie;
+};
+
+static __always_inline bool
+arch_unwind_consume_entry(void *cookie, const struct unwind_state *state)
+{
+	struct unwind_consume_entry_data *data = cookie;
+
+	return data->consume_entry(data->cookie, state->pc);
+}
+
 noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 				      struct task_struct *task, struct pt_regs *regs)
 {
-	walk_stackframe(task, regs, consume_entry, cookie);
+	struct unwind_consume_entry_data data = {
+		.consume_entry = consume_entry,
+		.cookie = cookie,
+	};
+
+	walk_stackframe(task, regs, arch_unwind_consume_entry, &data);
 }
 
 static bool print_trace_address(void *arg, unsigned long pc)
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
