Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FBCEC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 21:47:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=09hqqYb1SqdSmOUroceTvHxgHOMqAzfzdHtQgy2dNLQ=; b=giplV/jc09pi8Y
	pd31YbftQ8gikpyBpmqLi6WIBnLN5obrybvssXIxHHiFyet4yleqq22SMBrT+9rMwiQXmJJusQjMZ
	XkM1L52Ty6qp303LQnFL1Gbj6LP78HobCyAkXmkPqdAV42A2+w9aTYk5fhR/326W+CLVS1WfrRrHj
	I19w5j8ZMcdYHHyTBd/rjiCaYudJwycDAFM/FP/QJtau0KsQcimiMAzq4FpHxzcCwdgWc8Wngwunj
	OEzR5w7/qHV52OfZAd86Fjz9OsfBOpGzRe7SOAcOe1R3/coa+0S1dfhAYdz4x5hrVw8q/KLSuklS/
	N0ozY41tibGjMKIQpt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6gU-001lzg-Ho; Thu, 14 Jul 2022 21:47:46 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6gJ-001ltw-2M; Thu, 14 Jul 2022 21:47:36 +0000
Received: by mail-pj1-x1029.google.com with SMTP id p9so3983673pjd.3;
        Thu, 14 Jul 2022 14:47:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QRpP4wv4SP78zMbJieYZRGjlucw4i6a87UghGmQ/Zos=;
        b=B2OLa4zOVsBODJNEuPedPpYhqAC6E5akFsMuJOI4gK0l9wevU4FY6lAXZWg/E490LO
         Qer2BTg8k06oidKAdl4bbK7PucbdS35jGoia38jJKnIGwwFYgpXO7/ZFvZbR4ryNyQW/
         nW/vAPt8VQiAdQyKFaAoUOZ/HS74nbJ76wRg3pw8rH29AABeOwusSRNBFryQ7AOY4C/N
         gewBhw7X9Xr8AIhjl/2RoyIAcbXcRO7ZDttBE3yFXuyqWgMFayDQhg1Y1DOcw+oycjIp
         TAiVxyXnveBLY5UGOx3bkH8f8+lUD2DdbxqIRZF+8SpW8z6zCccovk31eoytICbPyy+T
         UcVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QRpP4wv4SP78zMbJieYZRGjlucw4i6a87UghGmQ/Zos=;
        b=iDOGYfvveYqRO5xD3fDztC/S4mFPMzPeEJdgbq6oehVEq+MWsz7bHAOdbGpvzOYFLr
         A367T1y7uG3V32S4Zy8FzKfdNhxeIPlHvkVV0dFxPs2FsGwMUYmHjZfGtZJfwr+n64ts
         GtMegjUflGpPUbvtY9h2ViebRRDMd/n2BfkfeZ+kkDeKQDikHIbVLfND3+J/zSLdDEjF
         IoVcpm4SWt4iiY9ALG6j/ackBNRGtp5+gwdkor2dvsJKkKUHKOayThEob61gRZVHnZ7N
         buuUyy8uwstiB5ym7tIy8g1NA9Ian0jSmJLnrwTWdiNO54c5871ezqZbR99NdPA6b4qd
         ymoA==
X-Gm-Message-State: AJIora/mqqd2MbigmqmICo3/cdDCIuQivecwamKXtTuHgWQ99Ip0kYRW
	eVJsvjjGFOkfLneVzNAwhj1gFmcF+Et8Aw==
X-Google-Smtp-Source: AGRyM1s5uz3FfXCDO2h1CS+7jUumhKELLfh0Co4Djiwfjnrm57JlmZLBsOxTuueDSz+6xS1jeqEDhA==
X-Received: by 2002:a17:902:7807:b0:16b:e3d5:b2ce with SMTP id p7-20020a170902780700b0016be3d5b2cemr10039004pll.18.1657835254498;
        Thu, 14 Jul 2022 14:47:34 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id f15-20020aa7968f000000b00528c22fbb45sm2219737pfk.141.2022.07.14.14.47.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 14:47:34 -0700 (PDT)
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
Subject: [RFC PATCH 2/2] asm-generic: Add new pci.h and use it
Date: Fri, 15 Jul 2022 06:46:57 +0900
Message-Id: <20220714214657.2402250-3-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714214657.2402250-1-shorne@gmail.com>
References: <20220714214657.2402250-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_144735_131484_3FBEE7DC 
X-CRM114-Status: GOOD (  18.03  )
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

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/arm64/include/asm/pci.h | 18 ++--------------
 arch/csky/include/asm/pci.h  | 24 ++++------------------
 arch/riscv/include/asm/pci.h | 25 +++-------------------
 arch/um/include/asm/pci.h    | 24 ++--------------------
 include/asm-generic/pci.h    | 40 ++++++++++++++++++++++++++++++++++++
 5 files changed, 51 insertions(+), 80 deletions(-)
 create mode 100644 include/asm-generic/pci.h

diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
index b33ca260e3c9..016eb6b46dc0 100644
--- a/arch/arm64/include/asm/pci.h
+++ b/arch/arm64/include/asm/pci.h
@@ -9,7 +9,6 @@
 #include <asm/io.h>
 
 #define PCIBIOS_MIN_IO		0x1000
-#define PCIBIOS_MIN_MEM		0
 
 /*
  * Set to 1 if the kernel should re-assign all PCI bus numbers
@@ -18,21 +17,8 @@
 	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
 
 #define arch_can_pci_mmap_wc() 1
-#define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
 
-extern int isa_dma_bridge_buggy;
-
-#ifdef CONFIG_PCI
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	/* no legacy IRQ on arm64 */
-	return -ENODEV;
-}
-
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	return 1;
-}
-#endif  /* CONFIG_PCI */
+/* Generic PCI */
+#include <asm-generic/pci.h>
 
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
index 000000000000..1aa4d7a08aca
--- /dev/null
+++ b/include/asm-generic/pci.h
@@ -0,0 +1,40 @@
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
+#define PCIBIOS_MIN_MEM		0
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
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	/* no legacy ide irq support */
+	return -ENODEV;
+}
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
