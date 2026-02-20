Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46F89C5516E
	for <linux-riscv@archiver.kernel.org>; Fri, 20 Feb 2026 09:28:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mfhHHXm3011NKlWdOlVu6x6GTISiyWZ1Jo6SkT4nXo0=; b=ZOVT4CQZvDTFt6
	9d50gmmJK79+wqd0JfcXdo31KEuHf87aYd1Wdrt8u9QmhfK8W1yoYcPkD6hObGyBNRZjr/D40k9CZ
	68zORbcVDX56oHkSlX7cJbFDquCaqm5knIeFLDm4sBIDM3KbQ+Yjg5BkpcFi02lJPkwazzVJWHPNd
	EFr/bnqizoYQxfLWVfw+KCWdO6nOlUaAr0fZSjTpQowL3KMNrUs+l2uegW/pRBvBOly7hf0itJuLd
	+uDZTmoNOB0QJMNTP13XIK76SMrziGPKujWtafpqx6ZYlPD95o0LYoUZL0E9e7vodVjoVXREDgCW8
	21VsaHrCJUCPa73oNZKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnt-0000000DVUO-0sMz;
	Fri, 20 Feb 2026 09:28:05 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtMnq-0000000DVQ1-0sD5;
	Fri, 20 Feb 2026 09:28:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C16941792;
	Fri, 20 Feb 2026 09:28:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29E53C116D0;
	Fri, 20 Feb 2026 09:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771579681;
	bh=nmlph+5TWjJa0sHPU1ah7ms/7375H0UUdoBhmRt0/vM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=EQEDWYJM8jermjpwnybPt56VLRR5jNeGmSaE8MsYD5T8dczHcIXHts+owh9fueUGX
	 f6YMIT/Y4v1LoPI6Hmgy10ShyHpfEtFND57kJPWdK4NXBdODdqn2l2hLv1Akm0H6mY
	 lKTeOZSKQSI1gkacgnbRuduE58kevHFi+W2SNmDZq/VyGAhCmx4cvuK0EuVbPUr/ry
	 zIkuHWHmpbGvZDVaLGlbc+fo8+CbBxBLYg95xOTO4V0lraWNlaUXyJgSln7NAj36me
	 iBR48SFhwvwXd7VqSKX7HzHKkiF0/WmUQRTrskur/tnb8awG0Bgn/fY3WlvMrchY20
	 eWwHB6qqRMDXA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Guo Ren <guoren@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-csky@vger.kernel.org
Subject: [PATCH 2/3] genirq: use runtime constant to optimize handle_arch_irq access
Date: Fri, 20 Feb 2026 17:09:21 +0800
Message-ID: <20260220090922.1506-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260220090922.1506-1-jszhang@kernel.org>
References: <20260220090922.1506-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260220_012802_288778_0D0282D4 
X-CRM114-Status: GOOD (  13.49  )
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

Currently, on GENERIC_IRQ_MULTI_HANDLER platforms, the handle_arch_irq
is a pointer which is set during booting, and every irq processing needs
to access it, so it sits in hot code path. We can use the
runtime constant mechanism which was introduced by Linus to speed up
its accessing.

Tested on Sipeed Lichee Pi 4A (riscv64) board, the perf sched benchmark is
improved by ~5.8%

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 include/linux/irq.h | 4 +++-
 kernel/irq/handle.c | 8 +++++---
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/include/linux/irq.h b/include/linux/irq.h
index 951acbdb9f84..2ba4a8afb71e 100644
--- a/include/linux/irq.h
+++ b/include/linux/irq.h
@@ -1274,6 +1274,7 @@ void ipi_mux_process(void);
 int ipi_mux_create(unsigned int nr_ipi, void (*mux_send)(unsigned int cpu));
 
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
+#include <asm/runtime-const.h>
 /*
  * Registers a generic IRQ handling function as the top-level IRQ handler in
  * the system, which is generally the first C code called from an assembly
@@ -1288,7 +1289,8 @@ int __init set_handle_irq(void (*handle_irq)(struct pt_regs *));
  * Allows interrupt handlers to find the irqchip that's been registered as the
  * top-level IRQ handler.
  */
-extern void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
+extern void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init;
+#define handle_arch_irq runtime_const_ptr(_handle_arch_irq)
 asmlinkage void generic_handle_arch_irq(struct pt_regs *regs);
 #else
 #ifndef set_handle_irq
diff --git a/kernel/irq/handle.c b/kernel/irq/handle.c
index b7d52821837b..aac9e7b1301e 100644
--- a/kernel/irq/handle.c
+++ b/kernel/irq/handle.c
@@ -15,13 +15,14 @@
 #include <linux/kernel_stat.h>
 
 #include <asm/irq_regs.h>
+#include <asm/runtime-const.h>
 
 #include <trace/events/irq.h>
 
 #include "internals.h"
 
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
-void (*handle_arch_irq)(struct pt_regs *) __ro_after_init;
+void (*_handle_arch_irq)(struct pt_regs *) __ro_after_init;
 #endif
 
 /**
@@ -270,10 +271,11 @@ irqreturn_t handle_irq_event(struct irq_desc *desc)
 #ifdef CONFIG_GENERIC_IRQ_MULTI_HANDLER
 int __init set_handle_irq(void (*handle_irq)(struct pt_regs *))
 {
-	if (handle_arch_irq)
+	if (_handle_arch_irq)
 		return -EBUSY;
 
-	handle_arch_irq = handle_irq;
+	_handle_arch_irq = handle_irq;
+	runtime_const_init(ptr, _handle_arch_irq);
 	return 0;
 }
 
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
