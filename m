Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97747C369DC
	for <linux-riscv@archiver.kernel.org>; Tue, 29 Apr 2025 12:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OVd3XSGldKA0Upd6g/RE1J2j71uUg7EcGmgZaihzCLE=; b=2z7Iasi1dd3RUe
	YE9BmO50PHvIiM8sC7iYujnP9W1TO0ADWY2KSoLMSMcdoUoykuF29Jr+INusjpUwb2iG6PZlWX6qi
	WReK1YfUVGUJBzzmoJ6E+/C2nhGk9bw1p6Dff0QHnWH/aXFz5TXlAF76vLC7dd5Ph1mptZ2fsO/GP
	/tb9saxoflxkTu3nOwT/ot6+FXKYtgLYZsd8Q2ck1bRvKuLCTx7JkYJ64EzPFuhXLSx1K1pbv535e
	QQSUiXdqxWoBUUalok852OJvjdBHw+3s6+CjcMV0OSftkvBSd2O9Xsp1rU7Vp4MqRvAmRsjpXoNdQ
	u3biuVS60dxkv2Vx8b3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jiN-00000009bcU-17rQ;
	Tue, 29 Apr 2025 12:05:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9jea-00000009azE-44zG
	for linux-riscv@bombadil.infradead.org;
	Tue, 29 Apr 2025 12:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=; b=lfyUkYp1vp5JWQDgQcFF7cDe/i
	FGemTeU4krfap8Z5/vHSaGGV6OeVRwN2e/CJCijbn2SuLrmITWm1fDNN28SI8NSA99dtEWe3cBSAw
	KX89VhYC6TpVo4SmalLiE0F6Oc1yGNzarVGTADbHmVoTQWs8ydBvO8Q0kjxYpB/4d9Hc+biy/VUS7
	V60ZziQf53KEgx5XMGNwwu8kZT7x4xLJaRjCFx3CLQ3MpSvqzFKafLUdJWAoVdPkG8BYOvTqaHym/
	mm7yWt1u8qcl1UFwOFQiR6GiFgl1IE1JSI9HmKusU/R/yUIbDmkavDBVMYgeFoaS/hP+hGgVKc0WW
	lKFL80xQ==;
Received: from galois.linutronix.de ([2a0a:51c0:0:12e:550::1])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u9jeX-0000000DJ0c-2ldY
	for linux-riscv@lists.infradead.org;
	Tue, 29 Apr 2025 12:01:35 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745928092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=;
	b=zs50VbMd5RPwPLLoES8n9vP5JDBeTma5SNNlVGcRoV8H+HTZB9R7c3aP96Cx9Mdk16UBvw
	RNBgsv4/UFu6erZ5g3/N5FznYjJ+j9VDtBaL/2Xp3d4bHLZxM4p5RPk1QBLHFQRNAUPded
	ZAvHlTtx0pMZtriVVtm/hXnjV/XbgvGa/dwybOQ9sxFsuIWG5Mkute9JbKpeXdOWtq1bEz
	xIowuDFUr1928UvbunJnQ7VloI3F2d413tNzi2CVfU47z/FICZOHp0BMSN5ut9KsCz1lRY
	JgFrPAIRedLPGsyCQwVlTHg4L6cfFlfj6ENHb+ybgKbD/F9vdItQo1jkpIVMLg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745928092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GRN84yAGCbJ9jXd7YMFr0fN4dU5tvyZpKeky5D5bT9k=;
	b=kUuJdrB1DQ5Z21gxVBukh/xivxxLllH4B3gcRA6T9DaPj9+cx0CMQe51sKURkyfvet4IL7
	IsRe9NUtI2CELhCA==
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
Subject: [PATCH v5 18/23] riscv: mm: Add page fault trace points
Date: Tue, 29 Apr 2025 14:01:03 +0200
Message-Id: <dbcd52978bc997a59181b3d22601bf7c3c8210ed.1745926331.git.namcao@linutronix.de>
In-Reply-To: <cover.1745926331.git.namcao@linutronix.de>
References: <cover.1745926331.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250429_130133_762390_C6ED41C6 
X-CRM114-Status: UNSURE (   7.03  )
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
