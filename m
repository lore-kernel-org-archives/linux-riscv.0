Return-Path: <SRS0=Zzcc=GX=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2505C433E6
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:09:54 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B294B233FE
	for <linux-riscv@archiver.kernel.org>; Wed, 20 Jan 2021 18:09:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B294B233FE
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=E5ExMJp1CCZzlmrTNQaYgzIfqc70gfbn7Z2+TgUOkFI=; b=di6pjmODR8mirOyK2BJTzP3xP
	VCzuq9pp+Lf1sKIPJ35Pt2K/GmZpSudBmCPHvi2Scvi4CHTod7K/Lzg+K5gRaz6s2U/svIGRs1PZ0
	JZ1zVIdnRdUUS90cmqtAU4rxPAbGnhhjkYWN02qF3LRBnaeePtLe2IWyeCB3XoCynAP1sAsqA5drX
	9ed5nV0hsG2b5948b7W90rcFcv0LeQyiSIEnW+Xsxax9hO0N75An0GuAd8/a0dFMuF6OfDH7m+u9Y
	pM77I9NOIvd62VKgghVbGlEW3fM1MO3Fw2jCS6++5ARwbcxA8YVtelbbduYOt76Lq7Xrl6UD4J0IL
	3yicT5hYg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l2HvE-00057P-Ob; Wed, 20 Jan 2021 18:09:36 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l2HtZ-0004LB-0s; Wed, 20 Jan 2021 18:08:01 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 3D9DB23432;
 Wed, 20 Jan 2021 18:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1611166072;
 bh=HiGIMYZfl0eE/GK9a4Kx5ARsUtgCBS7y+cksuucxSEA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=so1NCj2iCstdvAJJmGb4brjOWyfebydi2R8hC6sNgrf+ComWxOImgBqMtAIX1SObC
 eRTjyV4lYU0TzhHstK+ml28lJnzcwpEJRYK8G7jn+c9g4wHD0PaOAJN1As7keq8lrN
 fkhhPLUMwbKbje/TTQYzSOT+HeCLUrd46ZwdLjsIbzz0f3zvXJVOjzGfjAV570JcMs
 YaLtCxGgc5a806GwpQah+BFzmlhTCZajMQZT/r9sy6CUe/g9dOO11Z9W6VogLZS5V7
 NnqwNINpk3D0q7ez0UcvWFb13iUMTwPLw9CINrDS7gBQFyHR7PBbmC3UH6NRLigsQS
 pp4eE4Gvo9TLg==
From: Mike Rapoport <rppt@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH v15 09/11] PM: hibernate: disable when there are active
 secretmem users
Date: Wed, 20 Jan 2021 20:06:10 +0200
Message-Id: <20210120180612.1058-10-rppt@kernel.org>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20210120180612.1058-1-rppt@kernel.org>
References: <20210120180612.1058-1-rppt@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210120_130753_247010_82315625 
X-CRM114-Status: GOOD (  19.52  )
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
 Palmer Dabbelt <palmerdabbelt@google.com>, Arnd Bergmann <arnd@arndb.de>,
 James Bottomley <jejb@linux.ibm.com>, Hagen Paul Pfeifer <hagen@jauu.net>,
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
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Christopher Lameter <cl@linux.com>
Cc: Dan Williams <dan.j.williams@intel.com>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Hagen Paul Pfeifer <hagen@jauu.net>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: James Bottomley <jejb@linux.ibm.com>
Cc: "Kirill A. Shutemov" <kirill@shutemov.name>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Matthew Wilcox <willy@infradead.org>
Cc: Michael Kerrisk <mtk.manpages@gmail.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: Roman Gushchin <guro@fb.com>
Cc: Shakeel Butt <shakeelb@google.com>
Cc: Shuah Khan <shuah@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Tycho Andersen <tycho@tycho.ws>
Cc: Will Deacon <will@kernel.org>
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
index 3c6c037b3381..2de06446ebf9 100644
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
@@ -186,6 +193,12 @@ static const struct vm_operations_struct secretmem_vm_ops = {
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
@@ -208,6 +221,7 @@ bool vma_is_secretmem(struct vm_area_struct *vma)
 }
 
 static const struct file_operations secretmem_fops = {
+	.release	= secretmem_release,
 	.mmap		= secretmem_mmap,
 };
 
@@ -323,6 +337,7 @@ SYSCALL_DEFINE1(memfd_secret, unsigned long, flags)
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
