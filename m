Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7AE91C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 22 Jul 2022 21:51:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tAFRV5Wtf5fQmajukwB4z+WJ6SxWd9+/qmneS4k8gCg=; b=uINFjvzxNMuMWH
	P1phO1ICxJbg/QqxcGP7IUeSI5WfxsFOgXHyVPb1nbpSgmLkGrusrqVpeNiOMVGl3Y/AHW2FprcXo
	7sIVAbjmKKxlPUqtnHeefbosAvClYEqfun/bdr9Wsm5UNQPh7foQelcY12bcIwu00dmSORVah63Ua
	33Uotq56LxNW5nD7MJLATMMaUw+Qr8a5af9cM/bsggKpF3AcVmIvH80TqV3Vl0oPicnEP8sOwNbdF
	2LJhWg5TbejGUbsjD5U6d0uqr9NagbMGXg2EB0mnlYV9fOmesw09mkvt1AAlq35BRiW2uiDtZYtP4
	lzrPDpscgI2XHZvcexwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Yh-00Bff6-FM; Fri, 22 Jul 2022 21:51:43 +0000
Received: from mail-pj1-x1032.google.com ([2607:f8b0:4864:20::1032])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oF0Xk-00BevB-5s; Fri, 22 Jul 2022 21:50:45 +0000
Received: by mail-pj1-x1032.google.com with SMTP id n10-20020a17090a670a00b001f22ebae50aso5274103pjj.3;
        Fri, 22 Jul 2022 14:50:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=opf4EMRMh4I0YmxiAyi1MscDFCrIPkcNmv8YQAkh2ao=;
        b=fELg5U1xtAOHG3uTLq0PRWRiu1yi7aDmCgircsSneYfwOpEHhb/XVMEnVivrTjJnmk
         zROQHtUPvgYPOUZSJJaB9DzGrDtWJ5iaTIS8NzbHfnB11LZ+ZNnWChsHf5J7AF46+U3o
         yJOGUzBRXJ9ww5b/EqwLrMTy85qqGsDMCBj1ePLZKn2iP3G+Zlphi/ugl5Lefk0hY4Wm
         OKJZxRwGlzLrA+8a/MM1TKb45H9boOLxiNczzrw/1Mxb6debAP9pNvoUEEtANu/0eTrh
         h6XM3K2UiM3ORSvgddpOqnL98vn6UNVUUYirZlP6fzlkQGseYWZ9OomXFU2n3WIuMUcq
         zs7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=opf4EMRMh4I0YmxiAyi1MscDFCrIPkcNmv8YQAkh2ao=;
        b=woMvw1DOXsv8gjrLQ2KuqrwXR88jvGU7yVrrVX4/EWcr41wPuvQJLww/SC5JqgAir6
         IjZsCx77KeB+WGsewc2rCejGyEqKUIUkFHGNgUb1eSjZqo10GIOuIZT7Ur2sriDBKcBj
         uod2kEzAQpO8KpGFir3LgoV0ZFXhFh/rtuqnY9FpOaNUkCYZQKRXBqslcWdmJVMwIZxc
         Jta1ypk/Jjmz4fyy7eHlIzOi0eX0LVJYgEXbCldzTF1zA4o5JPcmkTCmFAwjAMp57A9d
         whX5C2wMatJv2/xqwqJfgolkGXpS2Xr1DZnHUVxTF94qGHeKgTksYD+Y3pdcmLWOE+lr
         98Pg==
X-Gm-Message-State: AJIora/aSH64akzJuNL8n6qPUfv8nyCorv+t2uohI49TcznlkdH3MRll
	4qtT1haBm+qnlBuBMZE5mNY=
X-Google-Smtp-Source: AGRyM1tdkXaOC3fGkZTHqh9ZtEr1gPMB8LC64i4HKBbSQRtmAiOGR82kxFOKaLrbA/orJU7uH4KPZg==
X-Received: by 2002:a17:902:f80e:b0:16d:4e52:5290 with SMTP id ix14-20020a170902f80e00b0016d4e525290mr708001plb.39.1658526642989;
        Fri, 22 Jul 2022 14:50:42 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id b7-20020a17090a6ac700b001f20859b74csm5974608pjm.54.2022.07.22.14.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Jul 2022 14:50:42 -0700 (PDT)
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
Subject: [PATCH v6 4/4] asm-generic: Add new pci.h and use it
Date: Sat, 23 Jul 2022 06:49:44 +0900
Message-Id: <20220722214944.831438-5-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220722214944.831438-1-shorne@gmail.com>
References: <20220722214944.831438-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220722_145044_271042_F7626418 
X-CRM114-Status: GOOD (  16.80  )
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
Since v5:
 - Remove unneeded include in asm-generic/pci.h

 arch/arm64/include/asm/pci.h | 10 ++--------
 arch/csky/include/asm/pci.h  | 17 ++---------------
 arch/riscv/include/asm/pci.h | 23 ++++-------------------
 arch/um/include/asm/pci.h    | 14 ++------------
 include/asm-generic/pci.h    | 30 ++++++++++++++++++++++++++++++
 5 files changed, 40 insertions(+), 54 deletions(-)
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
index 000000000000..6869f1061528
--- /dev/null
+++ b/include/asm-generic/pci.h
@@ -0,0 +1,30 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef __ASM_GENERIC_PCI_H
+#define __ASM_GENERIC_PCI_H
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
