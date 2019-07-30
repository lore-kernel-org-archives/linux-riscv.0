Return-Path: <SRS0=qfeT=V3=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EE5EC0650F
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 05:53:01 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 4575F20882
	for <infradead-linux-riscv@archiver.kernel.org>; Tue, 30 Jul 2019 05:53:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="JjxFGGMA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4575F20882
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=ghiti.fr
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MFeHNZMoZjixnDOWoKxVYRRRGpHb/1f2G1/RRew5zQM=; b=JjxFGGMA1Z9U7P
	tdT+8EuDIgOEQaG0ElehJDvmD/AfHnXDMVbHbFYIfwJFgcKuo0wuW0yMGiFPyDN5AXh1IpIR7ihQ2
	m9xYc2g/3EmG2YJm0rLRlseY6SMXRhXhwBJ3ZXvmlJJTky8MWZy1ztqjm2KqRFkr8RQ9IG9iWSO1c
	bqBPai7Dx6q2fz7mxtkDbdv+barwe8RlP98CeFXTV7R1PPzXi5CK1QPCLWe6S7MWVWx7eIv7nq/Ch
	helEzFlVSd1pPOxmUGGEQ/yayq9Ui7ku9qCJ2kXvMIvpIxm1j9xBWweK0WHyKcdfei163ysiP5A1g
	mZuWsKuiW+/oTiQa1vvA==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hsL4B-0001a0-LP; Tue, 30 Jul 2019 05:52:55 +0000
Received: from relay8-d.mail.gandi.net ([217.70.183.201])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3t-0001K3-OA; Tue, 30 Jul 2019 05:52:39 +0000
X-Originating-IP: 79.86.19.127
Received: from alex.numericable.fr (127.19.86.79.rev.sfr.net [79.86.19.127])
 (Authenticated sender: alex@ghiti.fr)
 by relay8-d.mail.gandi.net (Postfix) with ESMTPSA id C4A9E1BF20E;
 Tue, 30 Jul 2019 05:52:31 +0000 (UTC)
From: Alexandre Ghiti <alex@ghiti.fr>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v5 01/14] mm, fs: Move randomize_stack_top from fs to mm
Date: Tue, 30 Jul 2019 01:51:00 -0400
Message-Id: <20190730055113.23635-2-alex@ghiti.fr>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730055113.23635-1-alex@ghiti.fr>
References: <20190730055113.23635-1-alex@ghiti.fr>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190729_225238_097752_7C784486 
X-CRM114-Status: GOOD (  12.74  )
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
Cc: Albert Ou <aou@eecs.berkeley.edu>, Kees Cook <keescook@chromium.org>,
 Alexandre Ghiti <alex@ghiti.fr>, Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@sifive.com>, Will Deacon <will.deacon@arm.com>,
 Russell King <linux@armlinux.org.uk>, Ralf Baechle <ralf@linux-mips.org>,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Luis Chamberlain <mcgrof@kernel.org>, Paul Burton <paul.burton@mips.com>,
 James Hogan <jhogan@kernel.org>, linux-fsdevel@vger.kernel.org,
 linux-riscv@lists.infradead.org, linux-mips@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-arm-kernel@lists.infradead.org,
 Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This preparatory commit moves this function so that further introduction
of generic topdown mmap layout is contained only in mm/util.c.

Signed-off-by: Alexandre Ghiti <alex@ghiti.fr>
Acked-by: Kees Cook <keescook@chromium.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: Luis Chamberlain <mcgrof@kernel.org>
---
 fs/binfmt_elf.c    | 20 --------------------
 include/linux/mm.h |  2 ++
 mm/util.c          | 22 ++++++++++++++++++++++
 3 files changed, 24 insertions(+), 20 deletions(-)

diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index d4e11b2e04f6..cec3b4146440 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -670,26 +670,6 @@ static unsigned long load_elf_interp(struct elfhdr *interp_elf_ex,
  * libraries.  There is no binary dependent code anywhere else.
  */
 
-#ifndef STACK_RND_MASK
-#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))	/* 8MB of VA */
-#endif
-
-static unsigned long randomize_stack_top(unsigned long stack_top)
-{
-	unsigned long random_variable = 0;
-
-	if (current->flags & PF_RANDOMIZE) {
-		random_variable = get_random_long();
-		random_variable &= STACK_RND_MASK;
-		random_variable <<= PAGE_SHIFT;
-	}
-#ifdef CONFIG_STACK_GROWSUP
-	return PAGE_ALIGN(stack_top) + random_variable;
-#else
-	return PAGE_ALIGN(stack_top) - random_variable;
-#endif
-}
-
 static int load_elf_binary(struct linux_binprm *bprm)
 {
 	struct file *interpreter = NULL; /* to shut gcc up */
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0334ca97c584..ae0e5d241eb8 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2351,6 +2351,8 @@ extern int install_special_mapping(struct mm_struct *mm,
 				   unsigned long addr, unsigned long len,
 				   unsigned long flags, struct page **pages);
 
+unsigned long randomize_stack_top(unsigned long stack_top);
+
 extern unsigned long get_unmapped_area(struct file *, unsigned long, unsigned long, unsigned long, unsigned long);
 
 extern unsigned long mmap_region(struct file *file, unsigned long addr,
diff --git a/mm/util.c b/mm/util.c
index e6351a80f248..15a4fb0f5473 100644
--- a/mm/util.c
+++ b/mm/util.c
@@ -16,6 +16,8 @@
 #include <linux/hugetlb.h>
 #include <linux/vmalloc.h>
 #include <linux/userfaultfd_k.h>
+#include <linux/elf.h>
+#include <linux/random.h>
 
 #include <linux/uaccess.h>
 
@@ -293,6 +295,26 @@ int vma_is_stack_for_current(struct vm_area_struct *vma)
 	return (vma->vm_start <= KSTK_ESP(t) && vma->vm_end >= KSTK_ESP(t));
 }
 
+#ifndef STACK_RND_MASK
+#define STACK_RND_MASK (0x7ff >> (PAGE_SHIFT - 12))     /* 8MB of VA */
+#endif
+
+unsigned long randomize_stack_top(unsigned long stack_top)
+{
+	unsigned long random_variable = 0;
+
+	if (current->flags & PF_RANDOMIZE) {
+		random_variable = get_random_long();
+		random_variable &= STACK_RND_MASK;
+		random_variable <<= PAGE_SHIFT;
+	}
+#ifdef CONFIG_STACK_GROWSUP
+	return PAGE_ALIGN(stack_top) + random_variable;
+#else
+	return PAGE_ALIGN(stack_top) - random_variable;
+#endif
+}
+
 #if defined(CONFIG_MMU) && !defined(HAVE_ARCH_PICK_MMAP_LAYOUT)
 void arch_pick_mmap_layout(struct mm_struct *mm, struct rlimit *rlim_stack)
 {
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
