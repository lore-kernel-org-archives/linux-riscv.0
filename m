Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DDAFC4332F
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Oct 2022 11:50:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tPOqr3hT6MtmkBKfEaXyqh5YWZq6NVrPFLZzKAw4bOI=; b=gQxTBwiHq0wW3i
	g6pgMGdGaTFJDkAySKWUgZS00Z6PX8nheK8m3Yj+Nq+U/SRX0D9Ph4cewvSuC7bTnufZ5Y/5ktqaM
	cvNgALEvaEJgm4J5pAkb34/c1gpRpnN8bWiYlhZ5Ku8mTiyMlp22D1A/fLd/Gsc7iRJ3JcGU+2wmb
	XPtaWYh1m+2yn7N001yYB594h8cwMitotOHOOMYY6diIOx0toS8ojZ5/yuBC5jydFjR5JXxMerAie
	K4PlvWQraRQkZvDpf+cNu77L73OAbDm9eGULEvbno5JvBLEyeL/EDJtDGG/yZLw382d1lOhDc+gDH
	Mw816GrkYJwlek+3nLHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfgc-00GqP4-Vp; Sat, 15 Oct 2022 11:50:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojfga-00GqMx-LD
	for linux-riscv@lists.infradead.org; Sat, 15 Oct 2022 11:50:38 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2956A60C97;
	Sat, 15 Oct 2022 11:50:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF334C433D7;
	Sat, 15 Oct 2022 11:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665834635;
	bh=KyXvA35NcgjlVfSJ4KXXTHO0QhWLea8Z2lvKUOL8H8c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=l8bX6hDbIlcSw8S9tXQ63o9xpdH1Z90MhBNgvQXJebCi9RaTTmqVg1J4xXScMQ4To
	 BulDdlS9dQVILUBhwOQvZhqkDewDO72uRHLsO05TnQU5McxuysrNDq3Og1il2hjVkX
	 1Ao8CokdKJ3hjinRymxelP7MZI+jB44rN2Gywi8Rf2h7B5CyEku9WN1DoaCPCxcLtZ
	 iFwFS7xE2UrVywbk/NB3I+4EG/ZbhrdVtNhb3TNJB6qIzV08P/Kex4cElWjYsTz90I
	 MGVpehVrgvwm4r1uH5TtLOqf1D7+Hgvoa04kdo0Wy23Flza0yBWqUsVmYPB5G1fSux
	 U9sor1uRgwM1g==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	peterz@infradead.org,
	luto@kernel.org,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	jszhang@kernel.org,
	lazyparser@gmail.com,
	falcon@tinylab.org,
	chenhuacai@kernel.org,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	zouyipeng@huawei.com,
	bigeasy@linutronix.de,
	David.Laight@aculab.com,
	chenzhongjin@huawei.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V7 05/12] riscv: traps: Add noinstr to prevent instrumentation inserted
Date: Sat, 15 Oct 2022 07:46:55 -0400
Message-Id: <20221015114702.3489989-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221015114702.3489989-1-guoren@kernel.org>
References: <20221015114702.3489989-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221015_045036_850478_CA7879E8 
X-CRM114-Status: GOOD (  13.40  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Without noinstr the compiler is free to insert instrumentation (think
all the k*SAN, KCov, GCov, ftrace etc..) which can call code we're not
yet ready to run this early in the entry path, for instance it could
rely on RCU which isn't on yet, or expect lockdep state. (by peterz)

Link: https://lore.kernel.org/linux-riscv/YxcQ6NoPf3AH0EXe@hirez.programming.kicks-ass.net/raw
Suggested-by: Peter Zijlstra <peterz@infradead.org>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/traps.c | 4 ++--
 arch/riscv/mm/fault.c     | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index f3e96d60a2ff..f7fa973558bc 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -95,9 +95,9 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
 }
 
 #if defined(CONFIG_XIP_KERNEL) && defined(CONFIG_RISCV_ALTERNATIVE)
-#define __trap_section		__section(".xip.traps")
+#define __trap_section __noinstr_section(".xip.traps")
 #else
-#define __trap_section
+#define __trap_section noinstr
 #endif
 #define DO_ERROR_INFO(name, signo, code, str)				\
 asmlinkage __visible __trap_section void name(struct pt_regs *regs)	\
diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index d86f7cebd4a7..b26f68eac61c 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -204,7 +204,7 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
  * This routine handles page faults.  It determines the address and the
  * problem, and then passes it off to one of the appropriate routines.
  */
-asmlinkage void do_page_fault(struct pt_regs *regs)
+asmlinkage void noinstr do_page_fault(struct pt_regs *regs)
 {
 	struct task_struct *tsk;
 	struct vm_area_struct *vma;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
