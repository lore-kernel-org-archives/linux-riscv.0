Return-Path: <SRS0=eLsP=VJ=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 27671C742A5
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 02:21:28 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 00DAC20863
	for <infradead-linux-riscv@archiver.kernel.org>; Fri, 12 Jul 2019 02:21:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="UkTGGAH6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 00DAC20863
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UBWTKYQ5HNGtnKNRuCr9TIdJhxCsTM3ro1tFX19WshU=; b=UkTGGAH6LCUeOA
	ri+MS4TaKLVxFsO6tElcQrksvoZj8FnJwoQtBbQqra/AK40xbNPfbwAFTOx3r/X0oWgdriwgN7bAl
	WOt/Z9UIZzzeNhAERYGBmsT8GQNUXccUDIr4oSyvdd6+FS8XKwtS9dR7yp9O6OAj3YdmW9pEx+L/N
	wAIePn17gXLJ4OilzuFs5v73bdbIu5NLU1zCOyUxsjbBnNsVIemfq17r7ysQ7VtyJlWJhrLujdU+N
	pPLmbplAy5fVG/VlKf31H0Plzk34rxkZT6v8Yu9zYPQbVvUoQyPpWF6z7QnrQ1s1mOLx5S/LPFc5k
	cKzi4ngRDi6sMaMjvyEQ==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92 #3 (Red Hat Linux))
	id 1hllBa-0007rA-AG; Fri, 12 Jul 2019 02:21:22 +0000
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
 by bombadil.infradead.org with esmtps (Exim 4.92 #3 (Red Hat Linux))
 id 1hllAn-0007RT-So; Fri, 12 Jul 2019 02:20:35 +0000
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R191e4; CH=green; DM=||false|;
 FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394; MF=alex.shi@linux.alibaba.com; NM=1;
 PH=DS; RN=21; SR=0; TI=SMTPD_---0TWfJjL-_1562898031; 
Received: from localhost(mailfrom:alex.shi@linux.alibaba.com
 fp:SMTPD_---0TWfJjL-_1562898031) by smtp.aliyun-inc.com(127.0.0.1);
 Fri, 12 Jul 2019 10:20:31 +0800
From: Alex Shi <alex.shi@linux.alibaba.com>
To: linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 03/12] Documentation/ia64: repointer docs to
 Documentation/arch/ia64
Date: Fri, 12 Jul 2019 10:20:09 +0800
Message-Id: <20190712022018.27989-3-alex.shi@linux.alibaba.com>
X-Mailer: git-send-email 2.19.1.856.g8858448bb
In-Reply-To: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
References: <20190712022018.27989-1-alex.shi@linux.alibaba.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190711_192034_115711_444251C2 
X-CRM114-Status: UNSURE (   7.85  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Tony Luck <tony.luck@intel.com>, linux-s390@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-omap@vger.kernel.org,
 linux-ia64@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-parisc@vger.kernel.org, linux-sh@vger.kernel.org,
 Ard Biesheuvel <ard.biesheuvel@linaro.org>, linux-kernel@vger.kernel.org,
 Fenghua Yu <fenghua.yu@intel.com>, linux-mips@vger.kernel.org,
 linux-samsung-soc@vger.kernel.org, kvm@vger.kernel.org,
 linux-riscv@lists.infradead.org, Alex Shi <alex.shi@linux.alibaba.com>,
 linuxppc-dev@lists.ozlabs.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Since we move 'ia64' docs to Documentation/arch/ia64 dir,
redirect the doc pointer to them.

Signed-off-by: Alex Shi <alex.shi@linux.alibaba.com>
Cc: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Cc: Tony Luck <tony.luck@intel.com>
Cc: Fenghua Yu <fenghua.yu@intel.com>
Cc: linux-kernel@vger.kernel.org
Cc: linux-ia64@vger.kernel.org
---
 MAINTAINERS             | 2 +-
 arch/ia64/kernel/efi.c  | 2 +-
 arch/ia64/kernel/fsys.S | 2 +-
 arch/ia64/mm/ioremap.c  | 2 +-
 arch/ia64/pci/pci.c     | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index c21d5464c86f..583c35cba7bc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -14286,7 +14286,7 @@ SGI SN-IA64 (Altix) SERIAL CONSOLE DRIVER
 M:	Pat Gefre <pfg@sgi.com>
 L:	linux-ia64@vger.kernel.org
 S:	Supported
-F:	Documentation/ia64/serial.txt
+F:	Documentation/arch/ia64/serial.txt
 F:	drivers/tty/serial/ioc?_serial.c
 F:	include/linux/ioc?.h
 
diff --git a/arch/ia64/kernel/efi.c b/arch/ia64/kernel/efi.c
index 8f106638913c..02cdc38d15e8 100644
--- a/arch/ia64/kernel/efi.c
+++ b/arch/ia64/kernel/efi.c
@@ -852,7 +852,7 @@ valid_phys_addr_range (phys_addr_t phys_addr, unsigned long size)
 	 * /dev/mem reads and writes use copy_to_user(), which implicitly
 	 * uses a granule-sized kernel identity mapping.  It's really
 	 * only safe to do this for regions in kern_memmap.  For more
-	 * details, see Documentation/ia64/aliasing.txt.
+	 * details, see Documentation/arch/ia64/aliasing.txt.
 	 */
 	attr = kern_mem_attribute(phys_addr, size);
 	if (attr & EFI_MEMORY_WB || attr & EFI_MEMORY_UC)
diff --git a/arch/ia64/kernel/fsys.S b/arch/ia64/kernel/fsys.S
index d80c99a5f55d..b493ca74890a 100644
--- a/arch/ia64/kernel/fsys.S
+++ b/arch/ia64/kernel/fsys.S
@@ -28,7 +28,7 @@
 #include <asm/native/inst.h>
 
 /*
- * See Documentation/ia64/fsys.txt for details on fsyscalls.
+ * See Documentation/arch/ia64/fsys.txt for details on fsyscalls.
  *
  * On entry to an fsyscall handler:
  *   r10	= 0 (i.e., defaults to "successful syscall return")
diff --git a/arch/ia64/mm/ioremap.c b/arch/ia64/mm/ioremap.c
index 5e3e7b1fdac5..989cc4df9087 100644
--- a/arch/ia64/mm/ioremap.c
+++ b/arch/ia64/mm/ioremap.c
@@ -42,7 +42,7 @@ ioremap (unsigned long phys_addr, unsigned long size)
 	/*
 	 * For things in kern_memmap, we must use the same attribute
 	 * as the rest of the kernel.  For more details, see
-	 * Documentation/ia64/aliasing.txt.
+	 * Documentation/arch/ia64/aliasing.txt.
 	 */
 	attr = kern_mem_attribute(phys_addr, size);
 	if (attr & EFI_MEMORY_WB)
diff --git a/arch/ia64/pci/pci.c b/arch/ia64/pci/pci.c
index e308196c2229..6ba87b70e30c 100644
--- a/arch/ia64/pci/pci.c
+++ b/arch/ia64/pci/pci.c
@@ -450,7 +450,7 @@ pci_mmap_legacy_page_range(struct pci_bus *bus, struct vm_area_struct *vma,
 		return -ENOSYS;
 
 	/*
-	 * Avoid attribute aliasing.  See Documentation/ia64/aliasing.txt
+	 * Avoid attribute aliasing.  See Documentation/arch/ia64/aliasing.txt
 	 * for more details.
 	 */
 	if (!valid_mmap_phys_addr_range(vma->vm_pgoff, size))
-- 
2.19.1.856.g8858448bb


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
