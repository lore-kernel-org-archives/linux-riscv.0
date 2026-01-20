Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 931F6D2ED12
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U4zH6dJ/mTzBjGDLPYThkRgU8rvzbTDlcIdkICymNrM=; b=g9P6a9WWwZQihB
	pkWEXUI5fuZXOnAsEHrjrvWOgYRzwww8V3I9mfdYL7OmoFJztP2v2sm0ioEWEX0dWKDYX6guDF15l
	kNJbcUG1H/ymw6VWYa+DWlj7dsxY9mc3wPHESscsAa0C7EKOX5olM3dDl29tFkwojNPv88yv42EDu
	6dNjvhQX1Yg0L9O7io0G5CN8ZMjQWSRVteH0iPPzhhbUgvjQFQFkeimMvPgkYSBwINjVmQbSs0tCE
	OPhPI2CBQCQA8SduOrbNPTUzj7fhB8TVjZP9wgbSEXDxPLJrvO0FJiOdIreD3h3FIkCjaXYzL/cxi
	ZBi6NeMoM/dT1pROGs3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3B3-000000039sU-42Qy;
	Tue, 20 Jan 2026 04:17:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39c-000000039OW-1dZ1
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C0324455C;
	Tue, 20 Jan 2026 04:15:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2260C2BC87;
	Tue, 20 Jan 2026 04:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882525;
	bh=R1lDGdU7iIiekrd1oymtfCVNrLHfj85DdbG3x9sBksw=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=o5O6wA2Sa7mj9exOhlWMr60IUo9V+uZYDFgj/AhtuKNokK4T3QyFOibJGyRd/1tvh
	 OlI8fL+nnGEs9NWYESHV2Ln6pnEEjX1xeBGGxoAFo6Yjtgv4DJxBR67E1V19Ji1w0T
	 ru6gkzgY1nuC/RU8Nt7mQvtbTH1brAy6rmgME1DwHJBF7uTBQ/uheBfPdA85pqFZy0
	 TTpO4Ua/33Wtye91iWendEhluYKw7bEVDuNHZuECacmYeyVzJIQ8R7fPgk9c9Gsn5f
	 QQJVQkom/0DVWSGuPP29AUkhY8ygZTpcvbJCaOZQeOJbb4SBneVreDS6c0YgELxqKh
	 UtBt/nasszGpg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:51 -0800
Subject: [PATCH NFU RFC 14/19] resctrl: riscv: add CBQRI cache controller
 driver
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-14-aa2a75153832@kernel.org>
References: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
In-Reply-To: <20260119-ssqosid-cbqri-v1-0-aa2a75153832@kernel.org>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 =?utf-8?q?Radim_Kr=C4=8Dm=C3=A1=C5=99?= <rkrcmar@ventanamicro.com>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Adrien Ricciardi <aricciardi@baylibre.com>, 
 Nicolas Pitre <npitre@baylibre.com>, 
 =?utf-8?q?Kornel_Dul=C4=99ba?= <mindal@semihalf.com>, 
 Atish Patra <atish.patra@linux.dev>, 
 Atish Kumar Patra <atishp@rivosinc.com>, 
 Vasudevan Srinivasan <vasu@rivosinc.com>, Ved Shanbhogue <ved@rivosinc.com>, 
 yunhui cui <cuiyunhui@bytedance.com>, Chen Pei <cp0613@linux.alibaba.com>, 
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>, Weiwei Li <liwei1518@gmail.com>, 
 guo.wenjia23@zte.com.cn, liu.qingtao2@zte.com.cn, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, x86@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3582; i=fustini@kernel.org;
 h=from:subject:message-id; bh=R1lDGdU7iIiekrd1oymtfCVNrLHfj85DdbG3x9sBksw=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwbPd3m6brnUfHdzF68gA205o7A5f5Y/vX7961zf9
 V6HTss+6yhlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBM5KMZI0NvyR13W+maSyv5
 81fnPVsf/LTjXeQOW5t5nClJBgc62h4y/I/4cJxpakut2He/3U9mLlK4Eq8vvf2afgnHv7lGHCu
 mf2IDAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201544_581488_E9520959 
X-CRM114-Status: GOOD (  15.22  )
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

[NOT FOR UPSTREAM]

Add example driver for a cache controller that implements CBQRI capacity
allocation.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/riscv/cbqri_cache.c | 106 ++++++++++++++++++++++++++++++++++++
 1 file changed, 106 insertions(+)

diff --git a/drivers/resctrl/riscv/cbqri_cache.c b/drivers/resctrl/riscv/cbqri_cache.c
new file mode 100644
index 000000000000..0bee65eefb2d
--- /dev/null
+++ b/drivers/resctrl/riscv/cbqri_cache.c
@@ -0,0 +1,106 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define pr_fmt(fmt) "cbqri-cache: " fmt
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/riscv_qos.h>
+
+static const struct of_device_id cbqri_cache_ids[] = {
+	{ .compatible = "riscv,cbqri-cache" },
+	{ }
+};
+
+static int __init cbqri_cache_init(void)
+{
+	struct cbqri_controller_info *ctrl_info;
+	struct device_node *np;
+	u32 value;
+	int err;
+
+	for_each_matching_node(np, cbqri_cache_ids) {
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
+			continue;
+		}
+
+		ctrl_info = kzalloc(sizeof(*ctrl_info), GFP_KERNEL);
+		if (!ctrl_info)
+			goto err_node_put;
+		ctrl_info->type = CBQRI_CONTROLLER_TYPE_CAPACITY;
+
+		err = of_property_read_u32_index(np, "reg", 1, &value);
+		if (err) {
+			pr_err("Failed to read reg base address (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->addr = value;
+
+		err = of_property_read_u32_index(np, "reg", 3, &value);
+		if (err) {
+			pr_err("Failed to read reg size (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->size = value;
+
+		err = of_property_read_u32(np, "cache-level", &value);
+		if (err) {
+			pr_err("Failed to read cache level (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->cache.cache_level = value;
+
+		err = of_property_read_u32(np, "cache-size", &value);
+		if (err) {
+			pr_err("Failed to read cache size (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->cache.cache_size = value;
+
+		err = of_property_read_u32(np, "riscv,cbqri-rcid", &value);
+		if (err) {
+			pr_err("Failed to read RCID count (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->rcid_count = value;
+
+		err = of_property_read_u32(np, "riscv,cbqri-mcid", &value);
+		if (err) {
+			pr_err("Failed to read MCID count (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+		ctrl_info->mcid_count = value;
+
+		/*
+		 * For CBQRI, any cpu (technically a hart in RISC-V terms)
+		 * can access the memory-mapped registers of any CBQRI
+		 * controller in the system. Therefore, set the CPU mask
+		 * to 'FF' to allow all 8 cores in the example Qemu SoC
+		 */
+		err = cpumask_parse("FF", &ctrl_info->cache.cpu_mask);
+		if (err) {
+			pr_err("Failed to convert cores mask string to cpumask (%d)", err);
+			goto err_kfree_ctrl_info;
+		}
+
+		of_node_put(np);
+
+		pr_debug("addr=0x%lx max-rcid=%u max-mcid=%u level=%d size=%u",
+			 ctrl_info->addr, ctrl_info->rcid_count, ctrl_info->mcid_count,
+			 ctrl_info->cache.cache_level, ctrl_info->cache.cache_size);
+
+		/* Fill the list shared with RISC-V QoS resctrl */
+		INIT_LIST_HEAD(&ctrl_info->list);
+		list_add_tail(&ctrl_info->list, &cbqri_controllers);
+	}
+
+	return 0;
+
+err_kfree_ctrl_info:
+	kfree(ctrl_info);
+
+err_node_put:
+	of_node_put(np);
+
+	return err;
+}
+device_initcall(cbqri_cache_init);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
