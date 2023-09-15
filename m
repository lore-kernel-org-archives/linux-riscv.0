Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F3BEED615
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Sep 2023 15:41:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=XXIk6sg2yRatvW4aA9p8s5gJ1rQwEEvjI8OJA9b/23c=; b=ElcWQwTXsORDGW
	+39F7WKnKIDSnNDhG7FL/LJUxmK3jPi2tAathFGj17uyikQ+WAVV/C8i4em0iKOl3dglOYmbbD3xR
	TsRbHmc+kPtbJKPW3Y1J6Elkm+35yOwV0Et/kYhvNHeoAJpLw/OvOuVKOo4CgnEmOaiFh3ywgMunl
	OmznZKmCMRIayO3STsyKD0/8qMz2jW1yyQ/KqBugvBwzAH6zkAjSeaq6c/miJRxurrqpqxXXY1VIY
	iPHNLEDCG8Xsz8Pq9HYbISiSgPgoB5AtWOWaSMW+uN5I/StKrhe9QV0G5V/14DjR0XZtxd7qKi+TC
	4IFbL8XSWXDq4cTPCiug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAwM-00B09r-1W;
	Fri, 15 Sep 2023 15:41:06 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qhAwJ-00B08f-0z
	for linux-riscv@lists.infradead.org;
	Fri, 15 Sep 2023 15:41:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 7C24BB82CCA;
	Fri, 15 Sep 2023 15:41:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 97B4BC433C9;
	Fri, 15 Sep 2023 15:40:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1694792460;
	bh=iL9L+rpu1zailC0C2sm70CwBTmUTnWVBYoMdQeDKmYk=;
	h=From:To:Cc:Subject:Date:From;
	b=eWzO9304qMGiD2JSMSQm+gb1qrcROYCbXYXaGuaZZOMz0lg0BpUWTNZwNHDmWxrQE
	 6igKujTzZOURybEX6SJMev0ckdVKzOV9ffw1TSpCFsMKhvE6dQzaXo6bXttkAp1ySm
	 t/KagjhDi4x9lSFWz4FV1OkPeRJn/Y8lvvjYQ/ACKr7cDU6MBNjWACi97qonH+dkx+
	 aFnQ16lU0aljcY3g7CUOt1/OxNVXQdMCGe61+/1Pp94R9NNj4LUHmy9iodzf2cNg+1
	 KW6xAlvdx7VtAZlP/M7gV/dhYIq7j/Teoj8punBl0319LxGJ+Ste5/DQNcweoXGejq
	 qzJy9uNfFMJiA==
From: Conor Dooley <conor@kernel.org>
To: palmer@dabbelt.com
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Andrew Jones <ajones@ventanamicro.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] RISC-V: capitalise CMO op macros
Date: Fri, 15 Sep 2023 16:40:44 +0100
Message-Id: <20230915-aloe-dollar-994937477776@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6534; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=rLIBZ4+2A78wCLG1T1Ao6mgwwBE0KCKr60GcfeYR7ck=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKksVT8vF+g/uOz2JVZzWZ2q1YVf/reDPxwNevXrU061d /b56VrSHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZjIJgGGvwInuTpzT5+7vmTa qjT5luI1NiFn9mtJCsflLlnMF9C3qpGRYeJMm55d2oYRiozTZ56YuF5WKt1eInSZU2dT0K7zJZI CHAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230915_084103_667847_F9C8FF87 
X-CRM114-Status: GOOD (  12.72  )
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

The CMO op macros initially used lower case, as the original iteration
of the ALT_CMO_OP alternative stringified the first parameter to
finalise the assembly for the standard variant.
As a knock-on, the T-Head versions of these CMOs had to use mixed case
defines. Commit dd23e9535889 ("RISC-V: replace cbom instructions with
an insn-def") removed the asm construction with stringify, replacing it
an insn-def macro, rending the lower-case surplus to requirements.
As far as I can tell from a brief check, CBO_zero does not see similar
use and didn't require the mixed case define in the first place.
Replace the lower case characters now for consistency with other
insn-def macros in the standard and T-Head forms, and adjust the
callsites.

Suggested-by: Andrew Jones <ajones@ventanamicro.com>
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Paul Walmsley <paul.walmsley@sifive.com>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: linux-riscv@lists.infradead.org
CC: linux-kernel@vger.kernel.org
---
 arch/riscv/include/asm/errata_list.h |  6 +++---
 arch/riscv/include/asm/insn-def.h    |  8 +++----
 arch/riscv/lib/clear_page.S          | 32 ++++++++++++++--------------
 arch/riscv/mm/dma-noncoherent.c      |  8 +++----
 arch/riscv/mm/pmem.c                 |  4 ++--
 5 files changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/riscv/include/asm/errata_list.h b/arch/riscv/include/asm/errata_list.h
index e2ecd01bfac7..5801af83d154 100644
--- a/arch/riscv/include/asm/errata_list.h
+++ b/arch/riscv/include/asm/errata_list.h
@@ -117,9 +117,9 @@ asm volatile(ALTERNATIVE(						\
  * | 31 - 25 | 24 - 20 | 19 - 15 | 14 - 12 | 11 - 7 | 6 - 0 |
  *   0000000    11001     00000      000      00000  0001011
  */
-#define THEAD_inval_A0	".long 0x0265000b"
-#define THEAD_clean_A0	".long 0x0245000b"
-#define THEAD_flush_A0	".long 0x0275000b"
+#define THEAD_INVAL_A0	".long 0x0265000b"
+#define THEAD_CLEAN_A0	".long 0x0245000b"
+#define THEAD_FLUSH_A0	".long 0x0275000b"
 #define THEAD_SYNC_S	".long 0x0190000b"
 
 #define ALT_CMO_OP(_op, _start, _size, _cachesize)			\
diff --git a/arch/riscv/include/asm/insn-def.h b/arch/riscv/include/asm/insn-def.h
index 6960beb75f32..e27179b26086 100644
--- a/arch/riscv/include/asm/insn-def.h
+++ b/arch/riscv/include/asm/insn-def.h
@@ -180,19 +180,19 @@
 	INSN_R(OPCODE_SYSTEM, FUNC3(0), FUNC7(51),		\
 	       __RD(0), RS1(gaddr), RS2(vmid))
 
-#define CBO_inval(base)						\
+#define CBO_INVAL(base)						\
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(0))
 
-#define CBO_clean(base)						\
+#define CBO_CLEAN(base)						\
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(1))
 
-#define CBO_flush(base)						\
+#define CBO_FLUSH(base)						\
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(2))
 
-#define CBO_zero(base)						\
+#define CBO_ZERO(base)						\
 	INSN_I(OPCODE_MISC_MEM, FUNC3(2), __RD(0),		\
 	       RS1(base), SIMM12(4))
 
diff --git a/arch/riscv/lib/clear_page.S b/arch/riscv/lib/clear_page.S
index d7a256eb53f4..b22de1231144 100644
--- a/arch/riscv/lib/clear_page.S
+++ b/arch/riscv/lib/clear_page.S
@@ -29,41 +29,41 @@ SYM_FUNC_START(clear_page)
 	lw	a1, riscv_cboz_block_size
 	add	a2, a0, a2
 .Lzero_loop:
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
 	CBOZ_ALT(11, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
 	CBOZ_ALT(10, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
 	CBOZ_ALT(9, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
 	CBOZ_ALT(8, "bltu a0, a2, .Lzero_loop; ret", "nop; nop")
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
-	CBO_zero(a0)
+	CBO_ZERO(a0)
 	add	a0, a0, a1
 	bltu	a0, a2, .Lzero_loop
 	ret
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index b76e7e192eb1..607d5f47d437 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -31,7 +31,7 @@ static inline void arch_dma_cache_wback(phys_addr_t paddr, size_t size)
 		return;
 	}
 #endif
-	ALT_CMO_OP(clean, vaddr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(CLEAN, vaddr, size, riscv_cbom_block_size);
 }
 
 static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
@@ -45,7 +45,7 @@ static inline void arch_dma_cache_inv(phys_addr_t paddr, size_t size)
 	}
 #endif
 
-	ALT_CMO_OP(inval, vaddr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(INVAL, vaddr, size, riscv_cbom_block_size);
 }
 
 static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
@@ -59,7 +59,7 @@ static inline void arch_dma_cache_wback_inv(phys_addr_t paddr, size_t size)
 	}
 #endif
 
-	ALT_CMO_OP(flush, vaddr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(FLUSH, vaddr, size, riscv_cbom_block_size);
 }
 
 static inline bool arch_sync_dma_clean_before_fromdevice(void)
@@ -131,7 +131,7 @@ void arch_dma_prep_coherent(struct page *page, size_t size)
 	}
 #endif
 
-	ALT_CMO_OP(flush, flush_addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(FLUSH, flush_addr, size, riscv_cbom_block_size);
 }
 
 void arch_setup_dma_ops(struct device *dev, u64 dma_base, u64 size,
diff --git a/arch/riscv/mm/pmem.c b/arch/riscv/mm/pmem.c
index c5fc5ec96f6d..370a422ede11 100644
--- a/arch/riscv/mm/pmem.c
+++ b/arch/riscv/mm/pmem.c
@@ -17,7 +17,7 @@ void arch_wb_cache_pmem(void *addr, size_t size)
 		return;
 	}
 #endif
-	ALT_CMO_OP(clean, addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(CLEAN, addr, size, riscv_cbom_block_size);
 }
 EXPORT_SYMBOL_GPL(arch_wb_cache_pmem);
 
@@ -29,6 +29,6 @@ void arch_invalidate_pmem(void *addr, size_t size)
 		return;
 	}
 #endif
-	ALT_CMO_OP(inval, addr, size, riscv_cbom_block_size);
+	ALT_CMO_OP(INVAL, addr, size, riscv_cbom_block_size);
 }
 EXPORT_SYMBOL_GPL(arch_invalidate_pmem);
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
