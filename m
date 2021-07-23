Return-Path: <SRS0=o9Ga=MP=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D642C4338F
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:02:58 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6843A60E95
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jul 2021 13:02:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6843A60E95
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=4VRcbwxHUYiTbY9WCb4HWX60me4ozDkVdiep9fhCJLc=; b=xF8Q9m1asZuLoY
	4WQpS8xnoijOJ0XVhZaPet6+HSYng85u3kH4Hg8QJFzYdZ1nCp1BRcwHlKnP9lXyWCuLl+Pooe4is
	HLbialq0273mEse5uN0ZZEWA4XIE9TPdI15yBdJ+jYm4v1tqKOIWkHaEB9kB36OGpMPqROWNBlqgw
	SXM7wTD5RqUHMyg+UyrgF94HGEs0fIO27Fiwppi705NSXKKEqntXvKgqjNggVqfFCkASUV0ZZhmcu
	vX2WO8DQuNXykgbXpLVupZOUNVKG5vezC7GZy4hO7ysHKMg/S9myVPwxHZ/8gdUj0FQUm90dkJrZb
	yNwCysiJMIB4KOsktyew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1m6up9-004lgS-FY; Fri, 23 Jul 2021 13:02:43 +0000
Received: from relay11.mail.gandi.net ([217.70.178.231])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1m6up6-004lf2-K4
 for linux-riscv@lists.infradead.org; Fri, 23 Jul 2021 13:02:42 +0000
Received: (Authenticated sender: alex@ghiti.fr)
 by relay11.mail.gandi.net (Postfix) with ESMTPSA id D7D33100005;
 Fri, 23 Jul 2021 13:02:34 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: Alexandre Ghiti <alex@ghiti.fr>
Subject: [PATCH 1/5] riscv: Introduce va_kernel_pa_offset for 32-bit kernel
Date: Fri, 23 Jul 2021 15:01:24 +0200
Message-Id: <20210723130128.47664-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210723130128.47664-1-alex@ghiti.fr>
References: <20210723130128.47664-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210723_060240_867401_7F39F919 
X-CRM114-Status: GOOD (  11.21  )
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

va_kernel_pa_offset was only used for 64-bit as the kernel mapping lies
in the linear mapping for 32-bit kernel and then only the offset between
the PAGE_OFFSET and the kernel load address is needed.

But this distinction complexifies the code with #ifdefs and especially
with a separate definition of the address conversions macros.

Simplify the code by defining this variable for both 32-bit and 64-bit.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/include/asm/page.h | 15 ++-------------
 arch/riscv/mm/init.c          |  3 ---
 2 files changed, 2 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index 10dc063868f6..adf5b4671684 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -91,10 +91,8 @@ struct kernel_mapping {
 	uintptr_t size;
 	/* Offset between linear mapping virtual address and kernel load address */
 	unsigned long va_pa_offset;
-#ifdef CONFIG_64BIT
 	/* Offset between kernel mapping virtual address and kernel load address */
 	unsigned long va_kernel_pa_offset;
-#endif
 	unsigned long va_kernel_xip_pa_offset;
 #ifdef CONFIG_XIP_KERNEL
 	uintptr_t xiprom;
@@ -105,11 +103,11 @@ struct kernel_mapping {
 extern struct kernel_mapping kernel_map;
 extern phys_addr_t phys_ram_base;
 
-#ifdef CONFIG_64BIT
 #define is_kernel_mapping(x)	\
 	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
+
 #define is_linear_mapping(x)	\
-	((x) >= PAGE_OFFSET && (x) < kernel_map.virt_addr)
+	((x) >= PAGE_OFFSET && (!IS_ENABLED(CONFIG_64BIT) || (x) < kernel_map.virt_addr))
 
 #define linear_mapping_pa_to_va(x)	((void *)((unsigned long)(x) + kernel_map.va_pa_offset))
 #define kernel_mapping_pa_to_va(y)	({						\
@@ -133,15 +131,6 @@ extern phys_addr_t phys_ram_base;
 	is_linear_mapping(_x) ?							\
 		linear_mapping_va_to_pa(_x) : kernel_mapping_va_to_pa(_x);	\
 	})
-#else
-#define is_kernel_mapping(x)	\
-	((x) >= kernel_map.virt_addr && (x) < (kernel_map.virt_addr + kernel_map.size))
-#define is_linear_mapping(x)	\
-	((x) >= PAGE_OFFSET)
-
-#define __pa_to_va_nodebug(x)  ((void *)((unsigned long) (x) + kernel_map.va_pa_offset))
-#define __va_to_pa_nodebug(x)  ((unsigned long)(x) - kernel_map.va_pa_offset)
-#endif /* CONFIG_64BIT */
 
 #ifdef CONFIG_DEBUG_VIRTUAL
 extern phys_addr_t __virt_to_phys(unsigned long x);
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 4ebe7e19c2b8..9668867e2702 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -559,11 +559,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 	kernel_map.phys_addr = (uintptr_t)(&_start);
 	kernel_map.size = (uintptr_t)(&_end) - kernel_map.phys_addr;
 #endif
-
 	kernel_map.va_pa_offset = PAGE_OFFSET - kernel_map.phys_addr;
-#ifdef CONFIG_64BIT
 	kernel_map.va_kernel_pa_offset = kernel_map.virt_addr - kernel_map.phys_addr;
-#endif
 
 	pfn_base = PFN_DOWN(kernel_map.phys_addr);
 
-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
