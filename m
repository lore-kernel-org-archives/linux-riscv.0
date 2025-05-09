Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E87EC3ABBC
	for <linux-riscv@archiver.kernel.org>; Fri,  9 May 2025 08:58:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVd3XSGldKA0Upd6g/RE1J2j71uUg7EcGmgZaihzCLE=; b=A9IBGVKeumKsjP
	XO/4wZX1pfWvQpbzcaL6BdraOqI7errZUo9W/5Y/WduYh2XOCyXMrjJWRBAQyxNYkm2UYj7Niv3mo
	PW1g8AFjPV2FjPsaVmq3P0tT6mkDBc5zqQkfyiPmKpAfHTcTWOumhcl4vpSIzdEH23l9ybFnBAgVY
	ya8zrQChPKaaCNvHCPRLP2c4uOCvjBi9J7B6PwzhdDsqcoAnX0WwRABkQrduOvQpKTQ/+4Lbpj9oA
	4ITM07eSuDqwO7cie8cyQqDsG+xT1EvqdB8cC2eUnVV+Ir3MdZuVL/wsHAsuXy1S/y5aZoRWwlxTg
	yxn4Sp4ZNfzSBVBg/cng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDJYg-000000030qY-2Fr8;
	Fri, 09 May 2025 08:58:18 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uDIqd-00000002sj1-0kCj
	for linux-riscv@lists.infradead.org;
	Fri, 09 May 2025 08:12:48 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1746778366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=;
	b=wlZjvKhbdm6sVaOyjt6pt4Ym0hUdQKte/ZWkLPjcG+rE7gaY9Ll7VSyZmfBLHs8LPmCzU5
	bZzk5kY124CHH6Nh7+dD4XjkAT6rZSszA9s2+6Y+GZRdOx1oL4maOYTiDmQ6LfWEPAAwZf
	VDs3lFa1X1+5HZedH/a54PxhOfgCvibmjn8hbKRvFLk9mtYbbmnpc0VGNQKqxsQ7fWXiNX
	tWlT9bpwSnaojXrHXzfQQoYUML+ndcMaPPaL0FeTTJg1YMs9OeF2Fsy+N/GP0yLTAHGqtF
	OVvA13fLXloNheQF5Pf+pZZiIqpyO+/mcrdgj99FUcbAphBmDtT9KZdjojjjYw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1746778366;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=;
	b=PfLwKkGOwMwoEJ4URPGE8T1k9htKwIAnCTXbLzc5/55gBHFkGBILAyxrDF9xcAO6LUKZpM
	N5rA9UAiZTOiiTBQ==
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: john.ogness@linutronix.de,
	Nam Cao <namcao@linutronix.de>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v7 18/22] riscv: mm: Add page fault trace points
Date: Fri,  9 May 2025 10:12:17 +0200
Message-Id: <f6c5a7002348453b8e6b38293631f2c6d9b78def.1746776116.git.namcao@linutronix.de>
In-Reply-To: <cover.1746776116.git.namcao@linutronix.de>
References: <cover.1746776116.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250509_011247_349788_A5AA8349 
X-CRM114-Status: UNSURE (   7.41  )
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
---
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
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
