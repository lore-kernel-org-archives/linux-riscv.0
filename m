Return-Path: <SRS0=4uv/=QS=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0511C169C4
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 13:38:29 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BF32B21B1C
	for <infradead-linux-riscv@archiver.kernel.org>; Mon, 11 Feb 2019 13:38:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="b+dtOSHV"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BF32B21B1C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=lst.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=82fUkzuePvFKWgpNZt0aJmFAg1Rta+b9lK/et6gjE10=; b=b+dtOSHVcnXfHx
	QwdMqV8OixhfocZ2jJS+DQtvVGhyd+3gWyydnbSjiUFH2PyZoBMI9o2s+EkkgFLGDpBY3Rhm0ICTI
	bikps7/D7u+kYQ8CT5xQ+VDkqx1ouZpOHDQsGoz9Qm/Zh0uDt8267GOGPQMLFuwAL+MbZgq8f+ZOD
	H02S/b8UsoVMLSXIu8RcuODuJj+/2c/MEeveMz8zB3KBNVeNi/slIRFovT7ug0ropQ2YojMWR+pD+
	kM7x0NeRcfuBZVB2viEtzbPgKYFdA8klQ0Ew6s9in4h3bzXa3c9B6ojrT2+tVBUmE5OibIyx8WYSE
	bK5BbdsPvppp/1SSQp1w==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1gtBn2-0002Fj-29; Mon, 11 Feb 2019 13:38:28 +0000
Received: from 089144210182.atnat0019.highway.a1.net ([89.144.210.182]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gtBkw-0000D4-Ff; Mon, 11 Feb 2019 13:36:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: iommu@lists.linux-foundation.org
Subject: [PATCH 07/12] dma-mapping: move CONFIG_DMA_CMA to kernel/dma/Kconfig
Date: Mon, 11 Feb 2019 14:35:49 +0100
Message-Id: <20190211133554.30055-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190211133554.30055-1-hch@lst.de>
References: <20190211133554.30055-1-hch@lst.de>
MIME-Version: 1.0
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-xtensa@linux-xtensa.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 x86@kernel.org, linux-mips@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-snps-arc@lists.infradead.org, Lee Jones <lee.jones@linaro.org>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

This is where all the related code already lives.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 drivers/base/Kconfig | 77 --------------------------------------------
 kernel/dma/Kconfig   | 77 ++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+), 77 deletions(-)

diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index 3e63a900b330..059700ea3521 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -191,83 +191,6 @@ config DMA_FENCE_TRACE
 	  lockup related problems for dma-buffers shared across multiple
 	  devices.
 
-config DMA_CMA
-	bool "DMA Contiguous Memory Allocator"
-	depends on HAVE_DMA_CONTIGUOUS && CMA
-	help
-	  This enables the Contiguous Memory Allocator which allows drivers
-	  to allocate big physically-contiguous blocks of memory for use with
-	  hardware components that do not support I/O map nor scatter-gather.
-
-	  You can disable CMA by specifying "cma=0" on the kernel's command
-	  line.
-
-	  For more information see <include/linux/dma-contiguous.h>.
-	  If unsure, say "n".
-
-if  DMA_CMA
-comment "Default contiguous memory area size:"
-
-config CMA_SIZE_MBYTES
-	int "Size in Mega Bytes"
-	depends on !CMA_SIZE_SEL_PERCENTAGE
-	default 0 if X86
-	default 16
-	help
-	  Defines the size (in MiB) of the default memory area for Contiguous
-	  Memory Allocator.  If the size of 0 is selected, CMA is disabled by
-	  default, but it can be enabled by passing cma=size[MG] to the kernel.
-
-
-config CMA_SIZE_PERCENTAGE
-	int "Percentage of total memory"
-	depends on !CMA_SIZE_SEL_MBYTES
-	default 0 if X86
-	default 10
-	help
-	  Defines the size of the default memory area for Contiguous Memory
-	  Allocator as a percentage of the total memory in the system.
-	  If 0 percent is selected, CMA is disabled by default, but it can be
-	  enabled by passing cma=size[MG] to the kernel.
-
-choice
-	prompt "Selected region size"
-	default CMA_SIZE_SEL_MBYTES
-
-config CMA_SIZE_SEL_MBYTES
-	bool "Use mega bytes value only"
-
-config CMA_SIZE_SEL_PERCENTAGE
-	bool "Use percentage value only"
-
-config CMA_SIZE_SEL_MIN
-	bool "Use lower value (minimum)"
-
-config CMA_SIZE_SEL_MAX
-	bool "Use higher value (maximum)"
-
-endchoice
-
-config CMA_ALIGNMENT
-	int "Maximum PAGE_SIZE order of alignment for contiguous buffers"
-	range 4 12
-	default 8
-	help
-	  DMA mapping framework by default aligns all buffers to the smallest
-	  PAGE_SIZE order which is greater than or equal to the requested buffer
-	  size. This works well for buffers up to a few hundreds kilobytes, but
-	  for larger buffers it just a memory waste. With this parameter you can
-	  specify the maximum PAGE_SIZE order for contiguous buffers. Larger
-	  buffers will be aligned only to this specified order. The order is
-	  expressed as a power of two multiplied by the PAGE_SIZE.
-
-	  For example, if your system defaults to 4KiB pages, the order value
-	  of 8 means that the buffers will be aligned up to 1MiB only.
-
-	  If unsure, leave the default value "8".
-
-endif
-
 config GENERIC_ARCH_TOPOLOGY
 	bool
 	help
diff --git a/kernel/dma/Kconfig b/kernel/dma/Kconfig
index b122ab100d66..d785286ad868 100644
--- a/kernel/dma/Kconfig
+++ b/kernel/dma/Kconfig
@@ -53,3 +53,80 @@ config DMA_REMAP
 config DMA_DIRECT_REMAP
 	bool
 	select DMA_REMAP
+
+config DMA_CMA
+	bool "DMA Contiguous Memory Allocator"
+	depends on HAVE_DMA_CONTIGUOUS && CMA
+	help
+	  This enables the Contiguous Memory Allocator which allows drivers
+	  to allocate big physically-contiguous blocks of memory for use with
+	  hardware components that do not support I/O map nor scatter-gather.
+
+	  You can disable CMA by specifying "cma=0" on the kernel's command
+	  line.
+
+	  For more information see <include/linux/dma-contiguous.h>.
+	  If unsure, say "n".
+
+if  DMA_CMA
+comment "Default contiguous memory area size:"
+
+config CMA_SIZE_MBYTES
+	int "Size in Mega Bytes"
+	depends on !CMA_SIZE_SEL_PERCENTAGE
+	default 0 if X86
+	default 16
+	help
+	  Defines the size (in MiB) of the default memory area for Contiguous
+	  Memory Allocator.  If the size of 0 is selected, CMA is disabled by
+	  default, but it can be enabled by passing cma=size[MG] to the kernel.
+
+
+config CMA_SIZE_PERCENTAGE
+	int "Percentage of total memory"
+	depends on !CMA_SIZE_SEL_MBYTES
+	default 0 if X86
+	default 10
+	help
+	  Defines the size of the default memory area for Contiguous Memory
+	  Allocator as a percentage of the total memory in the system.
+	  If 0 percent is selected, CMA is disabled by default, but it can be
+	  enabled by passing cma=size[MG] to the kernel.
+
+choice
+	prompt "Selected region size"
+	default CMA_SIZE_SEL_MBYTES
+
+config CMA_SIZE_SEL_MBYTES
+	bool "Use mega bytes value only"
+
+config CMA_SIZE_SEL_PERCENTAGE
+	bool "Use percentage value only"
+
+config CMA_SIZE_SEL_MIN
+	bool "Use lower value (minimum)"
+
+config CMA_SIZE_SEL_MAX
+	bool "Use higher value (maximum)"
+
+endchoice
+
+config CMA_ALIGNMENT
+	int "Maximum PAGE_SIZE order of alignment for contiguous buffers"
+	range 4 12
+	default 8
+	help
+	  DMA mapping framework by default aligns all buffers to the smallest
+	  PAGE_SIZE order which is greater than or equal to the requested buffer
+	  size. This works well for buffers up to a few hundreds kilobytes, but
+	  for larger buffers it just a memory waste. With this parameter you can
+	  specify the maximum PAGE_SIZE order for contiguous buffers. Larger
+	  buffers will be aligned only to this specified order. The order is
+	  expressed as a power of two multiplied by the PAGE_SIZE.
+
+	  For example, if your system defaults to 4KiB pages, the order value
+	  of 8 means that the buffers will be aligned up to 1MiB only.
+
+	  If unsure, leave the default value "8".
+
+endif
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
