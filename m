Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64102CD98ED
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Jun 2026 08:13:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gy60rSkrJtYa3rOKRLStESlhuFz7MLcAvpcnbnsoQ5I=; b=ju+e4e9++JxPC5
	xzfteypDdL+HFgcnrNfjNxmIrf+MzaXjVqgu1UZIN8beP/PHqCldeZMaecJ0U2SqtF946kyHHXh9T
	WlVRmOSY8KYKseEg7NmetMXvGBJbiKIJsklfjyQw0qHsylD7pj+2e+D+lb52IaG5HlmPHcp8g5sUR
	JAQzvUjErQAsfQprGLzgMZVvKoF1nKv/aQ4i93eVyYtZ52kxGle8HV0SHVklK84NsnL+raRDtSylq
	H1YW4raUVIt+05pLAhT9C/Pw5q9Vl/fQwxgsLIVC+a29q5JbheMbsCt6DNfKJPhKp9DHId8GPGzGB
	pG9BcOHuQZqls1W64TRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7rx-00000000pU4-3zvi;
	Thu, 18 Jun 2026 08:13:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa7rv-00000000pTm-3NSN
	for linux-riscv@lists.infradead.org;
	Thu, 18 Jun 2026 08:12:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E323E6012A;
	Thu, 18 Jun 2026 08:12:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 944F71F00A3A;
	Thu, 18 Jun 2026 08:12:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781770378;
	bh=jVNjv8JxwUwcCkGdwQsT2x+fWCMTSZLSOFkNo5kgMWk=;
	h=From:To:Cc:Subject:Date;
	b=lkigb6gKRHtpYsq/sANBKiyykvRoCUDy2MtsJvRMvfhQaBBSQHIa0QWMVCM1JpfG4
	 jLXJzCr7WqEA2oimef8Ao8hcUkKHu5An1BvLH3eBkT62HrmzpL7sbGF2DeGsGRWlgV
	 vUHtp4XaDgx/NAbYYumG2WjDcZM1fLbGQdejMVo0i2pKbqhuTJjL5Uf9J2Rx5U3++6
	 Cd6Vmip99BbNCNyL1rdvsUeJvK1sgYxFNJBOlC/Ayore2NEQ8mQqaeVjK/u6s82QHk
	 j8i4mQJT6GlxPApi27/VofVaK6YlarPwnWficZVGT9FGDcIXqILA+YgW4IGy0GEETo
	 hcjFeAYR6s4nA==
From: Kees Cook <kees@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
Cc: Kees Cook <kees@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Evan Green <evan@rivosinc.com>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-hardening@vger.kernel.org
Subject: [PATCH] riscv: Add kCFI type prefix to unaligned copy routines
Date: Thu, 18 Jun 2026 01:12:57 -0700
Message-Id: <20260618081252.work.711-kees@kernel.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2973; i=kees@kernel.org; h=from:subject:message-id; bh=ModCF8ov3TtoIrFxkQYcmcDaoLwDTqZa7+2eB+/85xs=; b=owGbwMvMwCVmps19z/KJym7G02pJDFnGKzpaPKx/V1tc877xMLEm5tue7lXNfUsU+pLmF/39e Uy15LhCRykLgxgXg6yYIkuQnXuci8fb9nD3uYowc1iZQIYwcHEKwEQYNjL8s7zo+EalbVv8o+RY psIlU9tnNcc7Gn0WPt9mnL9cOMDtKMP/6C73/1HrI9f8zw4xf7Z28fX1fTWSJc+S7eQV356SUqz lAgA=
X-Developer-Key: i=kees@kernel.org; a=openpgp; fpr=A5C3F68F229DD60F723E6E138972F4DFDC6DC026
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

__riscv_copy_words_unaligned() and __riscv_copy_bytes_unaligned() are
called indirectly through function pointers from measure_cycles() (via
compare_unaligned_access()) during the boot-time unaligned-access
probe. Under kCFI, an indirect call checks the type id stored in the
word immediately preceding the callee against the type id of the
function-pointer type at the call site. These two routines are defined
with SYM_FUNC_START(), which emits no __cfi_ prefix, so the check reads
the alignment padding ahead of the function (zero) instead of a type id
and traps:

  CFI failure at measure_cycles.constprop.0+0x34
    (target: __riscv_copy_words_unaligned+0x0; expected type: 0x00000000)
  Kernel panic - not syncing: Fatal exception in interrupt

The call site is correct: it loads the actual type id from [target-4]
and compares against the expected 0xf1200a56, which matches the
compiler-generated __kcfi_typeid___riscv_copy_words_unaligned. Only the
callee is missing its prefix word.

Switch both routines to SYM_TYPED_FUNC_START() so the assembler emits
the __cfi_ type-id prefix, matching the existing treatment of other
indirectly-called riscv assembly routines (e.g. ftrace_stub in
mcount.S and __cpu_resume_enter in suspend_entry.S), and add the
<linux/cfi_types.h> include that provides the macro.

Build and boot tested ARCH=riscv defconfig+CONFIG_CFI=y with GCC
17.0.0 20260615 (experimental kCFI tree) under qemu; the boot-time
unaligned-access probe no longer traps.

Fixes: 584ea6564bca ("RISC-V: Probe for unaligned access speed")
Assisted-by: Claude:claude-opus-4-8[1m]
Signed-off-by: Kees Cook <kees@kernel.org>
---
 arch/riscv/kernel/copy-unaligned.S | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/copy-unaligned.S b/arch/riscv/kernel/copy-unaligned.S
index 2b3d9398c113..c649ad3d19e0 100644
--- a/arch/riscv/kernel/copy-unaligned.S
+++ b/arch/riscv/kernel/copy-unaligned.S
@@ -2,6 +2,7 @@
 /* Copyright (C) 2023 Rivos Inc. */
 
 #include <linux/linkage.h>
+#include <linux/cfi_types.h>
 #include <asm/asm.h>
 
 	.text
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
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
