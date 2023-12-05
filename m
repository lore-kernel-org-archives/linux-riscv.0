Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DD9FC10DC3
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 23:54:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=pMTEH+6TPHWp1TMlZPTg1qCaKjBsBU8NJc01I+OXZgE=; b=vyX4ZLyVHd91y4
	JcqzrnxDEE7FOa+cb07z9GH69Gnw7+w/PidYmTpiUun4hEXrqgFlgePjbRR8eCU/ofwfNhTLHqECE
	1LFFlQygz1s5WzCJ+DMV4NyCeIfbs6vK5MSfAISIsdfgS/OBH8recydWCBUCjyC+vkY+zPC2Tufan
	T6W1dC1WPRqyI2LpLjhcYr0monuhg8CMvyiIFk4F0tabJwNOC1SEbfVmZWDXuc6Gk+5FYIDqpwFKP
	ZjSPf2Dd2Qq7wBwEGFxf8T3EoV493kw0MKhgT3mdopjIbVQV6hbh8ycKChNMjSJxq0KwmUR0647cr
	clg7GjfQZltid1E9nExQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfEt-008fSa-0a;
	Tue, 05 Dec 2023 23:54:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfEq-008fQf-0i
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 23:54:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 88032B81D68;
	Tue,  5 Dec 2023 23:54:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D1C2C43391;
	Tue,  5 Dec 2023 23:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701820441;
	bh=ba9h7X86HRdFrwM84UeL/FEcVW5UbtpdyhVkFXYpoFE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ofJioA7ajxhroSG6pbg/v8t+WNd/24XLW0AF0EDyyzI4OweyCQPg1OC3rqxd/9aSs
	 vdnCDjHBHy6iKqW25viUm1LzyKW7Wtzw6CKu2uWJ3rGmn8hYcTZyxkzfBewIbYn9Om
	 v07FRFNDn/hX3VcWF8p/03ruM7F+KySYEFZFLYfm+f4uFkVGHo6YJ0S+IOG65U0L1g
	 +RvSA5jp1INWT+ybaGEksBn4lLL8VJKrycF7vgNBFZqcuFakAoTH1isQDhKwJCx6/+
	 39e+BrunYszmi9AmAHVfk8clcznqyz/J7huKOKJZbDwm/lwfNU17lMRYrUfZJ1MHJ8
	 AKbgIq0y0w7+A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Dec 2023 16:53:52 -0700
Subject: [PATCH v2 3/3] lib/Kconfig.debug: Update AS_HAS_NON_CONST_LEB128
 comment and name
MIME-Version: 1.0
Message-Id: <20231205-riscv-restrict-dwarf5-llvm-v2-3-aedf00a382ac@kernel.org>
References: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
In-Reply-To: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 conor@kernel.org
Cc: maskray@google.com, ndesaulniers@google.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2652; i=nathan@kernel.org;
 h=from:subject:message-id; bh=ba9h7X86HRdFrwM84UeL/FEcVW5UbtpdyhVkFXYpoFE=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5O8Qtlz4tNM1ofLfhkoW1Ra3BRw8Z+ZPiPIJGdWf+3
 v9beFaxo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAExkfx8jw0Orx23NbNlW184l
 5S84tcruQCJzEdOSHROtlAVzt5qfO8TIMLdBiV1lV5pEhq1rolvs3x69kOiqkt8fzQ9dCpol8T6
 FBwA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_155404_566459_26C6BD10 
X-CRM114-Status: UNSURE (   9.88  )
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

Fangrui noted that the comment around CONFIG_AS_HAS_NON_CONST_LEB128
could be made more accurate because explicit .sleb128 directives are not
emitted, only .uleb128 directives are. Rename the symbol to
CONFIG_AS_HAS_NON_CONST_ULEB128 as a result.

Further clarifications include replacing "symbol deltas" with the more
accurate "label differences", noting that this issue has been resolved
in newer binutils (2.41+), and it only occurs when a port uses RISC-V
style linker relaxation.

Suggested-by: Fangrui Song <maskray@google.com>
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 lib/Kconfig.debug | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index a0ebce05a368..76c2cc697573 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -231,9 +231,10 @@ config DEBUG_INFO
 	  in the "Debug information" choice below, indicating that debug
 	  information will be generated for build targets.
 
-# Clang is known to generate .{s,u}leb128 with symbol deltas with DWARF5, which
-# some targets may not support: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
-config AS_HAS_NON_CONST_LEB128
+# Clang generates .uleb128 with label differences for DWARF v5, a feature that
+# older binutils ports do not support when utilizing RISC-V style linker
+# relaxation: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
+config AS_HAS_NON_CONST_ULEB128
 	def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
 
 choice
@@ -258,7 +259,7 @@ config DEBUG_INFO_NONE
 config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 	bool "Rely on the toolchain's implicit default DWARF version"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
+	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_ULEB128)
 	help
 	  The implicit default version of DWARF debug info produced by a
 	  toolchain changes over time.
@@ -283,7 +284,7 @@ config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
 	select DEBUG_INFO
 	depends on !ARCH_HAS_BROKEN_DWARF5
-	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
+	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_ULEB128)
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
 	  5.0+ accepts the -gdwarf-5 flag but only had partial support for some

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
