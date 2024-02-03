Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C855AC4828D
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Feb 2024 12:31:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=V7DJvLB8fVRlNYoW0VIRpyJUpMjY/nGA3tx9wBR6+8M=; b=zqkwt37+hh2JjJ
	S3XDIHPBgW5XybvArnJ9WFcjvJL/04xv44CfcDtupIJvQXHqKlVud1lPVQQYlXd2w8ZCC0C2NYvyX
	1rZzKtR9lSjHO7Y8jDUvyl9taGeSDlCPuc9nSejf82yrifwN8EWR3PZlTJ74EOwQ/a1SNjzjKD3id
	FU0OlJxUngmTcPNgRwFVE2q+5T2locJ+vXkB7iZL4vrvPuaqQuh5rSuee9N08r1jVLS/cfDxml+9J
	1WXTgiYLtY49s/9wKh7eaB8LIIg9Y9T2nUzfb9jHJ5W0s69/e8pgOe+lW8iaE7bRkU8TzH6B1Y9o6
	qrxnD/Tk2cHJDSSmaJZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFAk-0000000GIvR-0H0d;
	Sat, 03 Feb 2024 12:31:02 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rWFAd-0000000GIr2-312u;
	Sat, 03 Feb 2024 12:30:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 11D6460A13;
	Sat,  3 Feb 2024 12:30:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBDEC433F1;
	Sat,  3 Feb 2024 12:30:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706963454;
	bh=noIMiNXXaRbZmSrB1LMm4LQSI3w8gaJJhGiAy9NbIgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nZ+FVrtarYuPfV2QgPHzVDN1mdXXrUA/eCIkI0+jD+9lmq8AK1SrIHQkP+okJ5xIf
	 Nrtap97nj/w0mCOq2XBkzeEft1WmagOP1qx9TFRd7EBruLsj53cPf7oLI70WJMf2MQ
	 dMWZcj6emLEFTlJCV/Yxh7bjw5A6lQLRrkdBfnfN/U4F2NkeGs3HNfZoP1yPp8rSJL
	 VlptsEVCXxOwPpctcB+HH0ogyB4/oAE/pVEWNyqU0lHP8t821iVQKCaDfz3W3uU9m5
	 AOL2G84ZrXkvUQOBBwDNufzWgILEjqVWtfYDLJgzCbrfg21DlUhhzOPjJVMkEgy4Fh
	 1cwCvG9ZSMVbQ==
From: Mark Brown <broonie@kernel.org>
Date: Sat, 03 Feb 2024 12:25:37 +0000
Subject: [PATCH v8 11/38] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20240203-arm64-gcs-v8-11-c9fec77673ef@kernel.org>
References: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
In-Reply-To: <20240203-arm64-gcs-v8-0-c9fec77673ef@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Andrew Morton <akpm@linux-foundation.org>, Marc Zyngier <maz@kernel.org>, 
 Oliver Upton <oliver.upton@linux.dev>, James Morse <james.morse@arm.com>, 
 Suzuki K Poulose <suzuki.poulose@arm.com>, Arnd Bergmann <arnd@arndb.de>, 
 Oleg Nesterov <oleg@redhat.com>, Eric Biederman <ebiederm@xmission.com>, 
 Kees Cook <keescook@chromium.org>, Shuah Khan <shuah@kernel.org>, 
 "Rick P. Edgecombe" <rick.p.edgecombe@intel.com>, 
 Deepak Gupta <debug@rivosinc.com>, Ard Biesheuvel <ardb@kernel.org>, 
 Szabolcs Nagy <Szabolcs.Nagy@arm.com>
Cc: "H.J. Lu" <hjl.tools@gmail.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Florian Weimer <fweimer@redhat.com>, Christian Brauner <brauner@kernel.org>, 
 Thiago Jung Bauermann <thiago.bauermann@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-a684c
X-Developer-Signature: v=1; a=openpgp-sha256; l=2038; i=broonie@kernel.org;
 h=from:subject:message-id; bh=noIMiNXXaRbZmSrB1LMm4LQSI3w8gaJJhGiAy9NbIgk=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBlvjDZ2Io6GgPo7IKBDhinOWnY04tvqYzF/2M4PbR8
 tBVQvoaJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZb4w2QAKCRAk1otyXVSH0FoMB/
 489Ce9yGOrMf8qmH57w0iu49g2q5ScfPLlvHIGHqIG2PImWln+Xihqvl1m9KbzdISpWJxeNsTTO2XF
 aJDD06/nq2t7tQverEzEP7/LK2GVlDIYoue95rUKVV2+43+ztP2j03uGGCbBzlhTZphrchLv+3O2ul
 +HEP0ncnuw1ybRxXFNlo3BHi/OXXeFTRf3CYFPyr+vcf1TxJd/SCdsXeogobq3zH+dHSWskU+6/doU
 tTsPKvaiitj/K4V2ScTqfmaf40lD8CCSQszd9G5pPMgQYd9N2FC6aVOoLa9MLanU9pHtBoiWh4Tnew
 iIOq6LPE9HIfe5k2+L9fZIvT/kWhuG
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240203_043056_181359_E7CA2AB3 
X-CRM114-Status: GOOD (  11.24  )
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

Use VM_HIGH_ARCH_5 for guarded control stack pages.

Signed-off-by: Mark Brown <broonie@kernel.org>
---
 Documentation/filesystems/proc.rst |  2 +-
 fs/proc/task_mmu.c                 |  3 +++
 include/linux/mm.h                 | 12 +++++++++++-
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index 104c6d047d9b..0392c3b74650 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -570,7 +570,7 @@ encoded manner. The codes are the following:
     mt    arm64 MTE allocation tags are enabled
     um    userfaultfd missing tracking
     uw    userfaultfd wr-protect tracking
-    ss    shadow stack page
+    ss    shadow/guarded control stack page
     ==    =======================================
 
 Note that there is no guarantee that every flag and associated mnemonic will
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index ff2c601f7d1c..fb0633d8e309 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -702,6 +702,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_ARCH_HAS_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_ARM64_GCS
+		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 0b1139c5df60..6cc304c90c63 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -352,7 +352,17 @@ extern unsigned int kobjsize(const void *objp);
  * for more details on the guard size.
  */
 # define VM_SHADOW_STACK	VM_HIGH_ARCH_5
-#else
+#endif
+
+#if defined(CONFIG_ARM64_GCS)
+/*
+ * arm64's Guarded Control Stack implements similar functionality and
+ * has similar constraints to shadow stacks.
+ */
+# define VM_SHADOW_STACK	VM_HIGH_ARCH_5
+#endif
+
+#ifndef VM_SHADOW_STACK
 # define VM_SHADOW_STACK	VM_NONE
 #endif
 

-- 
2.30.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
