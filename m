Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF6EEC43458
	for <linux-riscv@archiver.kernel.org>; Mon, 29 Jun 2026 07:28:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OsqjYMOEIygEOnVp5R03B1KOTVNT8Sd0uhbWlW3FT8E=; b=0kUip5sP8iq0O4
	2Q1JAuwdbxKUc6o3x0XN0Ogn1dSvvMbZbcuvL1+rkGhdrymvh7B4WtTJ8WyV9NplzjtoKZ7OuDj1i
	2oi0y1A+MmOAdtXzgvZkp1zVrSOdyS246Hs6F/lwcVjJSr7P3n7mLs6m1R3TJanYaIpg9MOJDaqup
	E6sgionsyKWwYCfR5eBNR9O0eWfHLT5V0AzS2AKaTOxpILKRhAI/qSXUXDvrVwqnuwfAIsu+Zyo4F
	bv+nM3ZEOKEmQqnkzBOQUuP06b06OrcWcaRKSl4dkAvpaStetEr4jRN6jiVWJEyAI09JniVHAP0EL
	w1bREujZMhvHT3iqm7uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Q2-0000000DtLy-3DLG;
	Mon, 29 Jun 2026 07:28:38 +0000
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we6Q0-0000000DtJW-0uyH
	for linux-riscv@lists.infradead.org;
	Mon, 29 Jun 2026 07:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1782718113; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=cs5txbx9bpKaRI7bmx5ga6+SdBKGKPqwgmoXTwT+GtE=;
	b=WB6+RE6nkQ8+jy6M6nIvegtzOwACAX23g/Hof6MdoTeiRxLUgVXJg9wHC+zRQzi/baDxmrRWdtW+vEOYzN2mbCl9CFttI7fuo4XUUqzave6QwTzhE8igbkL34uY/3jw0Gx3CtBNkDL/2J0V00oK5f4C0CfljeJufKG1hJ+4iI7Y=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R631e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=wanghan@linux.alibaba.com;NM=1;PH=DS;RN=34;SR=0;TI=SMTPD_---0X5oo1N-_1782718108;
Received: from wanghan-Workstation..(mailfrom:wanghan@linux.alibaba.com fp:SMTPD_---0X5oo1N-_1782718108 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 29 Jun 2026 15:28:30 +0800
From: Wang Han <wanghan@linux.alibaba.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	Oleg Nesterov <oleg@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Josh Poimboeuf <jpoimboe@kernel.org>,
	Jiri Kosina <jikos@kernel.org>,
	Miroslav Benes <mbenes@suse.cz>,
	Petr Mladek <pmladek@suse.com>,
	Joe Lawrence <joe.lawrence@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	oliver.yang@linux.alibaba.com,
	xueshuai@linux.alibaba.com,
	zhuo.song@linux.alibaba.com,
	jkchen@linux.alibaba.com,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	live-patching@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH v4 RESEND 3/7] riscv: ftrace: always preserve s0 in dynamic ftrace register frame
Date: Mon, 29 Jun 2026 15:27:09 +0800
Message-ID: <20260629072713.3273743-4-wanghan@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260629072713.3273743-1-wanghan@linux.alibaba.com>
References: <20260629072713.3273743-1-wanghan@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_002836_420031_F142C4EE 
X-CRM114-Status: UNSURE (   9.76  )
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

struct __arch_ftrace_regs declares s0 unconditionally, and both
ftrace_regs_get_frame_pointer() and ftrace_partial_regs() read it
unconditionally. But the SAVE_ABI_REGS / RESTORE_ABI_REGS macros in
mcount-dyn.S only stored s0 under HAVE_FUNCTION_GRAPH_FP_TEST
(CONFIG_FUNCTION_GRAPH_TRACER && CONFIG_FRAME_POINTER). With
CONFIG_FRAME_POINTER=n the slot held whatever was on the stack before,
so any callback going through ftrace_partial_regs() saw a garbage
regs->s0. RISC-V kernels default to FRAME_POINTER=y, which is why this
has not bitten in practice.

Save and restore s0 unconditionally in the dynamic ftrace ABI register
frame. This fixes the latent garbage-s0 case, brings the dynamic ftrace
path in line with the static _mcount path (mcount.S SAVE_ABI_STATE
already saves s0 unconditionally), and matches the frame layout already
documented in the comment above SAVE_ABI_REGS. It is also a prerequisite
for the upcoming reliable unwinder, which reads
ftrace_regs_get_frame_pointer(fregs) directly.

The cost is one extra REG_S/REG_L pair per traced call, negligible
compared to the overall ftrace cost; the existing FREGS_SIZE_ON_STACK
already reserved the slot, so no extra stack space is used.

Reviewed-by: Shuai Xue <xueshuai@linux.alibaba.com>
Signed-off-by: Wang Han <wanghan@linux.alibaba.com>
---
 arch/riscv/kernel/mcount-dyn.S | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/arch/riscv/kernel/mcount-dyn.S b/arch/riscv/kernel/mcount-dyn.S
index 082fe0b0e3c0..26c55fba8fec 100644
--- a/arch/riscv/kernel/mcount-dyn.S
+++ b/arch/riscv/kernel/mcount-dyn.S
@@ -85,9 +85,7 @@
 	addi	sp, sp, -FREGS_SIZE_ON_STACK
 	REG_S	t0,  FREGS_EPC(sp)
 	REG_S	x1,  FREGS_RA(sp)
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	REG_S	x8,  FREGS_S0(sp)
-#endif
 	REG_S	x6,  FREGS_T1(sp)
 #ifdef CONFIG_CC_IS_CLANG
 	REG_S	x7,  FREGS_T2(sp)
@@ -113,9 +111,7 @@
 	.macro RESTORE_ABI_REGS
 	REG_L	t0, FREGS_EPC(sp)
 	REG_L	x1, FREGS_RA(sp)
-#ifdef HAVE_FUNCTION_GRAPH_FP_TEST
 	REG_L	x8, FREGS_S0(sp)
-#endif
 	REG_L	x6,  FREGS_T1(sp)
 #ifdef CONFIG_CC_IS_CLANG
 	REG_L	x7,  FREGS_T2(sp)
-- 
2.43.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
