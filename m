Return-Path: <SRS0=npS7=OR=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7A40C433EF
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:14:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 85E1E60F6B
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Sep 2021 11:14:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 85E1E60F6B
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tTDWQiQRNPYpidI5Y+A0QlPmh9ZcSWOxJ87kxXtrsbk=; b=vqdeH1r/rCLG4D
	uucH7HZiG9T5AifNGxEV6ihgekqA1zl/3vzzspwoA8tydKAxmjhuhMmuqIXN5cNjX2fnyf2pUKzPz
	jFew0KJIuDdhW8MrlldMtUPUKzdHfjECx7jqcPnw+wCXZ4SKsefbiP1j9P4YqoT9K/KZjv7rEtA6b
	uEurXzI3tLQp9ASNsFyg0FzKxh6bRZRPnzfZSZpnZaWEEWRTy6oAlmtNByxs8XlqwclkmLMk3Vlej
	pdh7Gov2BgD4Qet3aB02InNK7MWXQE2l2+KQ99e3aUUg6eTRyk80At/1J0H2xVUK7ahZkrMfei/Jd
	HNoUFh9Z+rYWoOKxuyxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mUoaA-002PTU-0j; Mon, 27 Sep 2021 11:14:02 +0000
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mUoa7-002PT2-18
 for linux-riscv@lists.infradead.org; Mon, 27 Sep 2021 11:14:00 +0000
Received: by mail-pf1-x443.google.com with SMTP id g2so11418791pfc.6
 for <linux-riscv@lists.infradead.org>; Mon, 27 Sep 2021 04:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=mnrf+Q0CQZ3IArFfmE9Op5GKTEhvNo2IzKK88RxVwEQ=;
 b=DwR6bfb15nqteSsivntCrx8/k2X87Ika+piCPufYuThWThoxDwh6LF2oNOOGvak8Al
 tosqnFRRRkXwmb+HVNHw/CL5cQcaz7U4NQbDckPqlLWWy99QaZZjYmSm1G0yYy8duwvg
 2+7Vuvdi1GcmHNB5chVUUYFCOYmHOd3tzh86Ht+D+Ai37CAR22LKHMgQoRngHUfOMH/i
 n7yNFZXiWWIv2FtL4ddtg5oNja6R8RSP3HG78fHmEt6lRgpSlI0ZkIsaXLNR5jDN2M3U
 XYXj8bffQFaLima/ulzY5ZId19makCFaFYMmZTQR7LxAY7mqZTM9C0ObH5iu6K5B5ZnJ
 PEYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=mnrf+Q0CQZ3IArFfmE9Op5GKTEhvNo2IzKK88RxVwEQ=;
 b=nwbOL4HCcygRwd6U5zqx18PEzExSJw9G2T1/Bxy5SENIAkvX1kYTVQ+oIajm6NO3B0
 3NU6VfPWvcgr1V8tr4OIGYJTd2ubDJxCi4zpvecz4Lx0dAMX2VNsMh+EICMIMwdKPhh0
 zjwCXdmOFHqkzT8QrbzqRWqYs3BKSM5BGmij8XLCUTrgNrAwQweJQqsAWWNkeLPndu9+
 bsdzqzyQmKX1/SfvdKImLsGKeqBVsBEuhnHwi9SphG+uRhiHwwZIfqvnfJf2n4aG42GE
 ASeUAVNPeNpNwsxq0qt7w/S2GAcim8XUzcGZpIP/zjsfFxJCfLL6syTMV4L0cMXhmRh8
 N43Q==
X-Gm-Message-State: AOAM531OBD8e2bd61JFg01/IFzt79/uJFQmO+21zoKD/2rA+0lisLsZy
 kzO7QsB0nfyOXvYEASwklAc=
X-Google-Smtp-Source: ABdhPJzAYE8WvS5EX9DGu9QdWc2Ec1R/52AWeebUEsa5MV00l1IM+hIixKOMxNyb5Vpkzaes5eb7Ow==
X-Received: by 2002:a62:31c5:0:b0:447:b30c:9a79 with SMTP id
 x188-20020a6231c5000000b00447b30c9a79mr23016487pfx.67.1632741237886; 
 Mon, 27 Sep 2021 04:13:57 -0700 (PDT)
Received: from localhost.localdomain ([153.37.224.179])
 by smtp.gmail.com with ESMTPSA id b2sm17139686pfr.58.2021.09.27.04.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 04:13:57 -0700 (PDT)
From: Jinli Zheng <zhengdbu@gmail.com>
To: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com, aou@eecs.berkeley.edu, anup.patel@wdc.com,
 sunnanyong@huawei.com, alex@ghiti.fr, jszhang@kernel.org,
 penberg@kernel.org, guoren@linux.alibaba.com, zhengdbu@gmail.com,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] Add support for mm->mmap_legacy_base in legacy layout
Date: Mon, 27 Sep 2021 19:11:50 +0800
Message-Id: <20210927111150.3518-1-zhengdbu@gmail.com>
X-Mailer: git-send-email 2.17.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210927_041359_104650_536D162E 
X-CRM114-Status: GOOD (  20.65  )
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

Add support for mm->mmap_legacy_base in the legacy layout
of the process memory space for the riscv architecture

Signed-off-by: Jinli Zheng <zhengdbu@gmail.com>
---
 arch/riscv/Kconfig                 |   2 +-
 arch/riscv/include/asm/pgtable.h   |   3 +
 arch/riscv/include/asm/processor.h |   1 +
 arch/riscv/mm/Makefile             |   2 +-
 arch/riscv/mm/mmap.c               | 165 +++++++++++++++++++++++++++++
 5 files changed, 171 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/mm/mmap.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 301a54233c7e..e64231592227 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -37,7 +37,7 @@ config RISCV
 	select ARCH_SUPPORTS_DEBUG_PAGEALLOC if MMU
 	select ARCH_SUPPORTS_HUGETLBFS if MMU
 	select ARCH_USE_MEMTEST
-	select ARCH_WANT_DEFAULT_TOPDOWN_MMAP_LAYOUT if MMU
+	select ARCH_HAS_ELF_RANDOMIZE
 	select ARCH_WANT_FRAME_POINTERS
 	select ARCH_WANT_HUGE_PMD_SHARE if 64BIT
 	select BINFMT_FLAT_NO_DATA_START_OFFSET if !MMU
diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 39b550310ec6..107d61371272 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -700,6 +700,9 @@ void misc_mem_init(void);
 extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define ZERO_PAGE(vaddr) (virt_to_page(empty_zero_page))
 
+#define HAVE_ARCH_UNMAPPED_AREA
+#define HAVE_ARCH_UNMAPPED_AREA_TOPDOWN
+
 #endif /* !__ASSEMBLY__ */
 
 #endif /* _ASM_RISCV_PGTABLE_H */
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 46b492c78cbb..e7dc7c1f820a 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -56,6 +56,7 @@ static inline void arch_thread_struct_whitelist(unsigned long *offset,
 #define KSTK_EIP(tsk)		(task_pt_regs(tsk)->epc)
 #define KSTK_ESP(tsk)		(task_pt_regs(tsk)->sp)
 
+#define HAVE_ARCH_PICK_MMAP_LAYOUT	1
 
 /* Do necessary setup to start up a newly executed thread. */
 extern void start_thread(struct pt_regs *regs,
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 7ebaef10ea1b..123c67a2c24a 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -10,7 +10,7 @@ KCOV_INSTRUMENT_init.o := n
 
 obj-y += init.o
 obj-y += extable.o
-obj-$(CONFIG_MMU) += fault.o pageattr.o
+obj-$(CONFIG_MMU) += fault.o pageattr.o mmap.o
 obj-y += cacheflush.o
 obj-y += context.o
 
diff --git a/arch/riscv/mm/mmap.c b/arch/riscv/mm/mmap.c
new file mode 100644
index 000000000000..6c5818db5a65
--- /dev/null
+++ b/arch/riscv/mm/mmap.c
@@ -0,0 +1,165 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Legacy and flexible mmap layout support
+ *
+ * Copyright (C) 2021 Jinli Zheng <zhengdbu@gmail.com>
+ */
+
+#include <linux/personality.h>
+#include <linux/mm.h>
+#include <linux/mman.h>
+#include <linux/random.h>
+#include <linux/limits.h>
+#include <linux/security.h>
+#include <linux/compat.h>
+#include <linux/sched/mm.h>
+#include <linux/sched.h>
+#include <linux/elf-randomize.h>
+#include <asm/pgtable.h>
+#include <asm/processor.h>
+
+#define SIZE_128M	(128*1024*1024UL)
+
+/*gap between MMAP and STACK*/
+#define GAP_MIN		SIZE_128M
+#define GAP_MAX		(((TASK_SIZE)/6)*5)
+
+static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
+{
+	unsigned long gap = rlim_stack->rlim_cur;
+
+	if (gap < GAP_MIN)
+		gap = GAP_MIN;
+	else if (gap > GAP_MAX)
+		gap = GAP_MAX;
+
+	return PAGE_ALIGN(TASK_SIZE - gap - rnd);
+}
+
+unsigned long arch_get_unmapped_area(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	struct vm_unmapped_area_info info;
+
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	if (addr) {
+		addr = PAGE_ALIGN(addr);
+		vma = find_vma_prev(mm, addr, &prev);
+		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
+		     (!vma || addr + len <= vm_start_gap(vma)) &&
+		     (!prev || addr >= vm_end_gap(prev)))
+			return addr;
+	}
+
+	info.flags = 0;
+	info.length = len;
+	info.low_limit = mm->mmap_legacy_base;
+	info.high_limit = TASK_SIZE;
+	info.align_mask = 0;
+	info.align_offset = 0;
+	return vm_unmapped_area(&info);
+}
+
+unsigned long arch_get_unmapped_area_topdown(struct file *filp, unsigned long addr,
+		unsigned long len, unsigned long pgoff, unsigned long flags)
+{
+	struct mm_struct *mm = current->mm;
+	struct vm_area_struct *vma, *prev;
+	struct vm_unmapped_area_info info;
+
+	if (len > TASK_SIZE)
+		return -ENOMEM;
+
+	if (flags & MAP_FIXED)
+		return addr;
+
+	if (addr) {
+		addr = PAGE_ALIGN(addr);
+		vma = find_vma_prev(mm, addr, &prev);
+		if (TASK_SIZE - len >= addr && addr >= mmap_min_addr &&
+		     (!vma || addr + len <= vm_start_gap(vma)) &&
+		     (!prev || addr >= vm_end_gap(prev)))
+			return addr;
+	}
+
+	info.flags = VM_UNMAPPED_AREA_TOPDOWN;
+	info.length = len;
+	info.low_limit = max(PAGE_SIZE, mmap_min_addr);
+	info.high_limit = mm->mmap_base;
+	info.align_mask = 0;
+	info.align_offset = 0;
+	addr = vm_unmapped_area(&info);
+
+	if (offset_in_page(addr)) {
+		VM_BUG_ON(addr != -ENOMEM);
+		info.flags = 0;
+		info.low_limit = TASK_UNMAPPED_BASE;
+		info.high_limit = TASK_SIZE;
+		addr = vm_unmapped_area(&info);
+	}
+
+	return addr;
+}
+
+unsigned long arch_mmap_rnd(void)
+{
+	unsigned long rnd;
+
+#ifdef CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS
+	if (is_compat_task())
+		rnd = get_random_int() & ((1UL << mmap_rnd_compat_bits) - 1);
+	else
+#endif /*CONFIG_HAVE_ARCH_MMAP_RND_COMPAT_BITS*/
+		rnd = get_random_int() & ((1UL << mmap_rnd_bits) - 1);
+
+	return rnd << PAGE_SHIFT;
+}
+
+static int mmap_is_legacy(struct rlimit *rlim_stack)
+{
+	if (current->personality & ADDR_COMPAT_LAYOUT)
+		return 1;
+
+	if (rlim_stack->rlim_cur == RLIM_INFINITY)
+		return 1;
+
+	return sysctl_legacy_va_layout;
+}
+
+static void arch_pick_mmap_base(struct mm_struct *mm, struct rlimit *rlim_stack)
+{
+	unsigned long random;
+
+	random = (current->flags & PF_RANDOMIZE) ?
+		arch_mmap_rnd() : 0UL;
+
+	if (mmap_is_legacy(rlim_stack))
+		mm->mmap_legacy_base = TASK_UNMAPPED_BASE + random;
+	else
+		mm->mmap_base = mmap_base(random, rlim_stack);
+}
+
+void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+{
+	if (mmap_is_legacy(rlim_stack))
+		mm->get_unmapped_area = arch_get_unmapped_area;
+	else
+		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
+
+	arch_pick_mmap_base(mm, rlim_stack);
+}
+
+unsigned long arch_randomize_brk(struct mm_struct *mm)
+{
+	if (!IS_ENABLED(CONFIG_64BIT) || is_compat_task())
+		return randomize_page(mm->brk, SZ_32M);
+
+	return randomize_page(mm->brk, SZ_1G);
+}
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
