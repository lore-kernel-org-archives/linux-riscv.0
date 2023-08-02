Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E53DC001DF
	for <linux-riscv@archiver.kernel.org>; Wed,  2 Aug 2023 11:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9h5a4tVrrG/RCuMDYUY8iLhpypPCN/j0sT1RiR8bBoI=; b=GANrrVu1Ix7Pe4
	4YVAMjWInyUxoloGR6y7Tw9RKVdUZkhmyT4CCQlZNiEx61YifclTBgQo1+rZ91D+tpH9anVDuwewD
	5c+XZcgv7MR8THTOTeXEMDqvBOZ9KO88iddxJKku5TubIAMPvgkTd/DuN9CHviDZjV4yQS8WVfFZQ
	7Z+xVApKYKWvAnCdoLn8qMxbJMpTiD3L53laB2FaCTcIsMjPqmb8p8+TrNPJpIJoVkJ73+h+RG0at
	2TPFGH08XYn2hq+74o9pLWifNnlScZFME40re3tuh7Le9Fd3MgvnbZCu/FU8NG9irc4xImoXvXsG0
	Fe87pLulx0Jtv6lt5ilQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9ns-004m5X-1B;
	Wed, 02 Aug 2023 11:14:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qR9no-004m42-0d
	for linux-riscv@lists.infradead.org;
	Wed, 02 Aug 2023 11:14:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1690974844; x=1722510844;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=hd7d47LxtBd1DyVtDUyG879vKOJH26KzWOIUEmCNKhs=;
  b=hgQxCjul8vTGbredAdN+R+rjdPXUbE7i7LlAny4FRe42JI+4zrVFJv8O
   KDQB6/mmObDe/OvWLi6TD44CNURd9oirFIo4YhKtHpWLV2R3JfaAY8aMI
   97ylaiHakCyrxP19BoibgrXb8NNQA1+p3kMY/jg1IMZXyNvFvGQbFg7iU
   4gKRjvMtKhUKCQgNpj7nrRvI9Vt+USwTmYuHndqEQu8sKpin/5vRTI35d
   l6bWVEzuPZISq/NPnvp/zzQ53gnivjvgi5OykzzSeYpsfoAE+E8etqKPN
   p+QIH5ZfxC5PyTOpCwT6myIFjew/R8H6n+iPniquAngrN2lJRfahmo81a
   w==;
X-IronPort-AV: E=Sophos;i="6.01,249,1684825200"; 
   d="scan'208";a="223462640"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 02 Aug 2023 04:14:00 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 2 Aug 2023 04:13:49 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Wed, 2 Aug 2023 04:13:47 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <palmer@dabbelt.com>
CC: <conor@kernel.org>, <conor.dooley@microchip.com>, Paul Walmsley
	<paul.walmsley@sifive.com>, Atish Patra <atishp@rivosinc.com>, Anup Patel
	<apatel@ventanamicro.com>, Alexandre Ghiti <alexghiti@rivosinc.com>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>, Song Shuai
	<suagrfillet@gmail.com>, JeeHeng Sia <jeeheng.sia@starfivetech.com>, "Petr
 Tesarik" <petrtesarik@huaweicloud.com>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <stable@vger.kernel.org>
Subject: [RFT 1/2] RISC-V: handle missing "no-map" properties for OpenSBI's PMP protected regions
Date: Wed, 2 Aug 2023 12:12:52 +0100
Message-ID: <20230802-detention-second-82ab2b53e07a@wendy>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230802-purse-hydrant-6f44f77364b0@wendy>
References: <20230802-purse-hydrant-6f44f77364b0@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4807; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=hd7d47LxtBd1DyVtDUyG879vKOJH26KzWOIUEmCNKhs=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmnrIw79JoOSM+ft5fLNlJCZf3HzV9/3m0r7wszedRjd5Pr RPK1jlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzEfiojw1ZRWbnNXZeKb8ttTvKeeK /CpUxJzvRtdHTfims9TGoP7RgZJpY4XDn29Zj+5Gutgk+OH6rZvkg6bfMDS97tE1O8S8yyWQE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_041404_610586_7BA3D6FD 
X-CRM114-Status: GOOD (  19.01  )
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

Add an erratum for versions [v0.8 to v1.3) of OpenSBI which fail to add
the "no-map" property to the reserved memory nodes for the regions it
has protected using PMPs.

Our existing fix sweeping hibernation under the carpet by marking it
NONPORTABLE is insufficient as there are other ways to generate
accesses to these reserved memory regions, as Petr discovered [1]
while testing crash kernels & kdump.

Intercede during the boot process when the afflicted versions of OpenSBI
are present & set the "no-map" property in all "mmode_resv" nodes before
the kernel does its reserved memory region initialisation.

Reported-by: Song Shuai <suagrfillet@gmail.com>
Link: https://lore.kernel.org/all/CAAYs2=gQvkhTeioMmqRDVGjdtNF_vhB+vm_1dHJxPNi75YDQ_Q@mail.gmail.com/
Reported-by: JeeHeng Sia <jeeheng.sia@starfivetech.com>
Link: https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/ITXwaKfA6z8
Reported-by: Petr Tesarik <petrtesarik@huaweicloud.com>
Closes: https://lore.kernel.org/linux-riscv/76ff0f51-d6c1-580d-f943-061e93073306@huaweicloud.com/ [1]
CC: stable@vger.kernel.org
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/include/asm/sbi.h |  5 +++++
 arch/riscv/kernel/sbi.c      | 42 +++++++++++++++++++++++++++++++++++-
 arch/riscv/mm/init.c         |  3 +++
 3 files changed, 49 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/sbi.h b/arch/riscv/include/asm/sbi.h
index 5b4a1bf5f439..5360f3476278 100644
--- a/arch/riscv/include/asm/sbi.h
+++ b/arch/riscv/include/asm/sbi.h
@@ -252,6 +252,9 @@ enum sbi_pmu_ctr_type {
 #define SBI_ERR_ALREADY_STARTED -7
 #define SBI_ERR_ALREADY_STOPPED -8
 
+/* SBI implementation IDs */
+#define SBI_IMP_OPENSBI	1
+
 extern unsigned long sbi_spec_version;
 struct sbiret {
 	long error;
@@ -259,6 +262,8 @@ struct sbiret {
 };
 
 void sbi_init(void);
+void sbi_apply_reserved_mem_erratum(void *dtb_va);
+
 struct sbiret sbi_ecall(int ext, int fid, unsigned long arg0,
 			unsigned long arg1, unsigned long arg2,
 			unsigned long arg3, unsigned long arg4,
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c672c8ba9a2a..aeb27263fa53 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -5,8 +5,10 @@
  * Copyright (c) 2020 Western Digital Corporation or its affiliates.
  */
 
+#include <linux/acpi.h>
 #include <linux/bits.h>
 #include <linux/init.h>
+#include <linux/libfdt.h>
 #include <linux/pm.h>
 #include <linux/reboot.h>
 #include <asm/sbi.h>
@@ -583,6 +585,40 @@ long sbi_get_mimpid(void)
 }
 EXPORT_SYMBOL_GPL(sbi_get_mimpid);
 
+static long sbi_firmware_id;
+static long sbi_firmware_version;
+
+/*
+ * For devicetrees patched by OpenSBI a "mmode_resv" node is added to cover
+ * the region OpenSBI has protected by means of a PMP. Some versions of OpenSBI,
+ * [v0.8 to v1.3), omitted the "no-map" property, but this trips up hibernation
+ * among other things.
+ */
+void __init sbi_apply_reserved_mem_erratum(void *dtb_pa)
+{
+	int child, reserved_mem;
+
+	if (sbi_firmware_id != SBI_IMP_OPENSBI)
+		return;
+
+	if (!acpi_disabled)
+		return;
+
+	if (sbi_firmware_version >= 0x10003 || sbi_firmware_version < 0x8)
+		return;
+
+	reserved_mem = fdt_path_offset((void *)dtb_pa, "/reserved-memory");
+	if (reserved_mem < 0)
+		return;
+
+	fdt_for_each_subnode(child, (void *)dtb_pa, reserved_mem) {
+		const char *name = fdt_get_name((void *)dtb_pa, child, NULL);
+
+		if (!strncmp(name, "mmode_resv", 10))
+			fdt_setprop((void *)dtb_pa, child, "no-map", NULL, 0);
+	}
+};
+
 void __init sbi_init(void)
 {
 	int ret;
@@ -596,8 +632,12 @@ void __init sbi_init(void)
 		sbi_major_version(), sbi_minor_version());
 
 	if (!sbi_spec_is_0_1()) {
+		sbi_firmware_id = sbi_get_firmware_id();
+		sbi_firmware_version = sbi_get_firmware_version();
+
 		pr_info("SBI implementation ID=0x%lx Version=0x%lx\n",
-			sbi_get_firmware_id(), sbi_get_firmware_version());
+			sbi_firmware_id, sbi_firmware_version);
+
 		if (sbi_probe_extension(SBI_EXT_TIME)) {
 			__sbi_set_timer = __sbi_set_timer_v02;
 			pr_info("SBI TIME extension detected\n");
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 70fb31960b63..cb16bfdeacdb 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -29,6 +29,7 @@
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
 #include <asm/soc.h>
+#include <asm/sbi.h>
 #include <asm/io.h>
 #include <asm/ptdump.h>
 #include <asm/numa.h>
@@ -253,6 +254,8 @@ static void __init setup_bootmem(void)
 	 * in the device tree, otherwise the allocation could end up in a
 	 * reserved region.
 	 */
+
+	sbi_apply_reserved_mem_erratum(dtb_early_va);
 	early_init_fdt_scan_reserved_mem();
 
 	/*
-- 
2.40.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
