Return-Path: <SRS0=TyRV=LT=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 287FAC49EA7
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:10:44 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E03E561949
	for <linux-riscv@archiver.kernel.org>; Fri, 25 Jun 2021 13:10:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E03E561949
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=redhat.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gs/p2yqJ36+BJJocjGeqqCI8SnFyBxEgsuAOvgjHpck=; b=gskH7fGYpkG5RM
	peuDjX02A8z4j8SXElEMRrvemNj9bkzRudbXMRoUHRxA5lXb7TrPS3OiOlzo1ZMocGjnVri5jFAd7
	7GdFHcf5k9Luc2lg5NNFW4tRCRKtFQWs2oBgc7i8wtRm4bqtP9XjI01rMerQGd7HIR6JtCRpfHUB5
	ChISGYkjmiNQERKtDinhviDm4X9wAYMgppSjbSiFdO7CM243LoAwZ9ibcXXM1nixQRYhbvr1DN1KS
	uggVPI1QHWTg4yi+E8eTzN25G//iXURwM1YQzQ8MfEALKWbsdSrZ+g5G+vDCE33fDeEjgaQYCSs4O
	s/uOquSfy7lWJbsL29Iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1lwlbG-001bPH-4b; Fri, 25 Jun 2021 13:10:26 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1lwlax-001bIl-Ao
 for linux-riscv@lists.infradead.org; Fri, 25 Jun 2021 13:10:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1624626605;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=PNAp2KzVwp2HJpAICzqzoywufhnCYAR1xRg0ncSjjzQ=;
 b=NDT758n3cxYs1wKnJ78hFtF9dav0NAAGubxVmEWGYY58u6MfMjqdOGhqkTMwxt+6MkCqVh
 U5c1dLQt+M52sRO05Rjv0KveQcoXysSJakHl0kgT3i6IUn80hWhbCS8053taGg95QevPla
 JXoDZTEqTYXqjDQyaq9I162VCcUCz1g=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-512-mm9a3oS6Pr-deqb7eq4fbA-1; Fri, 25 Jun 2021 09:10:04 -0400
X-MC-Unique: mm9a3oS6Pr-deqb7eq4fbA-1
Received: by mail-wm1-f72.google.com with SMTP id
 j2-20020a05600c1c02b02901cecbe55d49so792194wms.3
 for <linux-riscv@lists.infradead.org>; Fri, 25 Jun 2021 06:10:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PNAp2KzVwp2HJpAICzqzoywufhnCYAR1xRg0ncSjjzQ=;
 b=h8yrFJfEZ8E0prL9qY9NC3Q37jxufjRVb6QmKOMpeTaDV/xlRc4Os4CjuzYnEHL0lu
 IZMMQFK4xzYVM6mS9Fn2KyP3vux1u+/rU12/6XuDGtk8J/5XUyBckdKbFPFS6m8gvoWy
 Tpzp7geRFfCBR+TBV8ZCryunv0X5u1kpk8s/Ur57fKMK0Wn/FL/twZFxbMZu/Skk2S65
 fnAGpsEb3DIiHhVTX05IIYT5YiztDElVuvfOeqalAdZCXBzCV8cSgH1h0FMREMLCAeK0
 iYORUGE3CJVRJCJaAz9nXXurBEbO4FfVsnAZrvcqKhLDGkPy6UoZaCHWA5bBdVY1dC25
 B+Dw==
X-Gm-Message-State: AOAM532xb1AoNerPJ3PsKGOj1BAgGjAQLbUzVsmGJ6z0ugZQPEDgLS6T
 umikwxeYhlNbNW/Umjeq/4b95r6oLftgzon35E4sAK517rJwzkgo/g5JT93KOHkGJbUo676J3Mr
 uaRbW/8Se3aLTppXTE3evPQBi1eqp
X-Received: by 2002:adf:de87:: with SMTP id w7mr10991058wrl.333.1624626600816; 
 Fri, 25 Jun 2021 06:10:00 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9JlLTp3gkSgmXVuuBEZlbTpm3s98JJq7htgnfMTMY1BcxRHZ+aAzUeYOQaLnz1g/268OaWQ==
X-Received: by 2002:adf:de87:: with SMTP id w7mr10990996wrl.333.1624626600479; 
 Fri, 25 Jun 2021 06:10:00 -0700 (PDT)
Received: from minerva.redhat.com ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id x7sm5995864wre.8.2021.06.25.06.09.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Jun 2021 06:10:00 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: Thomas Zimmermann <tzimmermann@suse.de>,
 Palmer Dabbelt <palmer@dabbelt.com>, Russell King <linux@armlinux.org.uk>,
 linux-efi@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
 Hans de Goede <hdegoede@redhat.com>, x86@kernel.org,
 Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
 Paul Walmsley <paul.walmsley@sifive.com>, linux-riscv@lists.infradead.org,
 Borislav Petkov <bp@suse.de>, Albert Ou <aou@eecs.berkeley.edu>,
 Peter Robinson <pbrobinson@gmail.com>, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, David Airlie <airlied@linux.ie>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Daniel Vetter <daniel@ffwll.ch>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Atish Patra <atish.patra@wdc.com>,
 Javier Martinez Canillas <javierm@redhat.com>
Subject: [PATCH v3 1/2] drivers/firmware: move x86 Generic System Framebuffers
 support
Date: Fri, 25 Jun 2021 15:09:46 +0200
Message-Id: <20210625130947.1803678-2-javierm@redhat.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210625130947.1803678-1-javierm@redhat.com>
References: <20210625130947.1803678-1-javierm@redhat.com>
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210625_061007_545982_7097764C 
X-CRM114-Status: GOOD (  24.78  )
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

The x86 architecture has generic support to register a system framebuffer
platform device. It either registers a "simple-framebuffer" if the config
option CONFIG_X86_SYSFB is enabled, or a legacy VGA/VBE/EFI FB device.

But the code is generic enough to be reused by other architectures and can
be moved out of the arch/x86 directory.

This will allow to also support the simple{fb,drm} drivers on non-x86 EFI
platforms, such as aarch64 where these drivers are only supported with DT.

Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
Acked-by: Borislav Petkov <bp@suse.de>
Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---

Changes in v3:
- Add Borislav and Greg Acked-by tags.

Changes in v2:
- Use default y and depends on X86 instead doing a select in arch/x86/Kconfig.
- Also enable the SYSFB Kconfig option when COMPILE_TEST.
- Improve commit message to explain why is useful for other arches to use this.

 arch/x86/Kconfig                              | 26 ---------------
 arch/x86/kernel/Makefile                      |  3 --
 drivers/firmware/Kconfig                      | 32 +++++++++++++++++++
 drivers/firmware/Makefile                     |  2 ++
 drivers/firmware/efi/Makefile                 |  2 ++
 .../firmware/efi}/sysfb_efi.c                 |  2 +-
 {arch/x86/kernel => drivers/firmware}/sysfb.c |  2 +-
 .../firmware}/sysfb_simplefb.c                |  2 +-
 .../x86/include/asm => include/linux}/sysfb.h |  6 ++--
 9 files changed, 42 insertions(+), 35 deletions(-)
 rename {arch/x86/kernel => drivers/firmware/efi}/sysfb_efi.c (99%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb.c (98%)
 rename {arch/x86/kernel => drivers/firmware}/sysfb_simplefb.c (99%)
 rename {arch/x86/include/asm => include/linux}/sysfb.h (95%)

diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 0ae3eccfec52..f169a30db768 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -2766,32 +2766,6 @@ config AMD_NB
 	def_bool y
 	depends on CPU_SUP_AMD && PCI
 
-config X86_SYSFB
-	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
-	help
-	  Firmwares often provide initial graphics framebuffers so the BIOS,
-	  bootloader or kernel can show basic video-output during boot for
-	  user-guidance and debugging. Historically, x86 used the VESA BIOS
-	  Extensions and EFI-framebuffers for this, which are mostly limited
-	  to x86.
-	  This option, if enabled, marks VGA/VBE/EFI framebuffers as generic
-	  framebuffers so the new generic system-framebuffer drivers can be
-	  used on x86. If the framebuffer is not compatible with the generic
-	  modes, it is advertised as fallback platform framebuffer so legacy
-	  drivers like efifb, vesafb and uvesafb can pick it up.
-	  If this option is not selected, all system framebuffers are always
-	  marked as fallback platform framebuffers as usual.
-
-	  Note: Legacy fbdev drivers, including vesafb, efifb, uvesafb, will
-	  not be able to pick up generic system framebuffers if this option
-	  is selected. You are highly encouraged to enable simplefb as
-	  replacement if you select this option. simplefb can correctly deal
-	  with generic system framebuffers. But you should still keep vesafb
-	  and others enabled as fallback if a system framebuffer is
-	  incompatible with simplefb.
-
-	  If unsure, say Y.
-
 endmenu
 
 
diff --git a/arch/x86/kernel/Makefile b/arch/x86/kernel/Makefile
index 0f66682ac02a..4114ea47def2 100644
--- a/arch/x86/kernel/Makefile
+++ b/arch/x86/kernel/Makefile
@@ -135,9 +135,6 @@ obj-$(CONFIG_X86_CHECK_BIOS_CORRUPTION) += check.o
 obj-$(CONFIG_SWIOTLB)			+= pci-swiotlb.o
 obj-$(CONFIG_OF)			+= devicetree.o
 obj-$(CONFIG_UPROBES)			+= uprobes.o
-obj-y					+= sysfb.o
-obj-$(CONFIG_X86_SYSFB)			+= sysfb_simplefb.o
-obj-$(CONFIG_EFI)			+= sysfb_efi.o
 
 obj-$(CONFIG_PERF_EVENTS)		+= perf_regs.o
 obj-$(CONFIG_TRACING)			+= tracepoint.o
diff --git a/drivers/firmware/Kconfig b/drivers/firmware/Kconfig
index 1db738d5b301..5991071e9d7f 100644
--- a/drivers/firmware/Kconfig
+++ b/drivers/firmware/Kconfig
@@ -251,6 +251,38 @@ config QCOM_SCM_DOWNLOAD_MODE_DEFAULT
 
 	  Say Y here to enable "download mode" by default.
 
+config SYSFB
+	bool
+	default y
+	depends on X86 || COMPILE_TEST
+
+config X86_SYSFB
+	bool "Mark VGA/VBE/EFI FB as generic system framebuffer"
+	depends on SYSFB
+	help
+	  Firmwares often provide initial graphics framebuffers so the BIOS,
+	  bootloader or kernel can show basic video-output during boot for
+	  user-guidance and debugging. Historically, x86 used the VESA BIOS
+	  Extensions and EFI-framebuffers for this, which are mostly limited
+	  to x86.
+	  This option, if enabled, marks VGA/VBE/EFI framebuffers as generic
+	  framebuffers so the new generic system-framebuffer drivers can be
+	  used on x86. If the framebuffer is not compatible with the generic
+	  modes, it is advertised as fallback platform framebuffer so legacy
+	  drivers like efifb, vesafb and uvesafb can pick it up.
+	  If this option is not selected, all system framebuffers are always
+	  marked as fallback platform framebuffers as usual.
+
+	  Note: Legacy fbdev drivers, including vesafb, efifb, uvesafb, will
+	  not be able to pick up generic system framebuffers if this option
+	  is selected. You are highly encouraged to enable simplefb as
+	  replacement if you select this option. simplefb can correctly deal
+	  with generic system framebuffers. But you should still keep vesafb
+	  and others enabled as fallback if a system framebuffer is
+	  incompatible with simplefb.
+
+	  If unsure, say Y.
+
 config TI_SCI_PROTOCOL
 	tristate "TI System Control Interface (TISCI) Message Protocol"
 	depends on TI_MESSAGE_MANAGER
diff --git a/drivers/firmware/Makefile b/drivers/firmware/Makefile
index 546ac8e7f6d0..946dda07443d 100644
--- a/drivers/firmware/Makefile
+++ b/drivers/firmware/Makefile
@@ -18,6 +18,8 @@ obj-$(CONFIG_FIRMWARE_MEMMAP)	+= memmap.o
 obj-$(CONFIG_RASPBERRYPI_FIRMWARE) += raspberrypi.o
 obj-$(CONFIG_FW_CFG_SYSFS)	+= qemu_fw_cfg.o
 obj-$(CONFIG_QCOM_SCM)		+= qcom_scm.o qcom_scm-smc.o qcom_scm-legacy.o
+obj-$(CONFIG_SYSFB)		+= sysfb.o
+obj-$(CONFIG_X86_SYSFB)		+= sysfb_simplefb.o
 obj-$(CONFIG_TI_SCI_PROTOCOL)	+= ti_sci.o
 obj-$(CONFIG_TRUSTED_FOUNDATIONS) += trusted_foundations.o
 obj-$(CONFIG_TURRIS_MOX_RWTM)	+= turris-mox-rwtm.o
diff --git a/drivers/firmware/efi/Makefile b/drivers/firmware/efi/Makefile
index 467e94259679..c02ff25dd477 100644
--- a/drivers/firmware/efi/Makefile
+++ b/drivers/firmware/efi/Makefile
@@ -36,6 +36,8 @@ obj-$(CONFIG_LOAD_UEFI_KEYS)		+= mokvar-table.o
 fake_map-y				+= fake_mem.o
 fake_map-$(CONFIG_X86)			+= x86_fake_mem.o
 
+obj-$(CONFIG_SYSFB)			+= sysfb_efi.o
+
 arm-obj-$(CONFIG_EFI)			:= efi-init.o arm-runtime.o
 obj-$(CONFIG_ARM)			+= $(arm-obj-y)
 obj-$(CONFIG_ARM64)			+= $(arm-obj-y)
diff --git a/arch/x86/kernel/sysfb_efi.c b/drivers/firmware/efi/sysfb_efi.c
similarity index 99%
rename from arch/x86/kernel/sysfb_efi.c
rename to drivers/firmware/efi/sysfb_efi.c
index 8a56a6d80098..9f035b15501c 100644
--- a/arch/x86/kernel/sysfb_efi.c
+++ b/drivers/firmware/efi/sysfb_efi.c
@@ -21,10 +21,10 @@
 #include <linux/mm.h>
 #include <linux/pci.h>
 #include <linux/screen_info.h>
+#include <linux/sysfb.h>
 #include <video/vga.h>
 
 #include <asm/efi.h>
-#include <asm/sysfb.h>
 
 enum {
 	OVERRIDE_NONE = 0x0,
diff --git a/arch/x86/kernel/sysfb.c b/drivers/firmware/sysfb.c
similarity index 98%
rename from arch/x86/kernel/sysfb.c
rename to drivers/firmware/sysfb.c
index 014ebd8ca869..1337515963d5 100644
--- a/arch/x86/kernel/sysfb.c
+++ b/drivers/firmware/sysfb.c
@@ -32,7 +32,7 @@
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
-#include <asm/sysfb.h>
+#include <linux/sysfb.h>
 
 static __init int sysfb_init(void)
 {
diff --git a/arch/x86/kernel/sysfb_simplefb.c b/drivers/firmware/sysfb_simplefb.c
similarity index 99%
rename from arch/x86/kernel/sysfb_simplefb.c
rename to drivers/firmware/sysfb_simplefb.c
index 298fc1edd9c9..df892444ea17 100644
--- a/arch/x86/kernel/sysfb_simplefb.c
+++ b/drivers/firmware/sysfb_simplefb.c
@@ -18,7 +18,7 @@
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/screen_info.h>
-#include <asm/sysfb.h>
+#include <linux/sysfb.h>
 
 static const char simplefb_resname[] = "BOOTFB";
 static const struct simplefb_format formats[] = SIMPLEFB_FORMATS;
diff --git a/arch/x86/include/asm/sysfb.h b/include/linux/sysfb.h
similarity index 95%
rename from arch/x86/include/asm/sysfb.h
rename to include/linux/sysfb.h
index 9834eef7f034..3e5355769dc3 100644
--- a/arch/x86/include/asm/sysfb.h
+++ b/include/linux/sysfb.h
@@ -1,6 +1,6 @@
 /* SPDX-License-Identifier: GPL-2.0-or-later */
-#ifndef _ARCH_X86_KERNEL_SYSFB_H
-#define _ARCH_X86_KERNEL_SYSFB_H
+#ifndef _LINUX_SYSFB_H
+#define _LINUX_SYSFB_H
 
 /*
  * Generic System Framebuffers on x86
@@ -91,4 +91,4 @@ static inline int create_simplefb(const struct screen_info *si,
 
 #endif /* CONFIG_X86_SYSFB */
 
-#endif /* _ARCH_X86_KERNEL_SYSFB_H */
+#endif /* _LINUX_SYSFB_H */
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
