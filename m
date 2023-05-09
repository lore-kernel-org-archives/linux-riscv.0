Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28332C7EE22
	for <linux-riscv@archiver.kernel.org>; Tue,  9 May 2023 15:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=i9sIHKBSUCt8LDob1xsGHH9CuifbzLxGGx+8YUze3wU=; b=TKvyM3p73KenRP
	6BH4iTZJxAQ1BC7ZJsTlxKOy4ZFbH1g2pFMyNhBFqdOPaiWdWrnE6b3Z3iJdp9Shm4xejpyaR8BLI
	9r11fe+vPuzW36Ua7RGf4fWUCvBWotK12ySzZSCfo4EzVxGEXQjenJ6cUwkI2w8U4vXuk5BzHQoSj
	IkIM3ogQxI78bbvjYh2dE1uu3G6GgVPDU261RsBwVLdJO2W3AHVZBCRwhpINMjc2JZtWLrJB+yeOI
	SYSQhOgA/ObMX6JPpQ6j2+Dqbe8n7993JH2UA+IgIRAiwPV48YWfPPihf93efTOyN6gRNPxtsfoCr
	l93DXFCXwSNkksQmCaEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pwP4A-003g3f-2n;
	Tue, 09 May 2023 15:15:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pwP46-003g2Y-2S
	for linux-riscv@lists.infradead.org;
	Tue, 09 May 2023 15:15:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 21E2762D95;
	Tue,  9 May 2023 15:15:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D6BDC433EF;
	Tue,  9 May 2023 15:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683645345;
	bh=ueNs2jSBg81BPlBmRMQAY6QrnRrosCgVLhmITxyBbpo=;
	h=From:To:Cc:Subject:Date:From;
	b=osh+Lrc1XkB/Jv8dmOxZXma85u4raRZFwdPVEux+HyijVxApGpdMiD/jmb+M5QF9F
	 Y3YvdKu7nC5GoJQKHc3loiJqzWpV3k5l67ceBi8iPmAIqKr8NqYOrDkOrr92hj3BkO
	 /SVDS5fQODKXcw+qCGF6CPNNSBZ2oC1reTJ7f+W6eECP6DEGqeISiLaZ3UYFCXZczy
	 HUOXeLNCdLK4RjGhjSjOq5a+NacxaQFJPKypgSre66FvGGPBQp5YDdhieshYIAvCFw
	 6t2TLE578gsbZQpDeO7Qaf5jYJAVvPFdXgLWkw97pntvfNq/USDm3bUpcNwiwPNmJV
	 tHwdFiKUOdNcQ==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: mm: stub extable related functions/macros for !MMU
Date: Tue,  9 May 2023 23:04:39 +0800
Message-Id: <20230509150439.612-1-jszhang@kernel.org>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230509_081546_838621_A3D645A9 
X-CRM114-Status: GOOD (  12.06  )
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
 arch/riscv/include/asm/asm-extable.h | 6 ++++++
 arch/riscv/include/asm/extable.h     | 4 ++++
 arch/riscv/mm/Makefile               | 3 +--
 3 files changed, 11 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/include/asm/asm-extable.h b/arch/riscv/include/asm/asm-extable.h
index 14be0673f5b5..909d6beaf499 100644
--- a/arch/riscv/include/asm/asm-extable.h
+++ b/arch/riscv/include/asm/asm-extable.h
@@ -7,6 +7,8 @@
 #define EX_TYPE_BPF			2
 #define EX_TYPE_UACCESS_ERR_ZERO	3
 
+#ifdef MMU
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
