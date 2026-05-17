Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF28CCD4F48
	for <linux-riscv@archiver.kernel.org>; Sun, 17 May 2026 23:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Au8tvoFwyAfmuRYVflQZvHlA+xtabldbJmTd8CIBuvU=; b=sAJiWa1fD1nL8G
	QzJYE1I9lLf0GFwqhlGaz0kNaq+p9BjqGnRGjyboH/dwrIdFEM6Z/0JuPf/nLBDW1SfVf7FziEyY4
	K3xlMBxS4UM+O+7BG5c6tPQMdGD5xUovp2gsU9Yl/KMU0mOWfWMj9Ns1gZM9ozewRycanNYz5sI/E
	+3LzxE+YfjT2KAeksadUpIuviWBtZNJNM6hIst726N3I+CbwT2Sc7FhhRSIJwr0EsfdoPD7qnNFej
	6pYjEWbXHw/csr/9brydHbEf5cpRP9Oqr2kW35d/Ipo6bw96jf8YWZ4xppO1wKo7JBS9DPQm1xFVe
	rbsdoV0WOjyhVBNAao4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkYW-0000000Dd2r-19wR;
	Sun, 17 May 2026 23:05:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOkYU-0000000Dd1J-1n5e
	for linux-riscv@lists.infradead.org;
	Sun, 17 May 2026 23:05:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8FB2360055;
	Sun, 17 May 2026 23:05:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1873C2BCB0;
	Sun, 17 May 2026 23:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1779059153;
	bh=GyD4YMZK6iTmrrn0wIfJEk2rAg5lFRlkKYqjrNci574=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VY9rQByGfVV6L5TlUYA1iU5QY4+/BVcBz4dJI/HUsdFzgbBP8uu67By+mBz6wwT4j
	 bdbMkAr997DMCcBguFjWaK49BOnxJ7CDog1BwLIXk2ydYPL4xkjQjKeaXgXL9qx847
	 KKERQCTlx7AQt+leIUiQKZsAX4IgVuqMHrkz3nNqd2V/0+KPkGlfN5YPkhbzjiftQj
	 h3uq2RfqzoaBm/d/iB28SE/JVb0kfgKamEp8GHsm+2YOZZdQNGaVoUvupAK1PHsYjz
	 eZ/fkhx+7lT2pPP7O3vZbPHjF5aSTBX+VQsBNKaFsRGJ4hgQ3xXurcr4numuwFArsN
	 +QuC8/lxZHwlg==
From: Nathan Chancellor <nathan@kernel.org>
Date: Sun, 17 May 2026 13:05:12 -1000
Subject: [PATCH v2 09/16] riscv: Drop tautological condition from
 TOOLCHAIN_NEEDS_OLD_ISA_SPEC
MIME-Version: 1.0
Message-Id: <20260517-bump-minimum-supported-llvm-version-to-17-v2-9-b3b8cda46bdd@kernel.org>
References: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
In-Reply-To: <20260517-bump-minimum-supported-llvm-version-to-17-v2-0-b3b8cda46bdd@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
Cc: linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
 linux-kbuild@vger.kernel.org, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2385; i=nathan@kernel.org;
 h=from:subject:message-id; bh=GyD4YMZK6iTmrrn0wIfJEk2rAg5lFRlkKYqjrNci574=;
 b=owGbwMvMwCUmm602sfCA1DTG02pJDFlcnpviOQ6piJWJG/gVr/RhmsKhdVHvi5xJe4xmgCGD6
 HPJ720dpSwMYlwMsmKKLNWPVY8bGs45y3jj1CSYOaxMIEMYuDgFYCIL2BgZ9kVwT/vheaBqY9M6
 Mbm+tzI762wPT5omVb7Q/PaD1bUcRxkZ5uoITxf+x5V08M73Q1V6eV8tbh1/+E9NUt9yd/XDwwc
 nsAIA
X-Developer-Key: i=nathan@kernel.org; a=openpgp;
 fpr=2437CB76E544CB6AB3D9DFD399739260CB6CB716
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

Acked-by: Paul Walmsley <pjw@kernel.org>  # arch/riscv
Signed-off-by: Nathan Chancellor <nathan@kernel.org>
---
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
