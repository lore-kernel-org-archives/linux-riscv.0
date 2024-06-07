Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C932C27C55
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Jun 2024 20:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=VFOSJLkKZtIA2c3iuAWI2NmRYcgJ3lEzvZ9Wouy3Ans=; b=wrq25dxiXPep8o
	h1snpCi4io9lfdoQdryUyrZUkYqu5QHNpLJf4Aq1fLJ0Z5BlEaxt/TiyUWZIFoZdbeI2EfOkVMKvf
	niAMOrGA//ftSA5Hr9RVrMJC43KpC3/JImRKYt1IXliXUsHKOwy7GGI4VVlInmmrQQUTCxtmuw4Xd
	kTrPWpIxNcxYIWhyUl/yJHrJJruhFQ6akDkBvU1uxu4IFoGDv8lXma6ZnXVqxNJxRzDG9IE03lAl2
	ICNrw3cvfRmP7hkQKg0OFY7B56reozD9BT5snPgHf9QbEUqWv5hrAlSdpo1/v02w9OBU0L0vChHw5
	ykUnxVjx6n9B1avLGYFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6f-0000000FVZs-2rsP;
	Fri, 07 Jun 2024 20:22:37 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sFg6Q-0000000FVRr-1ZcT
	for linux-riscv@lists.infradead.org;
	Fri, 07 Jun 2024 20:22:35 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlQGR+tGoioFd255pa4F2M3do0QPDjAAVJR0Ox/2Zbw=;
	b=0npk3eVUOmUI1nJgJEXVN/ccbreM702IcCn9WYf4K/Oxj9tGeMxddKkJDGTLsUd6jU2Hld
	86Xue89Ax+FDFdr9bi4qq0TZILDFEK4O0vrkSSqjw0jrpsUrochYd1ry6G8v8Lp3515Rpi
	9Cn3A2N9JjNeldDor7FOPGDDYDVkBHeClap9PF2sTvYFqwn/F7PxWsn+/8ABx8JEdvzbGE
	PX6YLMMZVGxgy+nAhy0qy6DK607Dm1xO0FXBnf5odNFkK+MwvNBSvHhaM36oP+IVSTu7R0
	rgtqlU1JZaXDFC4dQJbF6bx8ZEJ21UxJuL5aMpyOjGfOAkB7alyW5ynRxbMVXQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1717791734;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QlQGR+tGoioFd255pa4F2M3do0QPDjAAVJR0Ox/2Zbw=;
	b=pAOWJZp1PU/dlsrZNLVkbeFP89DsN/O4sOSeJ+S3UZsBgLwdnT58Oc5YLEFIvS5di+cZG4
	vW6wJ5f0wxgfC1Cg==
To: Alexandre Ghiti <alexghiti@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 8/8] riscv: remove limit on the size of read-only section for XIP kernel
Date: Fri,  7 Jun 2024 22:22:13 +0200
Message-Id: <3bf3a77be10ebb0d8086c028500baa16e7a8e648.1717789719.git.namcao@linutronix.de>
In-Reply-To: <cover.1717789719.git.namcao@linutronix.de>
References: <cover.1717789719.git.namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240607_132222_865072_A1D964C4 
X-CRM114-Status: GOOD (  11.55  )
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

XIP_OFFSET is the hard-coded offset of writable data section within the
kernel.

By hard-coding this value, the read-only section of the kernel (which is
placed before the writable data section) is restricted in size. This causes
build failures if the kernel gets too big [1].

Remove this limit.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202404211031.J6l2AfJk-lkp@intel.com [1]
Signed-off-by: Nam Cao <namcao@linutronix.de>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h    | 7 -------
 arch/riscv/include/asm/set_memory.h | 2 +-
 arch/riscv/kernel/vmlinux-xip.lds.S | 5 +++--
 3 files changed, 4 insertions(+), 10 deletions(-)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 1bc103aa9b74..bf4afffe0c53 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -107,13 +107,6 @@
 
 #endif
 
-#ifdef CONFIG_XIP_KERNEL
-#define XIP_OFFSET		SZ_32M
-#define XIP_OFFSET_MASK		(SZ_32M - 1)
-#else
-#define XIP_OFFSET		0
-#endif
-
 #ifndef __ASSEMBLY__
 
 #include <asm/page.h>
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
index ec11001c3fe0..ab92fc84e1fc 100644
--- a/arch/riscv/include/asm/set_memory.h
+++ b/arch/riscv/include/asm/set_memory.h
@@ -46,7 +46,7 @@ bool kernel_page_present(struct page *page);
 
 #endif /* __ASSEMBLY__ */
 
-#ifdef CONFIG_STRICT_KERNEL_RWX
+#if defined(CONFIG_STRICT_KERNEL_RWX) || defined(CONFIG_XIP_KERNEL)
 #ifdef CONFIG_64BIT
 #define SECTION_ALIGN (1 << 21)
 #else
diff --git a/arch/riscv/kernel/vmlinux-xip.lds.S b/arch/riscv/kernel/vmlinux-xip.lds.S
index 8c3daa1b0531..a7611789bad5 100644
--- a/arch/riscv/kernel/vmlinux-xip.lds.S
+++ b/arch/riscv/kernel/vmlinux-xip.lds.S
@@ -14,6 +14,7 @@
 #include <asm/page.h>
 #include <asm/cache.h>
 #include <asm/thread_info.h>
+#include <asm/set_memory.h>
 
 OUTPUT_ARCH(riscv)
 ENTRY(_start)
@@ -65,10 +66,10 @@ SECTIONS
  * From this point, stuff is considered writable and will be copied to RAM
  */
 	__data_loc = ALIGN(PAGE_SIZE);		/* location in file */
-	. = KERNEL_LINK_ADDR + XIP_OFFSET;	/* location in memory */
+	. = ALIGN(SECTION_ALIGN);		/* location in memory */
 
 #undef LOAD_OFFSET
-#define LOAD_OFFSET (KERNEL_LINK_ADDR + XIP_OFFSET - (__data_loc & XIP_OFFSET_MASK))
+#define LOAD_OFFSET (KERNEL_LINK_ADDR + _sdata - __data_loc)
 
 	_sdata = .;			/* Start of data section */
 	_data = .;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
