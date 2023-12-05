Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3AF15C10DCE
	for <linux-riscv@archiver.kernel.org>; Tue,  5 Dec 2023 23:54:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SPsTQKjJtP8sLHFwYUanGqBRFhDwxqYZRK7r3pLjHW4=; b=LY4l+1z3S1YLAP
	MpMB2Mnx++gG6e49x5s4Ldyqw9uqDCAkZCJnK4aQsLjxFHb9vZWcm4IpBC8D64T/o9dKghRiat+CU
	/2rjRoDUUO7/XCC3Bs5Mfs2vsKM8JUH4JmDe0tp4kPuoWAHogZIzRqQjGnbleEFVDqevrf+rUZowr
	qRwIn97cu8pY41wp8dyZolc00vhHRBTHFZ+ld0JiaJh26HAD6dDTfC97eMw/RPR+FtejdPZTkISF1
	elMnBiJao+qrz4JzMm7NzbYUSPeyYK9EEyyROx3BuLqtdnb1ggpWjUfG52Npd8cj+IS7HnF/VWIUc
	Qi920Svi9hLxLliC6f/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfEr-008fRm-1h;
	Tue, 05 Dec 2023 23:54:05 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAfEo-008fQ2-0J
	for linux-riscv@lists.infradead.org;
	Tue, 05 Dec 2023 23:54:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F6D9619E2;
	Tue,  5 Dec 2023 23:54:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A4668C433CD;
	Tue,  5 Dec 2023 23:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701820441;
	bh=A8sPnu2KKz5CALRbBlnZLQ9BA9ZLoGfN4oxpbkVxKs8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=nHW9ePkxNxULIXpkQX7+3gpkoA53yAV+T5U/ICfkMgqE19v8jb/XiTgS3mpjAFz0X
	 v1OMPQ2t+6qK9PGVZkOf4gl2YOhZCdid/wBQx/LzsxdgL9+MrlBsAvckjGZoxt5E+b
	 gu2+Zkj6/N1RiQokIQOzlrI1+rblgQ7E5s7Ic8zl3bbIVqkJAfRGYy6D6eiY6bczFn
	 hCDtIab1jNvW0l+TFFVyAjOIRl/CxrkEaLHhQIU9akBjUhXRLnEQGmtDizAnViuru+
	 SgHaskbGA27UV05tsksGLfMVIMdh2ulX7DG9Klt8Rrryb5N+5jCM1LYWC1OjMtuxys
	 yrWuvjsjRXP6A==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 05 Dec 2023 16:53:51 -0700
Subject: [PATCH v2 2/3] riscv: Restrict DWARF5 when building with LLVM to
 known working versions
MIME-Version: 1.0
Message-Id: <20231205-riscv-restrict-dwarf5-llvm-v2-2-aedf00a382ac@kernel.org>
References: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
In-Reply-To: <20231205-riscv-restrict-dwarf5-llvm-v2-0-aedf00a382ac@kernel.org>
To: paul.walmsley@sifive.com, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
 conor@kernel.org
Cc: maskray@google.com, ndesaulniers@google.com, 
 linux-riscv@lists.infradead.org, llvm@lists.linux.dev, 
 patches@lists.linux.dev, Nathan Chancellor <nathan@kernel.org>
X-Mailer: b4 0.12.4
X-Developer-Signature: v=1; a=openpgp-sha256; l=2408; i=nathan@kernel.org;
 h=from:subject:message-id; bh=A8sPnu2KKz5CALRbBlnZLQ9BA9ZLoGfN4oxpbkVxKs8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDKn5O8Q4P8XYPkypEL9XtmnWDum2KwU1x6S1uGoOWs2q4
 mb5tjiuo5SFQYyLQVZMkaX6sepxQ8M5ZxlvnJoEM4eVCWQIAxenAEyk2p+R4UVQs57D9v0vnk7j
 kT5yIuFyrkZ25uH/wSvepxdtVGiRvc7I0HFz+uU7Pd7FV4SPr1z3TGUqX9v62D1eRQ0ViQueOMa
 tZQcA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_155402_219505_B5B31228 
X-CRM114-Status: UNSURE (   8.90  )
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

LLVM prior to 18.0.0 would generate incorrect debug info for DWARF5 due
to linker relaxation, which was worked around in clang by defaulting
RISC-V to DWARF4 [1]. Unfortunately, this workaround does not work for
the kernel because the DWARF version can be independently changed from
the default in Kconfig.

Do not allow DWARF5 to be selected for RISC-V when using linker
relaxation (ld.lld >= 15.0.0) and a version of LLVM that does not have
the fixes (the integrated assembler [2] and ld.lld [3] < 18.0.0)
necessary to generate the correct debug info.

Link: https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6 [1]
Link: https://github.com/llvm/llvm-project/commit/1df5ea29b43690b6622db2cad7b745607ca4de6a [2]
Link: https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77 [3]
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
 arch/riscv/Kconfig | 9 +++++++++
 lib/Kconfig.debug  | 1 +
 2 files changed, 10 insertions(+)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 72be1d8122a3..81b473cb47b0 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -186,6 +186,15 @@ config RISCV_USE_LINKER_RELAXATION
 	# https://github.com/llvm/llvm-project/commit/6611d58f5bbcbec77262d392e2923e1d680f6985
 	depends on !LD_IS_LLD || LLD_VERSION >= 150000
 
+# https://github.com/llvm/llvm-project/commit/bbc0f99f3bc96f1db16f649fc21dd18e5b0918f6
+config ARCH_HAS_BROKEN_DWARF5
+	def_bool y
+	depends on RISCV_USE_LINKER_RELAXATION
+	# https://github.com/llvm/llvm-project/commit/1df5ea29b43690b6622db2cad7b745607ca4de6a
+	depends on AS_IS_LLVM && AS_VERSION < 180000
+	# https://github.com/llvm/llvm-project/commit/7ffabb61a5569444b5ac9322e22e5471cc5e4a77
+	depends on LD_IS_LLD && LLD_VERSION < 180000
+
 config ARCH_MMAP_RND_BITS_MIN
 	default 18 if 64BIT
 	default 8
diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index cc7d53d9dc01..a0ebce05a368 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -282,6 +282,7 @@ config DEBUG_INFO_DWARF4
 config DEBUG_INFO_DWARF5
 	bool "Generate DWARF Version 5 debuginfo"
 	select DEBUG_INFO
+	depends on !ARCH_HAS_BROKEN_DWARF5
 	depends on !CC_IS_CLANG || AS_IS_LLVM || (AS_IS_GNU && AS_VERSION >= 23502 && AS_HAS_NON_CONST_LEB128)
 	help
 	  Generate DWARF v5 debug info. Requires binutils 2.35.2, gcc 5.0+ (gcc

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
