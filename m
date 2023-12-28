Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 116B5C47073
	for <linux-riscv@archiver.kernel.org>; Thu, 28 Dec 2023 08:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nkWHvuWK7gmyDVa6w6kfepYbX8XQzh7sHJ/DlQqq++E=; b=Xr2z/+XbcumxoW
	qFdcLi91Nn/LUjAve47weZFwjnjzKPU/sd7jb4NVNsD16PWY/UylNstzlRbsjVGlO6pQCH5lt5D3K
	qbTsz8P26JkgohdlHvw08toa4UIkLSlYojPT3lqb8m0zCzhkGojahwet1pmP5lVWDSY6WMQcAZ7LY
	WU8fVC88f2QpMrRV5pi8Lq/uxQkAhKlFORf9OPg/Iy1UVF93tk9/s7y0A7Mc1ZOWbo6oROqoEJz6k
	F6743XxzH0tG5Irp2z7dmIbA6m+e2AoY9ebIRf1vRvQvs3SwUUB/g2/4hOXzDAmnatp5ODDjDGVov
	oVjsXNGoT52+9nxU8NMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rImF3-00GRoV-2Q;
	Thu, 28 Dec 2023 08:59:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rImEo-00GReX-1L;
	Thu, 28 Dec 2023 08:59:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4F39E60FE6;
	Thu, 28 Dec 2023 08:59:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5389DC433CC;
	Thu, 28 Dec 2023 08:59:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703753970;
	bh=4x9t1f04s06EEvjvtQ7yC2/ljPKJqNDBrcj2L/hT3Js=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TKBsmvO8700bopUsWROGXLmoCWFXsTW+dDVnNGSxOkaL/USi53RKl8TdsixW0+meq
	 ZCWxQdbp33ikg/G9ezCtq7NkctrZnj90/OzQ0n9iUxG+YKDW4DQ0nPcXFY42wiBv+r
	 997dRhgKccetlwPkyjqAZY+f5mx70kEYFtXj+CoiB8mr5EJbZvQA7ejpm/TS62Kx8Z
	 MVCzbTzHlBLytfAxGrORGDpTnrYATlbt8PPwaCWGIg2WfXt/VlliMYXrTExd8VnHSR
	 LxHkWdaNYJGBiXawHPjLTvQ6a2cSRLkXc9Y/wtpnv3MN3QHCLVBpveSUN4P0ShLMkB
	 BBgaja1UR4WBA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Will Deacon <will@kernel.org>,
	"Aneesh Kumar K . V" <aneesh.kumar@linux.ibm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nick Piggin <npiggin@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-arch@vger.kernel.org,
	linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 2/2] riscv: tlb: avoid tlb flushing if fullmm == 1
Date: Thu, 28 Dec 2023 16:46:42 +0800
Message-Id: <20231228084642.1765-3-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20231228084642.1765-1-jszhang@kernel.org>
References: <20231228084642.1765-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231228_005934_496904_27528E06 
X-CRM114-Status: GOOD (  10.80  )
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

The mmu_gather code sets fullmm=1 when tearing down the entire address
space for an mm_struct on exit or execve. So if the underlying platform
supports ASID, the tlb flushing can be avoided because the ASID
allocator will never re-allocate a dirty ASID.

Use the performance of Process creation in unixbench on T-HEAD TH1520
platform is improved by about 4%.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---
 arch/riscv/include/asm/tlb.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/riscv/include/asm/tlb.h b/arch/riscv/include/asm/tlb.h
index 1eb5682b2af6..35f3c214332e 100644
--- a/arch/riscv/include/asm/tlb.h
+++ b/arch/riscv/include/asm/tlb.h
@@ -12,10 +12,19 @@ static void tlb_flush(struct mmu_gather *tlb);
 
 #define tlb_flush tlb_flush
 #include <asm-generic/tlb.h>
+#include <asm/mmu_context.h>
 
 static inline void tlb_flush(struct mmu_gather *tlb)
 {
 #ifdef CONFIG_MMU
+	/*
+	 * If ASID is supported, the ASID allocator will either invalidate the
+	 * ASID or mark it as used. So we can avoid TLB invalidation when
+	 * pulling down a full mm.
+	 */
+	if (static_branch_likely(&use_asid_allocator) && tlb->fullmm)
+		return;
+
 	if (tlb->fullmm || tlb->need_flush_all)
 		flush_tlb_mm(tlb->mm);
 	else
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
