Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95F89C677F1
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Jan 2023 16:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Ib0VBHZ45hmNgqbqJlO6T6TpGS/kqZrd9O09R97vWuA=; b=Fg6b4VTk8fzunU
	GetJxftWdnAcJk78QkCzrZUMOCl/IMAPl8O+ukXH6ANvECTYBvmvJ1ef8u7tBTdCq9wVaSQM3pu+1
	+UKLjbra85xY28T9GLcAC+x+7cvwMg9dc0OgI73VDweE9P4tPpw7/xY6sb3s+Y+1LvIRRlMCbPPwx
	8Q72Dzjwk1zzEnopTWAU0TylV4mPhpappkGRvKP3QTY1Gvx2ccWm7W7G6hs3TwrWdEzeAydz0Ovck
	qH0SXs0FNS5WqZzwwUKbtg6FPFS5plIHL+jDxP0IhKnDVBT4QFCN+/Sv/KCHtzcBEy4ql/iaJlyJS
	oeMWhvOoLxo+dPCLSaeQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qx-007bpQ-67; Sun, 15 Jan 2023 16:00:35 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pH5Qn-007bkm-Ew; Sun, 15 Jan 2023 16:00:27 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id F111F60D42;
	Sun, 15 Jan 2023 16:00:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1EE3C433F1;
	Sun, 15 Jan 2023 16:00:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1673798424;
	bh=MBqOT6Dn2xWnMUPTimSWb1S2FBQlANOrjBTxRpgF3Ec=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uMU+GHWCSYdVhoI7WVAMFlQhU+NeBibCeUvYzk/5xPRBFNdVnSTXTq5nmvqmd9zfH
	 jgceZoufvIXcLgPp8P+BoOfDjoFaFQIcIyIuI3a+Afi2oLYMm0DcoJpdPhBbxGOhO6
	 ZSYa/0a+MqDRktdr+zNZbWkoZuM7Era1qguDFp+dzGnS4tnez1C2O28nUJSCbUAuD4
	 D4E40d5fJ1bx+NmHtqHpK9AOusV/70vPmEebxSEPOILwR5eJuJ7SBrIq1w1pw/36MI
	 53iXIS9qQATCgdrnhuqJqQxngloJ22yEK5AxOfLek12SoRfoYaCPnX0apV38RcyuvQ
	 lyLMrd5kjGPRA==
From: Jisheng Zhang <jszhang@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org
Subject: [PATCH v4 04/13] riscv: hwcap: make ISA extension ids can be used in asm
Date: Sun, 15 Jan 2023 23:49:44 +0800
Message-Id: <20230115154953.831-5-jszhang@kernel.org>
X-Mailer: git-send-email 2.38.1
In-Reply-To: <20230115154953.831-1-jszhang@kernel.org>
References: <20230115154953.831-1-jszhang@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230115_080025_957432_32EDF906 
X-CRM114-Status: GOOD (  13.76  )
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

So that ISA extensions can be used in assembly files, convert the
multi-letter RISC-V ISA extension IDs enums to macros.
In order to make them visible, move the #ifndef __ASSEMBLY__ guard
to a later point in the header

Signed-off-by: Jisheng Zhang <jszhang@kernel.org>
Reviewed-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h | 45 ++++++++++++++++------------------
 1 file changed, 21 insertions(+), 24 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 86328e3acb02..09a7767723f6 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -12,20 +12,6 @@
 #include <linux/bits.h>
 #include <uapi/asm/hwcap.h>
 
-#ifndef __ASSEMBLY__
-#include <linux/jump_label.h>
-/*
- * This yields a mask that user programs can use to figure out what
- * instruction set this cpu supports.
- */
-#define ELF_HWCAP		(elf_hwcap)
-
-enum {
-	CAP_HWCAP = 1,
-};
-
-extern unsigned long elf_hwcap;
-
 #define RISCV_ISA_EXT_a		('a' - 'a')
 #define RISCV_ISA_EXT_c		('c' - 'a')
 #define RISCV_ISA_EXT_d		('d' - 'a')
@@ -46,22 +32,33 @@ extern unsigned long elf_hwcap;
 #define RISCV_ISA_EXT_BASE 26
 
 /*
- * This enum represent the logical ID for each multi-letter RISC-V ISA extension.
+ * These macros represent the logical ID for each multi-letter RISC-V ISA extension.
  * The logical ID should start from RISCV_ISA_EXT_BASE and must not exceed
  * RISCV_ISA_EXT_MAX. 0-25 range is reserved for single letter
  * extensions while all the multi-letter extensions should define the next
  * available logical extension id.
  */
-enum riscv_isa_ext_id {
-	RISCV_ISA_EXT_SSCOFPMF = RISCV_ISA_EXT_BASE,
-	RISCV_ISA_EXT_SVPBMT,
-	RISCV_ISA_EXT_ZICBOM,
-	RISCV_ISA_EXT_ZIHINTPAUSE,
-	RISCV_ISA_EXT_SSTC,
-	RISCV_ISA_EXT_SVINVAL,
-	RISCV_ISA_EXT_ID_MAX
+#define RISCV_ISA_EXT_SSCOFPMF		26
+#define RISCV_ISA_EXT_SVPBMT		27
+#define RISCV_ISA_EXT_ZICBOM		28
+#define RISCV_ISA_EXT_ZIHINTPAUSE	29
+#define RISCV_ISA_EXT_SSTC		30
+#define RISCV_ISA_EXT_SVINVAL		31
+
+#ifndef __ASSEMBLY__
+#include <linux/jump_label.h>
+/*
+ * This yields a mask that user programs can use to figure out what
+ * instruction set this cpu supports.
+ */
+#define ELF_HWCAP		(elf_hwcap)
+
+enum {
+	CAP_HWCAP = 1,
 };
-static_assert(RISCV_ISA_EXT_ID_MAX <= RISCV_ISA_EXT_MAX);
+
+extern unsigned long elf_hwcap;
+
 
 /*
  * This enum represents the logical ID for each RISC-V ISA extension static
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
