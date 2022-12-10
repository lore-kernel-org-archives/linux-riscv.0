Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73FD8C10F1B
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Dec 2022 17:13:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=REiuuET3zEPIea8IBfcx6ByelQg16zNAua0yZpIvJ2k=; b=X+CLstLjz2W0Lt
	RvsUOBIGxLXgbhWxTXVj3waqgi9TBgnjaGyF/ChOD9Vwxnqibc/77jcyqkAX5p+/zPBqplFUhWuH1
	Rde7dFs/y7arehiPbN4rq2D6zFSyj0Dh9lCvkdMFzSUQjt8QjdllKoJyTKZ9qmjvcdhJ0md51giqj
	Ra08LArseIkRoIlMgnIVpxgqYatKwQ7IytKwd9wSddubi67s5q3aBlpNv05R88gvkMJPNQSznxV3l
	xOMaIEBnf3ACBP4TdogHXZEYeUHJf9/T0pt6TR0Tr23vnITsIn+NGqit5U+Z+09VF8dh8fhXYb5c9
	8ea0p9hYN3eJADKkIBsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p43PR-0032YT-VJ; Sat, 10 Dec 2022 17:13:10 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p43PN-0032Om-06
	for linux-riscv@lists.infradead.org; Sat, 10 Dec 2022 17:13:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 97877B808C5;
	Sat, 10 Dec 2022 17:13:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DFB9C43396;
	Sat, 10 Dec 2022 17:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1670692382;
	bh=omeDF8ywxGZ2tZfV8A15PC5eT0KOt0dg5z6qlDtCSIE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=vDf1ZD6RmH08RRGkoFCzK2wzaK4f026RHn/elvkQZ6ETR11ZCp3SlJWSHGczjnfb1
	 aEhxXUVjQlTsua1VBsfTUb/17sryYFJr+prbcxZr3jGfEAEsRXSNWpXA40W2QTHLun
	 doVIASdvmvox3fdZDMz8JyEd1o0cPW2NiU22CnN7Y004AOgkfaSCWKhlbG+aU9RgTR
	 g/ubIj3z6ARuTs5l1xep4qGrdIH7Fu7Sb/PVwOk1vmuYAd2mnJh0+gDARTEKk1Bw8N
	 3NfpphRQIZSdI7dNZhB/YqgLJavqAABaaHevNtvMINoQf/67kDs37hxJ/LU8k1zj4Q
	 LzFCUjydNYsgg==
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
	paul.walmsley@sifive.com,
	mark.rutland@arm.com,
	greentime.hu@sifive.com,
	andy.chiu@sifive.com,
	ben@decadent.org.uk,
	bjorn@kernel.org
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH -next V11 5/7] riscv: entry: Remove extra level wrappers of trace_hardirqs_{on,off}
Date: Sat, 10 Dec 2022 12:11:39 -0500
Message-Id: <20221210171141.1120123-6-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20221210171141.1120123-1-guoren@kernel.org>
References: <20221210171141.1120123-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221210_091305_859591_FA1E85C0 
X-CRM114-Status: GOOD (  11.58  )
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

From: Jisheng Zhang <jszhang@kernel.org>

Since riscv is converted to generic entry, there's no need for the
extra wrappers of trace_hardirqs_{on,off}.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
Tested-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/kernel/Makefile    |  2 --
 arch/riscv/kernel/trace_irq.c | 27 ---------------------------
 arch/riscv/kernel/trace_irq.h | 11 -----------
 3 files changed, 40 deletions(-)
 delete mode 100644 arch/riscv/kernel/trace_irq.c
 delete mode 100644 arch/riscv/kernel/trace_irq.h

diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index 4cf303a779ab..392fa6e35d4a 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -68,8 +68,6 @@ obj-$(CONFIG_CPU_PM)		+= suspend_entry.o suspend.o
 obj-$(CONFIG_FUNCTION_TRACER)	+= mcount.o ftrace.o
 obj-$(CONFIG_DYNAMIC_FTRACE)	+= mcount-dyn.o
 
-obj-$(CONFIG_TRACE_IRQFLAGS)	+= trace_irq.o
-
 obj-$(CONFIG_PERF_EVENTS)	+= perf_callchain.o
 obj-$(CONFIG_HAVE_PERF_REGS)	+= perf_regs.o
 obj-$(CONFIG_RISCV_SBI)		+= sbi.o
diff --git a/arch/riscv/kernel/trace_irq.c b/arch/riscv/kernel/trace_irq.c
deleted file mode 100644
index 095ac976d7da..000000000000
--- a/arch/riscv/kernel/trace_irq.c
+++ /dev/null
@@ -1,27 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0
-/*
- * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
- */
-
-#include <linux/irqflags.h>
-#include <linux/kprobes.h>
-#include "trace_irq.h"
-
-/*
- * trace_hardirqs_on/off require the caller to setup frame pointer properly.
- * Otherwise, CALLER_ADDR1 might trigger an pagging exception in kernel.
- * Here we add one extra level so they can be safely called by low
- * level entry code which $fp is used for other purpose.
- */
-
-void __trace_hardirqs_on(void)
-{
-	trace_hardirqs_on();
-}
-NOKPROBE_SYMBOL(__trace_hardirqs_on);
-
-void __trace_hardirqs_off(void)
-{
-	trace_hardirqs_off();
-}
-NOKPROBE_SYMBOL(__trace_hardirqs_off);
diff --git a/arch/riscv/kernel/trace_irq.h b/arch/riscv/kernel/trace_irq.h
deleted file mode 100644
index 99fe67377e5e..000000000000
--- a/arch/riscv/kernel/trace_irq.h
+++ /dev/null
@@ -1,11 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * Copyright (C) 2022 Changbin Du <changbin.du@gmail.com>
- */
-#ifndef __TRACE_IRQ_H
-#define __TRACE_IRQ_H
-
-void __trace_hardirqs_on(void);
-void __trace_hardirqs_off(void);
-
-#endif /* __TRACE_IRQ_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
