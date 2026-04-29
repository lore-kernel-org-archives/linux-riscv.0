Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05CB6FF885A
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Apr 2026 03:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2D7gTaWBpyEFa58Io8Ms7//E7wRVtaeC3vf2gRChh48=; b=BOY5M4IXVuRLvS
	P0Yz3MEMHGmvrcdKlzHqtzyc+zb+Oueh3o+FfBB9ndpeg9Q5CAgjcGRIctsfPvVtMeskEQS/gIlzf
	qFXtC7vfSSe5NAj/XRv5UPo55hcI5p/L/SA9W7ahhM1dhog+SCEGI6haqPJfDMwzrm8/FCIRJry84
	Oq2sMMqRYK1awp7PXQvRwibfJG1OQdXQZ0dCIQNOmgx/KTXr7McaBX/SV2m6a5v1phZAAY7+fxctv
	oZw+cttKI/0hTrvrhhfbOUn8wQsGytO2zgXqd1zrMMImurwm2Eybc+41hNxTUp/phE5VNzJJEiyex
	6XTLFM58oOdNjqFPDPOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvAD-00000002ors-2uUk;
	Wed, 29 Apr 2026 03:00:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHvA9-00000002opS-2TiQ
	for linux-riscv@lists.infradead.org;
	Wed, 29 Apr 2026 03:00:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 4E7C5444DE;
	Wed, 29 Apr 2026 03:00:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C241CC2BCB9;
	Wed, 29 Apr 2026 03:00:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777431633;
	bh=VV8j8atRtBl0rZ3kwWWsXkUtQK3wCUXY33E84mExNh8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=I6Bpjqv/CMr0eXGa8489oMOv3kr9X/MIEvlyI9K+JmcMWsduhjpx1tS7soM7ROzI8
	 Wp/0C6VHNovkixNtXuRbzduB7ikQg5slVRo5uD8ZWsYFVOTqWU+bAmzZOe02CXkU45
	 neQVyQkGuVQK6dnMBeNDjunbUiyn9MS+hXj3OyppExmxGu4lFVaegr3FOTHwwyGmX9
	 lJLz3qwr9u+S62Z4beafFYX/iWHoCki0rVPB5DdcEecdtc/csHx5IJBrEgwj9/gTA/
	 ueM4uP2m/IARoCao+J/CPFwAfE3lnnEQ7OxElSGFGwfHj+C43fhO0XStUW7+vCGWrS
	 76Fb9Nhi6MALQ==
From: Nathan Chancellor <nathan@kernel.org>
Date: Tue, 28 Apr 2026 22:59:15 -0400
Subject: [PATCH 09/14] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
MIME-Version: 1.0
Message-Id: <20260428-bump-minimum-supported-llvm-version-to-17-v1-9-81d9b2e8ee75@kernel.org>
References: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
In-Reply-To: <20260428-bump-minimum-supported-llvm-version-to-17-v1-0-81d9b2e8ee75@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2365; i=nathan@kernel.org;
 h=from:subject:message-id; bh=VV8j8atRtBl0rZ3kwWWsXkUtQK3wCUXY33E84mExNh8=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDJkfS4zWdFaGX5oTWcf2wo7NfNMJ/+dzW6Xv6G17qDdDj
 OkZ/y2hjlIWBjEuBlkxRZbqx6rHDQ3nnGW8cWoSzBxWJpAhDFycAjCRh4kM/xNP6u6/JLvfuSjk
 PJec1x/bz7532lczlsza9GPFzIbexqcM/8t2z3reft1noq+P3OmQTvM64+8rNeJ/eK65r9m6Sfl
 iGz8A
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_200033_723922_488B0796 
X-CRM114-Status: GOOD (  12.74  )
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
has been raised to 17.0.1, the Clang dependency part of
CONFIG_TOOLCHAIN_NEEDS_OLD_ISA_SPEC is always false, so it can be
removed. Adjust the help text to remove mention of Clang < 17, as it is
irrelevant for the kernel after the minimum supported bump.

Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
Cc: Paul Walmsley <pjw@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-riscv@lists.infradead.org
---
 arch/riscv/Kconfig | 13 ++++++-------
 1 file changed, 6 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 7ffbf6032b61..c742c42fd39b 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -873,19 +873,18 @@ config TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
 	  and Zifencei are supported in binutils from version 2.36 onwards.
 	  To make life easier, and avoid forcing toolchains that default to a
 	  newer ISA spec to version 2.2, relax the check to binutils >= 2.36.
-	  For clang < 17 or GCC < 11.3.0, for which this is not possible or need
-	  special treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
+	  For GCC < 11.3.0, for which this is not possible or need special
+	  treatment, this is dealt with in TOOLCHAIN_NEEDS_OLD_ISA_SPEC.
 
 config TOOLCHAIN_NEEDS_OLD_ISA_SPEC
 	def_bool y
 	depends on TOOLCHAIN_NEEDS_EXPLICIT_ZICSR_ZIFENCEI
-	# https://github.com/llvm/llvm-project/commit/22e199e6afb1263c943c0c0d4498694e15bf8a16
 	# https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=d29f5d6ab513c52fd872f532c492e35ae9fd6671
-	depends on (CC_IS_CLANG && CLANG_VERSION < 170000) || (CC_IS_GCC && GCC_VERSION < 110300)
+	depends on CC_IS_GCC && GCC_VERSION < 110300
 	help
-	  Certain versions of clang and GCC do not support zicsr and zifencei via
-	  -march. This option causes an older ISA spec compatible with these older
-	  versions of clang and GCC to be passed to GAS, which has the same result
+	  Certain versions of GCC do not support zicsr and zifencei via -march.
+	  This option causes an older ISA spec compatible with these older
+	  versions of GCC to be passed to GAS, which has the same result
 	  as passing zicsr and zifencei to -march.
 
 config FPU

-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
