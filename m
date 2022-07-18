Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3282C43334
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jul 2022 00:42:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=vjb7L4xI2XojfHBoe7Xc6mtd7rtLk7HBhNcAbq9kU6o=; b=AyyyOktbWE3N6B
	eXu3x5MIeqS6/6kwjubDnK6klE9+6qv5O9GQHNsXiAGgj2/gcFSXoviTF4mXTJWHU7vKCckDxRFMU
	TBzdUSWu/EXsHeoC8W8jQGZe7g2tiHB2mkRAN/Ug5vPKYWeVnF2BND0nnHb58w3hZD3cdFi+jQ9Bu
	ouodb0vMnI15acX5cmuQa/mgqBMbor8ZQvN67YrmbZC4rVLk+1S2l99qOFCIISO/dBjma5oYJIXaI
	gH0oDMjCCFdEwnLL9wsubbSpMxCY7QAYh1aFJR2x9M8rLnSX9mgvOMx2BmaxSO6ZmmJVtERYOHYI7
	sdt/mJs5pu9ZgVNw0cTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDEpc-009Zwx-DI; Mon, 18 Jul 2022 00:41:52 +0000
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oDEpR-009Zsa-5F; Mon, 18 Jul 2022 00:41:42 +0000
Received: by mail-pj1-x1035.google.com with SMTP id p9so10316437pjd.3;
        Sun, 17 Jul 2022 17:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=3/j8pkL4GhZFNzH7umuUIdRtKiBGR7GCptRdPC+dKyo=;
        b=mxxOvkVdOgvJZHtszW+vBywxcbxqCt8yBEVBIXyw0Sb5IHo41kP2y4mbEM6iuIky7e
         99o5F1aRk2K46vS050Y9HMgECRAR7E5fjenJW0os/DNAkxSHbQ1JXQ+oEOeARl5/Gh47
         B8KET01bHEOWGJTEfhz8+gBRDl0BIK/UxLhIrPc8BX4313l2khy/XPM7gL6ZDKjXxFCH
         JXiGTJPKZuuL5Y/VZo+ImX98I6yYXxX2z2al7FMbRFePiNlzXb5cpdFbT5VvImcPQXBh
         icWcCGnPmSev3VrXJdL8r2gDyS2Z+iIBAPlzOhYAHyhyMZO+9gRkIkiT0QyZvi5mp0jY
         BGmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=3/j8pkL4GhZFNzH7umuUIdRtKiBGR7GCptRdPC+dKyo=;
        b=XvWg0HPTd0Td9yyqqlW+dk2Y5+c2XS8BaFo4V+nQCOySVhfNzsW3r/fl/8SkZZzNzz
         psfeXHsYmRAHep5EVr80/gNIKmoBl4dZHMcrm53w5LBbjNyebPo9gSjqkgKzNBTDQxto
         Dt6cuUwKtIQYqmBRYYSs0tCRes5l2wNIT5Gydj2vl138v2RYDynoYjGpWQ0FxIwCNiQZ
         x/MmDQMo2rNzuxAm2UBe8LP8gZCjeM2+yW/8i0XAzM3rjF8WeHarSB1bz3o/C3cetEih
         a/n4/YQ5zTqQHQol7J56tSyhmyGJN19+Psh71ZhAJ62z7SA2Ta3W67zOQbxB2GFLdi4n
         C1fA==
X-Gm-Message-State: AJIora+w0XgY6FfHgST6kJLSshyJtLs9d+B03gneGR7VZxj7by4pOyAj
	y0VapGvfs0pEYvYGIkx2wTI=
X-Google-Smtp-Source: AGRyM1vCAUUHTWRBklXTSrWrJjydvmb9dcRO36hitYo0pHJBlzKJ2UIFHkGtyl/dT4bicXDMWpKT3g==
X-Received: by 2002:a17:90b:1004:b0:1ef:9f33:2df4 with SMTP id gm4-20020a17090b100400b001ef9f332df4mr35956491pjb.31.1658104900584;
        Sun, 17 Jul 2022 17:41:40 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id ij8-20020a170902ab4800b0016c066e566bsm7822396plb.164.2022.07.17.17.41.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 Jul 2022 17:41:40 -0700 (PDT)
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
Subject: [PATCH v3 2/2] asm-generic: Add new pci.h and use it
Date: Mon, 18 Jul 2022 09:41:14 +0900
Message-Id: <20220718004114.3925745-3-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220718004114.3925745-1-shorne@gmail.com>
References: <20220718004114.3925745-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220717_174141_229494_4B97DF8F 
X-CRM114-Status: GOOD (  22.53  )
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
Second note on isa_dma_bridge_buggy, this is set on x86 but it it also set in
pci/quirks.c.  We discussed limiting it only to x86 though as its a general
quick triggered by pci ids I think it will be more tricky than we thought so I
will leave as is.  It might be nice to move it out of asm/dma.h and into
asm/pci.h though.

Since v2:
 - Nothing
Since v1:
 - Remove definition of pci_get_legacy_ide_irq

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
