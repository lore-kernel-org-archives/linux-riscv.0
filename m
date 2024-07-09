Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3AAEC3DA45
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Jul 2024 17:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=PV6L3sRcABcK6FC5baTpp1dT0NpMKASMLxO2Jt+S6WI=; b=JFp//fdZNOEhdL
	X4HiynYnApDZBbIb0v8W586F0Z63ojgZjqTIFL0De8RIjcfPeBwjVO2iK0Zv0FoOIcAIX+EvvcZD7
	0int5bpDF5B12kwMiYlIEivJKU+uh6QHewdNwM8u/VxfLcHG+BTW6O58bCireMePgeI+rWWUbfHGc
	SOiWb9GoaIISs6oZNnyHpzfngOS547iJd7LJa8LEhwqazsB8CPy3KpD+YMU24axU0nc1UFIViKlZq
	wSPZShjRHlyOTKiOvNf01VAB8lzFLCYskSRsRJ1Z+0ClweKBrpT9thwV5Wz5TsvmQOmVJQoX5S8rZ
	Y8hxaV2jfc3jm+TDZe3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREog-00000008CLZ-4Aog;
	Tue, 09 Jul 2024 17:39:51 +0000
Received: from mail-oi1-x236.google.com ([2607:f8b0:4864:20::236])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sREob-00000008CHA-1MDY
	for linux-riscv@lists.infradead.org;
	Tue, 09 Jul 2024 17:39:47 +0000
Received: by mail-oi1-x236.google.com with SMTP id 5614622812f47-3d93f9c793fso466835b6e.0
        for <linux-riscv@lists.infradead.org>; Tue, 09 Jul 2024 10:39:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1720546783; x=1721151583; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ys1Aw6VvBUculkzPHvM/HV7hPckJqLLorHwgfnWzAjs=;
        b=syRzqZCXDoXg/FQYQujCvBOcOwZ6o6GwUODZnaAZw2e+90LsD3agy7vVLp1T5tgSQj
         ZC9xw8GUAu8edxFtyR0FoxKEiGUdKDKAjsQLg9ldrJvYDTyabHjacxam+XgwIhbhOuOA
         stdivZQkLYjx2N2JYKle3Xrt+ENKTcqcMuquQdZN3C2rjuc+myn9efLcC4eptUHU0NFR
         m4aEOL8u+pp31mE50n7HwkSRy4JRBz/Oq2nTwlYrd4ehALexHEeL1qafPuIJaVjBdSXM
         CI21Lns0gud5CB4MI4nXPZvSY/+fgGbaS5VVAzWFsbatPJloL9KkZs+t//9Pqa43bQjK
         CuDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720546783; x=1721151583;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ys1Aw6VvBUculkzPHvM/HV7hPckJqLLorHwgfnWzAjs=;
        b=OnP2dbMJooaabkb/k6cueT2Y67fdgKebM9GRlXCLo38lXF9sS9H0mpu7XJhMzL6qGY
         uCAmlbWaGgmWRGjz+Y7jMV9Wp1IP891F8RBT2icqvFpYussjryHqsfRnmvMW/UUThfZf
         imBG2fFK3Lrr6XzjQvN/beWzvC3XxuIUb5a4JDHKChHYy+1n8EQHpUyONXMR1LuJbacZ
         bop3ycRGEPFyXU5B0KwP6KR4a7SsJztdCVvSU9aT9NFhp+fwe8ghjv2/3/Zl89unGy9f
         fpEO+IQ8h0WysfukWnsSf2M1C5Tv8szyK4dVEhvMnm6tWM4ZSzTKUsjz2NPqojFyOq0J
         nfKg==
X-Gm-Message-State: AOJu0Yy4yIsbhI47BfIMYJRj6I/0AF6WJZzsi26gezU+CPzk2b9TPbXM
	X39FmyIcUUNLnV8/IbuGXgrHithgzlSTnPgbbDdtG2Fc7s2j5gNFQoNPww3LjSVuOkNuAGOIphO
	b
X-Google-Smtp-Source: AGHT+IGj1/PBL90vBofRatNEDEbdFQFf7AwNGmHOoh5MNXhXvkvRBUpAEVrV8n1KV+mCB1tFV7RvZg==
X-Received: by 2002:a05:6808:13c9:b0:3d5:633b:3d8d with SMTP id 5614622812f47-3d93c0aaa10mr2959216b6e.53.1720546783247;
        Tue, 09 Jul 2024 10:39:43 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-79f18ff6762sm117547785a.10.2024.07.09.10.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jul 2024 10:39:42 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Conor Dooley <conor.dooley@microchip.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Wende Tan <twd2.me@gmail.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Sami Tolvanen <samitolvanen@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Baoquan He <bhe@redhat.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Charlie Jenkins <charlie@rivosinc.com>,
	Zong Li <zong.li@sifive.com>
Subject: [PATCH v4 4/4] RISC-V: Use Zkr to seed KASLR base address
Date: Tue,  9 Jul 2024 13:39:37 -0400
Message-ID: <20240709173937.510084-5-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240709173937.510084-1-jesse@rivosinc.com>
References: <20240709173937.510084-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_103945_522382_D1375474 
X-CRM114-Status: GOOD (  30.40  )
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

Parse the device tree for Zkr in the isa string.
If Zkr is present, use it to seed the kernel base address.

On an ACPI system, as of this commit, there is no easy way to check if
Zkr is present. Blindly running the instruction isn't an option as;
we have to be able to trust the firmware.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Tested-by: Zong Li <zong.li@sifive.com>
---
V1 -> V2:
 - Almost entire rewrite
V2 -> V3:
 - Dont parse iscv,isa-base
 - Move fdt_early_match_extension_isa in pi.h under comment
 - Only check enabled cpus
 - Rename early_isa_str to fdt_early_match_extension_isa
 - Rename get_ext_named to early_cpu_isa_ext_available
 - Rewrite isa_string_contains
 - Update commit description
 - Use fdt_stringlist_contains for riscv,isa-extensions
V3 -> V4:
 - Add `CFLAGS_fdt_early.o += -D__NO_FORTIFY` to Makefile
 - Remove isdigit
---
 arch/riscv/kernel/pi/Makefile           |   3 +-
 arch/riscv/kernel/pi/archrandom_early.c |  30 +++++
 arch/riscv/kernel/pi/fdt_early.c        | 160 ++++++++++++++++++++++++
 arch/riscv/kernel/pi/pi.h               |   3 +
 arch/riscv/mm/init.c                    |   5 +-
 5 files changed, 199 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 1ef7584be0c3..d5bf1bc7de62 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -17,6 +17,7 @@ KBUILD_CFLAGS	+= -mcmodel=medany
 
 CFLAGS_cmdline_early.o += -D__NO_FORTIFY
 CFLAGS_lib-fdt_ro.o += -D__NO_FORTIFY
+CFLAGS_fdt_early.o += -D__NO_FORTIFY
 
 $(obj)/%.pi.o: OBJCOPYFLAGS := --prefix-symbols=__pi_ \
 			       --remove-section=.note.gnu.property \
@@ -33,5 +34,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
 $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
+obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
 extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
new file mode 100644
index 000000000000..3f05d3cf3b7b
--- /dev/null
+++ b/arch/riscv/kernel/pi/archrandom_early.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <asm/csr.h>
+#include <linux/processor.h>
+
+#include "pi.h"
+
+/*
+ * To avoid rewriting code include asm/archrandom.h and create macros
+ * for the functions that won't be included.
+ */
+#undef riscv_has_extension_unlikely
+#define riscv_has_extension_likely(...) false
+#undef pr_err_once
+#define pr_err_once(...)
+
+#include <asm/archrandom.h>
+
+u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa)
+{
+	unsigned long seed = 0;
+
+	if (!fdt_early_match_extension_isa((const void *)dtb_pa, "zkr"))
+		return 0;
+
+	if (!csr_seed_long(&seed))
+		return 0;
+
+	return seed;
+}
diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index 40ee299702bf..9bdee2fafe47 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -2,6 +2,7 @@
 #include <linux/types.h>
 #include <linux/init.h>
 #include <linux/libfdt.h>
+#include <linux/ctype.h>
 
 #include "pi.h"
 
@@ -23,3 +24,162 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
 	*prop = 0;
 	return ret;
 }
+
+/**
+ *  fdt_device_is_available - check if a device is available for use
+ *
+ * @fdt: pointer to the device tree blob
+ * @node: offset of the node whose property to find
+ *
+ *  Returns true if the status property is absent or set to "okay" or "ok",
+ *  false otherwise
+ */
+static bool fdt_device_is_available(const void *fdt, int node)
+{
+	const char *status;
+	int statlen;
+
+	status = fdt_getprop(fdt, node, "status", &statlen);
+	if (!status)
+		return true;
+
+	if (statlen > 0) {
+		if (!strcmp(status, "okay") || !strcmp(status, "ok"))
+			return true;
+	}
+
+	return false;
+}
+
+/* Copy of fdt_nodename_eq_ */
+static int fdt_node_name_eq(const void *fdt, int offset,
+			    const char *s)
+{
+	int olen;
+	int len = strlen(s);
+	const char *p = fdt_get_name(fdt, offset, &olen);
+
+	if (!p || olen < len)
+		/* short match */
+		return 0;
+
+	if (memcmp(p, s, len) != 0)
+		return 0;
+
+	if (p[len] == '\0')
+		return 1;
+	else if (!memchr(s, '@', len) && (p[len] == '@'))
+		return 1;
+	else
+		return 0;
+}
+
+/**
+ *  isa_string_contains - check if isa string contains an extension
+ *
+ * @isa_str: isa string to search
+ * @ext_name: the extension to search for
+ *
+ *  Returns true if the extension is in the given isa string,
+ *  false otherwise
+ */
+static bool isa_string_contains(const char *isa_str, const char *ext_name)
+{
+	size_t i, single_end, len = strlen(ext_name);
+	char ext_end;
+
+	/* Error must contain rv32/64 */
+	if (strlen(isa_str) < 4)
+		return false;
+
+	if (len == 1) {
+		single_end = strcspn(isa_str, "sSxXzZ");
+		/* Search for single chars between rv32/64 and multi-letter extensions */
+		for (i = 4; i < single_end; i++) {
+			if (tolower(isa_str[i]) == ext_name[0])
+				return true;
+		}
+		return false;
+	}
+
+	/* Skip to start of multi-letter extensions */
+	isa_str = strpbrk(isa_str, "sSxXzZ");
+	while (isa_str) {
+		if (strncasecmp(isa_str, ext_name, len) == 0) {
+			ext_end = isa_str[len];
+			/* Check if matches the whole extension. */
+			if (ext_end == '\0' || ext_end == '_')
+				return true;
+		}
+		/* Multi-letter extensions must be split from other multi-letter
+		 * extensions with an "_", the end of a multi-letter extension will
+		 * either be the null character or the "_" at the start of the next
+		 * multi-letter extension.
+		 */
+		isa_str = strchr(isa_str, '_');
+		if (isa_str)
+			isa_str++;
+	}
+
+	return false;
+}
+
+/**
+ *  early_cpu_isa_ext_available - check if cpu node has an extension
+ *
+ * @fdt: pointer to the device tree blob
+ * @node: offset of the cpu node
+ * @ext_name: the extension to search for
+ *
+ *  Returns true if the cpu node has the extension,
+ *  false otherwise
+ */
+static bool early_cpu_isa_ext_available(const void *fdt, int node, const char *ext_name)
+{
+	const void *prop;
+	int len;
+
+	prop = fdt_getprop(fdt, node, "riscv,isa-extensions", &len);
+	if (prop && fdt_stringlist_contains(prop, len, ext_name))
+		return true;
+
+	prop = fdt_getprop(fdt, node, "riscv,isa", &len);
+	if (prop && isa_string_contains(prop, ext_name))
+		return true;
+
+	return false;
+}
+
+/**
+ *  fdt_early_match_extension_isa - check if all cpu nodes have an extension
+ *
+ * @fdt: pointer to the device tree blob
+ * @ext_name: the extension to search for
+ *
+ *  Returns true if the all available the cpu nodes have the extension,
+ *  false otherwise
+ */
+bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name)
+{
+	int node, parent;
+	bool ret = false;
+
+	parent = fdt_path_offset(fdt, "/cpus");
+	if (parent < 0)
+		return false;
+
+	fdt_for_each_subnode(node, fdt, parent) {
+		if (!fdt_node_name_eq(fdt, node, "cpu"))
+			continue;
+
+		if (!fdt_device_is_available(fdt, node))
+			continue;
+
+		if (!early_cpu_isa_ext_available(fdt, node, ext_name))
+			return false;
+
+		ret = true;
+	}
+
+	return ret;
+}
diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
index 493c8cb7c0e6..21141d84fea6 100644
--- a/arch/riscv/kernel/pi/pi.h
+++ b/arch/riscv/kernel/pi/pi.h
@@ -11,7 +11,10 @@
  */
 
 u64 get_kaslr_seed(uintptr_t dtb_pa);
+u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa);
 bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
 
+bool fdt_early_match_extension_isa(const void *fdt, const char *ext_name);
+
 #endif /* _RISCV_PI_H_ */
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9940171c79f0..bfb068dc4a64 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1025,6 +1025,7 @@ static void __init pt_ops_set_late(void)
 #ifdef CONFIG_RANDOMIZE_BASE
 extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
+extern u64 __init __pi_get_kaslr_seed_zkr(const uintptr_t dtb_pa);
 
 static int __init print_nokaslr(char *p)
 {
@@ -1045,10 +1046,12 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 
 #ifdef CONFIG_RANDOMIZE_BASE
 	if (!__pi_set_nokaslr_from_cmdline(dtb_pa)) {
-		u64 kaslr_seed = __pi_get_kaslr_seed(dtb_pa);
+		u64 kaslr_seed = __pi_get_kaslr_seed_zkr(dtb_pa);
 		u32 kernel_size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 		u32 nr_pos;
 
+		if (kaslr_seed == 0)
+			kaslr_seed = __pi_get_kaslr_seed(dtb_pa);
 		/*
 		 * Compute the number of positions available: we are limited
 		 * by the early page table that only has one PUD and we must
-- 
2.45.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
