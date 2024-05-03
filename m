Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A85ACC4345F
	for <linux-riscv@archiver.kernel.org>; Fri,  3 May 2024 04:47:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9E04XoKjZuGIiO7ombHP95YzjPILEbDhouOrIoOGmVk=; b=cNt+TmBd6MkTle
	2DS/GvnfM4AivuX3i5FDlafA2ZP7JGtX+okTIdWYM3DMOUpCk9ZKUNhvFeSIAQNWDTvUFnouRvCq6
	91e37j0IVN2Z0dBYyLTARCUQU5Ho+JTDbIxRZK4S9fFrjFArLMFDsFH3iVYacFDG8gYouT6Zyw55Z
	6e4YfSpgC8WKR7gufPhYyIH0Gr8tO8FDiYKkxGyVzosXbhCQsSUCgA2sSFVZ49hhWuhLaXHeDxC9r
	16DKj0o/8DEoJFi0/YznKGwKQcq81L1+scNlfczOofr1N/WMv6Tr7TKX9hOWNqRgybOANCU+Yftta
	ouQMPqTRCb7HiBv9ItrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kph-0000000F28S-1uvo;
	Fri, 03 May 2024 04:47:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kp7-0000000F1Zr-3FRp
	for linux-riscv@bombadil.infradead.org;
	Fri, 03 May 2024 04:47:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=UykfJiaFBVi2EDAGMBh8NLAZWvMWoUpAgsh1CPEVms4=; b=LgJpHECmCMIKlXbjmFDE0y5Wq+
	AS6xBpi1beRqLmGhG7fI029mYawmFZEchpU5u71gP2kIicp2XwBhMfuZb1OalnB5RRRf3hqqdXJrK
	fys5oL0q2eMrOliLYpdI3qaUuCFEqd5nJ+vncdhMMDM7nE7G5Q1yerCr4TjoL7Y5vumV08g44H7s5
	TGCNqp+/2fw631AS8GuAQhLF5W36AdGVoYefa8Jbn6TmpeVbcw6W+sM+VzbyktfXlaE9Psl+A/hJz
	phgFYPYUWfTcE0Gy7aqeiCCWuduxBr4ARHq54QuJi/6N94RYZLGPgE9aB9Q7XtK1T3zx9Ikv8lbYI
	lUt3PBvg==;
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by desiato.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2kp3-00000000Pz5-02CD
	for linux-riscv@lists.infradead.org;
	Fri, 03 May 2024 04:47:04 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1ecd3867556so17296815ad.0
        for <linux-riscv@lists.infradead.org>; Thu, 02 May 2024 21:47:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714711619; x=1715316419; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=UykfJiaFBVi2EDAGMBh8NLAZWvMWoUpAgsh1CPEVms4=;
        b=DsdpuINmBoptFN/SsvuaJzYQ8i4el/eqT40w1Rw0q6kZ2ErT0jEBLZAVL8fRUs9YKo
         ByLW4xjwkEwX6lGPg9wXFSjLc7is5jndlruk27Swzo2M0BKhDC2NAluSFPuYS1kwVpje
         2evGpAiWzvJXCmtfM8/uIzt5++VaDG5CvEtZbfFpvp/ZpGbIf8GTW4LH06UobQzYBpN8
         YG6Re/l1Iv8sY42+rAYeyIwsKDWKX0gV8Wodc4+WOQ6Ot2qiPfuhVvX3tvcKDuYlyzTm
         dqsx9AyDoPhWmVR8NIMRhwRfPYgy00UT/ZzO3ReUgERE4qLR75eMNz9+FeTVZsWR6tC8
         TueA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714711619; x=1715316419;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UykfJiaFBVi2EDAGMBh8NLAZWvMWoUpAgsh1CPEVms4=;
        b=kLPI38bSfurnwxFHjTJZT++e8CBJQgfX3oYUqOCZeGVKBdvgQQw24p4SrsghvPORPz
         N7AMEeC2va/A3YYlQcUIZTVjrLjL+3ogcW7bRAkIiDqdQ9AJbHQLie4f1FmN8kcvEsjw
         tDLG93Nrkarz/5sh2Pg66O0c2BKcLfmYttPPLgBW/xzCQOXh5Z7mz67isNvJM3PmiewN
         ZsquwOFvoetVFvhRWkrPX0ySO09WPbKmiGYDMGcwTQhHIG3hW24m4QtpczauoMo62D0e
         KkZ04kKx0wnT2zpJbieABRfeSETesWgOvJRqoW7Uo3zs0NVJyTlR61oTiiRczKyWBmq+
         KvXw==
X-Gm-Message-State: AOJu0YxbsugdK54eyeGU/LVEM+kgfetua7vJXyFKtPqugAmp2CjSWuDk
	iS+P9Pji/nPxZIk8TuGx4uj602PoBUY+t0B9UUJ3ItMz6M/eYyd7cBX3JlTDjo8=
X-Google-Smtp-Source: AGHT+IFUeoDgjDJHDc4EYaGZSanqOSkHjLKEQHa2LwhjcFRr87Vhjosi10198Njp9xbuVzXNFBCt5A==
X-Received: by 2002:a17:902:cec2:b0:1e4:47bf:6926 with SMTP id d2-20020a170902cec200b001e447bf6926mr2115876plg.4.1714711618828;
        Thu, 02 May 2024 21:46:58 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id e8-20020a17090301c800b001e2bb03893dsm2240411plh.198.2024.05.02.21.46.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 May 2024 21:46:58 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Thu, 02 May 2024 21:46:42 -0700
Subject: [PATCH v5 07/17] riscv: Introduce vendor variants of extension
 helpers
MIME-Version: 1.0
Message-Id: <20240502-dev-charlie-support_thead_vector_6_9-v5-7-d1b5c013a966@rivosinc.com>
References: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
In-Reply-To: <20240502-dev-charlie-support_thead_vector_6_9-v5-0-d1b5c013a966@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714711602; l=9175;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=F9Wkqs8EdJIlMr1PfjBZjPa2RaErD1TYfscUczvzu4w=;
 b=GOOkG8MSptiZOXiwddfHG2IzyWMJxHcCjusg5hDgWdR8SSZ0pP5J6NSgk7U+2Hv4LLsCMQGff
 UaElzoZ1ajbAWGJo9t3g7SzH9oJw1+Nm2KQdX7dC25E7anAgT3bt9QM
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_054701_383226_DCA9000A 
X-CRM114-Status: GOOD (  19.71  )
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
bitmaps.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/errata/sifive/errata.c          |  3 +
 arch/riscv/errata/thead/errata.c           |  3 +
 arch/riscv/include/asm/vendor_extensions.h | 97 ++++++++++++++++++++++++++++++
 arch/riscv/kernel/cpufeature.c             | 32 +++++++---
 arch/riscv/kernel/vendor_extensions.c      | 40 ++++++++++++
 5 files changed, 167 insertions(+), 8 deletions(-)

diff --git a/arch/riscv/errata/sifive/errata.c b/arch/riscv/errata/sifive/errata.c
index 3d9a32d791f7..b68b023115c2 100644
--- a/arch/riscv/errata/sifive/errata.c
+++ b/arch/riscv/errata/sifive/errata.c
@@ -12,6 +12,7 @@
 #include <asm/alternative.h>
 #include <asm/vendorid_list.h>
 #include <asm/errata_list.h>
+#include <asm/vendor_extensions.h>
 
 struct errata_info_t {
 	char name[32];
@@ -91,6 +92,8 @@ void sifive_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	u32 cpu_apply_errata = 0;
 	u32 tmp;
 
+	BUILD_BUG_ON(ERRATA_SIFIVE_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
 	if (stage == RISCV_ALTERNATIVES_EARLY_BOOT)
 		return;
 
diff --git a/arch/riscv/errata/thead/errata.c b/arch/riscv/errata/thead/errata.c
index b1c410bbc1ae..6d5d7f8eebbc 100644
--- a/arch/riscv/errata/thead/errata.c
+++ b/arch/riscv/errata/thead/errata.c
@@ -18,6 +18,7 @@
 #include <asm/io.h>
 #include <asm/patch.h>
 #include <asm/vendorid_list.h>
+#include <asm/vendor_extensions.h>
 
 static bool errata_probe_pbmt(unsigned int stage,
 			      unsigned long arch_id, unsigned long impid)
@@ -160,6 +161,8 @@ void thead_errata_patch_func(struct alt_entry *begin, struct alt_entry *end,
 	u32 tmp;
 	void *oldptr, *altptr;
 
+	BUILD_BUG_ON(ERRATA_THEAD_NUMBER >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
 	for (alt = begin; alt < end; alt++) {
 		if (alt->vendor_id != THEAD_VENDOR_ID)
 			continue;
diff --git a/arch/riscv/include/asm/vendor_extensions.h b/arch/riscv/include/asm/vendor_extensions.h
index bf4dac66e6e6..a6959836f895 100644
--- a/arch/riscv/include/asm/vendor_extensions.h
+++ b/arch/riscv/include/asm/vendor_extensions.h
@@ -31,4 +31,101 @@ extern struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[];
 
 extern const size_t riscv_isa_vendor_ext_list_size;
 
+/*
+ * The alternatives need some way of distinguishing between vendor extensions
+ * and errata. Incrementing all of the vendor extension keys so they are at
+ * least 0x8000 accomplishes that.
+ */
+#define RISCV_VENDOR_EXT_ALTERNATIVES_BASE	0x8000
+
+#define VENDOR_EXT_ALL_CPUS			-1
+
+bool __riscv_isa_vendor_extension_available(int cpu, unsigned long vendor, unsigned int bit);
+#define riscv_cpu_isa_vendor_extension_available(cpu, vendor, ext)	\
+	__riscv_isa_vendor_extension_available(cpu, vendor, RISCV_ISA_VENDOR_EXT_##ext)
+#define riscv_isa_vendor_extension_available(vendor, ext)	\
+	__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, \
+					       RISCV_ISA_VENDOR_EXT_##ext)
+
+static __always_inline bool __riscv_has_extension_likely(const unsigned long vendor,
+							 const unsigned long ext)
+{
+	asm goto(ALTERNATIVE("j	%l[l_no]", "nop", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_no);
+
+	return true;
+l_no:
+	return false;
+}
+
+static __always_inline bool __riscv_has_extension_unlikely(const unsigned long vendor,
+							   const unsigned long ext)
+{
+	asm goto(ALTERNATIVE("nop", "j	%l[l_yes]", %[vendor], %[ext], 1)
+	:
+	: [vendor] "i" (vendor), [ext] "i" (ext)
+	:
+	: l_yes);
+
+	return false;
+l_yes:
+	return true;
+}
+
+static __always_inline bool riscv_has_vendor_extension_likely(const unsigned long vendor,
+							      const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_likely(vendor,
+						    ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
+	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
+}
+
+static __always_inline bool riscv_has_vendor_extension_unlikely(const unsigned long vendor,
+								const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE))
+		return __riscv_has_extension_unlikely(vendor,
+						      ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE);
+
+	return __riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_likely(const unsigned long vendor,
+								  int cpu, const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_likely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+		return true;
+
+	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
+}
+
+static __always_inline bool riscv_cpu_has_vendor_extension_unlikely(const unsigned long vendor,
+								    int cpu,
+								    const unsigned long ext)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_ISA_VENDOR_EXT))
+		return false;
+
+	if (IS_ENABLED(CONFIG_RISCV_ALTERNATIVE) &&
+	    __riscv_has_extension_unlikely(vendor, ext + RISCV_VENDOR_EXT_ALTERNATIVES_BASE))
+		return true;
+
+	return __riscv_isa_vendor_extension_available(cpu, vendor, ext);
+}
+
 #endif /* _ASM_VENDOR_EXTENSIONS_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index cc9ec393c8f6..b1f35564a1e0 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -860,25 +860,41 @@ void __init_or_module riscv_cpufeature_patch_func(struct alt_entry *begin,
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
+		/*
+		 * Any alternative with a patch_id that is less than
+		 * RISCV_ISA_EXT_MAX is interpreted as a standard extension.
+		 *
+		 * Any alternative with patch_id that is greater than or equal
+		 * to RISCV_VENDOR_EXT_ALTERNATIVES_BASE is interpreted as a
+		 * vendor extension.
+		 */
+		if (id < RISCV_ISA_EXT_MAX) {
+			/*
+			 * This patch should be treated as errata so skip
+			 * processing here.
+			 */
+			if (alt->vendor_id != 0)
+				continue;
+
+			if (!__riscv_isa_extension_available(NULL, id))
+				continue;
+		} else if (id >= RISCV_VENDOR_EXT_ALTERNATIVES_BASE) {
+			if (!__riscv_isa_vendor_extension_available(VENDOR_EXT_ALL_CPUS, vendor, id))
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
index 03ba7949a07f..e4ef574b7d08 100644
--- a/arch/riscv/kernel/vendor_extensions.c
+++ b/arch/riscv/kernel/vendor_extensions.c
@@ -3,6 +3,7 @@
  * Copyright 2024 Rivos, Inc
  */
 
+#include <asm/vendorid_list.h>
 #include <asm/vendor_extensions.h>
 #include <asm/vendor_extensions/thead.h>
 
@@ -16,3 +17,42 @@ struct riscv_isa_vendor_ext_data_list *riscv_isa_vendor_ext_list[] = {
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
