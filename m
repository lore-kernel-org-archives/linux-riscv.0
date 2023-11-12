Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 838D6C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=HK0FUcKs7wnUqyrPik1SRkfLOWdjTT8HseYbBysTayM=; b=KFCQptgMwq9LJv
	LrXCHqnykqFCUl5Qk47t1ezjZ7uUyY+sH+Y6jt7XcAwnpCSEDytCMUoNaTjj7KGON1VJUqm1UXbOd
	3fab9r3qoJMDPzVM44HrH7xcaS9A091xWqz8q1Khf1Rs9ExVWldUnfjNM52utFxfL14nwtnWGO74P
	5xcBcchsFp/mRZ0vHGehXKmUSIGPQbZiAbx2Rqg7iyXrKV8BlCiipw7cwzy9dU7hvBYBOcagUPANN
	w/gCaRs9t7yFmteRjntGSI+2ILf6rQ6t/qtOklczAnxRPPYcistl6XhjPuk5yS2Q7HxiyJqHheEEg
	vrByiUTzJ2RNDiVtRmQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mI-00Bjrf-1J;
	Sun, 12 Nov 2023 06:17:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mG-00BjqD-0G
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:17:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 664A460C09;
	Sun, 12 Nov 2023 06:16:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1329EC433C7;
	Sun, 12 Nov 2023 06:16:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769819;
	bh=qenSRo414Gnjw+wPdqdNQw1NfHZPaPnw9rVg2h6yowQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GW5NoU+InHnAHzio8lhZKosW6whn3JdHi4Q/dDOScdYFN7QjZKPUKXXs98dTQuw5h
	 45fW+a6Y1YPCVIa5T3cobF6lQUZPjawcP2Rzn99jvtgGE2vyakm09BCpPlZb+f/Wpq
	 V7/4h6YGJTPwA6oP6a40o0SLfLK1XOhj0GOTCKell0jihsJuECN2NX8iPeKiTVDdC3
	 Cuu39HlcRospB1qSF0c6582N41+vi7tkSLS1EraM9vhN/CiwbKNoyOwJUVU4DgYCVt
	 boYhSj6vK3kQM6iBLcEMiNPReyKIpaZOH1WO1KMsffukC32HjUXV4rWj7RpgPeJVkF
	 64h+bIhWZynBQ==
From: guoren@kernel.org
To: arnd@arndb.de,
	guoren@kernel.org,
	palmer@rivosinc.com,
	tglx@linutronix.de,
	conor.dooley@microchip.com,
	heiko@sntech.de,
	apatel@ventanamicro.com,
	atishp@atishpatra.org,
	bjorn@kernel.org,
	paul.walmsley@sifive.com,
	anup@brainfault.org,
	jiawei@iscas.ac.cn,
	liweiwei@iscas.ac.cn,
	wefu@redhat.com,
	U2FsdGVkX1@gmail.com,
	wangjunqiang@iscas.ac.cn,
	kito.cheng@sifive.com,
	andy.chiu@sifive.com,
	vincent.chen@sifive.com,
	greentime.hu@sifive.com,
	wuwei2016@iscas.ac.cn,
	jrtc27@jrtc27.com,
	luto@kernel.org,
	fweimer@redhat.com,
	catalin.marinas@arm.com,
	hjl.tools@gmail.com
Cc: linux-arch@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Guo Ren <guoren@linux.alibaba.com>
Subject: [RFC PATCH V2 15/38] riscv: s64ilp32: Add asid support
Date: Sun, 12 Nov 2023 01:14:51 -0500
Message-Id: <20231112061514.2306187-16-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221700_210794_A325D9C9 
X-CRM114-Status: GOOD (  10.46  )
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

From: Guo Ren <guoren@linux.alibaba.com>

The s32ilp32 uses 9 bits as asid_bits because of the xlen=32
limitation of CSR. The xlen of s64ilp32 is 64 bits in width, and
the SATP CSR format is the same for Sv32, Sv39, Sv48, and Sv57. So
this patch makes asid mechanism support s64ilp32 with maximum
num_asids.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/include/asm/tlbflush.h |  2 +-
 arch/riscv/mm/context.c           | 16 ++++++++++------
 2 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index a09196f8de68..6793c3f835a0 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -12,7 +12,7 @@
 #include <asm/errata_list.h>
 
 #ifdef CONFIG_MMU
-extern unsigned long asid_mask;
+extern xlen_t asid_mask;
 
 static inline void local_flush_tlb_all(void)
 {
diff --git a/arch/riscv/mm/context.c b/arch/riscv/mm/context.c
index 12e22e7330e7..9eab9aa87dc6 100644
--- a/arch/riscv/mm/context.c
+++ b/arch/riscv/mm/context.c
@@ -20,9 +20,9 @@
 
 DEFINE_STATIC_KEY_FALSE(use_asid_allocator);
 
-static unsigned long asid_bits;
+static xlen_t asid_bits;
 static unsigned long num_asids;
-unsigned long asid_mask;
+xlen_t asid_mask;
 
 static atomic_long_t current_version;
 
@@ -227,14 +227,18 @@ static inline void set_mm(struct mm_struct *prev,
 
 static int __init asids_init(void)
 {
-	unsigned long old;
+	xlen_t old;
 
 	/* Figure-out number of ASID bits in HW */
 	old = csr_read(CSR_SATP);
 	asid_bits = old | (SATP_ASID_MASK << SATP_ASID_SHIFT);
 	csr_write(CSR_SATP, asid_bits);
 	asid_bits = (csr_read(CSR_SATP) >> SATP_ASID_SHIFT)  & SATP_ASID_MASK;
-	asid_bits = fls_long(asid_bits);
+#if __riscv_xlen == 64
+	asid_bits = fls64(asid_bits);
+#else
+	asid_bits = fls(asid_bits);
+#endif
 	csr_write(CSR_SATP, old);
 
 	/*
@@ -267,9 +271,9 @@ static int __init asids_init(void)
 		static_branch_enable(&use_asid_allocator);
 
 		pr_info("ASID allocator using %lu bits (%lu entries)\n",
-			asid_bits, num_asids);
+			(ulong)asid_bits, num_asids);
 	} else {
-		pr_info("ASID allocator disabled (%lu bits)\n", asid_bits);
+		pr_info("ASID allocator disabled (%lu bits)\n", (ulong)asid_bits);
 	}
 
 	return 0;
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
