Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 769D1C04A94
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 15:09:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vrdD8F1GOT8lk6mEjXzPSA6NhBaFrWC+6F8X9EhJ6YM=; b=XYV1xp3QbaQVG0
	oIrut7slc0v3ncw41bstr3s9+/CMYrezSP4fmQS1y3ZKg1IPeFAcjfUJEfRJuh+KGnN8nQxEunA07
	7qW78pY3VttIT6aY+z+WEKtBSTVL2tZ8gxDDEcc2AaJmMfjyK8QE4f8p0qJpgD5hRdoM6XnyJMXud
	wao8iFOL9T1hm5jyL7xSB2nsY6h6WMWq1f4ORYDJvPdZAfudh9zagsl1DYvkMIZ1OqyUTtvDWydp1
	jWYVo3JbrDdNiFk3Y1gAk3QE3FT4Cl7V+svVZCy/Ci5h8yc+UaBBmcdRoLHENLreCa6T0SILBBPo8
	rkfOptbIK1gMi2Or3aMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxwM-003gYh-1T;
	Thu, 13 Jul 2023 15:09:10 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qJxwI-003gW1-2n
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 15:09:08 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3159da54e95so938900f8f.3
        for <linux-riscv@lists.infradead.org>; Thu, 13 Jul 2023 08:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1689260944; x=1691852944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=totAZSGL3sMvt7aEqkeHA/bfBbkIFO3TpIoyWFj1SaE=;
        b=1yrzFHJ4BrZOS04wTErG1FKAHIZRmQMqVZA89tyoNSWh+qnKTBSFRu4hL/RVFOknYs
         zeMYozyuL1COyu6cmpqn446A1Dhw2MDv/ebupplS6hRoJ1kxg22BARkxbrbwPkHU4sZp
         cOYcJPTv/a90lIA2IfJgrZhK04rq6Z9YZk5wPB3ccgLee0NhUuOGW+FUL/baYIVHOcjl
         xiPdlfctqK29qR8DydAFDz2qG7FJyx5Q4iX1mPprjCU1WSpDj61E9gpe5czMJrc2NWu/
         e8WQ4ExgFSBrwGYcT3ok03+0CIGWgLoNmzRDb+48dLuTe2phQL573vJWi8wWBGqVRx1q
         fzOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689260944; x=1691852944;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=totAZSGL3sMvt7aEqkeHA/bfBbkIFO3TpIoyWFj1SaE=;
        b=L5mQFJRDeVVLxWL2PdCbJhHbRzWeEeX4xrHWjhe/KYJ7jrNA6VNHymiRiknesUo12E
         X9TScDH1WhXA9FsFfzz+eN45uUaM809U/bdB5WB44jqrKPgQJ+6PI6RxoROQ0RfuQZ4e
         xteiT0WuNxbvAXu/8n2n9JAABRGVlpW7YBGP5wwCQgNDW/3FG4jsyIyFRZM3NSAXI2f4
         LA9K/CHlF7T1tQGooo85m0ib/ki5A8xhqy2FA9jnOBQhqueX/TfAKV8m9mygm3db+Jvr
         nK0MS8DfUrYhIf1PoVp2woesM0MlQ5KwnIH6Iu/AmrOOYluNGzWsQSTd4Xg+Ycj8CqMw
         W++w==
X-Gm-Message-State: ABy/qLYAP4T4qDob+f7/Jfd+6g17nWfSIGG58npLgr/d80gaTbd4Mhjq
	fiZ7vhzGKFGaUvYN613mFVksmw==
X-Google-Smtp-Source: APBJJlHX4HJYmmmwBbJbh+DgidGMW6x917biG3gDV1FNieb8Czkc+KamqF4D9lC2hAcRc+xbNjl8hQ==
X-Received: by 2002:a5d:4d4c:0:b0:314:53a4:42a5 with SMTP id a12-20020a5d4d4c000000b0031453a442a5mr1881977wru.51.1689260944043;
        Thu, 13 Jul 2023 08:09:04 -0700 (PDT)
Received: from alex-rivos.home (amontpellier-656-1-456-62.w92-145.abo.wanadoo.fr. [92.145.124.62])
        by smtp.gmail.com with ESMTPSA id r2-20020a056000014200b00315a57f1128sm7481501wrx.115.2023.07.13.08.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Jul 2023 08:09:03 -0700 (PDT)
From: Alexandre Ghiti <alexghiti@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Ard Biesheuvel <ardb@kernel.org>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH RESEND v4 1/5] riscv: Introduce virtual kernel mapping KASLR
Date: Thu, 13 Jul 2023 17:07:56 +0200
Message-Id: <20230713150800.120821-2-alexghiti@rivosinc.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230713150800.120821-1-alexghiti@rivosinc.com>
References: <20230713150800.120821-1-alexghiti@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_080906_903550_5814DAB6 
X-CRM114-Status: GOOD (  23.65  )
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

KASLR implementation relies on a relocatable kernel so that we can move
the kernel mapping.

The seed needed to virtually move the kernel is taken from the device tree,
so we rely on the bootloader to provide a correct seed. Zkr could be used
unconditionnally instead if implemented, but that's for another patch.

Signed-off-by: Alexandre Ghiti <alexghiti@rivosinc.com>
---
 arch/riscv/Kconfig                   | 19 +++++++++++++++
 arch/riscv/include/asm/page.h        |  3 +++
 arch/riscv/kernel/pi/Makefile        |  2 +-
 arch/riscv/kernel/pi/cmdline_early.c | 13 ++++++++++
 arch/riscv/kernel/pi/fdt_early.c     | 30 +++++++++++++++++++++++
 arch/riscv/mm/init.c                 | 36 +++++++++++++++++++++++++++-
 6 files changed, 101 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/kernel/pi/fdt_early.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 4c07b9189c86..6a606d5b74c6 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -719,6 +719,25 @@ config RELOCATABLE
 
           If unsure, say N.
 
+config RANDOMIZE_BASE
+        bool "Randomize the address of the kernel image"
+        select RELOCATABLE
+        depends on MMU && 64BIT && !XIP_KERNEL
+        help
+          Randomizes the virtual address at which the kernel image is
+          loaded, as a security feature that deters exploit attempts
+          relying on knowledge of the location of kernel internals.
+
+          It is the bootloader's job to provide entropy, by passing a
+          random u64 value in /chosen/kaslr-seed at kernel entry.
+
+          When booting via the UEFI stub, it will invoke the firmware's
+          EFI_RNG_PROTOCOL implementation (if available) to supply entropy
+          to the kernel proper. In addition, it will randomise the physical
+          location of the kernel Image as well.
+
+          If unsure, say N.
+
 endmenu # "Kernel features"
 
 menu "Boot options"
diff --git a/arch/riscv/include/asm/page.h b/arch/riscv/include/asm/page.h
index b55ba20903ec..5488ecc337b6 100644
--- a/arch/riscv/include/asm/page.h
+++ b/arch/riscv/include/asm/page.h
@@ -106,6 +106,7 @@ typedef struct page *pgtable_t;
 struct kernel_mapping {
 	unsigned long page_offset;
 	unsigned long virt_addr;
+	unsigned long virt_offset;
 	uintptr_t phys_addr;
 	uintptr_t size;
 	/* Offset between linear mapping virtual address and kernel load address */
@@ -185,6 +186,8 @@ extern phys_addr_t __phys_addr_symbol(unsigned long x);
 
 #define sym_to_pfn(x)           __phys_to_pfn(__pa_symbol(x))
 
+unsigned long kaslr_offset(void);
+
 #endif /* __ASSEMBLY__ */
 
 #define virt_addr_valid(vaddr)	({						\
diff --git a/arch/riscv/kernel/pi/Makefile b/arch/riscv/kernel/pi/Makefile
index 7b593d44c712..07915dc9279e 100644
--- a/arch/riscv/kernel/pi/Makefile
+++ b/arch/riscv/kernel/pi/Makefile
@@ -35,5 +35,5 @@ $(obj)/string.o: $(srctree)/lib/string.c FORCE
 $(obj)/ctype.o: $(srctree)/lib/ctype.c FORCE
 	$(call if_changed_rule,cc_o_c)
 
-obj-y		:= cmdline_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
+obj-y		:= cmdline_early.pi.o fdt_early.pi.o string.pi.o ctype.pi.o lib-fdt.pi.o lib-fdt_ro.pi.o
 extra-y		:= $(patsubst %.pi.o,%.o,$(obj-y))
diff --git a/arch/riscv/kernel/pi/cmdline_early.c b/arch/riscv/kernel/pi/cmdline_early.c
index 05652d13c746..68e786c84c94 100644
--- a/arch/riscv/kernel/pi/cmdline_early.c
+++ b/arch/riscv/kernel/pi/cmdline_early.c
@@ -14,6 +14,7 @@ static char early_cmdline[COMMAND_LINE_SIZE];
  * LLVM complain because the function is actually unused in this file).
  */
 u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa);
+bool set_nokaslr_from_cmdline(uintptr_t dtb_pa);
 
 static char *get_early_cmdline(uintptr_t dtb_pa)
 {
@@ -60,3 +61,15 @@ u64 set_satp_mode_from_cmdline(uintptr_t dtb_pa)
 
 	return match_noXlvl(cmdline);
 }
+
+static bool match_nokaslr(char *cmdline)
+{
+	return strstr(cmdline, "nokaslr");
+}
+
+bool set_nokaslr_from_cmdline(uintptr_t dtb_pa)
+{
+	char *cmdline = get_early_cmdline(dtb_pa);
+
+	return match_nokaslr(cmdline);
+}
diff --git a/arch/riscv/kernel/pi/fdt_early.c b/arch/riscv/kernel/pi/fdt_early.c
new file mode 100644
index 000000000000..899610e042ab
--- /dev/null
+++ b/arch/riscv/kernel/pi/fdt_early.c
@@ -0,0 +1,30 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/types.h>
+#include <linux/init.h>
+#include <linux/libfdt.h>
+
+/*
+ * Declare the functions that are exported (but prefixed) here so that LLVM
+ * does not complain it lacks the 'static' keyword (which, if added, makes
+ * LLVM complain because the function is actually unused in this file).
+ */
+u64 get_kaslr_seed(uintptr_t dtb_pa);
+
+u64 get_kaslr_seed(uintptr_t dtb_pa)
+{
+	int node, len;
+	fdt64_t *prop;
+	u64 ret;
+
+	node = fdt_path_offset((void *)dtb_pa, "/chosen");
+	if (node < 0)
+		return 0;
+
+	prop = fdt_getprop_w((void *)dtb_pa, node, "kaslr-seed", &len);
+	if (!prop || len != sizeof(u64))
+		return 0;
+
+	ret = fdt64_to_cpu(*prop);
+	*prop = 0;
+	return ret;
+}
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 70fb31960b63..ff926531236e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -1012,11 +1012,45 @@ static void __init pt_ops_set_late(void)
 #endif
 }
 
+#ifdef CONFIG_RANDOMIZE_BASE
+extern bool __init __pi_set_nokaslr_from_cmdline(uintptr_t dtb_pa);
+extern u64 __init __pi_get_kaslr_seed(uintptr_t dtb_pa);
+
+static int __init print_nokaslr(char *p)
+{
+	pr_info("Disabled KASLR");
+	return 0;
+}
+early_param("nokaslr", print_nokaslr);
+
+unsigned long kaslr_offset(void)
+{
+	return kernel_map.virt_offset;
+}
+#endif
+
 asmlinkage void __init setup_vm(uintptr_t dtb_pa)
 {
 	pmd_t __maybe_unused fix_bmap_spmd, fix_bmap_epmd;
 
-	kernel_map.virt_addr = KERNEL_LINK_ADDR;
+#ifdef CONFIG_RANDOMIZE_BASE
+	if (!__pi_set_nokaslr_from_cmdline(dtb_pa)) {
+		u64 kaslr_seed = __pi_get_kaslr_seed(dtb_pa);
+		u32 kernel_size = (uintptr_t)(&_end) - (uintptr_t)(&_start);
+		u32 nr_pos;
+
+		/*
+		 * Compute the number of positions available: we are limited
+		 * by the early page table that only has one PUD and we must
+		 * be aligned on PMD_SIZE.
+		 */
+		nr_pos = (PUD_SIZE - kernel_size) / PMD_SIZE;
+
+		kernel_map.virt_offset = (kaslr_seed % nr_pos) * PMD_SIZE;
+	}
+#endif
+
+	kernel_map.virt_addr = KERNEL_LINK_ADDR + kernel_map.virt_offset;
 	kernel_map.page_offset = _AC(CONFIG_PAGE_OFFSET, UL);
 
 #ifdef CONFIG_XIP_KERNEL
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
