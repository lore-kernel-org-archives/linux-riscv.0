Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF247C4332F
	for <linux-riscv@archiver.kernel.org>; Sun, 12 Nov 2023 06:17:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0lLwKLdVgzhcanyU1d+ql7y6beUhWSHymRzkQch1uYg=; b=nZBQa4rCJDmDbr
	6fGVenqXXLZOIvTdgofWhMC3ptAZanaCkfqsUAl8I1KHNvdykpnOlSS4K0Z7t8AT/0Eng1j8nOEJ5
	eAJj3Le+UFbb+7ZiG0ZjNrx78qLGGgvcJDjqtfNkhJQt3cyWhbtpt8TQBeqGgczCveC84gCOe0E7v
	BxHQuC0NXmYptQ/O5NMdN89xpKEPk279+2Mn+jsRE9ro8W0ReLaIfZkL6yuafkRB1dzP2GqiF7eZY
	RDe/x+pVs7AIfSpMfW0RYznYUpMpe9sRWmf8yZboTy/x0NcRw9jCYOIPQFMQehEf6kN+y82VY61bB
	nsDi9FZ7BtRAzyq5qYeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mv-00BkHo-1a;
	Sun, 12 Nov 2023 06:17:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r23mq-00BkE2-0t
	for linux-riscv@lists.infradead.org;
	Sun, 12 Nov 2023 06:17:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A202160B80;
	Sun, 12 Nov 2023 06:17:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F47BC433CC;
	Sun, 12 Nov 2023 06:17:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1699769855;
	bh=McvUmbn7ofR9ECIK1HzZvYjfVLwR/ntK8/66isIijtM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cVixWE5BU3e4YiwTPApmxFvfwcQjyW4BCr6TG50g4zBwUphGarDaFwV04CbuzkNp8
	 fcJ0yF57pqfwrYk17nBniNgJxa5HEYSLCYceCYpVlwmBs9t+j9Spx8D1/+UCxRCwZH
	 WXJIGTd4x825tMD5ZBzWbl9DBr7XQEX7SIzW63zoNx0sU9rdFqMSxR2HmlOONiJA/E
	 bFNhgrFJTCHEhWW1sLsfWksh5LGNylmxHUEhA94B/fhLu6Z516D55+XjtOpZ1t0rru
	 EEqGkJ+xcrIaxrsLSz4Q6jxSDw6D/R6mP+p/Ftn3C/cHP9pQd8XP9GFq1R/+IeC50b
	 gWTZeAfPCLuhw==
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
Subject: [RFC PATCH V2 21/38] riscv: s64ilp32: Add MMU_SV32 mode support
Date: Sun, 12 Nov 2023 01:14:57 -0500
Message-Id: <20231112061514.2306187-22-guoren@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20231112061514.2306187-1-guoren@kernel.org>
References: <20231112061514.2306187-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231111_221736_404072_814C675F 
X-CRM114-Status: GOOD (  10.35  )
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

This needs to add Sv32 mode in the SATP CSR of RV64 ISA, a novel
extension of 64-bit processors' MMU. It could save a bit of page
table footprint and improve the page table walk performance:

s64ilp32 with Sv39:
PageTables:          136 kB

s64ilp32 with Sv32:
PageTables:           60 kB

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@kernel.org>
---
 arch/riscv/Kconfig           | 11 ++++++++++-
 arch/riscv/Kconfig.errata    |  2 +-
 arch/riscv/include/asm/csr.h |  1 +
 3 files changed, 12 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5a3eb5e7d67a..1d3a236d2c45 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -481,7 +481,7 @@ config RISCV_ISA_SVNAPOT
 
 config RISCV_ISA_SVPBMT
 	bool "Svpbmt extension support for supervisor mode page-based memory types"
-	depends on 64BIT && MMU
+	depends on !MMU_SV32 && MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
@@ -638,6 +638,15 @@ config THREAD_SIZE_ORDER
 	  Specify the Pages of thread stack size (from 4KB to 64KB), which also
 	  affects irq stack size, which is equal to thread stack size.
 
+config MMU_SV32
+	bool "MMU Sv32"
+	depends on 32BIT && MMU
+	help
+	  ARCH_RV32I only supports MMU Sv32 mode, but ARCH_RV64ILP32 supports
+	  MMU Sv39 & Sv32 (MMU Sv32 is optional for RV64 hardware).
+
+	  If unsure, say N.
+
 endmenu # "Platform type"
 
 menu "Kernel features"
diff --git a/arch/riscv/Kconfig.errata b/arch/riscv/Kconfig.errata
index 0c8f4652cd82..1aa85a427ff3 100644
--- a/arch/riscv/Kconfig.errata
+++ b/arch/riscv/Kconfig.errata
@@ -44,7 +44,7 @@ config ERRATA_THEAD
 
 config ERRATA_THEAD_PBMT
 	bool "Apply T-Head memory type errata"
-	depends on ERRATA_THEAD && 64BIT && MMU
+	depends on ERRATA_THEAD && !MMU_SV32 && MMU
 	select RISCV_ALTERNATIVE_EARLY
 	default y
 	help
diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 03acdedc100d..aa78c5f20d75 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -65,6 +65,7 @@
 #define SATP_ASID_MASK	_AC(0x1FF, UXL)
 #else
 #define SATP_PPN	_AC(0x00000FFFFFFFFFFF, UXL)
+#define SATP_MODE_32	_AC(0x1000000000000000, UXL)
 #define SATP_MODE_39	_AC(0x8000000000000000, UXL)
 #define SATP_MODE_48	_AC(0x9000000000000000, UXL)
 #define SATP_MODE_57	_AC(0xa000000000000000, UXL)
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
