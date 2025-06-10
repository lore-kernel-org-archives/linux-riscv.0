Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E9DBC5B552
	for <linux-riscv@archiver.kernel.org>; Tue, 10 Jun 2025 03:43:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Subject:Cc:In-Reply-To:
	To:From:MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:References:
	List-Owner; bh=uNdsz6DM0/Zj+uCFAJQEDylIK8BdyNDY1dT21+x8S5Q=; b=OQOhqGNxGtMBOK
	JTIoZGNIUQ3iMaZ17Z5sFJfA3fqEDQKi7abbFl1NvICKpzmhNTmPQwaZ76xyT5SOMXZCI4SqqVFaf
	8kFrafSsCIk+pUh8pYQUddvAmdSG57dfRSrWQ66cGjxSudktZ8vkTcD82LiVvXmBsPTdw9npNsn+i
	iok1sbcRkJ2dwIDs+yM84tWasYyzTZo6kjtXK06mQIlGX6uV7co/rJYAvvpusKQl/SUsLPhJyT6t6
	Igy+0QympsAX4A5jph4TBc5Uua0IMbZ5Yup6i+TjbhaqYRK590VZAwTFVXG8qvzWT8/VhXn95Cp+s
	R/yxxYNB19yAf+llIpLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOptn-00000005hFU-3MUw;
	Tue, 10 Jun 2025 03:43:43 +0000
Received: from sender4-op-o12.zoho.com ([136.143.188.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOptl-00000005hF6-1MR0
	for linux-riscv@lists.infradead.org;
	Tue, 10 Jun 2025 03:43:43 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1749526988; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AyE2uKouUp9jGovrP/v4olUh5qGOQLFEOHst/d1DgaroTKMCz9tsVEm9xS8SvEjRhL4buv1Z8JIKyZinoaL66kuf/1MlycTkZYQ9nErlC44GVtNACqUih0E/O6WOhkh542tU68ScOfHuffRVSwyzE3ww5NyCZ0KVinuQDjsg9ms=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1749526988; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u3oAQahbNx1vgahx0ICj2xmfgptN5IERWf/QVVGuikI=; 
	b=AAyJ/Q0Mf9YjG05m0yJAz0qxGZHCJhal5NLFI4zVOOE3pFqyF5eGF+MFxR3S4Jlicu4cckWhYs2uoh0Wvi5aAtxpVszHK2qfzxX2LW0XsV/kdhjMz4q6BFMLY19N1Mu4GsAUazoK7Kz+bulH/5hFB8gb8nCNmXIXR7pmTRfzgkM=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=pigmoral.tech;
	spf=pass  smtp.mailfrom=junhui.liu@pigmoral.tech;
	dmarc=pass header.from=<junhui.liu@pigmoral.tech>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1749526988;
	s=zmail; d=pigmoral.tech; i=junhui.liu@pigmoral.tech;
	h=MIME-Version:From:From:To:To:In-Reply-To:Cc:Cc:Subject:Subject:Message-ID:Date:Date:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=u3oAQahbNx1vgahx0ICj2xmfgptN5IERWf/QVVGuikI=;
	b=Qzd2F1kvmYbIvFosIvjXsyRltp0I1Aw6m7kVCql0t8GWsO54VhFnPcjN4bKDBSzZ
	p2/7KEcgbB0VuAlkeMk6kg8OSOwsb/LHDsIcLLcV4DHYbZX6G1hN67UlGJAjcUKcYwY
	L0cutUiYMlQZdmDUUmSBNy5SfOIiyA3F0RfPj5UQ=
Received: by mx.zohomail.com with SMTPS id 1749526986447678.170425674402;
	Mon, 9 Jun 2025 20:43:06 -0700 (PDT)
MIME-Version: 1.0
From: "Junhui Liu" <junhui.liu@pigmoral.tech>
To: "Peng Fan" <peng.fan@oss.nxp.com>
In-Reply-To: <20250609083803.GA13113@nxa18884-linux>
Cc: "Bjorn Andersson" <andersson@kernel.org>, 
	"Mathieu Poirier" <mathieu.poirier@linaro.org>, 
	"Rob Herring" <robh@kernel.org>, 
	"Krzysztof Kozlowski" <krzk+dt@kernel.org>, 
	"Conor Dooley" <conor+dt@kernel.org>, 
	"Chen Wang" <unicorn_wang@outlook.com>, 
	"Inochi Amaoto" <inochiama@gmail.com>, 
	"Philipp Zabel" <p.zabel@pengutronix.de>, 
	"Paul Walmsley" <paul.walmsley@sifive.com>, 
	"Palmer Dabbelt" <palmer@dabbelt.com>, "Albert Ou" <aou@eecs.berkeley.edu>, 
	"Alexandre Ghiti" <alex@ghiti.fr>, <linux-remoteproc@vger.kernel.org>, 
	<devicetree@vger.kernel.org>, <sophgo@lists.linux.dev>, 
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: Re: [PATCH 2/2] drivers: remoteproc: Add C906L controller for Sophgo
	 CV1800B SoC
Message-ID: <184791843e98e0a0.ed7541b3db6a6586.57e5fabaf9bf62ee@Jude-Air.local>
Date: Tue, 10 Jun 2025 03:42:57 +0000
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250609_204341_768200_314488F1 
X-CRM114-Status: GOOD (  20.62  )
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

Hi Peng,
Thanks for your review.

On 09/06/2025 16:43, Peng Fan wrote:
> On Sun, Jun 08, 2025 at 10:37:40AM +0800, Junhui Liu wrote:
>>Add initial support for the C906L remote processor found in the Sophgo
>>CV1800B SoC. The C906L is an asymmetric core typically used to run an
>>RTOS. This driver enables firmware loading and start/stop control of the
>>C906L processor via the remoteproc framework.
>>
>>The C906L and the main application processor can communicate through
>>mailboxes [1]. Support for mailbox-based functionality will be added in
>>a separate patch.
>>
>>Link: https://lore.kernel.org/linux-riscv/20250520-cv18xx-mbox-v4-0-fd4f1c676d6e@pigmoral.tech/ [1]
>>Signed-off-by: Junhui Liu <junhui.liu@pigmoral.tech>
>>---
>> drivers/remoteproc/Kconfig                |   9 ++
>> drivers/remoteproc/Makefile               |   1 +
>> drivers/remoteproc/sophgo_cv1800b_c906l.c | 233 ++++++++++++++++++++++++++++++
>> 3 files changed, 243 insertions(+)
>>
>>diff --git a/drivers/remoteproc/Kconfig b/drivers/remoteproc/Kconfig
>>index 83962a114dc9fdb3260e6e922602f2da53106265..7b09a8f00332605ee528ff7c21c31091c10c2bf5 100644
>>--- a/drivers/remoteproc/Kconfig
>>+++ b/drivers/remoteproc/Kconfig
>>@@ -299,6 +299,15 @@ config RCAR_REMOTEPROC
>> 	  This can be either built-in or a loadable module.
>> 	  If compiled as module (M), the module name is rcar_rproc.
>> 
>>+config SOPHGO_CV1800B_C906L
>>+	tristate "Sophgo CV1800B C906L remoteproc support"
>>+	depends on ARCH_SOPHGO || COMPILE_TEST
>>+	help
>>+	  Say y here to support CV1800B C906L remote processor via the remote
>>+	  processor framework.
>>+
>>+	  It's safe to say N here.
>>+
>> config ST_REMOTEPROC
>> 	tristate "ST remoteproc support"
>> 	depends on ARCH_STI
>>diff --git a/drivers/remoteproc/Makefile b/drivers/remoteproc/Makefile
>>index 1c7598b8475d6057a3e044b41e3515103b7aa9f1..3c1e9387491cedc9dda8219f1e9130a84538156f 100644
>>--- a/drivers/remoteproc/Makefile
>>+++ b/drivers/remoteproc/Makefile
>>@@ -33,6 +33,7 @@ obj-$(CONFIG_QCOM_WCNSS_PIL)		+= qcom_wcnss_pil.o
>> qcom_wcnss_pil-y			+= qcom_wcnss.o
>> qcom_wcnss_pil-y			+= qcom_wcnss_iris.o
>> obj-$(CONFIG_RCAR_REMOTEPROC)		+= rcar_rproc.o
>>+obj-$(CONFIG_SOPHGO_CV1800B_C906L)	+= sophgo_cv1800b_c906l.o
>> obj-$(CONFIG_ST_REMOTEPROC)		+= st_remoteproc.o
>> obj-$(CONFIG_ST_SLIM_REMOTEPROC)	+= st_slim_rproc.o
>> obj-$(CONFIG_STM32_RPROC)		+= stm32_rproc.o
>>diff --git a/drivers/remoteproc/sophgo_cv1800b_c906l.c b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>>new file mode 100644
>>index 0000000000000000000000000000000000000000..f3c8d8fd4f796d0cf64f8ab0dd797e017b8e8be7
>>--- /dev/null
>>+++ b/drivers/remoteproc/sophgo_cv1800b_c906l.c
>>@@ -0,0 +1,233 @@
>>+// SPDX-License-Identifier: GPL-2.0-or-later
>>+/*
>>+ * Copyright (C) 2025 Junhui Liu <junhui.liu@pigmoral.tech>
>>+ */
>>+
>>+#include <linux/mfd/syscon.h>
>>+#include <linux/module.h>
>>+#include <linux/of_device.h>
>>+#include <linux/of_reserved_mem.h>
>>+#include <linux/platform_device.h>
>>+#include <linux/remoteproc.h>
>>+#include <linux/reset.h>
>>+#include <linux/regmap.h>
>>+
>>+#include "remoteproc_internal.h"
>>+
>>+#define CV1800B_SYS_C906L_CTRL_REG	0x04
>>+#define   CV1800B_SYS_C906L_CTRL_EN	BIT(13)
> 
> Align the format.
> 
> '#include <linux/bits.h>' should be added for BIT
> 

Will do in v2.

>>+
>>+#define CV1800B_SYS_C906L_BOOTADDR_REG	0x20
>>+
>>+/**
>>+ * struct cv1800b_c906l - C906L remoteproc structure
>>+ * @dev: private pointer to the device
>>+ * @reset: reset control handle
>>+ * @rproc: the remote processor handle
>>+ * @syscon: regmap for accessing security system registers
>>+ */
>>+struct cv1800b_c906l {
>>+	struct device *dev;
>>+	struct reset_control *reset;
>>+	struct rproc *rproc;
>>+	struct regmap *syscon;
>>+};
>>+
>>+static int cv1800b_c906l_mem_alloc(struct rproc *rproc,
>>+				   struct rproc_mem_entry *mem)
>>+{
>>+	void *va;
>>+
>>+	va = ioremap_wc(mem->dma, mem->len);
>>+	if (IS_ERR_OR_NULL(va))
> 
> Use "if (!va)"?

Will do in v2.

> 
>>+		return -ENOMEM;
>>+
>>+	/* Update memory entry va */
>>+	mem->va = va;
>>+
>>+	return 0;
>>+}
>>+
>>+static int cv1800b_c906l_mem_release(struct rproc *rproc,
>>+				     struct rproc_mem_entry *mem)
>>+{
>>+	iounmap(mem->va);
>>+
>>+	return 0;
>>+}
>>+
>>+static int cv1800b_c906l_add_carveout(struct rproc *rproc)
>>+{
>>+	struct device *dev = rproc->dev.parent;
>>+	struct device_node *np = dev->of_node;
>>+	struct of_phandle_iterator it;
>>+	struct rproc_mem_entry *mem;
>>+	struct reserved_mem *rmem;
>>+
>>+	/* Register associated reserved memory regions */
>>+	of_phandle_iterator_init(&it, np, "memory-region", NULL, 0);
>>+	while (of_phandle_iterator_next(&it) == 0) {
>>+		rmem = of_reserved_mem_lookup(it.node);
>>+		if (!rmem) {
>>+			of_node_put(it.node);
>>+			return -EINVAL;
>>+		}
> 
> Is there a need to handle vdev0buffer?

I'll exclude it.

> 
>>+
>>+		mem = rproc_mem_entry_init(dev, NULL, (dma_addr_t)rmem->base,
>>+					   rmem->size, rmem->base,
>>+					   cv1800b_c906l_mem_alloc,
>>+					   cv1800b_c906l_mem_release,
>>+					   it.node->name);
>>+
>>+		if (!mem) {
>>+			of_node_put(it.node);
>>+			return -ENOMEM;
>>+		}
>>+
>>+		rproc_add_carveout(rproc, mem);
>>+	}
>>+
>>+	return 0;
>>+}
>>+
>>+static int cv1800b_c906l_prepare(struct rproc *rproc)
>>+{
>>+	struct cv1800b_c906l *priv = rproc->priv;
>>+	int ret;
>>+
>>+	ret = cv1800b_c906l_add_carveout(rproc);
>>+	if (ret)
>>+		return ret;
>>+
>>+	/*
>>+	 * This control bit must be set to enable the C906L remote processor.
>>+	 * Note that once the remote processor is running, merely clearing
>>+	 * this bit will not stop its execution.
>>+	 */
>>+	return regmap_update_bits(priv->syscon, CV1800B_SYS_C906L_CTRL_REG,
>>+				  CV1800B_SYS_C906L_CTRL_EN,
>>+				  CV1800B_SYS_C906L_CTRL_EN);
>>+}
>>+
>>+static int cv1800b_c906l_start(struct rproc *rproc)
>>+{
>>+	struct cv1800b_c906l *priv = rproc->priv;
>>+	u32 bootaddr[2];
>>+	int ret;
>>+
>>+	bootaddr[0] = lower_32_bits(rproc->bootaddr);
>>+	bootaddr[1] = upper_32_bits(rproc->bootaddr);
>>+
>>+	ret = regmap_bulk_write(priv->syscon, CV1800B_SYS_C906L_BOOTADDR_REG,
>>+				bootaddr, ARRAY_SIZE(bootaddr));
>>+	if (ret)
>>+		return ret;
>>+
>>+	return reset_control_deassert(priv->reset);
>>+}
>>+
>>+static int cv1800b_c906l_stop(struct rproc *rproc)
>>+{
>>+	struct cv1800b_c906l *priv = rproc->priv;
>>+
>>+	return reset_control_assert(priv->reset);
>>+}
>>+
>>+static int cv1800b_c906l_parse_fw(struct rproc *rproc,
>>+				  const struct firmware *fw)
>>+{
>>+	int ret;
>>+
>>+	ret = rproc_elf_load_rsc_table(rproc, fw);
>>+	if (ret == -EINVAL) {
>>+		dev_info(&rproc->dev, "No resource table in elf\n");
>>+		ret = 0;
>>+	}
>>+
>>+	return ret;
>>+}
>>+
>>+static const struct rproc_ops cv1800b_c906l_ops = {
>>+	.prepare = cv1800b_c906l_prepare,
>>+	.start = cv1800b_c906l_start,
>>+	.stop = cv1800b_c906l_stop,
>>+	.load = rproc_elf_load_segments,
>>+	.parse_fw = cv1800b_c906l_parse_fw,
>>+	.find_loaded_rsc_table = rproc_elf_find_loaded_rsc_table,
>>+	.sanity_check = rproc_elf_sanity_check,
>>+	.get_boot_addr = rproc_elf_get_boot_addr,
> 
> Seems your setup does not support attach mode, so better add
> attach hook and return -ENOTSUPP?

I checked the remoteproc framework code and found that the attach
function will only be called when 'rproc->state == RPROC_DETACHED', and
it seems that rproc->state will not be set to RPROC_DETACHED unless I do
so explicitly in the driver or an implemented detach function is called,
neither of which happens in this driver.

Given this, do we still need to add an attach hook even though it will
not be called in practice?

> 
>>+};
>>+
>>+static int cv1800b_c906l_probe(struct platform_device *pdev)
>>+{
>>+	struct device *dev = &pdev->dev;
>>+	struct device_node *np = dev->of_node;
>>+	struct cv1800b_c906l *priv;
>>+	struct rproc *rproc;
>>+	const char *fw_name;
>>+	int ret;
>>+
>>+	ret = rproc_of_parse_firmware(dev, 0, &fw_name);
>>+	if (ret)
>>+		return dev_err_probe(dev, ret, "No firmware filename given\n");
>>+
>>+	rproc = devm_rproc_alloc(dev, dev_name(dev), &cv1800b_c906l_ops,
>>+				 fw_name, sizeof(*priv));
>>+	if (!rproc)
>>+		return dev_err_probe(dev, -ENOMEM,
>>+				     "unable to allocate remoteproc\n");
>>+
>>+	rproc->has_iommu = false;
>>+
>>+	priv = rproc->priv;
>>+	priv->dev = dev;
>>+	priv->rproc = rproc;
>>+
>>+	priv->syscon = syscon_regmap_lookup_by_phandle(np, "sophgo,syscon");
>>+	if (IS_ERR(priv->syscon))
>>+		return PTR_ERR(priv->syscon);
>>+
>>+	priv->reset = devm_reset_control_get_exclusive(dev, NULL);
>>+	if (IS_ERR(priv->reset))
>>+		return dev_err_probe(dev, PTR_ERR(priv->reset),
>>+				     "failed to get reset control handle\n");
>>+
>>+	platform_set_drvdata(pdev, rproc);
>>+
>>+	ret = devm_rproc_add(dev, rproc);
>>+	if (ret)
>>+		return dev_err_probe(dev, ret, "rproc_add failed\n");
>>+
>>+	return 0;
>>+}
>>+
>>+static void cv1800b_c906l_remove(struct platform_device *pdev)
>>+{
>>+	struct rproc *rproc = platform_get_drvdata(pdev);
>>+
>>+	if (atomic_read(&rproc->power) > 0)
>>+		rproc_shutdown(rproc);
> 
> I think the remoteproc framework should block remove to be executed
> if 'power > 0'.  If not, the framework should be enhanced.

Okay. I realized that rproc_shutdown() will be called in rproc_del(), I
will remove rproc_shutdown() and only keep rproc_del()

> 
> Regards,
> Peng

-- 
Best regards,
Junhui Liu

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
