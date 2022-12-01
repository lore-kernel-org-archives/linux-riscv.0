Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76555C43217
	for <linux-riscv@archiver.kernel.org>; Thu,  1 Dec 2022 18:33:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=oR+i01/zNp7abxXzEmmZ0Laf7XwaAHF65BRrGLFnNDk=; b=3IR4SHl+l+cFCx
	qn2G5zcfvcCQ+tCtMRmlFYxki1Horwbd1GBBxhkaNvNnBnAZgUSv2C7N5Bt3BmVrprHmsSJ14WLiQ
	Gqifmj4xZ5KNmTQvXLjjFP9X5RMgagm/pYKG4rGAwK0YXVYUsN3wnEaUjdHsAxXcpthlQBMaLsJPS
	V4PDAS7cGa4UVXWJnM+yotIafJjhMBcH+IrT0tLsTkxaVMlPzr7FOoXpq56YltB8oX649N4on71GE
	bNM6cZGNXT4LKASx6rawCMEsay3D1EaAR79yJBDA5YjNaIiGExz29hMiWq87oTt5fs5nUEbH+KXpP
	jOcWgDLbjouBcPytzH1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0oMa-009foH-MD; Thu, 01 Dec 2022 18:32:48 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0oJv-009fFQ-KK
	for linux-riscv@lists.infradead.org; Thu, 01 Dec 2022 18:30:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F125F620B3;
	Thu,  1 Dec 2022 18:30:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 587E2C433C1;
	Thu,  1 Dec 2022 18:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669919402;
	bh=C4N2EgmBg5zwEEH8jwK6R8b2bZUhinmEDukaPlfrEGI=;
	h=From:To:Cc:Subject:Date:From;
	b=qRqyJJzHe/P0L0TsR8wRjMzk2T3+7FaPg5WvRO1tG/MuG66G7OWJuF9HaAFs1GYE5
	 SBtaZrTyVojwHPhbapvWue/rK3uA1KUiko7mX5sohQbVMaccdwd6W/bjDD/Absk+vE
	 JptUZOJUQ/Q75AH8eyYtTPSx3MuU+mmZOdKeLue+DrrdbHbDq0kxTI2mxzYtBT5BCv
	 7Eu4itTFND3Kh4yIbzBbw0Pv/Q6e5P18UFOVF903Y6WORTtGPmJSYuUCYWo7YRHX5u
	 sPaZKGYvV93CeNGViG4ANgCHlFVE1Ysdss/uu+US8a41wvSvkuLutccwFt+3FzL6lG
	 fAem1jUVeMmvQ==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: Conor Dooley <conor.dooley@microchip.com>,
	linux-riscv@lists.infradead.org,
	sunnanyong@huawei.com
Subject: [PATCH] RISC-V: re-order ARCH_ENABLE_THP_MIGRATION select alphabetically
Date: Thu,  1 Dec 2022 18:29:21 +0000
Message-Id: <20221201182920.203344-1-conor@kernel.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221201_103003_769430_3D298641 
X-CRM114-Status: UNSURE (   9.91  )
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

From: Conor Dooley <conor.dooley@microchip.com>

The other selects here are done alphabetically, but this one got added
out of order. Re-order it in its expected location.

Fixes: d062a79b7c80 ("riscv/mm: Enable THP migration")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index fec54872ab45..fa5a73bcdf37 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -15,6 +15,7 @@ config RISCV
 	select ARCH_CLOCKSOURCE_INIT
 	select ARCH_ENABLE_HUGEPAGE_MIGRATION if HUGETLB_PAGE && MIGRATION
 	select ARCH_ENABLE_SPLIT_PMD_PTLOCK if PGTABLE_LEVELS > 2
+	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select ARCH_HAS_BINFMT_FLAT
 	select ARCH_HAS_CURRENT_STACK_POINTER
 	select ARCH_HAS_DEBUG_VM_PGTABLE
@@ -86,7 +87,6 @@ config RISCV
 	select HAVE_ARCH_SECCOMP_FILTER
 	select HAVE_ARCH_TRACEHOOK
 	select HAVE_ARCH_TRANSPARENT_HUGEPAGE if 64BIT && MMU
-	select ARCH_ENABLE_THP_MIGRATION if TRANSPARENT_HUGEPAGE
 	select HAVE_ARCH_THREAD_STRUCT_WHITELIST
 	select HAVE_ARCH_VMAP_STACK if MMU && 64BIT
 	select HAVE_ASM_MODVERSIONS
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
