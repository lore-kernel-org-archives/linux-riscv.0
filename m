Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5735D46BFA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=URq6SwM9sx+6v64B2Zo0G3ztW5cBY/3tAuVuetm8e5E=; b=FfyfQuBy3746bV
	X9hTe9STe3KLIKOrk7TRx/AKrCkKeMZIFKYKWAsmJI2n3zf3adIA2gXha1Shj1yQp71+MC/EirVTW
	v/QLHSyBSiBAkClVYAHmxoUYGEy7bQ9uDigls567K84xqUlgPP6aXTn8ycZQ6k/gv+vMO1zUCrM0h
	GpL966svu2TcqT2c5KHHRegBA+D78q03psUhaq4unR2hObhA/sLArEgAxFSAKy69vXWOlQi5A5uke
	RgFBD/u2V2Hvz6LJTBKpKSqz6yUG2aanmTMrmB/N0KypvVUvuDWOrVuly6H/lNOeKp+xReRdvhgjk
	CH5zboiX2p3kmbvbUfrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC97-0000000Gk7r-10XJ;
	Wed, 28 Jan 2026 20:28:13 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC91-0000000Gk19-07GO
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A507E44542;
	Wed, 28 Jan 2026 20:28:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B31DC2BCAF;
	Wed, 28 Jan 2026 20:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632086;
	bh=nRtrIHSuWEDHEeDXLCrpmYAAH9Hp3uZpgjylkcnSlpU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QyoMgQ1PlpsL25i4MmYfj4pTfftDnw7v3FsxFrm0jEker86I3vX4LLM3Vfp5/3oX2
	 0CNeldeXnjcgDuhembANRxNc0zAi7xPH2f7N0zKk9Ql/qiff+RbvLIyJspncWrBJO6
	 gSg1zmnP5UtM7ZF2EVg5Bw3fmIeQZZSpqWOcst/dkdR32o/2GF72e7Z3VR6xOjowhI
	 X4SNGkZm/4G4g0pf9+V7X0VNFnul2tCcpiK7MwzdyfGDpNYwnSNAle1sxZ3UL/qCGJ
	 MPtURsWZmNvZY7R0JKskU0HYVIUF+LxDzIU+i3GXfI39kDlCd0Ue6jqQ5jtJxFC9YJ
	 gFTNMoLDM+uyA==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:27 -0800
Subject: [PATCH RFC v2 06/17] RISC-V: QoS: define CBQRI resctrl resources
 and domains
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-6-dca586b091b9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1671; i=fustini@kernel.org;
 h=from:subject:message-id; bh=nRtrIHSuWEDHEeDXLCrpmYAAH9Hp3uZpgjylkcnSlpU=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQZcWOafc1mIUyQrfPft57MCLq6xf8c35WlDxxZ/h
 trtfz886ShlYRDjYpAVU2TZ9CHvwhKv0K8L5r/YBjOHlQlkCAMXpwBMZFsMw2+2eX9Mbvuknzs9
 +9bmf3fmG1k9iFq368zirCNn7MIYrle0MTIszUg6Kj236ZH6fPNX17YwnmDmXZb4seOg0E0T+23
 drwOZAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122807_113368_07705DE4 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

Define data structures to encapsulate the resctrl resource
and domain structures.

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
[fustini: rebased current upstream]
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/kernel/qos/internal.h | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/qos/internal.h b/arch/riscv/kernel/qos/internal.h
index ff2c7eff50be..c0402dd06cfa 100644
--- a/arch/riscv/kernel/qos/internal.h
+++ b/arch/riscv/kernel/qos/internal.h
@@ -65,6 +65,11 @@
 #define CBQRI_BC_ALLOC_CTL_OP_READ_LIMIT   2
 #define CBQRI_BC_ALLOC_CTL_STATUS_SUCCESS  1
 
+int qos_resctrl_setup(void);
+void qos_resctrl_exit(void);
+int qos_resctrl_online_cpu(unsigned int cpu);
+int qos_resctrl_offline_cpu(unsigned int cpu);
+
 /* Capacity Controller hardware capabilities */
 struct riscv_cbqri_capacity_caps {
 	u16 ncblks; /* number of capacity blocks */
@@ -125,4 +130,26 @@ struct cbqri_controller {
 	bool mon_capable;
 };
 
+struct cbqri_resctrl_res {
+	struct rdt_resource     resctrl_res;
+	struct cbqri_controller controller;
+	u32 max_rcid;
+	u32 max_mcid;
+};
+
+struct cbqri_resctrl_dom {
+	struct rdt_domain_hdr       resctrl_dom_hdr;
+	struct rdt_ctrl_domain  resctrl_ctrl_dom;
+	struct rdt_mon_domain   resctrl_mon_dom;
+	u64 cbm;
+	u64 rbwb;
+	u64 *ctrl_val;
+	struct cbqri_controller *hw_ctrl;
+};
+
+struct cbqri_config {
+	u64 cbm; /* capacity block mask */
+	u64 rbwb; /* reserved bandwidth blocks */
+};
+
 #endif /* _ASM_RISCV_QOS_INTERNAL_H */

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
