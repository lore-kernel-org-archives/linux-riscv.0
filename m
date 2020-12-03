Return-Path: <SRS0=jyWZ=FH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6869C63777
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 06:33:02 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 705BC2067D
	for <linux-riscv@archiver.kernel.org>; Thu,  3 Dec 2020 06:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 705BC2067D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=Fo0OYVX3o56903MxKIIHptxoZ07mJLv+CfqkN0G+Oa0=; b=DzbHIGB/oc/qSkQ+j0g9W2El6
	A/xu/gSi6SwZcwBZIhwkGH8ZlFSqqJfwy/NkGwLhCCVBkVOWp82HoBjItkgMDjJ7g3vcYr4NeU34V
	GOG4c8/XfLfgRd+VFZeaM4yU/QhjfOkNPs79iOTwKt6lz2CBXOwuc5H4wpWPecFVeUDv/rawzdqq7
	UaFnwNJ1R+mLYo8FgWeWWYkhxe6qtk7DHIiCWV/F7hH79XCY48s9OroXevLl/d9tDKjGBQzrguNVX
	XnGW0+RgWGQdxKJqbZMlNoWP1AMThv+JE0nvN8zdQmp3y1rfHCsk0EWm1Us854AtiAU2JY/fmMjMi
	bb6bkIRQg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kkiAg-0005qI-Q1; Thu, 03 Dec 2020 06:32:54 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kki9Q-0004zE-Jq; Thu, 03 Dec 2020 06:31:40 +0000
From: Mike Rapoport <rppt@kernel.org>
Authentication-Results: mail.kernel.org;
 dkim=permerror (bad message/signature format)
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v14 08/10] PM: hibernate: disable when there are active
 secretmem users
Date: Thu,  3 Dec 2020 08:29:47 +0200
Message-Id: <20201203062949.5484-9-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201203062949.5484-1-rppt@kernel.org>
References: <20201203062949.5484-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201203_013137_023242_80A92406 
X-CRM114-Status: GOOD (  16.53  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, David Hildenbrand <david@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, linux-mm@kvack.org,
 linux-kselftest@vger.kernel.org, "H. Peter Anvin" <hpa@zytor.com>,
 Christopher Lameter <cl@linux.com>, Shuah Khan <shuah@kernel.org>,
 Thomas Gleixner <tglx@linutronix.de>,
 Elena Reshetova <elena.reshetova@intel.com>, linux-arch@vger.kernel.org,
 Tycho Andersen <tycho@tycho.ws>, linux-nvdimm@lists.01.org,
 Will Deacon <will@kernel.org>, x86@kernel.org,
 Matthew Wilcox <willy@infradead.org>, Mike Rapoport <rppt@linux.ibm.com>,
 Ingo Molnar <mingo@redhat.com>, Michael Kerrisk <mtk.manpages@gmail.com>,
 Arnd Bergmann <arnd@arndb.de>, James Bottomley <jejb@linux.ibm.com>,
 Borislav Petkov <bp@alien8.de>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Andy Lutomirski <luto@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
 "Kirill A. Shutemov" <kirill@shutemov.name>,
 Dan Williams <dan.j.williams@intel.com>, linux-arm-kernel@lists.infradead.org,
 linux-api@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-fsdevel@vger.kernel.org, Shakeel Butt <shakeelb@google.com>,
 Rick Edgecombe <rick.p.edgecombe@intel.com>, Roman Gushchin <guro@fb.com>,
 Mike Rapoport <rppt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Mike Rapoport <rppt@linux.ibm.com>

It is unsafe to allow saving of secretmem areas to the hibernation snapshot
as they would be visible after the resume and this essentially will defeat
the purpose of secret memory mappings.

Prevent hibernation whenever there are active secret memory users.

Signed-off-by: Mike Rapoport <rppt@linux.ibm.com>
---
 include/linux/secretmem.h |  6 ++++++
 kernel/power/hibernate.c  |  5 ++++-
 mm/secretmem.c            | 15 +++++++++++++++
 3 files changed, 25 insertions(+), 1 deletion(-)

diff --git a/include/linux/secretmem.h b/include/linux/secretmem.h
index 70e7db9f94fe..907a6734059c 100644
--- a/include/linux/secretmem.h
+++ b/include/linux/secretmem.h
@@ -6,6 +6,7 @@
 
 bool vma_is_secretmem(struct vm_area_struct *vma);
 bool page_is_secretmem(struct page *page);
+bool secretmem_active(void);
 
 #else
 
@@ -19,6 +20,11 @@ static inline bool page_is_secretmem(struct page *page)
 	return false;
 }
 
+static inline bool secretmem_active(void)
+{
+	return false;
+}
+
 #endif /* CONFIG_SECRETMEM */
 
 #endif /* _LINUX_SECRETMEM_H */
diff --git a/kernel/power/hibernate.c b/kernel/power/hibernate.c
index da0b41914177..559acef3fddb 100644
--- a/kernel/power/hibernate.c
+++ b/kernel/power/hibernate.c
@@ -31,6 +31,7 @@
 #include <linux/genhd.h>
 #include <linux/ktime.h>
 #include <linux/security.h>
+#include <linux/secretmem.h>
 #include <trace/events/power.h>
 
 #include "power.h"
@@ -81,7 +82,9 @@ void hibernate_release(void)
 
 bool hibernation_available(void)
 {
-	return nohibernate == 0 && !security_locked_down(LOCKDOWN_HIBERNATION);
+	return nohibernate == 0 &&
+		!security_locked_down(LOCKDOWN_HIBERNATION) &&
+		!secretmem_active();
 }
 
 /**
diff --git a/mm/secretmem.c b/mm/secretmem.c
index 2390901d3ff7..7236f4d9458a 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -45,6 +45,13 @@ struct secretmem_ctx {
 
 static struct cma *secretmem_cma;
 
+static atomic_t secretmem_users;
+
+bool secretmem_active(void)
+{
+	return !!atomic_read(&secretmem_users);
+}
+
 static int secretmem_account_pages(struct page *page, gfp_t gfp, int order)
 {
 	int err;
@@ -179,6 +186,12 @@ static const struct vm_operations_struct secretmem_vm_ops = {
 	.fault = secretmem_fault,
 };
 
+static int secretmem_release(struct inode *inode, struct file *file)
+{
+	atomic_dec(&secretmem_users);
+	return 0;
+}
+
 static int secretmem_mmap(struct file *file, struct vm_area_struct *vma)
 {
 	unsigned long len = vma->vm_end - vma->vm_start;
@@ -201,6 +214,7 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
 }
 
 static const struct file_operations secretmem_fops = {
+	.release	= secretmem_release,
 	.mmap		= secretmem_mmap,
 };
 
@@ -318,6 +332,7 @@ SYSCALL_DEFINE1(memfd_secret, unsigned long, flags)
 	file->f_flags |= O_LARGEFILE;
 
 	fd_install(fd, file);
+	atomic_inc(&secretmem_users);
 	return fd;
 
 err_put_fd:
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
