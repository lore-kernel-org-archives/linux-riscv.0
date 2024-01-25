Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A336C47DDF
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jan 2024 22:56:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Oqks4z3yYyZxgIdHRAKq97rui4tLeXtzTYdQ9d99y4A=; b=vi8LSshe6ufxS4
	IFVbAQw5KP4oMCBVdXkZ937yQIZjIh7VSPBzNdDjs1WkgfIVqGm1Q21z5+M2X6p5W+mYp9ysWGDME
	NEjc/8hX7Ttqk5suI8i+jw3cmki/J40KbpcHWFSiOxX1g7UHIMcGZjSmV+CTFfyubfmGaSO5w7ibc
	1zX8MjwqPMpC++YAwIJyHfSLBkcEuXcf/6qzEEu2fAPDLmkuKydwDDBKEWSe1Pf6CU99GR3+7etxV
	B2kX8VziJ1afoHN8Mrl0uid/dSwFGTHhneos3JO2NqSZ/A4eM4oFsDqdBeBlgEmS7/8TmMjlQXkEB
	Jl/PWxLuQWyv50iLWx5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8dr-00000002JRn-3UC3;
	Thu, 25 Jan 2024 22:56:15 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rT8di-00000002JLj-3vGv
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jan 2024 22:56:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 552C462387;
	Thu, 25 Jan 2024 22:56:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 48A71C433A6;
	Thu, 25 Jan 2024 22:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706223366;
	bh=zFyRf340b4Mvmk4AZBMPn1ATdYHqCm1fuVo+aEb/I9Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cOoyKeNg3zlX8TFuDV6Cy9Rlb1Xg4NlOjPJ8PYg94zKsdTDXtoJB76fR7mlwAEUKe
	 WJLkP7H+S2oobOO4Sbv3ereOQEzMqetJFMR1mnSfE84a1rq2COJh4R3YquIOaeH8Z6
	 KcA49tVCLqodjXum0zzgUDiX2DehmBWo+V/xPBTBSWJmPXcCr75TcPYyTpSJkjsJQV
	 q9wNfi1TSzR9CHU71yb8XQGAvk2NVCF5kCrH6Jj7u6/uak2RAYxihyKmpQ8bwsGCgD
	 Z0XFpxf5Bm/sYfr+YyF6478lHnOsiHB4E2da6Q3XYAtpHsgCtLn2UWJ4/I1ev/LTBa
	 1eV3yaddOUB6A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Thu, 25 Jan 2024 15:55:13 -0700
Subject: [PATCH 07/11] riscv: Remove MCOUNT_NAME workaround
MIME-Version: 1.0
Message-Id: <20240125-bump-min-llvm-ver-to-13-0-1-v1-7-f5ff9bda41c5@kernel.org>
References: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
In-Reply-To: <20240125-bump-min-llvm-ver-to-13-0-1-v1-0-f5ff9bda41c5@kernel.org>
To: akpm@linux-foundation.org, masahiroy@kernel.org
Cc: nicolas@fjasle.eu, linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Nathan Chancellor <nathan@kernel.org>, paul.walmsley@sifive.com, 
 palmer@dabbelt.com, aou@eecs.berkeley.edu, conor@kernel.org, 
 linux-riscv@lists.infradead.org
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3407; i=nathan@kernel.org;
 h=from:subject:message-id; bh=zFyRf340b4Mvmk4AZBMPn1ATdYHqCm1fuVo+aEb/I9Y=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKmbnv3zPlsw8/ey1V+jI92ctNQZ4uvU5vzmlf4vw1+76
 cqUlXeDO0pZGMS4GGTFFFmqH6seNzScc5bxxqlJMHNYmUCGMHBxCsBE3CUYGbY02hvOi1ZSXXxN
 SNn5yds3Dxfc0JomVNVv6u4gPPGT5SFGhmsT5mdn5rK35Cw6qJxyRaiEIXnjtFDduebCQo6/vwr
 MZwMA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240125_145607_148205_B32CD3DB 
X-CRM114-Status: GOOD (  12.64  )
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
has been bumped to 13.0.1, the condition for using _mcount as
MCOUNT_NAME is always true, as the build will fail during the
configuration stage for older LLVM versions. Replace MCOUNT_NAME with
_mcount directly.

This effectively reverts commit 7ce047715030 ("riscv: Workaround mcount
name prior to clang-13").

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: paul.walmsley@sifive.com
Cc: palmer@dabbelt.com
Cc: aou@eecs.berkeley.edu
Cc: conor@kernel.org
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/include/asm/ftrace.h | 14 ++------------
 arch/riscv/kernel/mcount.S      | 10 +++++-----
 scripts/recordmcount.pl         |  2 +-
 3 files changed, 8 insertions(+), 18 deletions(-)

diff --git a/arch/riscv/include/asm/ftrace.h b/arch/riscv/include/asm/ftrace.h
index 06874fb1311e..cf5b63e789fa 100644
--- a/arch/riscv/include/asm/ftrace.h
+++ b/arch/riscv/include/asm/ftrace.h
@@ -13,19 +13,9 @@
 #endif
 #define HAVE_FUNCTION_GRAPH_RET_ADDR_PTR
 
-/*
- * Clang prior to 13 had "mcount" instead of "_mcount":
- * https://github.com/llvm/llvm-project/commit/ef58ae86ba778ed7d01cd3f6bd6d08f943abab44
- */
-#if defined(CONFIG_CC_IS_GCC) || CONFIG_CLANG_VERSION >= 130000
-#define MCOUNT_NAME _mcount
-#else
-#define MCOUNT_NAME mcount
-#endif
-
 #define ARCH_SUPPORTS_FTRACE_OPS 1
 #ifndef __ASSEMBLY__
-void MCOUNT_NAME(void);
+void _mcount(void);
 static inline unsigned long ftrace_call_adjust(unsigned long addr)
 {
 	return addr;
@@ -75,7 +65,7 @@ struct dyn_arch_ftrace {
  * both auipc and jalr at the same time.
  */
 
-#define MCOUNT_ADDR		((unsigned long)MCOUNT_NAME)
+#define MCOUNT_ADDR		((unsigned long)_mcount)
 #define JALR_SIGN_MASK		(0x00000800)
 #define JALR_OFFSET_MASK	(0x00000fff)
 #define AUIPC_OFFSET_MASK	(0xfffff000)
diff --git a/arch/riscv/kernel/mcount.S b/arch/riscv/kernel/mcount.S
index d7ec69ac6910..3a42f6287909 100644
--- a/arch/riscv/kernel/mcount.S
+++ b/arch/riscv/kernel/mcount.S
@@ -50,8 +50,8 @@
 
 SYM_TYPED_FUNC_START(ftrace_stub)
 #ifdef CONFIG_DYNAMIC_FTRACE
-       .global MCOUNT_NAME
-       .set    MCOUNT_NAME, ftrace_stub
+       .global _mcount
+       .set    _mcount, ftrace_stub
 #endif
 	ret
 SYM_FUNC_END(ftrace_stub)
@@ -80,7 +80,7 @@ SYM_FUNC_END(return_to_handler)
 #endif
 
 #ifndef CONFIG_DYNAMIC_FTRACE
-SYM_FUNC_START(MCOUNT_NAME)
+SYM_FUNC_START(_mcount)
 	la	t4, ftrace_stub
 #ifdef CONFIG_FUNCTION_GRAPH_TRACER
 	la	t0, ftrace_graph_return
@@ -126,6 +126,6 @@ SYM_FUNC_START(MCOUNT_NAME)
 	jalr	t5
 	RESTORE_ABI_STATE
 	ret
-SYM_FUNC_END(MCOUNT_NAME)
+SYM_FUNC_END(_mcount)
 #endif
-EXPORT_SYMBOL(MCOUNT_NAME)
+EXPORT_SYMBOL(_mcount)
diff --git a/scripts/recordmcount.pl b/scripts/recordmcount.pl
index f84df9e383fd..0871b2e92584 100755
--- a/scripts/recordmcount.pl
+++ b/scripts/recordmcount.pl
@@ -352,7 +352,7 @@ if ($arch eq "x86_64") {
     $mcount_regex = "^\\s*([0-9a-fA-F]+):.*\\s_mcount\$";
 } elsif ($arch eq "riscv") {
     $function_regex = "^([0-9a-fA-F]+)\\s+<([^.0-9][0-9a-zA-Z_\\.]+)>:";
-    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL(_PLT)?\\s_?mcount\$";
+    $mcount_regex = "^\\s*([0-9a-fA-F]+):\\sR_RISCV_CALL(_PLT)?\\s_mcount\$";
     $type = ".quad";
     $alignment = 2;
 } elsif ($arch eq "csky") {

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
