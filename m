Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18236D6AB1B
	for <linux-riscv@archiver.kernel.org>; Fri,  3 Apr 2026 00:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8yiP83LecyJiiQcYx1nbYMv781hBgBv9BLVy9jCaf6s=; b=lBINfmLQzFYcNs
	x+yjuJAr0aHTZFKXuYNT7Ppf95ALqKkJsNlZHOxAVQlUpL6/bK2FTe4FONyGO7lMr0lgozfQHJW0I
	L5zEkv3gCq+JjpSim16sWEaqte5eG7kj0tpeIIEzv5LFS4mOgxIxEziqP8f+S/epyAXag54adTwZg
	tmymkhAtzw6w8CmcB60zbgL9sIb9u+Zsv7f6a/dCzjZuzolIsjgBbjS38aNqTT3GZDd+RkSgA9ZPX
	EJ+9c5DgGks9vngBrVLM4MUd+tua409+jmQGJhDfjFZMkfFt7qHOQKDYqX3FyNYuW1w4wRapeMBbP
	c1Lto/hWgfBkt0i5bGFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8SlV-00000000zax-31ga;
	Fri, 03 Apr 2026 00:52:01 +0000
Received: from mail-dy1-x1332.google.com ([2607:f8b0:4864:20::1332])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8SlS-00000000zZY-2yIE
	for linux-riscv@lists.infradead.org;
	Fri, 03 Apr 2026 00:51:59 +0000
Received: by mail-dy1-x1332.google.com with SMTP id 5a478bee46e88-2c5b3d8eab1so607907eec.1
        for <linux-riscv@lists.infradead.org>; Thu, 02 Apr 2026 17:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775177518; x=1775782318; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7B9SH08OctcmckbQMLfLF1d3L3yf5IwR4rnNqOjePIg=;
        b=HiG23a2VnjYcBQBnbul7DAypbQ2IIm1mZN8Y7x6PG0tPiluHfCTy8loNZyZ/tbwVby
         GlCvTPY7mcydIxuQ9EZHy7X2TpOnZYFCt1Cwf6BYZv1PU/cS7lWBjVZR5/s2zNzmynPq
         y/EIRJU9tB6pQEaIp4Y1nwYakiib+rtUBz0CM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775177518; x=1775782318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7B9SH08OctcmckbQMLfLF1d3L3yf5IwR4rnNqOjePIg=;
        b=aGQ41z/+OAzSP3ysYSvs9CFpUwdc9S1olQkN8B4XG3rytvkybfdxPcpPYt5NKuyJcE
         qZkOr66T4wH4iApvFc7MB/VlqCdHisynkqZf8M70xiuHIlsTKPi9Ex1cRzHj+S0/N6Z8
         WtLvLtyhJ+v1SctXFkXq/ELQmkiYkjMsEiJoHxJR0F57hU3U9e8hfgouc8EdONIMv3vI
         KqTpdcecTqEi6JNs9iWuDGXpQCcq7gBAH6sRytAvzxMxX2TLql2sAuiQR3+m+T+W2mr0
         NjTAA/pG0gwNQf18xh1as9kdq/PEXkknqBJNUxEeV84JnPypwsZF+shULgdoQZ82Gb/f
         ZvvA==
X-Forwarded-Encrypted: i=1; AJvYcCW7DuiPJlSQMmJbLMDV4YKxYxhBWaWHk3v4tgWwF/3CnB//P7EDRPtwkdhvNsw1/Q8lNiWFLpLcOT/8Sg==@lists.infradead.org
X-Gm-Message-State: AOJu0YwY//47u8k/IOQxA9DtrJ+1dxiwTnOrbUysXfWJlhdmI8bdKzvp
	HRhLMR4YwuE4Evu/Snm5OI6EvPfY98OW3TPI0YaPHk2h+ohsgrUGpWAZgeEcIUcuiw==
X-Gm-Gg: AeBDiesQvh8x8F4CpgOe8tLtrdTvX2Vq5APpijFHOUfc4w8c7G5k1Gc+1QvcDWriYFJ
	kExULF5vJLS9Tq9QbtlFVgSoE6SrsP2SSTRGzSwJpbGvDLZzsDBVFZQFXtycIXoWcHawgZ0d4zx
	dc3K/geGVb8jK99YBO+pnwVSzHK9uj4301KNLfct4oo1xIVEs0qGBis3Tp8SwHmqhliX13WX78e
	ryCoVn8kE4yHcv5/LHNXOGd8ST2GEvPomiDDvlbWDlfpJqpTNLODUrRTvcsHkA+J426BeU09soY
	PFfUlgPWcxJxinNa8mAksVnRKjahgqicuSbUE6sVojolltDTn6AKz0y/e4dbRsMnZbFexx9IWkF
	lHAd4JQH+w9dDOd0fHocDyNOveHkQsoYAWT9BovCHpupT4BR5Axik/M7DoMbK/sO1LCQa3pv1YJ
	FLvDeLKEEKZdomdvJ1kaBpEldcW66l5TTIE7Fze96W9vHpH5cDcfi9D5RpG+V4CZMNbRYqUsbkS
	RK6s4KDsEI=
X-Received: by 2002:a05:693c:3018:b0:2c0:cc90:a71 with SMTP id 5a478bee46e88-2cbf9df22d4mr651415eec.8.1775177517695;
        Thu, 02 Apr 2026 17:51:57 -0700 (PDT)
Received: from dianders.sjc.corp.google.com ([2a00:79e0:2e7c:8:5db3:7542:a530:f43a])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ca78df3b84sm3630074eec.5.2026.04.02.17.51.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 17:51:56 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Leon Romanovsky <leon@kernel.org>,
	Paul Burton <paul.burton@mips.com>,
	Saravana Kannan <saravanak@kernel.org>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Eric Dumazet <edumazet@google.com>,
	Toshi Kani <toshi.kani@hp.com>,
	Christoph Hellwig <hch@lst.de>,
	Alexey Kardashevskiy <aik@ozlabs.ru>,
	Johan Hovold <johan@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Frank.Li@kernel.org,
	alex@ghiti.fr,
	andre.przywara@arm.com,
	andrew@lunn.ch,
	aou@eecs.berkeley.edu,
	catalin.marinas@arm.com,
	dmaengine@vger.kernel.org,
	driver-core@lists.linux.dev,
	gregory.clement@bootlin.com,
	iommu@lists.linux.dev,
	jgg@ziepe.ca,
	kees@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-snps-arc@lists.infradead.org,
	linux@armlinux.org.uk,
	m.szyprowski@samsung.com,
	palmer@dabbelt.com,
	peter.ujfalusi@gmail.com,
	pjw@kernel.org,
	sebastian.hesselbarth@gmail.com,
	tsbogend@alpha.franken.de,
	vgupta@kernel.org,
	vkoul@kernel.org,
	will@kernel.org,
	willy@infradead.org
Subject: [PATCH v3 7/9] driver core: Replace dev->dma_coherent with DEV_FLAG_DMA_COHERENT
Date: Thu,  2 Apr 2026 17:49:53 -0700
Message-ID: <20260402174925.v3.7.If839f6dde98979fce177f70c6c74689a1904ee76@changeid>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
In-Reply-To: <20260403005005.30424-1-dianders@chromium.org>
References: <20260403005005.30424-1-dianders@chromium.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_175158_764488_96E67945 
X-CRM114-Status: GOOD (  24.97  )
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

In C, bitfields are not necessarily safe to modify from multiple
threads without locking. Switch "dma_coherent" over to the "flags"
field so modifications are safe.

Cc: Christoph Hellwig <hch@lst.de>
Cc: Paul Burton <paul.burton@mips.com>
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---
Not fixing any known bugs; problem is theoretical and found by code
inspection. Change is done somewhat manually and only lightly tested
(mostly compile-time tested).

NOTE: even though previously we only took up a bit if
CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE, CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU,
or CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL, in this change I reserve the
bit unconditionally.  While we could get the "dynamic" behavior by
changing the flags definition to be an "enum", it doesn't seem worth
it at this point.

Changes in v3:
- New

 arch/arc/mm/dma.c                 |  4 ++--
 arch/arm/mach-highbank/highbank.c |  2 +-
 arch/arm/mach-mvebu/coherency.c   |  2 +-
 arch/arm/mm/dma-mapping-nommu.c   |  4 ++--
 arch/arm/mm/dma-mapping.c         | 30 ++++++++++++++++--------------
 arch/arm64/mm/dma-mapping.c       |  2 +-
 arch/mips/mm/dma-noncoherent.c    |  2 +-
 arch/riscv/mm/dma-noncoherent.c   |  2 +-
 drivers/base/core.c               |  2 +-
 drivers/dma/ti/k3-udma-glue.c     |  6 +++---
 drivers/dma/ti/k3-udma.c          |  6 +++---
 include/linux/device.h            | 10 +++-------
 include/linux/dma-map-ops.h       |  2 +-
 13 files changed, 36 insertions(+), 38 deletions(-)

diff --git a/arch/arc/mm/dma.c b/arch/arc/mm/dma.c
index 6b85e94f3275..3d56878cb6a2 100644
--- a/arch/arc/mm/dma.c
+++ b/arch/arc/mm/dma.c
@@ -98,8 +98,8 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 	 * DMA buffers.
 	 */
 	if (is_isa_arcv2() && ioc_enable && coherent)
-		dev->dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &dev->flags);
 
 	dev_info(dev, "use %scoherent DMA ops\n",
-		 dev->dma_coherent ? "" : "non");
+		 test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) ? "" : "non");
 }
diff --git a/arch/arm/mach-highbank/highbank.c b/arch/arm/mach-highbank/highbank.c
index 47335c7dadf8..ffa3f591f57a 100644
--- a/arch/arm/mach-highbank/highbank.c
+++ b/arch/arm/mach-highbank/highbank.c
@@ -98,7 +98,7 @@ static int highbank_platform_notifier(struct notifier_block *nb,
 	if (of_property_read_bool(dev->of_node, "dma-coherent")) {
 		val = readl(sregs_base + reg);
 		writel(val | 0xff01, sregs_base + reg);
-		dev->dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &dev->flags);
 	}
 
 	return NOTIFY_OK;
diff --git a/arch/arm/mach-mvebu/coherency.c b/arch/arm/mach-mvebu/coherency.c
index fa2c1e1aeb96..8391303a6a17 100644
--- a/arch/arm/mach-mvebu/coherency.c
+++ b/arch/arm/mach-mvebu/coherency.c
@@ -95,7 +95,7 @@ static int mvebu_hwcc_notifier(struct notifier_block *nb,
 
 	if (event != BUS_NOTIFY_ADD_DEVICE)
 		return NOTIFY_DONE;
-	dev->dma_coherent = true;
+	set_bit(DEV_FLAG_DMA_COHERENT, &dev->flags);
 
 	return NOTIFY_OK;
 }
diff --git a/arch/arm/mm/dma-mapping-nommu.c b/arch/arm/mm/dma-mapping-nommu.c
index fecac107fd0d..ac0a976e30a0 100644
--- a/arch/arm/mm/dma-mapping-nommu.c
+++ b/arch/arm/mm/dma-mapping-nommu.c
@@ -42,11 +42,11 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 		 * enough to check if MPU is in use or not since in absence of
 		 * MPU system memory map is used.
 		 */
-		dev->dma_coherent = cacheid ? coherent : true;
+		assign_bit(DEV_FLAG_DMA_COHERENT, &dev->flags, cacheid ? coherent : true);
 	} else {
 		/*
 		 * Assume coherent DMA in case MMU/MPU has not been set up.
 		 */
-		dev->dma_coherent = (get_cr() & CR_M) ? coherent : true;
+		assign_bit(DEV_FLAG_DMA_COHERENT, &dev->flags, (get_cr() & CR_M) ? coherent : true);
 	}
 }
diff --git a/arch/arm/mm/dma-mapping.c b/arch/arm/mm/dma-mapping.c
index f304037d1c34..9c2c635d7ac0 100644
--- a/arch/arm/mm/dma-mapping.c
+++ b/arch/arm/mm/dma-mapping.c
@@ -1076,7 +1076,7 @@ static void *arm_iommu_alloc_attrs(struct device *dev, size_t size,
 	pgprot_t prot = __get_dma_pgprot(attrs, PAGE_KERNEL);
 	struct page **pages;
 	void *addr = NULL;
-	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
+	int coherent_flag = test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) ? COHERENT : NORMAL;
 
 	*handle = DMA_MAPPING_ERROR;
 	size = PAGE_ALIGN(size);
@@ -1124,7 +1124,7 @@ static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 	if (vma->vm_pgoff >= nr_pages)
 		return -ENXIO;
 
-	if (!dev->dma_coherent)
+	if (!test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags))
 		vma->vm_page_prot = __get_dma_pgprot(attrs, vma->vm_page_prot);
 
 	err = vm_map_pages(vma, pages, nr_pages);
@@ -1141,7 +1141,7 @@ static int arm_iommu_mmap_attrs(struct device *dev, struct vm_area_struct *vma,
 static void arm_iommu_free_attrs(struct device *dev, size_t size, void *cpu_addr,
 	dma_addr_t handle, unsigned long attrs)
 {
-	int coherent_flag = dev->dma_coherent ? COHERENT : NORMAL;
+	int coherent_flag = test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) ? COHERENT : NORMAL;
 	struct page **pages;
 	size = PAGE_ALIGN(size);
 
@@ -1202,7 +1202,8 @@ static int __map_sg_chunk(struct device *dev, struct scatterlist *sg,
 		phys_addr_t phys = page_to_phys(sg_page(s));
 		unsigned int len = PAGE_ALIGN(s->offset + s->length);
 
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		if (!test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) &&
+		    !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 			arch_sync_dma_for_device(sg_phys(s), s->length, dir);
 
 		prot = __dma_info_to_prot(dir, attrs);
@@ -1304,7 +1305,8 @@ static void arm_iommu_unmap_sg(struct device *dev,
 		if (sg_dma_len(s))
 			__iommu_remove_mapping(dev, sg_dma_address(s),
 					       sg_dma_len(s));
-		if (!dev->dma_coherent && !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
+		if (!test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) &&
+		    !(attrs & DMA_ATTR_SKIP_CPU_SYNC))
 			arch_sync_dma_for_cpu(sg_phys(s), s->length, dir);
 	}
 }
@@ -1323,7 +1325,7 @@ static void arm_iommu_sync_sg_for_cpu(struct device *dev,
 	struct scatterlist *s;
 	int i;
 
-	if (dev->dma_coherent)
+	if (test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags))
 		return;
 
 	for_each_sg(sg, s, nents, i)
@@ -1345,7 +1347,7 @@ static void arm_iommu_sync_sg_for_device(struct device *dev,
 	struct scatterlist *s;
 	int i;
 
-	if (dev->dma_coherent)
+	if (test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags))
 		return;
 
 	for_each_sg(sg, s, nents, i)
@@ -1371,7 +1373,7 @@ static dma_addr_t arm_iommu_map_phys(struct device *dev, phys_addr_t phys,
 	dma_addr_t dma_addr;
 	int ret, prot;
 
-	if (!dev->dma_coherent &&
+	if (!test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO)))
 		arch_sync_dma_for_device(phys, size, dir);
 
@@ -1412,7 +1414,7 @@ static void arm_iommu_unmap_phys(struct device *dev, dma_addr_t handle,
 	if (!iova)
 		return;
 
-	if (!dev->dma_coherent &&
+	if (!test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) &&
 	    !(attrs & (DMA_ATTR_SKIP_CPU_SYNC | DMA_ATTR_MMIO))) {
 		phys_addr_t phys = iommu_iova_to_phys(mapping->domain, iova);
 
@@ -1431,7 +1433,7 @@ static void arm_iommu_sync_single_for_cpu(struct device *dev,
 	unsigned int offset = handle & ~PAGE_MASK;
 	phys_addr_t phys;
 
-	if (dev->dma_coherent || !iova)
+	if (test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) || !iova)
 		return;
 
 	phys = iommu_iova_to_phys(mapping->domain, iova);
@@ -1446,7 +1448,7 @@ static void arm_iommu_sync_single_for_device(struct device *dev,
 	unsigned int offset = handle & ~PAGE_MASK;
 	phys_addr_t phys;
 
-	if (dev->dma_coherent || !iova)
+	if (test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags) || !iova)
 		return;
 
 	phys = iommu_iova_to_phys(mapping->domain, iova);
@@ -1701,13 +1703,13 @@ static void arm_teardown_iommu_dma_ops(struct device *dev) { }
 void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
 	/*
-	 * Due to legacy code that sets the ->dma_coherent flag from a bus
-	 * notifier we can't just assign coherent to the ->dma_coherent flag
+	 * Due to legacy code that sets DEV_FLAG_DMA_COHERENT from a bus
+	 * notifier we can't just assign coherent to DEV_FLAG_DMA_COHERENT
 	 * here, but instead have to make sure we only set but never clear it
 	 * for now.
 	 */
 	if (coherent)
-		dev->dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &dev->flags);
 
 	/*
 	 * Don't override the dma_ops if they have already been set. Ideally
diff --git a/arch/arm64/mm/dma-mapping.c b/arch/arm64/mm/dma-mapping.c
index b2b5792b2caa..256c7631aff5 100644
--- a/arch/arm64/mm/dma-mapping.c
+++ b/arch/arm64/mm/dma-mapping.c
@@ -48,7 +48,7 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 		   dev_driver_string(dev), dev_name(dev),
 		   ARCH_DMA_MINALIGN, cls);
 
-	dev->dma_coherent = coherent;
+	assign_bit(DEV_FLAG_DMA_COHERENT, &dev->flags, coherent);
 
 	xen_setup_dma_ops(dev);
 }
diff --git a/arch/mips/mm/dma-noncoherent.c b/arch/mips/mm/dma-noncoherent.c
index ab4f2a75a7d0..496bf5f4999c 100644
--- a/arch/mips/mm/dma-noncoherent.c
+++ b/arch/mips/mm/dma-noncoherent.c
@@ -139,6 +139,6 @@ void arch_sync_dma_for_cpu(phys_addr_t paddr, size_t size,
 #ifdef CONFIG_ARCH_HAS_SETUP_DMA_OPS
 void arch_setup_dma_ops(struct device *dev, bool coherent)
 {
-	dev->dma_coherent = coherent;
+	assign_bit(DEV_FLAG_DMA_COHERENT, &dev->flags, coherent);
 }
 #endif
diff --git a/arch/riscv/mm/dma-noncoherent.c b/arch/riscv/mm/dma-noncoherent.c
index cb89d7e0ba88..3b793a1cc607 100644
--- a/arch/riscv/mm/dma-noncoherent.c
+++ b/arch/riscv/mm/dma-noncoherent.c
@@ -140,7 +140,7 @@ void arch_setup_dma_ops(struct device *dev, bool coherent)
 		   "%s %s: device non-coherent but no non-coherent operations supported",
 		   dev_driver_string(dev), dev_name(dev));
 
-	dev->dma_coherent = coherent;
+	assign_bit(DEV_FLAG_DMA_COHERENT, &dev->flags, coherent);
 }
 
 void riscv_noncoherent_supported(void)
diff --git a/drivers/base/core.c b/drivers/base/core.c
index 8dbb7a9c7aab..00005777c21f 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -3174,7 +3174,7 @@ void device_initialize(struct device *dev)
 #if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
     defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-	dev->dma_coherent = dma_default_coherent;
+	assign_bit(DEV_FLAG_DMA_COHERENT, &dev->flags, dma_default_coherent);
 #endif
 	swiotlb_dev_init(dev);
 }
diff --git a/drivers/dma/ti/k3-udma-glue.c b/drivers/dma/ti/k3-udma-glue.c
index f87d244cc2d6..cda8f4a8f440 100644
--- a/drivers/dma/ti/k3-udma-glue.c
+++ b/drivers/dma/ti/k3-udma-glue.c
@@ -312,7 +312,7 @@ k3_udma_glue_request_tx_chn_common(struct device *dev,
 
 	if (xudma_is_pktdma(tx_chn->common.udmax)) {
 		/* prepare the channel device as coherent */
-		tx_chn->common.chan_dev.dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &tx_chn->common.chan_dev.flags);
 		dma_coerce_mask_and_coherent(&tx_chn->common.chan_dev,
 					     DMA_BIT_MASK(48));
 	}
@@ -1003,7 +1003,7 @@ k3_udma_glue_request_rx_chn_priv(struct device *dev, const char *name,
 
 	if (xudma_is_pktdma(rx_chn->common.udmax)) {
 		/* prepare the channel device as coherent */
-		rx_chn->common.chan_dev.dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &rx_chn->common.chan_dev.flags);
 		dma_coerce_mask_and_coherent(&rx_chn->common.chan_dev,
 					     DMA_BIT_MASK(48));
 	}
@@ -1104,7 +1104,7 @@ k3_udma_glue_request_remote_rx_chn_common(struct k3_udma_glue_rx_channel *rx_chn
 
 	if (xudma_is_pktdma(rx_chn->common.udmax)) {
 		/* prepare the channel device as coherent */
-		rx_chn->common.chan_dev.dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &rx_chn->common.chan_dev.flags);
 		dma_coerce_mask_and_coherent(&rx_chn->common.chan_dev,
 					     DMA_BIT_MASK(48));
 		rx_chn->single_fdq = false;
diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
index c964ebfcf3b6..770aae467fc5 100644
--- a/drivers/dma/ti/k3-udma.c
+++ b/drivers/dma/ti/k3-udma.c
@@ -428,18 +428,18 @@ static void k3_configure_chan_coherency(struct dma_chan *chan, u32 asel)
 		/* No special handling for the channel */
 		chan->dev->chan_dma_dev = false;
 
-		chan_dev->dma_coherent = false;
+		clear_bit(DEV_FLAG_DMA_COHERENT, &chan_dev->flags);
 		chan_dev->dma_parms = NULL;
 	} else if (asel == 14 || asel == 15) {
 		chan->dev->chan_dma_dev = true;
 
-		chan_dev->dma_coherent = true;
+		set_bit(DEV_FLAG_DMA_COHERENT, &chan_dev->flags);
 		dma_coerce_mask_and_coherent(chan_dev, DMA_BIT_MASK(48));
 		chan_dev->dma_parms = chan_dev->parent->dma_parms;
 	} else {
 		dev_warn(chan->device->dev, "Invalid ASEL value: %u\n", asel);
 
-		chan_dev->dma_coherent = false;
+		clear_bit(DEV_FLAG_DMA_COHERENT, &chan_dev->flags);
 		chan_dev->dma_parms = NULL;
 	}
 }
diff --git a/include/linux/device.h b/include/linux/device.h
index 6c961dac9fdb..c2a6dba7a036 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -480,6 +480,8 @@ struct device_physical_location {
  * @DEV_FLAG_STATE_SYNCED: The hardware state of this device has been synced to
  *		match the software state of this device by calling the
  *		driver/bus sync_state() callback.
+ * @DEV_FLAG_DMA_COHERENT: This particular device is dma coherent, even if the
+ *		architecture supports non-coherent devices.
  */
 enum struct_device_flags {
 	DEV_FLAG_READY_TO_PROBE,
@@ -488,6 +490,7 @@ enum struct_device_flags {
 	DEV_FLAG_DMA_SKIP_SYNC,
 	DEV_FLAG_DMA_OPS_BYPASS,
 	DEV_FLAG_STATE_SYNCED,
+	DEV_FLAG_DMA_COHERENT,
 };
 
 /**
@@ -569,8 +572,6 @@ enum struct_device_flags {
  * @offline:	Set after successful invocation of bus type's .offline().
  * @of_node_reused: Set if the device-tree node is shared with an ancestor
  *              device.
- * @dma_coherent: this particular device is dma coherent, even if the
- *		architecture supports non-coherent devices.
  * @flags:	DEV_FLAG_XXX flags. Use atomic bitfield operations to modify.
  *
  * At the lowest level, every device in a Linux system is represented by an
@@ -678,11 +679,6 @@ struct device {
 	bool			offline_disabled:1;
 	bool			offline:1;
 	bool			of_node_reused:1;
-#if defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_DEVICE) || \
-    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU) || \
-    defined(CONFIG_ARCH_HAS_SYNC_DMA_FOR_CPU_ALL)
-	bool			dma_coherent:1;
-#endif
 
 	unsigned long		flags;
 };
diff --git a/include/linux/dma-map-ops.h b/include/linux/dma-map-ops.h
index 4d9d1fe3277c..91d34678657c 100644
--- a/include/linux/dma-map-ops.h
+++ b/include/linux/dma-map-ops.h
@@ -230,7 +230,7 @@ int dma_direct_set_offset(struct device *dev, phys_addr_t cpu_start,
 extern bool dma_default_coherent;
 static inline bool dev_is_dma_coherent(struct device *dev)
 {
-	return dev->dma_coherent;
+	return test_bit(DEV_FLAG_DMA_COHERENT, &dev->flags);
 }
 #else
 #define dma_default_coherent true
-- 
2.53.0.1213.gd9a14994de-goog


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
