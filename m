Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8883CC433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 14 Oct 2022 20:48:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=X1BoTnUt0DL5dTghLK62fEPz6zylZDCbrHGr/t878ug=; b=3BoFD1b9ykk2J3
	Y61eYZpFeOO8TzR9gqqQZ7H1Sa+FIoJdUrRIyl0m8RUaYC+1Pnbq7AiQHGFWftBsxwUNM9zY3AjZK
	NGuS7SyRUA/Y9gdgp7Kui+Co1S55eKo1rBZ+extU2Z02P6OhmEM/dLh4eTTevicbiziQhxh7Zcgxa
	hMp2P1vMKti/Uf+5IjMi9pJ3Y3MwXXVr8Cd9y+otcYvukDMiDfxEyphwDG7a49a3rm54HD/WMLxrM
	c3NzTJLYGqQ7Uffc2cu4286m7AOJhqwXix7OyeU+85HUES7+3nHa+olFl9Gc9TJ8qllii+ZeyJaWb
	S2qEsLQqoTwDeZqRJm1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojRbO-00FtUa-1O; Fri, 14 Oct 2022 20:48:18 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ojRbL-00FtTm-3A
	for linux-riscv@lists.infradead.org; Fri, 14 Oct 2022 20:48:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id AC71E61C39;
	Fri, 14 Oct 2022 20:48:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60012C433D7;
	Fri, 14 Oct 2022 20:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1665780493;
	bh=C3fOH2Mc8DRWmLYpWhPGyuj4dAcW5kYVpSBvOUxOFQc=;
	h=From:To:Cc:Subject:Date:From;
	b=pJdQ+TDxYwMeWzyEJyOKQ5BBV7ferow6GiaZchv9FWLdvRFrEENkmGWbNI5VhI9bZ
	 QLEBqI3IDlO1DXZiVCzavpUqsRVOpOUJ4xN7SYmSBjY2vKx1N6wRTFZpeCKCpt3QWM
	 MS9lRqcCaFCLrPizqRwI/wM+FNAJM+G8tpYP0AB4V8roJSuVicX095kjfB1qLmYIrM
	 f0VMKqzxb90LlGeTyyckFIwNSqUSNrizHWqiJAve0tygFODyI0vZGfzgRUvaxeqDla
	 lk/i63GdyfprtGwB8flJkDu7+uKY/v3bMn3c3jpHZFiLZ44xURS2ryrya4R2kpvhiP
	 OgjlJzPY9Sp+Q==
From: Nathan Chancellor <nathan@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Masahiro Yamada <masahiroy@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
	Tom Rix <trix@redhat.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Conor Dooley <conor@kernel.org>,
	linux-kbuild@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	patches@lists.linux.dev,
	llvm@lists.linux.dev,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH v2] lib/Kconfig.debug: Add check for non-constant .{s,u}leb128 support to DWARF5
Date: Fri, 14 Oct 2022 13:42:11 -0700
Message-Id: <20221014204210.383380-1-nathan@kernel.org>
X-Mailer: git-send-email 2.38.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221014_134815_254455_4A6C8C15 
X-CRM114-Status: GOOD (  18.51  )
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

When building with a RISC-V kernel with DWARF5 debug info using clang
and the GNU assembler, several instances of the following error appear:

  /tmp/vgettimeofday-48aa35.s:2963: Error: non-constant .uleb128 is not supported

Dumping the .s file reveals these .uleb128 directives come from
.debug_loc and .debug_ranges:

  .Ldebug_loc0:
          .byte   4                               # DW_LLE_offset_pair
          .uleb128 .Lfunc_begin0-.Lfunc_begin0    #   starting offset
          .uleb128 .Ltmp1-.Lfunc_begin0           #   ending offset
          .byte   1                               # Loc expr size
          .byte   90                              # DW_OP_reg10
          .byte   0                               # DW_LLE_end_of_list

  .Ldebug_ranges0:
          .byte   4                               # DW_RLE_offset_pair
          .uleb128 .Ltmp6-.Lfunc_begin0           #   starting offset
          .uleb128 .Ltmp27-.Lfunc_begin0          #   ending offset
          .byte   4                               # DW_RLE_offset_pair
          .uleb128 .Ltmp28-.Lfunc_begin0          #   starting offset
          .uleb128 .Ltmp30-.Lfunc_begin0          #   ending offset
          .byte   0                               # DW_RLE_end_of_list

There is an outstanding binutils issue to support a non-constant operand
to .sleb128 and .uleb128 in GAS for RISC-V but there does not appear to
be any movement on it, due to concerns over how it would work with
linker relaxation.

To avoid these build errors, prevent DWARF5 from being selected when
using clang and an assembler that does not have support for these symbol
deltas, which can be easily checked in Kconfig with as-instr plus the
small test program from the dwz test suite from the binutils issue.

Link: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
Link: https://github.com/ClangBuiltLinux/linux/issues/1719
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---

v2:
    - Rebase on commit bb1435f3f575 ("Kconfig.debug: add toolchain
      checks for DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT") from the kbuild
      tree.
    - Limit CONFIG_AS_HAS_NON_CONST_LEB128 dependency to GNU as. There
      is no point to applying this dependency to the integrated
      assembler because it will always pass.
    - Apply the CONFIG_AS_HAS_NON_CONST_LEB128 dependency to
      CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT as well, due to the
      aforementioned kbuild change.
    - Move comment block to above CONFIG_AS_HAS_NON_CONST_LEB128, as the
      configuration is now used in two places.
    - Drop Conor's tested by, as the patch is different enough to
      potentially require new testing.

v1: https://lore.kernel.org/20220928182523.3105953-1-nathan@kernel.org/

 lib/Kconfig.debug | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index db8d9271cabf..5c1c63575895 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -231,6 +231,11 @@ config DEBUG_INFO
 	  in the "Debug information" choice below, indicating that debug
 	  information will be generated for build targets.
 
+# Clang is known to generate .{s,u}leb128 with symbol deltas with DWARF5, which
+# some targets may not support: https://sourceware.org/bugzilla/show_bug.cgi?id=27215
+config AS_HAS_NON_CONST_LEB128
+	def_bool $(as-instr,.uleb128 .Lexpr_end4 - .Lexpr_start3\n.Lexpr_start3:\n.Lexpr_end4:)
+
 choice
 	prompt "Debug information"
 	depends on DEBUG_KERNEL
@@ -253,7 +258,7 @@ config DEBUG_INFO_NONE
 config DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT
 	bool "Rely on the toolchain's implicit default DWARF version"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502)
+	depends on !CC_IS_CLANG || AS_IS_LLVM || CLANG_VERSION < 140000 || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
 	help
 	  The implicit default version of DWARF debug info produced by a
 	  toolchain changes over time.
@@ -277,7 +282,7 @@ config DEBUG_INFO_DWARF4
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
 	select DEBUG_INFO
-	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502)
+	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc
 	  5.0+ accepts the -gdwarf-5 flag but only had partial support for some

base-commit: bb1435f3f575b5213eaf27434efa3971f51c01de
-- 
2.38.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
