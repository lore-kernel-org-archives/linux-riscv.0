Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE19FC2BA12
	for <linux-riscv@archiver.kernel.org>; Sat, 15 Jun 2024 05:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MqqySYzRppcPioLJ/HyTb+gE3ksvFOWART9XPc0NdaM=; b=ZfRObeD4vWSF5L
	X+GDKPHR/eAMVIozQBsinytaHZnvfEtwbj1yvL/wL+hotMaO0YqrPCCABoFd2Qc5tI083YKjSAgg0
	KEvIoEskj6HNU13rAfdsxZXZ7smJoB5lGRzJBbhkakYXQwG+xXI/uQwghIyUawf/WavB/YNVpKPuT
	pxvA3B2QS7T5cSu8dCa/7PLP6uvcn43c40kqv5hpdCUBQKVEbhOb2M/2DC5weoURWabPpN98rQ0uY
	eWE1mdhZwY9/D0w0I8+UttP9+kaPnfcITn2xQc4KDvhWxPnPfL9bsgnI6Nc30KJQdKBQ3r/BCbw7r
	1wTHw7i1+P9zjqM5Ys0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sILxL-00000004iZp-22P9;
	Sat, 15 Jun 2024 05:28:03 +0000
Received: from mail-ot1-x32e.google.com ([2607:f8b0:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sILxG-00000004iXl-3zth
	for linux-riscv@lists.infradead.org;
	Sat, 15 Jun 2024 05:28:01 +0000
Received: by mail-ot1-x32e.google.com with SMTP id 46e09a7af769-6f977acff19so1314946a34.3
        for <linux-riscv@lists.infradead.org>; Fri, 14 Jun 2024 22:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1718429277; x=1719034077; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=inOXGNy811U5FqK2/VotX//GxEBcUKG77bY0K5QQOuo=;
        b=eou4cfYCd36bzcCVCvpCD5AQhc+5I6lMRm0m9bAKxPVYzWmLcLJnDgGphYchkpir0Z
         Rb4SqMH7Zx2+c0TNOQfUlw44/8XPF/0q4YS+aNy+crNZD3C42hbVObM1znmxPp9G8ptT
         lZ2AmKTxpmJq0sEazmrk0huEj4QuoLLwqZgdzYFfjRTWiV++Myt34uUvA+mXGW8eb3i9
         YZgEvKMUaP3K3PdY/1a6HsSZ3Oeu2ZhYCFd9iZQ+cbOpqty04I8ycBLW+oYTYahkK+Vh
         mE/et7fyWXy/FtBsFTn/t3EXJgTxohurLlc2iQs07ewu5rkIo2w+rJsE9/1lnp0v5esv
         xeCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718429277; x=1719034077;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=inOXGNy811U5FqK2/VotX//GxEBcUKG77bY0K5QQOuo=;
        b=bIbYBinaxLFH6lyz8E9Ww/Qx4QRQ60Os0W3G5/5pVw8QIF/6zGq2g8va8Zc27JI+dO
         sHxfT4HihVVMBVo/yipriXMeOVwkltHxngfY2/0bMMScnOeoHKDEuUn+W5nHMigtHNnd
         jh3MMx/sFnrbjHVCOuMYrHRyAuXDQXnwGneUlYfPDF140iKHnNfi8f0adUkI/QjmQjtP
         FAFhbI82vh8HkFMz5UGmwy16XcfPQVL+aqSasdVbrby2hX7VNibnO5fXbL7iRhaPXtns
         hF3oLG5ksD6uIOK2aSEKQPSTSWLlY1ci1hq0JYh1cVKP+roEPFp1DuU83ygxfu8jUuJH
         UQ4g==
X-Forwarded-Encrypted: i=1; AJvYcCUgOLil++b4O46J8Lq9c2eS1/u6Dk1mBDXsw6KIS/Qay5TdX+B2Pn8ozAy2Lv8NS2gtpjp4/Drb0uTVERczy5DIJZ8ztGqT3H+ooyosPrgA
X-Gm-Message-State: AOJu0YwXXjZZ73/+tnAiAKh+C1v1AU4n8aSHCkiKnAQBXp3HHlTLVKHF
	Kyqah0WMv7GViPHSChVDO2gvjk0Eo0fxf+MqsBiVOff0qak/0LOERH7ja9JLew8=
X-Google-Smtp-Source: AGHT+IFMaHYzxue9/SffDOD71MiEG2ZX+YwdZxpsrmqGrGrL0pkcbLY2p0NiiNUWWRqcjTCgc7RfWA==
X-Received: by 2002:a05:6870:858c:b0:254:c7f6:3294 with SMTP id 586e51a60fabf-25842ba533bmr5193165fac.47.1718429277407;
        Fri, 14 Jun 2024 22:27:57 -0700 (PDT)
Received: from tjeznach.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-705ccb6b99bsm4081578b3a.143.2024.06.14.22.27.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Jun 2024 22:27:56 -0700 (PDT)
From: Tomasz Jeznach <tjeznach@rivosinc.com>
To: Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Paul Walmsley <paul.walmsley@sifive.com>
Subject: [PATCH v8 5/7] iommu/riscv: Device directory management.
Date: Fri, 14 Jun 2024 22:27:35 -0700
Message-Id: <d93ce03d9c3d71aca3c8bab5b449a52596f1119a.1718388909.git.tjeznach@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1718388908.git.tjeznach@rivosinc.com>
References: <cover.1718388908.git.tjeznach@rivosinc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240614_222759_114044_5F4B5867 
X-CRM114-Status: GOOD (  33.52  )
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
Cc: Anup Patel <apatel@ventanamicro.com>, devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Albert Ou <aou@eecs.berkeley.edu>, Tomasz Jeznach <tjeznach@rivosinc.com>, linux@rivosinc.com, linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>, Sebastien Boeuf <seb@rivosinc.com>, iommu@lists.linux.dev, Palmer Dabbelt <palmer@dabbelt.com>, Zong Li <zong.li@sifive.com>, Nick Kossifidis <mick@ics.forth.gr>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-riscv@lists.infradead.org, Lu Baolu <baolu.lu@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce device context allocation and device directory tree
management including capabilities discovery sequence, as described
in Chapter 2.1 of the RISC-V IOMMU Architecture Specification.

Device directory mode will be auto detected using DDTP WARL property,
using highest mode supported by the driver and hardware. If none
supported can be configured, driver will fall back to global pass-through.

First level DDTP page can be located in I/O (detected using DDTP WARL)
and system memory.

Only simple identity and blocking protection domains are supported by
this implementation.

Co-developed-by: Nick Kossifidis <mick@ics.forth.gr>
Signed-off-by: Nick Kossifidis <mick@ics.forth.gr>
Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Tomasz Jeznach <tjeznach@rivosinc.com>
---
 drivers/iommu/riscv/iommu.c | 398 +++++++++++++++++++++++++++++++++++-
 drivers/iommu/riscv/iommu.h |   5 +
 2 files changed, 392 insertions(+), 11 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index c54088bf138f..d702c8f6ddf7 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -16,15 +16,168 @@
 #include <linux/crash_dump.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
+#include <linux/iopoll.h>
 #include <linux/kernel.h>
 #include <linux/pci.h>
 
+#include "../iommu-pages.h"
 #include "iommu-bits.h"
 #include "iommu.h"
 
 /* Timeouts in [us] */
 #define RISCV_IOMMU_DDTP_TIMEOUT	50000
 
+/* RISC-V IOMMU PPN <> PHYS address conversions, PHYS <=> PPN[53:10] */
+#define phys_to_ppn(pa)  (((pa) >> 2) & (((1ULL << 44) - 1) << 10))
+#define ppn_to_phys(pn)	 (((pn) << 2) & (((1ULL << 44) - 1) << 12))
+
+#define dev_to_iommu(dev) \
+	iommu_get_iommu_dev(dev, struct riscv_iommu_device, iommu)
+
+/* Device resource-managed allocations */
+struct riscv_iommu_devres {
+	void *addr;
+	int order;
+};
+
+static void riscv_iommu_devres_pages_release(struct device *dev, void *res)
+{
+	struct riscv_iommu_devres *devres = res;
+
+	iommu_free_pages(devres->addr, devres->order);
+}
+
+static int riscv_iommu_devres_pages_match(struct device *dev, void *res, void *p)
+{
+	struct riscv_iommu_devres *devres = res;
+	struct riscv_iommu_devres *target = p;
+
+	return devres->addr == target->addr;
+}
+
+static void *riscv_iommu_get_pages(struct riscv_iommu_device *iommu, int order)
+{
+	struct riscv_iommu_devres *devres;
+	void *addr;
+
+	addr = iommu_alloc_pages_node(dev_to_node(iommu->dev),
+				      GFP_KERNEL_ACCOUNT, order);
+	if (unlikely(!addr))
+		return NULL;
+
+	devres = devres_alloc(riscv_iommu_devres_pages_release,
+			      sizeof(struct riscv_iommu_devres), GFP_KERNEL);
+
+	if (unlikely(!devres)) {
+		iommu_free_pages(addr, order);
+		return NULL;
+	}
+
+	devres->addr = addr;
+	devres->order = order;
+
+	devres_add(iommu->dev, devres);
+
+	return addr;
+}
+
+static void riscv_iommu_free_pages(struct riscv_iommu_device *iommu, void *addr)
+{
+	struct riscv_iommu_devres devres = { .addr = addr };
+
+	devres_release(iommu->dev, riscv_iommu_devres_pages_release,
+		       riscv_iommu_devres_pages_match, &devres);
+}
+
+/* Lookup and initialize device context info structure. */
+static struct riscv_iommu_dc *riscv_iommu_get_dc(struct riscv_iommu_device *iommu,
+						 unsigned int devid)
+{
+	const bool base_format = !(iommu->caps & RISCV_IOMMU_CAPABILITIES_MSI_FLAT);
+	unsigned int depth;
+	unsigned long ddt, old, new;
+	void *ptr;
+	u8 ddi_bits[3] = { 0 };
+	u64 *ddtp = NULL;
+
+	/* Make sure the mode is valid */
+	if (iommu->ddt_mode < RISCV_IOMMU_DDTP_IOMMU_MODE_1LVL ||
+	    iommu->ddt_mode > RISCV_IOMMU_DDTP_IOMMU_MODE_3LVL)
+		return NULL;
+
+	/*
+	 * Device id partitioning for base format:
+	 * DDI[0]: bits 0 - 6   (1st level) (7 bits)
+	 * DDI[1]: bits 7 - 15  (2nd level) (9 bits)
+	 * DDI[2]: bits 16 - 23 (3rd level) (8 bits)
+	 *
+	 * For extended format:
+	 * DDI[0]: bits 0 - 5   (1st level) (6 bits)
+	 * DDI[1]: bits 6 - 14  (2nd level) (9 bits)
+	 * DDI[2]: bits 15 - 23 (3rd level) (9 bits)
+	 */
+	if (base_format) {
+		ddi_bits[0] = 7;
+		ddi_bits[1] = 7 + 9;
+		ddi_bits[2] = 7 + 9 + 8;
+	} else {
+		ddi_bits[0] = 6;
+		ddi_bits[1] = 6 + 9;
+		ddi_bits[2] = 6 + 9 + 9;
+	}
+
+	/* Make sure device id is within range */
+	depth = iommu->ddt_mode - RISCV_IOMMU_DDTP_IOMMU_MODE_1LVL;
+	if (devid >= (1 << ddi_bits[depth]))
+		return NULL;
+
+	/* Get to the level of the non-leaf node that holds the device context */
+	for (ddtp = iommu->ddt_root; depth-- > 0;) {
+		const int split = ddi_bits[depth];
+		/*
+		 * Each non-leaf node is 64bits wide and on each level
+		 * nodes are indexed by DDI[depth].
+		 */
+		ddtp += (devid >> split) & 0x1FF;
+
+		/*
+		 * Check if this node has been populated and if not
+		 * allocate a new level and populate it.
+		 */
+		do {
+			ddt = READ_ONCE(*(unsigned long *)ddtp);
+			if (ddt & RISCV_IOMMU_DDTE_V) {
+				ddtp = __va(ppn_to_phys(ddt));
+				break;
+			}
+
+			ptr = riscv_iommu_get_pages(iommu, 0);
+			if (!ptr)
+				return NULL;
+
+			new = phys_to_ppn(__pa(ptr)) | RISCV_IOMMU_DDTE_V;
+			old = cmpxchg_relaxed((unsigned long *)ddtp, ddt, new);
+
+			if (old == ddt) {
+				ddtp = (u64 *)ptr;
+				break;
+			}
+
+			/* Race setting DDT detected, re-read and retry. */
+			riscv_iommu_free_pages(iommu, ptr);
+		} while (1);
+	}
+
+	/*
+	 * Grab the node that matches DDI[depth], note that when using base
+	 * format the device context is 4 * 64bits, and the extended format
+	 * is 8 * 64bits, hence the (3 - base_format) below.
+	 */
+	ddtp += (devid & ((64 << base_format) - 1)) << (3 - base_format);
+
+	return (struct riscv_iommu_dc *)ddtp;
+}
+
 /*
  * This is best effort IOMMU translation shutdown flow.
  * Disable IOMMU without waiting for hardware response.
@@ -37,10 +190,201 @@ static void riscv_iommu_disable(struct riscv_iommu_device *iommu)
 	riscv_iommu_writel(iommu, RISCV_IOMMU_REG_PQCSR, 0);
 }
 
+#define riscv_iommu_read_ddtp(iommu) ({ \
+	u64 ddtp; \
+	riscv_iommu_readq_timeout((iommu), RISCV_IOMMU_REG_DDTP, ddtp, \
+				  !(ddtp & RISCV_IOMMU_DDTP_BUSY), 10, \
+				  RISCV_IOMMU_DDTP_TIMEOUT); \
+	ddtp; })
+
+static int riscv_iommu_iodir_alloc(struct riscv_iommu_device *iommu)
+{
+	u64 ddtp;
+	unsigned int mode;
+
+	ddtp = riscv_iommu_read_ddtp(iommu);
+	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
+		return -EBUSY;
+
+	/*
+	 * It is optional for the hardware to report a fixed address for device
+	 * directory root page when DDT.MODE is OFF or BARE.
+	 */
+	mode = FIELD_GET(RISCV_IOMMU_DDTP_IOMMU_MODE, ddtp);
+	if (mode == RISCV_IOMMU_DDTP_IOMMU_MODE_BARE ||
+	    mode == RISCV_IOMMU_DDTP_IOMMU_MODE_OFF) {
+		/* Use WARL to discover hardware fixed DDT PPN */
+		riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP,
+				   FIELD_PREP(RISCV_IOMMU_DDTP_IOMMU_MODE, mode));
+		ddtp = riscv_iommu_read_ddtp(iommu);
+		if (ddtp & RISCV_IOMMU_DDTP_BUSY)
+			return -EBUSY;
+
+		iommu->ddt_phys = ppn_to_phys(ddtp);
+		if (iommu->ddt_phys)
+			iommu->ddt_root = devm_ioremap(iommu->dev,
+						       iommu->ddt_phys, PAGE_SIZE);
+		if (iommu->ddt_root)
+			memset(iommu->ddt_root, 0, PAGE_SIZE);
+	}
+
+	if (!iommu->ddt_root) {
+		iommu->ddt_root = riscv_iommu_get_pages(iommu, 0);
+		iommu->ddt_phys = __pa(iommu->ddt_root);
+	}
+
+	if (!iommu->ddt_root)
+		return -ENOMEM;
+
+	return 0;
+}
+
+/*
+ * Discover supported DDT modes starting from requested value,
+ * configure DDTP register with accepted mode and root DDT address.
+ * Accepted iommu->ddt_mode is updated on success.
+ */
+static int riscv_iommu_iodir_set_mode(struct riscv_iommu_device *iommu,
+				      unsigned int ddtp_mode)
+{
+	struct device *dev = iommu->dev;
+	u64 ddtp, rq_ddtp;
+	unsigned int mode, rq_mode = ddtp_mode;
+
+	ddtp = riscv_iommu_read_ddtp(iommu);
+	if (ddtp & RISCV_IOMMU_DDTP_BUSY)
+		return -EBUSY;
+
+	/* Disallow state transition from xLVL to xLVL. */
+	mode = FIELD_GET(RISCV_IOMMU_DDTP_IOMMU_MODE, ddtp);
+	if (mode != RISCV_IOMMU_DDTP_IOMMU_MODE_BARE &&
+	    mode != RISCV_IOMMU_DDTP_IOMMU_MODE_OFF &&
+	    rq_mode != RISCV_IOMMU_DDTP_IOMMU_MODE_BARE &&
+	    rq_mode != RISCV_IOMMU_DDTP_IOMMU_MODE_OFF)
+		return -EINVAL;
+
+	do {
+		rq_ddtp = FIELD_PREP(RISCV_IOMMU_DDTP_IOMMU_MODE, rq_mode);
+		if (rq_mode > RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
+			rq_ddtp |= phys_to_ppn(iommu->ddt_phys);
+
+		riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP, rq_ddtp);
+		ddtp = riscv_iommu_read_ddtp(iommu);
+		if (ddtp & RISCV_IOMMU_DDTP_BUSY) {
+			dev_err(dev, "timeout when setting ddtp (ddt mode: %u, read: %llx)\n",
+				rq_mode, ddtp);
+			return -EBUSY;
+		}
+
+		/* Verify IOMMU hardware accepts new DDTP config. */
+		mode = FIELD_GET(RISCV_IOMMU_DDTP_IOMMU_MODE, ddtp);
+
+		if (rq_mode == mode)
+			break;
+
+		/* Hardware mandatory DDTP mode has not been accepted. */
+		if (rq_mode < RISCV_IOMMU_DDTP_IOMMU_MODE_1LVL && rq_ddtp != ddtp) {
+			dev_err(dev, "DDTP update failed hw: %llx vs %llx\n",
+				ddtp, rq_ddtp);
+			return -EINVAL;
+		}
+
+		/*
+		 * Mode field is WARL, an IOMMU may support a subset of
+		 * directory table levels in which case if we tried to set
+		 * an unsupported number of levels we'll readback either
+		 * a valid xLVL or off/bare. If we got off/bare, try again
+		 * with a smaller xLVL.
+		 */
+		if (mode < RISCV_IOMMU_DDTP_IOMMU_MODE_1LVL &&
+		    rq_mode > RISCV_IOMMU_DDTP_IOMMU_MODE_1LVL) {
+			dev_dbg(dev, "DDTP hw mode %u vs %u\n", mode, rq_mode);
+			rq_mode--;
+			continue;
+		}
+
+		/*
+		 * We tried all supported modes and IOMMU hardware failed to
+		 * accept new settings, something went very wrong since off/bare
+		 * and at least one xLVL must be supported.
+		 */
+		dev_err(dev, "DDTP hw mode %u, failed to set %u\n",
+			mode, ddtp_mode);
+		return -EINVAL;
+	} while (1);
+
+	iommu->ddt_mode = mode;
+	if (mode != ddtp_mode)
+		dev_dbg(dev, "DDTP hw mode %u, requested %u\n", mode, ddtp_mode);
+
+	return 0;
+}
+
+#define RISCV_IOMMU_FSC_BARE 0
+
+/*
+ * Update IODIR for the device.
+ *
+ * During the execution of riscv_iommu_probe_device(), IODIR entries are
+ * allocated for the device's identifiers.  Device context invalidation
+ * becomes necessary only if one of the updated entries was previously
+ * marked as valid, given that invalid device context entries are not
+ * cached by the IOMMU hardware.
+ * In this implementation, updating a valid device context while the
+ * device is not quiesced might be disruptive, potentially causing
+ * interim translation faults.
+ */
+static void riscv_iommu_iodir_update(struct riscv_iommu_device *iommu,
+				     struct device *dev, u64 fsc, u64 ta)
+{
+	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
+	struct riscv_iommu_dc *dc;
+	u64 tc;
+	int i;
+
+	/* Device context invalidation ignored for now. */
+
+	/*
+	 * For device context with DC_TC_PDTV = 0, translation attributes valid bit
+	 * is stored as DC_TC_V bit (both sharing the same location at BIT(0)).
+	 */
+	for (i = 0; i < fwspec->num_ids; i++) {
+		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+		tc = READ_ONCE(dc->tc);
+		tc |= ta & RISCV_IOMMU_DC_TC_V;
+
+		WRITE_ONCE(dc->fsc, fsc);
+		WRITE_ONCE(dc->ta, ta & RISCV_IOMMU_PC_TA_PSCID);
+		/* Update device context, write TC.V as the last step. */
+		dma_wmb();
+		WRITE_ONCE(dc->tc, tc);
+	}
+}
+
+static int riscv_iommu_attach_blocking_domain(struct iommu_domain *iommu_domain,
+					      struct device *dev)
+{
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
+	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, 0);
+
+	return 0;
+}
+
+static struct iommu_domain riscv_iommu_blocking_domain = {
+	.type = IOMMU_DOMAIN_BLOCKED,
+	.ops = &(const struct iommu_domain_ops) {
+		.attach_dev = riscv_iommu_attach_blocking_domain,
+	}
+};
+
 static int riscv_iommu_attach_identity_domain(struct iommu_domain *iommu_domain,
 					      struct device *dev)
 {
-	/* Global pass-through already enabled, do nothing for now. */
+	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
+
+	riscv_iommu_iodir_update(iommu, dev, RISCV_IOMMU_FSC_BARE, RISCV_IOMMU_PC_TA_V);
+
 	return 0;
 }
 
@@ -72,6 +416,9 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 {
 	struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
 	struct riscv_iommu_device *iommu;
+	struct riscv_iommu_dc *dc;
+	u64 tc;
+	int i;
 
 	if (!fwspec || !fwspec->iommu_fwnode->dev || !fwspec->num_ids)
 		return ERR_PTR(-ENODEV);
@@ -80,12 +427,37 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 	if (!iommu)
 		return ERR_PTR(-ENODEV);
 
+	/*
+	 * IOMMU hardware operating in fail-over BARE mode will provide
+	 * identity translation for all connected devices anyway...
+	 */
+	if (iommu->ddt_mode <= RISCV_IOMMU_DDTP_IOMMU_MODE_BARE)
+		return ERR_PTR(-ENODEV);
+
+	/*
+	 * Allocate and pre-configure device context entries in
+	 * the device directory. Do not mark the context valid yet.
+	 */
+	tc = 0;
+	if (iommu->caps & RISCV_IOMMU_CAPABILITIES_AMO_HWAD)
+		tc |= RISCV_IOMMU_DC_TC_SADE;
+	for (i = 0; i < fwspec->num_ids; i++) {
+		dc = riscv_iommu_get_dc(iommu, fwspec->ids[i]);
+		if (!dc)
+			return ERR_PTR(-ENODEV);
+		if (READ_ONCE(dc->tc) & RISCV_IOMMU_DC_TC_V)
+			dev_warn(dev, "already attached to IOMMU device directory\n");
+		WRITE_ONCE(dc->tc, tc);
+	}
+
 	return &iommu->iommu;
 }
 
 static const struct iommu_ops riscv_iommu_ops = {
 	.of_xlate = riscv_iommu_of_xlate,
 	.identity_domain = &riscv_iommu_identity_domain,
+	.blocked_domain = &riscv_iommu_blocking_domain,
+	.release_domain = &riscv_iommu_blocking_domain,
 	.def_domain_type = riscv_iommu_device_domain_type,
 	.device_group = riscv_iommu_device_group,
 	.probe_device = riscv_iommu_probe_device,
@@ -131,6 +503,7 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 {
 	iommu_device_unregister(&iommu->iommu);
 	iommu_device_sysfs_remove(&iommu->iommu);
+	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -141,19 +514,20 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	if (rc)
 		return dev_err_probe(iommu->dev, rc, "unexpected device state\n");
 
-	/*
-	 * Placeholder for a complete IOMMU device initialization.  For now,
-	 * only bare minimum: enable global identity mapping mode and register sysfs.
-	 */
-	riscv_iommu_writeq(iommu, RISCV_IOMMU_REG_DDTP,
-			   FIELD_PREP(RISCV_IOMMU_DDTP_IOMMU_MODE,
-				      RISCV_IOMMU_DDTP_IOMMU_MODE_BARE));
+	rc = riscv_iommu_iodir_alloc(iommu);
+	if (rc)
+		return rc;
+
+	rc = riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_MAX);
+	if (rc)
+		return rc;
 
 	rc = iommu_device_sysfs_add(&iommu->iommu, NULL, NULL, "riscv-iommu@%s",
 				    dev_name(iommu->dev));
-	if (rc)
-		return dev_err_probe(iommu->dev, rc,
-				     "cannot register sysfs interface\n");
+	if (rc) {
+		dev_err_probe(iommu->dev, rc, "cannot register sysfs interface\n");
+		goto err_iodir_off;
+	}
 
 	rc = iommu_device_register(&iommu->iommu, &riscv_iommu_ops, iommu->dev);
 	if (rc) {
@@ -165,5 +539,7 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 
 err_remove_sysfs:
 	iommu_device_sysfs_remove(&iommu->iommu);
+err_iodir_off:
+	riscv_iommu_iodir_set_mode(iommu, RISCV_IOMMU_DDTP_IOMMU_MODE_OFF);
 	return rc;
 }
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 700e33dc2446..f1696926582c 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -34,6 +34,11 @@ struct riscv_iommu_device {
 	/* available interrupt numbers, MSI or WSI */
 	unsigned int irqs[RISCV_IOMMU_INTR_COUNT];
 	unsigned int irqs_count;
+
+	/* device directory */
+	unsigned int ddt_mode;
+	dma_addr_t ddt_phys;
+	u64 *ddt_root;
 };
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
