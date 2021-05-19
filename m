Return-Path: <SRS0=tjIm=KO=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DEF3C433B4
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:05:57 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9BA9B6135B
	for <linux-riscv@archiver.kernel.org>; Wed, 19 May 2021 05:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9BA9B6135B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:MIME-Version:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zvYjF3jlzlniaPIrsD8qnXP1krzuQcRkXY06cvrhjUA=; b=rPXnpMAw4JJKuod26KDWkqmJyt
	UgwYNif/aiwjqsbQfmkcbM9ETdpTh7zTnAevZ8BitOOzYs45ihI4SjrjJIV+ggpNXws0SK077zsJ4
	jOG/VlNnfDfTtwjTjZtxWr6G+EzvI5Uaw8TeIodno0AHxhNMpwZB8J+s/F5J3fnKGoYbiApNoAop4
	J7tCy+uY4ZdoFJ7C2U4WxITWYpy4nHhRSsPXuk3Y6TCmwHcLzsbsNjDU0p4DRFiqe8FnG7qWtP8ET
	ZQAwjewI/zcIF9fromCoMUGZoBjwRqBlKa3zbTUOqNZ1VtYRbqA4JaeTjzupJwpQK1pex0J9l2+L+
	+x2Xipzw==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1ljEOo-002o6S-52; Wed, 19 May 2021 05:05:40 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOm-002o5r-DW
 for linux-riscv@desiato.infradead.org; Wed, 19 May 2021 05:05:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:Content-Type:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=XEW7Hyk2gI4q/XAkJiFwLlEEX2Ug1cgABBcNa1z+NRI=; b=zXBcqy2qouJWZ6pWKPRhmhrYKz
 Q21pHXII4KZ6neyBUKriOoOKBCTFrvgCG+tXIR4NMrHgNAQEh5xFMAHmtSbs/o8PEXO9pH2P5nM6B
 RXas/JNbtLxri85DwOjNJVr7ty5aOCA9lbKM22mkJ6kcEem/zx7KjhFgl2P6RgTWaVvCemxSvBLyP
 gvYETme1lj3dSpi58UdgOmyWssuYZZA0tcuPQKFOor7JQvc4PYGAem/WJyrznxsNypIvhILZvutIM
 6f16l3tBy4+f0a4n2QQU8bz0y6bWEuB7zG/7Q/qqUdzSKPILCjnSAjqAF/P7EduQ+l8Oa5J9HSztH
 i0Kgd/lQ==;
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1ljEOj-00F8Zw-Oy
 for linux-riscv@lists.infradead.org; Wed, 19 May 2021 05:05:35 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D0E54613AE;
 Wed, 19 May 2021 05:05:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1621400733;
 bh=sYN05bC53EDVyET7U5IMlzdjAkaiTBtrJ259CHygA2g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fvDTItlkZj5gI9AXS4AQXNPjQLrTpx/5B2e1rmH39FXvYEC3cMJFrlw+zJ0AaPMWD
 T6YWvUc8hG4FVJL8ZDwTN9Io+YQKOSrxlTlROygKIi3oF0XwzV/L4k0VQb2UNYSRlO
 0lX+aqj1IIoL95XmXz7mMsLBr0YBv+iOzKj3zM4nq06mIVU4sqNrSUvzpjJ8WRMme+
 f9pv6GgC2egWvVQbVfgbHF2uKNX88Yh1xsk55L55JvhN9MopdCkXLgnMZ6rbs35c4D
 wBPGC/enieQxXgHBFiJYPZBSbR+1y760gO6AekeHeiLfQtRvtHpODZ9rNBpdhAE2yL
 USUjp+Avm1iYw==
From: guoren@kernel.org
To: guoren@kernel.org, anup.patel@wdc.com, palmerdabbelt@google.com,
 drew@beagleboard.org, hch@lst.de, wefu@redhat.com, lazyparser@gmail.com
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arch@vger.kernel.org, linux-sunxi@lists.linux.dev,
 Guo Ren <guoren@linux.alibaba.com>, Arnd Bergmann <arnd@arndb.de>
Subject: [PATCH RFC 2/3] riscv: Add DMA_COHERENT for custom PTE attributes
Date: Wed, 19 May 2021 05:04:15 +0000
Message-Id: <1621400656-25678-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1621400656-25678-1-git-send-email-guoren@kernel.org>
References: <1621400656-25678-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210518_220533_873393_8142CE0B 
X-CRM114-Status: GOOD (  14.97  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

The RISC-V ISA doesn't yet specify how to query or modify PMAs, so
let vendors define the custom properties of memory regions in PTE.

That means address attributes would use PTE entry not PMA to meet
the different requirements of IO/mem.

The patch helps SOC vendors to support their own custom
interconnect coherent solution with PTE attributes.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Drew Fustini <drew@beagleboard.org>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Wei Fu <wefu@redhat.com>
Cc: Wei Wu <lazyparser@gmail.com>
---
 arch/riscv/Kconfig                    | 27 +++++++++++++++++++++++++++
 arch/riscv/include/asm/pgtable-bits.h | 13 ++++++++++++-
 arch/riscv/include/asm/pgtable.h      |  7 ++++---
 3 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index a8ad8eb..632fac5 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -376,6 +376,33 @@ config FPU
 
 	  If you don't know what to do here, say Y.
 
+config RISCV_DMA_COHERENT
+	bool "Custom DMA coherent support"
+	depends on MMU
+	help
+	  Help SOC vendors to support their own custom interconnect coherent
+	  solution with PTE attributes.
+
+	  The RISC-V ISA doesn't yet specify how to query or modify PMAs, so let
+	  vendors define the custom properties of memory regions in PTE.
+
+	  If you don't know what to do here, say N.
+
+config RISCV_PAGE_DMA_MASK
+	hex "Custom DMA attributes' mask bits in pte"
+	depends on RISCV_DMA_COHERENT
+	default "0x0"
+
+config RISCV_PAGE_CACHE
+	hex "Custom CACHE attribute bits in pte"
+	depends on RISCV_DMA_COHERENT
+	default "0x0"
+
+config RISCV_PAGE_DMA_NONCACHE
+	hex "Custom NONCACHE attribute bits in pte"
+	depends on RISCV_DMA_COHERENT
+	default "0x0"
+
 endmenu
 
 menu "Kernel features"
diff --git a/arch/riscv/include/asm/pgtable-bits.h b/arch/riscv/include/asm/pgtable-bits.h
index bbaeb5d..071c5dc 100644
--- a/arch/riscv/include/asm/pgtable-bits.h
+++ b/arch/riscv/include/asm/pgtable-bits.h
@@ -24,6 +24,16 @@
 #define _PAGE_DIRTY     (1 << 7)    /* Set by hardware on any write */
 #define _PAGE_SOFT      (1 << 8)    /* Reserved for software */
 
+#ifdef CONFIG_RISCV_DMA_COHERENT
+#define _PAGE_DMA_MASK		CONFIG_RISCV_PAGE_DMA_MASK
+#define _PAGE_CACHE		CONFIG_RISCV_PAGE_CACHE
+#define _PAGE_DMA_NONCACHE	CONFIG_RISCV_PAGE_DMA_NONCACHE
+#else
+#define _PAGE_DMA_MASK		(0UL)
+#define _PAGE_CACHE		(0UL)
+#define _PAGE_DMA_NONCACHE	(0UL)
+#endif
+
 #define _PAGE_SPECIAL   _PAGE_SOFT
 #define _PAGE_TABLE     _PAGE_PRESENT
 
@@ -38,6 +48,7 @@
 /* Set of bits to preserve across pte_modify() */
 #define _PAGE_CHG_MASK  (~(unsigned long)(_PAGE_PRESENT | _PAGE_READ |	\
 					  _PAGE_WRITE | _PAGE_EXEC |	\
-					  _PAGE_USER | _PAGE_GLOBAL))
+					  _PAGE_USER | _PAGE_GLOBAL |	\
+					  _PAGE_DMA_MASK))
 
 #endif /* _ASM_RISCV_PGTABLE_BITS_H */
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 869d6bf..f822f22 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -114,7 +114,7 @@
 #define USER_PTRS_PER_PGD   (TASK_SIZE / PGDIR_SIZE)
 
 /* Page protection bits */
-#define _PAGE_BASE	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER)
+#define _PAGE_BASE	(_PAGE_PRESENT | _PAGE_ACCESSED | _PAGE_USER | _PAGE_CACHE)
 
 #define PAGE_NONE		__pgprot(_PAGE_PROT_NONE)
 #define PAGE_READ		__pgprot(_PAGE_BASE | _PAGE_READ)
@@ -134,7 +134,8 @@
 				| _PAGE_WRITE \
 				| _PAGE_PRESENT \
 				| _PAGE_ACCESSED \
-				| _PAGE_DIRTY)
+				| _PAGE_DIRTY \
+				| _PAGE_CACHE)
 
 #define PAGE_KERNEL		__pgprot(_PAGE_KERNEL)
 #define PAGE_KERNEL_READ	__pgprot(_PAGE_KERNEL & ~_PAGE_WRITE)
@@ -148,7 +149,7 @@
  * The RISC-V ISA doesn't yet specify how to query or modify PMAs, so we can't
  * change the properties of memory regions.
  */
-#define _PAGE_IOREMAP _PAGE_KERNEL
+#define _PAGE_IOREMAP ((_PAGE_KERNEL & ~_PAGE_DMA_MASK) | _PAGE_DMA_NONCACHE)
 
 extern pgd_t swapper_pg_dir[];
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
