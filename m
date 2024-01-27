Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF0FC46CD2
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jan 2024 09:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ggb2CMfskEoToJi9oxMPxcINolRZR1BKZzcUjYlexMM=; b=X2VKIzA+kd4BEg
	k9Amxh9vGOJCJeGMhe/P0GYJ5Uh2c+VQN0k+mA362U0ph1pvgqZ94LyPYvNMI9wDpE1gV02IPOZKz
	5qO4ZpZBpph0fzZ/etPA6MwBwLFkWxpQSlbjaGqZ5RcqNEvSuIxBUA6FhOJsVzLVCmvrZyySfwlF7
	SLB363svyL08Bp2LXGPu8R/Z8Jny2Ns9Ku9Qe9b5CgkgSFI82JEr5l7xvq8/p4yfT41z5Y42WTGEg
	NSqpfIgLjpscJcWNut+vqHLchWpPt6PmDb05wHq3+i2NyXbHHiAZdKgIKWPkRIjzSrFJ76SgzObNs
	Me3Cfgs0GFfZQlbfUBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTeZ4-00000007CMG-3quv;
	Sat, 27 Jan 2024 09:01:26 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rTeZ2-00000007CLi-1XUd
	for linux-riscv@lists.infradead.org;
	Sat, 27 Jan 2024 09:01:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B2BD260ADC;
	Sat, 27 Jan 2024 09:01:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37BCAC433F1;
	Sat, 27 Jan 2024 09:01:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706346083;
	bh=hpNFNF09+4R9C/NT6J2wtQJfi2pvjGg8peeFOWYXxjU=;
	h=From:To:Cc:Subject:Date:From;
	b=H68dCSkYteFymi0Fxr4ZLnTtDfhc3iBgtp7a90RfidyQYu69r1r6CihH13IS38xKA
	 7Y6lvWBv2gcFEyLZ7+znoLsJ18B01ysbSi7TqxpUNXJDjWLhRejbBDgMlFauFXh4ho
	 PgX1lKteFbkEBIRK/boTZP8jxy8/KPzdwQ8qfbuK5SkmfjbayN6IDNPQrhOI0VvkMJ
	 NGevEz43xgBNX1hKceUzic8Bw2t3RuDqq3ZNOQxH75u0u5SfE8UY/gIOE4ozUeGeuB
	 LszLbDcljUQ2hOZ4ZAmeCkoYlvD5m4F4pw116jSOeoKtfeSDfZIdObP++x9JedU1FS
	 k2tgGoKo1zjrQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: linux-crypto@vger.kernel.org,
	llvm@lists.linux.dev,
	Brandon Wu <brandon.wu@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: [PATCH] RISC-V: fix check for zvkb with tip-of-tree clang
Date: Sat, 27 Jan 2024 01:00:54 -0800
Message-ID: <20240127090055.124336-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240127_010124_470790_397E7ACB 
X-CRM114-Status: UNSURE (   9.94  )
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

From: Eric Biggers <ebiggers@google.com>

LLVM commit 8e01042da9d3 ("[RISCV] Add missing dependency check for Zvkb
(#79467)") broke the check used by the TOOLCHAIN_HAS_VECTOR_CRYPTO
kconfig symbol because it made zvkb start depending on v or zve*.  Fix
this by specifying both v and zvkb when checking for support for zvkb.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/riscv/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index b49016bb5077b..912fff31492b9 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -581,21 +581,21 @@ config TOOLCHAIN_HAS_ZBB
 	default y
 	depends on !64BIT || $(cc-option,-mabi=lp64 -march=rv64ima_zbb)
 	depends on !32BIT || $(cc-option,-mabi=ilp32 -march=rv32ima_zbb)
 	depends on LLD_VERSION >= 150000 || LD_VERSION >= 23900
 	depends on AS_HAS_OPTION_ARCH
 
 # This symbol indicates that the toolchain supports all v1.0 vector crypto
 # extensions, including Zvk*, Zvbb, and Zvbc.  LLVM added all of these at once.
 # binutils added all except Zvkb, then added Zvkb.  So we just check for Zvkb.
 config TOOLCHAIN_HAS_VECTOR_CRYPTO
-	def_bool $(as-instr, .option arch$(comma) +zvkb)
+	def_bool $(as-instr, .option arch$(comma) +v$(comma) +zvkb)
 	depends on AS_HAS_OPTION_ARCH
 
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
 	depends on TOOLCHAIN_HAS_ZBB
 	depends on MMU
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Adds support to dynamically detect the presence of the ZBB

base-commit: cb4ede926134a65bc3bf90ed58dace8451d7e759
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
