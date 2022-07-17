Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AEA7C43334
	for <linux-riscv@archiver.kernel.org>; Sun, 17 Jul 2022 03:35:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=InEY6GaCmu9nxIQO5I4NvsEFlbN1EMgFZLzifFgoq50=; b=s+nD4Q+Py1ukng
	erVI2DLeBbalIiUKFHk1UfDh+nTSshAvPzN/Q2EWyaIxTi7XP5mYrLVI4YMQ02PcEUg0wFrhF0Ds2
	FmXFhNeT/yMhblzN4jTFp+MeT655W41I6FDQsSySLadXIslutKWDhQ2Xeg+2CvFikNenut3QnR30I
	1rCtzSmXQno5M7vgvXWURyyJ3f5QIWv91y+rnBOGglQsfCvVdcZX2qRGPbKMbJb1xd2pKD/H7nySo
	LzWoK+XsXvzvR9ocFn8KpdKtFOC+IU8z4yQ7aPCwWO62Vr7pi5QDaqeQndcbapjN5dxIuX8+j2Upk
	mr4f8pVkBFxqsULNpNUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCv47-003ElL-BV; Sun, 17 Jul 2022 03:35:31 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCv3u-003EOy-Vi; Sun, 17 Jul 2022 03:35:20 +0000
Received: by mail-pf1-x431.google.com with SMTP id y141so7936204pfb.7;
        Sat, 16 Jul 2022 20:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Xv2PvDmoyOL9LB+6uvx+zPygvIwvBJhKrGc5MQCkb40=;
        b=ZWVQHPWoRcjOaDC1WJd99IHoPIdfuDS5WO0w6MPg3RfLuHAN49GW4jC9rGrvMm+XFv
         jifUaIssay+7+Wc66UNuSO4F2Q+tAtuPVxkKx+tIxrmRHDIdjSlEk9oqyJXpN7jW4xYo
         lhra752D95aaAQDco7zsWBQUJ0eGdbJpfsYrs7/wioQLCKUVEmwytfZAhy9x0jEiXsXO
         iy6hYeYPGwXXeQm3Yxi0jfA0yNX2B88vCUClPG648+QSoCX/SAebiBX3lCD9n+eNUIkm
         FFUW7z6jbXlYFMkaykePVPgnRMczSPDT4W85HCUGK8R/Ei4+BqRkg5l32zScIpZ1Aprp
         +bYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Xv2PvDmoyOL9LB+6uvx+zPygvIwvBJhKrGc5MQCkb40=;
        b=1aqiF8tlBECLVu03sPs60gSXr3FdMxPPx1LydwVFf5RmunxgYohGaxSjVt4pOK8R5W
         WxVUAm3GwJz+jUqgVPAwQlhG2ouDdeLQMp/J2swJEf6OVuVSAuQG/+TE9WHOWeK6704U
         ikmNDrl89b5erITaBjQVWc4nPQN13xkxszDX9CZ2oXamdcifqJWWbcvoBOU/8jgtpkp9
         sbrg2txa0AAic703c4gtvp4mkqvjikE0SRiYcQRgrQUIkOdYXqnP2j84xs38Wnhxs1fl
         gZW7IjMjdwZcwqKp6Fm299kMQCei3pGlXhlC7WArI5pgGvJVSylqcKDOiCD1OQ3X360N
         MH8w==
X-Gm-Message-State: AJIora+pxNtxMRMR434iURuRxAzgMcZmEr1HkXxGDhvWwSdFrpTnk6dV
	zn+Jn8BQnIJUBWx9BtgUrus=
X-Google-Smtp-Source: AGRyM1v2om8t0UM8MyVaid0Ngu+307Bu4Jr6afHyZaBkUkJHozBAsL+a+jvIFpzs5xOBn/jDmVm1FQ==
X-Received: by 2002:a63:210:0:b0:419:c604:2c2b with SMTP id 16-20020a630210000000b00419c6042c2bmr12673684pgc.190.1658028918439;
        Sat, 16 Jul 2022 20:35:18 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id x6-20020a170902ec8600b0016bedb7ed1esm6421111plg.116.2022.07.16.20.35.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:35:18 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stafford Horne <shorne@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Guo Ren <guoren@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Bjorn Helgaas <bhelgaas@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-um@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v2 2/2] asm-generic: Add new pci.h and use it
Date: Sun, 17 Jul 2022 12:34:53 +0900
Message-Id: <20220717033453.2896843-3-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220717033453.2896843-1-shorne@gmail.com>
References: <20220717033453.2896843-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_203519_040866_87BB1593 
X-CRM114-Status: GOOD (  18.88  )
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

The asm/pci.h used for many newer architectures share similar
definitions.  Move the common parts to asm-generic/pci.h to allow for
sharing code.

Two things to note are:

 - isa_dma_bridge_buggy, traditionally this is defined in asm/dma.h but
   these architectures avoid creating that file and add the definition
   to asm/pci.h.
 - ARCH_GENERIC_PCI_MMAP_RESOURCE, csky does not define this so we
   undefine it after including asm-generic/pci.h.  Why doesn't csky
   define it?
 - pci_get_legacy_ide_irq, This function is only used on architectures
   that support PNP.  It is only maintained for arm64, in other
   architectures it is removed.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/arm64/include/asm/pci.h | 12 +++---------
 arch/csky/include/asm/pci.h  | 24 ++++--------------------
 arch/riscv/include/asm/pci.h | 25 +++----------------------
 arch/um/include/asm/pci.h    | 24 ++----------------------
 include/asm-generic/pci.h    | 36 ++++++++++++++++++++++++++++++++++++
 5 files changed, 48 insertions(+), 73 deletions(-)
 create mode 100644 include/asm-generic/pci.h

diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
index b33ca260e3c9..1180e83712f5 100644
--- a/arch/arm64/include/asm/pci.h
+++ b/arch/arm64/include/asm/pci.h
@@ -9,7 +9,6 @@
 #include <asm/io.h>
 
 #define PCIBIOS_MIN_IO		0x1000
-#define PCIBIOS_MIN_MEM		0
 
 /*
  * Set to 1 if the kernel should re-assign all PCI bus numbers
@@ -18,9 +17,6 @@
 	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
 
 #define arch_can_pci_mmap_wc() 1
-#define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
-
-extern int isa_dma_bridge_buggy;
 
 #ifdef CONFIG_PCI
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
@@ -28,11 +24,9 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 	/* no legacy IRQ on arm64 */
 	return -ENODEV;
 }
-
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	return 1;
-}
 #endif  /* CONFIG_PCI */
 
+/* Generic PCI */
+#include <asm-generic/pci.h>
+
 #endif  /* __ASM_PCI_H */
diff --git a/arch/csky/include/asm/pci.h b/arch/csky/include/asm/pci.h
index ebc765b1f78b..44866c1ad461 100644
--- a/arch/csky/include/asm/pci.h
+++ b/arch/csky/include/asm/pci.h
@@ -9,26 +9,10 @@
 
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
+/* Generic PCI */
+#include <asm-generic/pci.h>
 
-/* C-SKY shim does not initialize PCI bus */
-#define pcibios_assign_all_busses() 1
-
-extern int isa_dma_bridge_buggy;
-
-#ifdef CONFIG_PCI
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	/* no legacy IRQ on csky */
-	return -ENODEV;
-}
-
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	/* always show the domain in /proc */
-	return 1;
-}
-#endif  /* CONFIG_PCI */
+/* csky doesn't use generic pci resource mapping */
+#undef ARCH_GENERIC_PCI_MMAP_RESOURCE
 
 #endif  /* __ASM_CSKY_PCI_H */
diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index 7fd52a30e605..12ce8150cfb0 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -12,29 +12,7 @@
 
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
-
-/* RISC-V shim does not initialize PCI bus */
-#define pcibios_assign_all_busses() 1
-
-#define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
-
-extern int isa_dma_bridge_buggy;
-
 #ifdef CONFIG_PCI
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	/* no legacy IRQ on risc-v */
-	return -ENODEV;
-}
-
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	/* always show the domain in /proc */
-	return 1;
-}
-
 #ifdef	CONFIG_NUMA
 
 static inline int pcibus_to_node(struct pci_bus *bus)
@@ -50,4 +28,7 @@ static inline int pcibus_to_node(struct pci_bus *bus)
 
 #endif  /* CONFIG_PCI */
 
+/* Generic PCI */
+#include <asm-generic/pci.h>
+
 #endif  /* _ASM_RISCV_PCI_H */
diff --git a/arch/um/include/asm/pci.h b/arch/um/include/asm/pci.h
index da13fd5519ef..34fe4921b5fa 100644
--- a/arch/um/include/asm/pci.h
+++ b/arch/um/include/asm/pci.h
@@ -4,28 +4,8 @@
 #include <linux/types.h>
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
-
-#define pcibios_assign_all_busses() 1
-
-extern int isa_dma_bridge_buggy;
-
-#ifdef CONFIG_PCI
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	/* no legacy IRQs */
-	return -ENODEV;
-}
-#endif
-
-#ifdef CONFIG_PCI_DOMAINS
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	/* always show the domain in /proc */
-	return 1;
-}
-#endif  /* CONFIG_PCI */
+/* Generic PCI */
+#include <asm-generic/pci.h>
 
 #ifdef CONFIG_PCI_MSI_IRQ_DOMAIN
 /*
diff --git a/include/asm-generic/pci.h b/include/asm-generic/pci.h
new file mode 100644
index 000000000000..fbc25741696a
--- /dev/null
+++ b/include/asm-generic/pci.h
@@ -0,0 +1,36 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_PCI_H
+#define __ASM_GENERIC_PCI_H
+
+#include <linux/types.h>
+
+#ifndef PCIBIOS_MIN_IO
+#define PCIBIOS_MIN_IO		0
+#endif
+
+#ifndef PCIBIOS_MIN_MEM
+#define PCIBIOS_MIN_MEM		0
+#endif
+
+#ifndef pcibios_assign_all_busses
+/* For bootloaders that do not initialize the PCI bus */
+#define pcibios_assign_all_busses() 1
+#endif
+
+extern int isa_dma_bridge_buggy;
+
+/* Enable generic resource mapping code in drivers/pci/ */
+#define ARCH_GENERIC_PCI_MMAP_RESOURCE
+
+#ifdef CONFIG_PCI
+
+static inline int pci_proc_domain(struct pci_bus *bus)
+{
+	/* always show the domain in /proc */
+	return 1;
+}
+
+#endif /* CONFIG_PCI */
+
+#endif /* __ASM_GENERIC_PCI_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
