Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E4FAC77B7C
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 15:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=R1/ueb4opm5LQlflD2Qf6RZ3UvlT8BHqT6Fimzvya+k=; b=21xgrVk6sPC0an
	fMaxRUCb7c+TbiXADq07HflKR00+aLCQKO8yV3f70wtfq0ppeCCqJisnPFGmxvYnV4onXSvDU3iCD
	d0XK3qAMZwyktNYtp2q6IxMZ7cRaEZwNTalLk5IW7GbH23fPgAtLYO4098UvJmGAxqq8yGrP9WClr
	734M11L8ZeGdYNgYiuOCNxAnwTnrW/c+m4UWFrILKy2x7QIjJqJ8VWEDW+ytheAb09BR8d8h9Hapt
	ptGZ97plC8IH6we6xxSZQbdhqxT+tfVhCgRJhS/Qd07XxiEz5fwRPNbBrG8W5lDnI3InGnf3CSTBS
	f3EGvtcMraAS6e4vn5JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwPPT-003ioF-1z;
	Tue, 09 May 2023 15:37:51 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwPPQ-003inh-2X
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 15:37:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1B5A4628FB;
	Tue,  9 May 2023 15:37:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C824EC433D2;
	Tue,  9 May 2023 15:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683646667;
	bh=FByPzvBStNqHUfRWd9lr/eiev+34CMu90xFrzHsEDhY=;
	h=From:To:Cc:Subject:Date:From;
	b=k6KScQglaZq1S9PBBnYM4QsLoCZmvYpyWTWAla94VYTVzgMHUgFx5Lfv0SAywuSdf
	 L3tXm7rZI1jDrIoD810mafHx2ngaznzAFV/nWu5yNkwHMdO1XzY6g8HaSJRXLbXYs5
	 ivzCx0T5XyB6dMRHFtlbOWOQQmiaph1pD4BgrWIyEW9XiRFsnFzwVX1E6NtYSWphHx
	 bkQz9meyCERBguqRn4Et2XTTa+z9U1PZbiPt9jYD8z1BklyHkqNyRqgf+gMHOW/1uJ
	 bALL4wjzacJ7bGvnnqbXUMFt0D/uX3fvakwzU6MDbv2cPVVgpL0NONOn3ovHxhw1Ks
	 NUF29nSSwJz/A==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] riscv: mm: stub extable related functions/macros for !MMU
Date: Tue,  9 May 2023 23:26:41 +0800
Message-Id: <20230509152641.805-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_083748_866388_42B0774C 
X-CRM114-Status: GOOD (  12.15  )
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

extable relies on the MMU to work properly, so it's useless to
include __ex_table sections and build extable related functions for
!MMU case.

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
---

Since v1:
 - fix a typo: s/MMU/CONFIG_MMU

 arch/riscv/include/asm/asm-extable.h | 6 ++++++
 arch/riscv/include/asm/extable.h     | 4 ++++
 arch/riscv/mm/Makefile               | 3 +--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 14be0673f5b5..00a96e7a9664 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -7,6 +7,8 @@
 #define EX_TYPE_BPF			2
 #define EX_TYPE_UACCESS_ERR_ZERO	3
 
+#ifdef CONFIG_MMU
+
 #ifdef __ASSEMBLY__
 
 #define __ASM_EXTABLE_RAW(insn, fixup, type, data)	\
@@ -62,4 +64,8 @@
 
 #endif /* __ASSEMBLY__ */
 
+#else /* CONFIG_MMU */
+	#define _ASM_EXTABLE_UACCESS_ERR(insn, fixup, err)
+#endif /* CONFIG_MMU */
+
 #endif /* __ASM_ASM_EXTABLE_H */
diff --git a/arch/riscv/include/asm/extable.h b/arch/riscv/include/asm/extable.h
index 512012d193dc..3eb5c1f7bf34 100644
--- a/arch/riscv/include/asm/extable.h
+++ b/arch/riscv/include/asm/extable.h
@@ -32,7 +32,11 @@ do {							\
 	(b)->data = (tmp).data;				\
 } while (0)
 
+#ifdef CONFIG_MMU
 bool fixup_exception(struct pt_regs *regs);
+#else
+static inline bool fixup_exception(struct pt_regs *regs) { return false; }
+#endif
 
 #if defined(CONFIG_BPF_JIT) && defined(CONFIG_ARCH_RV64I)
 bool ex_handler_bpf(const struct exception_table_entry *ex, struct pt_regs *regs);
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index b85e9e82f082..9c454f90fd3d 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -13,8 +13,7 @@ endif
 KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
-obj-y += extable.o
-obj-$(CONFIG_MMU) += fault.o pageattr.o
+obj-$(CONFIG_MMU) += extable.o fault.o pageattr.o
 obj-y += cacheflush.o
 obj-y += context.o
 obj-y += pgtable.o
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
