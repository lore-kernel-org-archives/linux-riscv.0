Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20380C38142
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Feb 2023 01:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hkpgpDHCZBXDLp4YYe8s0wfk5eCey/zWbbsTkHxo8Qw=; b=QGMieowQM5TRDm
	qpGORXtZhlH9/tj4QTTA6kEUjN9fR+BJuYYfFZl+PmYEKittIdNdl9mrg0Lw+HgIOmv3yaDePv7AD
	Ln4XEVhjw8aV6Fw3VFiZ4+W7YFNz17RE6xsnjdfO/UxcErJsBIGyp6vOs9uGFuviX4QdYdr3IRSxh
	qf5kFpqwZlMUSkS/krpkcmuJj1u2XBUHUMSIf5MGqrO19Rx5Qb3PBeay2fwcJ4KjGpovESgj/lcCE
	gh+wUTdo3uTkcbPi5AyuOnWehEoZmwHdtLw/OHy16n78dv7MbTQrKAGJZ5Qsp2/0EhZvwIMB6hduT
	xH7VjhvIvXhyb+25o9Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2JG-009s5t-LL; Wed, 01 Feb 2023 01:53:14 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pN2JD-009s5R-UF
	for linux-riscv@lists.infradead.org; Wed, 01 Feb 2023 01:53:13 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 7A78F609AD;
	Wed,  1 Feb 2023 01:53:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F7BBC433D2;
	Wed,  1 Feb 2023 01:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1675216389;
	bh=RpFg111OSlAsEiBZp9SuzdgJ3YXxrBaF+gupz9LpZ4I=;
	h=From:To:Cc:Subject:Date:From;
	b=Js78uiOsWwy2ggvshXrD23mqWrYpmJHeeUCWV28V1SWaHO4juUx1FBuy4DmOEimTl
	 Rkbb41y7pw7QIAlWLRpNiQaJo1mRl5m6r1crPusCh0SWK2X/56tmVDY5TjMMQMHEqU
	 KgS/eb7wO1FT7tIxffWq2K/V5hKlG5QQMcCOzg40AX+z03O5kDyogv7YSCfZ+rmv/i
	 7e3F0JdcLG7F5gG6x+DCOTwycNtFyCObLoDeKeSiD/aK9MwzwfeBb+Ciiu938DaAJM
	 lg1m546dZqbjgVBPeUqow1KCauU3/ZZUe199Xnn20q4KgS2KYlLGETJSmBwbzkxpPi
	 uVUC/xuGSTQOA==
From: guoren@kernel.org
To: tongtiangen@huawei.com,
	alexandre.ghiti@canonical.com,
	muchun.song@linux.dev,
	palmer@rivosinc.com,
	guoren@kernel.org,
	conor@kernel.org,
	ajones@ventanamicro.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guo Ren <guoren@linux.alibaba.com>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH V3] riscv: mm: hugetlb: Enable ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
Date: Tue, 31 Jan 2023 20:52:59 -0500
Message-Id: <20230201015259.3222524-1-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230131_175312_059883_BB8BA49E 
X-CRM114-Status: GOOD (  11.18  )
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

Add HVO support for RISC-V; see commit 6be24bed9da3 ("mm: hugetlb:
introduce a new config HUGETLB_PAGE_FREE_VMEMMAP"). This patch is
similar to commit 1e63ac088f20 ("arm64: mm: hugetlb: enable
HUGETLB_PAGE_FREE_VMEMMAP for arm64"), and riscv's motivation is the
same as arm64. The current riscv was ready to enable HVO after fixup,
ref commit d33deda095d3 ("riscv/mm: hugepage's PG_dcache_clean flag
is only set in head page").

See Documentation/mm/vmemmap_dedup.rst for more details.

The HugeTLB VmemmapvOptimization (HVO) defaults to off in Kconfig.

Here is the riscv test log:
cat /proc/sys/vm/hugetlb_optimize_vmemmap
echo 8 > /sys/kernel/mm/hugepages/hugepages-2048kB/nr_hugepages
mount -t hugetlbfs none test/ -o pagesize=2048k
<Try some simple hugetlb test in test dir, no problem found.>

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
Link: https://lore.kernel.org/linux-riscv/1F5AF29D-708A-483B-A29F-CAEE6F554866@linux.dev/
Acked-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
---
Changelog:
V3:
 - Optimize the commit log (Thx Andrew)
 - Optimize alphabet order (Thx Conor)
 - Add Reviewed-by tag

V2:
 - Optimize the commit log
 - Remove riscv page compound_head fixup which has been merged.
 - Rebase on riscv for-next (20230127)
 - Add HVO author's acked-by

V1:
https://lore.kernel.org/linux-riscv/20221023133205.3493564-1-guoren@kernel.org/
---
 arch/riscv/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e2b656043abf..54972e719f49 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -45,6 +45,7 @@ config RISCV
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_GENERAL_HUGETLB
+	select ARCH_WANT_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select ARCH_WANTS_THP_SWAP if HAVE_ARCH_TRANSPARENT_HUGEPAGE
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
