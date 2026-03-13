Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA411106FD6B
	for <linux-riscv@archiver.kernel.org>; Fri, 13 Mar 2026 02:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Mime-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+a+vgQ5MMgQkd1rYgbbfG+HNaK9Mu3SA5kJR0p8gcNY=; b=qpWxc+ow2qoYig
	ZfINdF/397lCvIVpK+FQdAbGgJHA5e7vJ1TqxbnfG87XtoHX1qj2vajhmWNexvc09SWd295mHYaKL
	Qxueuq5pHHgu/c0iSkE/7VaqW8MG0lIrs9T4RQp74bcfQ6XHAXTFZ+uhKdbRPco7pnfYa2uNrRSmD
	CnSJvnW0eqExoBXu1DSljkqfCnhC0KwNJnfu4kDhSOPugqVJPmmDWtx1EVM763GXM6KLLBYeiQ4hu
	OYzqocKvyF6A7Inm9S6JGluPQKDK6Dgaij4CkmXC4cJA/jAhcdHMuBVlmONj79IgEAI5LS5Nb2ES+
	TdX6uptvQ5mKdjGYFJEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0shb-0000000GJSp-1HuK;
	Fri, 13 Mar 2026 02:56:39 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0shY-0000000GJRJ-079w
	for linux-riscv@lists.infradead.org;
	Fri, 13 Mar 2026 02:56:37 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4fX8JT0kRJz51Sjp;
	Fri, 13 Mar 2026 10:56:25 +0800 (CST)
Received: from xaxapp04.zte.com.cn ([10.99.98.157])
	by mse-fl2.zte.com.cn with SMTP id 62D2uFU2087779;
	Fri, 13 Mar 2026 10:56:15 +0800 (+08)
	(envelope-from hu.shengming@zte.com.cn)
Received: from mapi (xaxapp01[null])
	by mapi (Zmail) with MAPI id mid32;
	Fri, 13 Mar 2026 10:56:16 +0800 (CST)
X-Zmail-TransId: 2af969b37cd0ec5-ee738
X-Mailer: Zmail v1.0
Message-ID: <20260313105616335IVh7tn1pSkAHNnfckGCQ-@zte.com.cn>
Date: Fri, 13 Mar 2026 10:56:16 +0800 (CST)
Mime-Version: 1.0
From: <hu.shengming@zte.com.cn>
To: <pjw@kernel.org>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>
Cc: <alex@ghiti.fr>, <linux-kernel@vger.kernel.org>,
        <linux-riscv@lists.infradead.org>, <zhang.run@zte.com.cn>,
        <yang.tao172@zte.com.cn>, <yang.yang29@zte.com.cn>
Subject: =?UTF-8?B?W1BBVENIXSByaXNjdjogbW06IFZlcmlmeSBwZXItaGFydCBBU0lEIGJpdHMgd2hlbiB1c2luZyBBU0lEIGFsbG9jYXRvcg==?=
X-MAIL: mse-fl2.zte.com.cn 62D2uFU2087779
X-TLS: YES
X-SPF-DOMAIN: zte.com.cn
X-ENVELOPE-SENDER: hu.shengming@zte.com.cn
X-SPF: None
X-SOURCE-IP: 10.5.228.133 unknown Fri, 13 Mar 2026 10:56:25 +0800
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 69B37CD9.000/4fX8JT0kRJz51Sjp
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_195636_248336_7583B470 
X-CRM114-Status: GOOD (  14.11  )
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

From: Shengming Hu <hu.shengming@zte.com.cn>

RISC-V probes the number of implemented ASID bits in SATP on the boot
hart and enables the ASID allocator based on that result. However, the
privileged spec allows harts to implement fewer ASID bits by hardwiring
the upper bits to zero.

If a secondary hart implements fewer ASID bits than the boot hart while
the ASID allocator is enabled, different Linux ASIDs may alias on that
hart. This can allow stale TLB entries to survive and potentially
corrupt memory.

Verify the number of implemented ASID bits on each CPU as it comes
online, and refuse to online CPUs that support fewer ASID bits than
the boot CPU.

Signed-off-by: Shengming Hu <hu.shengming@zte.com.cn>
---
 arch/riscv/include/asm/mmu_context.h |  2 ++
 arch/riscv/kernel/smpboot.c          |  3 ++
 arch/riscv/mm/context.c              | 42 ++++++++++++++++++++++++----
 3 files changed, 41 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/mmu_context.h b/arch/riscv/include/asm/mmu_context.h
index dbf27a78df6c..0cca20b7dbe1 100644
--- a/arch/riscv/include/asm/mmu_context.h
+++ b/arch/riscv/include/asm/mmu_context.h
@@ -16,6 +16,8 @@
 void switch_mm(struct mm_struct *prev, struct mm_struct *next,
 	struct task_struct *task);

+int verify_cpu_asid_bits(void);
+
 #define activate_mm activate_mm
 static inline void activate_mm(struct mm_struct *prev,
 			       struct mm_struct *next)
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 8b628580fe11..9774a591c1a5 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -230,6 +230,9 @@ asmlinkage __visible void smp_callin(void)
 			return;
 	}

+	if (verify_cpu_asid_bits())
+		return;
+
 	/* All kernel threads share the same mm context.  */
 	mmgrab(mm);
 	current->active_mm = mm;
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 55c20ad1f744..2a830f021ce5 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -22,6 +22,7 @@
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);

 static unsigned long num_asids;
+static unsigned long asid_bits;

 static atomic_long_t current_version;

@@ -224,16 +225,16 @@ static inline void set_mm(struct mm_struct *prev,
 	}
 }

-static int __init asids_init(void)
+static unsigned long get_cpu_asid_bits(void)
 {
-	unsigned long asid_bits, old;
+	unsigned long asid_bit_count, old;

 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
-	asid_bits = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
-	csr_write(CSR_SATP, asid_bits);
-	asid_bits = (csr_read(CSR_SATP) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
-	asid_bits = fls_long(asid_bits);
+	asid_bit_count = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
+	csr_write(CSR_SATP, asid_bit_count);
+	asid_bit_count = (csr_read(CSR_SATP) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
+	asid_bit_count = fls_long(asid_bit_count);
 	csr_write(CSR_SATP, old);

 	/*
@@ -242,6 +243,30 @@ static int __init asids_init(void)
 	 * to remove unwanted TLB enteries.
 	 */
 	local_flush_tlb_all();
+	return asid_bit_count;
+}
+
+int verify_cpu_asid_bits(void)
+{
+	unsigned long cpu_asid_bits = get_cpu_asid_bits();
+
+	if (cpu_asid_bits < asid_bits) {
+		/*
+		 * The ASID allocator is initialized using the boot CPU's ASID width.
+		 * We cannot safely shrink the system-wide ASID space at runtime, so
+		 * reject secondary CPU bringup if it supports fewer ASID bits than
+		 * the boot CPU.
+		 */
+		pr_crit("CPU%d: ASID bits (%lu) smaller than boot CPU (%lu), refusing to online\n",
+			smp_processor_id(), cpu_asid_bits, asid_bits);
+		return -EINVAL;
+	}
+	return 0;
+}
+
+static int __init asids_init(void)
+{
+	asid_bits = get_cpu_asid_bits();

 	/* Pre-compute ASID details */
 	if (asid_bits) {
@@ -279,6 +304,11 @@ static inline void set_mm(struct mm_struct *prev,
 {
 	/* Nothing to do here when there is no MMU */
 }
+
+int verify_cpu_asid_bits(void)
+{
+	return 0;
+}
 #endif

 /*
-- 
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
