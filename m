Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E57EDC25B78
	for <linux-riscv@archiver.kernel.org>; Tue, 28 May 2024 11:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=us4TsOE3Xd4ad/JFX1Lf4Ze9s7CzyDnUeSA9uq0fNhc=; b=cSdtDXkWMsx6oR
	T3FVjEnWkgjXeAjH0lGy/1wBfQdtdC7aexCMPw/3Nix0eIEtg2auqu8mN8XFnFvyrChYgn0ivADza
	qdkREuHGLh1fLfxpM40uJXwiJ9lYzjTZFmkT/4oCptF+lbAniD6U9pg2ZKvWfjylx75x4c2IvXXL2
	6aMKBVhGXV6AVXw4dXXxRv4nmPkT/gZVUWo92f22/hP28xtz+uST3aNaab3pXc2QS8Udoddcj9Vgr
	FR5RkZivEF6lJVa7Qmvl7Oo+lh77GztNZplLQYkhpPNegcnYIUxNZiYH2cu5zzgpTuJl1AHRQlCu/
	kvRoVO59O/Mn8J5BDZOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBujq-00000000Jmd-47rj;
	Tue, 28 May 2024 11:11:30 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sBujo-00000000Jkv-2VQY
	for linux-riscv@lists.infradead.org;
	Tue, 28 May 2024 11:11:29 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2457F61F34;
	Tue, 28 May 2024 11:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4EE77C32782;
	Tue, 28 May 2024 11:11:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716894687;
	bh=Lew/GJirKVQbNgT/9lPrUyM7EIKflfRQ9AxvZBFWPnY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LANNEXZ7aUsYYWjUrQr2uHL/XRNPWZ/LWpPgntHHP4Q6cdBkWWcMbnWINSdhrr7uM
	 x+I983sWtQSPh3BJ48ib6KPW0FwjNC0LzUFcliU8KO/HPtQhr1ldoSoEmPsPplOz4u
	 xiF8/oD8JxUmC5veg/14QqoliEdm4ID8OzIBgTe9UCc+cmRPy0Api6xKmG6hlq56by
	 Zm8Jh7bsyu2+jEzp5QOjrZyuNFV9mf2duShRA1KS8iww+cRHKSQIbmqkETezunLMyq
	 ZIfBjiorC6Dm2l7dtVgCEuME2DBpifzCmYmTOeNsPd6LMOjLxVMeyGvG6kpjAbVGYR
	 d3gnI8exHjobQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	xiao.w.wang@intel.com,
	Andrew Jones <ajones@ventanamicro.com>,
	pulehui@huawei.com,
	Charlie Jenkins <charlie@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-kernel@vger.kernel.org,
	Samuel Holland <samuel.holland@sifive.com>,
	Pu Lehui <pulehui@huaweicloud.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
Subject: [PATCH v3 2/2] RISC-V: separate Zbb optimisations requiring and not requiring toolchain support
Date: Tue, 28 May 2024 12:11:12 +0100
Message-ID: <20240528-opossum-flavorful-3411811b87e2@spud>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240528-applaud-violin-facef8d9d846@spud>
References: <20240528-applaud-violin-facef8d9d846@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=8645; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=H/d6fdfeBMe9MAi4ZkmXDzXqLDI7KeHtYyBfqezcFjg=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDGmhuy+UWcxm8Tt92aJj8z1D49LFKt4Wof0BKaI20Sx1h Rkb1X50lLIwiHEwyIopsiTe7muRWv/HZYdzz1uYOaxMIEMYuDgFYCKb7zD8dzaWSTF98pFv/ee+ 85+yp5yY+v/+8x0Zru7sC7Xycp0e5jH8ldptGcO8Seska7qq5TedQyrBkTbVcyRuW23eeIRBfMp SHgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_041128_771083_1700D66B 
X-CRM114-Status: GOOD (  17.65  )
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

From: Conor Dooley <conor.dooley@microchip.com>

It seems a bit ridiculous to require toolchain support for BPF to
assemble Zbb instructions, so move the dependency on toolchain support
for Zbb optimisations out of the Kconfig option and to the callsites.

Zbb support has always depended on alternatives, so while adjusting the
config options guarding optimisations, remove any checks for
whether or not alternatives are enabled.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
v2/v3:
- Per Drew's suggestion, drop the stub Kconfig option and instead push
  out the toolchain dependency to the relevant callsites.
- Delete a bunch of comments about only attempting Zbb if alternatives
  are available, since they always are.
---
 arch/riscv/Kconfig                    |  4 ++--
 arch/riscv/include/asm/arch_hweight.h |  6 +++---
 arch/riscv/include/asm/bitops.h       |  4 ++--
 arch/riscv/include/asm/checksum.h     |  3 +--
 arch/riscv/lib/csum.c                 | 21 +++------------------
 arch/riscv/lib/strcmp.S               |  5 +++--
 arch/riscv/lib/strlen.S               |  5 +++--
 arch/riscv/lib/strncmp.S              |  5 +++--
 8 files changed, 20 insertions(+), 33 deletions(-)

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 3b702e6cc051..a91c53b096e8 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -613,12 +613,12 @@ config TOOLCHAIN_HAS_VECTOR_CRYPTO
 
 config RISCV_ISA_ZBB
 	bool "Zbb extension support for bit manipulation instructions"
-	depends on TOOLCHAIN_HAS_ZBB
 	depends on RISCV_ALTERNATIVE
 	default y
 	help
 	   Add support for enabling optimisations in the kernel when the
-	   Zbb extension is detected at boot.
+	   Zbb extension is detected at boot. Some optimisations may
+	   additionally depend on toolchain support for Zbb.
 
 	   The Zbb extension provides instructions to accelerate a number
 	   of bit-specific operations (count bit population, sign extending,
diff --git a/arch/riscv/include/asm/arch_hweight.h b/arch/riscv/include/asm/arch_hweight.h
index 85b2c443823e..b94db541901a 100644
--- a/arch/riscv/include/asm/arch_hweight.h
+++ b/arch/riscv/include/asm/arch_hweight.h
@@ -19,7 +19,7 @@
 
 static __always_inline unsigned int __arch_hweight32(unsigned int w)
 {
-#ifdef CONFIG_RISCV_ISA_ZBB
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
 			  : : : : legacy);
@@ -50,7 +50,7 @@ static inline unsigned int __arch_hweight8(unsigned int w)
 #if BITS_PER_LONG == 64
 static __always_inline unsigned long __arch_hweight64(__u64 w)
 {
-# ifdef CONFIG_RISCV_ISA_ZBB
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
 	asm goto(ALTERNATIVE("j %l[legacy]", "nop", 0,
 				      RISCV_ISA_EXT_ZBB, 1)
 			  : : : : legacy);
@@ -64,7 +64,7 @@ static __always_inline unsigned long __arch_hweight64(__u64 w)
 	return w;
 
 legacy:
-# endif
+#endif
 	return __sw_hweight64(w);
 }
 #else /* BITS_PER_LONG == 64 */
diff --git a/arch/riscv/include/asm/bitops.h b/arch/riscv/include/asm/bitops.h
index 880606b0469a..6966d00c3a8a 100644
--- a/arch/riscv/include/asm/bitops.h
+++ b/arch/riscv/include/asm/bitops.h
@@ -15,7 +15,7 @@
 #include <asm/barrier.h>
 #include <asm/bitsperlong.h>
 
-#if !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE)
+#if !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE)
 #include <asm-generic/bitops/__ffs.h>
 #include <asm-generic/bitops/__fls.h>
 #include <asm-generic/bitops/ffs.h>
@@ -175,7 +175,7 @@ static __always_inline int variable_fls(unsigned int x)
 	 variable_fls(x_);					\
 })
 
-#endif /* !defined(CONFIG_RISCV_ISA_ZBB) || defined(NO_ALTERNATIVE) */
+#endif /* !(defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)) || defined(NO_ALTERNATIVE) */
 
 #include <asm-generic/bitops/ffz.h>
 #include <asm-generic/bitops/fls64.h>
diff --git a/arch/riscv/include/asm/checksum.h b/arch/riscv/include/asm/checksum.h
index 88e6f1499e88..da378856f1d5 100644
--- a/arch/riscv/include/asm/checksum.h
+++ b/arch/riscv/include/asm/checksum.h
@@ -49,8 +49,7 @@ static inline __sum16 ip_fast_csum(const void *iph, unsigned int ihl)
 	 * ZBB only saves three instructions on 32-bit and five on 64-bit so not
 	 * worth checking if supported without Alternatives.
 	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
 		unsigned long fold_temp;
 
 		asm goto(ALTERNATIVE("j %l[no_zbb]", "nop", 0,
diff --git a/arch/riscv/lib/csum.c b/arch/riscv/lib/csum.c
index 7fb12c59e571..9408f50ca59a 100644
--- a/arch/riscv/lib/csum.c
+++ b/arch/riscv/lib/csum.c
@@ -40,12 +40,7 @@ __sum16 csum_ipv6_magic(const struct in6_addr *saddr,
 	uproto = (__force unsigned int)htonl(proto);
 	sum += uproto;
 
-	/*
-	 * Zbb support saves 4 instructions, so not worth checking without
-	 * alternatives if supported
-	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
 		unsigned long fold_temp;
 
 		/*
@@ -157,12 +152,7 @@ do_csum_with_alignment(const unsigned char *buff, int len)
 	csum = do_csum_common(ptr, end, data);
 
 #ifdef CC_HAS_ASM_GOTO_TIED_OUTPUT
-	/*
-	 * Zbb support saves 6 instructions, so not worth checking without
-	 * alternatives if supported
-	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
 		unsigned long fold_temp;
 
 		/*
@@ -244,12 +234,7 @@ do_csum_no_alignment(const unsigned char *buff, int len)
 	end = (const unsigned long *)(buff + len);
 	csum = do_csum_common(ptr, end, data);
 
-	/*
-	 * Zbb support saves 6 instructions, so not worth checking without
-	 * alternatives if supported
-	 */
-	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) &&
-	    IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
+	if (IS_ENABLED(CONFIG_RISCV_ISA_ZBB) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB)) {
 		unsigned long fold_temp;
 
 		/*
diff --git a/arch/riscv/lib/strcmp.S b/arch/riscv/lib/strcmp.S
index 687b2bea5c43..204fb1c184f3 100644
--- a/arch/riscv/lib/strcmp.S
+++ b/arch/riscv/lib/strcmp.S
@@ -8,7 +8,8 @@
 /* int strcmp(const char *cs, const char *ct) */
 SYM_FUNC_START(strcmp)
 
-	ALTERNATIVE("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
+	__ALTERNATIVE_CFG("nop", "j strcmp_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
 
 	/*
 	 * Returns
@@ -43,7 +44,7 @@ SYM_FUNC_START(strcmp)
  * The code was published as part of the bitmanip manual
  * in Appendix A.
  */
-#ifdef CONFIG_RISCV_ISA_ZBB
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
 strcmp_zbb:
 
 .option push
diff --git a/arch/riscv/lib/strlen.S b/arch/riscv/lib/strlen.S
index 8ae3064e45ff..84909807d988 100644
--- a/arch/riscv/lib/strlen.S
+++ b/arch/riscv/lib/strlen.S
@@ -8,7 +8,8 @@
 /* int strlen(const char *s) */
 SYM_FUNC_START(strlen)
 
-	ALTERNATIVE("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
+	__ALTERNATIVE_CFG("nop", "j strlen_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
 
 	/*
 	 * Returns
@@ -33,7 +34,7 @@ SYM_FUNC_START(strlen)
 /*
  * Variant of strlen using the ZBB extension if available
  */
-#ifdef CONFIG_RISCV_ISA_ZBB
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
 strlen_zbb:
 
 #ifdef CONFIG_CPU_BIG_ENDIAN
diff --git a/arch/riscv/lib/strncmp.S b/arch/riscv/lib/strncmp.S
index aba5b3148621..87e7c83c1672 100644
--- a/arch/riscv/lib/strncmp.S
+++ b/arch/riscv/lib/strncmp.S
@@ -8,7 +8,8 @@
 /* int strncmp(const char *cs, const char *ct, size_t count) */
 SYM_FUNC_START(strncmp)
 
-	ALTERNATIVE("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB, CONFIG_RISCV_ISA_ZBB)
+	__ALTERNATIVE_CFG("nop", "j strncmp_zbb", 0, RISCV_ISA_EXT_ZBB,
+		IS_ENABLED(CONFIG_RISCV_ISA_ZBB_ALT) && IS_ENABLED(CONFIG_TOOLCHAIN_HAS_ZBB))
 
 	/*
 	 * Returns
@@ -46,7 +47,7 @@ SYM_FUNC_START(strncmp)
 /*
  * Variant of strncmp using the ZBB extension if available
  */
-#ifdef CONFIG_RISCV_ISA_ZBB
+#if defined(CONFIG_RISCV_ISA_ZBB) && defined(CONFIG_TOOLCHAIN_HAS_ZBB)
 strncmp_zbb:
 
 .option push
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
