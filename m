Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07DD9C36010
	for <linux-riscv@archiver.kernel.org>; Fri, 11 Apr 2025 07:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVd3XSGldKA0Upd6g/RE1J2j71uUg7EcGmgZaihzCLE=; b=abRouGNVNHqTS3
	5uCjiTLkel/tNYGGzrOM/5PHEUYOUQuOLnmI250PRv0DPSDvZQ5IuixCHFSYvYriTXizMRJWY/SFy
	7uza0NdMwMhOho4VSe6VqISk6TqTZcoVBPQ8hS++S9Q7iztVmeb4qhtVYgfBtpVlaOYc+22Y/jD7x
	00bIWiVFQPjmCWPPqshAutTSt8lALBw+oSqL1QaFBZJJiohg7yXUSC73M3C8/F1V7GKYc/Ej/Stji
	Bv82ur8UW/IDt8jHwGvPBzxs4FHvFDdMIWbIHCHyelnY7lS5mNKl2cwjyWveHSbEg2OWYAgrHkKnm
	9sM1APX+r3WvGO58NCXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u391N-0000000CuYo-1cZ8;
	Fri, 11 Apr 2025 07:41:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u38xv-0000000CtzT-1Dph
	for linux-riscv@bombadil.infradead.org;
	Fri, 11 Apr 2025 07:38:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=; b=cK9Dt+zGcSR1GZmrnmA1jm2uJC
	Fylb/DCa7qwowwJQYafUCJ8w+gmgL4ASHQMNmNDu7b89/Y3WufPW1GPLLzepVgrcSYe6IDM8SNi8j
	KsTT+4DFLnheomD5rFGSwVBP/1SWd3K2TUw+JJKWh23v8xBDEWTMAqO/0oyyQYv11IyeMKjC9FJXD
	Hxckp2F/xK42bG2funG4ReVBt8As3oexmTkV0qQkgHNyxJv2M63KSNaQCgQHeUoILGD37IMSAuCMI
	SpdON4gEe2zWutet1bpVmwBXVBvU6T/ViNFhCq3HML7zMouh1yaQiATRyQnXs5K+63cwar+Q/WfA1
	/vYKW5XQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u38xs-00000008xvs-1ARQ
	for linux-riscv@lists.infradead.org;
	Fri, 11 Apr 2025 07:38:18 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1744357093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=;
	b=c/2Rsani1hT35Cqnzj8xOZOp+r/nolml77r99gNnEpLZ0SyKe0/nOuUh7dFunwFACqN/ED
	SloBqJ64a5fRS2aiA+Rl5fbGECwBjjSw9N4trekQ1bbwPbRk3KYbjXBSSCjIhyb6H4oKa2
	jcT4nNMzygupToztoRUF71xNVlYaXGq8cvgmaygrZtEKF+A71es7jmif1JLA9cPyRgkwBL
	vgjwwYnR6eKsYyzrhvxZu49h8KAIF53k9lSoQTIPrIBuhU//KFu0dwfDDk3IsM4JMpAFfJ
	dvHRURq8Anp4Dc/TPoc5EUs/fQkY0zomUhHRUII1hELILDcXyaBEX9Xp21Ewpw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1744357093;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=;
	b=E0Iqet4pSAXE+UC0ayzROuYKmudwTofI3E/a0x2/uNMHJmtL6NNolfKDJE0W+Aq5yjHulF
	TSxBUWrAjdfRCcDg==
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
Subject: [PATCH v2 18/22] riscv: mm: Add page fault trace points
Date: Fri, 11 Apr 2025 09:37:34 +0200
Message-Id: <8fcf3f2a72c9491b206b34d133801634c8286fd8.1744355018.git.namcao@linutronix.de>
In-Reply-To: <cover.1744355018.git.namcao@linutronix.de>
References: <cover.1744355018.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250411_083816_533708_15AA0FDC 
X-CRM114-Status: UNSURE (   7.24  )
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
