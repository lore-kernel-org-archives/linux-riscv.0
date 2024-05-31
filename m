Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B32CDC25B7E
	for <linux-riscv@archiver.kernel.org>; Fri, 31 May 2024 16:23:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKbHuXI+HNLKuKU+p036/Cxposdq9Yqx0rKBvlZfhD8=; b=oyVmpr1HUCI3Yn
	N1khBt5OdMQLjgYgqGC4rrgr4NIweJOlqtr1rG8FKmXcrQ8nVxHHp1QZ6i/XmAvpwxqQ0hnbHgUNh
	lo90qIjlOKs6sHBDeiRZdNsu5Qm0hhVtQ9oyCLUHkf5sVIewV/GpTlwuSSYxuLp+d+T1VVQCstXbN
	P9bfgfev9I1Nrjp/DRM5V3Ny567ucJLyYPasKl2JKVlKe3GhfDe/e+RROFJJagf8N7i7cFnvRUnhG
	mU+vofugDBXwjcZ/6OmMV10bM52Z9wT1aRMGM3BnDw5IiCo7g6KbMmptupvGRHM6b1A89gTlJeyOT
	CYbCT7DyfcCRgs6I6nvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD52f-0000000ApMe-0DKn;
	Fri, 31 May 2024 16:23:45 +0000
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sD52a-0000000ApLk-3dJJ
	for linux-riscv@lists.infradead.org;
	Fri, 31 May 2024 16:23:43 +0000
Received: by mail-pf1-x42c.google.com with SMTP id d2e1a72fcca58-6f4603237e0so1625735b3a.0
        for <linux-riscv@lists.infradead.org>; Fri, 31 May 2024 09:23:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1717172619; x=1717777419; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rsKkVgyABm2zSwFdUDJOXq7adWq0Ho5JZ/Z2NJ4mJiU=;
        b=Z+RdQJkQZRRt/p/9WKB+89aZFKVPCIeOFGHpL35gOwGBTnjlzFDsD6gBFJeSfQgiEq
         J6K9NFPwXNUiPzIdnIJV3Pv3FvefseStHEsBGvxeE2DAXTvy3NTWtkNX6GUIVxv0cSSY
         MFpIKTj3rPsBJ9Lxf+R+weFTH6sOHK1okgAWjhyq6Ek89JdgJO9YATqLT2+ZLcEyj18m
         PY/VtCYTBToKaO+mpnfcjuCrjBj9JJosZh9KuVOfYOqxtZWt4PhrpGm/wtUsEQVYV4Sq
         HyovlRHVBUX+r8KDggYCjxXE/HE4yFf0BG+F7SImPV15mxGjuNolDxbxI6z8+5X+IPNC
         WC1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717172619; x=1717777419;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rsKkVgyABm2zSwFdUDJOXq7adWq0Ho5JZ/Z2NJ4mJiU=;
        b=OxqmKsuh9gTgZBGkoU7485aaQlPb0CXkhwn8s+bY9/Jv1v9fSAd0FUc9KQcUPRPMv4
         3HD7xeR0cwIYbCzdGoHljWKjzQPmoLQdcexLKmnxnWwbu3BAlYzSlgDWTXPapx4DRwXn
         nZrv+J37t21QL8Y4oq9Pp58Ap+Rt2VgoaypMVkRMLyclrPl8yUQTAVP2MpwvHlJnXtA9
         FoMRBQz/HmjUCylKjehkHAkELrP89R7epewvuw6BjOnKtXK2pkSSURVW0tHACwvhS4pu
         KHqKZdMoCzI8JtU8xIvZ0HDH0OAlHNQNfD1o6vU7SDrdj2VTj7I9gy/a6kAyYmijgOdX
         3/XQ==
X-Gm-Message-State: AOJu0YzwYSnJ3mBsZtiT4MmPujt19czy+pXi2pcVkqdbF8KnwYevzO9S
	L/x8Vc03pqmhVN50NwulFESbGMqi1ZLgnGr0bHPw5l9lQ9wU4lasRvpAeujFY42tb13oMJWVbwK
	7qds=
X-Google-Smtp-Source: AGHT+IHpgxDFAp5J7T641RR+0mVW8V2Nn0gbrQcP9lUx8oojqxJVe9W67kxVGgNI9Mv6tX6A5vxQdg==
X-Received: by 2002:a05:6a21:3a4a:b0:1af:86e4:bc99 with SMTP id adf61e73a8af0-1b26f12ce72mr3535729637.10.1717172618783;
        Fri, 31 May 2024 09:23:38 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-702423cb6eesm1572398b3a.6.2024.05.31.09.23.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 May 2024 09:23:38 -0700 (PDT)
From: Jesse Taube <jesse@rivosinc.com>
To: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	Jesse Taube <jesse@rivosinc.com>,
	Alexandre Ghiti <alexghiti@rivosinc.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v0] RISC-V: Use Zkr to seed KASLR base address
Date: Fri, 31 May 2024 12:23:27 -0400
Message-ID: <20240531162327.2436962-1-jesse@rivosinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240531_092340_928000_F900553D 
X-CRM114-Status: GOOD (  24.22  )
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

Dectect the Zkr extension and use it to seed the kernel base address.

Detection of the extension can not be done in the typical fashion, as
this is very early in the boot process. Instead, add a trap handler
and run it to see if the extension is present.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/kernel/pi/Makefile           |  2 +-
 arch/riscv/kernel/pi/archrandom_early.c | 71 +++++++++++++++++++++++++
 arch/riscv/mm/init.c                    |  3 ++
 3 files changed, 75 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 50bc5ef7dd2f..9025eb52945a 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -32,5 +32,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
 $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
+obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
 extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
new file mode 100644
index 000000000000..311be9388b5c
--- /dev/null
+++ b/arch/riscv/kernel/pi/archrandom_early.c
@@ -0,0 +1,71 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+/*
+ * To avoid rewriteing code include asm/archrandom.h and create macros
+ * for the functions that won't be included.
+ */
+
+#define riscv_has_extension_likely(...) false
+#define pr_err_once(...)
+
+#include <linux/types.h>
+#include <asm/hwcap.h>
+#include <asm/archrandom.h>
+
+/*
+ * Asm goto is needed so that the compiler does not remove the label.
+ */
+
+#define csr_goto_swap(csr, val)						\
+({									\
+	unsigned long __v;						\
+	__asm__ __volatile__ goto("csrrw %0, " __ASM_STR(csr) ", %1"	\
+				  : "=r" (__v) : "rK" (&&val)		\
+				  : "memory" : val);			\
+	__v;								\
+})
+
+/*
+ * Declare the functions that are exported (but prefixed) here so that LLVM
+ * does not complain it lacks the 'static' keyword (which, if added, makes
+ * LLVM complain because the function is actually unused in this file).
+ */
+
+u64 get_kaslr_seed_zkr(void);
+
+/*
+ * This function is called by setup_vm to check if the kernel has the ZKR.
+ * Traps haven't been set up yet, but save and restore the TVEC to avoid
+ * any side effects.
+ */
+
+static inline bool __must_check riscv_has_zkr(void)
+{
+	unsigned long tvec;
+
+	tvec = csr_goto_swap(CSR_TVEC, not_zkr);
+	csr_swap(CSR_SEED, 0);
+	csr_write(CSR_TVEC, tvec);
+	return true;
+not_zkr:
+	csr_write(CSR_TVEC, tvec);
+	return false;
+}
+
+u64 get_kaslr_seed_zkr(void)
+{
+	const int needed_seeds = sizeof(u64) / sizeof(long);
+	int i = 0;
+	u64 seed = 0;
+	long *entropy = (long *)(&seed);
+
+	if (!riscv_has_zkr())
+		return 0;
+
+	for (i = 0; i < needed_seeds; i++) {
+		if (!csr_seed_long(&entropy[i]))
+			return 0;
+	}
+
+	return seed;
+}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 9940171c79f0..8ef1edd2cddd 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1025,6 +1025,7 @@ static void __init pt_ops_set_late(void)
 #ifdef CONFIG_RANDOMIZE_BASE
 extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
+extern u64 __init __pi_get_kaslr_seed_zkr(void);
 
 static int __init print_nokaslr(char *p)
 {
@@ -1049,6 +1050,8 @@ asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 		u32 kernel_size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
 		u32 nr_pos;
 
+		if (kaslr_seed == 0)
+			kaslr_seed = __pi_get_kaslr_seed_zkr();
 		/*
 		 * Compute the number of positions available: we are limited
 		 * by the early page table that only has one PUD and we must
-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
