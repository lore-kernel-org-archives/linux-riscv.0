Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72B46C77B75
	for <linux-riscv@archiver.kernel.org>; Mon,  8 May 2023 18:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=NzisQPmY5Xx4GsMtO6on9JNqLG7yV/VnWQb4dDbPBAM=; b=1BBRyIexpqwdPv
	KaefuKjaIR8lwWRLYnyZl885lPztUFZr1+Zn+At4BR6FEZrQlXoy4Ux/peTi0jN6OD6MMpZ+onu3e
	8tiDv2RvTdOlFuh2rFJGmEL0mX9QfBOLyhtfJC13nfp8yAyUNg9WmoQeVsKQB43egVFg1DX80yjhm
	6qblC/DyNdXTpQy0q3GqiLt6mRAt63udlqlAyfYLiA4cugMPUYxzuP22HJnD4mleV1rMdCLTpi89h
	tXOtxc+C/u9skL5s6QEAux6HtO9gzIVeUSgc2F9He+xm5pZqqiwSs3X2oFCZnZH6vBwU5Bdf6AoDu
	hD4S5Dysao4NzFngKS8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5QD-0016fe-2C;
	Mon, 08 May 2023 18:17:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pw5Q5-0016dU-0g
	for linux-riscv@lists.infradead.org;
	Mon, 08 May 2023 18:17:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C57E462A6B;
	Mon,  8 May 2023 18:17:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92CB0C4339E;
	Mon,  8 May 2023 18:17:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1683569828;
	bh=gDn1qNH4xsBYthgkWZ/em1+NKvHh2zOBpGtKE3Kkd9E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fy0R37YJZ+qpMbPvgvndws5ZRECKzZAA0rPv9fBFCZ5RDt6lPp3ZQS9YpHUdlEjs3
	 EpOsR/MTJRTk3VlrX97HGv9a7dZaitvOksgQ6zNz71wxhTl4tvdMvdZ32hl+/G8+jS
	 HK/UpBPYtWdViiU9JEfj2v7o4AKaeH7V8bXSD72G4srhVpLVBx3mIqP6eBfk4Oo5pn
	 zFhl8eYUIOV5673izj4FirYSR/GfTWDoUuwMhBnlnWtPKdqUx7C2mdZgWSq6TJU4uB
	 BZxlXEvsRfG140EKi9KkXdwwpFa8YMevkljNfeHGlioWEfhm01yHF75OOhj7G/xoGV
	 ZclSh88zLAPIw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Subject: [RFC 4/6] RISC-V: add support for riscv,isa-base property
Date: Mon,  8 May 2023 19:16:24 +0100
Message-Id: <20230508-village-robotics-54fdbcb96ee5@spud>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230508-hypnotic-phobia-99598439d828@spud>
References: <20230508-hypnotic-phobia-99598439d828@spud>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=9974; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=X1JoMdz0XypRBvha+Fq4gfZjd7/ZEaml0zIsOaAfMPE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmRNmXXEnd9sfxbW63MLP0ksi1Ifovs3piU92fy/Z6vu tU+cf7FjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExk1TWG/5U/nX4ZKKdNM7rE tHKRs7rYJYlNrRz1kmZOhu6ve+SPljMyvKn+lepQonj+1OM1Vs4T5pR9XOhsr5Y7oSpP4NF1ddE 8dgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230508_111709_333124_6D877E54 
X-CRM114-Status: GOOD (  27.40  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, conor@kernel.org, Yangyu Chen <cyy@cyyself.name>, Conor Dooley <conor.dooley@microchip.com>, Rob Herring <robh+dt@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Paul Walmsley <paul.walmsley@sifive.com>, Andrew Jones <ajones@ventanamicro.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

I'm not entirely sure if this is needed, but I felt we still needed a
mechanism for communicating the base ISA. Perhaps the i here should not
even be present, but a way to encode the bit-width is missing from my
key-value stuff. Very much open to suggestions on this aspect.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/hwcap.h |   8 +--
 arch/riscv/kernel/cpu.c        | 119 +++++++++------------------------
 arch/riscv/kernel/cpufeature.c |  41 ++++++++++++
 3 files changed, 73 insertions(+), 95 deletions(-)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index f963a7a82ce1..cb4b3df0a5d5 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -59,13 +59,6 @@
 
 #include <linux/jump_label.h>
 
-struct riscv_isa_ext_data {
-	/* Name of the extension displayed to userspace via /proc/cpuinfo */
-	char uprop[RISCV_ISA_EXT_NAME_LEN_MAX];
-	/* The logical ISA extension ID */
-	unsigned int isa_ext_id;
-};
-
 struct riscv_isa_extension {
 	const u64 key;
 	const char *name;
@@ -83,6 +76,7 @@ struct riscv_isa_extension {
 }
 
 extern const struct riscv_isa_extension riscv_isa_extensions[];
+extern const size_t riscv_isa_extensions_count;
 
 unsigned long riscv_isa_extension_base(const unsigned long *isa_bitmap);
 
diff --git a/arch/riscv/kernel/cpu.c b/arch/riscv/kernel/cpu.c
index 0d5d580dca61..c29643dca0f7 100644
--- a/arch/riscv/kernel/cpu.c
+++ b/arch/riscv/kernel/cpu.c
@@ -59,8 +59,25 @@ int riscv_early_of_processor_hartid(struct device_node *node, unsigned long *har
 		return -ENODEV;
 	}
 
+	if (of_property_read_string(node, "riscv,isa-base", &isa))
+		goto old_interface;
+
+	if (IS_ENABLED(CONFIG_32BIT) && strncasecmp(isa, "rv32i", 5))
+		return -ENODEV;
+
+	if (IS_ENABLED(CONFIG_64BIT) && strncasecmp(isa, "rv64i", 5))
+		return -ENODEV;
+
+	if (!of_property_present(node, "riscv,isa-extension-m") ||
+	    !of_property_present(node, "riscv,isa-extension-a"))
+		return -ENODEV;
+
+	return 0;
+
+old_interface:
 	if (of_property_read_string(node, "riscv,isa", &isa)) {
-		pr_warn("CPU with hartid=%lu has no \"riscv,isa\" property\n", *hart);
+		pr_warn("CPU with hartid=%lu has no \"riscv,isa-base\" or \"riscv,isa\" property\n",
+			*hart);
 		return -ENODEV;
 	}
 
@@ -157,106 +174,33 @@ static int __init riscv_cpuinfo_init(void)
 arch_initcall(riscv_cpuinfo_init);
 
 #ifdef CONFIG_PROC_FS
-
-#define __RISCV_ISA_EXT_DATA(UPROP, EXTID) \
-	{							\
-		.uprop = #UPROP,				\
-		.isa_ext_id = EXTID,				\
-	}
-
-/*
- * The canonical order of ISA extension names in the ISA string is defined in
- * chapter 27 of the unprivileged specification.
- *
- * Ordinarily, for in-kernel data structures, this order is unimportant but
- * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
- *
- * The specification uses vague wording, such as should, when it comes to
- * ordering, so for our purposes the following rules apply:
- *
- * 1. All multi-letter extensions must be separated from other extensions by an
- *    underscore.
- *
- * 2. Additional standard extensions (starting with 'Z') must be sorted after
- *    single-letter extensions and before any higher-privileged extensions.
-
- * 3. The first letter following the 'Z' conventionally indicates the most
- *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
- *    If multiple 'Z' extensions are named, they must be ordered first by
- *    category, then alphabetically within a category.
- *
- * 3. Standard supervisor-level extensions (starting with 'S') must be listed
- *    after standard unprivileged extensions.  If multiple supervisor-level
- *    extensions are listed, they must be ordered alphabetically.
- *
- * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
- *    after any lower-privileged, standard extensions.  If multiple
- *    machine-level extensions are listed, they must be ordered
- *    alphabetically.
- *
- * 5. Non-standard extensions (starting with 'X') must be listed after all
- *    standard extensions. If multiple non-standard extensions are listed, they
- *    must be ordered alphabetically.
- *
- * An example string following the order is:
- *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
- *
- * New entries to this struct should follow the ordering rules described above.
- */
-static struct riscv_isa_ext_data isa_ext_arr[] = {
-	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),
-	__RISCV_ISA_EXT_DATA(zicbom, RISCV_ISA_EXT_ZICBOM),
-	__RISCV_ISA_EXT_DATA(zicboz, RISCV_ISA_EXT_ZICBOZ),
-	__RISCV_ISA_EXT_DATA(zifencei, RISCV_ISA_EXT_ZIFENCEI),
-	__RISCV_ISA_EXT_DATA(zihintpause, RISCV_ISA_EXT_ZIHINTPAUSE),
-	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
-	__RISCV_ISA_EXT_DATA(sscofpmf, RISCV_ISA_EXT_SSCOFPMF),
-	__RISCV_ISA_EXT_DATA(sstc, RISCV_ISA_EXT_SSTC),
-	__RISCV_ISA_EXT_DATA(svinval, RISCV_ISA_EXT_SVINVAL),
-	__RISCV_ISA_EXT_DATA(svnapot, RISCV_ISA_EXT_SVNAPOT),
-	__RISCV_ISA_EXT_DATA(svpbmt, RISCV_ISA_EXT_SVPBMT),
-	__RISCV_ISA_EXT_DATA("", RISCV_ISA_EXT_MAX),
-};
-
 static void print_isa_ext(struct seq_file *f)
 {
-	struct riscv_isa_ext_data *edata;
 	int i = 0, arr_sz;
 
-	arr_sz = ARRAY_SIZE(isa_ext_arr) - 1;
+	arr_sz = riscv_isa_extensions_count - 1;
 
 	/* No extension support available */
 	if (arr_sz <= 0)
 		return;
 
-	for (i = 0; i <= arr_sz; i++) {
-		edata = &isa_ext_arr[i];
-		if (!__riscv_isa_extension_available(NULL, edata->isa_ext_id))
+	for (i = 0; i < arr_sz; i++) {
+		if (!__riscv_isa_extension_available(NULL, riscv_isa_extensions[i].key))
 			continue;
-		seq_printf(f, "_%s", edata->uprop);
+		if (riscv_isa_extensions[i].multi_letter)
+			seq_printf(f, "_");
+
+		seq_printf(f, "%s", riscv_isa_extensions[i].name);
 	}
 }
 
-/*
- * These are the only valid base (single letter) ISA extensions as per the spec.
- * It also specifies the canonical order in which it appears in the spec.
- * Some of the extension may just be a place holder for now (B, K, P, J).
- * This should be updated once corresponding extensions are ratified.
- */
-static const char base_riscv_exts[13] = "imafdqcbkjpvh";
-
-static void print_isa(struct seq_file *f, const char *isa)
+static void print_isa(struct seq_file *f)
 {
-	int i;
+	if (IS_ENABLED(CONFIG_64BIT))
+		seq_puts(f, "isa\t\t: rv64");
+	else
+		seq_puts(f, "isa\t\t: rv32");
 
-	seq_puts(f, "isa\t\t: ");
-	/* Print the rv[64/32] part */
-	seq_write(f, isa, 4);
-	for (i = 0; i < sizeof(base_riscv_exts); i++) {
-		if (__riscv_isa_extension_available(NULL, base_riscv_exts[i] - 'a'))
-			/* Print only enabled the base ISA extensions */
-			seq_write(f, &base_riscv_exts[i], 1);
-	}
 	print_isa_ext(f);
 	seq_puts(f, "\n");
 }
@@ -312,8 +256,7 @@ static int c_show(struct seq_file *m, void *v)
 
 	seq_printf(m, "processor\t: %lu\n", cpu_id);
 	seq_printf(m, "hart\t\t: %lu\n", cpuid_to_hartid_map(cpu_id));
-	if (!of_property_read_string(node, "riscv,isa", &isa))
-		print_isa(m, isa);
+	print_isa(m);
 	print_mmu(m);
 	if (!of_property_read_string(node, "compatible", &compat)
 	    && strcmp(compat, "riscv"))
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 1ead76adf60f..d415a86a11e7 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -93,6 +93,45 @@ static bool riscv_isa_extension_check(int id)
 	return true;
 }
 
+/*
+ * The canonical order of ISA extension names in the ISA string is defined in
+ * chapter 27 of the unprivileged specification.
+ *
+ * Ordinarily, for in-kernel data structures, this order is unimportant but
+ * isa_ext_arr defines the order of the ISA string in /proc/cpuinfo.
+ *
+ * The specification uses vague wording, such as should, when it comes to
+ * ordering, so for our purposes the following rules apply:
+ *
+ * 1. All multi-letter extensions must be separated from other extensions by an
+ *    underscore.
+ *
+ * 2. Additional standard extensions (starting with 'Z') must be sorted after
+ *    single-letter extensions and before any higher-privileged extensions.
+
+ * 3. The first letter following the 'Z' conventionally indicates the most
+ *    closely related alphabetical extension category, IMAFDQLCBKJTPVH.
+ *    If multiple 'Z' extensions are named, they must be ordered first by
+ *    category, then alphabetically within a category.
+ *
+ * 3. Standard supervisor-level extensions (starting with 'S') must be listed
+ *    after standard unprivileged extensions.  If multiple supervisor-level
+ *    extensions are listed, they must be ordered alphabetically.
+ *
+ * 4. Standard machine-level extensions (starting with 'Zxm') must be listed
+ *    after any lower-privileged, standard extensions.  If multiple
+ *    machine-level extensions are listed, they must be ordered
+ *    alphabetically.
+ *
+ * 5. Non-standard extensions (starting with 'X') must be listed after all
+ *    standard extensions. If multiple non-standard extensions are listed, they
+ *    must be ordered alphabetically.
+ *
+ * An example string following the order is:
+ *    rv64imadc_zifoo_zigoo_zafoo_sbar_scar_zxmbaz_xqux_xrux
+ *
+ * New entries to this struct should follow the ordering rules described above.
+ */
 const struct riscv_isa_extension riscv_isa_extensions[] = {
 	RISCV_ISA_EXT_CFG(i, RISCV_ISA_EXT_i, "v1.0.0", false),
 	RISCV_ISA_EXT_CFG(m, RISCV_ISA_EXT_m, "v1.0.0", false),
@@ -121,6 +160,8 @@ const struct riscv_isa_extension riscv_isa_extensions[] = {
 	RISCV_ISA_EXT_CFG("", RISCV_ISA_EXT_MAX, "", false),
 };
 
+const size_t riscv_isa_extensions_count = ARRAY_SIZE(riscv_isa_extensions);
+
 static void __init riscv_fill_hwcap_isa_string(void)
 {
 	struct device_node *node;
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
