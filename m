Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 358C5CDB47C
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Jun 2026 01:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UKGUsU57f5cGicGwOtel1vfhk4XFIolu/9GOJKE/g9E=; b=LDRuY1INeigMkz
	gnez64FSNpz3QhBxHNbe/2MN7zwYhVdXcFvcrA8agTB5MjUNy4slwMzKzWwuDx+jmZLrntVYlvBjj
	I06/NCBLMaE980RMRPoWVf1Q5BLLTXxcBPUxfOARrrsx2ScRa/CPrfy9i+ZNkustq5vzHJnGvD6kl
	wnqqgn9wN9MHknO6XxvmA7vWwkqZz6wxpxafKq6slhDjsfVKxy8LbKYmxkcVjvp2iJS1nBvrb3hoQ
	1Q8P3hO66W+cwuO10kqN2aBnKExoR9OmJRR7QHeuYkuvm+SVeDUC2vvyYSiI2dT5cHWgiNtOkfGxB
	AcxNWIB6dH4x9MAA59+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5L-00000008WQk-1KQ7;
	Thu, 25 Jun 2026 01:40:55 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcZ5G-00000008WLo-16Wa
	for linux-riscv@lists.infradead.org;
	Thu, 25 Jun 2026 01:40:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8953B42DA6;
	Thu, 25 Jun 2026 01:40:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01E851F00ADE;
	Thu, 25 Jun 2026 01:40:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782351649;
	bh=3+1SBa6s3plLPgv6YXBtmdEqRm+FuyD7NaYVrcbthKM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=F7MCbKxl+O70EPek9bduJM6q253UyNtxNV/MedTuRHDXxI8N6NbymxkkmnIf3MFzo
	 pUI46PRiV1vw9u+FM3oiNGuw55k41wbloQAZ4R6JPagHZjdmf0i6pEqKReWSTJ+oWv
	 N1GLypLuMNtLf62sOIycPuOSYUxfHsqDxDqI9sHzEpYYqRrPKIKmVevebCqDJGCO1i
	 JrSkIj8uj82WbbtqVpPnjqfrC10RRNy7sBAzCgCPitgRxtLkaJd6+IaZkKFrbSUmKS
	 2zXKQO9+n221Sb9s6507bv6sUw/pIv1to9OPxkVWkbEi813YkbKcCX/h/t9Qg5tN80
	 Tc8fQdbEPGjMg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 24 Jun 2026 18:38:36 -0700
Subject: [PATCH v2 8/8] riscv_cbqri: Add CBQRI cache capacity-allocation
 platform driver
MIME-Version: 1.0
Message-Id: <20260624-dfustini-atl-sc-cbqri-dt-v2-8-2f8049fd902b@kernel.org>
References: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
In-Reply-To: <20260624-dfustini-atl-sc-cbqri-dt-v2-0-2f8049fd902b@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Atish Kumar Patra <atishp@rivosinc.com>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
 Tony Luck <tony.luck@intel.com>, Vasudevan Srinivasan <vasu@rivosinc.com>, 
 Ved Shanbhogue <ved@rivosinc.com>, Weiwei Li <liwei1518@gmail.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Drew Fustini <fustini@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, devicetree@vger.kernel.org, linux-rt-devel@lists.linux.dev, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7079; i=fustini@kernel.org;
 h=from:subject:message-id; bh=J1233avAI3n0ZcS6Mr3AkIHH7tiFI9VdO14+7QXpNfM=;
 b=owGbwMvMwCF2+43O4ZsaG3kYT6slMWTZtEszH7IWluKKZRIKNPGYoP6Er/CN+uctpSazjNfu4
 9s97ZpSRykLgxgHg6yYIsumD3kXlniFfl0w/8U2mDmsTCBDGLg4BWAivTwM/1S3TzYvsJyrzqO5
 kJFNYh1/0LsVQTtvM3//duhuI08h82mG/0mPJecnzXZ9uLVzDbPTihLul7cvBngxv+XmkDxo3l7
 KzwUA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
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

Add a device-tree platform driver, bound to the generic
riscv,cbqri-capacity-controller compatible, that registers a CBQRI
capacity controller as the resctrl cache-allocation resource for the
cache it governs.

The driver follows the node's riscv,cbqri-cache phandle to that cache,
reads its level, and matches it against cacheinfo to get the resctrl
domain id and the harts sharing the cache. It then hands the controller
to riscv_cbqri_register_cc_dt() with the riscv,cbqri-rcid count from the
node.

Nothing is vendor-specific, and the DT "reg" is the CBQRI register block
itself, so any SoC that describes a CBQRI capacity controller in device
tree can reuse the driver unchanged.

Assisted-by: Claude:claude-opus-4-8
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      |   1 +
 drivers/resctrl/Kconfig          |  12 ++++
 drivers/resctrl/Makefile         |   1 +
 drivers/resctrl/cbqri_capacity.c | 132 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 146 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 64a95a4d795a57033d3f36200d98cfb4a013ab94..e0ffccd9ed6ec3c147fb2a4198cbcf6cedd73c9f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -23302,6 +23302,7 @@ F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos.c
+F:	drivers/resctrl/cbqri_capacity.c
 F:	drivers/resctrl/cbqri_devices.c
 F:	drivers/resctrl/cbqri_internal.h
 F:	drivers/resctrl/cbqri_resctrl.c
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index f8566c003d49570b844908d57c231d73c3bb0f6e..3645dd643117c49a5379dd33fb5ee955f4f8eb3a 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -41,6 +41,18 @@ menuconfig RISCV_CBQRI
 
 if RISCV_CBQRI
 
+config RISCV_CBQRI_CAPACITY
+	bool "RISC-V CBQRI cache capacity-allocation controller"
+	depends on OF
+	help
+	  Enable driver for a RISC-V CBQRI capacity controller that
+	  governs a CPU cache, matching the "riscv,cbqri-capacity-controller"
+	  compatible. The controller's cache phandle gives the cache level and the
+	  harts that share it, which the driver registers as a resctrl
+	  cache-allocation resource.
+
+	  Say N unless your device tree describes a CBQRI capacity controller.
+
 endif
 
 config RISCV_CBQRI_RESCTRL_FS
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index a7631712dba9e1c9dd2a0b07a089204671f85d1f..c8339113ef1f735cd27c4452ae2f73ab348c3230 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -7,3 +7,4 @@ ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
 obj-$(CONFIG_RISCV_CBQRI)			+= cbqri.o
 cbqri-y						+= cbqri_devices.o
 cbqri-$(CONFIG_RISCV_CBQRI_RESCTRL_FS)		+= cbqri_resctrl.o
+cbqri-$(CONFIG_RISCV_CBQRI_CAPACITY)		+= cbqri_capacity.o
diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
new file mode 100644
index 0000000000000000000000000000000000000000..2172432eb3287f5c7db9ab44d0a4dae45c4fa2cc
--- /dev/null
+++ b/drivers/resctrl/cbqri_capacity.c
@@ -0,0 +1,132 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Platform driver for a RISC-V CBQRI capacity controller that backs a CPU
+ * cache. The controller is described in device tree by the generic
+ * "riscv,cbqri-capacity-controller" compatible together with a phandle to the
+ * cache node it governs. The driver hands it to the CBQRI core, which probes
+ * the capabilities register and exposes a controller that supports allocation
+ * as the resctrl cache allocation resource for that cache.
+ */
+
+#define pr_fmt(fmt) "cbqri-capacity: " fmt
+
+#include <linux/cacheinfo.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/ioport.h>
+#include <linux/mod_devicetable.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/printk.h>
+#include <linux/riscv_cbqri.h>
+#include <linux/types.h>
+
+static int cbqri_capacity_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct cbqri_controller_info info = {};
+	struct device_node *cache_np;
+	cpumask_var_t cpu_mask;
+	struct resource *res;
+	u32 rcid_count, cache_level;
+	int cache_id, cpu, ret;
+
+	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
+	if (!res)
+		return -EINVAL;
+
+	ret = of_property_read_u32(dev->of_node, "riscv,cbqri-rcid", &rcid_count);
+	if (ret) {
+		dev_err(dev, "missing riscv,cbqri-rcid\n");
+		return ret;
+	}
+
+	cache_np = of_parse_phandle(dev->of_node, "riscv,cbqri-cache", 0);
+	if (!cache_np) {
+		dev_err(dev, "missing riscv,cbqri-cache phandle\n");
+		return -EINVAL;
+	}
+
+	ret = of_property_read_u32(cache_np, "cache-level", &cache_level);
+	if (ret) {
+		dev_err(dev, "%pOF: missing cache-level\n", cache_np);
+		goto out_put;
+	}
+
+	if (!zalloc_cpumask_var(&cpu_mask, GFP_KERNEL)) {
+		ret = -ENOMEM;
+		goto out_put;
+	}
+
+	/*
+	 * Associate the controller with its cache instance via
+	 * cacheinfo. The matching cache provides the cache id and the
+	 * set of harts that share the cache.
+	 */
+	cache_id = -1;
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
+
+		if (ci && ci->fw_token == cache_np) {
+			cache_id = ci->id;
+			cpumask_copy(cpu_mask, &ci->shared_cpu_map);
+			break;
+		}
+	}
+	cpus_read_unlock();
+
+	if (cache_id < 0) {
+		dev_err(dev, "%pOF: no online hart reports an L%u cache for this node\n",
+			cache_np, cache_level);
+		ret = -ENODEV;
+		goto out_free;
+	}
+
+	info.type = CBQRI_CONTROLLER_TYPE_CAPACITY;
+	info.addr = res->start;
+	info.size = resource_size(res);
+	info.rcid_count = rcid_count;
+	info.cache_id = cache_id;
+
+	ret = riscv_cbqri_register_cc_dt(&info, cache_level, cpu_mask);
+	if (ret) {
+		dev_err(dev, "failed to register capacity controller: %d\n", ret);
+		goto out_free;
+	}
+
+	dev_info(dev, "registered L%u capacity controller at %pa (cache_id=%d, rcid=%u)\n",
+		 cache_level, &info.addr, cache_id, rcid_count);
+
+out_free:
+	free_cpumask_var(cpu_mask);
+out_put:
+	of_node_put(cache_np);
+	return ret;
+}
+
+static const struct of_device_id cbqri_capacity_of_match[] = {
+	{ .compatible = "riscv,cbqri-capacity-controller" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, cbqri_capacity_of_match);
+
+static struct platform_driver cbqri_capacity_driver = {
+	.probe	= cbqri_capacity_probe,
+	.driver = {
+		.name		= "cbqri-capacity",
+		.of_match_table	= cbqri_capacity_of_match,
+		/*
+		 * The controller is registered permanently into the
+		 * CBQRI core for the life of the system. Block unbind
+		 * so userspace cannot leave a dangling controller.
+		 */
+		.suppress_bind_attrs = true,
+	},
+};
+
+/*
+ * Register at device_initcall so probe runs before the CBQRI core's
+ * late_initcall which walks the cbqri_controllers list.
+ */
+builtin_platform_driver(cbqri_capacity_driver);

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
