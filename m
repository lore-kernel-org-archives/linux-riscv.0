Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20C53C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jan 2022 12:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=r9KfB7bDtdwFYbG6j0GmdBxVbbIwDvJJkkjQWluj8to=; b=EHWE38Ewj1FwZS
	M/8AhC9+bGF4rvrEP4UAAE+d8B/cetj88DLp8YqKzjTnD166obL7ztw/w8cW6hZzfnoH5CxJxSVJX
	Ly74ZBVgb8H4+0orncC8CBA67nGNz6+lejE49Mxa36CovbpCA/3AMVqz8MJWywxvGep0WhlHol+QI
	I0kSRfkbBhBonCQdIX+iPMmxZV//W3mCDTOQCBHcfG2e7N94ISMbUx6M5vxqGfFdQuRJjyMp0dG5f
	gvE8w3ImSktmlLejHFro5hk/aQQIusA8Rzk0K7ZPFSjEcpOchgjF3wc927vY7jDC0LtmIu3tSGAtd
	ln322qaXt2Wp4NdvXdAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nByvF-003Kzm-1N; Mon, 24 Jan 2022 12:58:13 +0000
Received: from foss.arm.com ([217.140.110.172])
 by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nByvC-003Kxz-6F
 for linux-riscv@lists.infradead.org; Mon, 24 Jan 2022 12:58:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 945EA101E;
 Mon, 24 Jan 2022 04:58:09 -0800 (PST)
Received: from p8cg001049571a15.arm.com (unknown [10.163.43.190])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1B7AB3F774;
 Mon, 24 Jan 2022 04:58:05 -0800 (PST)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, hch@infradead.org, akpm@linux-foundation.org,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org
Subject: [RFC V1 15/31] riscv/mm: Enable ARCH_HAS_VM_GET_PAGE_PROT
Date: Mon, 24 Jan 2022 18:26:52 +0530
Message-Id: <1643029028-12710-16-git-send-email-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1643029028-12710-1-git-send-email-anshuman.khandual@arm.com>
References: <1643029028-12710-1-git-send-email-anshuman.khandual@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220124_045810_355748_027038B6 
X-CRM114-Status: UNSURE (   9.32  )
X-CRM114-Notice: Please train this message.
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

This defines and exports a platform specific custom vm_get_page_prot() via
subscribing ARCH_HAS_VM_GET_PAGE_PROT. Subsequently all __SXXX and __PXXX
macros can be dropped which are no longer needed.

Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/riscv/Kconfig               |  1 +
 arch/riscv/include/asm/pgtable.h | 16 -------------
 arch/riscv/mm/init.c             | 41 ++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 5adcbd9b5e88..9391742f9286 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -31,6 +31,7 @@ config RISCV
 	select ARCH_HAS_STRICT_MODULE_RWX if MMU && !XIP_KERNEL
 	select ARCH_HAS_TICK_BROADCAST if GENERIC_CLOCKEVENTS_BROADCAST
 	select ARCH_HAS_UBSAN_SANITIZE_ALL
+	select ARCH_HAS_VM_GET_PAGE_PROT
 	select ARCH_OPTIONAL_KERNEL_RWX if ARCH_HAS_STRICT_KERNEL_RWX
 	select ARCH_OPTIONAL_KERNEL_RWX_DEFAULT
 	select ARCH_STACKWALK
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 7e949f25c933..d2bb14cac28b 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -183,24 +183,8 @@ extern struct pt_alloc_ops pt_ops __initdata;
 extern pgd_t swapper_pg_dir[];
 
 /* MAP_PRIVATE permissions: xwr (copy-on-write) */
-#define __P000	PAGE_NONE
-#define __P001	PAGE_READ
-#define __P010	PAGE_COPY
-#define __P011	PAGE_COPY
-#define __P100	PAGE_EXEC
-#define __P101	PAGE_READ_EXEC
-#define __P110	PAGE_COPY_EXEC
-#define __P111	PAGE_COPY_READ_EXEC
 
 /* MAP_SHARED permissions: xwr */
-#define __S000	PAGE_NONE
-#define __S001	PAGE_READ
-#define __S010	PAGE_SHARED
-#define __S011	PAGE_SHARED
-#define __S100	PAGE_EXEC
-#define __S101	PAGE_READ_EXEC
-#define __S110	PAGE_SHARED_EXEC
-#define __S111	PAGE_SHARED_EXEC
 
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 static inline int pmd_present(pmd_t pmd)
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index cf4d018b7d66..1cd96ba5398b 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1048,3 +1048,44 @@ int __meminit vmemmap_populate(unsigned long start, unsigned long end, int node,
 	return vmemmap_populate_basepages(start, end, node, NULL);
 }
 #endif
+
+pgprot_t vm_get_page_prot(unsigned long vm_flags)
+{
+	switch (vm_flags & (VM_READ | VM_WRITE | VM_EXEC | VM_SHARED)) {
+	case VM_NONE:
+		return PAGE_NONE;
+	case VM_READ:
+		return PAGE_READ;
+	case VM_WRITE:
+		return PAGE_COPY;
+	case VM_READ | VM_WRITE:
+		return PAGE_COPY;
+	case VM_EXEC:
+		return PAGE_EXEC;
+	case VM_EXEC | VM_READ:
+		return PAGE_READ_EXEC;
+	case VM_EXEC | VM_WRITE:
+		return PAGE_COPY_EXEC;
+	case VM_EXEC | VM_READ | VM_WRITE:
+		return PAGE_COPY_READ_EXEC;
+	case VM_SHARED:
+		return PAGE_NONE;
+	case VM_SHARED | VM_READ:
+		return PAGE_READ;
+	case VM_SHARED | VM_WRITE:
+		return PAGE_SHARED;
+	case VM_SHARED | VM_READ | VM_WRITE:
+		return PAGE_SHARED;
+	case VM_SHARED | VM_EXEC:
+		return PAGE_EXEC;
+	case VM_SHARED | VM_EXEC | VM_READ:
+		return PAGE_READ_EXEC;
+	case VM_SHARED | VM_EXEC | VM_WRITE:
+		return PAGE_SHARED_EXEC;
+	case VM_SHARED | VM_EXEC | VM_READ | VM_WRITE:
+		return PAGE_SHARED_EXEC;
+	default:
+		BUILD_BUG();
+	}
+}
+EXPORT_SYMBOL(vm_get_page_prot);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
