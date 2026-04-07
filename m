Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E00E0FF5130
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 17:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	References:In-Reply-To:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YKlekLZvKWJCfpR/f/GzvGUVkHYE6iDv65hzEPOUsTs=; b=aqoqTMkF35PZbY
	/eHMrAUo4wznmu+qm8JJW2cJLFnVvzDgbYuZKt4B5hAUgok0iBaS+6LNY8sKDMNoWeeazlLgvaA5B
	/Jrw1jCv5Lw7qwrULdUsFSBVklwRCeJUzOlyblusWgaLSMg8GSBIkSL4U2bXvemx2z6ExgXdDxlF8
	N3FzAF+kxpvCpfgBo/v0MQJ/1m/htgzsgYvdt9xalBBxnEng2VKcqaCCCJhXFXGCpPqX9tj9mO+5j
	U04KxNFTZWx8yuqBkQdo8fTRMuokSyn5NTwOez8z11ZVC/PjefEky+JAsIZKVJiHijeEtpDdX0XQR
	yHI8yaBY73/ZU6mlYWNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAA4H-00000006qhY-11XQ;
	Tue, 07 Apr 2026 17:18:25 +0000
Received: from mxhk.zte.com.cn ([160.30.148.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA2X1-00000006Cx1-3HPD;
	Tue, 07 Apr 2026 09:15:37 +0000
Received: from mse-fl1.zte.com.cn (unknown [10.5.228.132])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxhk.zte.com.cn (FangMail) with ESMTPS id 4fqgWz00Dnz7QYRQ;
	Tue, 07 Apr 2026 17:15:10 +0800 (CST)
Received: from szxlzmapp02.zte.com.cn ([10.5.231.79])
	by mse-fl1.zte.com.cn with SMTP id 6379Ere8070472;
	Tue, 7 Apr 2026 17:14:53 +0800 (+08)
	(envelope-from wang.yechao255@zte.com.cn)
Received: from mapi (szxlzmapp01[null])
	by mapi (Zmail) with MAPI id mid12;
	Tue, 7 Apr 2026 17:14:55 +0800 (CST)
X-Zmail-TransId: 2b0369d4cb0fb57-00521
X-Mailer: Zmail v1.0
Message-ID: <20260407171455735miXfwO3C51btdouaaGUEc@zte.com.cn>
In-Reply-To: <20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn>
References: 20260407171052241tmZDFGusMP_wlEsBVVtJo@zte.com.cn
Date: Tue, 7 Apr 2026 17:14:55 +0800 (CST)
Mime-Version: 1.0
From: <wang.yechao255@zte.com.cn>
To: <anup@brainfault.org>, <atish.patra@linux.dev>, <pjw@kernel.org>,
        <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <alex@ghiti.fr>
Cc: <kvm@vger.kernel.org>, <kvm-riscv@lists.infradead.org>,
        <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>
Subject: =?UTF-8?B?W1BBVENIIDIvM10gUklTQy1WOiBLVk06IGFkZCB0cmFjZXBvaW50cyBmb3IgZ3Vlc3QgcGFnZSBmYXVsdHM=?=
X-MAIL: mse-fl1.zte.com.cn 6379Ere8070472
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: wang.yechao255@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.132 unknown Tue, 07 Apr 2026 17:15:11 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69D4CB1E.001/4fqgWz00Dnz7QYRQ
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_021536_133988_6282ABFB 
X-CRM114-Status: UNSURE (   7.34  )
X-CRM114-Notice: Please train this message.
X-Mailman-Approved-At: Tue, 07 Apr 2026 10:18:21 -0700
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

From: Wang Yechao <wang.yechao255@zte.com.cn>

Add the kvm_page_fault event tracepoints to count the number of KVM
guest page faults.

Signed-off-by: Wang Yechao <wang.yechao255@zte.com.cn>
---
 arch/riscv/kvm/trace.h     | 25 +++++++++++++++++++++++++
 arch/riscv/kvm/vcpu_exit.c |  3 +++
 2 files changed, 28 insertions(+)

diff --git a/arch/riscv/kvm/trace.h b/arch/riscv/kvm/trace.h
index 3d54175d805c..9056cc9883cf 100644
--- a/arch/riscv/kvm/trace.h
+++ b/arch/riscv/kvm/trace.h
@@ -56,6 +56,31 @@ TRACE_EVENT(kvm_exit,
 		__entry->htinst)
 );

+/*
+ * Tracepoint for page fault.
+ */
+TRACE_EVENT(kvm_page_fault,
+	TP_PROTO(struct kvm_vcpu *vcpu, u64 fault_address, u64 error_code),
+	TP_ARGS(vcpu, fault_address, error_code),
+
+	TP_STRUCT__entry(
+		__field(unsigned int,   vcpu_id)
+		__field(u64,            fault_address)
+		__field(u64,            error_code)
+	),
+
+	TP_fast_assign(
+		__entry->vcpu_id        = vcpu->vcpu_id;
+		__entry->fault_address  = fault_address;
+		__entry->error_code     = error_code;
+	),
+
+	TP_printk("vcpu %u address 0x%016llx error_code 0x%llx",
+		__entry->vcpu_id,
+		__entry->fault_address,
+		__entry->error_code)
+);
+
 #endif /* _TRACE_RSICV_KVM_H */

 #undef TRACE_INCLUDE_PATH
diff --git a/arch/riscv/kvm/vcpu_exit.c b/arch/riscv/kvm/vcpu_exit.c
index 0bb0c51e3c89..0cfb0149da9f 100644
--- a/arch/riscv/kvm/vcpu_exit.c
+++ b/arch/riscv/kvm/vcpu_exit.c
@@ -11,6 +11,7 @@
 #include <asm/insn-def.h>
 #include <asm/kvm_mmu.h>
 #include <asm/kvm_nacl.h>
+#include "trace.h"

 static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 			     struct kvm_cpu_trap *trap)
@@ -43,6 +44,8 @@ static int gstage_page_fault(struct kvm_vcpu *vcpu, struct kvm_run *run,
 		};
 	}

+	trace_kvm_page_fault(vcpu, fault_addr, trap->scause);
+
 	ret = kvm_riscv_mmu_map(vcpu, memslot, fault_addr, hva,
 				(trap->scause == EXC_STORE_GUEST_PAGE_FAULT) ? true : false,
 				&host_map);
-- 
2.47.3

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
