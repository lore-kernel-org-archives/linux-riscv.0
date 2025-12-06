Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 795D6D3B7D5
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Dec 2025 21:39:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=xN41FSdVINBVp+sLds9u9rx5yLRvhwF3JUsbehd4ZPw=; b=S2jt40ZhuVSGzc
	OshKbmYhWNLrp07hTKjlM8wR655yw9uaqYMTz6cKHB2hCVR9JdurmlJ2URteLLGhGhuLpMURmYOrC
	KsEN0RL7bciMK4jsjAYoBqBdUJpXwOv5/WanFQE5L+qKV6T0Pekn8KRKirchzcuCxJm9fANsf24lo
	lqD2fgPdmWYIAfcohpFAYQpfNc2m5xoFWva85hrlnlx40zG+2JzaDCjveA6WCNVIJeEBM9VffFc1X
	MvDkcoOtd+QBp/R/hs+CGPXYh9RhkUVwFhpkRh3JI1nn3sKm/PbfwSnpefWWGnMeqgGw/2UZVcohT
	r9SD/oDiMujPJF7iQ3Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzzc-0000000BFsz-1RQf;
	Sat, 06 Dec 2025 21:39:04 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRzza-0000000BFst-3tP6
	for linux-riscv@lists.infradead.org;
	Sat, 06 Dec 2025 21:39:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 090DE60121;
	Sat,  6 Dec 2025 21:39:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B52C4CEF5;
	Sat,  6 Dec 2025 21:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765057141;
	bh=VqxA+vk7+kFKmkSM5ewDPbsSJPAXmKMgK3ayRN52Vo0=;
	h=From:To:Cc:Subject:Date:From;
	b=dZogZj0F15SnYfn1Jk5cMxw8q+8tC9GDzvhInLS4sJdzXG5VCmRmzlOKGUIZp6lXD
	 JZdxxXgdoKVQvBjnbFF9eKZYtELX+E0z/nmArhNlRBVQvlz8Gb0XRDp9WCEDq1Q2pY
	 izNZF86KkxhTzZrK08FdT2jffufWu/pTxiUqaBMHiPAtF+BRi150wi1PT+qpPh5Xw1
	 5QA5tSnLUTANiGpq5FCopag+v3ZmlHPZWEOBVZZNccUEpRx138V7JOisycROXj82aj
	 ZjWjiOV3tNAMbD5NkGqiGbaImg8U2mxkBM5RT3S7sNzZE0/YLJUg8urgPT7FOMrRnL
	 IXy0n3p0Rrycg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-crypto@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Ard Biesheuvel <ardb@kernel.org>,
	"Jason A . Donenfeld" <Jason@zx2c4.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Vivian Wang <wangruikang@iscas.ac.cn>,
	Jerry Shih <jerry.shih@sifive.com>,
	"David S . Miller" <davem@davemloft.net>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Martin K . Petersen" <martin.petersen@oracle.com>,
	Han Gao <gaohan@iscas.ac.cn>,
	linux-riscv@lists.infradead.org,
	Eric Biggers <ebiggers@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH] lib/crypto: riscv: Depend on RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
Date: Sat,  6 Dec 2025 13:37:50 -0800
Message-ID: <20251206213750.81474-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
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

Replace the RISCV_ISA_V dependency of the RISC-V crypto code with
RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS, which implies RISCV_ISA_V as
well as vector unaligned accesses being efficient.

This is necessary because this code assumes that vector unaligned
accesses are supported and are efficient.  (It does so to avoid having
to use lots of extra vsetvli instructions to switch the element width
back and forth between 8 and either 32 or 64.)

This was omitted from the code originally just because the RISC-V kernel
support for detecting this feature didn't exist yet.  Support has now
been added, but it's fragmented into per-CPU runtime detection, a
command-line parameter, and a kconfig option.  The kconfig option is the
only reasonable way to do it, though, so let's just rely on that.

Fixes: eb24af5d7a05 ("crypto: riscv - add vector crypto accelerated AES-{ECB,CBC,CTR,XTS}")
Fixes: bb54668837a0 ("crypto: riscv - add vector crypto accelerated ChaCha20")
Fixes: 600a3853dfa0 ("crypto: riscv - add vector crypto accelerated GHASH")
Fixes: 8c8e40470ffe ("crypto: riscv - add vector crypto accelerated SHA-{256,224}")
Fixes: b3415925a08b ("crypto: riscv - add vector crypto accelerated SHA-{512,384}")
Fixes: 563a5255afa2 ("crypto: riscv - add vector crypto accelerated SM3")
Fixes: b8d06352bbf3 ("crypto: riscv - add vector crypto accelerated SM4")
Cc: stable@vger.kernel.org
Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 arch/riscv/crypto/Kconfig | 12 ++++++++----
 lib/crypto/Kconfig        |  9 ++++++---
 2 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/arch/riscv/crypto/Kconfig b/arch/riscv/crypto/Kconfig
index a75d6325607b..14c5acb935e9 100644
--- a/arch/riscv/crypto/Kconfig
+++ b/arch/riscv/crypto/Kconfig
@@ -2,11 +2,12 @@
 
 menu "Accelerated Cryptographic Algorithms for CPU (riscv)"
 
 config CRYPTO_AES_RISCV64
 	tristate "Ciphers: AES, modes: ECB, CBC, CTS, CTR, XTS"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		   RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	select CRYPTO_ALGAPI
 	select CRYPTO_LIB_AES
 	select CRYPTO_SKCIPHER
 	help
 	  Block cipher: AES cipher algorithms
@@ -18,21 +19,23 @@ config CRYPTO_AES_RISCV64
 	  - Zvkb vector crypto extension (CTR)
 	  - Zvkg vector crypto extension (XTS)
 
 config CRYPTO_GHASH_RISCV64
 	tristate "Hash functions: GHASH"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		   RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	select CRYPTO_GCM
 	help
 	  GCM GHASH function (NIST SP 800-38D)
 
 	  Architecture: riscv64 using:
 	  - Zvkg vector crypto extension
 
 config CRYPTO_SM3_RISCV64
 	tristate "Hash functions: SM3 (ShangMi 3)"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		   RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	select CRYPTO_HASH
 	select CRYPTO_LIB_SM3
 	help
 	  SM3 (ShangMi 3) secure hash function (OSCCA GM/T 0004-2012)
 
@@ -40,11 +43,12 @@ config CRYPTO_SM3_RISCV64
 	  - Zvksh vector crypto extension
 	  - Zvkb vector crypto extension
 
 config CRYPTO_SM4_RISCV64
 	tristate "Ciphers: SM4 (ShangMi 4)"
-	depends on 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	depends on 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		   RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	select CRYPTO_ALGAPI
 	select CRYPTO_SM4
 	help
 	  SM4 block cipher algorithm (OSCCA GB/T 32907-2016,
 	  ISO/IEC 18033-3:2010/Amd 1:2021)
diff --git a/lib/crypto/Kconfig b/lib/crypto/Kconfig
index a3647352bff6..6871a41e5069 100644
--- a/lib/crypto/Kconfig
+++ b/lib/crypto/Kconfig
@@ -59,11 +59,12 @@ config CRYPTO_LIB_CHACHA_ARCH
 	depends on CRYPTO_LIB_CHACHA && !UML && !KMSAN
 	default y if ARM
 	default y if ARM64 && KERNEL_MODE_NEON
 	default y if MIPS && CPU_MIPS32_R2
 	default y if PPC64 && CPU_LITTLE_ENDIAN && VSX
-	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	default y if S390
 	default y if X86_64
 
 config CRYPTO_LIB_CURVE25519
 	tristate
@@ -182,11 +183,12 @@ config CRYPTO_LIB_SHA256_ARCH
 	depends on CRYPTO_LIB_SHA256 && !UML
 	default y if ARM && !CPU_V7M
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
 	default y if PPC && SPE
-	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	default y if S390
 	default y if SPARC64
 	default y if X86_64
 
 config CRYPTO_LIB_SHA512
@@ -200,11 +202,12 @@ config CRYPTO_LIB_SHA512_ARCH
 	bool
 	depends on CRYPTO_LIB_SHA512 && !UML
 	default y if ARM && !CPU_V7M
 	default y if ARM64
 	default y if MIPS && CPU_CAVIUM_OCTEON
-	default y if RISCV && 64BIT && RISCV_ISA_V && TOOLCHAIN_HAS_VECTOR_CRYPTO
+	default y if RISCV && 64BIT && TOOLCHAIN_HAS_VECTOR_CRYPTO && \
+		     RISCV_EFFICIENT_VECTOR_UNALIGNED_ACCESS
 	default y if S390
 	default y if SPARC64
 	default y if X86_64
 
 config CRYPTO_LIB_SHA3

base-commit: 43dfc13ca972988e620a6edb72956981b75ab6b0
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
