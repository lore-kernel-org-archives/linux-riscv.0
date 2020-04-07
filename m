Return-Path: <SRS0=q7Eq=5X=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F9AC2BA2B
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2020 14:47:14 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9E24B2075E
	for <infradead-linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2020 14:47:14 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="IlAS7G4v";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="knovKfyo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9E24B2075E
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:Date
	:Subject:To:From:Reply-To:Content-Type:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bdvS3ImXktegIGIUSt7DM4X3H//vtPG1T5XbtOqEIxE=; b=IlAS7G4vTotxUi
	ALvpJ9RbpEhNuu4P9hXe6Bx/VP6OynZnFvs1DP6OFIgjuqVOaxA5LAgB2al9Zh44fjIvzYBaYwLLu
	c//OLt9fF1M7K72VwPMpkfctwNhs6jF3DhSCk22tuXtiSXYB9sFuETipsQPCFp9I04+w30RMTSW/S
	u0DwSW0yYnIIOeHRqSBsmsySTY7E6RQx3LPAkujkzs6K+8ckfJRxhEanNTmuHSGCdPjXxCJi3Bgeh
	8eIiRxQs4IjOeHxBxp6/RwD6wy8AK+1NwRPeY+9GksAryD3uE643XCjWF3GxMmZaJCLyT4JJm485l
	B6Nt9pHBnMGI+2v/KlHQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jLpVR-0006Mz-AS; Tue, 07 Apr 2020 14:47:13 +0000
Received: from mail-pl1-x643.google.com ([2607:f8b0:4864:20::643])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jLpVL-0006Et-VJ
 for linux-riscv@lists.infradead.org; Tue, 07 Apr 2020 14:47:09 +0000
Received: by mail-pl1-x643.google.com with SMTP id x1so1335495plm.4
 for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2020 07:47:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bdvS3ImXktegIGIUSt7DM4X3H//vtPG1T5XbtOqEIxE=;
 b=knovKfyo4UZfNQvLumQh4YiND2YiuKKF1VEMXbmrk4DNL7JyU0zDLLAK12VKAzO69V
 No6OSJ5iiap2sww6JWv44GLP4xJ+EX6DctkaBBRIt1gJ4AIIO+Zny1L5JP+6vrtoyaGy
 5xVmUOuerxLVWASbltXa4kMFmXTwckiw+dW6hmMzOdB/P6s4VgwcW+hJObtRQdoNuLG4
 OiIbO+Ae757Uw9/9jPS3G+ZJT1DeYCWo7vXXQl1UaGlMOq5jwdNZuKfgz8VG0LatfZsc
 BtmTwRWewPKaw5Gj3ak0a9SFf3WY6jm4uRydCBo7ONIV/TeVBlkXGpJrsvxksFx6Mh4y
 J6Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bdvS3ImXktegIGIUSt7DM4X3H//vtPG1T5XbtOqEIxE=;
 b=ugZrmzIhPDaiccD0CILAvIO9k7vx1rqqukTWyhKdpWmR7uuUJB0g/qoChorFXgsrVZ
 YlaXErADNNWDGH7Oh06Xe5WARi7l755ain+PD6vCh6YxIwe8xu8uiBE66Z+dUZ+j2spm
 RyNBc0z9A53OKsM6y/u8O+t8U8nNXZ0jXAr7aIj3KT2uqyxN0naGaNEQ1d4Qe6I/+9WI
 zrCBKpYGQ+2qfTARNwSGSo0hU+nMPU+7i5K/RuQjtv8gxaDUIoFcshS4ldSVX3O6Y5Q+
 3dpdB8WofLqVJKQlYMXSGbFhorRyOv6AKZT+r7He4Kpa6D3I5Yj07rjxzxFrIJgq5A4p
 +97Q==
X-Gm-Message-State: AGi0PuZkkqA7jhIieA5aTXkwk+05xHXL8Pt63phQ/h6qChyMB909VKMt
 8zanPJ/0BCef409yV3oeG12d7Vf3mK4=
X-Google-Smtp-Source: APiQypIjFwaw5F3CH133qsTVtPyL2XcdUIhQdqvu9Da4WywKjh+qJ7nnuc1kM1SSwgc9X3T8sZQNXw==
X-Received: by 2002:a17:90a:e387:: with SMTP id
 b7mr3168370pjz.93.1586270826426; 
 Tue, 07 Apr 2020 07:47:06 -0700 (PDT)
Received: from hsinchu02.internal.sifive.com
 (220-132-236-182.HINET-IP.hinet.net. [220.132.236.182])
 by smtp.gmail.com with ESMTPSA id y15sm14190093pfc.206.2020.04.07.07.47.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Apr 2020 07:47:06 -0700 (PDT)
From: Zong Li <zong.li@sifive.com>
To: palmer@dabbelt.com, paul.walmsley@sifive.com, aou@eecs.berkeley.edu,
 mhiramat@kernel.org, linux-riscv@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH v4 4/9] riscv: add ARCH_HAS_SET_MEMORY support
Date: Tue,  7 Apr 2020 22:46:49 +0800
Message-Id: <783cadc46560fe173ac4900f36375b511185887e.1586265122.git.zong.li@sifive.com>
X-Mailer: git-send-email 2.26.0
In-Reply-To: <cover.1586265122.git.zong.li@sifive.com>
References: <cover.1586265122.git.zong.li@sifive.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200407_074708_046333_1BD728CB 
X-CRM114-Status: GOOD (  13.35  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>, Zong Li <zong.li@sifive.com>
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add set_memory_ro/rw/x/nx architecture hooks to change the page
attribution.

Use own set_memory.h rather than generic set_memory.h
(i.e. include/asm-generic/set_memory.h), because we want to add other
function prototypes here.

Signed-off-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Palmer Dabbelt <palmerdabbelt@google.com>
---
 arch/riscv/Kconfig                  |   1 +
 arch/riscv/include/asm/set_memory.h |  24 +++++
 arch/riscv/mm/Makefile              |   2 +-
 arch/riscv/mm/pageattr.c            | 150 ++++++++++++++++++++++++++++
 4 files changed, 176 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/set_memory.h
 create mode 100644 arch/riscv/mm/pageattr.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 39c93ddff0cb..9044e0dd95ea 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -59,6 +59,7 @@ config RISCV
 	select HAVE_EBPF_JIT if 64BIT
 	select EDAC_SUPPORT
 	select ARCH_HAS_GIGANTIC_PAGE
+	select ARCH_HAS_SET_MEMORY
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select SPARSEMEM_STATIC if 32BIT
 	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
diff --git a/arch/riscv/include/asm/set_memory.h b/arch/riscv/include/asm/set_memory.h
new file mode 100644
index 000000000000..79a810f0f38b
--- /dev/null
+++ b/arch/riscv/include/asm/set_memory.h
@@ -0,0 +1,24 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2019 SiFive
+ */
+
+#ifndef _ASM_RISCV_SET_MEMORY_H
+#define _ASM_RISCV_SET_MEMORY_H
+
+/*
+ * Functions to change memory attributes.
+ */
+#ifdef CONFIG_MMU
+int set_memory_ro(unsigned long addr, int numpages);
+int set_memory_rw(unsigned long addr, int numpages);
+int set_memory_x(unsigned long addr, int numpages);
+int set_memory_nx(unsigned long addr, int numpages);
+#else
+static inline int set_memory_ro(unsigned long addr, int numpages) { return 0; }
+static inline int set_memory_rw(unsigned long addr, int numpages) { return 0; }
+static inline int set_memory_x(unsigned long addr, int numpages) { return 0; }
+static inline int set_memory_nx(unsigned long addr, int numpages) { return 0; }
+#endif
+
+#endif /* _ASM_RISCV_SET_MEMORY_H */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 814e16a8d68a..363ef01c30b1 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -7,7 +7,7 @@ endif
 
 obj-y += init.o
 obj-y += extable.o
-obj-$(CONFIG_MMU) += fault.o
+obj-$(CONFIG_MMU) += fault.o pageattr.o
 obj-y += cacheflush.o
 obj-y += context.o
 
diff --git a/arch/riscv/mm/pageattr.c b/arch/riscv/mm/pageattr.c
new file mode 100644
index 000000000000..fcd59ef2835b
--- /dev/null
+++ b/arch/riscv/mm/pageattr.c
@@ -0,0 +1,150 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2019 SiFive
+ */
+
+#include <linux/pagewalk.h>
+#include <asm/pgtable.h>
+#include <asm/tlbflush.h>
+#include <asm/bitops.h>
+
+struct pageattr_masks {
+	pgprot_t set_mask;
+	pgprot_t clear_mask;
+};
+
+static unsigned long set_pageattr_masks(unsigned long val, struct mm_walk *walk)
+{
+	struct pageattr_masks *masks = walk->private;
+	unsigned long new_val = val;
+
+	new_val &= ~(pgprot_val(masks->clear_mask));
+	new_val |= (pgprot_val(masks->set_mask));
+
+	return new_val;
+}
+
+static int pageattr_pgd_entry(pgd_t *pgd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pgd_t val = READ_ONCE(*pgd);
+
+	if (pgd_leaf(val)) {
+		val = __pgd(set_pageattr_masks(pgd_val(val), walk));
+		set_pgd(pgd, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_p4d_entry(p4d_t *p4d, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	p4d_t val = READ_ONCE(*p4d);
+
+	if (p4d_leaf(val)) {
+		val = __p4d(set_pageattr_masks(p4d_val(val), walk));
+		set_p4d(p4d, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_pud_entry(pud_t *pud, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pud_t val = READ_ONCE(*pud);
+
+	if (pud_leaf(val)) {
+		val = __pud(set_pageattr_masks(pud_val(val), walk));
+		set_pud(pud, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_pmd_entry(pmd_t *pmd, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pmd_t val = READ_ONCE(*pmd);
+
+	if (pmd_leaf(val)) {
+		val = __pmd(set_pageattr_masks(pmd_val(val), walk));
+		set_pmd(pmd, val);
+	}
+
+	return 0;
+}
+
+static int pageattr_pte_entry(pte_t *pte, unsigned long addr,
+			      unsigned long next, struct mm_walk *walk)
+{
+	pte_t val = READ_ONCE(*pte);
+
+	val = __pte(set_pageattr_masks(pte_val(val), walk));
+	set_pte(pte, val);
+
+	return 0;
+}
+
+static int pageattr_pte_hole(unsigned long addr, unsigned long next,
+			     int depth, struct mm_walk *walk)
+{
+	/* Nothing to do here */
+	return 0;
+}
+
+const static struct mm_walk_ops pageattr_ops = {
+	.pgd_entry = pageattr_pgd_entry,
+	.p4d_entry = pageattr_p4d_entry,
+	.pud_entry = pageattr_pud_entry,
+	.pmd_entry = pageattr_pmd_entry,
+	.pte_entry = pageattr_pte_entry,
+	.pte_hole = pageattr_pte_hole,
+};
+
+static int __set_memory(unsigned long addr, int numpages, pgprot_t set_mask,
+			pgprot_t clear_mask)
+{
+	int ret;
+	unsigned long start = addr;
+	unsigned long end = start + PAGE_SIZE * numpages;
+	struct pageattr_masks masks = {
+		.set_mask = set_mask,
+		.clear_mask = clear_mask
+	};
+
+	if (!numpages)
+		return 0;
+
+	down_read(&init_mm.mmap_sem);
+	ret =  walk_page_range_novma(&init_mm, start, end, &pageattr_ops, NULL,
+				     &masks);
+	up_read(&init_mm.mmap_sem);
+
+	flush_tlb_kernel_range(start, end);
+
+	return ret;
+}
+
+int set_memory_ro(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_READ),
+			    __pgprot(_PAGE_WRITE));
+}
+
+int set_memory_rw(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_READ | _PAGE_WRITE),
+			    __pgprot(0));
+}
+
+int set_memory_x(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(_PAGE_EXEC), __pgprot(0));
+}
+
+int set_memory_nx(unsigned long addr, int numpages)
+{
+	return __set_memory(addr, numpages, __pgprot(0), __pgprot(_PAGE_EXEC));
+}
-- 
2.26.0


