Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF5B9CDB466
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 09:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lPtJLD4s7GndC9r4caAzSFxqmSYexORH3g2gfblhxc0=; b=cxPld5ndwXixs7
	IMUx37W7eYMypPn+9oMLsIGEg0v1QH3HK/WSMQh2bKv3wykY1xZ5fY7jDSKf5udqPydljgGUGAbsv
	tLfVpRg24XBCYvL1Ufwdd5QVkcPWGhgxeRClk5GA7n/C24rRTC+aE76IOdOSgx366oRRpq79dazDx
	Y2sFY+9OewPVZwlOl9owCs+JDyWYzRr0dvVxN2nQgEuPGQ1GQoQB04GS6k9tPdJRL7aQ/5G37nboS
	JMWmzZ2gB1jQcPia/F86lNTeQWuXT/CN9HJasM6eo1G2Wrqi9x1CAokKZxyleDsBlDX9m+PTO+RFz
	zZUCXIorIVJgqWP+F9gA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgTa-00000008umN-0rra;
	Thu, 25 Jun 2026 09:34:26 +0000
Received: from mail-pj2-x04.google.com ([2607:f8b0:4864:39::4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcgTX-00000008uls-3XKJ
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 09:34:24 +0000
Received: by mail-pj2-x04.google.com with SMTP id 98e67ed59e1d1-37dcc1ef35dso25958a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 25 Jun 2026 02:34:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782380063; x=1782984863; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s1qPFW7V6FcXhucM4uqGUnMjNmz8eHjPw7xkWHkZ93k=;
        b=Omihjx4LQ9S4ZDREXdlnpCndbRbqpr9iBs69A0b1483wxvfVXho6YBqH247kPxjTVW
         ZFmWseyUapjLVaAeaJrQKFH8QnJ8Z42uyNlb271vp1w6uvQKYxBMJdlZx0qs6oCUXP9r
         xZBGoNcCHKJCC3i0+stfhB4B6MskZk53M4814BCLdoV4zBPgFHx64ZTqDytQdIpIGWTV
         Uc1GQRerUt2oY/gAeEVdqV7vneLUDj10cMXvcw7B1tt0CEAsmLbdr0GoE6jPRyQwqUSL
         Ltt6NDx1ETK5vwQCI2EXkpxzZ6OCK+OsLNPZQYb7DSce6Qn3pJ4oVwLDxtzalQcEiEUn
         3qIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782380063; x=1782984863;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s1qPFW7V6FcXhucM4uqGUnMjNmz8eHjPw7xkWHkZ93k=;
        b=hjqiURKFtTjzSXV2Z6tvdT1LcpKI/smQIMx6Wd+srEA7wZ+LCB5kUx2b1hxzQPnNKi
         9B/uG9XM/CbsQf0Ieuj7tjIBaJ/gcrT2rwglF/lapmWIVWhTZZGlxdJL1YAzuk46VrI+
         O+8YXMSNlxnvUDPUHTQXYVASvwguyGVRpe8L7qc2QmRaC2GOrdjpSV+eqLLkpqj2PZET
         r7Orh1uGNlo1NJLLwV+SPXcjrF8vDEkJXutLMtnpscL/bnTIkUb362/ajzkPSCmvn0FX
         PWgJz3FETkDGMAY1OE95/4cfoTj76zGgfYJC1MfBsUP5wLPugDiRjaekAg74wlxLZnVV
         xutg==
X-Forwarded-Encrypted: i=1; AHgh+Rodq2CvgsAPkBuq7G8mn7HNxGIhpmoOKdagIf9VdwOF7BNR7bN+YfGYInXXVeCwkgGiLxlx3YpWlJG7XQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yw88kFldpW19kAwnS2BRavXjcvPNUT5A+RdOxCGjspLwPtuUI9k
	FZojkeIy4v5JJE+6zbJPqZzt1EFWHgX4u7YlUy3NIU2ziRPIaE60ZZff
X-Gm-Gg: AfdE7cnL6QhWgvAWeKtg+ySuFJa18ani7t/ktKzmLghJRSVfvarfhAuPQRc/yr3c9Oz
	4st6BDeps/nx2/m2a/IiCO63ycNryUXWwIcxo3s4BHowvCVQDHGclJshf5To6vX+u1J9JlLVDiW
	1K1uAQV953jlnjP9GL/QRAoXNYg9iAmAUevfaagWyFZmaE3yLXlw15ZyuYr3H4R5vqzrGwU/FEu
	qXSCETTl6o2rv8504gr2BmZ+toG4SXAz6HluNPHIku2elheYX5NkHj4vQk27VCnYKdn2GxAXQ+e
	iymfkB1jLTZu/HoXR/Bfpk6+Mf8wxlcB1GFaQ5riB48EylAuGaPi446W0lU/b4LQo9puO7McAee
	6rv2/Ala2Z98PpuII+8VX7D8ikxdyr0cc1oAqweKkX2T/hPPYuloIoqbZNJYfG7h3yeLWa7TWvI
	98KkuV/zQr39+gJnIpD89nK1iNq+Hl/Dh56Jjdsg==
X-Received: by 2002:a17:90b:3f4b:b0:369:1dbb:4732 with SMTP id 98e67ed59e1d1-37df8dc18a1mr1469532a91.0.1782380062722;
        Thu, 25 Jun 2026 02:34:22 -0700 (PDT)
Received: from q-System-Product-Name ([129.227.183.200])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37df400b68esm1473863a91.13.2026.06.25.02.34.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 02:34:22 -0700 (PDT)
From: "bingyu.xian" <shanbeeyoo@gmail.com>
To: tomasz.jeznach@linux.dev,
	joro@8bytes.org,
	will@kernel.org,
	palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu
Cc: iommu@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Bingyu Shan <shanbeeyoo@gmail.com>,
	Quan Zhou <zhouquan@iscas.ac.cn>
Subject: [PATCH 1/1] iommu/riscv: RFC: mark endpoint ATS-broken on ATS invalidation timeout
Date: Thu, 25 Jun 2026 17:34:16 +0800
Message-ID: <20260625093416.4023451-2-shanbeeyoo@gmail.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260625093416.4023451-1-shanbeeyoo@gmail.com>
References: <20260625093416.4023451-1-shanbeeyoo@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_023423_912370_C7BD95EA 
X-CRM114-Status: GOOD (  28.96  )
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

From: Bingyu Shan <shanbeeyoo@gmail.com>

A PCIe endpoint that fails to complete an ATS invalidation keeps stale ATC
entries and can keep DMA-ing through them. ARM SMMUv3 recently added handling
for this class of problem (ATC invalidation timeout / quarantine). The RISC-V
IOMMU driver currently has no such handling: riscv_iommu_cmd_sync() only logs
"Hardware error: command execution timeout" once and discards the failure,
with no attribution to a device and no policy response.

This RFC adds the first, conservative milestone:

  * On a command-queue timeout, read CQH to find the offending command. If it
    is an ATS.INVAL, extract its device-id (the RISC-V analog of ARM SMMUv3
    CERROR_ATC_INV_IDX) and schedule deferred marking.

  * The marking worker resolves the device-id back to a struct device, sets a
    per-device ats_broken flag, increments a counter, calls pci_disable_ats(),
    and logs "marked ATS-broken after ATS.INVAL timeout". It is deferred to a
    work item because cmd_sync() may run with only RCU held while the device
    lookup takes a sleeping mutex.

  * riscv_iommu_enable_pdev() refuses pci_enable_ats() for a device already
    marked ats_broken, so a broken endpoint is not put back on the ATS path.

  * Device tracking (the DID-keyed rbtree) previously happened only on the PRI
    enable/disable path, so ATS-only devices were never tracked and could not
    be attributed. Move registration to probe_device/release_device so ATS-only
    devices are tracked. add_device() now takes the iommu explicitly, because
    dev_to_iommu(dev) is not usable inside probe_device() (the iommu core only
    links dev->iommu after probe returns). Also fixes a latent duplicate-devid
    double-unlock in the rbtree insert.

  * Debugfs fault injection (inject_ats_inval_timeout) and a state table
    (ats_devices) so the marking path can be exercised. Real RISC-V IOMMU
    hardware and unmodified QEMU complete ATS.INVAL synchronously, so a native
    timeout cannot be reproduced against a real endpoint; the knob schedules
    the same worker the real cmd_sync() timeout path would.

Full quarantine and PCI reset recovery are intentionally left out of this step.

This RFC is based on the RISC-V IOMMU ATS support series in
tjeznach/riscv_iommu.next, because ATS support is not yet in the IOMMU tree.
It is intended to discuss timeout handling policy, not for immediate merge.
The single patch can be split (rbtree tracking / timeout marking / debugfs)
in a non-RFC version.

Validated on stock QEMU (-device virtio-net-pci,ats=on) with no QEMU changes:

  BEFORE                          AFTER
  0x18 0000:00:03.0 0 0   ->   0x18 0000:00:03.0 1 1
  virtio-pci 0000:00:03.0: marked ATS-broken after ATS.INVAL timeout

Assisted-by: YuanSheng: deepseek-v4-pro
Co-developed-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Quan Zhou <zhouquan@iscas.ac.cn>
Signed-off-by: Bingyu Shan <shanbeeyoo@gmail.com>
---
 drivers/iommu/riscv/iommu.c | 210 ++++++++++++++++++++++++++++++++++--
 drivers/iommu/riscv/iommu.h |   9 ++
 2 files changed, 210 insertions(+), 9 deletions(-)

diff --git a/drivers/iommu/riscv/iommu.c b/drivers/iommu/riscv/iommu.c
index 2249eea885cc..98f580dc5b49 100644
--- a/drivers/iommu/riscv/iommu.c
+++ b/drivers/iommu/riscv/iommu.c
@@ -14,14 +14,17 @@
 
 #include <linux/compiler.h>
 #include <linux/crash_dump.h>
+#include <linux/debugfs.h>
 #include <linux/init.h>
 #include <linux/iommu.h>
 #include <linux/iopoll.h>
 #include <linux/irqchip/riscv-imsic.h>
 #include <linux/kernel.h>
 #include <linux/mmu_notifier.h>
+#include <linux/mutex.h>
 #include <linux/pci.h>
 #include <linux/pci-ats.h>
+#include <linux/seq_file.h>
 
 #include "../iommu-pages.h"
 #include "iommu-bits.h"
@@ -492,12 +495,56 @@ static void riscv_iommu_cmd_send(struct riscv_iommu_device *iommu,
 	riscv_iommu_queue_send(&iommu->cmdq, cmd, sizeof(*cmd));
 }
 
-/* Send IOFENCE.C command and wait for all scheduled commands to complete. */
+static struct device *
+riscv_iommu_get_device(struct riscv_iommu_device *iommu, unsigned int devid);
+static void riscv_iommu_ats_broken_work(struct work_struct *work);
+
+/*
+ * Extract the device-id of the command that caused a command-queue timeout.
+ *
+ * On CQCSR.CMD_TO the hardware stops advancing CQH at the offending command,
+ * so reading CQH indexes the entry that timed out. If that entry is an
+ * ATS.INVAL, return its device-id; otherwise return an invalid id.
+ */
+static unsigned int riscv_iommu_cmd_timeout_devid(struct riscv_iommu_device *iommu)
+{
+	struct riscv_iommu_queue *q = &iommu->cmdq;
+	struct riscv_iommu_command *entry;
+	unsigned int head, devid;
+
+	if (riscv_iommu_readl_timeout(iommu, Q_HEAD(q), head,
+				      !(head & ~q->mask), 0, RISCV_IOMMU_QUEUE_TIMEOUT))
+		return UINT_MAX;
+
+	entry = q->base + (head & q->mask) * sizeof(*entry);
+
+	if (FIELD_GET(RISCV_IOMMU_CMD_OPCODE, entry->dword0) !=
+	    RISCV_IOMMU_CMD_ATS_OPCODE)
+		return UINT_MAX;
+
+	if (FIELD_GET(RISCV_IOMMU_CMD_FUNC, entry->dword0) !=
+	    RISCV_IOMMU_CMD_ATS_FUNC_INVAL)
+		return UINT_MAX;
+
+	devid = FIELD_GET(RISCV_IOMMU_CMD_ATS_RID, entry->dword0);
+	if (entry->dword0 & RISCV_IOMMU_CMD_ATS_DSV)
+		devid |= FIELD_GET(RISCV_IOMMU_CMD_ATS_DSEG, entry->dword0) << 16;
+
+	return devid;
+}
+
+/*
+ * Send IOFENCE.C command and wait for all scheduled commands to complete.
+ *
+ * On a command execution timeout, attribute the failure to a device when the
+ * offending command is an ATS.INVAL, and schedule deferred ATS-broken marking
+ * (the device lookup takes a sleeping mutex, while the caller may hold RCU).
+ */
 static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 				 unsigned int timeout_us)
 {
 	struct riscv_iommu_command cmd;
-	unsigned int prod;
+	unsigned int prod, devid;
 
 	riscv_iommu_cmd_iofence(&cmd);
 	prod = riscv_iommu_queue_send(&iommu->cmdq, &cmd, sizeof(cmd));
@@ -508,6 +555,14 @@ static void riscv_iommu_cmd_sync(struct riscv_iommu_device *iommu,
 	if (riscv_iommu_queue_wait(&iommu->cmdq, prod, timeout_us))
 		dev_err_once(iommu->dev,
 			     "Hardware error: command execution timeout\n");
+	else
+		return;
+
+	devid = riscv_iommu_cmd_timeout_devid(iommu);
+	if (devid != UINT_MAX) {
+		iommu->ats_broken_devid = devid;
+		schedule_work(&iommu->ats_broken_work);
+	}
 }
 
 /*
@@ -959,11 +1014,13 @@ struct riscv_iommu_info {
 	u32 devid;		/* device identifier, assuming iommu_fwspec->num_ids == 1 */
 	u8 ats_supported:1;
 	u8 ats_enabled:1;
+	u8 ats_broken:1;	/* ATS disabled due to ATS.INVAL timeout, do not re-enable */
 	u8 pasid_supported:1;
 	u8 pasid_enabled:1;
 	u8 pri_supported:1;
 	u8 pri_enabled:1;
 	u8 pri_pasid_required:1;
+	unsigned int ats_inval_timeouts;
 };
 
 /*
@@ -1058,10 +1115,17 @@ static void riscv_iommu_bond_unlink(struct riscv_iommu_domain *domain,
 	}
 }
 
-/* Register device for IOMMU device-id based tracking. */
-static void riscv_iommu_add_device(struct device *dev)
+/*
+ * Register device for IOMMU device-id based tracking.
+ *
+ * Takes the iommu explicitly: at probe time dev_to_iommu(dev) is not usable
+ * yet, because the iommu core only links dev->iommu after probe_device()
+ * returns. Tracking is bound to probe/release so ATS-only devices (which
+ * never enable PRI) are tracked as well.
+ */
+static void riscv_iommu_add_device(struct riscv_iommu_device *iommu,
+				   struct device *dev)
 {
-	struct riscv_iommu_device *iommu = dev_to_iommu(dev);
 	struct riscv_iommu_info *info, *rb_info;
 	struct rb_node **new_node, *parent_node = NULL;
 
@@ -1077,7 +1141,9 @@ static void riscv_iommu_add_device(struct device *dev)
 		} else if (rb_info->devid < info->devid) {
 			new_node = &((*new_node)->rb_right);
 		} else {
+			/* Already tracked, nothing to do. */
 			mutex_unlock(&iommu->devs_mutex);
+			return;
 		}
 	}
 
@@ -1127,6 +1193,115 @@ static struct device *riscv_iommu_get_device(struct riscv_iommu_device *iommu,
 	return dev;
 }
 
+/*
+ * Mark an endpoint ATS-broken after an ATS invalidation timeout.
+ *
+ * A device that fails to complete an ATS invalidation keeps stale ATC entries
+ * and can keep DMA-ing through them. Mirroring the ARM SMMUv3 ATC invalidation
+ * timeout handling, disable ATS on the offending endpoint and refuse to
+ * re-enable it, so the IOMMU no longer relies on the device's ATC being
+ * coherent. Full quarantine / reset recovery is intentionally left out of this
+ * first step.
+ *
+ * The device lookup takes the sleeping devs_mutex, so the marking is deferred
+ * to this work item from riscv_iommu_cmd_sync(), which may run with only RCU
+ * held. It also serves the debugfs fault-injection path.
+ */
+static void riscv_iommu_ats_broken_work(struct work_struct *work)
+{
+	struct riscv_iommu_device *iommu =
+		container_of(work, struct riscv_iommu_device, ats_broken_work);
+	struct device *dev = riscv_iommu_get_device(iommu, iommu->ats_broken_devid);
+	struct riscv_iommu_info *info;
+	struct pci_dev *pdev;
+
+	if (!dev)
+		return;
+
+	info = dev_iommu_priv_get(dev);
+	info->ats_broken = true;
+	info->ats_inval_timeouts++;
+
+	if (info->ats_enabled && dev_is_pci(dev)) {
+		pdev = to_pci_dev(dev);
+		pci_disable_ats(pdev);
+		info->ats_enabled = false;
+	}
+
+	dev_warn(dev, "marked ATS-broken after ATS.INVAL timeout\n");
+	put_device(dev);
+}
+
+#ifdef CONFIG_DEBUG_FS
+/*
+ * Debugfs fault injection.
+ *
+ * Real RISC-V IOMMU hardware completes ATS.INVAL synchronously, so a timeout
+ * cannot be reproduced against an unmodified endpoint. To exercise the
+ * ATS-broken marking path in isolation, this knob records the target device-id
+ * and schedules the same deferred marking that the real cmd_sync() timeout path
+ * would. It does not depend on QEMU fault injection.
+ */
+static int riscv_iommu_debugfs_inject_ats_timeout(void *data, u64 devid)
+{
+	struct riscv_iommu_device *iommu = data;
+
+	if (!(iommu->caps & RISCV_IOMMU_CAPABILITIES_ATS))
+		return -ENOTSUPP;
+
+	iommu->ats_broken_devid = (unsigned int)devid;
+	schedule_work(&iommu->ats_broken_work);
+
+	return 0;
+}
+DEFINE_DEBUGFS_ATTRIBUTE(riscv_iommu_debugfs_inject_ats_fops, NULL,
+			riscv_iommu_debugfs_inject_ats_timeout, "%llu\n");
+
+static int riscv_iommu_debugfs_ats_devices_show(struct seq_file *s, void *data)
+{
+	struct riscv_iommu_device *iommu = s->private;
+	struct rb_node *node;
+
+	seq_puts(s, "devid device ats_broken ats_inval_timeouts\n");
+
+	mutex_lock(&iommu->devs_mutex);
+	for (node = rb_first(&iommu->devs); node; node = rb_next(node)) {
+		struct riscv_iommu_info *info =
+			rb_entry(node, struct riscv_iommu_info, node);
+
+		seq_printf(s, "0x%x %s %d %u\n", info->devid,
+			   dev_name(info->dev), info->ats_broken,
+			   info->ats_inval_timeouts);
+	}
+	mutex_unlock(&iommu->devs_mutex);
+
+	return 0;
+}
+DEFINE_SHOW_ATTRIBUTE(riscv_iommu_debugfs_ats_devices);
+
+static void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu)
+{
+	struct dentry *root;
+
+	root = debugfs_create_dir(dev_name(iommu->dev), NULL);
+	iommu->debugfs = root;
+
+	debugfs_create_file("inject_ats_inval_timeout", 0200, root, iommu,
+			    &riscv_iommu_debugfs_inject_ats_fops);
+	debugfs_create_file("ats_devices", 0400, root, iommu,
+			    &riscv_iommu_debugfs_ats_devices_fops);
+}
+
+static void riscv_iommu_debugfs_remove(struct riscv_iommu_device *iommu)
+{
+	debugfs_remove_recursive(iommu->debugfs);
+	iommu->debugfs = NULL;
+}
+#else
+static inline void riscv_iommu_debugfs_init(struct riscv_iommu_device *iommu) { }
+static inline void riscv_iommu_debugfs_remove(struct riscv_iommu_device *iommu) { }
+#endif
+
 static void riscv_iommu_page_response(struct device *dev,
 				      struct iopf_fault *evt,
 				      struct iommu_page_response *msg)
@@ -1237,8 +1412,6 @@ static int riscv_iommu_dev_enable_iopf(struct device *dev)
 	if (info->pri_enabled)
 		return -EBUSY;
 
-	riscv_iommu_add_device(dev);
-
 #ifdef CONFIG_PCI_PRI
 	rc = pci_reset_pri(to_pci_dev(dev));
 	if (rc)
@@ -1275,8 +1448,6 @@ static int riscv_iommu_dev_disable_iopf(struct device *dev)
 	info->pri_enabled = false;
 	pci_disable_pri(to_pci_dev(dev));
 	iopf_queue_remove_device(iommu->pq_work, dev);
-
-	riscv_iommu_del_device(dev);
 #endif
 
 	return 0;
@@ -1287,6 +1458,11 @@ static void riscv_iommu_enable_pdev(struct pci_dev *pdev)
 {
 	struct riscv_iommu_info *info = dev_iommu_priv_get(&pdev->dev);
 
+	if (info->ats_broken) {
+		pci_warn(pdev, "ATS disabled: device marked ATS-broken after ATS.INVAL timeout\n");
+		return;
+	}
+
 	if (info->ats_supported)
 		info->ats_enabled = !pci_enable_ats(pdev, PAGE_SHIFT);
 }
@@ -2270,6 +2446,14 @@ static struct iommu_device *riscv_iommu_probe_device(struct device *dev)
 
 	dev_iommu_priv_set(dev, info);
 
+	/*
+	 * Track the device by its device-id so that ATS invalidation timeouts
+	 * (and PRI page requests) can be attributed back to a struct device.
+	 * Registration is bound to probe/release, not to PRI enable, so that
+	 * ATS-only devices are tracked as well.
+	 */
+	riscv_iommu_add_device(iommu, dev);
+
 	return &iommu->iommu;
 }
 
@@ -2277,6 +2461,8 @@ static void riscv_iommu_release_device(struct device *dev)
 {
 	struct riscv_iommu_info *info = dev_iommu_priv_get(dev);
 
+	riscv_iommu_del_device(dev);
+
 	if (info->pasid_enabled) {
 		pci_disable_pasid(to_pci_dev(dev));
 	}
@@ -2379,6 +2565,9 @@ void riscv_iommu_remove(struct riscv_iommu_device *iommu)
 	riscv_iommu_queue_disable(&iommu->fltq);
 	riscv_iommu_queue_disable(&iommu->priq);
 	iopf_queue_free(iommu->pq_work);
+	riscv_iommu_debugfs_remove(iommu);
+	/* Flush any pending ATS-broken marking before the device goes away. */
+	cancel_work_sync(&iommu->ats_broken_work);
 }
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu)
@@ -2389,6 +2578,7 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 	RISCV_IOMMU_QUEUE_INIT(&iommu->fltq, FQ);
 	RISCV_IOMMU_QUEUE_INIT(&iommu->priq, PQ);
 	mutex_init(&iommu->devs_mutex);
+	INIT_WORK(&iommu->ats_broken_work, riscv_iommu_ats_broken_work);
 
 	rc = riscv_iommu_init_check(iommu);
 	if (rc)
@@ -2444,6 +2634,8 @@ int riscv_iommu_init(struct riscv_iommu_device *iommu)
 		goto err_remove_sysfs;
 	}
 
+	riscv_iommu_debugfs_init(iommu);
+
 	return 0;
 
 err_remove_sysfs:
diff --git a/drivers/iommu/riscv/iommu.h b/drivers/iommu/riscv/iommu.h
index 498d9c645fb5..5ac86efc123a 100644
--- a/drivers/iommu/riscv/iommu.h
+++ b/drivers/iommu/riscv/iommu.h
@@ -14,9 +14,11 @@
 #include <linux/iommu.h>
 #include <linux/types.h>
 #include <linux/iopoll.h>
+#include <linux/workqueue.h>
 
 #include "iommu-bits.h"
 
+struct dentry;
 struct riscv_iommu_device;
 
 struct riscv_iommu_queue {
@@ -67,6 +69,13 @@ struct riscv_iommu_device {
 	/* Connected end-points */
 	struct rb_root devs;
 	struct mutex devs_mutex;
+
+	/* debugfs interface */
+	struct dentry *debugfs;
+
+	/* Deferred ATS-broken marking, see riscv_iommu_cmd_timeout() */
+	struct work_struct ats_broken_work;
+	unsigned int ats_broken_devid;
 };
 
 int riscv_iommu_init(struct riscv_iommu_device *iommu);
-- 
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
