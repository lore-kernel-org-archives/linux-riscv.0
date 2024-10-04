Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1C55CF8854
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Oct 2024 18:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhmc/kw1nzT1iCJTDkGDiSLkZ0pQHljWhjwXQFEunKA=; b=CI7qZLEbe0AxfM
	9NY8MIDYojhmDKxSjFxKIAvrDnTPpcFhPpoCtcqV/hxg/PFkwDLVTaolgZoxTK4uskWZJishI/SOc
	me7IC6w2wM+LQVuWM8UFGsJlooTmC1ovnx+IMGJuDsXjM4CX0uar9nCZCyPY10S5O68M0vuKtzHOY
	DVLBspsijr8lZXhnJS2tqvQggdASc6L2U8jPbPnDbrh6V439JVlSQXiAhekLCOe+6YvPjHroBvgw3
	8Fe+LavYVknBcLUQrJwmcWEqL3vC+QCPwRX7Wqj/+asC+fozvWujGOSJxgMNidDkpz9bv77OoNrLi
	RrJRCYA1b+Ca9/p7rhxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1swmty-0000000Df7A-3Sn7;
	Fri, 04 Oct 2024 18:19:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1swmtv-0000000Df5Z-1rKv
	for linux-riscv@lists.infradead.org;
	Fri, 04 Oct 2024 18:19:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B13CE5C5F0C;
	Fri,  4 Oct 2024 18:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A312DC4CECC;
	Fri,  4 Oct 2024 18:19:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728065978;
	bh=XpVz8zlyGtJM96GVGWDB+ynuKI1zdiHZnS2pTQYFm4c=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kmuaAc2JFQJAQXl1W4jdIY76++Z1jpnOuytr/QzfX0X/WSWGhmTJv4vMeyIcjlE+F
	 48j8t66IpxNCBsTq4uyC/gbO2/TEfvUtqqBORn8qT+x6BxoXVHKQAOBThZ0I4H3HHX
	 cL3PhkdN4KL3HAv/+8zECeA+cTnX/qm/J23sXhR3B5g6bgNjeMnCYaIJ4iqDnex19M
	 Th5DbEIQZm/hpMF3TZQwbCdb50BqKGTu39Ku07y46xeatCEVo0sw1nsOcyLrjA4c1o
	 4GJfJElTwHaYSVx6fAgqryofWH/oPgrLCQtHhaGpEfmtkl75gHWjYgMIUrPHu4Iz1O
	 Wv7wZ1QYilNpA==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Samuel Holland <samuel.holland@sifive.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Sasha Levin <sashal@kernel.org>,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	charlie@rivosinc.com,
	andy.chiu@sifive.com,
	xiao.w.wang@intel.com,
	nick.knight@sifive.com,
	greentime.hu@sifive.com,
	kees@kernel.org,
	masahiroy@kernel.org,
	samitolvanen@google.com,
	linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 6.11 37/76] riscv: Omit optimized string routines when using KASAN
Date: Fri,  4 Oct 2024 14:16:54 -0400
Message-ID: <20241004181828.3669209-37-sashal@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20241004181828.3669209-1-sashal@kernel.org>
References: <20241004181828.3669209-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.11.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241004_111939_596133_46DBCC78 
X-CRM114-Status: GOOD (  10.75  )
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

From: Samuel Holland <samuel.holland@sifive.com>

[ Upstream commit 58ff537109ac863d4ec83baf8413b17dcc10101c ]

The optimized string routines are implemented in assembly, so they are
not instrumented for use with KASAN. Fall back to the C version of the
routines in order to improve KASAN coverage. This fixes the
kasan_strings() unit test.

Signed-off-by: Samuel Holland <samuel.holland@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Link: https://lore.kernel.org/r/20240801033725.28816-2-samuel.holland@sifive.com
Signed-off-by: Palmer Dabbelt <palmer@rivosinc.com>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 arch/riscv/include/asm/string.h | 2 ++
 arch/riscv/kernel/riscv_ksyms.c | 3 ---
 arch/riscv/lib/Makefile         | 2 ++
 arch/riscv/lib/strcmp.S         | 1 +
 arch/riscv/lib/strlen.S         | 1 +
 arch/riscv/lib/strncmp.S        | 1 +
 arch/riscv/purgatory/Makefile   | 2 ++
 7 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/include/asm/string.h b/arch/riscv/include/asm/string.h
index a96b1fea24fe4..5ba77f60bf0b5 100644
--- a/arch/riscv/include/asm/string.h
+++ b/arch/riscv/include/asm/string.h
@@ -19,6 +19,7 @@ extern asmlinkage void *__memcpy(void *, const void *, size_t);
 extern asmlinkage void *memmove(void *, const void *, size_t);
 extern asmlinkage void *__memmove(void *, const void *, size_t);
 
+#if !(defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS))
 #define __HAVE_ARCH_STRCMP
 extern asmlinkage int strcmp(const char *cs, const char *ct);
 
@@ -27,6 +28,7 @@ extern asmlinkage __kernel_size_t strlen(const char *);
 
 #define __HAVE_ARCH_STRNCMP
 extern asmlinkage int strncmp(const char *cs, const char *ct, size_t count);
+#endif
 
 /* For those files which don't want to check by kasan. */
 #if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
diff --git a/arch/riscv/kernel/riscv_ksyms.c b/arch/riscv/kernel/riscv_ksyms.c
index a72879b4249a5..5ab1c7e1a6ed5 100644
--- a/arch/riscv/kernel/riscv_ksyms.c
+++ b/arch/riscv/kernel/riscv_ksyms.c
@@ -12,9 +12,6 @@
 EXPORT_SYMBOL(memset);
 EXPORT_SYMBOL(memcpy);
 EXPORT_SYMBOL(memmove);
-EXPORT_SYMBOL(strcmp);
-EXPORT_SYMBOL(strlen);
-EXPORT_SYMBOL(strncmp);
 EXPORT_SYMBOL(__memset);
 EXPORT_SYMBOL(__memcpy);
 EXPORT_SYMBOL(__memmove);
diff --git a/arch/riscv/lib/Makefile b/arch/riscv/lib/Makefile
index 2b369f51b0a5e..8eec6b69a875f 100644
--- a/arch/riscv/lib/Makefile
+++ b/arch/riscv/lib/Makefile
@@ -3,9 +3,11 @@ lib-y			+= delay.o
 lib-y			+= memcpy.o
 lib-y			+= memset.o
 lib-y			+= memmove.o
+ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 lib-y			+= strcmp.o
 lib-y			+= strlen.o
 lib-y			+= strncmp.o
+endif
 lib-y			+= csum.o
 ifeq ($(CONFIG_MMU), y)
 lib-$(CONFIG_RISCV_ISA_V)	+= uaccess_vector.o
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c438..542301a67a2ff 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -120,3 +120,4 @@ strcmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strcmp)
+EXPORT_SYMBOL(strcmp)
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 8ae3064e45ff0..962983b73251e 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -131,3 +131,4 @@ strlen_zbb:
 #endif
 SYM_FUNC_END(strlen)
 SYM_FUNC_ALIAS(__pi_strlen, strlen)
+EXPORT_SYMBOL(strlen)
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621d..0f359ea2f55b2 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -136,3 +136,4 @@ strncmp_zbb:
 .option pop
 #endif
 SYM_FUNC_END(strncmp)
+EXPORT_SYMBOL(strncmp)
diff --git a/arch/riscv/purgatory/Makefile b/arch/riscv/purgatory/Makefile
index f11945ee24903..fb9c917c9b457 100644
--- a/arch/riscv/purgatory/Makefile
+++ b/arch/riscv/purgatory/Makefile
@@ -1,7 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0
 
 purgatory-y := purgatory.o sha256.o entry.o string.o ctype.o memcpy.o memset.o
+ifeq ($(CONFIG_KASAN_GENERIC)$(CONFIG_KASAN_SW_TAGS),)
 purgatory-y += strcmp.o strlen.o strncmp.o
+endif
 
 targets += $(purgatory-y)
 PURGATORY_OBJS = $(addprefix $(obj)/,$(purgatory-y))
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
