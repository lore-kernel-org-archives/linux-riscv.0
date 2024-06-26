Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0348C27C4F
	for <linux-riscv@archiver.kernel.org>; Wed, 26 Jun 2024 17:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1Wf1COs7ZmIaYq9XoJXyxnftEKYEc6Jc/mCFNTOb+us=; b=mt8jF/10yCFOco
	njiweuxp3mDLaG5OKLFoz4WVoLwJvxt0x6EP15j086OAzCNJG/chWFmuGDWsSr25jBhV++Lnuud4q
	tKchAqNJrGdRAR1mCWTIHoyCvPevE9D0ippPKs1ecaFVv8efqSbMHdZJYP5Ovi+qz7UhTE/Qay4WS
	MGBazMh0vS0hhyGzU1WqvW4e/4v8PA1xZf5sniX4I8z/id2BL9EOAXbop7BDQ/S+VzB8ey1s1hu0l
	g8n6BTTS8nwAx5eLVE8FnP6LdPsFq4H8R04Lg7NwGR8ekCeqskeDk2n8/dXz7yq2EkJu9ztWkIkZy
	W4vavybyn6m5jXFC8VNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWH3-00000007jTB-1GEn;
	Wed, 26 Jun 2024 17:17:37 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sMWGx-00000007jPh-0dEK
	for linux-riscv@lists.infradead.org;
	Wed, 26 Jun 2024 17:17:32 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-2c7dbdc83bfso5319195a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 26 Jun 2024 10:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719422250; x=1720027050; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=of2FbNumXWiiWPSU2khL/cXCQvlYVxK+wsi6dw//9/8=;
        b=D1/JBI6Qzen96qTy15xhFPunNaEf59PZkR2ngXJfkiJBjCNlPphhO9ZGK/9Jdjo1hG
         mOXwyqJKEBW+GREKZw33Cv8NdK0xfCk0+kI4Fl1VFr31eg2N8mbSvQkz8XZaLCGbplUO
         iS3GyEovX/NFR1iUZI/tMZxt9zkyaLvwMS/XdyyL7C7VYnkQ5iYnyij/2+4o2N0UjStW
         vPTd3gqB9uKy7rO7pf71xfk7BH5/B30KfTaRdi5BloVh2d5PHloQPTkpSSlcG9h3xD1l
         hwBzWF6d4aDYrBrZ7+1h2B8ZypKznr9+3x2/Goo39fPdt5kJgY4XfYe6JAZatJJ8qusJ
         /f+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719422250; x=1720027050;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=of2FbNumXWiiWPSU2khL/cXCQvlYVxK+wsi6dw//9/8=;
        b=owowU5UhBkkw7vLD+nG6nbR9PXl8elG1D474NYF3Mcx/8Aghrg1T8dv0WstlfPCJE9
         1O2FuDNnTVupp6NJ7sSgHU7neddYrBeZlmAB1ydBsFhbYi4rJzIQwcUukVLX3gYPLW87
         9jka9RJXkFsq7edAR2jFt/dDF217jmtpeaD0keGU2PGjUZsdpY4o/pQHesoD809pACYm
         CKTfyHLQeJoN6Kgl5odEKPBHOSLazHhjw1emfmfO4hagoSLCGU0QZxkITp42sdzdt+F3
         7O91cHjEoHSX210VfGN0Ra0txPLWEd3hgDWancLKKn2C2EEE7lobF0enQ64me4NSeFLU
         4m0w==
X-Gm-Message-State: AOJu0Ywm6tk4pyhoF4oB7GXPpFGHgbhBBlE10+tg0EpO2omubEHg1Kfb
	5OvrvhrmnTjq6niOXQSlSVvUiAFE+8LGYdrzDQ0HFEkmFjgcdbL89laL2vlrv8AQTtv/w7Zvy35
	s
X-Google-Smtp-Source: AGHT+IGyHd+WADwyRkT1gcGbulDJF4qqkfp5LHBXeyGhlm6qCM53u/kZpVYoYyrJHx1rDz4EeAXGkg==
X-Received: by 2002:a17:90b:1884:b0:2c2:f6dc:eb12 with SMTP id 98e67ed59e1d1-2c8612c7375mr10774803a91.11.1719422249790;
        Wed, 26 Jun 2024 10:17:29 -0700 (PDT)
Received: from jesse-desktop.. (pool-108-26-179-17.bstnma.fios.verizon.net. [108.26.179.17])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2c8f3b5ad36sm83217a91.26.2024.06.26.10.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Jun 2024 10:17:29 -0700 (PDT)
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
	Chen Jiahao <chenjiahao16@huawei.com>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH v2 3/3] RISC-V: Use Zkr to seed KASLR base address
Date: Wed, 26 Jun 2024 13:16:52 -0400
Message-ID: <20240626171652.366415-3-jesse@rivosinc.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20240626171652.366415-1-jesse@rivosinc.com>
References: <20240626171652.366415-1-jesse@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240626_101731_217573_165E8743 
X-CRM114-Status: GOOD (  23.95  )
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

Parse the device tree for Zkr in isa string.
If Zkr is present, use it to seed the kernel base address.

Signed-off-by: Jesse Taube <jesse@rivosinc.com>
---
 arch/riscv/kernel/pi/Makefile           |  2 +-
 arch/riscv/kernel/pi/archrandom_early.c | 30 ++++++++
 arch/riscv/kernel/pi/fdt_early.c        | 94 +++++++++++++++++++++++++
 arch/riscv/kernel/pi/pi.h               |  3 +
 arch/riscv/mm/init.c                    |  5 +-
 5 files changed, 132 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/archrandom_early.c

diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 1ef7584be0c3..dba902f2a538 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -33,5 +33,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
 $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
+obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o archrandom_early.pi.o
 extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
diff --git a/arch/riscv/kernel/pi/archrandom_early.c b/arch/riscv/kernel/pi/archrandom_early.c
new file mode 100644
index 000000000000..c6261165e8a6
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
+	if (!early_isa_str((const void *)dtb_pa, "zkr"))
+		return 0;
+
+	if (!csr_seed_long(&seed))
+		return 0;
+
+	return seed;
+}
diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
index 40ee299702bf..ba76197b44d1 100644
--- a/arch/riscv/kernel/pi/fdt_early.c
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -23,3 +23,97 @@ u64 get_kaslr_seed(uintptr_t dtb_pa)
 	*prop = 0;
 	return ret;
 }
+
+/* Based off of fdt_stringlist_contains */
+static int isa_string_contains(const char *strlist, int listlen, const char *str)
+{
+	int len = strlen(str);
+	const char *p;
+
+	while (listlen >= len) {
+		if (strncasecmp(str, strlist, len) == 0)
+			return 1;
+		p = memchr(strlist, '_', listlen);
+		if (!p)
+			p = memchr(strlist, '\0', listlen);
+		if (!p)
+			return 0; /* malformed strlist.. */
+		listlen -= (p - strlist) + 1;
+		strlist = p + 1;
+	}
+
+	return 0;
+}
+
+/* Based off of fdt_nodename_eq_ */
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
+/*
+ * Returns true if the extension is in the isa string
+ * Returns false if the extension is not found
+ */
+static bool get_ext_named(const void *fdt, int node, const char *name)
+{
+	const void *prop;
+	int len;
+
+	prop = fdt_getprop(fdt, node, "riscv,isa-base", &len);
+	if (prop && isa_string_contains(prop, len, name))
+		return true;
+
+	prop = fdt_getprop(fdt, node, "riscv,isa-extensions", &len);
+	if (prop && isa_string_contains(prop, len, name))
+		return true;
+
+	prop = fdt_getprop(fdt, node, "riscv,isa", &len);
+	if (prop && isa_string_contains(prop, len, name))
+		return true;
+
+	return false;
+}
+
+/*
+ * Returns true if the extension is in the isa string on all cpus
+ * Returns false if the extension is not found
+ */
+bool early_isa_str(const void *fdt, const char *ext_name)
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
+		if (!get_ext_named(fdt, node, ext_name))
+			return false;
+
+		ret = true;
+	}
+
+	return ret;
+}
diff --git a/arch/riscv/kernel/pi/pi.h b/arch/riscv/kernel/pi/pi.h
index 65da99466baf..26e7e5f84a30 100644
--- a/arch/riscv/kernel/pi/pi.h
+++ b/arch/riscv/kernel/pi/pi.h
@@ -4,6 +4,8 @@
 
 #include <linux/types.h>
 
+bool early_isa_str(const void *fdt, const char *ext_name);
+
 /*
  * The folowing functions are exported (but prefixed) declare them here so
  * that LLVM does not complain it lacks the 'static' keyword (which, if
@@ -11,6 +13,7 @@
  */
 
 u64 get_kaslr_seed(uintptr_t dtb_pa);
+u64 get_kaslr_seed_zkr(const uintptr_t dtb_pa);
 bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
 
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
