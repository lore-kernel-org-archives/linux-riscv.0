Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BD9BE7849A
	for <linux-riscv@archiver.kernel.org>; Mon,  2 Oct 2023 12:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kzpxpBp/8henB490SlhemuKFruitMXLCU0wlJ3cMMCc=; b=aKvIYa0eUIHlXU
	LVFvleH2CeyPwK+If8ENE0p7sngGUAFpkmpQgxlG0OHi7n9GkDGjYD/DS8N+KtHZe6Z8jAoRuFP76
	breMia+HChPYy2q0RPyMrFVnZshaAOxSb2MHGR+urwpANUgv8PCsdupKgqwTy/oZOgPl8y3BL0glN
	fGjt/w5TBPr8s510fG0atFEZG1Zi9A4mqJ9O5PvQbN12PDoJuSPnDg3KI2bTDmWC/2S2bcm4QLBDq
	nubYnywkoaPZeiJv/sDQHcrvY6nzEXetqztuG5bXaV+sw6VezVFWVMO4FB40X/3KpkhtWv0duvK4B
	K43lhnIxx/APJKMXoOjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qnINt-00Ck0u-2k;
	Mon, 02 Oct 2023 12:50:49 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qnINo-00Ck0B-1i
	for linux-riscv@lists.infradead.org;
	Mon, 02 Oct 2023 12:50:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id A9AACCE0E67;
	Mon,  2 Oct 2023 12:50:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28483C433C8;
	Mon,  2 Oct 2023 12:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1696251038;
	bh=LhYnyuDASlXkoXmwCgKG/bRCaq518SQW1Kv1bqMglGs=;
	h=From:To:Cc:Subject:Date:From;
	b=j+2iy+WOVlyl36WsTSuxjirEGB8lyjE8CGDLRfjjR349cMKXKfiUqLyFhcd+tUoQo
	 9sXgGDP6rk4BE4Kk8pi6NYHCzOk5hP/RA6jFlOFh+oWaI3+OT1fTWmT56dOmVOl6uF
	 nDgFIhKQIJHSvH17zUaIF3lX0+hMubXA2DmmMmM6myU1shYEtqG8Gtnt0O/dasBVoO
	 H2QOIfycasgVhM/jCQ2oKdcoh5Pum0t5R94BBcG9LIoj3wThOcYcr3HEmPv17OADAk
	 PQb0curuVUpyq/ZhS85aGohpXk2KL3NCnRNu23EVZNM00oL3uPdvGy8Qvb2xeRvBWa
	 5xfZBZGX8hBWw==
From: "Masami Hiramatsu (Google)" <mhiramat@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Guo Ren <guoren@linux.alibaba.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	linux-riscv@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org
Subject: [PATCH] riscv: ftrace: Fix to pass correct ftrace_regs to ftrace_func_t functions
Date: Mon,  2 Oct 2023 21:50:34 +0900
Message-Id: <169625103396.278295.15281009481727023114.stgit@devnote2>
X-Mailer: git-send-email 2.34.1
User-Agent: StGit/0.19
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231002_055044_938807_7AE42070 
X-CRM114-Status: UNSURE (   9.08  )
X-CRM114-Notice: Please train this message.
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

From: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Since ftrace_func_t requires to pass 'struct ftrace_regs *' as the 4th
argument even if FTRACE_OPS_FL_SAVE_REGS is not set, ftrace_caller must
pass 'struct ftrace_regs *', which is a partial pt_regs, on the stack
to the ftrace_func_t functions, so that the ftrace_func_t functions can
access some partial registers.

Fix to allocate 'struct ftrace_regs' (which has the same size of 'struct
pt_regs') on the stack and save partial (argument) registers on it
instead of reduced size custom data structure.

Fixes: afc76b8b8011 ("riscv: Using PATCHABLE_FUNCTION_ENTRY instead of MCOUNT")
Signed-off-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>
---
 arch/riscv/kernel/mcount-dyn.S |   65 +++++++++++++++++-----------------------
 1 file changed, 28 insertions(+), 37 deletions(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 669b8697aa38..84963680eff4 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -14,46 +14,37 @@
 	.text
 
 #define FENTRY_RA_OFFSET	8
-#define ABI_SIZE_ON_STACK	80
-#define ABI_A0			0
-#define ABI_A1			8
-#define ABI_A2			16
-#define ABI_A3			24
-#define ABI_A4			32
-#define ABI_A5			40
-#define ABI_A6			48
-#define ABI_A7			56
-#define ABI_T0			64
-#define ABI_RA			72
 
 	.macro SAVE_ABI
-	addi	sp, sp, -ABI_SIZE_ON_STACK
-
-	REG_S	a0, ABI_A0(sp)
-	REG_S	a1, ABI_A1(sp)
-	REG_S	a2, ABI_A2(sp)
-	REG_S	a3, ABI_A3(sp)
-	REG_S	a4, ABI_A4(sp)
-	REG_S	a5, ABI_A5(sp)
-	REG_S	a6, ABI_A6(sp)
-	REG_S	a7, ABI_A7(sp)
-	REG_S	t0, ABI_T0(sp)
-	REG_S	ra, ABI_RA(sp)
+	addi	sp, sp, -PT_SIZE_ON_STACK
+
+	/* Save t0 as epc for ftrace_regs_get_instruction_pointer() */
+	REG_S	t0, PT_EPC(sp)
+	REG_S	a0, PT_A0(sp)
+	REG_S	a1, PT_A1(sp)
+	REG_S	a2, PT_A2(sp)
+	REG_S	a3, PT_A3(sp)
+	REG_S	a4, PT_A4(sp)
+	REG_S	a5, PT_A5(sp)
+	REG_S	a6, PT_A6(sp)
+	REG_S	a7, PT_A7(sp)
+	REG_S	t0, PT_T0(sp)
+	REG_S	ra, PT_RA(sp)
 	.endm
 
 	.macro RESTORE_ABI
-	REG_L	a0, ABI_A0(sp)
-	REG_L	a1, ABI_A1(sp)
-	REG_L	a2, ABI_A2(sp)
-	REG_L	a3, ABI_A3(sp)
-	REG_L	a4, ABI_A4(sp)
-	REG_L	a5, ABI_A5(sp)
-	REG_L	a6, ABI_A6(sp)
-	REG_L	a7, ABI_A7(sp)
-	REG_L	t0, ABI_T0(sp)
-	REG_L	ra, ABI_RA(sp)
-
-	addi	sp, sp, ABI_SIZE_ON_STACK
+	REG_L	a0, PT_A0(sp)
+	REG_L	a1, PT_A1(sp)
+	REG_L	a2, PT_A2(sp)
+	REG_L	a3, PT_A3(sp)
+	REG_L	a4, PT_A4(sp)
+	REG_L	a5, PT_A5(sp)
+	REG_L	a6, PT_A6(sp)
+	REG_L	a7, PT_A7(sp)
+	REG_L	t0, PT_T0(sp)
+	REG_L	ra, PT_RA(sp)
+
+	addi	sp, sp, PT_SIZE_ON_STACK
 	.endm
 
 #ifdef CONFIG_DYNAMIC_FTRACE_WITH_REGS
@@ -96,8 +87,8 @@ ftrace_call:
 	call	ftrace_stub
 
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
-	addi	a0, sp, ABI_RA
-	REG_L	a1, ABI_T0(sp)
+	addi	a0, sp, PT_RA
+	REG_L	a1, PT_T0(sp)
 	addi	a1, a1, -FENTRY_RA_OFFSET
 #ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	mv	a2, s0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
