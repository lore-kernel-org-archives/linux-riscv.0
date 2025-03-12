Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94678C28B28
	for <linux-riscv@archiver.kernel.org>; Wed, 12 Mar 2025 13:41:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iJsjR4d75C6ZjXk3jXEQOsfLtWoayTPPapwv+yTp/8w=; b=KPntA1stJq7m8V
	KEJUOM3Ozi2GONfy0yYsonYdOgK5XqFnbLZGvJSEcn4NjMuNYTULHOBzDrwPhuu3DtA2/8vgY2RhL
	/x1/vIrGe+z2nirTi5FG1Bywl+jPl8EWZOyQUlmIdFLhSnun6MdwcTima3yzxYAGw1t1RZTR3R1QQ
	fdEqz6pPzscppr6cp3+89tvN34Frtiqm2PBTeE4W0lF2GExDv460gOYfH3Omkn8bPsWQU8Q4ewtK4
	JqjQVsNFZOHEbSraxtxcfPqqzyfPjcw1XbyI0Kl7CF3eu1h8/uBu1a5BVS4g0B1eKNxKOYXkUu37v
	Zgv52M+WZJ7bGZe7Kxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsMKW-00000008bAt-1jfo;
	Wed, 12 Mar 2025 13:41:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tsLt1-00000008X3M-0RTn
	for linux-riscv@lists.infradead.org;
	Wed, 12 Mar 2025 13:12:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id A97F85C5AEC;
	Wed, 12 Mar 2025 13:10:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34F7C4CEEC;
	Wed, 12 Mar 2025 13:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741785158;
	bh=xkOp2BaIgw0BM3o1uELdVRZMOl4451Gr2m0DRPMGLxE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OkiDmvnqnTuOBnS+MAXFe1bqeQbq4IsCwOOXNv1kpxFpYbu5vRUTNMI0A8Y39tpmE
	 wJLU+fGnQ7rqtQTlpIQjhZagJuMLEONluVyoaXtTVst2ZHdFQ9hjGWtfbzdLYUzkUj
	 /sZp4ALR78NuHGGD3A3k8NtDK4MGpON7VbcKkaxLw1oIrFcZkMUsOtfyOhw7el+pOz
	 byG3g0mpzm4DtXA5Ca/kCLShOamtQHu86lzqEXO0vTroIYN2DU7aEY6TvipiAXlB8s
	 V1VnKF5gSBhPXIghwaFmUTab9SkG4tCZ7F/zfGfUo4eGc/sFzqydty5mVyg0HtR4HF
	 gO7GyhIpNMieA==
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
Subject: [PATCH v4 2/6] RISC-V: add vector crypto extension validation checks
Date: Wed, 12 Mar 2025 13:11:45 +0000
Message-ID: <20250312-entertain-shaking-b664142c2f99@spud>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250312-abide-pancreas-3576b8c44d2c@spud>
References: <20250312-abide-pancreas-3576b8c44d2c@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6063; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=tR4ZBY/tPFJNw/u11KBQNT7sDrigssjsfjm1n/+8umY=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDOkXO4QfZq6Zf73/W652Te/6jeGh513/6+Rsjdu4du7k2 Hp+5x0ZHaUsDGIcDLJiiiyJt/tapNb/cdnh3PMWZg4rE8gQBi5OAZhIbCbDP7Vpq6y2qXg+mZmV uUmy9myPmeL+Ou00F7G2qkOhr3WerWX4Kzxr6+f/F+45aR/8tN7sZMnHKtHmG2qHt7x5W9Yi9fP MRwYA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_061239_229632_C182F6EC 
X-CRM114-Status: GOOD (  15.87  )
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

The Unpriv spec states:
| The Zvknhb and Zvbc Vector Crypto Extensions --and accordingly the
| composite extensions Zvkn, Zvknc, Zvkng, and Zvksc-- require a Zve64x
| base, or application ("V") base Vector Extension. All of the other
| Vector Crypto Extensions can be built on any embedded (Zve*) or
| application ("V") base Vector Extension.

While this could be used as the basis for checking that the correct base
for individual crypto extensions, but that's not really the kernel's job
in my opinion and it is sufficient to leave that sort of precision to
the dt-bindings. The kernel only needs to make sure that vector, in some
form, is available.

Link: https://github.com/riscv/riscv-isa-manual/blob/main/src/vector-crypto.adoc#extensions-overview
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/kernel/cpufeature.c | 49 +++++++++++++++++++++++-----------
 1 file changed, 33 insertions(+), 16 deletions(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index dbea6ed3f4da..4fa951e9f1cf 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -141,6 +141,23 @@ static int riscv_ext_vector_float_validate(const struct riscv_isa_ext_data *data
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
+		return -EPROBE_DEFER;
+
+	return 0;
+}
+
 static int riscv_ext_zca_depends(const struct riscv_isa_ext_data *data,
 				 const unsigned long *isa_bitmap)
 {
@@ -400,8 +417,8 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zksed, RISCV_ISA_EXT_ZKSED),
 	__RISCV_ISA_EXT_DATA(zksh, RISCV_ISA_EXT_ZKSH),
 	__RISCV_ISA_EXT_DATA(ztso, RISCV_ISA_EXT_ZTSO),
-	__RISCV_ISA_EXT_SUPERSET(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts),
-	__RISCV_ISA_EXT_DATA(zvbc, RISCV_ISA_EXT_ZVBC),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zvbb, RISCV_ISA_EXT_ZVBB, riscv_zvbb_exts, riscv_ext_vector_crypto_validate),
+	__RISCV_ISA_EXT_DATA_VALIDATE(zvbc, RISCV_ISA_EXT_ZVBC, riscv_ext_vector_crypto_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve32f, RISCV_ISA_EXT_ZVE32F, riscv_zve32f_exts, riscv_ext_vector_float_validate),
 	__RISCV_ISA_EXT_DATA_VALIDATE(zve32x, RISCV_ISA_EXT_ZVE32X, riscv_ext_vector_x_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zve64d, RISCV_ISA_EXT_ZVE64D, riscv_zve64d_exts, riscv_ext_vector_float_validate),
@@ -409,20 +426,20 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
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
