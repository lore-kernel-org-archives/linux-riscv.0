Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBC1C76186
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Mar 2023 10:32:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=8ekYFH2adqLv2txgFLp/gUMnIIBvQ3m8GDVBNCHSyOI=; b=aJe+M3yGF2x3Ll
	ol9KtS6IvsM/ehF0UaH77UdqXYTZPrdVWgLQppga485knQlrVZSN8A8MDyvWyrUClZCS6cQRksyM+
	d43WyRL3fjkQDjHva2mu7CJ0y6UR1T8vwE/+TDOO2FvOKd4FZYMCYA6KRO5lpSqWOWkzLes9r8H8p
	421Zj7OcbgxZpC3umXSShhjhsHxLGNpLUX4CcrnIt+tnTlUS8W0FC8HF6Yybn7Yz+HOm65l2F/ScD
	+ph0GiGvADtxx0XdhwJkuPinBgm4PWYT1dBiVjsUV95JdRHBMMcIfZ1CZmHEr93RzwrFMdrleUVul
	lDa2o+i7bT1XSYpznYXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paa3A-00EBjf-MU; Fri, 10 Mar 2023 10:32:36 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paa36-00EBff-OZ
	for linux-riscv@lists.infradead.org; Fri, 10 Mar 2023 10:32:35 +0000
Received: from mail.andestech.com (ATCPCS16.andestech.com [10.0.1.222])
	by Atcsqr.andestech.com with ESMTP id 32AAVxRf040881;
	Fri, 10 Mar 2023 18:32:01 +0800 (+08)
	(envelope-from dylan@andestech.com)
Received: from atctrx.andestech.com (10.0.15.173) by ATCPCS16.andestech.com
 (10.0.1.222) with Microsoft SMTP Server id 14.3.498.0; Fri, 10 Mar 2023
 18:32:01 +0800
From: Dylan Jhong <dylan@andestech.com>
To: <linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <guoren@kernel.org>, <sergey.matyukevich@syntacore.com>,
        <aou@eecs.berkeley.edu>, <palmer@dabbelt.com>,
        <paul.walmsley@sifive.com>, <x5710999x@gmail.com>,
        <tim609@andestech.com>, <peterlin@andestech.com>,
        <ycliang@andestech.com>, Dylan Jhong <dylan@andestech.com>
Subject: [PATCH] riscv: mm: Fix incorrect ASID argument when flushing TLB
Date: Fri, 10 Mar 2023 18:31:44 +0800
Message-ID: <20230310103144.396214-1-dylan@andestech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.0.15.173]
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 32AAVxRf040881
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230310_023233_247907_B3AD1E7D 
X-CRM114-Status: UNSURE (   9.96  )
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

Currently, we pass the CONTEXTID instead of the ASID to the TLB flush
function. We should only take the ASID field to prevent from touching
the reserved bit field.

Fixes: 3f1e782998cd ("riscv: add ASID-based tlbflushing methods")
Signed-off-by: Dylan Jhong <dylan@andestech.com>
---
 arch/riscv/include/asm/tlbflush.h | 2 ++
 arch/riscv/mm/context.c           | 3 ++-
 arch/riscv/mm/tlbflush.c          | 2 +-
 3 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 907b9efd39a8..597d6d8aec28 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -12,6 +12,8 @@
 #include <asm/errata_list.h>
 
 #ifdef CONFIG_MMU
+extern unsigned long asid_mask;
+
 static inline void local_flush_tlb_all(void)
 {
 	__asm__ __volatile__ ("sfence.vma" : : : "memory");
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 80ce9caba8d2..a6b76b33e377 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -22,7 +22,8 @@ DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
 static unsigned long asid_bits;
 static unsigned long num_asids;
-static unsigned long asid_mask;
+unsigned long asid_mask;
+EXPORT_SYMBOL(asid_mask);
 
 static atomic_long_t current_version;
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index ce7dfc81bb3f..ba4c27187c95 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -27,7 +27,7 @@ static void __sbi_tlb_flush_range(struct mm_struct *mm, unsigned long start,
 	/* check if the tlbflush needs to be sent to other CPUs */
 	broadcast = cpumask_any_but(cmask, cpuid) < nr_cpu_ids;
 	if (static_branch_unlikely(&use_asid_allocator)) {
-		unsigned long asid = atomic_long_read(&mm->context.id);
+		unsigned long asid = atomic_long_read(&mm->context.id) & asid_mask;
 
 		/*
 		 * TLB will be immediately flushed on harts concurrently
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
