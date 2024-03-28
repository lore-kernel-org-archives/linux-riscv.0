Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1603ACD1283
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Mar 2024 18:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ie39sYk9x2dCu04k04x0WWHXvG6OZatqFTqRN8Jui1Y=; b=a2lW9aq1hXuX+3
	5RUSJkCt9O7gYZXz9tWiRPEJueO0Kg4dF/dz4aTkDXWdVZTNB5aBV7RHSBp3E6vH/QblGjj1Ys+io
	yLQ64J/cmIdeSU0NBFJ6SJKUivQ397LGzRmMpw9SWSNH2yI84+nUE/GCXvzjifh3QvRLGDyXCiPnN
	Uojn2nH/09ygGQMWn23GiZ4yavPxQvSlyXArshGwmIe8qEvHOtv5PEaQYXdNRDPmEvrByZ6NMmGby
	cOm/ER9ibSPkhShX+egGJEVS7aftIdFxQN0VlvXQShkdD+KyerEAXVUnY7PRCmbc8N6DmH2xtOK8i
	tSM51Wqnhxz9kPTIgxJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpufy-0000000FDVH-0bTJ;
	Thu, 28 Mar 2024 18:40:34 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpufv-0000000FDUB-4AHb
	for linux-riscv@lists.infradead.org;
	Thu, 28 Mar 2024 18:40:33 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-41494c0405eso7866755e9.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 11:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711651229; x=1712256029; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X5HiuWpEGn7cY1cM9xGgQQ/PHhgGCf83PSLXysQQN/k=;
        b=EhFhueN76ojg07qWFZsn3ZZznPhDsj2TsCzEbe5FVfjKYrsVTEESNV55zMD3e+G30W
         UxQBpZGAdU7/GkHDyMkyxePhsAkHZx2KWGPbbWzbmzJ4n0ClXTmkEjnP3Q/18CNkjnjn
         UckdkjdzJ+zUra7GILV2dYi9+MwM71vvwGQPtwjr/c6ERfU6vPH+ULDmq32Q35sbVlZ4
         /pfBj6DdLQdnzB9/qgKHd+/YLzRZ1/IWa/CYY5RvvP1qZrsM+imqfqhgoT3pKfm7ohqw
         j2H3abFWNWfscc5wCsoU2caxG5ufUDfV5WqVCA3aQOqMgipYIBH530wznYlHxL9Jo8io
         ZqtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711651229; x=1712256029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X5HiuWpEGn7cY1cM9xGgQQ/PHhgGCf83PSLXysQQN/k=;
        b=jlqp32JOlIk89PG6lKVGhSGnss9EQjM45fs1M0R99A6rpBSjp1s+DgqEZRySrF6Ovr
         T+AUwpczB3KAXyFKLmtoCaTNuVPrX5AMsUvBaO+WF6V5lM0YVUpag3KYo86yDiWsohXt
         b4yEIqwAkPkPbUqVUwcVI4USIdbX9gORi4Q0LM+yiSTglvDTcSJuRel/PyF0keEk3zRb
         W/fdXjUxOAxCiWXROBlFAOSlOgwbcy/7dHwa4gv2v4qCCZJNFoJ4HHtCm1R+zUjwCT7B
         1jrwgzMruCKn5yQs1uQFaEebE7I2TfvcrYTz3XZkgcG6QWfKCxxMuq63lv4dARVLPflP
         MJ/w==
X-Forwarded-Encrypted: i=1; AJvYcCXlDt6Z5geInCt70fWt98XUqB+7Ct1I5VfLHvr0AxWl7tcSsNbbPejHLZZeZqDrDul6zWEMoZBfPRd1bpbyCCiVXOCcg8Ppi4Ym2OnQsJiz
X-Gm-Message-State: AOJu0Yy0z3Z0XGCRlkJLTaJCWuwcuZ+rrYwZS/TtgLtVzQr+P2HAEkp+
	+LgAc4uSsJqDk/idItblXeKiYrZQ7mjC7KC+KDXza4unAlz4XBRf
X-Google-Smtp-Source: AGHT+IEhP9iRRtULEumOWwr08ZL9lifFDb1imTRVTFD6498BJOclfcgjhfx8rAmWuu2GenkUlyrkTQ==
X-Received: by 2002:a05:600c:3b17:b0:414:1325:e8a8 with SMTP id m23-20020a05600c3b1700b004141325e8a8mr124213wms.39.1711651229193;
        Thu, 28 Mar 2024 11:40:29 -0700 (PDT)
Received: from localhost (54-240-197-231.amazon.com. [54.240.197.231])
        by smtp.gmail.com with ESMTPSA id bh8-20020a05600c3d0800b004132ae838absm3045508wmb.43.2024.03.28.11.40.28
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Mar 2024 11:40:29 -0700 (PDT)
From: Puranjay Mohan <puranjay12@gmail.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>
Cc: puranjay12@gmail.com
Subject: [PATCH 1/2] riscv: stacktrace: use arch_stack_walk() in place of walk_stackframe
Date: Thu, 28 Mar 2024 18:40:19 +0000
Message-Id: <20240328184020.34278-2-puranjay12@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240328184020.34278-1-puranjay12@gmail.com>
References: <20240328184020.34278-1-puranjay12@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_114032_055051_5314DE6D 
X-CRM114-Status: GOOD (  12.66  )
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

Currently, dump_backtrace(), __get_wchan(), and perf_callchain_kernel()
directly call walk_stackframe(). Make then call arch_stack_walk() which
is a wrapper around walk_stackframe() and make walk_stackframe() static.

This allows making changes to walk_stackframe() without disturbing the
users of arch_stack_walk() which is the exposed function.

Signed-off-by: Puranjay Mohan <puranjay12@gmail.com>
---
 arch/riscv/include/asm/stacktrace.h |  2 --
 arch/riscv/kernel/perf_callchain.c  |  2 +-
 arch/riscv/kernel/stacktrace.c      | 26 ++++++++++++++------------
 3 files changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/riscv/include/asm/stacktrace.h b/arch/riscv/include/asm/stacktrace.h
index b1495a7e06ce6..32213e37c379f 100644
--- a/arch/riscv/include/asm/stacktrace.h
+++ b/arch/riscv/include/asm/stacktrace.h
@@ -11,8 +11,6 @@ struct stackframe {
 	unsigned long ra;
 };
 
-extern void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-				    bool (*fn)(void *, unsigned long), void *arg);
 extern void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 			   const char *loglvl);
 
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index 3348a61de7d99..c023e0b1eb814 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -74,5 +74,5 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
-	walk_stackframe(NULL, regs, fill_callchain, entry);
+	arch_stack_walk(fill_callchain, entry, NULL, regs);
 }
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index 64a9c093aef93..e28f7b2e4b6a6 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -18,8 +18,9 @@
 
 extern asmlinkage void ret_from_exception(void);
 
-void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+static __always_inline void
+walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+		bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long fp, sp, pc;
 	int level = 0;
@@ -76,8 +77,9 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 
 #else /* !CONFIG_FRAME_POINTER */
 
-void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+static __always_inline void
+walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+		bool (*fn)(void *, unsigned long), void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -107,6 +109,12 @@ void notrace walk_stackframe(struct task_struct *task,
 
 #endif /* CONFIG_FRAME_POINTER */
 
+noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
+				      struct task_struct *task, struct pt_regs *regs)
+{
+	walk_stackframe(task, regs, consume_entry, cookie);
+}
+
 static bool print_trace_address(void *arg, unsigned long pc)
 {
 	const char *loglvl = arg;
@@ -118,7 +126,7 @@ static bool print_trace_address(void *arg, unsigned long pc)
 noinline void dump_backtrace(struct pt_regs *regs, struct task_struct *task,
 		    const char *loglvl)
 {
-	walk_stackframe(task, regs, print_trace_address, (void *)loglvl);
+	arch_stack_walk(print_trace_address, (void *)loglvl, task, regs);
 }
 
 void show_stack(struct task_struct *task, unsigned long *sp, const char *loglvl)
@@ -143,13 +151,7 @@ unsigned long __get_wchan(struct task_struct *task)
 
 	if (!try_get_task_stack(task))
 		return 0;
-	walk_stackframe(task, NULL, save_wchan, &pc);
+	arch_stack_walk(save_wchan, &pc, task, NULL);
 	put_task_stack(task);
 	return pc;
 }
-
-noinline void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
-		     struct task_struct *task, struct pt_regs *regs)
-{
-	walk_stackframe(task, regs, consume_entry, cookie);
-}
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
