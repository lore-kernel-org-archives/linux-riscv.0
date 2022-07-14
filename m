Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 340BCC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Jul 2022 21:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=CMctRke1UWaAeL1e3UpXenRFZvO8lxfO0ZzI48/NCjo=; b=StkXzOAe5K/+HH
	DU1ETmlJAW/GT3yqqhVdRjovyN+uRAIyMU46EH7dvHXnnKIFOt/tevuYtEqZtigbUIymZVgV2Q/Zw
	ZZOMf6ragHGtybjyeZdiXQ/VCle0yEILdpZI5VJfgBvWpHGiw8xbxMWqD8uHCwp+xPmwIlsq8eXxt
	MBRsjegpsV/OTQ4GeKZtOy83TvlAarznOQ4jSHRlqPcC7UE6uAze8kxOjoUTBoNK6Inb83rN/uYJ4
	mGeH4UE3eQeG8FlGDenMsvbA0WJM5HNm2KoalOWypPXxCwXaqTY7q/+YfK2rkIHp834wsEE0YGjQh
	FRHYR9rvRrWeShSryA5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6gH-001ltb-Q0; Thu, 14 Jul 2022 21:47:33 +0000
Received: from mail-pj1-x1033.google.com ([2607:f8b0:4864:20::1033])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oC6gE-001lrR-M8
	for linux-riscv@lists.infradead.org; Thu, 14 Jul 2022 21:47:32 +0000
Received: by mail-pj1-x1033.google.com with SMTP id fz10so4009057pjb.2
        for <linux-riscv@lists.infradead.org>; Thu, 14 Jul 2022 14:47:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Avm3V7XrbXBWkB/qO5JQFtbIFwNLm/HdohUf7P8zkK0=;
        b=Iaq16OJ+m9XsKv6I0s9ZPBvLNW7lXXnX4Z3CjPsP1fAwoe/Ib4iQoNfMWi+0siMrW/
         GSq3DRDaezyXT0yWRXlZmjVsZfEzw62WdDXrUIt09lmZWV4BlMkQ/dU82O4vwnrYHmyn
         o/7v2rh+q4itcE83QbxrK4117t4HFXOzxm4xIM85bfE+dhRtJpHL/5sxbuBxQiwQ4bWT
         LstUoWuXf0YhZHT/8jF9DdI778Dcii039dDR0k2519afE8PB6ZMc/Q/BS0nO4YTkHa2q
         1D44TzeeLcnTGS/HGgAZV230igzGnLNL0g6TyDqsIz5qTuDK/SXq1EHrDrrI/yLv49sj
         Ww3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Avm3V7XrbXBWkB/qO5JQFtbIFwNLm/HdohUf7P8zkK0=;
        b=CkEdS35hR7++K9YgPX4cfSGbmSczg6GipT9GGdllFa3HH27CGBPT7r36xgtpouWSvI
         Xnq9VSNAmJNiV8/91Og6caiKUlbPz5FMnX+ZSQXS2UBRRDj8vfcdzwUYOU6WyQZESEB4
         SrK9qumRI82yeSmPXUwsTBxlb9A3hcld2plivLYSBp9sDMph5xgmHyJS809MOXIRJGZ8
         0voJ1N9Ab/c08BSeIOjzYvE9CS36UW91DLc4V3pKvqE8QQOcBCF44hKYHfqPWvhbdUQm
         X4QWMZ7NqaGaHUAudkzZd9sIorqukl2d5VGFCAhPjKAOZ7Jzvevqp4FWVVknRE1XQYBj
         v2LQ==
X-Gm-Message-State: AJIora+Fu2QSIiWi5+gjYMaCV0a3rbqJJketKkrAon7SnNc+fY4Lvt8O
	Zb6fb94GUFaE+k3LdWIqaDc=
X-Google-Smtp-Source: AGRyM1u9xSRQV4Gvpyf5VkWOt/x74SDpE1KbsPWlYKaCYfIIrlO2LUPHc/onDI4OYYptIetSW3p0xA==
X-Received: by 2002:a17:90b:4c91:b0:1ef:f85b:6342 with SMTP id my17-20020a17090b4c9100b001eff85b6342mr18616032pjb.75.1657835247920;
        Thu, 14 Jul 2022 14:47:27 -0700 (PDT)
Received: from localhost ([2409:10:24a0:4700:e8ad:216a:2a9d:6d0c])
        by smtp.gmail.com with ESMTPSA id c20-20020a634e14000000b00411b3d2bcadsm1892918pgb.25.2022.07.14.14.47.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Jul 2022 14:47:27 -0700 (PDT)
From: Stafford Horne <shorne@gmail.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Stafford Horne <shorne@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
	Matt Turner <mattst88@gmail.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Paul Mackerras <paulus@samba.org>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	"David S. Miller" <davem@davemloft.net>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Chris Zankel <chris@zankel.net>,
	Max Filippov <jcmvbkbc@gmail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Nick Child <nick.child@ibm.com>,
	Niklas Schnelle <schnelle@linux.ibm.com>,
	Matthew Rosato <mjrosato@linux.ibm.com>,
	Pierre Morel <pmorel@linux.ibm.com>,
	Kees Cook <keescook@chromium.org>,
	"Gustavo A. R. Silva" <gustavoars@kernel.org>,
	linux-alpha@vger.kernel.org,
	linux-ia64@vger.kernel.org,
	linux-m68k@lists.linux-m68k.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	sparclinux@vger.kernel.org,
	linux-xtensa@linux-xtensa.org,
	linux-pci@vger.kernel.org,
	linux-arch@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [RFC PATCH 1/2] asm-generic: Remove pci.h copying code out to architectures
Date: Fri, 15 Jul 2022 06:46:56 +0900
Message-Id: <20220714214657.2402250-2-shorne@gmail.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220714214657.2402250-1-shorne@gmail.com>
References: <20220714214657.2402250-1-shorne@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220714_144730_747213_E010DE6E 
X-CRM114-Status: GOOD (  19.54  )
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

The generic pci.h header provides a definition of pci_get_legacy_ide_irq
which is used by architectures that use PC-style interrupt numbers.

This patch removes the old pci.h in order to make room for a new
pci.h to be used by arm64, riscv, openrisc, etc.

The existing code in pci.h is moved out to architectures.

Suggested-by: Arnd Bergmann <arnd@arndb.de>
Link: https://lore.kernel.org/lkml/CAK8P3a0JmPeczfmMBE__vn=Jbvf=nkbpVaZCycyv40pZNCJJXQ@mail.gmail.com/
Signed-off-by: Stafford Horne <shorne@gmail.com>
---
 arch/alpha/include/asm/pci.h   |  1 -
 arch/ia64/include/asm/pci.h    |  1 -
 arch/m68k/include/asm/pci.h    |  7 +++++--
 arch/powerpc/include/asm/pci.h |  1 -
 arch/s390/include/asm/pci.h    |  6 +++++-
 arch/sparc/include/asm/pci.h   |  5 ++++-
 arch/x86/include/asm/pci.h     |  6 ++++--
 arch/xtensa/include/asm/pci.h  |  6 ++++--
 include/asm-generic/pci.h      | 17 -----------------
 9 files changed, 22 insertions(+), 28 deletions(-)
 delete mode 100644 include/asm-generic/pci.h

diff --git a/arch/alpha/include/asm/pci.h b/arch/alpha/include/asm/pci.h
index cf6bc1e64d66..8ac5af0fc4da 100644
--- a/arch/alpha/include/asm/pci.h
+++ b/arch/alpha/include/asm/pci.h
@@ -56,7 +56,6 @@ struct pci_controller {
 
 /* IOMMU controls.  */
 
-/* TODO: integrate with include/asm-generic/pci.h ? */
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
 	return channel ? 15 : 14;
diff --git a/arch/ia64/include/asm/pci.h b/arch/ia64/include/asm/pci.h
index 8c163d1d0189..218412d963c2 100644
--- a/arch/ia64/include/asm/pci.h
+++ b/arch/ia64/include/asm/pci.h
@@ -63,7 +63,6 @@ static inline int pci_proc_domain(struct pci_bus *bus)
 	return (pci_domain_nr(bus) != 0);
 }
 
-#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
 	return channel ? isa_irq_to_vector(15) : isa_irq_to_vector(14);
diff --git a/arch/m68k/include/asm/pci.h b/arch/m68k/include/asm/pci.h
index 5a4bc223743b..0c272ff515cc 100644
--- a/arch/m68k/include/asm/pci.h
+++ b/arch/m68k/include/asm/pci.h
@@ -2,11 +2,14 @@
 #ifndef _ASM_M68K_PCI_H
 #define _ASM_M68K_PCI_H
 
-#include <asm-generic/pci.h>
-
 #define	pcibios_assign_all_busses()	1
 
 #define	PCIBIOS_MIN_IO		0x00000100
 #define	PCIBIOS_MIN_MEM		0x02000000
 
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
+
 #endif /* _ASM_M68K_PCI_H */
diff --git a/arch/powerpc/include/asm/pci.h b/arch/powerpc/include/asm/pci.h
index 915d6ee4b40a..f9da506751bb 100644
--- a/arch/powerpc/include/asm/pci.h
+++ b/arch/powerpc/include/asm/pci.h
@@ -39,7 +39,6 @@
 #define pcibios_assign_all_busses() \
 	(pci_has_flag(PCI_REASSIGN_ALL_BUS))
 
-#define HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
 static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 {
 	if (ppc_md.pci_get_legacy_ide_irq)
diff --git a/arch/s390/include/asm/pci.h b/arch/s390/include/asm/pci.h
index fdb9745ee998..93cd0167f8aa 100644
--- a/arch/s390/include/asm/pci.h
+++ b/arch/s390/include/asm/pci.h
@@ -6,7 +6,6 @@
 #include <linux/mutex.h>
 #include <linux/iommu.h>
 #include <linux/pci_hotplug.h>
-#include <asm-generic/pci.h>
 #include <asm/pci_clp.h>
 #include <asm/pci_debug.h>
 #include <asm/sclp.h>
@@ -233,6 +232,11 @@ int zpci_init_iommu(struct zpci_dev *zdev);
 void zpci_destroy_iommu(struct zpci_dev *zdev);
 
 #ifdef CONFIG_PCI
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
+
 static inline bool zpci_use_mio(struct zpci_dev *zdev)
 {
 	return static_branch_likely(&have_mio) && zdev->mio_capable;
diff --git a/arch/sparc/include/asm/pci.h b/arch/sparc/include/asm/pci.h
index 4deddf430e5d..6d283fc7b55b 100644
--- a/arch/sparc/include/asm/pci.h
+++ b/arch/sparc/include/asm/pci.h
@@ -46,7 +46,10 @@ static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
 	return PCI_IRQ_NONE;
 }
 #else
-#include <asm-generic/pci.h>
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
 #endif
 
 #endif /* ___ASM_SPARC_PCI_H */
diff --git a/arch/x86/include/asm/pci.h b/arch/x86/include/asm/pci.h
index f3fd5928bcbb..7da27f665cfe 100644
--- a/arch/x86/include/asm/pci.h
+++ b/arch/x86/include/asm/pci.h
@@ -105,8 +105,10 @@ static inline void early_quirks(void) { }
 
 extern void pci_iommu_alloc(void);
 
-/* generic pci stuff */
-#include <asm-generic/pci.h>
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
 
 #ifdef CONFIG_NUMA
 /* Returns the node based on pci bus */
diff --git a/arch/xtensa/include/asm/pci.h b/arch/xtensa/include/asm/pci.h
index 8e2b48a268db..f57ede61f5db 100644
--- a/arch/xtensa/include/asm/pci.h
+++ b/arch/xtensa/include/asm/pci.h
@@ -43,7 +43,9 @@
 #define ARCH_GENERIC_PCI_MMAP_RESOURCE	1
 #define arch_can_pci_mmap_io()		1
 
-/* Generic PCI */
-#include <asm-generic/pci.h>
+static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
+{
+	return channel ? 15 : 14;
+}
 
 #endif	/* _XTENSA_PCI_H */
diff --git a/include/asm-generic/pci.h b/include/asm-generic/pci.h
deleted file mode 100644
index 6bb3cd3d695a..000000000000
--- a/include/asm-generic/pci.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0 */
-/*
- * linux/include/asm-generic/pci.h
- *
- *  Copyright (C) 2003 Russell King
- */
-#ifndef _ASM_GENERIC_PCI_H
-#define _ASM_GENERIC_PCI_H
-
-#ifndef HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ
-static inline int pci_get_legacy_ide_irq(struct pci_dev *dev, int channel)
-{
-	return channel ? 15 : 14;
-}
-#endif /* HAVE_ARCH_PCI_GET_LEGACY_IDE_IRQ */
-
-#endif /* _ASM_GENERIC_PCI_H */
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
