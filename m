Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F332AC433F5
	for <linux-riscv@archiver.kernel.org>; Sun,  2 Oct 2022 01:26:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9580tEVDw3jWbXyfhI1QETpogPVCt2UIE/70AUSBYo=; b=sRhElr9p+L7qeE
	aEgCb6oduYdRpP/Q57H3JFCUIsSUWrrvkrA9cberIaqE0oWD73KHhN9oXPg5NvRq72BlsHuTDJIOJ
	n8pUUsro6tL6J6WJEyJON2986hPbfVKHXALQ6ZI60zdN1wbh0lK3mh0FdnijWfDtD4XtUg+WLkf8Z
	pveQlZIpSNWNehbbMOVoUmJs0jxuDRNTRqB12kTBeMTIyN0hXmCp/9kR22EulJPcB7Qpf2orNbvie
	1z47SjBUrBV6AAieetnuMHADUTFgPVgPMdZeDYiFpWaXM/ymyEqC43hEsaFqV9vyc/SspLP+fH92J
	Qs7KPz0hsVCwkUsZq8yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjy-00GrUV-JR; Sun, 02 Oct 2022 01:25:58 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oenjw-00GrTY-CR
	for linux-riscv@lists.infradead.org; Sun, 02 Oct 2022 01:25:57 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id DB12E60D57;
	Sun,  2 Oct 2022 01:25:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4727BC433C1;
	Sun,  2 Oct 2022 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664673955;
	bh=EeFFIvXN/JwkcVumnFfZeBxR0r/LWWg4dvb3hMk4ymM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=J4yvWGBSPf9Y9N9IKDjk1dnY4/YT1GF9wM+oqOvXFFiGrlFDjy2TZyQz3apT5jN55
	 iNZa3jsZhy/nH8IMxATZ/SAgBBwjoSqtHGdmI+tkMij1QU2zbdy/BB4EiFzKdV2ibX
	 s0PXVNF9EdAGIEw0G+PbtvJRUh85mN1Tlsv1FqmlhjfV882wuOpPxZfoAGgJRqTjSs
	 GbCZdk7ze0YCrvvoIFPgFTO9rjh2mluwtAZd/S+ksKu+832N6+rq9XGzF8oCP4Eb8E
	 P/juTThIbNeYBpRktkLvAB8665DrX3zphDT5RlW9vzSuKj2yJFncLHmC8/Dr5Gx5Eb
	 FC30Vhn2uzypw==
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
	chenzhongjin@huawei.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 05/11] riscv: traps: Add noinstr to prevent instrumentation inserted
Date: Sat,  1 Oct 2022 21:24:45 -0400
Message-Id: <20221002012451.2351127-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221002012451.2351127-1-guoren@kernel.org>
References: <20221002012451.2351127-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221001_182556_481311_126DDD7D 
X-CRM114-Status: GOOD (  13.31  )
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
