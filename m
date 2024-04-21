Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAE2EC4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 21 Apr 2024 01:06:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=2OIfqpD47a1gtMP8UqoYa8lXRS9spOUG+3j9KjsWK+Y=; b=NDuOSuWZ4vmmbP
	YXIW85QW6y4ou/xFsh82mExgqd40UbD5e/QPyOymV+1B51aWJEWAQYYSv8Gzs4r+Dv5BFbTTe/0Yk
	7EN9q2WbPxK1MJINF1cN900XLKp2m77aIftkYegao5SvSrZ78QcEyLf3/Z83NrCPXp1NlEFDZrt98
	3OQ/RREhFKtBguvTaZvMYW5p7/90D9TnffuBh3PpcbBbYemsfXzb9UOG/BgRC+dZPTHgIjQbyqbtu
	Dxf5hdhkjchgvMixm3gZqlK+Pm9x9CMlvT6e26qDxLdCE6Md4RHbl7+NJJQQEAUof213C01iMriDW
	WA09RromGLhccggZ3ngw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLf6-00000009X0A-3IMt;
	Sun, 21 Apr 2024 01:06:33 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ryLde-00000009Vt7-3IFe
	for linux-riscv@lists.infradead.org;
	Sun, 21 Apr 2024 01:05:07 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3c70a55988dso1920670b6e.0
        for <linux-riscv@lists.infradead.org>; Sat, 20 Apr 2024 18:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1713661501; x=1714266301; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=e2FycCQgr0Md2m55PUKz4F+guqOYkkbWWHN7d/IglBM=;
        b=OOzyTVf/I9zlnWo9r514NOPrR9DboU0PWMXQZJn5o07FUMqeaqWChtc1NR7c3J8cyv
         vARqO5JPN1pLESrW7/D0UVfh7QDwgUbgPNUsJCSLPj0YoHo/mw3i3W2n/QHQfBsG0adT
         7wFMfeATmVuy/SvcI+DWLavvHCA7bwLYFugojOWsNlx73+lKd+tDZdl537Kl9GGWpmOs
         yEVIbwSXKWgRW1R17/eMJ4S6DmrG/Y+6ze3Zvgd0WAWlhC5hL01dZvSQfxMoAcWdF9UY
         h2T2Tom8Opi4FLTKUSQLmB77t7OKkm4Y1KC94msnv4wDLkatpD3nTGsggs3icvuMaPXh
         BXSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713661501; x=1714266301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e2FycCQgr0Md2m55PUKz4F+guqOYkkbWWHN7d/IglBM=;
        b=TRF2luRY3FvO5bJCuFVbfoc3iW50eweYHA451Zj/C4uoCN6QW7tuzb2tg2osPHLc5C
         JymStoqA8i8IrW9JbntSHvsdoCRN0PF9FIw56ZdGnW3ezm5UoIsOdF9gfi+0HQeKpRgd
         mEOmcrwZUHLf44X9y0koWJGjbpvMgKxtCs4sX8r7/uYtHZ+Qm6AGflJFOL8Gh1pylC4u
         1LN6O3ksT4kGT//CxI+q+OGYD2jsfhux+TFPtpTy3LqXah0L1htBxYgdfcAdNUBRpwxT
         IKPGJWPbSH32C7V5u3Ha2+2pbkzvHkyhnFrSiWKSjNUd539A5Q1R+94wdiKplVW/QvKL
         QMeg==
X-Gm-Message-State: AOJu0Yxyv0MbbhftYVxzqlIQr5fvM15KMAX4XsDiB3VftRpAshIRvurv
	/gSZw9+GhEUiUol+ZQKauAQAAU8orsOnl2wVwOMaq85Amz/sswNCX6E2ULOge8Q=
X-Google-Smtp-Source: AGHT+IF/4XZLnnivVKPZ8WsTEeAo/SZcoeECiilJgfcMyyhxJvhyd8q02lJX8UgBKXlgEzvUQZtUwA==
X-Received: by 2002:a05:6871:814:b0:229:7f9f:adee with SMTP id q20-20020a056871081400b002297f9fadeemr8065508oap.30.1713661501224;
        Sat, 20 Apr 2024 18:05:01 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d6-20020a63d646000000b005dc8702f0a9sm5249627pgj.1.2024.04.20.18.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 18:05:00 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Sat, 20 Apr 2024 18:04:40 -0700
Subject: [PATCH v3 08/17] riscv: Introduce vendor variants of extension
 helpers
MIME-Version: 1.0
Message-Id: <20240420-dev-charlie-support_thead_vector_6_9-v3-8-67cff4271d1d@rivosinc.com>
References: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
In-Reply-To: <20240420-dev-charlie-support_thead_vector_6_9-v3-0-67cff4271d1d@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713661481; l=11853;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=43OjfW9OT79ew/scFUScxxrD5iAGc7pJfOE1T2ZstWU=;
 b=ABUXyw9fhtb1sLlhQm4D4NSF53vUw3eGz6WJNRwJaWaft65qTuE4Bqt4jpnuYkAYvfJsiJl55
 Cao0xARIUGPBUWJ/Fuh4j6m9a5rN4qfYoOjSdMrrZ2btIAOTxWhhRj2
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240420_180503_073705_9C537B4C 
X-CRM114-Status: GOOD (  20.75  )
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

Vendor extensions are maintained in per-vendor structs (separate from
standard extensions which live in riscv_isa). Create vendor variants for
the existing extension helpers to interface with the riscv_isa_vendor
bitmaps. There is a good amount of overlap between these functions, so
the alternative checking code can be factored out.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/errata/sifive/errata.c          |  3 ++
 arch/riscv/errata/thead/errata.c           |  3 ++
 arch/riscv/include/asm/cpufeature.h        | 86 +++++++++++++++++-------------
 arch/riscv/include/asm/vendor_extensions.h | 56 +++++++++++++++++++
 arch/riscv/kernel/cpufeature.c             | 20 ++++---
 arch/riscv/kernel/vendor_extensions.c      | 40 ++++++++++++++
 6 files changed, 164 insertions(+), 44 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 3d9a32d791f7..b29b6e405ff2 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -12,6 +12,7 @@
 #include <asm/alternative.h>
 #include <asm/vendorid_list.h>
 #include <asm/errata_list.h>
+#include <asm/vendor_extensions.h>
 
 struct errata_info_t {
 	char name[32];
@@ -99,6 +100,8 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != SIFIVE_VENDOR_ID)
 			continue;
+		if (alt->patch_id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE)
+			continue;
 		if (alt->patch_id >= ERRATA_SIFIVE_NUMBER) {
 			WARN(1, "This errata id:%d is not in kernel errata list", alt->patch_id);
 			continue;
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index b1c410bbc1ae..d8e78cc687bc 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -18,6 +18,7 @@
 #include <asm/io.h>
 #include <asm/patch.h>
 #include <asm/vendorid_list.h>
+#include <asm/vendor_extensions.h>
 
 static bool errata_probe_pbmt(unsigned int stage,
 			      unsigned long arch_id, unsigned long impid)
@@ -163,6 +164,8 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
 			continue;
+		if (alt->patch_id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE)
+			continue;
 		if (alt->patch_id >= ERRATA_THEAD_NUMBER)
 			continue;
 
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index db6a6d7d6b2e..83e1143db9ad 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -103,22 +103,13 @@ bool __riscv_isa_extension_available(const unsigned long *isa_bitmap, unsigned i
 	__riscv_isa_extension_available(isa_bitmap, RISCV_ISA_EXT_##ext)
 
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
@@ -126,42 +117,65 @@ riscv_has_extension_likely(const unsigned long ext)
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
-		return true;
+	compiletime_assert(ext < RISCV_ISA_EXT_MAX,
+			   "ext must be < RISCV_ISA_EXT_MAX");
 
-	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely_alternatives(0, ext))
+		return true;
+	else
+		return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
 #endif
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index 0af1ddd0af70..3e676a96016e 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -23,4 +23,60 @@ extern const struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[];
 
 extern const size_t riscv_isa_vendor_ext_list_size;
 
+/*
+ * The alternatives need some way of distinguishing between vendor extensions
+ * and errata. Incrementing all of the vendor extension keys so they are at
+ * least 0x8000 accomplishes that.
+ */
+#define RISCV_VENDOR_EXT_ALTERNATIVES_BASE	0x8000
+
+bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit);
+#define riscv_cpu_isa_vendor_extension_available(cpu, vendor, ext)	\
+	__riscv_isa_vendor_extension_available(cpu, vendor, RISCV_ISA_VENDOR_EXT_##ext)
+#define riscv_isa_vendor_extension_available(vendor, ext)	\
+	__riscv_isa_vendor_extension_available(-1, vendor, RISCV_ISA_VENDOR_EXT_##ext)
+
+static __always_inline bool
+riscv_has_vendor_extension_likely(const unsigned long vendor, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely_alternatives(vendor,
+								 ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+	else
+		return __riscv_isa_vendor_extension_available(-1, vendor, ext);
+}
+
+static __always_inline bool
+riscv_has_vendor_extension_unlikely(const unsigned long vendor, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely_alternatives(vendor,
+								   ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+	else
+		return __riscv_isa_vendor_extension_available(-1, vendor, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
+								  int cpu, const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely_alternatives(vendor,
+						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+		return true;
+	else
+		return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsigned long vendor,
+								    int cpu,
+								    const unsigned long ext)
+{
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely_alternatives(vendor,
+							ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+		return true;
+	else
+		return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
+}
+
 #endif /* _ASM_VENDOR_EXTENSIONS_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c9f36822e337..17371887abcc 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -833,25 +833,29 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
 {
 	struct alt_entry *alt;
 	void *oldptr, *altptr;
-	u16 id, value;
+	u16 id, value, vendor;
 
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
 
 	for (alt = begin; alt < end; alt++) {
-		if (alt->vendor_id != 0)
-			continue;
-
 		id = PATCH_ID_CPUFEATURE_ID(alt->patch_id);
+		vendor = PATCH_ID_CPUFEATURE_ID(alt->vendor_id);
 
-		if (id >= RISCV_ISA_EXT_MAX) {
+		if (id < RISCV_ISA_EXT_MAX) {
+			if (alt->vendor_id != 0)
+				continue;
+
+			if (!__riscv_isa_extension_available(NULL, id))
+				continue;
+		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
+			if (!__riscv_isa_vendor_extension_available(-1, vendor, id))
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
diff --git a/arch/riscv/kernel/vendor_extensions.c b/arch/riscv/kernel/vendor_extensions.c
index f76cb3013c2d..eced93eec5a6 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -3,6 +3,7 @@
  * Copyright 2024 Rivos, Inc
  */
 
+#include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/thead.h>
 
@@ -16,3 +17,42 @@ const struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
 };
 
 const size_t riscv_isa_vendor_ext_list_size = ARRAY_SIZE(riscv_isa_vendor_ext_list);
+
+/**
+ * __riscv_isa_vendor_extension_available() - Check whether given vendor
+ * extension is available or not.
+ *
+ * @cpu: check if extension is available on this cpu
+ * @vendor: vendor that the extension is a member of
+ * @bit: bit position of the desired extension
+ * Return: true or false
+ *
+ * NOTE: When cpu is -1, will check if extension is available on all cpus
+ */
+bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit)
+{
+	unsigned long *bmap;
+	struct riscv_isainfo *cpu_bmap;
+	size_t bmap_size;
+
+	switch (vendor) {
+#ifdef CONFIG_RISCV_ISA_VENDOR_EXT_THEAD
+	case THEAD_VENDOR_ID:
+		bmap = riscv_isa_vendor_ext_list_thead.vendor_bitmap;
+		cpu_bmap = riscv_isa_vendor_ext_list_thead.per_hart_vendor_bitmap;
+		bmap_size = riscv_isa_vendor_ext_list_thead.bitmap_size;
+		break;
+#endif
+	default:
+		return false;
+	}
+
+	if (cpu != -1)
+		bmap = cpu_bmap[cpu].isa;
+
+	if (bit >= bmap_size)
+		return false;
+
+	return test_bit(bit, bmap) ? true : false;
+}
+EXPORT_SYMBOL_GPL(__riscv_isa_vendor_extension_available);

-- 
2.44.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
