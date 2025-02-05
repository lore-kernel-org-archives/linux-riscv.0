Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A7CDC02198
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Feb 2025 16:19:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ROdSnjp/HEjpaAVNMPIDuvvQHDdwcmytU2FFd1eM90Y=; b=tK03cspSLUo+zS
	acydaKpCHyySDxsXv6qUkeQxedxf9mv3AA/9wS/e7Ied7H+Xt0p3XUzDVYRz1EV7eN2tFLfwe1nuK
	wJnStsp6amW3hgEUumGl0Q5FNHG3LUmNaXixeU2PPTbELw/EpsjHI5NnUgXrR3Gmd3uJGI9/fnU3z
	5+cxTCb1aNL4GijYMJLsfaWf0FBbrOtEpp4fmM9iCniftfvjuP7lDdG2jIL/irQDb125nIPGh343Q
	vcZr2nY8tWkqIePSwIMZRUi0ibEKvCdJKOyNnkYAEAS2z6Q7Hn99FPvoXwjhS6pm26TdHoJh8cwcy
	qWdfpoQimFewYXrihmkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfi7O-00000003wy5-3mZL;
	Wed, 05 Feb 2025 16:19:14 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfhwr-00000003ueV-1cBQ
	for linux-riscv@lists.infradead.org;
	Wed, 05 Feb 2025 16:08:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 93A98A437F2;
	Wed,  5 Feb 2025 16:06:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2727EC4CED1;
	Wed,  5 Feb 2025 16:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771700;
	bh=qJFZa1EKck3rTDkEkJN+mxWME2YNA+lKI4hydp08qho=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UpNG8ZMtZrQa2NketkiehLRBvneCbXCG3J24ifhHwc6Lu8+vkuJpk55h21GBAd258
	 WVvk/OWpKJV+KR+vnjeD4/DwNtr4l/6nuMkTp47khFLds/JiZuZzyfF53dAUBdEewA
	 LqsvzIQxOhU8J6HEu711yHDvUx0MdNHcqsSTDdcbWyXu6ZHWvZVy5gflfOQpAFpxFT
	 TfH93rgJ483hgIx+ZtZSuG5tILERQ9+PMY4AWd92P/TmjmWuFaGyJ0WCtncIU50Aa2
	 Uz7ckmtjWlZtPuLDljHiNw7rcPX6PrBZ9P8EwH9a52b/i2nV/VFseOwzxA0DYBa7Iq
	 j9Vg6DUqLZGog==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Eric Biggers <ebiggers@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	=?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Andy Chiu <andybnac@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/6] RISC-V: add vector crypto extension validation checks
Date: Wed,  5 Feb 2025 16:05:08 +0000
Message-ID: <20250205-quench-entrench-09bed8c8c823@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250205-cobbler-unpadded-5580c1f5d946@spud>
References: <20250205-cobbler-unpadded-5580c1f5d946@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6134; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=ONsc8bsazl5cw6gaE940j7lsoq9zYTyfrqkv0H4vDBo=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOmLe2wcLVxvXpZ0yjRwiNdbHcT+Xz2w1GD1RqGTVf9ld nNyOF7vKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEQ+5zD8j1r37Kf/60ks+337 PfzL1I8rlejOniLcYfTVvEN31fvNJowMPcHM+yfemrjEsvPnXlWu64nzuM+xrA6+xVzaPnfZzB3 GrAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_080821_563907_199760B4 
X-CRM114-Status: GOOD (  16.89  )
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

Using Clement's new validation callbacks, support checking that
dependencies have been satisfied for the vector crpyto extensions.
Currently riscv_isa_extension_available(<vector crypto>) will return
true on systems that support the extensions but vector itself has been
disabled by the kernel, adding validation callbacks will prevent such a
scenario from occuring and make the behaviour of the extension detection
functions more consistent with user expectations - it's not expected to
have to check for vector AND the specific crypto extension.

The 1.0.0 Vector crypto spec states:
	The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly
	the composite extensions Zvkn and Zvks-- require a Zve64x base,
	or application ("V") base Vector Extension. All of the other
	Vector Crypto Extensions can be built on any embedded (Zve*) or
	application ("V") base Vector Extension.
and this could be used as the basis for checking that the correct base
for individual crypto extensions, but that's not really the kernel's job
in my opinion and it is sufficient to leave that sort of precision to
the dt-bindings. The kernel only needs to make sure that vector, in some
form, is available.

Since vector will now be disabled proactively, there's no need to clear
the bit in elf_hwcap in riscv_fill_hwcap() any longer.

Link: https://github.com/riscv/riscv-crypto/releases/tag/v1.0.0
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 40a24b08d905..1c148ecea612 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -138,6 +138,23 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
 	return 0;
 }
 
+static int riscv_ext_vector_crypto_validate(const struct riscv_isa_ext_data *data,
+					    const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_V))
+		return -EINVAL;
+
+	/*
+	 * It isn't the kernel's job to check that the binding is correct, so
+	 * it should be enough to check that any of the vector extensions are
+	 * enabled, which in-turn means that vector is usable in this kernel
+	 */
+	if (!__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_ZVE32X))
+		return -EINVAL;
+
+	return 0;
+}
+
 static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
 				 const unsigned long *isa_bitmap)
 {
@@ -397,8 +414,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
 	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
-	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
-	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts, riscv_ext_vector_x_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zve32x, RISCV_ISA_EXT_ZVE32X, riscv_ext_vector_x_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts, riscv_ext_vector_float_validate),
@@ -406,20 +423,20 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64x, RISCV_ISA_EXT_ZVE64X, riscv_zve64x_exts, riscv_ext_vector_x_validate),
 	__RISCV_ISA_EXT_DATA(zvfh, RISCV_ISA_EXT_ZVFH),
 	__RISCV_ISA_EXT_DATA(zvfhmin, RISCV_ISA_EXT_ZVFHMIN),
-	__RISCV_ISA_EXT_DATA(zvkb, RISCV_ISA_EXT_ZVKB),
-	__RISCV_ISA_EXT_DATA(zvkg, RISCV_ISA_EXT_ZVKG),
-	__RISCV_ISA_EXT_BUNDLE(zvkn, riscv_zvkn_bundled_exts),
-	__RISCV_ISA_EXT_BUNDLE(zvknc, riscv_zvknc_bundled_exts),
-	__RISCV_ISA_EXT_DATA(zvkned, RISCV_ISA_EXT_ZVKNED),
-	__RISCV_ISA_EXT_BUNDLE(zvkng, riscv_zvkng_bundled_exts),
-	__RISCV_ISA_EXT_DATA(zvknha, RISCV_ISA_EXT_ZVKNHA),
-	__RISCV_ISA_EXT_DATA(zvknhb, RISCV_ISA_EXT_ZVKNHB),
-	__RISCV_ISA_EXT_BUNDLE(zvks, riscv_zvks_bundled_exts),
-	__RISCV_ISA_EXT_BUNDLE(zvksc, riscv_zvksc_bundled_exts),
-	__RISCV_ISA_EXT_DATA(zvksed, RISCV_ISA_EXT_ZVKSED),
-	__RISCV_ISA_EXT_DATA(zvksh, RISCV_ISA_EXT_ZVKSH),
-	__RISCV_ISA_EXT_BUNDLE(zvksg, riscv_zvksg_bundled_exts),
-	__RISCV_ISA_EXT_DATA(zvkt, RISCV_ISA_EXT_ZVKT),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvkb, RISCV_ISA_EXT_ZVKB, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvkg, RISCV_ISA_EXT_ZVKG, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkn, riscv_zvkn_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvknc, riscv_zvknc_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvkned, RISCV_ISA_EXT_ZVKNED, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvkng, riscv_zvkng_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvknha, RISCV_ISA_EXT_ZVKNHA, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvknhb, RISCV_ISA_EXT_ZVKNHB, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvks, riscv_zvks_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksc, riscv_zvksc_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvksed, RISCV_ISA_EXT_ZVKSED, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvksh, RISCV_ISA_EXT_ZVKSH, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_BUNDLE_VALIDATE(zvksg, riscv_zvksg_bundled_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvkt, RISCV_ISA_EXT_ZVKT, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smmpm, RISCV_ISA_EXT_SMMPM),
 	__RISCV_ISA_EXT_SUPERSET(smnpm, RISCV_ISA_EXT_SMNPM, riscv_xlinuxenvcfg_exts),
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
