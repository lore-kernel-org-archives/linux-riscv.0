Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41A7BD46BFF
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Go8X4Gb4mYdnAbXlwXoLg+Ny16e5exHw+H9JUelKizc=; b=tK7hcG/SB0OZX+
	4mC483b9X/aAQwfwUOKalFLDqX/ukN/u4lTIA2oIlS9alnReHwRPZD2uCCrjbqgevKr93EM9V889V
	ISe9JcNLC8S1sFwUjgXidFApNh6x5ApnnyDamg4TEyn3yybmeMaXtKpwyX+MH5AWS+SVcdP4KNz1Q
	V7nEQvwiZrDXSO870zPc9wu1WeRGcoxqvHiM/EspPCoENDMd2Agut9DFPY7J1X8kAEtKCx24hsig0
	4p+KWqaEu86hahAkP5pq/ZY9n2pDQ7cnh+3tWj/GC667GlUvumaAucpgQA2Yy6f34HIExcA5UsHVu
	UyvuKM0iMyx0p8C3knKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC96-0000000Gk6e-12El;
	Wed, 28 Jan 2026 20:28:12 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC90-0000000Gk0u-2W8s
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0C366444CB;
	Wed, 28 Jan 2026 20:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68251C4CEF7;
	Wed, 28 Jan 2026 20:28:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632085;
	bh=uuacy5TWBWCqGEovDfg1uYj/N0C7aRhzBOjqrPUPGZE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cuu7ZLVJx0gAzesWP4IDGrHlRXyqQrUU3YixYnv3MC5zLnNPDIxy56Z3WUd+GYJGZ
	 37bW/dN8Hg8BLsvrPtvuV+qeA8VYNQtI23k3Nb8AB1VA4DTDuptQU8GKXi+laiKnoE
	 rY07evMIMWYNs0oEL+s+DB7p+FHW7Jwl9k6evZvlAajvMFiiN6wWQgzs2H+ePBIhVU
	 ck2JSWcWrcw89q+4jI9q0QC8sdCZ7VPHtAb2prmwASOoTQXPQ8DyyQnVQP6WIBFVwM
	 g3RhVeKqNfC5aAi8d6/2r/iTMc8SvtCsj37uO2m8T8zZl/oMEfladXnfg5/ecKC2C2
	 KqVHJqVoum1DQ==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:26 -0800
Subject: [PATCH RFC v2 05/17] RISC-V: QoS: define CBQRI capacity and
 bandwidth capabilities
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-5-dca586b091b9@kernel.org>
References: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
In-Reply-To: <20260128-ssqosid-cbqri-v2-0-dca586b091b9@kernel.org>
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
 Reinette Chatre <reinette.chatre@intel.com>, 
 Tony Luck <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>, 
 Peter Newman <peternewman@google.com>, Fenghua Yu <fenghua.yu@intel.com>, 
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>, 
 Dave Martin <Dave.Martin@arm.com>, Drew Fustini <fustini@kernel.org>, 
 linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
 x86@kernel.org, Rob Herring <robh@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
 Robert Moore <robert.moore@intel.com>, Sunil V L <sunilvl@ventanamicro.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, linux-acpi@vger.kernel.org, 
 acpica-devel@lists.linux.dev, devicetree@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=4712; i=fustini@kernel.org;
 h=from:subject:message-id; bh=uuacy5TWBWCqGEovDfg1uYj/N0C7aRhzBOjqrPUPGZE=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQYobQy54nbak+F10tT+lae+cUrN6c4t9FE60iv55
 9jzZVvnd5SyMIhxMciKKbJs+pB3YYlX6NcF819sg5nDygQyhIGLUwAmEvCfkeGV0Z0j3a9ZmpQP
 na3VkK95pWS9f2Z6lm3MmZSS8mnWmQsY/nvsX7vaQzvSYWMWXw3nwwc94hMmfomZyzK3ctPkvYf
 PyrIAAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122806_701448_9F2FFD57 
X-CRM114-Status: GOOD (  10.30  )
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

Define data structures to store the capacity and bandwidth capabilities
that are discovered for a CBQRI-capable controller.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/kernel/qos/internal.h | 128 +++++++++++++++++++++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
new file mode 100644
index 000000000000..ff2c7eff50be
--- /dev/null
+++ b/arch/riscv/kernel/qos/internal.h
@@ -0,0 +1,128 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef _ASM_RISCV_QOS_INTERNAL_H
+#define _ASM_RISCV_QOS_INTERNAL_H
+
+#include <linux/resctrl.h>
+
+#define CBQRI_CC_CAPABILITIES_OFF 0
+#define CBQRI_CC_MON_CTL_OFF      8
+#define CBQRI_CC_MON_CTL_VAL_OFF 16
+#define CBQRI_CC_ALLOC_CTL_OFF   24
+#define CBQRI_CC_BLOCK_MASK_OFF  32
+
+#define CBQRI_BC_CAPABILITIES_OFF 0
+#define CBQRI_BC_MON_CTL_OFF      8
+#define CBQRI_BC_MON_CTR_VAL_OFF 16
+#define CBQRI_BC_ALLOC_CTL_OFF   24
+#define CBQRI_BC_BW_ALLOC_OFF    32
+
+#define CBQRI_CC_CAPABILITIES_VER_MINOR_MASK  GENMASK(3, 0)
+#define CBQRI_CC_CAPABILITIES_VER_MAJOR_MASK  GENMASK(7, 4)
+
+#define CBQRI_CC_CAPABILITIES_FRCID_MASK   0x1
+#define CBQRI_CC_CAPABILITIES_FRCID_SHIFT  24
+
+#define CBQRI_CC_CAPABILITIES_NCBLKS_SHIFT 8
+#define CBQRI_CC_CAPABILITIES_NCBLKS_MASK  0xFFFF
+
+#define CBQRI_BC_CAPABILITIES_VER_MINOR_MASK  GENMASK(3, 0)
+#define CBQRI_BC_CAPABILITIES_VER_MAJOR_MASK  GENMASK(7, 4)
+
+#define CBQRI_BC_CAPABILITIES_NBWBLKS_SHIFT 8
+#define CBQRI_BC_CAPABILITIES_NBWBLKS_MASK  0xFFFF
+#define CBQRI_BC_CAPABILITIES_MRBWB_SHIFT   32
+#define CBQRI_BC_CAPABILITIES_MRBWB_MASK    0xFFFF
+
+#define CBQRI_CONTROL_REGISTERS_BUSY_SHIFT   39
+#define CBQRI_CONTROL_REGISTERS_BUSY_MASK    0x01
+#define CBQRI_CONTROL_REGISTERS_STATUS_SHIFT 32
+#define CBQRI_CONTROL_REGISTERS_STATUS_MASK  0x7F
+#define CBQRI_CONTROL_REGISTERS_OP_SHIFT     0
+#define CBQRI_CONTROL_REGISTERS_OP_MASK      0x1F
+#define CBQRI_CONTROL_REGISTERS_AT_SHIFT     5
+#define CBQRI_CONTROL_REGISTERS_AT_MASK      0x07
+#define CBQRI_CONTROL_REGISTERS_AT_DATA      0
+#define CBQRI_CONTROL_REGISTERS_AT_CODE      1
+#define CBQRI_CONTROL_REGISTERS_RCID_SHIFT   8
+#define CBQRI_CONTROL_REGISTERS_RCID_MASK    0xFFF
+#define CBQRI_CONTROL_REGISTERS_RBWB_SHIFT   0
+#define CBQRI_CONTROL_REGISTERS_RBWB_MASK    0xFFFF
+
+#define CBQRI_CC_MON_CTL_OP_CONFIG_EVENT 1
+#define CBQRI_CC_MON_CTL_OP_READ_COUNTER 2
+#define CBQRI_CC_MON_CTL_STATUS_SUCCESS  1
+
+#define CBQRI_CC_ALLOC_CTL_OP_CONFIG_LIMIT 1
+#define CBQRI_CC_ALLOC_CTL_OP_READ_LIMIT   2
+#define CBQRI_CC_ALLOC_CTL_OP_FLUSH_RCID   3
+#define CBQRI_CC_ALLOC_CTL_STATUS_SUCCESS  1
+
+#define CBQRI_BC_MON_CTL_OP_CONFIG_EVENT 1
+#define CBQRI_BC_MON_CTL_OP_READ_COUNTER 2
+#define CBQRI_BC_MON_CTL_STATUS_SUCCESS  1
+
+#define CBQRI_BC_ALLOC_CTL_OP_CONFIG_LIMIT 1
+#define CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT   2
+#define CBQRI_BC_ALLOC_CTL_STATUS_SUCCESS  1
+
+/* Capacity Controller hardware capabilities */
+struct riscv_cbqri_capacity_caps {
+	u16 ncblks; /* number of capacity blocks */
+	u16 cache_level;
+	u32 blk_size;
+
+	bool supports_alloc_at_data;
+	bool supports_alloc_at_code;
+
+	bool supports_alloc_op_config_limit;
+	bool supports_alloc_op_read_limit;
+	bool supports_alloc_op_flush_rcid;
+
+	bool supports_mon_at_data;
+	bool supports_mon_at_code;
+
+	bool supports_mon_op_config_event;
+	bool supports_mon_op_read_counter;
+
+	bool supports_mon_evt_id_none;
+	bool supports_mon_evt_id_occupancy;
+};
+
+/* Bandwidth Controller hardware capabilities */
+struct riscv_cbqri_bandwidth_caps {
+	u16 nbwblks; /* number of bandwidth blocks */
+	u16 mrbwb;   /* max reserved bw blocks */
+
+	bool supports_alloc_at_data;
+	bool supports_alloc_at_code;
+
+	bool supports_alloc_op_config_limit;
+	bool supports_alloc_op_read_limit;
+
+	bool supports_mon_at_data;
+	bool supports_mon_at_code;
+
+	bool supports_mon_op_config_event;
+	bool supports_mon_op_read_counter;
+
+	bool supports_mon_evt_id_none;
+	bool supports_mon_evt_id_rdwr_count;
+	bool supports_mon_evt_id_rdonly_count;
+	bool supports_mon_evt_id_wronly_count;
+};
+
+struct cbqri_controller {
+	struct cbqri_controller_info *ctrl_info;
+	void __iomem *base;
+
+	int ver_major;
+	int ver_minor;
+
+	struct riscv_cbqri_bandwidth_caps bc;
+	struct riscv_cbqri_capacity_caps cc;
+
+	bool alloc_capable;
+	bool mon_capable;
+};
+
+#endif /* _ASM_RISCV_QOS_INTERNAL_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
