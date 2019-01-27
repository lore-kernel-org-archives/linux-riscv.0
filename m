Return-Path: <SRS0=74fC=QD=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 802CAC282CA
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Jan 2019 16:54:12 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C7A72148D
	for <infradead-linux-riscv@archiver.kernel.org>; Sun, 27 Jan 2019 16:54:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="kVDioKzd"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C7A72148D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=hqfh56JVhUtvGQAkFBGvKonXmAwHnG7Sa2JUljUNEyI=; b=kVDioKzdwmUUJ7
	C6/aEWJo7NihFkehsmReMkblFO1GksJNQ4pJBj4dizYwbihfvD/3VVDXyYwn82rOathKyWf512rLq
	Z8sVPeQXHpEyDnps+oKnbvbt1Pylj0SDF7/AFKC7zDM7BW9x2FZAOhuIYwef1oX9PfbKlId57m3wO
	pEChqoSGSxSG765ipEnzImra8wYmprN/rhPZE3y7WisBia5CBnD+KglLbQ0xkIF2HZSs2oT8Th98N
	SHaUhwYQIdjZv+nbqxd6P1lSALKA5uoEwWFkwex4yF8rSoKFVDfgFqhJ9+rNeNP0np3R8OjuFIssa
	fDYDl3nP8WcCLopXOD4A==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gnnhB-0003C3-Rb; Sun, 27 Jan 2019 16:54:09 +0000
Received: from relay1-d.mail.gandi.net ([217.70.183.193])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gnnh7-0003BO-GI
 for linux-riscv@lists.infradead.org; Sun, 27 Jan 2019 16:54:07 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 80F3E240006;
 Sun, 27 Jan 2019 16:53:53 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Palmer Dabbelt <palmer@sifive.com>, Albert Ou <aou@eecs.berkeley.edu>,
 hch@infradead.org, linux-riscv@lists.infradead.org
Subject: [PATCH] riscv: Make mmap allocation top-down by default
Date: Sun, 27 Jan 2019 11:53:48 -0500
Message-Id: <20190127165348.16183-1-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190127_085405_844656_2AE662C1 
X-CRM114-Status: GOOD (  12.91  )
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
Cc: Alexandre Ghiti <alex@ghiti.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

In order to avoid wasting user address space by using bottom-up mmap
allocation scheme, prefer top-down scheme when possible.

This patch is based on arm64 implementation.

Before:

root@qemuriscv64:~# cat /proc/176/maps
00010000-000be000 r-xp 00000000 fe:00 6355     /bin/bash.bash
000be000-000bf000 r--p 000ad000 fe:00 6355     /bin/bash.bash
000bf000-000c8000 rw-p 000ae000 fe:00 6355     /bin/bash.bash
000c8000-00114000 rw-p 00000000 00:00 0        [heap]
2000000000-2000017000 r-xp 00000000 fe:00 7193 /lib/ld-2.28.so
2000017000-2000018000 r--p 00016000 fe:00 7193 /lib/ld-2.28.so
2000018000-2000019000 rw-p 00017000 fe:00 7193 /lib/ld-2.28.so
2000019000-200001a000 rw-p 00000000 00:00 0
200001a000-200001c000 r-xp 00000000 00:00 0    [vdso]
200001e000-2000020000 rw-p 00000000 00:00 0
2000020000-2000041000 r-xp 00000000 fe:00 7176 /lib/libtinfo.so.5.9
2000041000-2000045000 r--p 00020000 fe:00 7176 /lib/libtinfo.so.5.9
2000045000-2000046000 rw-p 00024000 fe:00 7176 /lib/libtinfo.so.5.9
2000046000-2000048000 r-xp 00000000 fe:00 7112 /lib/libdl-2.28.so
2000048000-2000049000 r--p 00001000 fe:00 7112 /lib/libdl-2.28.so
2000049000-200004a000 rw-p 00002000 fe:00 7112 /lib/libdl-2.28.so
200004a000-2000148000 r-xp 00000000 fe:00 7187 /lib/libc-2.28.so
2000148000-200014c000 r--p 000fd000 fe:00 7187 /lib/libc-2.28.so
200014c000-200014e000 rw-p 00101000 fe:00 7187 /lib/libc-2.28.so
200014e000-2000154000 rw-p 00000000 00:00 0
2000154000-2000159000 r-xp 00000000 fe:00 7100 /lib/libnss_compat-2.28.so
2000159000-200015a000 r--p 00004000 fe:00 7100 /lib/libnss_compat-2.28.so
200015a000-200015b000 rw-p 00005000 fe:00 7100 /lib/libnss_compat-2.28.so
3fff9a4000-3fff9c5000 rw-p 00000000 00:00 0    [stack]

After:

root@qemuriscv64:~# cat /proc/173/maps
00010000-000be000 r-xp 00000000 fe:00 6355     /bin/bash.bash
000be000-000bf000 r--p 000ad000 fe:00 6355     /bin/bash.bash
000bf000-000c8000 rw-p 000ae000 fe:00 6355     /bin/bash.bash
000c8000-00114000 rw-p 00000000 00:00 0        [heap]
3fdd8d0000-3fdd8d5000 r-xp 00000000 fe:00 7100 /lib/libnss_compat-2.28.so
3fdd8d5000-3fdd8d6000 r--p 00004000 fe:00 7100 /lib/libnss_compat-2.28.so
3fdd8d6000-3fdd8d7000 rw-p 00005000 fe:00 7100 /lib/libnss_compat-2.28.so
3fdd8d7000-3fdd8d9000 rw-p 00000000 00:00 0
3fdd8d9000-3fdd9d7000 r-xp 00000000 fe:00 7187 /lib/libc-2.28.so
3fdd9d7000-3fdd9db000 r--p 000fd000 fe:00 7187 /lib/libc-2.28.so
3fdd9db000-3fdd9dd000 rw-p 00101000 fe:00 7187 /lib/libc-2.28.so
3fdd9dd000-3fdd9e1000 rw-p 00000000 00:00 0
3fdd9e1000-3fdd9e3000 r-xp 00000000 fe:00 7112 /lib/libdl-2.28.so
3fdd9e3000-3fdd9e4000 r--p 00001000 fe:00 7112 /lib/libdl-2.28.so
3fdd9e4000-3fdd9e5000 rw-p 00002000 fe:00 7112 /lib/libdl-2.28.so
3fdd9e5000-3fdda06000 r-xp 00000000 fe:00 7176 /lib/libtinfo.so.5.9
3fdda06000-3fdda0a000 r--p 00020000 fe:00 7176 /lib/libtinfo.so.5.9
3fdda0a000-3fdda0b000 rw-p 00024000 fe:00 7176 /lib/libtinfo.so.5.9
3fdda0b000-3fdda0d000 rw-p 00000000 00:00 0
3fdda0f000-3fdda11000 r-xp 00000000 00:00 0    [vdso]
3fdda11000-3fdda28000 r-xp 00000000 fe:00 7193 /lib/ld-2.28.so
3fdda28000-3fdda29000 r--p 00016000 fe:00 7193 /lib/ld-2.28.so
3fdda29000-3fdda2a000 rw-p 00017000 fe:00 7193 /lib/ld-2.28.so
3fdda2a000-3fdda2b000 rw-p 00000000 00:00 0
3ffff8e000-3ffffaf000 rw-p 00000000 00:00 0    [stack]

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
---
 arch/riscv/Kconfig                 | 12 ++++++
 arch/riscv/include/asm/processor.h |  1 +
 arch/riscv/mm/Makefile             |  1 +
 arch/riscv/mm/mmap.c               | 69 ++++++++++++++++++++++++++++++
 4 files changed, 83 insertions(+)
 create mode 100644 arch/riscv/mm/mmap.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index e0d7d61779a6..684f3e00e9f8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -47,6 +47,18 @@ config RISCV
 	select GENERIC_IRQ_MULTI_HANDLER
 	select ARCH_HAS_PTE_SPECIAL
 
+config HAVE_ARCH_MMAP_RND_BITS
+	def_bool y
+
+config ARCH_MMAP_RND_BITS_MIN
+	default 18
+
+# max bits determined by the following formula:
+#  VA_BITS - PAGE_SHIFT - 3
+config ARCH_MMAP_RND_BITS_MAX
+	default 33 if 64BIT # SV48 based
+	default 18
+
 config MMU
 	def_bool y
 
diff --git a/arch/riscv/include/asm/processor.h b/arch/riscv/include/asm/processor.h
index 0531f49af5c3..5ea9119f173c 100644
--- a/arch/riscv/include/asm/processor.h
+++ b/arch/riscv/include/asm/processor.h
@@ -23,6 +23,7 @@
  * space during mmap's.
  */
 #define TASK_UNMAPPED_BASE	PAGE_ALIGN(TASK_SIZE >> 1)
+#define HAVE_ARCH_PICK_MMAP_LAYOUT
 
 #define STACK_TOP		TASK_SIZE
 #define STACK_TOP_MAX		STACK_TOP
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index eb22ab49b3e0..0eb23b10d0bd 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -3,3 +3,4 @@ obj-y += fault.o
 obj-y += extable.o
 obj-y += ioremap.o
 obj-y += cacheflush.o
+obj-y += mmap.o
diff --git a/arch/riscv/mm/mmap.c b/arch/riscv/mm/mmap.c
new file mode 100644
index 000000000000..d182ac66d2e7
--- /dev/null
+++ b/arch/riscv/mm/mmap.c
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: GPL-2.0
+#include <linux/mm.h>
+#include <linux/sched/mm.h>
+#include <linux/sizes.h>
+#include <linux/personality.h>
+#include <linux/random.h>
+
+/*
+ * Leave enough space between the mmap area and the stack to honour ulimit in
+ * the face of randomisation.
+ */
+#define MIN_GAP (SZ_128M)
+#define MAX_GAP	(TASK_SIZE / 6 * 5)
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
+static unsigned long arch_mmap_rnd(void)
+{
+	unsigned long rnd;
+
+	rnd = get_random_long() & ((1UL << mmap_rnd_bits) - 1);
+
+	return rnd << PAGE_SHIFT;
+}
+
+static unsigned long mmap_base(unsigned long rnd, struct rlimit *rlim_stack)
+{
+	unsigned long gap = rlim_stack->rlim_cur;
+
+	if (gap < MIN_GAP)
+		gap = MIN_GAP;
+	else if (gap > MAX_GAP)
+		gap = MAX_GAP;
+
+	return PAGE_ALIGN(TASK_SIZE - gap - rnd);
+}
+
+/*
+ * This function, called very early during the creation of a new process VM
+ * image, sets up which VM layout function to use:
+ */
+void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
+{
+	unsigned long random_factor = 0UL;
+
+	if (current->flags & PF_RANDOMIZE)
+		random_factor = arch_mmap_rnd();
+
+	/*
+	 * Fall back to the standard layout if the personality bit is set, or
+	 * if the expected stack growth is unlimited:
+	 */
+	if (mmap_is_legacy(rlim_stack)) {
+		mm->mmap_base = TASK_UNMAPPED_BASE + random_factor;
+		mm->get_unmapped_area = arch_get_unmapped_area;
+	} else {
+		mm->mmap_base = mmap_base(random_factor, rlim_stack);
+		mm->get_unmapped_area = arch_get_unmapped_area_topdown;
+	}
+}
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
