Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D1BBC43334
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Jul 2022 13:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+l1Qh40a9gT9VWcsFAwafBe7tUtXdsMhNlTs35FIJiE=; b=iC65zNLfa8vqUc
	25SaIumZ4uJBJJnwAP0IfqES5kMMh8ABZss5kWi+9fqKGv4m39eXFVZNg03Dz1hnYOx3l4ex1A35y
	y7Ufh8Q8lV1bIuhEaSlaTVbSMCs+2puASfTlBRQPpKnrjO2EG3uR3a9pDL/sU9+uN4Sx2iBE4o+m6
	llzAziziZJBSF0aL19Qp1NwmttqxJ6r9IwgJhBNQ71CmxTB901c2mY1EM4yW3/5HxYuPP3jEzZLaS
	zpmBkVBjJBAuELiD4OkdlD8icDv2sEM8Szq7lxknedwt9l5K4By5ASR4Ttv5uuccbBrY8mpiwBDIj
	WVpz38Fh6Z+fTKrZIPZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWhP-007PFs-Tp; Thu, 21 Jul 2022 13:58:44 +0000
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oEWZK-007H4B-E5; Thu, 21 Jul 2022 13:50:24 +0000
Received: by mail-pf1-x42e.google.com with SMTP id g12so1824942pfb.3;
        Thu, 21 Jul 2022 06:50:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=O3NW8StoMQqfZ5lEvH9Li2usMzQWsOyWcla1sD26BZA=;
        b=l4Jy+1eGLeneEJth/E1CnZE/vsnjojIheWPBXvcrXjH+5BQBFbjvceMhq+o2pYAjKS
         MD+VaXcYRMyFQ16WfImVaSy1OSpSNO3QdZxATD45lmRC5q8WXWrh41xZ8lLcHXMHWme3
         yZGGX36QpZNxL+P2fz44ZKZwUW4ptPlS4+EEtkTNXZHcyig8/8wP8+sqiscc2BxaVrpH
         ONRfaiu/jl6jB+cubZ542DsdjnE0Ne5GvBSHEQE4CAZXbdeQ70BLcUMXF7xU87BnGei8
         x1dzKBuh/3S1IDjQOX2yebPuN3bRR5pO5c9YGGMKFT5ELeF+n2YXZ/a1UloYUeuOHSWi
         rIqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=O3NW8StoMQqfZ5lEvH9Li2usMzQWsOyWcla1sD26BZA=;
        b=6xhYRobvACCtLpW8K7V1y8xG6SUbb6PedIZbZl2JDLapwciS4aTsEqkagWyINERzjZ
         qwj2woo0fzp7RuUlngGOvL9kwZBuOCtwZgO1RN6mVUzvfb3bMzVBdKVQrf6ohrPG4qIK
         1PpxvIJujF9lXks8lUcV/CQ+vEv5IRnA9jfcWPYbCECoGtiw0QnU7nTNJeR6chsJ4FFO
         vLSflUFim16t25yda8oOP+iqA6cDTTku2AyUtkcdgTatrmkBlBW36sONrVEcPK2PlOL5
         DBQ/MTT7AdzNxr5QhBY39mEJVLGXyK+wf5ql01Eteu7bYT/VFpVgvZcYrMWS30XIkNYK
         hY3A==
X-Gm-Message-State: AJIora8pIyKRbGFbIGPbOcifZL7ziJjeuQey8sXLyus28fX5Ng8QpTC8
	waR2X+PlxV8wWZmMLw7T2Kk=
X-Google-Smtp-Source: AGRyM1vPMEeONk3v7CnRF6RKdDnbix8SCNiG1wqm5GnfxgVPELvgoMqTxIJK0nCWixsFG2HB0x6P+w==
X-Received: by 2002:a65:498b:0:b0:412:8e4:2842 with SMTP id r11-20020a65498b000000b0041208e42842mr38195607pgs.71.1658411420668;
        Thu, 21 Jul 2022 06:50:20 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id a142-20020a621a94000000b0052b433aa45asm1794762pfa.159.2022.07.21.06.50.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Jul 2022 06:50:20 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stafford Horne <shorne@gmail.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
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
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-csky@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-um@lists.infradead.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org
Subject: [PATCH v5 4/4] asm-generic: Add new pci.h and use it
Date: Thu, 21 Jul 2022 22:49:24 +0900
Message-Id: <20220721134924.596152-5-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220721134924.596152-1-shorne@gmail.com>
References: <20220721134924.596152-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220721_065022_575980_BC6EED08 
X-CRM114-Status: GOOD (  17.10  )
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

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
Acked-by: Pierre Morel <pmorel@linux.ibm.com>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
Since v4:
 - Add reviewed-by

 arch/arm64/include/asm/pci.h | 10 ++--------
 arch/csky/include/asm/pci.h  | 17 ++---------------
 arch/riscv/include/asm/pci.h | 23 ++++-------------------
 arch/um/include/asm/pci.h    | 14 ++------------
 include/asm-generic/pci.h    | 32 ++++++++++++++++++++++++++++++++
 5 files changed, 42 insertions(+), 54 deletions(-)
 create mode 100644 include/asm-generic/pci.h

diff --git a/arch/arm64/include/asm/pci.h b/arch/arm64/include/asm/pci.h
index 682c922b5658..016eb6b46dc0 100644
--- a/arch/arm64/include/asm/pci.h
+++ b/arch/arm64/include/asm/pci.h
@@ -9,7 +9,6 @@
 #include <asm/io.h>
 
 #define PCIBIOS_MIN_IO		0x1000
-#define PCIBIOS_MIN_MEM		0
 
 /*
  * Set to 1 if the kernel should re-assign all PCI bus numbers
@@ -18,13 +17,8 @@
 	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
 
 #define arch_can_pci_mmap_wc() 1
-#define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
 
-#ifdef CONFIG_PCI
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	return 1;
-}
-#endif  /* CONFIG_PCI */
+/* Generic PCI */
+#include <asm-generic/pci.h>
 
 #endif  /* __ASM_PCI_H */
diff --git a/arch/csky/include/asm/pci.h b/arch/csky/include/asm/pci.h
index 875bc028f8f6..42724c630d30 100644
--- a/arch/csky/include/asm/pci.h
+++ b/arch/csky/include/asm/pci.h
@@ -9,20 +9,7 @@
 
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
-
-/* C-SKY shim does not initialize PCI bus */
-#define pcibios_assign_all_busses() 1
-
-#define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
-
-#ifdef CONFIG_PCI
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	/* always show the domain in /proc */
-	return 1;
-}
-#endif  /* CONFIG_PCI */
+/* Generic PCI */
+#include <asm-generic/pci.h>
 
 #endif  /* __ASM_CSKY_PCI_H */
diff --git a/arch/riscv/include/asm/pci.h b/arch/riscv/include/asm/pci.h
index f904df586c03..6ef4a1426194 100644
--- a/arch/riscv/include/asm/pci.h
+++ b/arch/riscv/include/asm/pci.h
@@ -12,23 +12,7 @@
 
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
-
-/* RISC-V shim does not initialize PCI bus */
-#define pcibios_assign_all_busses() 1
-
-#define ARCH_GENERIC_PCI_MMAP_RESOURCE 1
-
-#ifdef CONFIG_PCI
-static inline int pci_proc_domain(struct pci_bus *bus)
-{
-	/* always show the domain in /proc */
-	return 1;
-}
-
-#ifdef	CONFIG_NUMA
-
+#if defined(CONFIG_PCI) && defined(CONFIG_NUMA)
 static inline int pcibus_to_node(struct pci_bus *bus)
 {
 	return dev_to_node(&bus->dev);
@@ -38,8 +22,9 @@ static inline int pcibus_to_node(struct pci_bus *bus)
 				 cpu_all_mask :				\
 				 cpumask_of_node(pcibus_to_node(bus)))
 #endif
-#endif	/* CONFIG_NUMA */
+#endif /* defined(CONFIG_PCI) && defined(CONFIG_NUMA) */
 
-#endif  /* CONFIG_PCI */
+/* Generic PCI */
+#include <asm-generic/pci.h>
 
 #endif  /* _ASM_RISCV_PCI_H */
diff --git a/arch/um/include/asm/pci.h b/arch/um/include/asm/pci.h
index 1211855aff34..34fe4921b5fa 100644
--- a/arch/um/include/asm/pci.h
+++ b/arch/um/include/asm/pci.h
@@ -4,18 +4,8 @@
 #include <linux/types.h>
 #include <asm/io.h>
 
-#define PCIBIOS_MIN_IO		0
-#define PCIBIOS_MIN_MEM		0
-
-#define pcibios_assign_all_busses() 1
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
index 000000000000..3ceb0cb12321
--- /dev/null
+++ b/include/asm-generic/pci.h
@@ -0,0 +1,32 @@
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
+/* Enable generic resource mapping code in drivers/pci/ */
+#define ARCH_GENERIC_PCI_MMAP_RESOURCE
+
+#ifdef CONFIG_PCI_DOMAINS
+static inline int pci_proc_domain(struct pci_bus *bus)
+{
+	/* always show the domain in /proc */
+	return 1;
+}
+#endif /* CONFIG_PCI_DOMAINS */
+
+#endif /* __ASM_GENERIC_PCI_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
