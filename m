Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02CD1CA6017
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Oct 2026 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=L2hno3mjfj1vWbKIZDEyDa1Gnyf0g+l8eGe1BW01gRA=; b=pdZrVdW+zjxr8j
	bGtcPVFHjKHYqj474fZ9KyQ3IbswStNAMKyQwplGPWGWGSUoWRcT+gvYqH57jnJ6gNu5Wsiz6rWaF
	DbaqJ+UOqxKQwz4CBotzHjMp3UhVHqZpBWk2qXuPZQxCmtj01O1qJSC9z+RBrSL9CDhzhOaBSNUIO
	MLY2OU/0d3pUzsqR21h/m/3491DaPAQmCioJIp+QYRoiVwTOUHmOPY77Ae0k1xm0CyPtKHUNtYx4k
	0z5Rh4B4x+1c4r3XBcjrN4AVgS2nKFTkr+dCq2oVHhCg4PLZ7l/QuUmIQ37Fy7ugjTyZb4Hdi5UdO
	O9IBb4haA/CVAq/IFxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFX6k-000000086jy-2Q0e;
	Sat, 10 Oct 2026 13:27:26 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFX6h-000000086j8-3yE5
	for linux-riscv@lists.infradead.org;
	Sat, 10 Oct 2026 13:27:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a02718da81so4525875e9.1
        for <linux-riscv@lists.infradead.org>; Sat, 10 Oct 2026 06:27:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791638842; x=1792243642; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=howgOP9h5nUKpogRLZsugGiXSDW33UsJon93r8D0E18=;
        b=LdY/84yB5f0RyhPziw2z1hxzKo+6WQiNSal6mKM+1Q+S4SHDcBYscT3oMcKHgC6EP5
         6IDMTbWMbONEioZvvo5q2BsiMMELnydvc1guSZeFHEVTRY7t0SvcZj+03YW0WdSWwH8P
         WAOq7+C+v7U4Qh9WiD1txarmuD2TJG4nYg8FISDfezPUfBGbiQuemLf7rUzUDAf4DDHK
         htHuWTpaK60TTk0FN8Avgazm4Udw+WV0nsNaqeVmBau3pLnQ2AM9tiIpHtNdxCWIe1XJ
         7hKnSw9l9Y4yNFTPohjxf5Hkbgr0Q+E08PrEUZtcsTSYoqELqrs3OAq2zp9CJOgXb4RV
         /ndg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791638842; x=1792243642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=howgOP9h5nUKpogRLZsugGiXSDW33UsJon93r8D0E18=;
        b=l1+ts/vIPoiuMZrB7vAyS7cUl76xWfPxgbQgB/5dqxCSM/blPppb4boBZNDF9lmZgo
         TXZ4Uns333EoPtmC/yLzH8AzMRw6pYRnUW98mQC/q/wpe6P92PzNqHkTwjYnjXoIv283
         YRfxjd/XLsFPMpY2mJOVNf+7A3tVisdOUZilDn2pbVBt75d3umndMcrwjJwwszq+5MLa
         o6X9DbPxOiM1+Vbx19M/eLie8kDG3ZRjE0/LHl4AEkv0Rh84C0CudatwFn1t5vAZwpk1
         D/CdedKWUXKunvT56sWJUhLErD6iw7PvvjCmUYZL3f62aBSgMx6OwR0Dy9tNBFbWsQWx
         hSng==
X-Forwarded-Encrypted: i=1; AKwUvBxdY4wnaCDxrWX5882LD1hzDDpnLgRDvp/yZFnXl5NgglLcRuIjbcgnXhnv2zqnxMqJNcVwKdL7UQdcjw==@lists.infradead.org
X-Gm-Message-State: AFq9FYJksc0deGlAWw7PDYkWWizm1+rKGzyFYsweyD8+GfPduTfTZHpx
	Cw2TUGCDs7BlEs6s25ECdj7knC7sLeq1J+LfXXJ99vnrbM44NuIM4/dP
X-Gm-Gg: AYBFou2X/pQhNA8bLh+P8NTqxoRepgaUyHMUTBSWlws0j9bYP0sKA+fKYkkKZ4zP8Sx
	4OHqEhq+G2snsC7KwBQU9I727wJ3R90x4tRfJd4ei4SeIUVAZi911HpAhznpD2oKIm0FCTFSUC1
	jb98n5woARM4eofbG/Y+t1uVA5zXPbz1xiFvdh/wpdwLNBaPSEBTYkbjHBXZiDSMawykvaZWM7C
	fSHtTjTq5sbU/Q801l1IdyxOBdFy349RljyatQwoaYBFonxM1272VjToAyb1KFYAZdefcVQ2LWo
	e2mTIwSLKGh6mQrN1tEMH+9CtOfn9Mwl8HeKvSMzNWp3HcDoqcQppk9GIIJ7X56SALUmZNRtGdo
	i9Mi4sPVbowtqTCHE7iA511Jr/u8C3kRL+g+P0r9lQRIKr0BIviBCLx+hFWzKrdHdHka8Qbjny1
	ByNW6194jqO2ZDElWemBH8SeObxbLQ/uUf2vsjrYHgnXVpMspOQNctqsxw8yHiTa/l5F2ihhD7r
	VxI0uIfM4/kACB8bHM1b8u7KR/k+9yyAk3zRQeASa1YGiADvEUE8GC62e5SHDT/JDn14SJIYjLs
	hrajJtg0ri8TxVn/2ffBgrlGbnOoHJGIpFrA8xuUYHzUsnzC0mL8+zYjxkluz1QMjMSDvhuZahA
	=
X-Received: by 2002:a05:600c:c172:b0:4a0:1c0e:b2a8 with SMTP id 5b1f17b1804b1-4a18e4cc2a2mr86751495e9.28.1791638841556;
        Sat, 10 Oct 2026 06:27:21 -0700 (PDT)
Received: from imx93-evk.localdomain (dynamic-2a02-3100-9d3f-0d01-48c7-5d76-0ec6-9dac.310.pool.telefonica.de. [2a02:3100:9d3f:d01:48c7:5d76:ec6:9dac])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf21276sm215410405e9.8.2026.10.10.06.27.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 10 Oct 2026 06:27:21 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Changbin Du <changbin.du@intel.com>,
	Shuai Xue <xueshuai@linux.alibaba.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Brendan Higgins <brendan.higgins@linux.dev>,
	David Gow <david@davidgow.net>,
	Rae Moar <raemoar63@gmail.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kunit-dev@googlegroups.com
Subject: [PATCH 1/2] riscv: stacktrace: do not report the walker's own frame from arch_stack_walk()
Date: Sat, 10 Oct 2026 15:27:11 +0200
Message-Id: <20261010132712.46931-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261010_062724_101303_387369B9 
X-CRM114-Status: GOOD (  20.10  )
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

stack_trace_save() uses skipnr + 1 because arch_stack_walk() is expected
to first report the return into stack_trace_save(). With FRAME_POINTER,
the RISC-V arch_stack_walk() calls walk_stackframe(), which starts from
its own frame and first reports the return into arch_stack_walk().
stack_trace_save() therefore starts one frame too early. For example,
page_owner records begin at __set_page_owner() instead of the allocation
site.

Move the walker into an always-inlined helper and call it directly from
arch_stack_walk(). Keep walk_stackframe() as a wrapper for its existing
callers.

return_address() skips level + 3 entries, while the arm64 implementation
skips level + 2. After removing the extra frame, use level + 2 so
ftrace_return_address() and CALLER_ADDR results do not shift by one caller.

Fixes: 6a00ef449370 ("riscv: eliminate unreliable __builtin_frame_address(1)")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Tested with the KUnit suite from patch 2 on QEMU's virt machine, clang 22
(LLVM=1), on af32da41b032:

  mainline                        stack_trace_save 0/3, return_address 2/2
  stacktrace.c change alone       stack_trace_save 3/3, return_address 0/2
  this patch                      stack_trace_save 3/3, return_address 2/2

A BeagleV Ahead (TH1520) booted with this patch passes all five cases.
The stack_trace_save() result on mainline (0/3) was also reproduced with
GCC 15.2 and QEMU 10.2.1.

Without CONFIG_FRAME_POINTER the walker scans the stack for anything that
looks like a text address and its start frame is not exact before or
after this patch. What return_address() returns there is unchanged: the
walk loses one leading entry and the skip count goes down by one.

The reliable unwinder series [1] rewrites this walker and has the correct
start frame for stack_trace_save() as a side effect, but leaves
return_address() at level + 3. This patch conflicts with 5/7 of that
series; if that goes in first, only the return_address.c hunk is needed.

[1] https://lore.kernel.org/r/20260914092648.51254-1-xueshuai@linux.alibaba.com

 arch/riscv/kernel/return_address.c |  2 +-
 arch/riscv/kernel/stacktrace.c     | 40 +++++++++++++++++++++++++++++-----
 2 files changed, 36 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/kernel/return_address.c b/arch/riscv/kernel/return_address.c
index c8115ec8fb30..4da1cfd249d3 100644
--- a/arch/riscv/kernel/return_address.c
+++ b/arch/riscv/kernel/return_address.c
@@ -33,7 +33,7 @@ noinline void *return_address(unsigned int level)
 {
 	struct return_address_data data;
 
-	data.level = level + 3;
+	data.level = level + 2;
 	data.addr = NULL;
 
 	arch_stack_walk(save_return_addr, &data, current, NULL);
diff --git a/arch/riscv/kernel/stacktrace.c b/arch/riscv/kernel/stacktrace.c
index c7555447149b..28c5744889ba 100644
--- a/arch/riscv/kernel/stacktrace.c
+++ b/arch/riscv/kernel/stacktrace.c
@@ -45,8 +45,16 @@ static inline int fp_is_valid(unsigned long fp, unsigned long sp)
 	return !(fp < low || fp > high || fp & 0x07);
 }
 
-void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
-			     bool (*fn)(void *, unsigned long), void *arg)
+/*
+ * Always inlined so that the frame the walk starts from is the caller's own,
+ * and the first entry reported for the current task is the caller's return
+ * address.  arch_stack_walk() relies on that to report the same frames as
+ * the other architectures, see the comment there.
+ */
+static __always_inline void __walk_stackframe(struct task_struct *task,
+					      struct pt_regs *regs,
+					      bool (*fn)(void *, unsigned long),
+					      void *arg)
 {
 	unsigned long fp, sp, pc;
 	int graph_idx = 0;
@@ -59,6 +67,7 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	} else if (task == NULL || task == current) {
 		fp = (unsigned long)__builtin_frame_address(0);
 		sp = current_stack_pointer;
+		/* Placeholder for the frame the walk starts from, never reported. */
 		pc = (unsigned long)walk_stackframe;
 		level = -1;
 	} else {
@@ -102,10 +111,18 @@ void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
 	}
 }
 
+void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+			     bool (*fn)(void *, unsigned long), void *arg)
+{
+	__walk_stackframe(task, regs, fn, arg);
+}
+
 #else /* !CONFIG_FRAME_POINTER */
 
-void notrace walk_stackframe(struct task_struct *task,
-	struct pt_regs *regs, bool (*fn)(void *, unsigned long), void *arg)
+static __always_inline void __walk_stackframe(struct task_struct *task,
+					      struct pt_regs *regs,
+					      bool (*fn)(void *, unsigned long),
+					      void *arg)
 {
 	unsigned long sp, pc;
 	unsigned long *ksp;
@@ -133,6 +150,12 @@ void notrace walk_stackframe(struct task_struct *task,
 	}
 }
 
+void notrace walk_stackframe(struct task_struct *task, struct pt_regs *regs,
+			     bool (*fn)(void *, unsigned long), void *arg)
+{
+	__walk_stackframe(task, regs, fn, arg);
+}
+
 #endif /* CONFIG_FRAME_POINTER */
 
 static bool print_trace_address(void *arg, unsigned long pc)
@@ -176,10 +199,17 @@ unsigned long __get_wchan(struct task_struct *task)
 	return pc;
 }
 
+/*
+ * The generic code expects the first entry for the current task to be the
+ * return address of arch_stack_walk() itself, the way x86 and arm64 report
+ * it, and stack_trace_save() sizes its skip count accordingly.  Walking from
+ * inside a called walk_stackframe() adds that function's own frame on top,
+ * so inline the walker here and start from this frame instead.
+ */
 noinline noinstr void arch_stack_walk(stack_trace_consume_fn consume_entry, void *cookie,
 		     struct task_struct *task, struct pt_regs *regs)
 {
-	walk_stackframe(task, regs, consume_entry, cookie);
+	__walk_stackframe(task, regs, consume_entry, cookie);
 }
 
 /*

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
