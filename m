Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA883CDE01A
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Nov 2025 07:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Yk+EuWje7IycN9y7ZTWV/oozcutXhRLe1gj0csEP3Ds=; b=Xmb45JF3t8JgYZ
	OLvLSSiKNOWE4TMF0wBLPjdq7xDtnMlGFpv2lIz78nwIdkWjALhD6mfhMHY6VXuzdXObqxNC6FO2V
	NVlhkAHjAWH/BSFKM2nLC5yaI8MC2Vm8VZhQKwRX84vJgfNKRhkwTU/3RTWCRcfJaVh/8hI6WtNlj
	HcQXgF8jR2goUER8lFJXJEifWmn/ZW5u2DthrKC7mKghoAPrukNNnWCNfXZcZwrLrZLNsa0Ww1IVW
	39HZoHw11OoobJZJi3qleTxwbvXR5jBy3ANBDdK+EOnXsbUlbWXSRSAyHnkBmT6qh7HIzRIlDgJdm
	3+zEisrFVhYroFy2S35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnzP-0000000BjKw-0GiY;
	Fri, 14 Nov 2025 07:12:59 +0000
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJnzL-0000000BjJp-14SB
	for linux-riscv@lists.infradead.org;
	Fri, 14 Nov 2025 07:12:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1763104369; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=YTe9/5FVy2isOVJ9yMK2C0iA7ENJeT01zWGDUBRghpU=;
	b=d1BiGYD80oX8luRm5gPEKmabyN0zG7lNo4oDN2tdniDtfUjFLqVbetDCcdL+uPic4s6eVJetfPef21GU3VSCspwNUEZ9tig8smxDN8RsxIUXC2nhM7DTK1QpiDUnq0l7v1Ehsyv+29vMbR5+t1u5pfnt0xbAgZBcpXpb82X+WKM=
Received: from DESKTOP-S9E58SO.localdomain(mailfrom:cp0613@linux.alibaba.com fp:SMTPD_---0WsMGLgd_1763104362 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 14 Nov 2025 15:12:47 +0800
From: cp0613@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	pjw@kernel.org,
	haibo1.xu@intel.com,
	guoren@kernel.org
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Chen Pei <cp0613@linux.alibaba.com>
Subject: [PATCH] tools: riscv: Fixed misalignment of CSR related definitions
Date: Fri, 14 Nov 2025 15:12:15 +0800
Message-ID: <20251114071215.816-1-cp0613@linux.alibaba.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_231256_155773_6E1A3A26 
X-CRM114-Status: UNSURE (   9.62  )
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

From: Chen Pei <cp0613@linux.alibaba.com>

The file tools/arch/riscv/include/asm/csr.h borrows from
arch/riscv/include/asm/csr.h, and subsequent modifications
related to CSR should maintain consistency.

Fixes: 16b0bde9a37c ("RISC-V: KVM: Add perf sampling support for guests")
Fixes: d1927f64e0e1 ("RISC-V: Fix the typo in Scountovf CSR name")

Signed-off-by: Chen Pei <cp0613@linux.alibaba.com>
---
 drivers/perf/riscv_pmu_sbi.c       | 2 +-
 tools/arch/riscv/include/asm/csr.h | 5 +++--
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/perf/riscv_pmu_sbi.c b/drivers/perf/riscv_pmu_sbi.c
index e255c1b069ec..7dd282da67ce 100644
--- a/drivers/perf/riscv_pmu_sbi.c
+++ b/drivers/perf/riscv_pmu_sbi.c
@@ -1109,7 +1109,7 @@ static irqreturn_t pmu_sbi_ovf_handler(int irq, void *dev)
 			/* compute hardware counter index */
 			hidx = info->csr - CSR_CYCLE;
 
-		/* check if the corresponding bit is set in sscountovf or overflow mask in shmem */
+		/* check if the corresponding bit is set in scountovf or overflow mask in shmem */
 		if (!(overflow & BIT(hidx)))
 			continue;
 
diff --git a/tools/arch/riscv/include/asm/csr.h b/tools/arch/riscv/include/asm/csr.h
index 56d7367ee344..21d8cee04638 100644
--- a/tools/arch/riscv/include/asm/csr.h
+++ b/tools/arch/riscv/include/asm/csr.h
@@ -167,7 +167,8 @@
 #define VSIP_TO_HVIP_SHIFT	(IRQ_VS_SOFT - IRQ_S_SOFT)
 #define VSIP_VALID_MASK		((_AC(1, UL) << IRQ_S_SOFT) | \
 				 (_AC(1, UL) << IRQ_S_TIMER) | \
-				 (_AC(1, UL) << IRQ_S_EXT))
+				 (_AC(1, UL) << IRQ_S_EXT) | \
+				 (_AC(1, UL) << IRQ_PMU_OVF))
 
 /* AIA CSR bits */
 #define TOPI_IID_SHIFT		16
@@ -280,7 +281,7 @@
 #define CSR_HPMCOUNTER30H	0xc9e
 #define CSR_HPMCOUNTER31H	0xc9f
 
-#define CSR_SSCOUNTOVF		0xda0
+#define CSR_SCOUNTOVF		0xda0
 
 #define CSR_SSTATUS		0x100
 #define CSR_SIE			0x104
-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
