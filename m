Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9719CC77B7F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Jun 2025 20:25:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0syJbVM1miLagbnw2nTkDpmfucBfcU1DZ15+LEeKK+Y=; b=oapeSZptlWhqoG
	iVowK4rHBgZjhyp6un0Vfu561TAlLg6FpNuHUj//MjOxjQ+6rjtwwa+rtobJwdpWNc9bDgyABjJSx
	cgHe2kDfvHC/Zw+7HriknzzFdPvIKPzkomfukuJ1pbIdsEz1Bofmuo4Iep1UFQUdiqqWiqtXGJ23L
	kx5zGxhH5mYZEhWQiAGrOCVn8IP0bIsMG7KzA+UZ+IC4q/aOHNTVGLUwPqRXnLyHKzUDh8nQER2Ac
	aAJnfIpr72SuOOKKQd+8Ibm/huUesq/vA8F/XydAQpoG40fLCnKGyfXctzoTpQkCW3W7iZDxWIrWi
	jBMM35kc3PjUSzanD9Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLpP-0000000EChE-42hC;
	Thu, 19 Jun 2025 20:25:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpz-0000000E58S-0udL;
	Thu, 19 Jun 2025 19:22:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GrH5VSiT8MxMaUazRdkPM5zdFPyr24toXYctKu98oRI=; b=Bmra/Exew9m0oBmU+70rzeJByW
	iRSmTULGsyL3uZ+sNd36NWKbaW0KOvH9/dSuS46pnfpvuQ1Z6DBKU5nN7l9x2iEk8N5rMvuY375Ly
	A8do7aj8TamlRLLVUxDK3rWiE5/tf+RP5RHthFL9Py7TxSmID5nWk+XXq7R4BSM06u5Kt1hVdllfa
	o7ENt92kFlOTyA6dF/qOYsfNJHCOionZ+4y3Koe6PMhHvIlCwrwQIIEtMkjSgloMkafE1DmGV2tfl
	Dnc/6K3TxaddkiT2q6+qq6K4ZNOwMcQnvPcMemJ1YeCiy4fLlru5w9tDxLE+pWP4yRrB3SjlgJzep
	LTq5n2+Q==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSKpw-00000004YiF-11vV;
	Thu, 19 Jun 2025 19:22:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E12D04AD71;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7655EC4CEF4;
	Thu, 19 Jun 2025 19:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750360927;
	bh=ElmQYzEq2VpH5qDwci77lBilaBOMdPQESLW1rZ2SRRM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JdVrvlVoT1rtjzzaiUrJC17MtKX7Yf1MYoVVn55rjbbBkeAyoyDAWcKiRxC1s4GCz
	 bcaelq71ZOJTM97boLCl0atez/vFDxJXitE/4z++ykOXNxIccnJ1WybTUdkYzbFGXG
	 Y8hzHw+grTUKsz7NPQjENahSCa73vi4pxsFRkq/MqHQPxz971u/dTf2DpYCkQhPPmB
	 llp3Om+CL2tH037cOojS9FSg0cP1sKARmB++dbAAzreVsNdpYK4/oqdCRYZm6lwUnk
	 BRaznLPDKnueBbfcH5+h3ElAsf3JTTU2fDJzk+zBp+1cbnuqHQxhaBLQ13BYY6QDgE
	 OrMdX3QCoJVXQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Jason A . Donenfeld " <Jason@zx2c4.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mips@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	x86@kernel.org
Subject: [PATCH v2 3/9] lib/crypto: mips: move arch/mips/lib/crypto/ into lib/crypto/
Date: Thu, 19 Jun 2025 12:19:02 -0700
Message-ID: <20250619191908.134235-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250619191908.134235-1-ebiggers@kernel.org>
References: <20250619191908.134235-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_202212_767785_958B51B1 
X-CRM114-Status: GOOD (  17.16  )
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

Move the contents of arch/mips/lib/crypto/ into lib/crypto/mips/.

The new code organization makes a lot more sense for how this code
actually works and is developed.  In particular, it makes it possible to
build each algorithm as a single module, with better inlining and dead
code elimination.  For a more detailed explanation, see the patchset
which did this for the CRC library code:
https://lore.kernel.org/r/20250607200454.73587-1-ebiggers@kernel.org/.
Also see the patchset which did this for SHA-512:
https://lore.kernel.org/linux-crypto/20250616014019.415791-1-ebiggers@kernel.org/

This is just a preparatory commit, which does the move to get the files
into their new location but keeps them building the same way as before.
Later commits will make the actual improvements to the way the
arch-optimized code is integrated for each algorithm.

Add a gitignore entry for the removed directory arch/mips/lib/crypto/ so
that people don't accidentally commit leftover generated files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 arch/mips/lib/.gitignore                                   | 4 ++++
 arch/mips/lib/Makefile                                     | 2 --
 lib/crypto/Kconfig                                         | 2 +-
 lib/crypto/Makefile                                        | 1 +
 {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore       | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig          | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/Makefile         | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c    | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c  | 0
 {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl | 0
 11 files changed, 6 insertions(+), 3 deletions(-)
 create mode 100644 arch/mips/lib/.gitignore
 rename {arch/mips/lib/crypto => lib/crypto/mips}/.gitignore (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Kconfig (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/Makefile (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-core.S (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/chacha-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-glue.c (100%)
 rename {arch/mips/lib/crypto => lib/crypto/mips}/poly1305-mips.pl (100%)

diff --git a/arch/mips/lib/.gitignore b/arch/mips/lib/.gitignore
new file mode 100644
index 0000000000000..647d7a922e680
--- /dev/null
+++ b/arch/mips/lib/.gitignore
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+# This now-removed directory used to contain generated files.
+/crypto/
diff --git a/arch/mips/lib/Makefile b/arch/mips/lib/Makefile
index 9d75845ef78e1..9c024e6d5e54c 100644
--- a/arch/mips/lib/Makefile
+++ b/arch/mips/lib/Makefile
@@ -1,12 +1,10 @@
 # SPDX-License-Identifier: GPL-2.0
 #
 # Makefile for MIPS-specific library files..
 #
 
-obj-y	+= crypto/
-
 lib-y	+= bitops.o csum_partial.o delay.o memcpy.o memset.o \
 	   mips-atomic.o strncpy_user.o \
 	   strnlen_user.o uncached.o
 
 obj-y			+= iomap_copy.o
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index fdeb91bf00328..43c44316fbbdc 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -194,11 +194,11 @@ source "lib/crypto/arm/Kconfig"
 endif
 if ARM64
 source "lib/crypto/arm64/Kconfig"
 endif
 if MIPS
-source "arch/mips/lib/crypto/Kconfig"
+source "lib/crypto/mips/Kconfig"
 endif
 if PPC
 source "arch/powerpc/lib/crypto/Kconfig"
 endif
 if RISCV
diff --git a/lib/crypto/Makefile b/lib/crypto/Makefile
index 63ab907e8f53b..74331243b8c44 100644
--- a/lib/crypto/Makefile
+++ b/lib/crypto/Makefile
@@ -103,5 +103,6 @@ obj-$(CONFIG_CRYPTO_SELFTESTS)			+= simd.o
 obj-$(CONFIG_CRYPTO_LIB_SM3)			+= libsm3.o
 libsm3-y					:= sm3.o
 
 obj-$(CONFIG_ARM) += arm/
 obj-$(CONFIG_ARM64) += arm64/
+obj-$(CONFIG_MIPS) += mips/
diff --git a/arch/mips/lib/crypto/.gitignore b/lib/crypto/mips/.gitignore
similarity index 100%
rename from arch/mips/lib/crypto/.gitignore
rename to lib/crypto/mips/.gitignore
diff --git a/arch/mips/lib/crypto/Kconfig b/lib/crypto/mips/Kconfig
similarity index 100%
rename from arch/mips/lib/crypto/Kconfig
rename to lib/crypto/mips/Kconfig
diff --git a/arch/mips/lib/crypto/Makefile b/lib/crypto/mips/Makefile
similarity index 100%
rename from arch/mips/lib/crypto/Makefile
rename to lib/crypto/mips/Makefile
diff --git a/arch/mips/lib/crypto/chacha-core.S b/lib/crypto/mips/chacha-core.S
similarity index 100%
rename from arch/mips/lib/crypto/chacha-core.S
rename to lib/crypto/mips/chacha-core.S
diff --git a/arch/mips/lib/crypto/chacha-glue.c b/lib/crypto/mips/chacha-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/chacha-glue.c
rename to lib/crypto/mips/chacha-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-glue.c b/lib/crypto/mips/poly1305-glue.c
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-glue.c
rename to lib/crypto/mips/poly1305-glue.c
diff --git a/arch/mips/lib/crypto/poly1305-mips.pl b/lib/crypto/mips/poly1305-mips.pl
similarity index 100%
rename from arch/mips/lib/crypto/poly1305-mips.pl
rename to lib/crypto/mips/poly1305-mips.pl
-- 
2.50.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
