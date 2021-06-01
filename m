Return-Path: <SRS0=0g6C=K3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00A43C4708F
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 15:01:07 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9D8EC6128A
	for <linux-riscv@archiver.kernel.org>; Tue,  1 Jun 2021 15:01:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9D8EC6128A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=b7TUg3ueOw27eOdFpB/w62M/3Gt9fDop4rA0rD+JZ7k=; b=ywPiAmTgzYjUKz
	IClDt0Bcwnkzq8iH8sXkzBfqgwrju4Wahp2hZEUEddUlhGu9iZV5KgJlrOjOmtoHpiHqmmyOZ8Jow
	hukDLXvF8sB/hGf8bFAOlMAAvHTXy/oxMXwZbXXJYXP2vzW/81xKNFM1LXkIzG+Y3tW3xjtz5Qwob
	oGqqVtkUDdRRJi3wqp6PoJiJwExLWGp1e9uQsnSZgkWuZbcWsGSxI4QQb58YHV9TBVXokGIoFPs+I
	74ug7IK55NK3gyDlitySQ3veSficGaR/0BNE0aLVnf4/OBiCQSePeZBZslaTQS54orxIOXP3vQpvt
	CFcudIuQhHWWkde7u5aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lo5st-00H46h-Av; Tue, 01 Jun 2021 15:00:47 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lo5sc-00H40D-F4
 for linux-riscv@lists.infradead.org; Tue, 01 Jun 2021 15:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622559629;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=hAx+DmaU9psRUFpOWKzTpPgXBDLvmtbZVBLkZrWn7aA=;
 b=bz1W2R4Y+tfS8o/vPu1CRk/Z4ocU+fBRLakcvSQv/La2z84/LmJwkKwZpZ+venfv8jmijJ
 eTyTgxcPtLuWOlIElVnAo4f43MkC3AY/SIiiEqL5pwHmKANZ4dX4+j7Iuh11psnJXjeiUC
 u/XNgM+C1Ioea8CnUcVXHkVKyUVEkZM=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-478-Uxs8XjlNP0awGdy3Te_Ajg-1; Tue, 01 Jun 2021 11:00:28 -0400
X-MC-Unique: Uxs8XjlNP0awGdy3Te_Ajg-1
Received: by mail-wm1-f69.google.com with SMTP id
 r15-20020a05600c35cfb029017cc4b1e9faso1172559wmq.8
 for <linux-riscv@lists.infradead.org>; Tue, 01 Jun 2021 08:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hAx+DmaU9psRUFpOWKzTpPgXBDLvmtbZVBLkZrWn7aA=;
 b=QZfDTA3M8PLX/aGZR9o9kFg0489vEq8h7ayNo5IYOKBtR4fF2KRf5Js2UdDFYrImKB
 KbNDFTplYZv3KhYgA8mQoEkuI05jfTBXVjM5V3J7HGiq828V8o/647CFwMISCq6yDqvi
 slYTmwQKbmJVNqjR5a56P8IScCAndNhedVc8i3aDgyjRt3p4DxSobi1MoTnHzXfopoe5
 c0q5MBRpjsxPWQhl2zU1OH4APjZcYvDlGf6QpX4++vaJzJgK707R53jU0ahgjWrU0aHP
 fwCFP0m0L/8t65k4wPKNi3q37FztXcfJjPSdm3WNqmkUw/lMNbwTDxAltU2kwkTGR6KX
 o68Q==
X-Gm-Message-State: AOAM531CWScyBiUt0IUGrKwE5mZ/mGxTRA6ajESP9uf176q0KDe+uhjc
 qFWHuPtOhyJ2FqKqAqEicMtTQd1qHzMDE3LlmZuFDQ/2YAlRpg7tQuz9v+9j+bbDcHYBZrFP8kh
 9VSzUYYN2KzkV6MvCTA47VDO/o3na
X-Received: by 2002:a1c:4606:: with SMTP id t6mr10455275wma.122.1622559623740; 
 Tue, 01 Jun 2021 08:00:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxb3gWNTGsicMh72TPTgarw80B3/Xgd3dh6bwU5R919OO11/15QK5NWgTLz4MJdZteAlri8Pg==
X-Received: by 2002:a1c:4606:: with SMTP id t6mr10455243wma.122.1622559623491; 
 Tue, 01 Jun 2021 08:00:23 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id h9sm18532656wmb.35.2021.06.01.08.00.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Jun 2021 08:00:22 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Albert Ou <aou@eecs.berkeley.edu>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Russell King <linux@armlinux.org.uk>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org,
 linux-riscv@lists.infradead.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, Hans de Goede <hdegoede@redhat.com>,
 Peter Robinson <pbrobinson@gmail.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, dri-devel@lists.freedesktop.org,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v2 2/2] drivers/firmware: consolidate EFI framebuffer setup
 for all arches
Date: Tue,  1 Jun 2021 17:00:17 +0200
Message-Id: <20210601150017.774363-1-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210601_080030_692129_8E679A96 
X-CRM114-Status: GOOD (  33.99  )
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

The register_gop_device() function registers an "efi-framebuffer" platform
device to match against the efifb driver, to have an early framebuffer for
EFI platforms.

But there is already support to do exactly the same by the Generic System
Framebuffers (sysfb) driver. This used to be only for X86 but it has been
moved to drivers/firmware and could be reused by other architectures.

Also, besides supporting registering an "efi-framebuffer", this driver can
register a "simple-framebuffer" allowing to use the siple{fb,drm} drivers
on non-X86 EFI platforms. For example, on aarch64 these drivers can only
be used with DT and doesn't have code to register a "simple-frambuffer"
platform device when booting with EFI.

For these reasons, let's remove the register_gop_device() duplicated code
and instead move the platform specific logic that's there to sysfb driver.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

Changes in v2:
- Use "depends on" for the supported architectures instead of selecting it.
- Improve commit message to explain the benefits of reusing sysfb for !X86.

 arch/arm/include/asm/efi.h        |  5 +-
 arch/arm64/include/asm/efi.h      |  5 +-
 arch/riscv/include/asm/efi.h      |  5 +-
 drivers/firmware/Kconfig          |  8 +--
 drivers/firmware/Makefile         |  2 +-
 drivers/firmware/efi/efi-init.c   | 90 -------------------------------
 drivers/firmware/efi/sysfb_efi.c  | 77 +++++++++++++++++++++++++-
 drivers/firmware/sysfb.c          | 40 +++++++++-----
 drivers/firmware/sysfb_simplefb.c | 29 ++++++----
 include/linux/sysfb.h             | 28 +++++-----
 10 files changed, 143 insertions(+), 146 deletions(-)

diff --git a/arch/arm/include/asm/efi.h b/arch/arm/include/asm/efi.h
index 9de7ab2ce05..a6f3b179e8a 100644
--- a/arch/arm/include/asm/efi.h
+++ b/arch/arm/include/asm/efi.h
@@ -17,6 +17,7 @@
 
 #ifdef CONFIG_EFI
 void efi_init(void);
+extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 
 int efi_create_mapping(struct mm_struct *mm, efi_memory_desc_t *md);
 int efi_set_mapping_permissions(struct mm_struct *mm, efi_memory_desc_t *md);
@@ -52,10 +53,6 @@ void efi_virtmap_unload(void);
 struct screen_info *alloc_screen_info(void);
 void free_screen_info(struct screen_info *si);
 
-static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
-{
-}
-
 /*
  * A reasonable upper bound for the uncompressed kernel size is 32 MBytes,
  * so we will reserve that amount of memory. We have no easy way to tell what
diff --git a/arch/arm64/include/asm/efi.h b/arch/arm64/include/asm/efi.h
index 1bed37eb013..d3e1825337b 100644
--- a/arch/arm64/include/asm/efi.h
+++ b/arch/arm64/include/asm/efi.h
@@ -14,6 +14,7 @@
 
 #ifdef CONFIG_EFI
 extern void efi_init(void);
+extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 #else
 #define efi_init()
 #endif
@@ -85,10 +86,6 @@ static inline void free_screen_info(struct screen_info *si)
 {
 }
 
-static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
-{
-}
-
 #define EFI_ALLOC_ALIGN		SZ_64K
 
 /*
diff --git a/arch/riscv/include/asm/efi.h b/arch/riscv/include/asm/efi.h
index 6d98cd99968..7a8f0d45b13 100644
--- a/arch/riscv/include/asm/efi.h
+++ b/arch/riscv/include/asm/efi.h
@@ -13,6 +13,7 @@
 
 #ifdef CONFIG_EFI
 extern void efi_init(void);
+extern void efifb_setup_from_dmi(struct screen_info *si, const char *opt);
 #else
 #define efi_init()
 #endif
@@ -39,10 +40,6 @@ static inline void free_screen_info(struct screen_info *si)
 {
 }
 
-static inline void efifb_setup_from_dmi(struct screen_info *si, const char *opt)
-{
-}
-
 void efi_virtmap_load(void);
 void efi_virtmap_unload(void);
 
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 4392fc57cf3..c704ac441fb 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -254,9 +254,9 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 config SYSFB
 	bool
 	default y
-	depends on X86 || COMPILE_TEST
+	depends on X86 || ARM || ARM64 || RISCV || COMPILE_TEST
 
-config X86_SYSFB
+config SYSFB_SIMPLEFB
 	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
 	depends on SYSFB
 	help
@@ -264,10 +264,10 @@ config X86_SYSFB
 	  bootloader or kernel can show basic video-output during boot for
 	  user-guidance and debugging. Historically, x86 used the VESA BIOS
 	  Extensions and EFI-framebuffers for this, which are mostly limited
-	  to x86.
+	  to x86 BIOS or EFI systems.
 	  This option, if enabled, marks VGA/VBE/EFI framebuffers as generic
 	  framebuffers so the new generic system-framebuffer drivers can be
-	  used on x86. If the framebuffer is not compatible with the generic
+	  used instead. If the framebuffer is not compatible with the generic
 	  modes, it is advertised as fallback platform framebuffer so legacy
 	  drivers like efifb, vesafb and uvesafb can pick it up.
 	  If this option is not selected, all system framebuffers are always
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 946dda07443..705fabe8815 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -19,7 +19,7 @@ obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
 obj-$(CONFIG_SYSFB)		+= sysfb.o
-obj-$(CONFIG_X86_SYSFB)		+= sysfb_simplefb.o
+obj-$(CONFIG_SYSFB_SIMPLEFB)	+= sysfb_simplefb.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/efi/efi-init.c b/drivers/firmware/efi/efi-init.c
index a552a08a174..b19ce1a83f9 100644
--- a/drivers/firmware/efi/efi-init.c
+++ b/drivers/firmware/efi/efi-init.c
@@ -275,93 +275,3 @@ void __init efi_init(void)
 	}
 #endif
 }
-
-static bool efifb_overlaps_pci_range(const struct of_pci_range *range)
-{
-	u64 fb_base = screen_info.lfb_base;
-
-	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
-		fb_base |= (u64)(unsigned long)screen_info.ext_lfb_base << 32;
-
-	return fb_base >= range->cpu_addr &&
-	       fb_base < (range->cpu_addr + range->size);
-}
-
-static struct device_node *find_pci_overlap_node(void)
-{
-	struct device_node *np;
-
-	for_each_node_by_type(np, "pci") {
-		struct of_pci_range_parser parser;
-		struct of_pci_range range;
-		int err;
-
-		err = of_pci_range_parser_init(&parser, np);
-		if (err) {
-			pr_warn("of_pci_range_parser_init() failed: %d\n", err);
-			continue;
-		}
-
-		for_each_of_pci_range(&parser, &range)
-			if (efifb_overlaps_pci_range(&range))
-				return np;
-	}
-	return NULL;
-}
-
-/*
- * If the efifb framebuffer is backed by a PCI graphics controller, we have
- * to ensure that this relation is expressed using a device link when
- * running in DT mode, or the probe order may be reversed, resulting in a
- * resource reservation conflict on the memory window that the efifb
- * framebuffer steals from the PCIe host bridge.
- */
-static int efifb_add_links(struct fwnode_handle *fwnode)
-{
-	struct device_node *sup_np;
-
-	sup_np = find_pci_overlap_node();
-
-	/*
-	 * If there's no PCI graphics controller backing the efifb, we are
-	 * done here.
-	 */
-	if (!sup_np)
-		return 0;
-
-	fwnode_link_add(fwnode, of_fwnode_handle(sup_np));
-	of_node_put(sup_np);
-
-	return 0;
-}
-
-static const struct fwnode_operations efifb_fwnode_ops = {
-	.add_links = efifb_add_links,
-};
-
-static struct fwnode_handle efifb_fwnode;
-
-static int __init register_gop_device(void)
-{
-	struct platform_device *pd;
-	int err;
-
-	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI)
-		return 0;
-
-	pd = platform_device_alloc("efi-framebuffer", 0);
-	if (!pd)
-		return -ENOMEM;
-
-	if (IS_ENABLED(CONFIG_PCI)) {
-		fwnode_init(&efifb_fwnode, &efifb_fwnode_ops);
-		pd->dev.fwnode = &efifb_fwnode;
-	}
-
-	err = platform_device_add_data(pd, &screen_info, sizeof(screen_info));
-	if (err)
-		return err;
-
-	return platform_device_add(pd);
-}
-subsys_initcall(register_gop_device);
diff --git a/drivers/firmware/efi/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
index 9f035b15501..2814af6baf1 100644
--- a/drivers/firmware/efi/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Generic System Framebuffers on x86
+ * Generic System Framebuffers
  * Copyright (c) 2012-2013 David Herrmann <dh.herrmann@gmail.com>
  *
  * EFI Quirks Copyright (c) 2006 Edgar Hucek <gimli@dark-green.com>
@@ -19,7 +19,9 @@
 #include <linux/init.h>
 #include <linux/kernel.h>
 #include <linux/mm.h>
+#include <linux/of_address.h>
 #include <linux/pci.h>
+#include <linux/platform_device.h>
 #include <linux/screen_info.h>
 #include <linux/sysfb.h>
 #include <video/vga.h>
@@ -267,7 +269,72 @@ static const struct dmi_system_id efifb_dmi_swap_width_height[] __initconst = {
 	{},
 };
 
-__init void sysfb_apply_efi_quirks(void)
+static bool efifb_overlaps_pci_range(const struct of_pci_range *range)
+{
+	u64 fb_base = screen_info.lfb_base;
+
+	if (screen_info.capabilities & VIDEO_CAPABILITY_64BIT_BASE)
+		fb_base |= (u64)(unsigned long)screen_info.ext_lfb_base << 32;
+
+	return fb_base >= range->cpu_addr &&
+	       fb_base < (range->cpu_addr + range->size);
+}
+
+static struct device_node *find_pci_overlap_node(void)
+{
+	struct device_node *np;
+
+	for_each_node_by_type(np, "pci") {
+		struct of_pci_range_parser parser;
+		struct of_pci_range range;
+		int err;
+
+		err = of_pci_range_parser_init(&parser, np);
+		if (err) {
+			pr_warn("of_pci_range_parser_init() failed: %d\n", err);
+			continue;
+		}
+
+		for_each_of_pci_range(&parser, &range)
+			if (efifb_overlaps_pci_range(&range))
+				return np;
+	}
+	return NULL;
+}
+
+/*
+ * If the efifb framebuffer is backed by a PCI graphics controller, we have
+ * to ensure that this relation is expressed using a device link when
+ * running in DT mode, or the probe order may be reversed, resulting in a
+ * resource reservation conflict on the memory window that the efifb
+ * framebuffer steals from the PCIe host bridge.
+ */
+static int efifb_add_links(struct fwnode_handle *fwnode)
+{
+	struct device_node *sup_np;
+
+	sup_np = find_pci_overlap_node();
+
+	/*
+	 * If there's no PCI graphics controller backing the efifb, we are
+	 * done here.
+	 */
+	if (!sup_np)
+		return 0;
+
+	fwnode_link_add(fwnode, of_fwnode_handle(sup_np));
+	of_node_put(sup_np);
+
+	return 0;
+}
+
+static const struct fwnode_operations efifb_fwnode_ops = {
+	.add_links = efifb_add_links,
+};
+
+static struct fwnode_handle efifb_fwnode;
+
+__init void sysfb_apply_efi_quirks(struct platform_device *pd)
 {
 	if (screen_info.orig_video_isVGA != VIDEO_TYPE_EFI ||
 	    !(screen_info.capabilities & VIDEO_CAPABILITY_SKIP_QUIRKS))
@@ -281,4 +348,10 @@ __init void sysfb_apply_efi_quirks(void)
 		screen_info.lfb_height = temp;
 		screen_info.lfb_linelength = 4 * screen_info.lfb_width;
 	}
+
+	if (screen_info.orig_video_isVGA == VIDEO_TYPE_EFI &&
+	    IS_ENABLED(CONFIG_PCI)) {
+		fwnode_init(&efifb_fwnode, &efifb_fwnode_ops);
+		pd->dev.fwnode = &efifb_fwnode;
+	}
 }
diff --git a/drivers/firmware/sysfb.c b/drivers/firmware/sysfb.c
index 1337515963d..3ecd60a0215 100644
--- a/drivers/firmware/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -1,11 +1,11 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Generic System Framebuffers on x86
+ * Generic System Framebuffers
  * Copyright (c) 2012-2013 David Herrmann <dh.herrmann@gmail.com>
  */
 
 /*
- * Simple-Framebuffer support for x86 systems
+ * Simple-Framebuffer support
  * Create a platform-device for any available boot framebuffer. The
  * simple-framebuffer platform device is already available on DT systems, so
  * this module parses the global "screen_info" object and creates a suitable
@@ -16,12 +16,12 @@
  * to pick these devices up without messing with simple-framebuffer drivers.
  * The global "screen_info" is still valid at all times.
  *
- * If CONFIG_X86_SYSFB is not selected, we never register "simple-framebuffer"
+ * If CONFIG_SYSFB_SIMPLEFB is not selected, never register "simple-framebuffer"
  * platform devices, but only use legacy framebuffer devices for
  * backwards compatibility.
  *
  * TODO: We set the dev_id field of all platform-devices to 0. This allows
- * other x86 OF/DT parsers to create such devices, too. However, they must
+ * other OF/DT parsers to create such devices, too. However, they must
  * start at offset 1 for this to work.
  */
 
@@ -39,31 +39,43 @@ static __init int sysfb_init(void)
 	struct screen_info *si = &screen_info;
 	struct simplefb_platform_data mode;
 	struct platform_device *pd;
-	const char *name;
 	bool compatible;
 	int ret;
 
-	sysfb_apply_efi_quirks();
+	pd = platform_device_alloc("", 0);
+	if (!pd)
+		return -ENOMEM;
+
+	sysfb_apply_efi_quirks(pd);
 
 	/* try to create a simple-framebuffer device */
-	compatible = parse_mode(si, &mode);
+	compatible = sysfb_parse_mode(si, &mode);
 	if (compatible) {
-		ret = create_simplefb(si, &mode);
+		ret = sysfb_create_simplefb(si, &mode, pd);
 		if (!ret)
 			return 0;
 	}
 
 	/* if the FB is incompatible, create a legacy framebuffer device */
 	if (si->orig_video_isVGA == VIDEO_TYPE_EFI)
-		name = "efi-framebuffer";
+		pd->name = "efi-framebuffer";
 	else if (si->orig_video_isVGA == VIDEO_TYPE_VLFB)
-		name = "vesa-framebuffer";
+		pd->name = "vesa-framebuffer";
 	else
-		name = "platform-framebuffer";
+		pd->name = "platform-framebuffer";
+
+	ret = platform_device_add_data(pd, si, sizeof(*si));
+	if (ret)
+		goto err;
+
+	ret = platform_device_add(pd);
+	if (ret)
+		goto err;
 
-	pd = platform_device_register_resndata(NULL, name, 0,
-					       NULL, 0, si, sizeof(*si));
-	return PTR_ERR_OR_ZERO(pd);
+	return 0;
+err:
+	platform_device_put(pd);
+	return ret;
 }
 
 /* must execute after PCI subsystem for EFI quirks */
diff --git a/drivers/firmware/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
index df892444ea1..cffff4283f3 100644
--- a/drivers/firmware/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0-or-later
 /*
- * Generic System Framebuffers on x86
+ * Generic System Framebuffers
  * Copyright (c) 2012-2013 David Herrmann <dh.herrmann@gmail.com>
  */
 
@@ -23,9 +23,9 @@
 static const char simplefb_resname[] = "BOOTFB";
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
 
-/* try parsing x86 screen_info into a simple-framebuffer mode struct */
-__init bool parse_mode(const struct screen_info *si,
-		       struct simplefb_platform_data *mode)
+/* try parsing screen_info into a simple-framebuffer mode struct */
+__init bool sysfb_parse_mode(const struct screen_info *si,
+			     struct simplefb_platform_data *mode)
 {
 	const struct simplefb_format *f;
 	__u8 type;
@@ -57,13 +57,14 @@ __init bool parse_mode(const struct screen_info *si,
 	return false;
 }
 
-__init int create_simplefb(const struct screen_info *si,
-			   const struct simplefb_platform_data *mode)
+__init int sysfb_create_simplefb(const struct screen_info *si,
+				 const struct simplefb_platform_data *mode,
+				 struct platform_device *pd)
 {
-	struct platform_device *pd;
 	struct resource res;
 	u64 base, size;
 	u32 length;
+	int ret;
 
 	/*
 	 * If the 64BIT_BASE capability is set, ext_lfb_base will contain the
@@ -105,7 +106,15 @@ __init int create_simplefb(const struct screen_info *si,
 	if (res.end <= res.start)
 		return -EINVAL;
 
-	pd = platform_device_register_resndata(NULL, "simple-framebuffer", 0,
-					       &res, 1, mode, sizeof(*mode));
-	return PTR_ERR_OR_ZERO(pd);
+	pd->name = "simple-framebuffer";
+
+	ret = platform_device_add_resources(pd, &res, 1);
+	if (ret)
+		return ret;
+
+	ret = platform_device_add_data(pd, mode, sizeof(*mode));
+	if (ret)
+		return ret;
+
+	return platform_device_add(pd);
 }
diff --git a/include/linux/sysfb.h b/include/linux/sysfb.h
index 3e5355769dc..d97162f4b97 100644
--- a/include/linux/sysfb.h
+++ b/include/linux/sysfb.h
@@ -58,37 +58,39 @@ struct efifb_dmi_info {
 #ifdef CONFIG_EFI
 
 extern struct efifb_dmi_info efifb_dmi_list[];
-void sysfb_apply_efi_quirks(void);
+void sysfb_apply_efi_quirks(struct platform_device *pd);
 
 #else /* CONFIG_EFI */
 
-static inline void sysfb_apply_efi_quirks(void)
+static inline void sysfb_apply_efi_quirks(struct platform_device *pd)
 {
 }
 
 #endif /* CONFIG_EFI */
 
-#ifdef CONFIG_X86_SYSFB
+#ifdef CONFIG_SYSFB_SIMPLEFB
 
-bool parse_mode(const struct screen_info *si,
-		struct simplefb_platform_data *mode);
-int create_simplefb(const struct screen_info *si,
-		    const struct simplefb_platform_data *mode);
+bool sysfb_parse_mode(const struct screen_info *si,
+		      struct simplefb_platform_data *mode);
+int sysfb_create_simplefb(const struct screen_info *si,
+			  const struct simplefb_platform_data *mode,
+			  struct platform_device *pd);
 
-#else /* CONFIG_X86_SYSFB */
+#else /* CONFIG_SYSFB_SIMPLE */
 
-static inline bool parse_mode(const struct screen_info *si,
-			      struct simplefb_platform_data *mode)
+static inline bool sysfb_parse_mode(const struct screen_info *si,
+				    struct simplefb_platform_data *mode)
 {
 	return false;
 }
 
-static inline int create_simplefb(const struct screen_info *si,
-				  const struct simplefb_platform_data *mode)
+static inline int sysfb_create_simplefb(const struct screen_info *si,
+					 const struct simplefb_platform_data *mode,
+					 struct platform_device *pd)
 {
 	return -EINVAL;
 }
 
-#endif /* CONFIG_X86_SYSFB */
+#endif /* CONFIG_SYSFB_SIMPLE */
 
 #endif /* _LINUX_SYSFB_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
