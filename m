Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CDCDFB517B
	for <linux-riscv@archiver.kernel.org>; Mon,  6 Apr 2026 23:26:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aTrE06Auih+MQLh070xhmd4t8sbYEq8d05JFkbhfCpw=; b=ORd9DUTLFG2S0t
	iHPcuOhkcxKQqCPO7b2AiS+0BmWtfXSG78h/g/x2N5WKkv1CVMr3yb5Semxx1svZ7obWoAgiHOMWu
	k82YZvXlcnGL6Z6jcgvVHlW7vQY2CFzCBCq8/4o2G55gKa/C5SDVufbFZ8f/NFyxzPBGO0uOW/3uy
	RZ8F5TqtD4zAbmTpbds7aAZSchftjXValv/dJsOMpmLzH4NIw8chFHw7VDAX7vvVnkkazZO4X/u0K
	bO7H4638QfhbyTefezbgfkgP/uWt+6wsAo6+UuEOExoRFZntj2nEzyHznH2XwkXcAQPW1F+tAQbqm
	ekavCKAljeO9ZTyn03Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tKU-00000005cL5-2Uby;
	Mon, 06 Apr 2026 23:26:02 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w9tKS-00000005cIH-0OTJ
	for linux-riscv@lists.infradead.org;
	Mon, 06 Apr 2026 23:26:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 139F542D9E;
	Mon,  6 Apr 2026 23:25:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01224C2BC9E;
	Mon,  6 Apr 2026 23:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775517958;
	bh=8+bdlf8JFuMtYhnjy/F+fkhfKqlSWemei3QvSYQNKMk=;
	h=From:Date:Subject:To:Cc:From;
	b=FWxsGTfZvLhTutwyA/JtloZPRQ8FnDXAVDemUBwHpvYl6aJ17UZMJy4miDQpEupq3
	 rjN6mVc1EVU5dbUFWPOPu5idPM9BM4JMUfSQz5wQNsUVugsEhj4rDCCdQ5G8MX98f7
	 MNR7xHapLA+aJkHJiAtfMZl9ytLuLQEgcN8AQYOldgS7zTINo3ldg/tiald2PwGZgC
	 PNtZj/GOAzDctDOciiNWDn2xBcON3dLgYegRuBSiwKrKNVonLtcqC1Jem9m3sDTkLf
	 bjZ7uSLsGucHbeiTmLUOuBVeGkxs0TPsfvZ3ixIc+3jcLy/M39+yyQji6M+KTvArAf
	 hdaJPO6cIKHTQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Mon, 06 Apr 2026 16:25:49 -0700
Subject: [PATCH] riscv: Define
 __riscv_copy_{,vec_}{words,bytes}_unaligned() using SYM_TYPED_FUNC_START
MIME-Version: 1.0
Message-Id: <20260406-measure_cycles-cfi-failure-v1-1-03e0234ae02f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMQQ6CQAxA0auQrm0ylgkEr2IMGUsHaxDNFAiGc
 HdHXb6/+BuYJBWDU7FBkkVNn2PG8VAA38LYC2qXDeSoct5V+JBgc5KW3zyIIUfFGHTICTvywRE
 1tW9KyINXkqjrb36+/G3z9S48fY+w7x9GJWY5fgAAAA==
X-Change-ID: 20260406-measure_cycles-cfi-failure-d24a02297493
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Nam Cao <namcao@linutronix.de>
Cc: linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, 
 llvm@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3768; i=nathan@kernel.org;
 h=from:subject:message-id; bh=8+bdlf8JFuMtYhnjy/F+fkhfKqlSWemei3QvSYQNKMk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJlXHFmuCOm3/DmS8Md1ec/Ugq37xS+ZSp3dNVluLa9Bl
 YLOm9VGHaUsDGJcDLJiiizVj1WPGxrOOct449QkmDmsTCBDGLg4BWAifSkM//2evVBP0gqqXCF5
 nim95vnDENNlu+a9O7+z4W93+Sm+d8IM/xQfL1IqFgtf4byldfnvzP/SLc5vi9OV90wrMVh/oDj
 vNi8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260406_162600_180696_65904A25 
X-CRM114-Status: GOOD (  10.06  )
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

After commit 67bdd7b01387 ("riscv: Split out measure_cycles() for
reuse") and commit c03ad15f7cf6 ("riscv: Reuse measure_cycles() in
check_vector_unaligned_access()"), there are CFI failure when booting
kernels with CONFIG_CFI=y:

  CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_words_unaligned+0x0/0x50; expected type: ...)
  CFI failure at measure_cycles+0x38/0xe0 (target: __riscv_copy_vec_words_unaligned+0x0/0x24; expected type: ...)

The __riscv_copy_*_unaligned() functions are now called indirectly but
they are not defined with SYM_TYPED_FUNC_START, which is required for
assembly functions called indirectly from C to pass CFI checking. Switch
to SYM_TYPED_FUNC_START to clear up the CFI failures.

Fixes: 67bdd7b01387 ("riscv: Split out measure_cycles() for reuse")
Fixes: c03ad15f7cf6 ("riscv: Reuse measure_cycles() in check_vector_unaligned_access()")
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/kernel/copy-unaligned.S     | 5 +++--
 arch/riscv/kernel/vec-copy-unaligned.S | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/kernel/copy-unaligned.S b/arch/riscv/kernel/copy-unaligned.S
index 2b3d9398c113..90f3549621f7 100644
--- a/arch/riscv/kernel/copy-unaligned.S
+++ b/arch/riscv/kernel/copy-unaligned.S
@@ -1,6 +1,7 @@
 /* SPDX-License-Identifier: GPL-2.0 */
 /* Copyright (C) 2023 Rivos Inc. */
 
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
@@ -9,7 +10,7 @@
 /* void __riscv_copy_words_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using word loads and stores. */
 /* Note: The size is truncated to a multiple of 8 * SZREG */
-SYM_FUNC_START(__riscv_copy_words_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_words_unaligned)
 	andi  a4, a2, ~((8*SZREG)-1)
 	beqz  a4, 2f
 	add   a3, a1, a4
@@ -41,7 +42,7 @@ SYM_FUNC_END(__riscv_copy_words_unaligned)
 /* void __riscv_copy_bytes_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using only byte accesses. */
 /* Note: The size is truncated to a multiple of 8 */
-SYM_FUNC_START(__riscv_copy_bytes_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_bytes_unaligned)
 	andi a4, a2, ~(8-1)
 	beqz a4, 2f
 	add  a3, a1, a4
diff --git a/arch/riscv/kernel/vec-copy-unaligned.S b/arch/riscv/kernel/vec-copy-unaligned.S
index 7ce4de6f6e69..361039f7b944 100644
--- a/arch/riscv/kernel/vec-copy-unaligned.S
+++ b/arch/riscv/kernel/vec-copy-unaligned.S
@@ -2,6 +2,7 @@
 /* Copyright (C) 2024 Rivos Inc. */
 
 #include <linux/args.h>
+#include <linux/cfi_types.h>
 #include <linux/linkage.h>
 #include <asm/asm.h>
 
@@ -16,7 +17,7 @@
 /* void __riscv_copy_vec_words_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using word loads and stores. */
 /* Note: The size is truncated to a multiple of WORD_EEW */
-SYM_FUNC_START(__riscv_copy_vec_words_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_vec_words_unaligned)
 	andi  a4, a2, ~(WORD_EEW-1)
 	beqz  a4, 2f
 	add   a3, a1, a4
@@ -38,7 +39,7 @@ SYM_FUNC_END(__riscv_copy_vec_words_unaligned)
 /* void __riscv_copy_vec_bytes_unaligned(void *, const void *, size_t) */
 /* Performs a memcpy without aligning buffers, using only byte accesses. */
 /* Note: The size is truncated to a multiple of 8 */
-SYM_FUNC_START(__riscv_copy_vec_bytes_unaligned)
+SYM_TYPED_FUNC_START(__riscv_copy_vec_bytes_unaligned)
 	andi a4, a2, ~(8-1)
 	beqz a4, 2f
 	add  a3, a1, a4

---
base-commit: 9b3a2be84803cf18c4b4d1efc695991f0daa153c
change-id: 20260406-measure_cycles-cfi-failure-d24a02297493

Best regards,
--  
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
