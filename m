Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8A4FC3ABB6
	for <linux-riscv@archiver.kernel.org>; Mon,  5 May 2025 22:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2xuOiJ6kkDmFe1nXkCfBz/brCoFP8qHFZQBdnuWUK9I=; b=veFNLd2SQyzzYf
	VInEFplGBsWq01UtBb84ckv8ijPtYClnUo4KoAdblFztPmdSy/XLMtGZRdgOGVV5P9YFIjHpj/mGX
	C5KUeX1VTMwqboVazKzK2wdrCqbdmt7HY4eVQuRSySQKKtQaS1qspycTMxn1zqBGwZrEfpl4uBWZ7
	aNGHYZnjo3/O6c62I9EjqlLdA8s/4ncB/wJajgaQbkRXUm7gZlokRWp8gCnnKblBKNe5VudbphDPf
	NNiFxKI1Co57VHYF9QyjQPX0dgzrGBrnaQQ/KOVz9o91ghRLUbKCjQwJQLPxs89Sw9MMpxn+7TjG8
	LBoEXxb9Y1Pfh1YYYCuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC47O-00000008i76-1YOH;
	Mon, 05 May 2025 22:16:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC45W-00000008heP-31EN
	for linux-riscv@lists.infradead.org;
	Mon, 05 May 2025 22:15:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6585A43E9A;
	Mon,  5 May 2025 22:14:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF564C4CEE4;
	Mon,  5 May 2025 22:14:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483302;
	bh=wpBIFCI3plvLmkr5lp9oDV+SY9kVX4hB/sSW423ynQM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=KnUgiA4wKXuYknr3HUjjNOwu1pb2CzrctKJSBeF/o6y4sKLeTJBAN3w7XL/34GqpS
	 dmQHTvpqF1SlY/iLMX7oqb6+uMStz2bpaF9nEOuvleb+Sjg4FTaHVItMfG0e78KWQV
	 iBXPMufWMSGwzU9txdLiUQYkOCJbXT0zWTyreKc5gPTYK6cUCpz87eSCf1NophF16c
	 +HRQ3RFlwqahk8wj8bH/HBNVIkevy+S1a+dtGTYW8IZxrffGObC3oxPgFI0VfcWykD
	 kmWrHUAznTKexm90bk9tXtMzFD57mAh+QA4V26NflXfEccti+2skbeOBIKeJnlx3md
	 FpeL32+NHAVMw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Jesse Taube <mr.bossman075@gmail.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alexghiti@rivosinc.com,
	namcao@linutronix.de,
	arnd@arndb.de,
	bjorn@rivosinc.com,
	vincenzo.frascino@arm.com,
	stuart.menefy@codasip.com,
	david@redhat.com,
	akpm@linux-foundation.org,
	libang.li@antgroup.com,
	abrestic@rivosinc.com,
	anshuman.khandual@arm.com,
	yongxuan.wang@sifive.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.14 023/642] riscv: Allow NOMMU kernels to access all of RAM
Date: Mon,  5 May 2025 18:03:59 -0400
Message-Id: <20250505221419.2672473-23-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_151502_811719_85FFA4C1 
X-CRM114-Status: GOOD (  12.54  )
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

From: Samuel Holland <samuel.holland@sifive.com>

[ Upstream commit 2c0391b29b27f315c1b4c29ffde66f50b29fab99 ]

NOMMU kernels currently cannot access memory below the kernel link
address. Remove this restriction by setting PAGE_OFFSET to the actual
start of RAM, as determined from the devicetree. The kernel link address
must be a constant, so keep using CONFIG_PAGE_OFFSET for that purpose.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Jesse Taube <mr.bossman075@gmail.com>
Link: https://lore.kernel.org/r/20241026171441.3047904-3-samuel.holland@sifive.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/page.h    | 12 ++++--------
 arch/riscv/include/asm/pgtable.h |  2 +-
 2 files changed, 5 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 125f5ecd95652..6409fd78ae6fa 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -24,12 +24,9 @@
  * When not using MMU this corresponds to the first free page in
  * physical memory (aligned on a page boundary).
  */
-#ifdef CONFIG_64BIT
 #ifdef CONFIG_MMU
+#ifdef CONFIG_64BIT
 #define PAGE_OFFSET		kernel_map.page_offset
-#else
-#define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
-#endif
 /*
  * By default, CONFIG_PAGE_OFFSET value corresponds to SV57 address space so
  * define the PAGE_OFFSET value for SV48 and SV39.
@@ -39,6 +36,9 @@
 #else
 #define PAGE_OFFSET		_AC(CONFIG_PAGE_OFFSET, UL)
 #endif /* CONFIG_64BIT */
+#else
+#define PAGE_OFFSET		((unsigned long)phys_ram_base)
+#endif /* CONFIG_MMU */
 
 #ifndef __ASSEMBLY__
 
@@ -95,11 +95,7 @@ typedef struct page *pgtable_t;
 #define MIN_MEMBLOCK_ADDR      0
 #endif
 
-#ifdef CONFIG_MMU
 #define ARCH_PFN_OFFSET		(PFN_DOWN((unsigned long)phys_ram_base))
-#else
-#define ARCH_PFN_OFFSET		(PAGE_OFFSET >> PAGE_SHIFT)
-#endif /* CONFIG_MMU */
 
 struct kernel_mapping {
 	unsigned long page_offset;
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 050fdc49b5ad7..eb7b25ef556ec 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -12,7 +12,7 @@
 #include <asm/pgtable-bits.h>
 
 #ifndef CONFIG_MMU
-#define KERNEL_LINK_ADDR	PAGE_OFFSET
+#define KERNEL_LINK_ADDR	_AC(CONFIG_PAGE_OFFSET, UL)
 #define KERN_VIRT_SIZE		(UL(-1))
 #else
 
-- 
2.39.5


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
