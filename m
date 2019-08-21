Return-Path: <SRS0=RYOb=WR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9348CC3A59E
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:58:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6444D22DD3
	for <infradead-linux-riscv@archiver.kernel.org>; Wed, 21 Aug 2019 14:58:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="NMJ0LrRt"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6444D22DD3
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=g5PoOAvp/bwRWPZbsNkUQ8MXm02rVeUONgX7yMx0iD0=; b=NMJ0LrRtHM8gJR
	vWuDK6pd1HGqu3YhQ5MDes3tZx2Qh6N1CzdES5xqFmtU5oLcbQGeeRawyxe5n9jXHzAtWyUoA1aEn
	Z6HIfk5ajTXISPojLjHVD2n3A231D3AFqSslyqyJqXphmQoAEtwl7zWm0IkF7uoyNdUM90kUgiBr0
	HURXZqEsOzoCKbvYp74n+yduD5Y8iGFoLafvHJxL6UMR6d8JLpgWhHK/tAgAH6mY4W4XsK777C9Vf
	c76rh3gaBmmk5eb5IQTOKrTeZlG3i6jeOc6JlM9zIOlEAGhLjOQNTMG3dSrBsPNN5B+Omsi9SeHtW
	YO1bFtlHTLpNmq5qN9nw==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1i0S4X-0006Df-E5; Wed, 21 Aug 2019 14:58:49 +0000
Received: from [182.171.81.139] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1i0S4T-00067m-SV; Wed, 21 Aug 2019 14:58:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>,
 Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH 4/6] riscv: cleanup riscv_cpuid_to_hartid_mask
Date: Wed, 21 Aug 2019 23:58:35 +0900
Message-Id: <20190821145837.3686-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190821145837.3686-1-hch@lst.de>
References: <20190821145837.3686-1-hch@lst.de>
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
Cc: Atish Patra <Atish.Patra@wdc.com>, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Move the initial clearing of the mask from the callers to
riscv_cpuid_to_hartid_mask, and remove the unused !CONFIG_SMP stub.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/include/asm/smp.h      | 6 ------
 arch/riscv/include/asm/tlbflush.h | 1 -
 arch/riscv/kernel/smp.c           | 1 +
 arch/riscv/mm/cacheflush.c        | 1 -
 4 files changed, 1 insertion(+), 8 deletions(-)

diff --git a/arch/riscv/include/asm/smp.h b/arch/riscv/include/asm/smp.h
index c6ed4d691def..a83451d73a4e 100644
--- a/arch/riscv/include/asm/smp.h
+++ b/arch/riscv/include/asm/smp.h
@@ -61,11 +61,5 @@ static inline unsigned long cpuid_to_hartid_map(int cpu)
 	return boot_cpu_hartid;
 }
 
-static inline void riscv_cpuid_to_hartid_mask(const struct cpumask *in,
-					      struct cpumask *out)
-{
-	cpumask_set_cpu(cpuid_to_hartid_map(0), out);
-}
-
 #endif /* CONFIG_SMP */
 #endif /* _ASM_RISCV_SMP_H */
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 4d9bbe8438bf..df31fe2ed09c 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -47,7 +47,6 @@ static inline void remote_sfence_vma(struct cpumask *cmask, unsigned long start,
 {
 	struct cpumask hmask;
 
-	cpumask_clear(&hmask);
 	riscv_cpuid_to_hartid_mask(cmask, &hmask);
 	sbi_remote_sfence_vma(hmask.bits, start, size);
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index a3715d621f60..3836760d7aaf 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -56,6 +56,7 @@ void riscv_cpuid_to_hartid_mask(const struct cpumask *in, struct cpumask *out)
 {
 	int cpu;
 
+	cpumask_clear(out);
 	for_each_cpu(cpu, in)
 		cpumask_set_cpu(cpuid_to_hartid_map(cpu), out);
 }
diff --git a/arch/riscv/mm/cacheflush.c b/arch/riscv/mm/cacheflush.c
index 9ebcff8ba263..3f15938dec89 100644
--- a/arch/riscv/mm/cacheflush.c
+++ b/arch/riscv/mm/cacheflush.c
@@ -47,7 +47,6 @@ void flush_icache_mm(struct mm_struct *mm, bool local)
 	cpumask_andnot(&others, mm_cpumask(mm), cpumask_of(cpu));
 	local |= cpumask_empty(&others);
 	if (mm != current->active_mm || !local) {
-		cpumask_clear(&hmask);
 		riscv_cpuid_to_hartid_mask(&others, &hmask);
 		sbi_remote_fence_i(hmask.bits);
 	} else {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
