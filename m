Return-Path: <SRS0=MZUz=YV=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_SBL,URIBL_SBL_A,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60E2DCA9EC0
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 12:11:05 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2F7D421744
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2019 12:11:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UmjqThAV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2F7D421744
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Y7eiY1XVYV0rnCDq94ttBxFsHxFRw9+7FrtSzO2p+PE=; b=UmjqThAVCHtS/P
	moVPfq/NHz/2CpvnN6m8dhtTp7Mnzp3wBjNXiozvUhDX8llEVTygSb6cGwhEVYnFKqrN8zOYLJ1KB
	c7KvfzqETl6CxyB7I2Pd2iDUX8pgedovwQ5VLwEC35DJGHPT08Z2HYn2IDsm9UdkgLWSGWSS6uJcH
	4HzGp4YryhB8q0gEzNFrOltCdsAZziMnFPfkCL1aBqc2WhdhcUcxtdTbvXxfPHRvIF1hBI0fIKaBr
	qVv7wJmGzwQ5eGzyLpcO/Jujl4OqgDLQBA4XhHz16AhT3yV7I2BZ4ncB+5JG1mur32TRpxlNwgrIT
	GJr55rFuNxhM5Idcw+Qw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iP3rT-0006vU-IJ; Mon, 28 Oct 2019 12:11:03 +0000
Received: from [2001:4bb8:18c:c7d:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iP3rP-0006kB-Ka; Mon, 28 Oct 2019 12:11:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 05/12] riscv: implement remote sfence.i using IPIs
Date: Mon, 28 Oct 2019 13:10:36 +0100
Message-Id: <20191028121043.22934-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191028121043.22934-1-hch@lst.de>
References: <20191028121043.22934-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Anup Patel <anup@brainfault.org>, Damien Le Moal <damien.lemoal@wdc.com>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

The RISC-V ISA only supports flushing the instruction cache for the
local CPU core.  Currently we always offload the remote TLB flushing to
the SBI, which then issues an IPI under the hoods.  But with M-mode
we do not have an SBI so we have to do it ourselves.   IPI to the
other nodes using the existing kernel helpers instead if we have
native clint support and thus can IPI directly from the kernel.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Anup Patel <anup@brainfault.org>
---
 arch/riscv/include/asm/sbi.h |  3 +++
 arch/riscv/mm/cacheflush.c   | 24 ++++++++++++++++++------
 2 files changed, 21 insertions(+), 6 deletions(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index b167af3e7470..0cb74eccc73f 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -94,5 +94,8 @@ static inline void sbi_remote_sfence_vma_asid(const unsigned long *hart_mask,
 {
 	SBI_CALL_4(SBI_REMOTE_SFENCE_VMA_ASID, hart_mask, start, size, asid);
 }
+#else /* CONFIG_RISCV_SBI */
+/* stub to for code is only reachable under IS_ENABLED(CONFIG_RISCV_SBI): */
+void sbi_remote_fence_i(const unsigned long *hart_mask);
 #endif /* CONFIG_RISCV_SBI */
 #endif /* _ASM_RISCV_SBI_H */
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 3f15938dec89..794c9ab256eb 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -10,9 +10,17 @@
 
 #include <asm/sbi.h>
 
+static void ipi_remote_fence_i(void *info)
+{
+	return local_flush_icache_all();
+}
+
 void flush_icache_all(void)
 {
-	sbi_remote_fence_i(NULL);
+	if (IS_ENABLED(CONFIG_RISCV_SBI))
+		sbi_remote_fence_i(NULL);
+	else
+		on_each_cpu(ipi_remote_fence_i, NULL, 1);
 }
 
 /*
@@ -28,7 +36,7 @@ void flush_icache_all(void)
 void flush_icache_mm(struct mm_struct *mm, bool local)
 {
 	unsigned int cpu;
-	cpumask_t others, hmask, *mask;
+	cpumask_t others, *mask;
 
 	preempt_disable();
 
@@ -46,10 +54,7 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 	 */
 	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
 	local |= cpumask_empty(&others);
-	if (mm != current->active_mm || !local) {
-		riscv_cpuid_to_hartid_mask(&others, &hmask);
-		sbi_remote_fence_i(hmask.bits);
-	} else {
+	if (mm == current->active_mm && local) {
 		/*
 		 * It's assumed that at least one strongly ordered operation is
 		 * performed on this hart between setting a hart's cpumask bit
@@ -59,6 +64,13 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 		 * with flush_icache_deferred().
 		 */
 		smp_mb();
+	} else if (IS_ENABLED(CONFIG_RISCV_SBI)) {
+		cpumask_t hartid_mask;
+
+		riscv_cpuid_to_hartid_mask(&others, &hartid_mask);
+		sbi_remote_fence_i(cpumask_bits(&hartid_mask));
+	} else {
+		on_each_cpu_mask(&others, ipi_remote_fence_i, NULL, 1);
 	}
 
 	preempt_enable();
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
