Return-Path: <SRS0=mni0=O7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F1B7C433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 09:14:50 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C282A60F5B
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Oct 2021 09:14:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C282A60F5B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=konsulko.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qlpv4Auy3bdXXXR8sp5UT4IYbg3nTyS535O3GSQ2Ja8=; b=YKmEml6RWU88Sk
	csang/C4IxMML95wCF+FkJFM2IsuOBMi4+uc8kqdBIfgrs9Y7lBwE9y3dg1K3quemjkK/eX6Y2kem
	O+l8xFZMKIHSrj/8ABF8mfKupx5bBDqL8H5ule/SpoVYh80WIdBtJQHZS2JPXxRHBktxeWzzQkyl6
	EYPzAv4NLlPUHtZs+HdmGiVo2P/BjJsEG6DX7UVWGLJEsEIUC6hFkudy2rd8NeeA77waKCmck8tKO
	1YbpzVWrfJqiIbRKEXRMjObIibgPBfNEUoufnY2AYPUP9z0S0aPIWGbNlo54ujkCQ90573giywKTg
	VgLvPHJNkdpFtX2ZH8ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mZrOC-008UoV-D3; Mon, 11 Oct 2021 09:14:32 +0000
Received: from mail-lf1-x134.google.com ([2a00:1450:4864:20::134])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mZrO8-008UmY-Vm
 for linux-riscv@lists.infradead.org; Mon, 11 Oct 2021 09:14:30 +0000
Received: by mail-lf1-x134.google.com with SMTP id x27so71086057lfu.5
 for <linux-riscv@lists.infradead.org>; Mon, 11 Oct 2021 02:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYK0t2A+iFWYLArJmrhlQnzM1LrjxbAnutJ7r5EoWfU=;
 b=bKrjwjRDGkaTFC/KjPZBW/GHCJKQ2f3GUr3kuQqhJA4TNpbn3koeSzAd5KqeNOBVsl
 QdccD7nOSq4lrDTwW5tkfakki/JZ2OOrFXoUvJLTbgReUQsjDxDMvni8nwiANeYr2Aex
 QH3ObFO160yKC/b4uhEAmVSGT1CnmwyHWNRDQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=aYK0t2A+iFWYLArJmrhlQnzM1LrjxbAnutJ7r5EoWfU=;
 b=SAX1e/O3akIWcIc/uIXkThiFZN1FuYjWFlR+DDt0KwnOzezD/7S6xNDl3shXrDHXSr
 +a9G3Mj5Ry4GBHPWaB7YZg3789sSLK+FGEI12UfX4CnOotNox2d1zS+fAy6UGcnwyGBX
 seTqYtKiutYApiEnfyzpmJSn9H7aTz1W/0J7Y4I+G55uLgm0D5nzt0T2cQLenQl89iZ4
 7HUbH+yXtRehMOaZWK3Tipv9Nk8pLu8cfXb5U0dCYITL9xVN7OnZxADJVs49kZ3pXgk/
 TWqebd28P+qZ65Oi+A3QSK+kErIW84uuiVc2n3+14x9wGZg47NFpx0potw3iU+A/S0iF
 1Jeg==
X-Gm-Message-State: AOAM5332RHBIGk/bP9wLd5H5fciOCdtzh3prBbaud46FdWZKeUmRgw1K
 tJz6ci+WIG1TwFGsd+WNAXRgglWXypRNNNyLWXI=
X-Google-Smtp-Source: ABdhPJywdRS0cfvpTdnwWvqOVO9vl8115LwXVAux0pAuR+cgL9Jy9nNOKoMModzwTeVxZ63ZCVCybg==
X-Received: by 2002:a2e:a88a:: with SMTP id m10mr12639873ljq.3.1633943665181; 
 Mon, 11 Oct 2021 02:14:25 -0700 (PDT)
Received: from localhost.localdomain (m83-186-96-96.cust.tele2.se.
 [83.186.96.96])
 by smtp.gmail.com with ESMTPSA id y6sm679788lfj.47.2021.10.11.02.14.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 02:14:24 -0700 (PDT)
From: Vitaly Wool <vitaly.wool@konsulko.com>
To: linux-riscv@lists.infradead.org
Cc: Alexandre Ghiti <alex@ghiti.fr>, Palmer Dabbelt <palmer@dabbelt.com>,
 Jisheng Zhang <jszhang@kernel.org>, linux-mm@kvack.org,
 Nicolas Pitre <nico@fluxnic.net>, Vitaly Wool <vitaly.wool@konsulko.com>
Subject: [PATCH] riscv: remove .text section size limitation for XIP
Date: Mon, 11 Oct 2021 11:14:14 +0200
Message-Id: <20211011091414.1998846-1-vitaly.wool@konsulko.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211011_021429_037802_58BEB65A 
X-CRM114-Status: GOOD (  13.62  )
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

Currently there's a limit of 8MB for the .text section of a RISC-V
image in the XIP case. This breaks compilation of many automatic
builds and is generally inconvenient. This patch removes that
limitation and optimizes XIP image file size at the same time.

Signed-off-by: Vitaly Wool <vitaly.wool@konsulko.com>
---
 arch/riscv/include/asm/pgtable.h    |  6 ++++--
 arch/riscv/kernel/head.S            | 12 ++++++++++++
 arch/riscv/kernel/vmlinux-xip.lds.S | 10 +++++++---
 arch/riscv/mm/init.c                |  7 +++----
 4 files changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 39b550310ec6..bf204e7c1f74 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -75,7 +75,8 @@
 #endif
 
 #ifdef CONFIG_XIP_KERNEL
-#define XIP_OFFSET		SZ_8M
+#define XIP_OFFSET		SZ_32M
+#define XIP_OFFSET_MASK		(SZ_32M - 1)
 #else
 #define XIP_OFFSET		0
 #endif
@@ -97,7 +98,8 @@
 #ifdef CONFIG_XIP_KERNEL
 #define XIP_FIXUP(addr) ({							\
 	uintptr_t __a = (uintptr_t)(addr);					\
-	(__a >= CONFIG_XIP_PHYS_ADDR && __a < CONFIG_XIP_PHYS_ADDR + SZ_16M) ?	\
+	(__a >= CONFIG_XIP_PHYS_ADDR && \
+	 __a < CONFIG_XIP_PHYS_ADDR + XIP_OFFSET * 2) ?	\
 		__a - CONFIG_XIP_PHYS_ADDR + CONFIG_PHYS_RAM_BASE - XIP_OFFSET :\
 		__a;								\
 	})
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index fce5184b22c3..ed316d02cd7e 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -20,10 +20,20 @@
 	REG_L t0, _xip_fixup
 	add \reg, \reg, t0
 .endm
+.macro XIP_FIXUP_FLASH_OFFSET reg
+	la t1, __data_loc
+	li t0, XIP_OFFSET_MASK
+	and t1, t1, t0
+	li t1, XIP_OFFSET
+	sub t0, t0, t1
+	sub \reg, \reg, t0
+.endm
 _xip_fixup: .dword CONFIG_PHYS_RAM_BASE - CONFIG_XIP_PHYS_ADDR - XIP_OFFSET
 #else
 .macro XIP_FIXUP_OFFSET reg
 .endm
+.macro XIP_FIXUP_FLASH_OFFSET reg
+.endm
 #endif /* CONFIG_XIP_KERNEL */
 
 __HEAD
@@ -266,6 +276,7 @@ pmp_done:
 	la a3, hart_lottery
 	mv a2, a3
 	XIP_FIXUP_OFFSET a2
+	XIP_FIXUP_FLASH_OFFSET a3
 	lw t1, (a3)
 	amoswap.w t0, t1, (a2)
 	/* first time here if hart_lottery in RAM is not set */
@@ -304,6 +315,7 @@ clear_bss_done:
 	XIP_FIXUP_OFFSET sp
 #ifdef CONFIG_BUILTIN_DTB
 	la a0, __dtb_start
+	XIP_FIXUP_OFFSET a0
 #else
 	mv a0, s1
 #endif /* CONFIG_BUILTIN_DTB */
diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index 9c9f35091ef0..f5ed08262139 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -64,8 +64,11 @@ SECTIONS
 /*
  * From this point, stuff is considered writable and will be copied to RAM
  */
-	__data_loc = ALIGN(16);		/* location in file */
-	. = LOAD_OFFSET + XIP_OFFSET;	/* location in memory */
+	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
+	. = KERNEL_LINK_ADDR + XIP_OFFSET;	/* location in memory */
+
+#undef LOAD_OFFSET
+#define LOAD_OFFSET (KERNEL_LINK_ADDR + XIP_OFFSET - (__data_loc & XIP_OFFSET_MASK))
 
 	_sdata = .;			/* Start of data section */
 	_data = .;
@@ -96,7 +99,6 @@ SECTIONS
 		KEEP(*(__soc_builtin_dtb_table))
 		__soc_builtin_dtb_table_end = .;
 	}
-	PERCPU_SECTION(L1_CACHE_BYTES)
 
 	. = ALIGN(8);
 	.alternative : {
@@ -122,6 +124,8 @@ SECTIONS
 
 	BSS_SECTION(PAGE_SIZE, PAGE_SIZE, 0)
 
+	PERCPU_SECTION(L1_CACHE_BYTES)
+
 	.rel.dyn : AT(ADDR(.rel.dyn) - LOAD_OFFSET) {
 		*(.rel.dyn*)
 	}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index c0cddf0fc22d..24b2b8044602 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -41,7 +41,7 @@ phys_addr_t phys_ram_base __ro_after_init;
 EXPORT_SYMBOL(phys_ram_base);
 
 #ifdef CONFIG_XIP_KERNEL
-extern char _xiprom[], _exiprom[];
+extern char _xiprom[], _exiprom[], __data_loc;
 #endif
 
 unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)]
@@ -454,10 +454,9 @@ static uintptr_t __init best_map_size(phys_addr_t base, phys_addr_t size)
 /* called from head.S with MMU off */
 asmlinkage void __init __copy_data(void)
 {
-	void *from = (void *)(&_sdata);
-	void *end = (void *)(&_end);
+	void *from = (void *)(&__data_loc);
 	void *to = (void *)CONFIG_PHYS_RAM_BASE;
-	size_t sz = (size_t)(end - from + 1);
+	size_t sz = (size_t)((uintptr_t)(&_end) - (uintptr_t)(&_sdata));
 
 	memcpy(to, from, sz);
 }
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
