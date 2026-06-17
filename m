Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CD17CD98E2
	for <linux-riscv@archiver.kernel.org>; Wed, 17 Jun 2026 09:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=y3xkuJeAiJp54F+0/t3ujWbKHOc0Zr5CHF1A865BfK8=; b=lh6PoJbpvaAxYg
	LBB+pkqBzv/SXRQPCHgxwya3OU255yJLxZqaIQONk6qG88Xm15Cxm2onEqI5eB/zbbIzSLFmuSLjD
	Qz7hu39LhmnZ5aE3ZjIG7Lz8TUmIPDHO8QKWcYM7ZksqrlWEZz9pdBI3qrJojJxJLQ4TyL6OhdflT
	qsFhZqb9XyhzmBukxjsRm7Ta4caTYKeSC+DCdCClM2cfUBZab9NMBJ3TD+cLOi3OIM5/vZpB3Pe6b
	EUE987lc34SK1+xKf7iDwX300UnhnzcsDyBygJNjjfeTDyZuZspe6qxxxwFTg4J7N4g95iL0esWre
	UynDr9ZJG5zSua5V0+7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm9H-0000000GvZT-1hpX;
	Wed, 17 Jun 2026 09:01:27 +0000
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZm9F-0000000GvYP-0EoS
	for linux-riscv@lists.infradead.org;
	Wed, 17 Jun 2026 09:01:26 +0000
Received: by mail-pj1-x1044.google.com with SMTP id 98e67ed59e1d1-37c5b9d42efso359160a91.1
        for <linux-riscv@lists.infradead.org>; Wed, 17 Jun 2026 02:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781686884; x=1782291684; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nYt7f7++DHT88YL2TbGqisJsV/V1sQ3OoW1wFp8IqnE=;
        b=T35OwUHTsG+8m/ZPoNMapRTSBTaKGStr0JHlIlIL6chRM+en/Olmp5EhGf5JwXg31p
         40+9sB/DwUcKY5toYXHVqnwlZYZ4azpJRkJgrLCfD8Cny5tYhnbZIlFgTTiv1lgL4ute
         ZvpLDKVrPUNAkCLsc5RQxrw61P7mEFT9MlMbXAXSW41Gcz57ondMZdRgT74+WM+AFEYh
         PiXWgGESOiPSyu1ljuaTr2/UcoICZinLmzobTxhQTSx3Olr+ZA3tP25JklxWsewy07K8
         O56uUCMr8s3hwbpyIn4Y/kHcB58NBr5mYaPAI3j4aT5irtyoFPvf3keTVFQurNI5cmjv
         AQzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781686884; x=1782291684;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nYt7f7++DHT88YL2TbGqisJsV/V1sQ3OoW1wFp8IqnE=;
        b=nYsnpGd3dgW3p4TvFZ6BDolxS+nlgy5NQBAUOw1EoDDvAXehC2T5E06V82oMI0zUfq
         CJthYgIeHLeFIarhGaYWgEm/dWqt2A1C0mSaJm4U6a2A6hC2mCA+rJYrNkun36lfgNwO
         iaAALqKlwaLLZn3eWwH5t1liAURzFA0BGslTpdcJEd05xg3E0yKuohPtotf/4/YTEKpR
         v1vxAf7nG3df4L559ApRE5PQdhqIDh+Y2abED/7tJ2eM6aK9XJHp6xLaIAKnJgKi89Kh
         k3NJvRPWIqnSGtXd19Lx3b3nSR75Ey1sxe6kkz9sAZd0aAzN6uiJKLTK8X2TmdsGznIy
         hykA==
X-Forwarded-Encrypted: i=1; AFNElJ+Nry2MS63XxtvPDgWGLq1PBSu/N/sHiDKrLxt3cLe5Jq2bSB6McYidAg1ZoAuutXu7VSVuC4jKeTcBcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxF3vWrSnyOjAX8u+LFR1Cxh2v54KiWAPWIrKBmeDgbgRxCHnzn
	vlpaCZzkFOv5O0ktb9gxzqXO2KeeUuU2n3MdtPPiaIcMwWlxal6+44Ie
X-Gm-Gg: AfdE7cm1MFYzMqmN+4nw3sAzsPaDehAjCIZKF5Hr8k8FHWEXpXg0Xp1S2fkhSJVh62U
	R/TSv+T3G6XMmgn9rkeDbhauT5dRa6fl/zdLNzGm4kVp+Hcpdi7+gTvDFUJ2nEsqM7uEGoiANfl
	QMTVz24aMqxQ1gEPdnFOuo6xTdDA1pUP6AJEOq1toM8EQS2dQqgj5UBBlW0XH1ESDg/xuuu9X8f
	fv8BhUu4ak5a0gSHWR816tbgrzGC9PIYVZMxd+sU7C/tboC86d1GSGUUHk5Px3AdTP66+e8dbPr
	HXv1onNlNU1a8G1py6nPYZAMEvDzZeoQeZQQJShl2+B67DNJilwxoBLo2vnTOanC6d9FOOZT8c6
	nuOqq+6xIIc7nl0fnnNJSaFuTCtnrrG5vX44K6CMu3fm6OMFgourW5slrkPULgtZ42cAgNfoi3C
	3QQToGqjXvqzYYfD/nEuWMU87m8CE=
X-Received: by 2002:a17:90b:3ecd:b0:36a:8254:8eb1 with SMTP id 98e67ed59e1d1-37ca6a6c890mr1520866a91.6.1781686883958;
        Wed, 17 Jun 2026 02:01:23 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37ca1dbc8c9sm1195929a91.2.2026.06.17.02.01.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 02:01:23 -0700 (PDT)
From: "bingyu.xian" <shanbeeyoo@gmail.com>
To: Tomasz Jeznach <tomasz.jeznach@linux.dev>,
	Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Paul Walmsley <pjw@kernel.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"bingyu.xian" <shanbeeyoo@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH v1] iommu/riscv: Add page request queue and IOPF support
Date: Wed, 17 Jun 2026 17:01:16 +0800
Message-ID: <20260617090116.3254505-1-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260617_020125_117961_FCA3480E 
X-CRM114-Status: GOOD (  23.46  )
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

The RISC-V IOMMU Architecture Specification, Version 1.0, Chapter 3.3
defines a Page-request Queue (PQ) for handling PCIe Page Request
Interface (PRI) messages. The current driver implements only the
Command Queue (CQ) and Fault Queue (FQ); the PQ is left
unimplemented, which is the biggest functional gap compared with the
ARM SMMUv3 driver.

Add PQ and IOPF support:

- Initialize and enable the PQ when the hardware advertises ATS
  capability (RISCV_IOMMU_CAPABILITIES_ATS), and add an IOMMU_IOPF
  Kconfig dependency.
- Implement the PQ interrupt handler riscv_iommu_priq_process(),
  which consumes PQ records from the hardware ring buffer.
- Translate PQ records into the kernel's generic iopf_fault format
  and pass them to the IOPF framework via
  iommu_report_device_fault().
- Implement the .page_response callback, which builds an ATS.PRGR
  (Page Request Group Response) command and sends it through the
  command queue to notify the requesting device.

Tested on QEMU 10.0 with '-M virt,iommu-sys=on' and
CONFIG_IOMMU_IOPF=y; the PQ comes up cleanly:

  riscv,iommu 3010000.iommu: page request queue enabled
  
Test patch
==========

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index b1c2d3e4f5a6..3af3f19de94f 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -16,6 +16,7 @@
 #include <linux/acpi_rimt.h>
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
+#include <linux/debugfs.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
@@ -1608,9 +1609,62 @@ static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
 	return 0;
 }

+#ifdef CONFIG_DEBUG_FS
+/*
+ * debugfs interface to inject a fake PQ record without real PRI hardware.
+ *
+ * Writing a PCI BDF-encoded device id to the 'inject_pq' file constructs a
+ * synthetic riscv_iommu_pq_record and feeds it directly to
+ * riscv_iommu_handle_pq(), exercising the IOPF report path and, via the
+ * IOPF framework, the .page_response -> ATS.PRGR command path.
+ *
+ * The IRQ-driven priq_process() consumer loop is not exercised here, but it
+ * reuses the same queue infrastructure as the existing fltq_process().
+ */
+static struct dentry *riscv_iommu_debugfs_dir;
+
+static int riscv_iommu_inject_pq_set(void *data, u64 val)
+{
+	struct riscv_iommu_device *iommu = data;
+	struct riscv_iommu_pq_record fake_req;
+	unsigned int devid = (unsigned int)val;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS)) {
+		dev_err(iommu->dev, "inject_pq: ATS not supported\n");
+		return -ENODEV;
+	}
+
+	memset(&fake_req, 0, sizeof(fake_req));
+	fake_req.hdr = FIELD_PREP(RISCV_IOMMU_PQ_HDR_DID, devid);
+	fake_req.payload = FIELD_PREP(RISCV_IOMMU_PQ_PAYLOAD_ADDR, 0xdead0) |
+			   FIELD_PREP(RISCV_IOMMU_PQ_PAYLOAD_PRGI, 1) |
+			   RISCV_IOMMU_PQ_PAYLOAD_L |
+			   RISCV_IOMMU_PQ_PAYLOAD_R;
+
+	dev_info(iommu->dev,
+		 "inject_pq: injecting fake PQ record for devid 0x%x\n", devid);
+	riscv_iommu_handle_pq(iommu, &fake_req);
+	return 0;
+}
+
+DEFINE_DEBUGFS_ATTRIBUTE(riscv_iommu_inject_pq_fops, NULL,
+			 riscv_iommu_inject_pq_set, "%llu\n");
+
+static void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu)
+{
+	riscv_iommu_debugfs_dir = debugfs_create_dir("riscv-iommu", NULL);
+	debugfs_create_file("inject_pq", 0200, riscv_iommu_debugfs_dir,
+			    iommu, &riscv_iommu_inject_pq_fops);
+}
+
+static void riscv_iommu_debugfs_remove(void)
+{
+	debugfs_remove_recursive(riscv_iommu_debugfs_dir);
+	riscv_iommu_debugfs_dir = NULL;
+}
+#else
+static inline void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu) { }
+static inline void riscv_iommu_debugfs_remove(void) { }
+#endif /* CONFIG_DEBUG_FS */
+
 void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
+	riscv_iommu_debugfs_remove();
 	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
@@ -1754,6 +1808,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}

+	riscv_iommu_debugfs_init(iommu);
+
 	return 0;

 err_remove_sysfs:
---

Test logs:
  root@Ubuntu-riscv64:~# dmesg | grep "iommu"
  [    0.590293] iommu: Default domain type: Translated
  [    0.590379] iommu: DMA domain TLB invalidation policy: lazy mode
  [    1.374106] riscv,iommu 3010000.iommu: failed to find an MSI domain
  [    1.374429] riscv,iommu 3010000.iommu: using wire-signaled interrupts
  [    1.384786] riscv,iommu 3010000.iommu: page request queue enabled
  [    1.391279] pci 0000:00:00.0: Adding to iommu group 0
  [    1.391798] pci 0000:00:01.0: Adding to iommu group 1
  [    1.392023] pci 0000:00:02.0: Adding to iommu group 2
  [    1.392252] pci 0000:00:03.0: Adding to iommu group 3

  root@Ubuntu-riscv64:~# echo 8 > /sys/kernel/debug/riscv-iommu/inject_pq

  root@Ubuntu-riscv64:~# dmesg | grep "iommu"
  [    0.590293] iommu: Default domain type: Translated
  [    0.590379] iommu: DMA domain TLB invalidation policy: lazy mode
  [    1.374106] riscv,iommu 3010000.iommu: failed to find an MSI domain
  [    1.374429] riscv,iommu 3010000.iommu: using wire-signaled interrupts
  [    1.384786] riscv,iommu 3010000.iommu: page request queue enabled
  [    1.391279] pci 0000:00:00.0: Adding to iommu group 0
  [    1.391798] pci 0000:00:01.0: Adding to iommu group 1
  [    1.392023] pci 0000:00:02.0: Adding to iommu group 2
  [    1.392252] pci 0000:00:03.0: Adding to iommu group 3
  [ 1308.301611] riscv,iommu 3010000.iommu: inject_pq: injecting fake PQ record for devid 0x8
  [ 1308.303467] riscv,iommu 3010000.iommu: page request fault report failed: -22

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: bingyu.xian <shanbeeyoo@gmail.com>
---
 drivers/iommu/riscv/Kconfig |   1 +
 drivers/iommu/riscv/iommu.c | 178 +++++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h |   3 +
 3 files changed, 181 insertions(+), 1 deletion(-)

diff --git a/drivers/iommu/riscv/Kconfig b/drivers/iommu/riscv/Kconfig
index b86e5ab94183..c5abb7b4ba8f 100644
--- a/drivers/iommu/riscv/Kconfig
+++ b/drivers/iommu/riscv/Kconfig
@@ -7,6 +7,7 @@ config RISCV_IOMMU
 	depends on GENERIC_MSI_IRQ
 	depends on (RISCV || COMPILE_TEST) && 64BIT
 	select IOMMU_API
+	select IOMMU_IOPF
 	select GENERIC_PT
 	select IOMMU_PT
 	select IOMMU_PT_RISCV64
diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index a31f50bbad35..b1c2d3e4f5a6 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -33,9 +33,10 @@
 #define RISCV_IOMMU_DDTP_TIMEOUT	10000000
 #define RISCV_IOMMU_IOTINVAL_TIMEOUT	90000000

-/* Number of entries per CMD/FLT queue, should be <= INT_MAX */
+/* Number of entries per CMD/FLT/PRI queue, should be <= INT_MAX */
 #define RISCV_IOMMU_DEF_CQ_COUNT	8192
 #define RISCV_IOMMU_DEF_FQ_COUNT	4096
+#define RISCV_IOMMU_DEF_PQ_COUNT	4096

 /* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
 #define phys_to_ppn(pa)  (((pa) >> 2) & (((1ULL << 44) - 1) << 10))
@@ -565,6 +566,151 @@ static irqreturn_t riscv_iommu_fltq_process(int irq, void *data)
 	return IRQ_HANDLED;
 }


+static struct device *riscv_iommu_find_dev(struct riscv_iommu_device *iommu,
+					   unsigned int devid)
+{
+	struct pci_bus *bus;
+	struct pci_dev *pdev;
+
+	bus = pci_find_bus(0, devid >> 8);
+	if (!bus)
+		return NULL;
+
+	pdev = pci_get_slot(bus, devid & 0xff);
+	if (!pdev)
+		return NULL;
+
+	return &pdev->dev;
+}
+
+static void riscv_iommu_handle_pq(struct riscv_iommu_device *iommu,
+				  struct riscv_iommu_pq_record *req)
+{
+	struct iopf_fault fault;
+	struct device *dev;
+	unsigned int devid;
+	int ret;
+
+	devid = FIELD_GET(RISCV_IOMMU_PQ_HDR_DID, req->hdr);
+	dev = riscv_iommu_find_dev(iommu, devid);
+	if (!dev) {
+		dev_warn_ratelimited(iommu->dev,
+				     "page request for unknown devid 0x%x\n", devid);
+		return;
+	}
+
+	memset(&fault, 0, sizeof(fault));
+	fault.fault.type = IOMMU_FAULT_PAGE_REQ;
+	fault.fault.prm.addr = FIELD_GET(RISCV_IOMMU_PQ_PAYLOAD_ADDR, req->payload) << 12;
+	fault.fault.prm.grpid = FIELD_GET(RISCV_IOMMU_PQ_PAYLOAD_PRGI, req->payload);
+
+	if (req->payload & RISCV_IOMMU_PQ_PAYLOAD_R)
+		fault.fault.prm.perm |= IOMMU_FAULT_PERM_READ;
+	if (req->payload & RISCV_IOMMU_PQ_PAYLOAD_W)
+		fault.fault.prm.perm |= IOMMU_FAULT_PERM_WRITE;
+	if (req->hdr & RISCV_IOMMU_PQ_HDR_EXEC)
+		fault.fault.prm.perm |= IOMMU_FAULT_PERM_EXEC;
+	if (req->hdr & RISCV_IOMMU_PQ_HDR_PRIV)
+		fault.fault.prm.perm |= IOMMU_FAULT_PERM_PRIV;
+
+	if (req->hdr & RISCV_IOMMU_PQ_HDR_PV) {
+		fault.fault.prm.flags |= IOMMU_FAULT_PAGE_REQUEST_PASID_VALID |
+					 IOMMU_FAULT_PAGE_RESPONSE_NEEDS_PASID;
+		fault.fault.prm.pasid = FIELD_GET(RISCV_IOMMU_PQ_HDR_PID, req->hdr);
+	}
+
+	if (req->payload & RISCV_IOMMU_PQ_PAYLOAD_L)
+		fault.fault.prm.flags |= IOMMU_FAULT_PAGE_REQUEST_LAST_PAGE;
+
+	/* Store DID in private_data for page_response to send ATS.PRGR */
+	fault.fault.prm.private_data[0] = devid;
+
+	ret = iommu_report_device_fault(dev, &fault);
+	if (ret) {
+		dev_warn_ratelimited(iommu->dev,
+				     "page request fault report failed: %d\n", ret);
+	}
+}
+
+/* Page request queue interrupt handler thread function */
+static irqreturn_t riscv_iommu_priq_process(int irq, void *data)
+{
+	struct riscv_iommu_queue *queue = (struct riscv_iommu_queue *)data;
+	struct riscv_iommu_device *iommu = queue->iommu;
+	struct riscv_iommu_pq_record *requests;
+	unsigned int ctrl, idx;
+	int cnt, len;
+
+	requests = (struct riscv_iommu_pq_record *)queue->base;
+
+	/* Clear page request interrupt pending and process all records. */
+	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_IPSR, Q_IPSR(queue));
+
+	do {
+		cnt = riscv_iommu_queue_consume(queue, &idx);
+		for (len = 0; len < cnt; idx++, len++)
+			riscv_iommu_handle_pq(iommu, &requests[Q_ITEM(queue, idx)]);
+		riscv_iommu_queue_release(queue, cnt);
+	} while (cnt > 0);
+
+	/* Clear MF/OF errors */
+	ctrl = riscv_iommu_readl(iommu, queue->qcr);
+	if (ctrl & (RISCV_IOMMU_PQCSR_PQMF | RISCV_IOMMU_PQCSR_PQOF)) {
+		riscv_iommu_writel(iommu, queue->qcr, ctrl);
+		dev_warn(iommu->dev,
+			 "Queue #%u error; memory fault:%d overflow:%d\n",
+			 queue->qid,
+			 !!(ctrl & RISCV_IOMMU_PQCSR_PQMF),
+			 !!(ctrl & RISCV_IOMMU_PQCSR_PQOF));
+	}
+
+	return IRQ_HANDLED;
+}
+
+/* Send ATS.PRGR page response through the command queue */
+static void riscv_iommu_page_response(struct device *dev,
+				      struct iopf_fault *evt,
+				      struct iommu_page_response *msg)
+{
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+	struct riscv_iommu_command cmd;
+	unsigned int devid;
+	u8 resp_code;
+
+	/* Recover DID from private_data stored during PQ processing */
+	devid = evt->fault.prm.private_data[0];
+
+	switch (msg->code) {
+	case IOMMU_PAGE_RESP_SUCCESS:
+		resp_code = 0; /* Success */
+		break;
+	case IOMMU_PAGE_RESP_INVALID:
+		resp_code = 1; /* Invalid Request */
+		break;
+	case IOMMU_PAGE_RESP_FAILURE:
+	default:
+		resp_code = 0xF; /* Response Failure */
+		break;
+	}
+
+	/* Build ATS.PRGR command */
+	cmd.dword0 = FIELD_PREP(RISCV_IOMMU_CMD_OPCODE, RISCV_IOMMU_CMD_ATS_OPCODE) |
+		     FIELD_PREP(RISCV_IOMMU_CMD_FUNC, RISCV_IOMMU_CMD_ATS_FUNC_PRGR) |
+		     FIELD_PREP(RISCV_IOMMU_CMD_ATS_RID, devid);
+
+	if (evt->fault.prm.flags & IOMMU_FAULT_PAGE_REQUEST_PASID_VALID)
+		cmd.dword0 |= FIELD_PREP(RISCV_IOMMU_CMD_ATS_PID, evt->fault.prm.pasid) |
+			      RISCV_IOMMU_CMD_ATS_PV;
+
+	cmd.dword1 = FIELD_PREP(RISCV_IOMMU_CMD_ATS_PRGR_PRG_INDEX, msg->grpid) |
+		     FIELD_PREP(RISCV_IOMMU_CMD_ATS_PRGR_RESP_CODE, resp_code) |
+		     FIELD_PREP(RISCV_IOMMU_CMD_ATS_PRGR_DST_ID, devid);
+
+	riscv_iommu_cmd_send(iommu, &cmd);
+}
+
 /* Lookup and initialize device context info structure. */
 static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
 						 unsigned int devid)
@@ -1404,6 +1550,7 @@ static const struct iommu_ops riscv_iommu_ops = {
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
 	.release_device	= riscv_iommu_release_device,
+	.page_response = riscv_iommu_page_response,
 };

 static int riscv_iommu_init_check(struct riscv_iommu_device *iommu)
@@ -1466,6 +1613,8 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	riscv_iommu_queue_disable(&iommu->fltq);
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS)
+		riscv_iommu_queue_disable(&iommu->priq);
 }

 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -1494,6 +1643,15 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		return rc;

+	/* Allocate page request queue if ATS is supported */
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS) {
+		RISCV_IOMMU_QUEUE_INIT(&iommu->priq, PQ);
+		rc = riscv_iommu_queue_alloc(iommu, &iommu->priq,
+					     sizeof(struct riscv_iommu_pq_record));
+		if (rc)
+			return rc;
+	}
+
 	rc = riscv_iommu_queue_enable(iommu, &iommu->cmdq, riscv_iommu_cmdq_process);
 	if (rc)
 		return rc;
@@ -1502,6 +1660,15 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		goto err_queue_disable;

+	/* Enable page request queue if ATS is supported */
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS) {
+		rc = riscv_iommu_queue_enable(iommu, &iommu->priq,
+					      riscv_iommu_priq_process);
+		if (rc)
+			goto err_queue_disable;
+		dev_info(iommu->dev, "page request queue enabled\n");
+	}
+
 	rc = riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_MAX);
 	if (rc)
 		goto err_queue_disable;
@@ -1534,6 +1701,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 err_iodir_off:
 	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 err_queue_disable:
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS)
+		riscv_iommu_queue_disable(&iommu->priq);
 	riscv_iommu_queue_disable(&iommu->fltq);
 	riscv_iommu_queue_disable(&iommu->cmdq);
 	return rc;
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 46df79dd5495..5c5ab24539f2 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,6 +14,8 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/pci.h>
+#include <linux/pci-ats.h>

 #include "iommu-bits.h"

@@ -55,6 +57,7 @@ struct riscv_iommu_device {
 	/* hardware queues */
 	struct riscv_iommu_queue cmdq;
 	struct riscv_iommu_queue fltq;
+	struct riscv_iommu_queue priq;

 	/* device directory */
 	unsigned int ddt_mode;
--
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
