Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B695FC4167B
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 23:30:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xM6aFz1z40vklUdruGZymsUrXXzvUtaxgA1O+QTrAxU=; b=CO1kAkQHAZ9NWs
	mssYVtXaSU+Mn7q6LqWoNRG5AW0c5esbvU7zrHqq2pCrJ76iQfaU+4GiV4ihXNPFLQc64Jh+16uiB
	JmCNUEpMW1PU9ckvQZjkt99N6hKOTmaPDMw8gwyysND0Sy9o1X4niRb2Umq1wOyruH/X99Dh/Yebi
	QgCjkAV+wDe1ZA8VEmKwH/9FjO/Fb6oLOE5HTA+pP6YlFKvR8JrtqwZYk3PjCtzUO7u6+Poqjkl1x
	opaJVyyspG3oXJE6qPDirDwns36WCsImogCamg1smvI0hpo2PJ/iMl0v7Tv3Aqf/3rmjh+dE1PCnk
	wMtY+4Xx8frpkKdrzOAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8U0P-009VZ7-0s;
	Wed, 29 Nov 2023 23:30:09 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8U0L-009VYG-2H
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 23:30:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F35A761D58;
	Wed, 29 Nov 2023 23:30:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DD30C433C8;
	Wed, 29 Nov 2023 23:30:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701300604;
	bh=zsE7SX0g2vjeQkJDJuTcq0Y0j0eQ3wWtetQ4VKglZQk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=fYZz+QBIMFmpmpYy4fFVG+7hRNcZCJ07pdSZhHJuAVWnKxV2ZuMgJOb63FbYwZ1gP
	 Lc6VPD0l2+9rH6pir8fcPq/kAiEzcOuhB899+xRoUaJthE5dUsdY4lWU/DQ2o8YdiM
	 N0XnfwkpchTb1azx2uFVALyCE7MRWR92+mxPLM6oHnENMfqaN8WGmQAKmVACmkVJAj
	 JODfwpLgNBLzShP0mSzUQgg5oBA2XfBMK3fFTcXlnU7Slm8L5jwlN5tb5vV/XNVr4M
	 2KuJfwMQ1mQcW3VBu0XIDr3oIyk/cRrKXhZi1HcNskUSdJojzl+QjJifppyosKNqUv
	 b/minoy0f/Wew==
From: Nathan Chancellor <nathan@kernel.org>
Date: Wed, 29 Nov 2023 16:29:47 -0700
Subject: [PATCH 1/2] riscv: Hoist linker relaxation disabling logic into
 Kconfig
MIME-Version: 1.0
Message-Id: <20231129-riscv-restrict-dwarf5-llvm-v1-1-ec0d368fb538@kernel.org>
References: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
In-Reply-To: <20231129-riscv-restrict-dwarf5-llvm-v1-0-ec0d368fb538@kernel.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 conor@kernel.org
Cc: maskray@google.com, ndesaulniers@google.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1665; i=nathan@kernel.org;
 h=from:subject:message-id; bh=zsE7SX0g2vjeQkJDJuTcq0Y0j0eQ3wWtetQ4VKglZQk=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKnpJ6sd9f7fiWc6sav8zfStjCWH+mV8XsX9l7z3S8By3
 n7ZY05HO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBEdPgYGZ4fvVg8+fTx/LPf
 l5e5r/0d92bV5S9prmucHEUmccm4uTUw/A8rr5GdfW3/TPeO7UkTXi4xdFl9auJtfSY13haNZOk
 KNVYA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_153005_814421_139EF197 
X-CRM114-Status: UNSURE (   8.97  )
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

Certain configurations may need to be disabled if linker relaxation is
in use, such as DWARF5 with ld.lld < 18. Hoist the logic of whether or
not linker relaxation is in use into Kconfig so decisions can be made at
configuration time.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Kconfig  | 5 +++++
 arch/riscv/Makefile | 4 +---
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 95a2a06acc6a..72be1d8122a3 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -181,6 +181,11 @@ config HAVE_SHADOW_CALL_STACK
 	# https://github.com/riscv-non-isa/riscv-elf-psabi-doc/commit/a484e843e6eeb51f0cb7b8819e50da6d2444d769
 	depends on $(ld-option,--no-relax-gp)
 
+config RISCV_USE_LINKER_RELAXATION
+	def_bool y
+	# https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
+	depends on !LD_IS_LLD || LLD_VERSION >= 150000
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
index a74be78678eb..e383aa9e2757 100644
--- a/arch/riscv/Makefile
+++ b/arch/riscv/Makefile
@@ -43,8 +43,7 @@ else
 	KBUILD_LDFLAGS += -melf32lriscv
 endif
 
-ifeq ($(CONFIG_LD_IS_LLD),y)
-ifeq ($(call test-lt, $(CONFIG_LLD_VERSION), 150000),y)
+ifndef CONFIG_RISCV_USE_LINKER_RELAXATION
 	KBUILD_CFLAGS += -mno-relax
 	KBUILD_AFLAGS += -mno-relax
 ifndef CONFIG_AS_IS_LLVM
@@ -52,7 +51,6 @@ ifndef CONFIG_AS_IS_LLVM
 	KBUILD_AFLAGS += -Wa,-mno-relax
 endif
 endif
-endif
 
 ifeq ($(CONFIG_SHADOW_CALL_STACK),y)
 	KBUILD_LDFLAGS += --no-relax-gp

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
