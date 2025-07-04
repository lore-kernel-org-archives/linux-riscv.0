Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D6D1C83F03
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 13:45:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PHHO9S4qG+5E2CZmM2zwmfTPlKmiSNXhlGoeVBuHdM0=; b=nLL1P7ZqtcW4jG
	l7yxxQPhjTV+ZqSpAwFlWjg2T4z5aiSFLABCZ9En9cd2XBO5wF9+4+k8K7lbYKVPAaJgd5XvbbPoy
	QedfLBPFNI9QEDfr0oHpwh4XU8wKX7FSioc2BuHM0WxiohKxkc3IgnPS76xI3oxso9CFcVjbvGiqI
	94l8FXeA7nJ/lt77MsqPj+ff9/hL38KuxysaQDL0ymFFWXZYNHZQ51pOp8fooqRKsUgq7nqHJycaz
	VkC/r2Cjj9+6SvhSRpRSt0rlCSJJtiDf3CtNfGVlKcCaf9kGQKgvoBwcZ+182M8Y5yTuHhN/jxAE2
	PY3pcAWyG23VITwPLgvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgim-0000000EYbR-1NqX;
	Fri, 04 Jul 2025 13:44:56 +0000
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXgLL-0000000EUdD-2GTd
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 13:20:44 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751635240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EE8nze+dHV488yKI++rzQSjed2WDi861RqnjmSmBFVc=;
	b=BdZMuLx8cSXRL5EOMJAQ26EuaXJpzQsttckmE06bw/HAGjLRF9iAwRN9fxNaPyQv838kvm
	5Vlrh8g9JUuXPAsH/U7dKI6XTkpskUBziil2Rvn+FBPZWw5sBD8mzUh9ZDdiJDYl6bGjyQ
	eXzCzt7uOIObnj9t2YGxaN1tMNMdXPoSlzL7+4MTWxe6BDWgUTctzrk1y/HVPCaEgoaJJN
	s4XfOnZDLldBcLE1MM3NvzPTvDdFlDAgPpr9gcDJJ+gR88uv96UgcmJv7CTJAw9sUx+k2R
	iAYqNh6/10UXPCWDHYjJzAZlZc76QSKYyIBSgGAW9zrU+Gacp/Jz4mksLIBWLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751635240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=EE8nze+dHV488yKI++rzQSjed2WDi861RqnjmSmBFVc=;
	b=FgxC8+w9z4RUHzTPkrnkogGgx03o6FFPgAURnK5rWK+Y/OBBxXCKWrHbsqZ6ruZvye7UDX
	N5/YM3gzDoHZZWBA==
To: Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Gabriele Monaco <gmonaco@redhat.com>,
	john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v11 17/21] riscv: mm: Add page fault trace points
Date: Fri,  4 Jul 2025 15:20:09 +0200
Message-Id: <97604a88be30e672e40a0ddf02a1d5a623ed8c97.1751634289.git.namcao@linutronix.de>
In-Reply-To: <cover.1751634289.git.namcao@linutronix.de>
References: <cover.1751634289.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_062043_717904_25E20E86 
X-CRM114-Status: UNSURE (   7.68  )
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

Add page fault trace points, which are useful to implement RV monitor that
watches page faults.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Acked-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Acked-by: Palmer Dabbelt <palmer@dabbelt.com>
---
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/mm/fault.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/riscv/mm/fault.c b/arch/riscv/mm/fault.c
index 0194324a0c50..04ed6f8acae4 100644
--- a/arch/riscv/mm/fault.c
+++ b/arch/riscv/mm/fault.c
@@ -20,6 +20,9 @@
 #include <asm/ptrace.h>
 #include <asm/tlbflush.h>
 
+#define CREATE_TRACE_POINTS
+#include <trace/events/exceptions.h>
+
 #include "../kernel/head.h"
 
 static void show_pte(unsigned long addr)
@@ -291,6 +294,11 @@ void handle_page_fault(struct pt_regs *regs)
 	if (kprobe_page_fault(regs, cause))
 		return;
 
+	if (user_mode(regs))
+		trace_page_fault_user(addr, regs, cause);
+	else
+		trace_page_fault_kernel(addr, regs, cause);
+
 	/*
 	 * Fault-in kernel-space virtual memory on-demand.
 	 * The 'reference' page table is init_mm.pgd.
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
