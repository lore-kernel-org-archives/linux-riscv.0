Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D268ACA0EEB
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Aug 2025 03:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jx26TwgHVgJp33S1FHP1+Vg2nRkQFb8ofUsJCIBh+X4=; b=TY9qZhRh7N6KN7
	MNCX2DZecj6k3zu0rYxxyAPCELhT20zcGCO9HWZdcgF8WtL8rNWVT2vczGX8d7N0K0khpke1+bfCn
	3vI0FDvW8LtZ8UaYu2XiacVI7hZd1UlFD92QesPv6kspjtxbQo6cUD/owzCaUzPvuEhZkUbs30NUO
	FeNn0Uec8tbnUnAv5XirD++kefpK5PWs4NXg+r3wdF5+12ksISWjBpOz/2WfLlNYr+2GBvXLUUO4Z
	A949tV+gJ9ToVvU5u29D4jmeli5FnfdQP7q1748Lg5B3EThL+A+M7OiNpxJDG7tA/kprWBdwyAZCV
	Z3vSbJMTQGndSUi+SyCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upILH-00000001NU6-2aE3;
	Fri, 22 Aug 2025 03:21:27 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCdv-00000000duL-17LJ
	for linux-riscv@lists.infradead.org;
	Thu, 21 Aug 2025 21:16:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C5BE35C661C;
	Thu, 21 Aug 2025 21:16:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 008D6C4CEF4;
	Thu, 21 Aug 2025 21:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755810977;
	bh=7h8ti9XOt72qE84+ULVgnYhwitUoyvrNFp92nIqSGEA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=vMoIeyFy572B7PTFUhy5H1niwxvd3fwampoMwUF95XRQbNvpYxsqJ4nG3NThTrEDx
	 +BaxNY1b+Qi9FcYnTexNa0ZDcmY2XwO6ATU839IiqBK8jTdHWeSOSusvi/4duRHMvC
	 KEigXlH+5IBOfA1uwyQoL/fy/EYFh83mL0T6WlWp9WRPKE0VlSvhocHbYbckzw4lDs
	 pZ5OYkfterg+rHTumzTu6y8VDNlAG3CjlKdjsXuzBl7xyXgBgRLZQLDVSHTZ5DIin/
	 XaILz7QpUpC5sSVmkjVR7HS8xMBsYmYchJJWd/NCc4O9qjSfY+H30f2dzquaB/bh79
	 oxmL3u2cgFWiA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 21 Aug 2025 14:15:45 -0700
Subject: [PATCH v2 08/12] riscv: Unconditionally use linker relaxation
MIME-Version: 1.0
Message-Id: <20250821-bump-min-llvm-ver-15-v2-8-635f3294e5f0@kernel.org>
References: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
In-Reply-To: <20250821-bump-min-llvm-ver-15-v2-0-635f3294e5f0@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 llvm@lists.linux.dev, patches@lists.linux.dev, 
 Nathan Chancellor <nathan@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.15-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2269; i=nathan@kernel.org;
 h=from:subject:message-id; bh=7h8ti9XOt72qE84+ULVgnYhwitUoyvrNFp92nIqSGEA=;
 b=kA0DAAoWHWsmkXHAGpYByyZiAGinjIOhQOiqLNj+4gr9X47U1dRdW0L4ONYNUiHHiMK3aXUZK
 Ih1BAAWCgAdFiEEe+MlxzExnM0B2MqSHWsmkXHAGpYFAminjIMACgkQHWsmkXHAGpYVZAD/dRSq
 mvKqOGqvjn5OGz9gbrBLdK1f9FTL23YwJ8grFDUBAKe8W5R3ih+p+sgomqLX5Ndj0FbMGv/BrHQ
 6tEoLjKYN
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141619_391416_0B48E8E6 
X-CRM114-Status: UNSURE (   9.75  )
X-CRM114-Notice: Please train this message.
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

Now that the minimum supported version of LLVM for building the kernel
has been bumped to 15.0.0, CONFIG_RISCV_USE_LINKER_RELAXATION will
always be enabled, so it can be removed.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig  | 6 ------
 arch/riscv/Makefile | 9 +--------
 2 files changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 1d53bf02d0fa..d482236e93f4 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -246,15 +246,9 @@ config HAVE_SHADOW_CALL_STACK
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
 
-config RISCV_USE_LINKER_RELAXATION
-	def_bool y
-	# https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
-	depends on !LD_IS_LLD || LLD_VERSION >= 150000
-
 # https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6
 config ARCH_HAS_BROKEN_DWARF5
 	def_bool y
-	depends on RISCV_USE_LINKER_RELAXATION
 	# https://github.com/llvm/llvm-project/commit/1df5ea29b43690b6622db2cad7b745607ca4de6a
 	depends on AS_IS_LLVM && AS_VERSION < 180000
 	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index df57654a615e..ecf2fcce2d92 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -46,17 +46,10 @@ else
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
-ifndef CONFIG_RISCV_USE_LINKER_RELAXATION
-	KBUILD_CFLAGS += -mno-relax
-	KBUILD_AFLAGS += -mno-relax
-ifndef CONFIG_AS_IS_LLVM
-	KBUILD_CFLAGS += -Wa,-mno-relax
-	KBUILD_AFLAGS += -Wa,-mno-relax
-endif
 # LLVM has an issue with target-features and LTO: https://github.com/llvm/llvm-project/issues/59350
 # Ensure it is aware of linker relaxation with LTO, otherwise relocations may
 # be incorrect: https://github.com/llvm/llvm-project/issues/65090
-else ifeq ($(CONFIG_LTO_CLANG),y)
+ifeq ($(CONFIG_LTO_CLANG),y)
 	KBUILD_LDFLAGS += -mllvm -mattr=+c -mllvm -mattr=+relax
 endif
 

-- 
2.50.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
