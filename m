Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F367FC4345F
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Apr 2024 04:13:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jU7uLit8PjiW2H+rNrh6Fg0UqsMchTEod540xJ+NT/g=; b=leEiB9IR5McWz/
	rowIH2edxaFmbaEGcSjmaZf7qzieN1cDNPYFpyk7YAljMmiIA7vqqg7pcX5Jzmk+he1K0UK25JqKt
	qyDtxyzpXRZ4nThAmDSevbdAUyZaCGxoNI3Y+OR+Mm9bPjMdKxNHYd640KasayYsXt6Ny4A3lCMUp
	6DQgGh4a3ZE75TqaG/wDhhZtConQtOqj8w8RNp7KtfV7vOQb30extHkkfUUi808nk1BNKqygohNV4
	NceQtuzdfbJK5MpNyAi0I8hdbLy4jBkWDAjgtYWZV91nfVDdoK0xjVpMDpI/XOR8S7wiMaauuR2Jk
	cEvJ0Dm+KDnbHCh5zNlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaBv-0000000AlDX-3acC;
	Tue, 16 Apr 2024 04:13:07 +0000
Received: from mail-oa1-f50.google.com ([209.85.160.50])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwaB5-0000000AkRm-2kEo
	for linux-riscv@lists.infradead.org;
	Tue, 16 Apr 2024 04:12:23 +0000
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-2338483dd76so2693799fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 21:12:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713240733; x=1713845533; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pfgEouA2o3txDoLsnSFQ1dO9dPIDHDcBgqnFwikm9Z4=;
        b=Od0TZ6VqaUSer3V36Qjf/zg3HyBLK6qI95WpH2yoc+cTTed0bZ9Rr0XoLlYJI47w26
         nALAvXJgGaEqBd7JN2vHxZlhzmFM/W98Idd2fgHgaNgqjeOsKetnsChQsLHT6wOQaDvU
         mjvqPm3bgEaM2dKkfdVutcW6qlxa6NY0KCht+jACypRZQ6jRnRr54hOdZSj1uxlFIDSx
         mPTtKunx4Bk/9HvwDdkQICr3pU506K8MuIFp2+YHZhzmQHRmbgidGj61eWN+b09Xnepx
         B9T9jUnPagKbcCrKsQc4aQDBynHC9UhOwU+LV/Ov+m3z6348gMA27fhQB+wLUBkoxREY
         Wv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713240733; x=1713845533;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pfgEouA2o3txDoLsnSFQ1dO9dPIDHDcBgqnFwikm9Z4=;
        b=ARgvulsyp3CY3UqPZ2XDC/bLBkUBotmlWQuu8PYYMcvv+m3dEfvVmQ42kJJnkr/wgb
         3fPFfQljk9j0EVE/G9/c7rPY2U3eATm987htdXbynGd98cF7KsVFm7dgsgxvyuUchDby
         5+8XNe7vlVpwXOpdFGnp4wsGgA8Sf5wBoIjXha/E1iIzaT0sg4+dHjLqBPUUpxNKc7LW
         gPts8qCiGot0B/yCCXPwnW/Kc4Owpix2d1GeiZ8CP01fvOXNKRINPBtTSfEE/TFzGdft
         mQ4KKylkVI5YFS+YewDg5mVUMhIyj+HF2e83tMWidFSCjk0qgKIJ8rt0uTIWfvkeMfeK
         NR8w==
X-Gm-Message-State: AOJu0YyHIIqaHPZtpVd5FGjyOr8pREF8Tz+XXvjzkJcDA73GE1vQyTL9
	UBjYgdXHeNgJzqNzImpGbU0TuL1anzibXqav+FqSEL87mcGqwO/cwW+LQA5e0DxyiUvry7G4kiP
	u
X-Google-Smtp-Source: AGHT+IEkWKCmfS18iCDatrUQ8+gUH7AmhQlIUh3jbL94Sbp8FTPKm2WfVOtKvazKrIc/nVfvWnVHCQ==
X-Received: by 2002:a05:6870:7010:b0:22e:cc63:9b26 with SMTP id u16-20020a056870701000b0022ecc639b26mr13242263oae.15.1713240732726;
        Mon, 15 Apr 2024 21:12:12 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id z184-20020a6265c1000000b006ed4c430acesm8383149pfb.40.2024.04.15.21.12.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 21:12:11 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Mon, 15 Apr 2024 21:12:04 -0700
Subject: [PATCH v2 07/17] riscv: Introduce vendor variants of extension
 helpers
MIME-Version: 1.0
Message-Id: <20240415-dev-charlie-support_thead_vector_6_9-v2-7-c7d68c603268@rivosinc.com>
References: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
In-Reply-To: <20240415-dev-charlie-support_thead_vector_6_9-v2-0-c7d68c603268@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Guo Ren <guoren@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Conor Dooley <conor.dooley@microchip.com>, Evan Green <evan@rivosinc.com>, 
 =?utf-8?q?Cl=C3=A9ment_L=C3=A9ger?= <cleger@rivosinc.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713240719; l=11791;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=EUo/8P9TxYm5Z8gBeogX8nOGhGz5D7qWLLRReTJSe00=;
 b=Q0x4Mz7P7q6WFelFlp1y5rSIZoXPi8vlvCpVUPr+N3sy5vC2A1kMHvi3EW9gb6Ay3s/PW+Mxk
 ZD4o95nKjphDcab+24J6lgRl1n0bJFwXHfQUGSW0TwWbIKaQKKIWdA2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_211215_863238_AF8455D6 
X-CRM114-Status: GOOD (  20.73  )
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

Vendor extensions are maintained in riscv_isa_vendor (separate from
standard extensions which live in riscv_isa). Create vendor variants for
the existing extension helpers to interface with the riscv_isa_vendor
bitmap. There is a good amount of overlap between these functions, so
the alternative checking code can be factored out.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/errata/sifive/errata.c   |   2 +
 arch/riscv/errata/thead/errata.c    |   2 +
 arch/riscv/include/asm/cpufeature.h | 142 +++++++++++++++++++++++++++---------
 arch/riscv/include/asm/hwprobe.h    |   3 +
 arch/riscv/kernel/cpufeature.c      |  53 ++++++++++++--
 arch/riscv/kernel/sys_hwprobe.c     |   4 +-
 6 files changed, 161 insertions(+), 45 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 3d9a32d791f7..847ff85cc911 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -99,6 +99,8 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != SIFIVE_VENDOR_ID)
 			continue;
+		if (alt->patch_id >= RISCV_ISA_VENDOR_EXT_BASE)
+			continue;
 		if (alt->patch_id >= ERRATA_SIFIVE_NUMBER) {
 			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_id);
 			continue;
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index b1c410bbc1ae..6e3eabfe92af 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -163,6 +163,8 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
 			continue;
+		if (alt->patch_id >= RISCV_ISA_VENDOR_EXT_BASE)
+			continue;
 		if (alt->patch_id >= ERRATA_THEAD_NUMBER)
 			continue;
 
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 50fa174cccb9..12dd36bafa2a 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -110,23 +110,19 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 #define riscv_isa_extension_available(isa_bitmap, ext)	\
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
+bool __riscv_isa_vendor_extension_available(const unsigned long *vendor_isa_bitmap,
+					    unsigned int bit);
+#define riscv_isa_vendor_extension_available(isa_bitmap, ext)	\
+	__riscv_isa_vendor_extension_available(isa_bitmap, RISCV_ISA_VENDOR_EXT_##ext)
+
 static __always_inline bool
-riscv_has_extension_likely(const unsigned long ext)
+__riscv_has_extension_likely_alternatives(const unsigned long vendor, const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("j	%l[l_no]", "nop", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_no);
-	} else {
-		if (!__riscv_isa_extension_available(NULL, ext))
-			goto l_no;
-	}
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_no);
 
 	return true;
 l_no:
@@ -134,42 +130,118 @@ riscv_has_extension_likely(const unsigned long ext)
 }
 
 static __always_inline bool
-riscv_has_extension_unlikely(const unsigned long ext)
+__riscv_has_extension_unlikely_alternatives(const unsigned long vendor, const unsigned long ext)
 {
-	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
-			   "ext must be < RISCV_ISA_EXT_MAX");
-
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE)) {
-		asm goto(
-		ALTERNATIVE("nop", "j	%l[l_yes]", 0, %[ext], 1)
-		:
-		: [ext] "i" (ext)
-		:
-		: l_yes);
-	} else {
-		if (__riscv_isa_extension_available(NULL, ext))
-			goto l_yes;
-	}
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_yes);
 
 	return false;
 l_yes:
 	return true;
 }
 
+/* Standard extension helpers */
+
+static __always_inline bool
+riscv_has_extension_likely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(0, ext);
+	else
+		return __riscv_isa_extension_available(NULL, ext);
+}
+
+static __always_inline bool
+riscv_has_extension_unlikely(const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(0, ext);
+	else
+		return __riscv_isa_extension_available(NULL, ext);
+}
+
 static __always_inline bool riscv_cpu_has_extension_likely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_likely(ext))
-		return true;
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely_alternatives(0, ext))
+		return true;
+	else
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
 static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsigned long ext)
 {
-	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) && riscv_has_extension_unlikely(ext))
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely_alternatives(0, ext))
 		return true;
+	else
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+}
+
+/* Vendor extension helpers */
+
+static __always_inline bool
+riscv_has_vendor_extension_likely(const unsigned long vendor, const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(vendor, ext);
+	else
+		return __riscv_isa_vendor_extension_available(NULL, ext);
+}
 
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+static __always_inline bool
+riscv_has_vendor_extension_unlikely(const unsigned long vendor, const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(vendor, ext);
+	else
+		return __riscv_isa_vendor_extension_available(NULL, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
+								  int cpu, const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(vendor, ext);
+	else
+		return __riscv_isa_vendor_extension_available(hart_isa_vendor[cpu].isa, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsigned long vendor,
+								    int cpu,
+								    const unsigned long ext)
+{
+	compiletime_assert(ext < RISCV_ISA_VENDOR_EXT_MAX,
+			   "ext must be < RISCV_ISA_VENDOR_EXT_MAX");
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(vendor, ext);
+	else
+		return __riscv_isa_vendor_extension_available(hart_isa_vendor[cpu].isa, ext);
 }
 
 #endif
diff --git a/arch/riscv/include/asm/hwprobe.h b/arch/riscv/include/asm/hwprobe.h
index 630507dff5ea..1378c3c9401a 100644
--- a/arch/riscv/include/asm/hwprobe.h
+++ b/arch/riscv/include/asm/hwprobe.h
@@ -6,6 +6,7 @@
 #ifndef _ASM_HWPROBE_H
 #define _ASM_HWPROBE_H
 
+#include <linux/cpumask.h>
 #include <uapi/asm/hwprobe.h>
 
 #define RISCV_HWPROBE_MAX_KEY 6
@@ -39,4 +40,6 @@ static inline bool riscv_hwprobe_pair_cmp(struct riscv_hwprobe *pair,
 	return pair->value == other_pair->value;
 }
 
+void hwprobe_arch_id(struct riscv_hwprobe *pair, const struct cpumask *cpus);
+
 #endif
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index d7a33e017a15..799ec2d2e9e0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -20,6 +20,7 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwcap.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
 #include <asm/sbi.h>
@@ -82,6 +83,30 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 }
 EXPORT_SYMBOL_GPL(__riscv_isa_extension_available);
 
+/**
+ * __riscv_isa_vendor_extension_available() - Check whether given vendor
+ * extension is available or not. The vendor extension must be associated
+ * with the same vendor that was used to populate isa_bitmap.
+ *
+ * @isa_bitmap: ISA bitmap to use
+ * @bit: bit position of the desired extension
+ * Return: true or false
+ *
+ * NOTE: If isa_bitmap is NULL then Host ISA bitmap will be used.
+ */
+bool __riscv_isa_vendor_extension_available(const unsigned long *isa_bitmap, unsigned int bit)
+{
+	const unsigned long *bmap = (isa_bitmap) ? isa_bitmap : riscv_isa_vendor;
+
+	bit -= RISCV_ISA_VENDOR_EXT_BASE;
+
+	if (bit < 0 || bit >= RISCV_ISA_VENDOR_EXT_MAX)
+		return false;
+
+	return test_bit(bit, bmap) ? true : false;
+}
+EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);
+
 static bool riscv_isa_extension_check(int id)
 {
 	switch (id) {
@@ -832,25 +857,37 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 {
 	struct alt_entry *alt;
 	void *oldptr, *altptr;
-	u16 id, value;
+	u16 id, value, vendor;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
 
-	for (alt = begin; alt < end; alt++) {
-		if (alt->vendor_id != 0)
-			continue;
+	struct riscv_hwprobe mvendorid = {
+		.key = RISCV_HWPROBE_KEY_MVENDORID,
+		.value = 0
+	};
 
+	hwprobe_arch_id(&mvendorid, cpu_possible_mask);
+
+	for (alt = begin; alt < end; alt++) {
 		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
+		vendor = PATCH_ID_CPUFEATURE_ID(alt->vendor_id);
 
-		if (id >= RISCV_ISA_EXT_MAX) {
+		if (id >= RISCV_ISA_VENDOR_EXT_BASE) {
+			if (vendor != mvendorid.value ||
+			    !__riscv_isa_vendor_extension_available(NULL, id))
+				continue;
+		} else if (id < RISCV_ISA_EXT_MAX) {
+			if (alt->vendor_id != 0)
+				continue;
+
+			if (!__riscv_isa_extension_available(NULL, id))
+				continue;
+		} else {
 			WARN(1, "This extension id:%d is not in ISA extension list", id);
 			continue;
 		}
 
-		if (!__riscv_isa_extension_available(NULL, id))
-			continue;
-
 		value = PATCH_ID_CPUFEATURE_VALUE(alt->patch_id);
 		if (!riscv_cpufeature_patch_check(id, value))
 			continue;
diff --git a/arch/riscv/kernel/sys_hwprobe.c b/arch/riscv/kernel/sys_hwprobe.c
index 8cae41a502dd..394f1343490c 100644
--- a/arch/riscv/kernel/sys_hwprobe.c
+++ b/arch/riscv/kernel/sys_hwprobe.c
@@ -13,11 +13,11 @@
 #include <asm/uaccess.h>
 #include <asm/unistd.h>
 #include <asm/vector.h>
+#include <asm/vendor/thead.h>
 #include <vdso/vsyscall.h>
 
 
-static void hwprobe_arch_id(struct riscv_hwprobe *pair,
-			    const struct cpumask *cpus)
+void hwprobe_arch_id(struct riscv_hwprobe *pair, const struct cpumask *cpus)
 {
 	u64 id = -1ULL;
 	bool first = true;

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
