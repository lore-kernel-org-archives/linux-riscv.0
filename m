Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC890D2ED12
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=hhCCUH43tMKMCkMt0IHvSf90KOQZj86YReq0YSgzC+I=; b=ed79qomhOezyVA
	66/TCjJIHDYP6+ZK3k2bYTJNT/kxuXV4ZGhNVGRMfobMjW9b7FbA580m77iiM4TdJDPwVLAj9PPOW
	rNTNhxVSU/8ugSjcWyql0jUJU7W9XUQSdYPGr+5x5z0bnCyWu4EXgb82CBJ2DjqOL6mbsKdNx+pNw
	/DEMgtxPCNXlolPa4rbJqAoD94tvuCtUyKX0SZoBoVmQVcDFom3J4+QiprC8Y7Aw5UqGHNDbadNFx
	DMMbCQpyexIJkHVypwnudbz2IEQyQntYNp8lxPOkQUQqVnATCfPPlgcMlUBG9T7Sm233mSLWVYz07
	wcNe5jLphKktWGNTNA/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi3B4-000000039tF-25es;
	Tue, 20 Jan 2026 04:17:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39c-000000039Od-1PWm
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 756074455E;
	Tue, 20 Jan 2026 04:15:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EBC7C2BCAF;
	Tue, 20 Jan 2026 04:15:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882526;
	bh=3hAMXnvjLCvZuLkN0WdyCAoEU5EJcEF/iWW3PasfPck=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=NCOBNF3y+UrdmyS49PT7n0srA8e8n9hSaC3seECAgp50Q29iJX+lJJju7IyABKaNj
	 0ZqtZ9RlOStNPHWd4U0F/H/+3qBxj1MEvFnwpC83RzNZyI78xb/vIWCC6hcAdw0VGD
	 A9LpOmmSnUs8xiyo/SvLZXdalZM8F8a3wW7ipqqxUt5s6jBi/pW6cO4QlBWOyw4eJj
	 6nCT8Mrn7aTLKaDrmdjiI3xlLDYupPhtUXTNFcL1Htmjxhl1brpJKYaxjcyr/wB4uY
	 o02xbB6cimgvS9YRjgUjSge82H2YfjV8Q/Tg4V5ETAKE2uLy99yyfoYy41NYyVx3d4
	 PR1IBl0ZWTMQw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:52 -0800
Subject: [PATCH NFU RFC 15/19] resctrl: riscv: add CBQRI bandwidth
 controller driver
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-15-aa2a75153832@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2638; i=fustini@kernel.org;
 h=from:subject:message-id; bh=3hAMXnvjLCvZuLkN0WdyCAoEU5EJcEF/iWW3PasfPck=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwbn/8v13chTdUpN9lEOU8TzUPZ6q5NPfpVN+XD97
 YUp//+YdpSyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmcteKkeHIlWjJa+pxD7ce
 /vPsxKZFU05HrNv17dgzo74fFj9EzyhZMvzhbTQpOxrXseyb0cPUHecEewqvcl0Qmbft0sG+/uy
 2viNMAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201544_485765_135C95F9 
X-CRM114-Status: GOOD (  13.65  )
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

Add example driver for a CBQRI bandwidth controller.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 drivers/resctrl/riscv/cbqri_bandwidth.c | 79 +++++++++++++++++++++++++++++++++
 1 file changed, 79 insertions(+)

diff --git a/drivers/resctrl/riscv/cbqri_bandwidth.c b/drivers/resctrl/riscv/cbqri_bandwidth.c
new file mode 100644
index 000000000000..13649d56b7dc
--- /dev/null
+++ b/drivers/resctrl/riscv/cbqri_bandwidth.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#define pr_fmt(fmt) "cbqri-bandwidth: " fmt
+
+#include <linux/device.h>
+#include <linux/of.h>
+#include <linux/riscv_qos.h>
+
+static const struct of_device_id cbqri_mem_ctrl_ids[] = {
+	{ .compatible = "riscv,cbqri-bandwidth" },
+	{ }
+};
+
+static int __init cbqri_mem_ctrl_init(void)
+{
+	struct cbqri_controller_info *ctrl_info;
+	struct device_node *np;
+	u32 value;
+	int err;
+
+	for_each_matching_node(np, cbqri_mem_ctrl_ids) {
+		if (!of_device_is_available(np)) {
+			of_node_put(np);
+			continue;
+		}
+
+		ctrl_info = kzalloc(sizeof(*ctrl_info), GFP_KERNEL);
+		if (!ctrl_info)
+			goto err_node_put;
+		ctrl_info->type = CBQRI_CONTROLLER_TYPE_BANDWIDTH;
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
+		of_node_put(np);
+
+		pr_debug("addr=0x%lx max-rcid=%u max-mcid=%u", ctrl_info->addr,
+			 ctrl_info->rcid_count, ctrl_info->mcid_count);
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
+device_initcall(cbqri_mem_ctrl_init);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
