Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFC6FC87FCF
	for <linux-riscv@archiver.kernel.org>; Thu,  7 Aug 2025 07:08:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=kRcfSH5OQV4yY6LgFlPIgMMES5mYSyH08di86Gmwb3Y=; b=QB1CmoB3LciPqb
	B4mpNAx1hdl2Q392XQHKNL5iU+lhoQM4zmu/3Zc34XNnGSZpLZSMR8IND2VVSTlSogdFXWMFo1hf2
	3kmUgLESjWiNFa+80YhCyDCK4/fkD+t0HWbGTo97gqL5mY8jbtPhFWWMHUOX/W9f/o66pbsJFY8t8
	3DNWPzTnnb/4fp9SBeRYk6BUxg3tPosUwtLO14du0+YgmeX6bOtz25OJnZMJ8+85+Yq2I+IN4qfmW
	P4QGohEZuX+UWedU9NR380ZlmNS4CyuasuBXLLzD23/H8fadh5R6XMtVnEKR8FgHxTUoEFe43ysaX
	d517FwBIE3YwHQuURTHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujujr-0000000HQYl-1Buj;
	Thu, 07 Aug 2025 07:08:35 +0000
Received: from out30-124.freemail.mail.aliyun.com ([115.124.30.124])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujujL-0000000HQSS-0h4p;
	Thu, 07 Aug 2025 07:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1754550475; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=x1j0D5e4G22FkHtFUQZnx1eku8o9hze9aSs0LkJshCo=;
	b=T09Bqr0Q5MrzA4cUhg5CvW79hxVroD74Am2c7b2Z/MIB39/wFCxkxIn2/n8kD1iC3q9FyOXl1U64Zcq6dkb3T3TfIBtbFTLc73pqH8UXDkUoPRrBL1cT4tWLAB1OTo8KxyUr/TZa5+XYDGeYHdGwlFrw7ThQxpagM5w/7NRpWmI=
Received: from localhost.localdomain(mailfrom:fangyu.yu@linux.alibaba.com fp:SMTPD_---0WlDLLJk_1754550471 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 07 Aug 2025 15:07:53 +0800
From: fangyu.yu@linux.alibaba.com
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: guoren@linux.alibaba.com,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Fangyu Yu <fangyu.yu@linux.alibaba.com>
Subject: [PATCH] RISC-V: KVM: Using user-mode pte within kvm_riscv_gstage_ioremap
Date: Thu,  7 Aug 2025 15:07:29 +0800
Message-Id: <20250807070729.89701-1-fangyu.yu@linux.alibaba.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250807_000803_694841_055EEAFB 
X-CRM114-Status: UNSURE (   7.95  )
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

From: Fangyu Yu <fangyu.yu@linux.alibaba.com>

Currently we use kvm_riscv_gstage_ioremap to map IMSIC gpa to the spa of
guest interrupt file within IMSIC.

The PAGE_KERNEL_IO property does not include user mode settings, so when
accessing the IMSIC address in the virtual machine,  a  guest page fault
will occur, this is not expected.

According to the RISC-V Privileged Architecture Spec, for G-stage address
translation, all memory accesses are considered to be user-level accesses
as though executed in Umode.

Signed-off-by: Fangyu Yu <fangyu.yu@linux.alibaba.com>
---
 arch/riscv/kvm/mmu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kvm/mmu.c b/arch/riscv/kvm/mmu.c
index 1087ea74567b..800064e96ef6 100644
--- a/arch/riscv/kvm/mmu.c
+++ b/arch/riscv/kvm/mmu.c
@@ -351,6 +351,7 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 	int ret = 0;
 	unsigned long pfn;
 	phys_addr_t addr, end;
+	pgprot_t prot;
 	struct kvm_mmu_memory_cache pcache = {
 		.gfp_custom = (in_atomic) ? GFP_ATOMIC | __GFP_ACCOUNT : 0,
 		.gfp_zero = __GFP_ZERO,
@@ -359,8 +360,11 @@ int kvm_riscv_gstage_ioremap(struct kvm *kvm, gpa_t gpa,
 	end = (gpa + size + PAGE_SIZE - 1) & PAGE_MASK;
 	pfn = __phys_to_pfn(hpa);
 
+	prot = pgprot_noncached(PAGE_WRITE);
+
 	for (addr = gpa; addr < end; addr += PAGE_SIZE) {
-		pte = pfn_pte(pfn, PAGE_KERNEL_IO);
+		pte = pfn_pte(pfn, prot);
+		pte = pte_mkdirty(pte);
 
 		if (!writable)
 			pte = pte_wrprotect(pte);
-- 
2.39.3 (Apple Git-146)


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
