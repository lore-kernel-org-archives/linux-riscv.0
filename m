Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 477C5C6FD18
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Apr 2023 23:31:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QQKiKJ+p/9150huWS56DbLqYvI8oxEHBAIG2y2/XsCk=; b=GXs5XMF1Ss5Rjk
	uwGkr3WfBe5Kbn+qDFUOeqbnzqt+JcpMRoLm7x3Gx7GpYZdoH9ojMQQG+UgsQOwmib4u/D0ZjRS5r
	05ud9JrD78HOuuAO4cgiGWxgfVAxctlsbS8hrbZqVbabX0Q3+TVgiJ67fomH9bNH0JJkydOVQ9vgL
	XidlSTL76GbWCTg2xuojuviCoFO7bOoGm0GG4xh0FGxc1FlmB2GzTHP0KzWqyVjfXcdgaxuY37gn3
	o1RumrlsL32KUoC9rR3KUf5GOW3OFHtRtq6qKOyiHKKGhlFWN7Z30HHrORw18+DoYHOTF2x21zAOP
	f85MMtA5Bjyw3JPyGHPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1ppHGE-006efu-1c;
	Wed, 19 Apr 2023 23:30:50 +0000
Received: from mail-pl1-x634.google.com ([2607:f8b0:4864:20::634])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1ppG8n-006Tcn-27
	for linux-riscv@lists.infradead.org;
	Wed, 19 Apr 2023 22:19:07 +0000
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1a68f2345c5so4229505ad.2
        for <linux-riscv@lists.infradead.org>; Wed, 19 Apr 2023 15:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1681942745; x=1684534745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZFcComAa5TlSFZBz7x8OlktBSnuCSnQ4ODeflbYaEGg=;
        b=0nUEiKekWfmNI3AIrUphLeoG9IshBvYin/IZirKoihkL7Vz1hKxvtZ9S/+qBRCxzGl
         Z5d0ha3qHQFVtOuYq101NOgtW6elAbMIjX+yLfEnzAp2xs2I4iBDYY5ZkQhxDmkY/7bK
         cWsa9maVnCVxVpLIasWERRfsvZygnli2tjaAPy0CiHcpn0ucula1hxhQbTtXkquOE/G9
         qpketxd8B8maczWCb6ig5SjaDPKhR+D5kNN9pT45ngLGWR38A7D8mV+x7ZjU7uDYBccF
         cGzTF21j2WAnsV3IO9kxRpdiOoTA+Oi128benfRj77bo/TAAOLLGK42wViYQ/tssBFno
         STjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681942745; x=1684534745;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZFcComAa5TlSFZBz7x8OlktBSnuCSnQ4ODeflbYaEGg=;
        b=jCEjYJrPZT4jH3vGW/m1TEvlGGtAR0Vzk+YQU69l7g71Gg4a0lfmc0dJcQp1LR7etQ
         6kQRO3X23dxWAM3z96RY0eDaoxU2ha76pwnO3Rw4fhUTKKD4KkZ4xAmX5G7JNrgduRXE
         COAIbTLE3X5Sy3HJepYtgwI3AMr4dFeTMCp4En8QwSNIqAgQ7imnFg+HlsRMyRUWVrGe
         GdTFC2mdRuNNd3/ZPwEkNNolV2QXx/oPO0BlcXIPJoRnz95EOfXOzhj3yg1GWRjqDMWA
         S7JM5XX0NIXaSW5MociL3awkXMtFRSvvcq3CtoxIw4liDWwIYE7D1em/XJk0XAmucEHN
         ew0A==
X-Gm-Message-State: AAQBX9cju8jfynxtFX7mCBQX1TkGWgwJsmrqU/5xNidk8MiqQUbYD6AU
	E7noTbCqM78EBxaJBW1MWz159Q==
X-Google-Smtp-Source: AKy350ZdssyQae53kgooCFIYW6ziRRtfOc1jDxPEdCsn1TsvpfXtraJ7uSS11rn4Y1HrD+jtGXUOIw==
X-Received: by 2002:a17:902:c792:b0:19e:7a2c:78a7 with SMTP id w18-20020a170902c79200b0019e7a2c78a7mr5521629pla.57.1681942745174;
        Wed, 19 Apr 2023 15:19:05 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id jn11-20020a170903050b00b00196807b5189sm11619190plb.292.2023.04.19.15.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Apr 2023 15:19:04 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
To: linux-kernel@vger.kernel.org
Cc: Rajnesh Kanwal <rkanwal@rivosinc.com>,
	Atish Patra <atishp@rivosinc.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Andrew Jones <ajones@ventanamicro.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	=?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Sean Christopherson <seanjc@google.com>,
	linux-coco@lists.linux.dev,
	Dylan Reid <dylan@rivosinc.com>,
	abrestic@rivosinc.com,
	Samuel Ortiz <sameo@rivosinc.com>,
	Christoph Hellwig <hch@infradead.org>,
	Conor Dooley <conor.dooley@microchip.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Guo Ren <guoren@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	kvm-riscv@lists.infradead.org,
	kvm@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	Mayuresh Chitale <mchitale@ventanamicro.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Uladzislau Rezki <urezki@gmail.com>
Subject: [RFC 43/48] RISC-V: Add base memory encryption functions.
Date: Wed, 19 Apr 2023 15:17:11 -0700
Message-Id: <20230419221716.3603068-44-atishp@rivosinc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230419221716.3603068-1-atishp@rivosinc.com>
References: <20230419221716.3603068-1-atishp@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230419_151905_692281_37FB6416 
X-CRM114-Status: GOOD (  25.15  )
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

From: Rajnesh Kanwal <rkanwal@rivosinc.com>

Devices like virtio use shared memory buffers to transfer
data. These buffers are part of the guest memory region.
For CoVE guest this is not possible as host can not access
guest memory.

This is solved by VIRTIO_F_ACCESS_PLATFORM feature and SWIOTLB
bounce buffers. Guest only allow devices with VIRTIO_F_ACCESS_PLATFORM
feature which leads to guest using DMA API and from there moving
to SWIOTLB bounce buffer due to SWIOTLB_FORCE flag set for TEE VM.

set_memory_encrypted and set_memory_decrypted sit in this allocation
path. Based on if a buffer is being decrypted we mark it shared and
if it's being encrypted we mark it unshared using hypercalls.

Signed-off-by: Rajnesh Kanwal <rkanwal@rivosinc.com>
Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/Kconfig                   |  7 ++++
 arch/riscv/include/asm/mem_encrypt.h | 26 +++++++++++++
 arch/riscv/mm/Makefile               |  2 +
 arch/riscv/mm/init.c                 | 17 ++++++++-
 arch/riscv/mm/mem_encrypt.c          | 57 ++++++++++++++++++++++++++++
 5 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/include/asm/mem_encrypt.h
 create mode 100644 arch/riscv/mm/mem_encrypt.c

diff --git a/arch/riscv/Kconfig b/arch/riscv/Kconfig
index 49c3006..414cee1 100644
--- a/arch/riscv/Kconfig
+++ b/arch/riscv/Kconfig
@@ -163,6 +163,11 @@ config ARCH_MMAP_RND_BITS_MAX
 config ARCH_MMAP_RND_COMPAT_BITS_MAX
 	default 17
 
+config RISCV_MEM_ENCRYPT
+	select ARCH_HAS_MEM_ENCRYPT
+	select ARCH_HAS_FORCE_DMA_UNENCRYPTED
+	def_bool n
+
 # set if we run in machine mode, cleared if we run in supervisor mode
 config RISCV_M_MODE
 	bool
@@ -515,6 +520,8 @@ config RISCV_COVE_HOST
 config RISCV_COVE_GUEST
 	bool "Guest Support for Confidential VM Extension(CoVE)"
 	default n
+	select SWIOTLB
+	select RISCV_MEM_ENCRYPT
 	help
 	  Enables support for running TVMs on platforms supporting CoVE.
 
diff --git a/arch/riscv/include/asm/mem_encrypt.h b/arch/riscv/include/asm/mem_encrypt.h
new file mode 100644
index 0000000..0dc3fe8
--- /dev/null
+++ b/arch/riscv/include/asm/mem_encrypt.h
@@ -0,0 +1,26 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * RISCV Memory Encryption Support.
+ *
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#ifndef __RISCV_MEM_ENCRYPT_H__
+#define __RISCV_MEM_ENCRYPT_H__
+
+#include <linux/init.h>
+
+struct device;
+
+bool force_dma_unencrypted(struct device *dev);
+
+/* Architecture __weak replacement functions */
+void __init mem_encrypt_init(void);
+
+int set_memory_encrypted(unsigned long addr, int numpages);
+int set_memory_decrypted(unsigned long addr, int numpages);
+
+#endif /* __RISCV_MEM_ENCRYPT_H__ */
diff --git a/arch/riscv/mm/Makefile b/arch/riscv/mm/Makefile
index 2ac177c..1fd9b60 100644
--- a/arch/riscv/mm/Makefile
+++ b/arch/riscv/mm/Makefile
@@ -33,3 +33,5 @@ endif
 
 obj-$(CONFIG_DEBUG_VIRTUAL) += physaddr.o
 obj-$(CONFIG_RISCV_DMA_NONCOHERENT) += dma-noncoherent.o
+
+obj-$(CONFIG_RISCV_MEM_ENCRYPT)	+= mem_encrypt.o
diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index 478d676..b5edd8e 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -21,6 +21,7 @@
 #include <linux/crash_dump.h>
 #include <linux/hugetlb.h>
 
+#include <asm/cove.h>
 #include <asm/fixmap.h>
 #include <asm/tlbflush.h>
 #include <asm/sections.h>
@@ -156,11 +157,25 @@ static void print_vm_layout(void) { }
 
 void __init mem_init(void)
 {
+	unsigned int flags = SWIOTLB_VERBOSE;
+	bool swiotlb_en;
+
+	if (is_cove_guest()) {
+		/* Since the guest memory is inaccessible to the host, devices
+		 * always need to use the SWIOTLB buffer for DMA even if
+		 * dma_capable() says otherwise.
+		 */
+		flags |= SWIOTLB_FORCE;
+		swiotlb_en = true;
+	} else {
+		swiotlb_en = !!(max_pfn > PFN_DOWN(dma32_phys_limit));
+	}
+
 #ifdef CONFIG_FLATMEM
 	BUG_ON(!mem_map);
 #endif /* CONFIG_FLATMEM */
 
-	swiotlb_init(max_pfn > PFN_DOWN(dma32_phys_limit), SWIOTLB_VERBOSE);
+	swiotlb_init(swiotlb_en, flags);
 	memblock_free_all();
 
 	print_vm_layout();
diff --git a/arch/riscv/mm/mem_encrypt.c b/arch/riscv/mm/mem_encrypt.c
new file mode 100644
index 0000000..8207a5c
--- /dev/null
+++ b/arch/riscv/mm/mem_encrypt.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (c) 2023 Rivos Inc.
+ *
+ * Authors:
+ *     Rajnesh Kanwal <rkanwal@rivosinc.com>
+ */
+
+#include <linux/dma-direct.h>
+#include <linux/swiotlb.h>
+#include <linux/cc_platform.h>
+#include <linux/mem_encrypt.h>
+#include <asm/covg_sbi.h>
+
+/* Override for DMA direct allocation check - ARCH_HAS_FORCE_DMA_UNENCRYPTED */
+bool force_dma_unencrypted(struct device *dev)
+{
+	/*
+	 * For authorized devices in trusted guest, all DMA must be to/from
+	 * unencrypted addresses.
+	 */
+	return cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+}
+
+int set_memory_encrypted(unsigned long addr, int numpages)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return 0;
+
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	return sbi_covg_unshare_memory(__pa(addr), numpages * PAGE_SIZE);
+}
+EXPORT_SYMBOL_GPL(set_memory_encrypted);
+
+int set_memory_decrypted(unsigned long addr, int numpages)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return 0;
+
+	if (!PAGE_ALIGNED(addr))
+		return -EINVAL;
+
+	return sbi_covg_share_memory(__pa(addr), numpages * PAGE_SIZE);
+}
+EXPORT_SYMBOL_GPL(set_memory_decrypted);
+
+/* Architecture __weak replacement functions */
+void __init mem_encrypt_init(void)
+{
+	if (!cc_platform_has(CC_ATTR_MEM_ENCRYPT))
+		return;
+
+	/* Call into SWIOTLB to update the SWIOTLB DMA buffers */
+	swiotlb_update_mem_attributes();
+}
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
