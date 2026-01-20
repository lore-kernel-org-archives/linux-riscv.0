Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 657B0D2ED12
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=kkYHWwpptLuRTLCLXSXS4EbQBkiBrZxUV7TNERnijm0=; b=blDPjf2e6O16R5
	Xg29OcjCbF1PVUoWLFUx5xPz84Z96Yc5wBQWZ4L0i82Aqpa+KNi+NDna4gX2rHwCdv7ATXrLQP8Zm
	IO7Ka30896etkeCXurU5HKy9eFsYvXknFQnJ0bdjBJQW1A0Umm18MYrPy2+52bhzrXFX+p9Lk6WeY
	eRWqCS50fKTlyLNXrfFZkHXDhZ4fQwfeXPz/5siiNfFVxsG+RSbEnxP0kUnKNi+5LS3FSBQ++gaA9
	RQbnAZT79KVJp8hB33SleBe+H6wZ2K5lO1p7M+lrdzEwj5neumgCgCHopEU8AJMNHp0zdsyXqybOE
	R8RufNt6c30/FF4W/CKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39t-000000039Ve-1Jky;
	Tue, 20 Jan 2026 04:16:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39F-000000039L1-0xo8
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DAFDD444EA;
	Tue, 20 Jan 2026 04:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5BEB4C2BCB0;
	Tue, 20 Jan 2026 04:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882520;
	bh=VY+L/H7NAb+kbLIgJH0JdAYq+trW362UFibAaSaVSAU=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=tJrWM4Jlv8EPiNguXi34IMmH900SeLGHOZKnLesPNJ3HxYkOle3hygR3We4ASD7QD
	 tDGiAZ9C0/hzar4PZkjwedtXys5obJMOBOyxyeoDNZ8l0ARpcSY+s+Y+X80LXq8BLL
	 EJ9xZJK5BI1gZ4rqiIoPSBb/he6UJRMT2BeCiMZh6JuWBTP7n3CneJ+vRBLYCFKNye
	 YHiwXT3E8QOn+pwjF2/PyENV3IwYbi/4EZMnt46JDYrdpkjVsZ6I+dUUC1QyTzwcmv
	 6hsdNewZriAif/INmK6b8vr6a+iklQxqIAi4fiuafVgxfHf3HFgzr/rHKpkSc2K2Em
	 zVQEirZQ4nEjg==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:44 -0800
Subject: [PATCH RFC 07/19] RISC-V: QoS: define prototypes for resctrl
 interface
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-7-aa2a75153832@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2765; i=fustini@kernel.org;
 h=from:subject:message-id; bh=VY+L/H7NAb+kbLIgJH0JdAYq+trW362UFibAaSaVSAU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwZlv0240nxloabf7If7vILvexoe0PBM3nw3NsBX6
 lNMg59SRykLgxgXg6yYIsumD3kXlniFfl0w/8U2mDmsTCBDGLg4BWAiF5czMvQ5y7P3Wzn6ii8r
 u7hkcV6B7aV6x7WOCh3Hdpz8pt6Vspbhf16/75FGy9h3zWb32npTDolJlNtv6ZYqrNT9HBgd934
 VAwA=
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201524_731735_3AA47F5B 
X-CRM114-Status: GOOD (  10.96  )
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
[fustini: rebased on riscv/for-next]
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
