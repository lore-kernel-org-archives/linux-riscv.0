Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A00AC32771
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Sep 2022 15:53:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9580tEVDw3jWbXyfhI1QETpogPVCt2UIE/70AUSBYo=; b=n5LX/utsKCSZY6
	0816A1P5hx66IYx27+6ZV+LaA4B+Oh4lnQUWML2K7BmluWuV67BHmpl8nIa3OxPbUwwjJbi9u8Wx8
	aXO0PPUxhOR0YRchTZKVesRqp+6fGzBRqzn6EpnLakzV+jlwCplppQe1qn7Ia6rXT7L7AmmSY5hfK
	CbUSZSQQSpgHSgdnCDZMgSQY653vEG0+HkyG34Y4QtbILnPPQ6WZgGYh1tCQAbcd2ZdpBbZL4kQDl
	OWZMfhnIvgT6911GNWX77EUVEuC+Tt8Upr37X1X0OHDcrywdEhOB4RVeLIq7s4TMrfwyvHyFENyzC
	ZfnhtqcqJbAvGHEM6Ghw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbo-000G6W-E7; Sun, 18 Sep 2022 15:53:28 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oZwbk-000G2D-Vl
	for linux-riscv@lists.infradead.org; Sun, 18 Sep 2022 15:53:26 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7E87761587;
	Sun, 18 Sep 2022 15:53:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84FF6C43141;
	Sun, 18 Sep 2022 15:53:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1663516403;
	bh=EeFFIvXN/JwkcVumnFfZeBxR0r/LWWg4dvb3hMk4ymM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=afPhU5jyxS2Rz2EnygNlwkVLKecIlTwICH1n2aN6dEG7FcrMRRwwFWN7GGv8kQ1kP
	 qO8AIbteSWxbAmbeTyF7HkZGFY1OHD/Ifw6C1TM4cBhX+1rIRHsm4tKbCXILx89beC
	 pAxSPkTHmXyJRiNVlwAmQv1XTB/dppABVLhjIjJHYor3R1XyFNYLNBcYciIugxcaT7
	 z82nUYpExR0MDiPjTtU68Tf6x087+p9Df06wfpBF4IycG5Wy/O0NSjwKtOY8/hlK0i
	 ibKvP1+8jvBVnvKACcvCo2DBgxfe4ySkr2jnglwONoRTPUH4j/XWvTyksZhn98k9JA
	 wBgkGqj61Uxvw==
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
	David.Laight@aculab.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 05/11] riscv: traps: Add noinstr to prevent instrumentation inserted
Date: Sun, 18 Sep 2022 11:52:40 -0400
Message-Id: <20220918155246.1203293-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220918155246.1203293-1-guoren@kernel.org>
References: <20220918155246.1203293-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220918_085325_099983_5C1758C1 
X-CRM114-Status: GOOD (  13.80  )
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
index 635e6ec26938..588e17c386c6 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -92,9 +92,9 @@ static void do_trap_error(struct pt_regs *regs, int signo, int code,
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
index f2fbd1400b7c..c7829289e806 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -203,7 +203,7 @@ static inline bool access_error(unsigned long cause, struct vm_area_struct *vma)
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
