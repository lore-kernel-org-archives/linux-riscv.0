Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DEC606D82A
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Nov 2026 23:21:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=j0zYZvkT;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KZpm/knM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=M9cAnyq6iSqery2NorOeIYokIIOBGn4/rpu0ux5FjaE=; b=j0zYZvkT1RXJpT9Smt+F9/RxTV
	q786yzwaoghgopNOFMY4S7S//Z7K3YpEkylI1Bw+QRMX8REZ7BIif1vUKq/O4adT6tIzN1Nxeas7e
	T3jHMEthv+6Z8RoVycPIDUP4TkQGcDe6R0IrA1SLt6QN26SMa2+gMTaoWQ6XriR1JZoxSki8yOQo5
	W9JYutt31xWb65z9Ihe3Al+q2TMZH4aTQocFrFqJvlqODEJi7qfWlkH+CGI/euu3qfgYxN6wPfcPJ
	j4RxKZuy4/0ytgdng4ahqVsktcfp6zxFzKHOqi/39FsrLXe1S+2cGBb+uZZEM+j2FvU7Uj3CnCjMe
	u88Y4WJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCCi-0000000GtJI-0Spp;
	Sun, 08 Nov 2026 23:21:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xQCCg-0000000GtHe-3JzF
	for linux-riscv@lists.infradead.org;
	Sun, 08 Nov 2026 23:21:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 79EF344DE5;
	Sun,  8 Nov 2026 23:21:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E13A01F00907;
	Sun,  8 Nov 2026 23:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794180098;
	bh=Axs8TBxjitLkwLf7PGjymiDpcu3vk9fidrVmT7uBoIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=KZpm/knMjxAw0AXt63uX+P4JSqjrU1BVfp+h6DBdXD343AxdC2FlUNUgkxY+ZN5D5
	 dFDBG6OEo/oyT+0Fh8RIVlza5zRkzqCeRk0mew/mDkw5TJ6s2L35abC0KElEmF2qlA
	 Y7dxzJIF2z2CcjkEdWx6dbTwcdndFLzFTBFb91wOoeC4ZMZTyk199skPiMq2jNk6AZ
	 jpe+J7qQcpcrOTjZeBZ48Rxvq+SUO6JsjsuPym90BXhTpCwh7sxmoapmNX2tOc90mf
	 XKIRZpVXjNKjjVLKXRG+k2HKEk/nDpN8Q6cUwLR7glf04nSgixcJ3xry+TYpkoEx4Z
	 ejD6c7QdgVr1A==
From: Drew Fustini <fustini@kernel.org>
Date: Sun, 08 Nov 2026 15:20:54 -0800
Subject: [PATCH v11 5/5] riscv_cbqri: Add CBQRI capacity allocation
 platform driver
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Message-Id: <20261108-dfustini-atl-sc-cbqri-dt-v11-5-33a1bf0cf01c@kernel.org>
References: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
In-Reply-To: <20261108-dfustini-atl-sc-cbqri-dt-v11-0-33a1bf0cf01c@kernel.org>
To: Adrien Ricciardi <aricciardi@baylibre.com>, 
 Alexandre Ghiti <alex@ghiti.fr>, Albert Ou <aou@eecs.berkeley.edu>, 
 Atish Patra <atish.patra@linux.dev>, Babu Moger <babu.moger@amd.com>, 
 Ben Horgan <ben.horgan@arm.com>, Borislav Petkov <bp@alien8.de>, 
 Chen Pei <cp0613@linux.alibaba.com>, 
 Conor Dooley <conor.dooley@microchip.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Dave Hansen <dave.hansen@linux.intel.com>, 
 Dave Martin <Dave.Martin@arm.com>, Fenghua Yu <fenghuay@nvidia.com>, 
 Gong Shuai <gong.shuai@sanechips.com.cn>, Gong Shuai <gsh517@gmail.com>, 
 guo.wenjia23@zte.com.cn, James Morse <james.morse@arm.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, liu.qingtao2@zte.com.cn, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 Peter Newman <peternewman@google.com>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <radim.krcmar@oss.qualcomm.com>, 
 Reinette Chatre <reinette.chatre@intel.com>, Rob Herring <robh@kernel.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Sunil V L <sunilvl@oss.qualcomm.com>, Tony Luck <tony.luck@intel.com>, 
 Weiwei Li <liwei1518@gmail.com>, yunhui cui <cuiyunhui@bytedance.com>, 
 Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>, 
 Drew Fustini <fustini@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>, 
 Zeng Heng <zengheng@picoheart.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=7551; i=fustini@kernel.org;
 h=from:subject:message-id; bh=oOS3a3ucA+4LNABaEwKZGGmltnHjRM/i+yqDgS5H0OM=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWR9ZP73rylXt/7445s3Dv476794tUsje7Zgwuudxqwee
 9WunUu93FHKwiDGxSArpsiy6UPehSVeoV8XzH+xDWYOKxPIEAYuTgGYyKMAhr+C2+32PjgtuXzF
 8WxOtdl3Lu3g2OC0teWrzjLtKWzPjdLigCpupWgdbMpO3j91+5LdJzMiXvup5W7I+NbgfHuV7nL
 PSBYA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a platform driver for CBQRI capacity controllers described in
device tree with the riscv,cbqri-capacity-controller compatible.

The controller node points at the cache it governs with a
riscv,cbqri-cache phandle. The driver maps the register block, looks
that cache up in cacheinfo and uses its cache id as the resctrl domain
id, so the binding does not need to carry a CPU mask. The controller is
then handed to the CBQRI core, which probes its capabilities and decides
whether to expose it through resctrl. Only an L2 or L3 cache is
accepted, since those are the cache levels resctrl has resources for.

Nothing is vendor-specific and reg is the CBQRI register block itself,
so any SoC that describes a CBQRI capacity controller in device tree can
use the driver unchanged.

Tested-by: Chen Pei <cp0613@linux.alibaba.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 MAINTAINERS                      |   1 +
 drivers/resctrl/Kconfig          |  15 +++++
 drivers/resctrl/Makefile         |   1 +
 drivers/resctrl/cbqri_capacity.c | 142 +++++++++++++++++++++++++++++++++++++++
 4 files changed, 159 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 636835e313ee..df051086b5dd 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -24141,6 +24141,7 @@ F:	Documentation/devicetree/bindings/riscv/riscv,cbqri.yaml
 F:	arch/riscv/include/asm/qos.h
 F:	arch/riscv/include/asm/resctrl.h
 F:	arch/riscv/kernel/qos.c
+F:	drivers/resctrl/cbqri_capacity.c
 F:	drivers/resctrl/cbqri_devices.c
 F:	drivers/resctrl/cbqri_internal.h
 F:	drivers/resctrl/cbqri_resctrl.c
diff --git a/drivers/resctrl/Kconfig b/drivers/resctrl/Kconfig
index ed2e4bedb21b..844dfd75e2aa 100644
--- a/drivers/resctrl/Kconfig
+++ b/drivers/resctrl/Kconfig
@@ -43,6 +43,21 @@ menuconfig RISCV_CBQRI
 	  allocation through the resctrl filesystem at /sys/fs/resctrl when
 	  RESCTRL_FS is also enabled.
 
+if RISCV_CBQRI
+
+config RISCV_CBQRI_CAPACITY
+	bool "RISC-V CBQRI cache capacity-allocation controller"
+	depends on OF
+	help
+	  Enable driver for a RISC-V CBQRI capacity controller that
+	  governs a CPU cache, matching the "riscv,cbqri-capacity-controller"
+	  compatible. The controller's cache phandle gives the cache level and
+	  id, which the driver registers as a resctrl cache-allocation resource.
+
+	  Say N unless your device tree describes a CBQRI capacity controller.
+
+endif
+
 config RISCV_CBQRI_RESCTRL_FS
 	bool
 	default y if RISCV_CBQRI && RESCTRL_FS
diff --git a/drivers/resctrl/Makefile b/drivers/resctrl/Makefile
index 9473b47c93d5..6ce2c8fe8cdf 100644
--- a/drivers/resctrl/Makefile
+++ b/drivers/resctrl/Makefile
@@ -7,3 +7,4 @@ ccflags-$(CONFIG_ARM64_MPAM_DRIVER_DEBUG)	+= -DDEBUG
 obj-$(CONFIG_RISCV_CBQRI)			+= cbqri.o
 cbqri-y						+= cbqri_devices.o
 cbqri-$(CONFIG_RISCV_CBQRI_RESCTRL_FS)		+= cbqri_resctrl.o
+cbqri-$(CONFIG_RISCV_CBQRI_CAPACITY)		+= cbqri_capacity.o
diff --git a/drivers/resctrl/cbqri_capacity.c b/drivers/resctrl/cbqri_capacity.c
new file mode 100644
index 000000000000..cfdbbea2da35
--- /dev/null
+++ b/drivers/resctrl/cbqri_capacity.c
@@ -0,0 +1,142 @@
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
+#include <linux/device-id/of.h>
+#include <linux/err.h>
+#include <linux/ioport.h>
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
+	struct resource *res;
+	void __iomem *base;
+	u32 rcid_count, cache_level, cache_id;
+	bool found = false;
+	int cpu, ret;
+
+	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+	if (IS_ERR(base))
+		return PTR_ERR(base);
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
+	if (cache_level != 2 && cache_level != 3) {
+		dev_err(dev, "%pOF: unsupported cache-level %u\n",
+			cache_np, cache_level);
+		ret = -EINVAL;
+		goto out_put;
+	}
+
+	/*
+	 * Associate the controller with its cache instance via cacheinfo.
+	 * The matching cache provides the cache id used as the resctrl
+	 * domain id.
+	 *
+	 * Taking the first leaf at the level is sufficient because a
+	 * unified cache node yields one cacheinfo leaf and
+	 * cache_setup_of_node() walks one cache node per leaf past L1, so
+	 * the first leaf at the level has that level's node as fw_token.
+	 *
+	 * get_cpu_cacheinfo_level() returns the leaf only when cacheinfo
+	 * assigned it an id (CACHE_ID), which the resctrl domain id needs.
+	 */
+	cpus_read_lock();
+	for_each_online_cpu(cpu) {
+		struct cacheinfo *ci = get_cpu_cacheinfo_level(cpu, cache_level);
+
+		if (ci && ci->fw_token == cache_np) {
+			cache_id = ci->id;
+			found = true;
+			break;
+		}
+	}
+	cpus_read_unlock();
+
+	if (!found) {
+		dev_err(dev, "%pOF: no online hart reports an L%u cache with a cache id for this node\n",
+			cache_np, cache_level);
+		ret = -ENODEV;
+		goto out_put;
+	}
+
+	info.type = CBQRI_CONTROLLER_TYPE_CAPACITY;
+	info.base = base;
+	info.addr = res->start;
+	info.size = resource_size(res);
+	info.rcid_count = rcid_count;
+	info.cache_id = cache_id;
+	info.cache_level = cache_level;
+
+	ret = riscv_cbqri_register_cc(&info);
+	if (ret) {
+		dev_err(dev, "failed to register capacity controller: %d\n", ret);
+		goto out_put;
+	}
+
+	dev_info(dev, "registered L%u capacity controller at %pa (cache_id=%u, rcid=%u)\n",
+		 cache_level, &info.addr, cache_id, rcid_count);
+
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
+ * Register at device_initcall so probe runs before the resctrl glue's
+ * late_initcall, which copies the cbqri_controllers list.
+ */
+builtin_platform_driver(cbqri_capacity_driver);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
