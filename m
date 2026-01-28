Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01386D46BFE
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ss0JY+iQzr5MYEs/XKDHrp968Cb2Ni4FhXmM4K5zWsI=; b=n4ba73pQGp33/4
	aSNCR8D3r6w0NFEfOD0XhTJF3Ja5zhjMhNpTIkXsvpXviIyBZzBxXF52xuYwvFpY+4TewmKFHrisb
	yVjYiPjUfIt+KPZP+5EwRm4MFSKPnenwClI4iDhlCAt99zqhQCwOdmNYqDPtKticHutg4OGDTzy6i
	pfDophXbZDdV3Lpub/Zxix6iPneQGSUlpjHJmcLKF2eFESq00joDbn15XhAfy+zt0qyWWUQhmxFV/
	qHxEuVJUM5fn9+4sT595lFuBN9bRqWfKY5PXATiQ0lrVbar2/wgaQhGZ209dFxkdi3UiXNo7YsNOa
	9GfNyLjWruKaLpnG/hiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC96-0000000Gk7H-2plT;
	Wed, 28 Jan 2026 20:28:12 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC92-0000000Gk1k-05oH
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6D0C860129;
	Wed, 28 Jan 2026 20:28:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58BBC16AAE;
	Wed, 28 Jan 2026 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632087;
	bh=CVgk8+0DOVtFgoErfuPTKgd5FmJ8SBgjgEb/2k9FVe0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kDZothHsC0SE8ArM14vzOmB2tLd6uqZJD2C7GffaxHZCpyXZzeTwICgFm+oOrsdi9
	 X34I9y9dnybmX7RDdxZhH37D2zJ2OV5sv4fucC+OQ8cReAtMCLRYgifhnsBcUu+HGb
	 AI0sYUs1pD041F6ocDMXoVPuKq7DPzQnTAxnZcYkd2MM1lE1d0SBfsgRpFIyYZcPca
	 qCZzHlrndkQA1isP7juA53jOdMhnmbDg3kaFJ+ln+YpPx1f0B0SbqXemecZfrn2F+l
	 GcByaXMx/6g6n72pauP2macgso9Xwh6tza7xI4TWqIRgK85kg0PZbJlgg9rJH+hHnN
	 VlE/2e25nT6oA==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:28 -0800
Subject: [PATCH RFC v2 07/17] RISC-V: QoS: define prototypes for resctrl
 interface
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-7-dca586b091b9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767; i=fustini@kernel.org;
 h=from:subject:message-id; bh=CVgk8+0DOVtFgoErfuPTKgd5FmJ8SBgjgEb/2k9FVe0=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQaISj0rOd11wV6vnWOx8sInCgdUZy9k6P2y3P/8+
 osX9jQ/7ChlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBM5KccI8PXgsPcf53ecDCc
 b+N+X7AozrJql6dE/4d3L3qcPd6vOXuN4a+s+8eYNw4n9+eZ5s/7vOnUuukl/E8eWqZe7cy+d/T
 9iSvsAA==
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

Define the prototypes for the resctrl interface functions that are
implemented on RISC-V.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
[fustini: rebased on current upstream]
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 include/linux/riscv_qos.h | 44 ++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 44 insertions(+)

diff --git a/include/linux/riscv_qos.h b/include/linux/riscv_qos.h
index 51c3a96bbcd0..0c551ed85fe1 100644
--- a/include/linux/riscv_qos.h
+++ b/include/linux/riscv_qos.h
@@ -3,6 +3,7 @@
 #ifndef __LINUX_RISCV_QOS_H
 #define __LINUX_RISCV_QOS_H
 
+#include <linux/resctrl_types.h>
 #include <linux/iommu.h>
 #include <linux/types.h>
 
@@ -31,4 +32,47 @@ struct cbqri_controller_info {
 
 extern struct list_head cbqri_controllers;
 
+bool resctrl_arch_alloc_capable(void);
+bool resctrl_arch_mon_capable(void);
+bool resctrl_arch_is_llc_occupancy_enabled(void);
+bool resctrl_arch_is_mbm_local_enabled(void);
+bool resctrl_arch_is_mbm_total_enabled(void);
+
+struct rdt_resource;
+/*
+ * Note about terminology between x86 (Intel RDT/AMD QoS) and RISC-V:
+ *   CLOSID on x86 is RCID on RISC-V
+ *     RMID on x86 is MCID on RISC-V
+ *      CDP on x86 is AT (access type) on RISC-V
+ */
+u32  resctrl_arch_rmid_idx_encode(u32 closid, u32 rmid);
+void resctrl_arch_rmid_idx_decode(u32 idx, u32 *closid, u32 *rmid);
+void resctrl_arch_set_cpu_default_closid_rmid(int cpu, u32 closid, u32 pmg);
+void resctrl_arch_sched_in(struct task_struct *tsk);
+void resctrl_arch_set_closid_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+bool resctrl_arch_match_closid(struct task_struct *tsk, u32 closid);
+bool resctrl_arch_match_rmid(struct task_struct *tsk, u32 closid, u32 rmid);
+void resctrl_arch_reset_resources(void);
+void *resctrl_arch_mon_ctx_alloc(struct rdt_resource *r, enum resctrl_event_id evtid);
+void resctrl_arch_mon_ctx_free(struct rdt_resource *r, enum resctrl_event_id evtid,
+			       void *arch_mon_ctx);
+struct rdt_domain_hdr *resctrl_arch_find_domain(struct list_head *domain_list, int id);
+
+static inline bool resctrl_arch_event_is_free_running(enum resctrl_event_id evt)
+{
+	/* must be true for resctrl L3 monitoring files to be created */
+	return true;
+}
+
+static inline unsigned int resctrl_arch_round_mon_val(unsigned int val)
+{
+	return val;
+}
+
+/* Not needed for RISC-V */
+static inline void resctrl_arch_enable_mon(void) { }
+static inline void resctrl_arch_disable_mon(void) { }
+static inline void resctrl_arch_enable_alloc(void) { }
+static inline void resctrl_arch_disable_alloc(void) { }
+
 #endif /* __LINUX_RISCV_QOS_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
