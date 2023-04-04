Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D54C9C761A6
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Apr 2023 20:34:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:MIME-Version:Subject:
	Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=iuNwK6EAu3aglnPi2yoeFdOPHSG1PJzitQ9+IYTOPYs=; b=Bqsu1CvhXvCs/w
	BorjQMSnlLu9p9V8EiBzPA4hIUr92Z1i9RKEyj/BM6gvXt+l4NhQi/tboWmZeXEKT85k/ShfYfBY/
	mKyPEYL117jxj2VpN4E7s6DD+n8ll7ECJwQTHhM6zqlA6GMLNA8l6Wh6tAopQJcdZCmmF4i/BaKKk
	sKUiy5jhjvLrvMjMimTdbgcBdjx7YFz6uzoWWvx+wNr/Adoq/7FT9pVjLOlrcnTYD7AEJ9MKWY/pU
	LQ9chlx5Rf0qxt5GrOopDmiIknNhHVKMUxuqDSit8SYxQOPdFcHIxEOA8CzShsoQCHkCCF2SXl3IE
	nnF1+QXlf39NMJgZaTUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnMX-002pGk-0T;
	Tue, 04 Apr 2023 20:34:41 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pjnMU-002pGN-0z
	for linux-riscv@lists.infradead.org;
	Tue, 04 Apr 2023 20:34:39 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 2C73663991;
	Tue,  4 Apr 2023 20:34:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DB6C433EF;
	Tue,  4 Apr 2023 20:34:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1680640476;
	bh=f9Q8RUBPEhru4mIukWyfEJKWB60FsQHSyVQLD8Udw4U=;
	h=From:Date:Subject:To:Cc:From;
	b=u3R9NrCRrcuZ7/L9eefkJ4kEf+pzrwn6XBpm5mqe41QMMLmWM+JZmSvSk7VYKuj0R
	 6aRckSK5Q4ok6wbjGWf5dbmpWssokXJPr4dvQMm2+75qL6nDywarVNz3UieHT++JT7
	 1d924nKlNGjCGXicl3cXCxukgc5mx7GqxGtWtiXV7nOr26ktmoabUZ70iFkqB3ypKv
	 TFSgmD8yNS2i7djmDpKOxW3OWkVpDUqDj8DkckDe7PgoE+g+PvC4PrtV0q+rIeDHOU
	 U2WvBi8OaTPCff/2Goe05ZmJQVFKDIAUd7hLCPw6zSsUvHyW37sdOpNRtbs8oWrf9W
	 yGZbRVz4n9hxA==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 04 Apr 2023 13:34:21 -0700
Subject: [PATCH] riscv: Adjust dependencies of HAVE_DYNAMIC_FTRACE
 selection
MIME-Version: 1.0
Message-Id: <20230404-riscv-dynamic-ftrace-checks-clang-v1-1-0ce296b7d423@kernel.org>
X-B4-Tracking: v=1; b=H4sIAMyJLGQC/x2N0QrCMAxFf2X02UA7i4q/Ij6kWWqDrkoyxmTs3
 +18PBzuuaszVmFz1251yrOYvGuDcOgcFawPBhkau973Rx99BBWjGYZvxVEI8qRIDFSYngb0ags
 4nS8hxUAx5OxaJ6ExJMVKZS+NaBPrLj7KWZb/+e2+bT9L0tUljAAAAA==
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu
Cc: ndesaulniers@google.com, trix@redhat.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.13-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2416; i=nathan@kernel.org;
 h=from:subject:message-id; bh=f9Q8RUBPEhru4mIukWyfEJKWB60FsQHSyVQLD8Udw4U=;
 b=owGbwMvMwCEmm602sfCA1DTG02pJDCk6nbe3RkkYagm8N/koavlrkr9OyM7A1A97Flz9vt4xJ
 f+q+orYjlIWBjEOBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCR6VKMDKe/1Wq4RSxXb5Oa
 dJzfUfWOWLKy+/YnibztGw/rFxelSTIynMlzFPd9l/r5hf++XWGfru83Vp75561C4dqMAofStiW
 tLAA=
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230404_133438_436918_A9360200 
X-CRM114-Status: GOOD (  12.66  )
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

When building allmodconfig with clang and its integrated assembler and
linking with a version of GNU ld prior to 2.36, the following link error
occurs:

  riscv64-linux-gnu-ld: .init.data has both ordered [`__patchable_function_entries' in init/main.o] and unordered [`.init_array.0' in kernel/trace/trace_benchmark.o] sections
  riscv64-linux-gnu-ld: final link failed: bad value

This is the same error addressed by commit 45bd8951806e ("arm64: Improve
HAVE_DYNAMIC_FTRACE_WITH_REGS selection for clang") for arm64. See that
changelog for a full description of why this error occurs with this
combination of tools.

In a similar manner as that change, restrict the
CONFIG_HAVE_DYNAMIC_FTRACE selection to combinations of tools known to
work so that there are no errors.

Link: https://github.com/ClangBuiltLinux/linux/issues/1817
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Kconfig | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index eb7f29a412f8..4b82838ac870 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -136,12 +136,23 @@ config RISCV
 	select TRACE_IRQFLAGS_SUPPORT
 	select UACCESS_MEMCPY if !MMU
 	select ZONE_DMA32 if 64BIT
-	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && $(cc-option,-fpatchable-function-entry=8)
+	select HAVE_DYNAMIC_FTRACE if !XIP_KERNEL && MMU && (CLANG_SUPPORTS_DYNAMIC_FTRACE || GCC_SUPPORTS_DYNAMIC_FTRACE)
 	select HAVE_DYNAMIC_FTRACE_WITH_REGS if HAVE_DYNAMIC_FTRACE
 	select HAVE_FTRACE_MCOUNT_RECORD if !XIP_KERNEL
 	select HAVE_FUNCTION_GRAPH_TRACER
 	select HAVE_FUNCTION_TRACER if !XIP_KERNEL && !PREEMPTION
 
+config CLANG_SUPPORTS_DYNAMIC_FTRACE
+	def_bool CC_IS_CLANG
+	# https://github.com/llvm/llvm-project/commit/6ab8927931851bb42b2c93a00801dc499d7d9b1e
+	depends on CLANG_VERSION >= 130000
+	# https://github.com/ClangBuiltLinux/linux/issues/1817
+	depends on AS_IS_GNU || (AS_IS_LLVM && (LD_IS_LLD || LD_VERSION >= 23600))
+
+config GCC_SUPPORTS_DYNAMIC_FTRACE
+	def_bool CC_IS_GCC
+	depends on $(cc-option,-fpatchable-function-entry=8)
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8

---
base-commit: 4622f159098e098611f393cccf73d52b007e70bc
change-id: 20230404-riscv-dynamic-ftrace-checks-clang-6781b41c41ff

Best regards,
-- 
Nathan Chancellor <nathan@kernel.org>


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
