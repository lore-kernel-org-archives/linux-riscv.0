Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC06AC7EE33
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Jun 2025 13:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:References:Cc:To:In-Reply-To:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=f7Dmuxon320TM+XkHJf4RPoACp7fPx7ihoNur2dvMDE=; b=d/qEsGPIM0Br+y
	ciiL4Xyq0y6mmQdE3L7Rnu34vEdTMmekzyD9UdQUKkJSnV62eymmYxnb75N6wNCnomYbQpqIYJ8+U
	6bDdzKGjRjDdiS9ZGUV2AsSpG6itwAyQjggJSOgvwqXS5ZJSl2papUzSDN4Enkj4vqggJnVNxNwtV
	2LZCO2oBlC5zbRHW1zGiX0JpBjWgYFlDq/DPX9zGB2aagXtlDJnbiAJdKxLGQ7IpSkark1uJTOfut
	xHd82ST5vfeze8+h0q/3IRb+vUpxm+N8bsQkNbSjI6+bCKx7yXfWiR2Bg6Pfstf5KOKVpzMTlc1ny
	Mr3AnMid75dm3QNGh9kQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTh31-00000002qHn-42Br;
	Mon, 23 Jun 2025 13:17:19 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbO-00000002XUJ-20VQ
	for linux-riscv@bombadil.infradead.org;
	Mon, 23 Jun 2025 11:44:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=References:Content-Type:Cc:To:
	In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Rj7R0jtm/OqxhKqDgLBDqK/E3xCykvkcK3rjLxTG3bg=; b=WiUir9h37K+gJzM2OvOs9SUNEn
	uV17OypS4N7XxNrd+Jz1trVm6nJnuyxw72X61EzJFZchv5opfqx+pQN4kYQkzyzGZcJ2Tj6M5tr/Q
	eXcjtmwlW9tqma2Z4/OzzGvqXBoemeIG62zmMCxU9u2GZstjvWgp3aOWBH3I2FsXhUN87RZ5uzvId
	92BFV084UC8pMus6WDqSOgisJb4R5lNuVBgxBI9ytFp15FsguE3cS+/7r/wEAR7Rwlo6TiOzwr6q5
	rxjEXeWOEIJ4ymO/TxQJCjcB0/ZUJJ21l9L/dpgPN8Aj+esZK6e5uK15LXSXxsbGy0i3+Nrbi8J43
	nNRhwzrA==;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTfbL-00000005Cd8-0w0j
	for linux-riscv@lists.infradead.org;
	Mon, 23 Jun 2025 11:44:41 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250623114434euoutp02cabd2d966408fca6c36b22b4d31d7bb9~LqVfJgoWV1537015370euoutp02L
	for <linux-riscv@lists.infradead.org>; Mon, 23 Jun 2025 11:44:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250623114434euoutp02cabd2d966408fca6c36b22b4d31d7bb9~LqVfJgoWV1537015370euoutp02L
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750679074;
	bh=Rj7R0jtm/OqxhKqDgLBDqK/E3xCykvkcK3rjLxTG3bg=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=c9GEN4LLOI1gwSXtuvBQ9lK8myj8fdTl8CnlvLgSbZ8BZTXvhvs+VdAtXIf4/sYzW
	 oRG1Yy6SxGkqA+azfkJpv+zOErHYU5JgfFZMl7/PuFNYKJ1e6vnnCTUpXc0zEmsB8U
	 pHGZoxZiG8hkpdNQkxHqRdfLyFl1vrPkSyCqzbJE=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2~LqVefSZLM1347313473eucas1p1h;
	Mon, 23 Jun 2025 11:44:33 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250623114432eusmtip17cc43a0ff0d845139e39aa6b61cfe777~LqVdbwSyx1396413964eusmtip1I;
	Mon, 23 Jun 2025 11:44:32 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Mon, 23 Jun 2025 13:42:42 +0200
Subject: [PATCH v6 4/8] drm/imagination: Use pwrseq for TH1520 GPU power
 management
MIME-Version: 1.0
Message-Id: <20250623-apr_14_for_sending-v6-4-6583ce0f6c25@samsung.com>
In-Reply-To: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>,  Fu Wei
	<wefu@redhat.com>, Rob Herring <robh@kernel.org>,  Krzysztof Kozlowski
	<krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>,  Michal
	Wilczynski <m.wilczynski@samsung.com>,  Bartosz Golaszewski <brgl@bgdev.pl>,
	Philipp Zabel <p.zabel@pengutronix.de>,  Frank Binns
	<frank.binns@imgtec.com>, Matt Coster <matt.coster@imgtec.com>,  Maarten
	Lankhorst <maarten.lankhorst@linux.intel.com>,  Maxime Ripard
	<mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,  David Airlie
	<airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,  Paul Walmsley
	<paul.walmsley@sifive.com>,  Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>,  Alexandre Ghiti <alex@ghiti.fr>, Ulf Hansson
	<ulf.hansson@linaro.org>,  Marek Szyprowski <m.szyprowski@samsung.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	dri-devel@lists.freedesktop.org,  Bartosz Golaszewski
	<bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2
X-Msg-Generator: CA
X-RootMTR: 20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2
X-EPHeader: CA
X-CMS-RootMailID: 20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2
References: <20250623-apr_14_for_sending-v6-0-6583ce0f6c25@samsung.com>
	<CGME20250623114433eucas1p1659c22d6696f3eb51d4169eee80b7cb2@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_124439_688284_EFD44F6C 
X-CRM114-Status: GOOD (  33.63  )
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

Update the Imagination PVR DRM driver to leverage the pwrseq framework
for managing the power sequence of the GPU on the T-HEAD TH1520 SoC.

To cleanly handle the TH1520's specific power requirements in the
generic driver, this patch implements the "driver match data" pattern.
The pvr_soc_data struct, associated with a compatible string in the
of_device_id table, now holds pointers to platform-specific power_on and
power_off functions.

At probe time, the driver inspects the assigned power_on function
pointer. If it points to the pwrseq variant, the driver calls
devm_pwrseq_get("gpu-power"), requiring a valid sequencer and deferring
probe on failure. Otherwise, it falls back to its standard manual reset
initialization.

The runtime PM callbacks, pvr_power_device_resume() and
pvr_power_device_suspend(), call the power_on and power_off function
pointers. Helper functions for both manual and pwrseq-based sequences
are introduced to support this.

Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 drivers/gpu/drm/imagination/Kconfig      |   1 +
 drivers/gpu/drm/imagination/pvr_device.c |  31 +++++++--
 drivers/gpu/drm/imagination/pvr_device.h |  19 ++++++
 drivers/gpu/drm/imagination/pvr_drv.c    |  30 ++++++++-
 drivers/gpu/drm/imagination/pvr_power.c  | 112 ++++++++++++++++++++-----------
 drivers/gpu/drm/imagination/pvr_power.h  |   6 ++
 6 files changed, 152 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/imagination/Kconfig b/drivers/gpu/drm/imagination/Kconfig
index 3bfa2ac212dccb73c53bdc2bc259bcba636e7cfc..5f9fff43d6baadc42ebf48d91729bfbf27e06caa 100644
--- a/drivers/gpu/drm/imagination/Kconfig
+++ b/drivers/gpu/drm/imagination/Kconfig
@@ -11,6 +11,7 @@ config DRM_POWERVR
 	select DRM_SCHED
 	select DRM_GPUVM
 	select FW_LOADER
+	select POWER_SEQUENCING
 	help
 	  Choose this option if you have a system that has an Imagination
 	  Technologies PowerVR (Series 6 or later) or IMG GPU.
diff --git a/drivers/gpu/drm/imagination/pvr_device.c b/drivers/gpu/drm/imagination/pvr_device.c
index 8b9ba4983c4cb5bc40342fcafc4259078bc70547..c1c24c441c821ccce59f7cd3f14544a91ef54ea9 100644
--- a/drivers/gpu/drm/imagination/pvr_device.c
+++ b/drivers/gpu/drm/imagination/pvr_device.c
@@ -23,8 +23,10 @@
 #include <linux/firmware.h>
 #include <linux/gfp.h>
 #include <linux/interrupt.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/stddef.h>
@@ -618,6 +620,9 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	struct device *dev = drm_dev->dev;
 	int err;
 
+	/* Get the platform-specific data based on the compatible string. */
+	pvr_dev->soc_data = of_device_get_match_data(dev);
+
 	/*
 	 * Setup device parameters. We do this first in case other steps
 	 * depend on them.
@@ -631,10 +636,28 @@ pvr_device_init(struct pvr_device *pvr_dev)
 	if (err)
 		return err;
 
-	/* Get the reset line for the GPU */
-	err = pvr_device_reset_init(pvr_dev);
-	if (err)
-		return err;
+	/*
+	 * For platforms that require it, get the power sequencer.
+	 * For all others, perform manual reset initialization.
+	 */
+	if (pvr_dev->soc_data->power_on == pvr_power_on_sequence_pwrseq) {
+		pvr_dev->pwrseq = devm_pwrseq_get(dev, "gpu-power");
+		if (IS_ERR(pvr_dev->pwrseq)) {
+			/*
+			 * This platform requires a sequencer. If we can't get
+			 * it, we must return the error (including -EPROBE_DEFER
+			 * to wait for the provider to appear)
+			 */
+			return dev_err_probe(
+				dev, PTR_ERR(pvr_dev->pwrseq),
+				"Failed to get required power sequencer\n");
+		}
+	} else {
+		/* This platform does not use a sequencer, init reset manually. */
+		err = pvr_device_reset_init(pvr_dev);
+		if (err)
+			return err;
+	}
 
 	/* Explicitly power the GPU so we can access control registers before the FW is booted. */
 	err = pm_runtime_resume_and_get(dev);
diff --git a/drivers/gpu/drm/imagination/pvr_device.h b/drivers/gpu/drm/imagination/pvr_device.h
index 7cb01c38d2a9c3fc71effe789d4dfe54eddd93ee..3f35025e84efac031d3261c849ef9fe105466423 100644
--- a/drivers/gpu/drm/imagination/pvr_device.h
+++ b/drivers/gpu/drm/imagination/pvr_device.h
@@ -37,6 +37,9 @@ struct clk;
 /* Forward declaration from <linux/firmware.h>. */
 struct firmware;
 
+/* Forward declaration from <linux/pwrseq/consumer.h */
+struct pwrseq_desc;
+
 /**
  * struct pvr_gpu_id - Hardware GPU ID information for a PowerVR device
  * @b: Branch ID.
@@ -57,6 +60,16 @@ struct pvr_fw_version {
 	u16 major, minor;
 };
 
+/**
+ * struct pvr_soc_data - Platform specific data associated with a compatible string.
+ * @power_on: Pointer to the platform-specific power on function.
+ * @power_off: Pointer to the platform-specific power off function.
+ */
+struct pvr_soc_data {
+	int (*power_on)(struct pvr_device *pvr_dev);
+	int (*power_off)(struct pvr_device *pvr_dev);
+};
+
 /**
  * struct pvr_device - powervr-specific wrapper for &struct drm_device
  */
@@ -98,6 +111,9 @@ struct pvr_device {
 	/** @fw_version: Firmware version detected at runtime. */
 	struct pvr_fw_version fw_version;
 
+	/** @soc_data: Pointer to platform-specific quirk data. */
+	const struct pvr_soc_data *soc_data;
+
 	/** @regs_resource: Resource representing device control registers. */
 	struct resource *regs_resource;
 
@@ -148,6 +164,9 @@ struct pvr_device {
 	 */
 	struct reset_control *reset;
 
+	/** @pwrseq: Pointer to a power sequencer, if one is used. */
+	struct pwrseq_desc *pwrseq;
+
 	/** @irq: IRQ number. */
 	int irq;
 
diff --git a/drivers/gpu/drm/imagination/pvr_drv.c b/drivers/gpu/drm/imagination/pvr_drv.c
index b058ec183bb30ab5c3db17ebaadf2754520a2a1f..97ccf4a73964ed3752ed1a798231c41cc5c70030 100644
--- a/drivers/gpu/drm/imagination/pvr_drv.c
+++ b/drivers/gpu/drm/imagination/pvr_drv.c
@@ -1481,14 +1481,39 @@ static void pvr_remove(struct platform_device *plat_dev)
 }
 
 static const struct of_device_id dt_match[] = {
-	{ .compatible = "img,img-rogue", .data = NULL },
+	{
+		.compatible = "thead,th1520-gpu",
+		.data =
+			&(struct pvr_soc_data)
+			{
+				.power_on = pvr_power_on_sequence_pwrseq,
+				.power_off = pvr_power_off_sequence_pwrseq,
+			},
+	},
+	{
+		.compatible = "img,img-rogue",
+		.data =
+			&(struct pvr_soc_data)
+			{
+				.power_on = pvr_power_on_sequence_manual,
+				.power_off = pvr_power_off_sequence_manual,
+			},
+	},
 
 	/*
 	 * This legacy compatible string was introduced early on before the more generic
 	 * "img,img-rogue" was added. Keep it around here for compatibility, but never use
 	 * "img,img-axe" in new devicetrees.
 	 */
-	{ .compatible = "img,img-axe", .data = NULL },
+	{
+		.compatible = "img,img-axe",
+		.data =
+			&(struct pvr_soc_data)
+			{
+				.power_on = pvr_power_on_sequence_manual,
+				.power_off = pvr_power_off_sequence_manual,
+			},
+	},
 	{}
 };
 MODULE_DEVICE_TABLE(of, dt_match);
@@ -1513,4 +1538,5 @@ MODULE_DESCRIPTION(PVR_DRIVER_DESC);
 MODULE_LICENSE("Dual MIT/GPL");
 MODULE_IMPORT_NS("DMA_BUF");
 MODULE_FIRMWARE("powervr/rogue_33.15.11.3_v1.fw");
+MODULE_FIRMWARE("powervr/rogue_36.52.104.182_v1.fw");
 MODULE_FIRMWARE("powervr/rogue_36.53.104.796_v1.fw");
diff --git a/drivers/gpu/drm/imagination/pvr_power.c b/drivers/gpu/drm/imagination/pvr_power.c
index 41f5d89e78b854cf6993838868a4416a220b490a..49b66856b9916b1d13efcc3db739de9be2de56b6 100644
--- a/drivers/gpu/drm/imagination/pvr_power.c
+++ b/drivers/gpu/drm/imagination/pvr_power.c
@@ -18,6 +18,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_runtime.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/reset.h>
 #include <linux/timer.h>
 #include <linux/types.h>
@@ -234,6 +235,71 @@ pvr_watchdog_init(struct pvr_device *pvr_dev)
 	return 0;
 }
 
+int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev)
+{
+	return pwrseq_power_on(pvr_dev->pwrseq);
+}
+
+int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev)
+{
+	return pwrseq_power_off(pvr_dev->pwrseq);
+}
+
+int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	err = clk_prepare_enable(pvr_dev->core_clk);
+	if (err)
+		return err;
+
+	err = clk_prepare_enable(pvr_dev->sys_clk);
+	if (err)
+		goto err_core_clk_disable;
+
+	err = clk_prepare_enable(pvr_dev->mem_clk);
+	if (err)
+		goto err_sys_clk_disable;
+
+	/*
+	 * According to the hardware manual, a delay of at least 32 clock
+	 * cycles is required between de-asserting the clkgen reset and
+	 * de-asserting the GPU reset. Assuming a worst-case scenario with
+	 * a very high GPU clock frequency, a delay of 1 microsecond is
+	 * sufficient to ensure this requirement is met across all
+	 * feasible GPU clock speeds.
+	 */
+	udelay(1);
+
+	err = reset_control_deassert(pvr_dev->reset);
+	if (err)
+		goto err_mem_clk_disable;
+
+	return 0;
+
+err_mem_clk_disable:
+	clk_disable_unprepare(pvr_dev->mem_clk);
+err_sys_clk_disable:
+	clk_disable_unprepare(pvr_dev->sys_clk);
+err_core_clk_disable:
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	return err;
+}
+
+int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev)
+{
+	int err;
+
+	err = reset_control_assert(pvr_dev->reset);
+
+	clk_disable_unprepare(pvr_dev->mem_clk);
+	clk_disable_unprepare(pvr_dev->sys_clk);
+	clk_disable_unprepare(pvr_dev->core_clk);
+
+	return err;
+}
+
 int
 pvr_power_device_suspend(struct device *dev)
 {
@@ -252,11 +318,7 @@ pvr_power_device_suspend(struct device *dev)
 			goto err_drm_dev_exit;
 	}
 
-	clk_disable_unprepare(pvr_dev->mem_clk);
-	clk_disable_unprepare(pvr_dev->sys_clk);
-	clk_disable_unprepare(pvr_dev->core_clk);
-
-	err = reset_control_assert(pvr_dev->reset);
+	err = pvr_dev->soc_data->power_off(pvr_dev);
 
 err_drm_dev_exit:
 	drm_dev_exit(idx);
@@ -276,54 +338,22 @@ pvr_power_device_resume(struct device *dev)
 	if (!drm_dev_enter(drm_dev, &idx))
 		return -EIO;
 
-	err = clk_prepare_enable(pvr_dev->core_clk);
+	err = pvr_dev->soc_data->power_on(pvr_dev);
 	if (err)
 		goto err_drm_dev_exit;
 
-	err = clk_prepare_enable(pvr_dev->sys_clk);
-	if (err)
-		goto err_core_clk_disable;
-
-	err = clk_prepare_enable(pvr_dev->mem_clk);
-	if (err)
-		goto err_sys_clk_disable;
-
-	/*
-	 * According to the hardware manual, a delay of at least 32 clock
-	 * cycles is required between de-asserting the clkgen reset and
-	 * de-asserting the GPU reset. Assuming a worst-case scenario with
-	 * a very high GPU clock frequency, a delay of 1 microsecond is
-	 * sufficient to ensure this requirement is met across all
-	 * feasible GPU clock speeds.
-	 */
-	udelay(1);
-
-	err = reset_control_deassert(pvr_dev->reset);
-	if (err)
-		goto err_mem_clk_disable;
-
 	if (pvr_dev->fw_dev.booted) {
 		err = pvr_power_fw_enable(pvr_dev);
 		if (err)
-			goto err_reset_assert;
+			goto err_power_off;
 	}
 
 	drm_dev_exit(idx);
 
 	return 0;
 
-err_reset_assert:
-	reset_control_assert(pvr_dev->reset);
-
-err_mem_clk_disable:
-	clk_disable_unprepare(pvr_dev->mem_clk);
-
-err_sys_clk_disable:
-	clk_disable_unprepare(pvr_dev->sys_clk);
-
-err_core_clk_disable:
-	clk_disable_unprepare(pvr_dev->core_clk);
-
+err_power_off:
+	pvr_dev->soc_data->power_off(pvr_dev);
 err_drm_dev_exit:
 	drm_dev_exit(idx);
 
diff --git a/drivers/gpu/drm/imagination/pvr_power.h b/drivers/gpu/drm/imagination/pvr_power.h
index ada85674a7ca762dcf92df40424230e1c3910342..d91d5f3f39b61f81121357f4187b1a6e09b3dec0 100644
--- a/drivers/gpu/drm/imagination/pvr_power.h
+++ b/drivers/gpu/drm/imagination/pvr_power.h
@@ -41,4 +41,10 @@ pvr_power_put(struct pvr_device *pvr_dev)
 int pvr_power_domains_init(struct pvr_device *pvr_dev);
 void pvr_power_domains_fini(struct pvr_device *pvr_dev);
 
+/* Power sequence functions */
+int pvr_power_on_sequence_manual(struct pvr_device *pvr_dev);
+int pvr_power_off_sequence_manual(struct pvr_device *pvr_dev);
+int pvr_power_on_sequence_pwrseq(struct pvr_device *pvr_dev);
+int pvr_power_off_sequence_pwrseq(struct pvr_device *pvr_dev);
+
 #endif /* PVR_POWER_H */

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
