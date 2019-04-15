Return-Path: <SRS0=fYgv=SR=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8CBBC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7ACEF20656
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2019 09:15:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Db1kGMUF"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7ACEF20656
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yoihM3gHtLgwxRDiaHYwPa4qI+kvL9iNeHLveIbqcAw=; b=Db1kGMUFzkpeMd
	pSQ8dGALhiPGN8U2A76vQyaKXoJJL3q0ulXNcNHrVMdkHjKQZ2+2ooBZM5riVvqkRTCinu/zak90G
	Qh+aIAcEAs/sMsm40CNIi+0dm5iWTEyLMWJASj3Edb1ADJs9JWyDKHvQFH56MWIpb0hb1dbXnf7Uw
	oltppB10Q6Tn5G8DTXJG4HuH/+6C4D5TyN1ao4ae8CPahEZZr4zmv1aAm5b3xWtBO9Y4CaW4ONmsl
	u1YVC1fLgcJLoBSx69goTZb/CZwC6sZI+MZYMWhbdc2ryAW76g1B9QnqhGcVchAr0mmn9Uak1m1g6
	8dNmvg6NChhps8NOqoag==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hFxhw-0006Td-JE; Mon, 15 Apr 2019 09:15:20 +0000
Received: from 213-225-15-255.nat.highway.a1.net ([213.225.15.255]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hFxhv-0006R2-1B; Mon, 15 Apr 2019 09:15:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Palmer Dabbelt <palmer@sifive.com>
Subject: [PATCH 04/11] riscv: remove CONFIG_RISCV_ISA_A
Date: Mon, 15 Apr 2019 11:14:35 +0200
Message-Id: <20190415091442.19945-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190415091442.19945-1-hch@lst.de>
References: <20190415091442.19945-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Nick Kossifidis <mick@ics.forth.gr>, Atish Patra <atish.patra@wdc.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This option is always enabled, and not supporting the A extensions would
create a complete ABI trainwreck, so there is no point in even slightly
encouraging such an idea by keeping this unselectable code around.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 arch/riscv/Kconfig             |  6 +-----
 arch/riscv/Makefile            |  5 ++---
 arch/riscv/include/asm/futex.h | 13 -------------
 3 files changed, 3 insertions(+), 21 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb56c82d8aa1..a65b2a43f7ba 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -27,7 +27,7 @@ config RISCV
 	select GENERIC_STRNCPY_FROM_USER
 	select GENERIC_STRNLEN_USER
 	select GENERIC_SMP_IDLE_THREAD
-	select GENERIC_ATOMIC64 if !64BIT || !RISCV_ISA_A
+	select GENERIC_ATOMIC64 if !64BIT
 	select HAVE_ARCH_AUDITSYSCALL
 	select HAVE_MEMBLOCK_NODE_MAP
 	select HAVE_DMA_CONTIGUOUS
@@ -35,7 +35,6 @@ config RISCV
 	select HAVE_PERF_EVENTS
 	select HAVE_SYSCALL_TRACEPOINTS
 	select IRQ_DOMAIN
-	select RISCV_ISA_A if SMP
 	select SPARSE_IRQ
 	select SYSCTL_EXCEPTION_TRACE
 	select HAVE_ARCH_TRACEHOOK
@@ -197,9 +196,6 @@ config RISCV_ISA_C
 
 	   If you don't know what to do here, say Y.
 
-config RISCV_ISA_A
-	def_bool y
-
 menu "supported PMU type"
 	depends on PERF_EVENTS
 
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index c6342e638ef7..6b0741c9f348 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -39,9 +39,8 @@ endif
 KBUILD_CFLAGS += -Wall
 
 # ISA string setting
-riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32im
-riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64im
-riscv-march-$(CONFIG_RISCV_ISA_A)	:= $(riscv-march-y)a
+riscv-march-$(CONFIG_ARCH_RV32I)	:= rv32ima
+riscv-march-$(CONFIG_ARCH_RV64I)	:= rv64ima
 riscv-march-$(CONFIG_FPU)		:= $(riscv-march-y)fd
 riscv-march-$(CONFIG_RISCV_ISA_C)	:= $(riscv-march-y)c
 KBUILD_CFLAGS += -march=$(subst fd,,$(riscv-march-y))
diff --git a/arch/riscv/include/asm/futex.h b/arch/riscv/include/asm/futex.h
index 66641624d8a5..4ad6409c4647 100644
--- a/arch/riscv/include/asm/futex.h
+++ b/arch/riscv/include/asm/futex.h
@@ -7,18 +7,6 @@
 #ifndef _ASM_FUTEX_H
 #define _ASM_FUTEX_H
 
-#ifndef CONFIG_RISCV_ISA_A
-/*
- * Use the generic interrupt disabling versions if the A extension
- * is not supported.
- */
-#ifdef CONFIG_SMP
-#error "Can't support generic futex calls without A extension on SMP"
-#endif
-#include <asm-generic/futex.h>
-
-#else /* CONFIG_RISCV_ISA_A */
-
 #include <linux/futex.h>
 #include <linux/uaccess.h>
 #include <linux/errno.h>
@@ -124,5 +112,4 @@ futex_atomic_cmpxchg_inatomic(u32 *uval, u32 __user *uaddr,
 	return ret;
 }
 
-#endif /* CONFIG_RISCV_ISA_A */
 #endif /* _ASM_FUTEX_H */
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
