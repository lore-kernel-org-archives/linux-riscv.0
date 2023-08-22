Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0505EEE49A4
	for <linux-riscv@archiver.kernel.org>; Tue, 22 Aug 2023 14:04:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6cZlKquIfDibs8rx0FLyz75GR3bUHIWg9D8rOuGGwxU=; b=havv2qF+dZmVV7
	nqNSBxI5kN0Ede6+D1Pkbctu6izsy1DBS9ephEVjL2uJ7Zl4cfD8o5RB/jgLmCCT29yzdm6piHNuT
	+AqEO2psj9ff4zsYlT67gCBPi8c3FVeGQaxSZqRiIgMyEKSW/gY/sCsNmF2QwNQHo5fBT77ZWzqFG
	GGdsoWhX7GH3Q33N7ZGPlqAsJr3ZCt2yeut4mkj5pKw/HjMJ7frdZ0buagVHxyNFnjAI54Dca0efi
	N9w6GgtGaJgCtCtP81XwpFx7W8TQWojSFbCBXTU1yJxK4ws2eU4DZ0uiSEfTmdytySyQ3c2Z2fRzc
	5Rd6qaRgtbHtV+3dqfqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRzi-00G718-2j;
	Tue, 22 Aug 2023 14:04:31 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYRzQ-00G6kF-2Y;
	Tue, 22 Aug 2023 14:04:14 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 251FF657AC;
	Tue, 22 Aug 2023 14:04:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 719F4C43397;
	Tue, 22 Aug 2023 14:04:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692713051;
	bh=38AeaFL37vV9MyUQ5JVKuM1gVCMvtkdVnDbNL3TTQpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=C2V2h4ZMUb4/yIQ3iF4pkkKKmtU4/E6fRrZuRXM33jlq1hr6SN6ejz4mxenV7X1Jr
	 U+onmrTsLfkkpQpaEXEcyrvLP7fzgiBNoMxosAkMImE34jQmwD6Ovlm1y3amxqUkzl
	 Ll5vlPk9amIBHqRAoBgskyZpEHxksqC5DZc4Z2ddzNvSLHgEmsnd/05/wV8+N4fIUY
	 fcX4IKHMZnMKseDwZyVhqt5QNo6S8CbTvRamNYyrPI34PQd7ncLiXjtoHSkKiycL4i
	 3dxx3GftFphs29Eji8NRk+6GlXTRp1SCoC497PbX7DRl6mdzlnlG8nlA7V35Vi+D/l
	 Vjt7r4Fdh0gsQ==
From: Mark Brown <broonie@kernel.org>
Date: Tue, 22 Aug 2023 14:56:44 +0100
Subject: [PATCH v5 11/37] mm: Define VM_SHADOW_STACK for arm64 when we
 support GCS
MIME-Version: 1.0
Message-Id: <20230822-arm64-gcs-v5-11-9ef181dd6324@kernel.org>
References: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
In-Reply-To: <20230822-arm64-gcs-v5-0-9ef181dd6324@kernel.org>
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
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
 kvmarm@lists.linux.dev, linux-fsdevel@vger.kernel.org, 
 linux-arch@vger.kernel.org, linux-mm@kvack.org, 
 linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Mark Brown <broonie@kernel.org>
X-Mailer: b4 0.13-dev-034f2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2027; i=broonie@kernel.org;
 h=from:subject:message-id; bh=38AeaFL37vV9MyUQ5JVKuM1gVCMvtkdVnDbNL3TTQpU=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBk5L/4ZJsqmGb1X2dCbItsrFTFc1P5N8xGgUrelX10
 oTah15WJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCZOS/+AAKCRAk1otyXVSH0PF5B/
 9luG6SSt9+4Y5FAc9atvniGOqSRYcVxYKP7QbUR1Sq1iUJjqg3/M4Wn+CX4Nv22NQDpAWlu9HjbZ90
 YxMRnOcaSD2lEoY19Wkoa7c+YXPo0XWzyI4CHMmNZvnQlyMAN5j9GdxHWbAOSNUT9nSPTxtr5KfhjJ
 ISoFniLihLHatV5qsS5JtyyHveV2BDxmv1yFDqw27OPnIdbojwQKMIxZ7eqmZ6qrC37tXHw9kHsZTT
 ZbKlr0egnDADq4BrX9prP33ZB7tiKZUrucZNNfYqmMNS+ccDZecIaC+utmvHrKQsr8827KFAuqN/wA
 Eyog4Ods4IOsTYqB7mmP0odn37Dy+V
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230822_070412_934206_1998FBB5 
X-CRM114-Status: GOOD (  13.12  )
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
index 6ccb57089a06..086a0408a4d7 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -566,7 +566,7 @@ encoded manner. The codes are the following:
     mt    arm64 MTE allocation tags are enabled
     um    userfaultfd missing tracking
     uw    userfaultfd wr-protect tracking
-    ss    shadow stack page
+    ss    shadow/guarded control stack page
     ==    =======================================
 
 Note that there is no guarantee that every flag and associated mnemonic will
diff --git a/fs/proc/task_mmu.c b/fs/proc/task_mmu.c
index cfab855fe7e9..e8c50848bb16 100644
--- a/fs/proc/task_mmu.c
+++ b/fs/proc/task_mmu.c
@@ -711,6 +711,9 @@ static void show_smap_vma_flags(struct seq_file *m, struct vm_area_struct *vma)
 #endif /* CONFIG_HAVE_ARCH_USERFAULTFD_MINOR */
 #ifdef CONFIG_X86_USER_SHADOW_STACK
 		[ilog2(VM_SHADOW_STACK)] = "ss",
+#endif
+#ifdef CONFIG_ARM64_GCS
+		[ilog2(VM_SHADOW_STACK)] = "ss",
 #endif
 	};
 	size_t i;
diff --git a/include/linux/mm.h b/include/linux/mm.h
index 43fe625b85aa..3f939ae212e5 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -372,7 +372,17 @@ extern unsigned int kobjsize(const void *objp);
  * having a PAGE_SIZE guard gap.
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
