Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5843DD2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bggKfPCwldXGXAMn/Q8reMSQZSPN7IqxN1m7gJVMMrI=; b=BM7YT3UTyQLANF
	xqZtyGidKUR/4jOAXbcg7BGGYukNO27UuhIzizdPWcFPllQwSiBaLsXm+i0UjlUydZrgDREHYEv2t
	BvGG2rywp4ixsdfKrQEQe2JFsOnvEYe97dSu3bWoJ4GRdmbKTBjiP2H1avYDdDec1MLjFasik93Pf
	UT95j61ibdKsmEbHdsckuVjvrVzthwYoRUf8sk+Xp8XiD1pAEl8n8E2j2LEQvVGWuqzDH6+Vbe2ru
	RJoa/yenhlojI4mODtZ0zItPqQr86LsxEjv0gUfG2RybLj+YViRahoQpqGh3/YTckFOjC9w9rnP/O
	yMkLZGkhOiwfeVNmtZTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39t-000000039Vx-2g1u;
	Tue, 20 Jan 2026 04:16:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39F-000000039L0-0iKw
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6AADB4394B;
	Tue, 20 Jan 2026 04:15:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3530C2BC86;
	Tue, 20 Jan 2026 04:15:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882520;
	bh=W0zogC96arTBm1Kk9wlCZRwh/gtmVd8rFFkcBWq21X8=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=iTqecJFgy7DP7NJEXOG0D+7xVxQpbpFr7ExRdsq8hnn7jzrAeapDKTeemFT3VCg/k
	 ugjrp/u0Bq74wcUnOJUUJDcU/5a5RK4B8FbgUzuMPibkq8zvqnHugbf7U2rS35INK7
	 NG+/+r+PO4JCWAVPXmNRcTNDDXoV075Bv6Ychxyb3DfobiKFZby2PIIoGPBU0PrPU4
	 Te++cye6IHxqeETHYapq1519jlMVONamWiWWqf5H1+JHRkrDxfErpbmz3FNwPOA0es
	 difE0Lh3wNUtWpdgi9creZ0DynzBJJzi/hC0O2KBFksYqPMzZXjDtFKUBfVcX//pEs
	 vkj6bwVoi0jxw==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:43 -0800
Subject: [PATCH RFC 06/19] RISC-V: QoS: define CBQRI resctrl resources and
 domains
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-6-aa2a75153832@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1672; i=fustini@kernel.org;
 h=from:subject:message-id; bh=W0zogC96arTBm1Kk9wlCZRwh/gtmVd8rFFkcBWq21X8=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwZNSRLbqHRN41jHZ+f3/4p3tXBd8bolqeqnpzvxm
 PT5bVGHOkpZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATmbKf4X/dW63JwsGf3j5a
 fP2myTNf9SVGr/PNtfbaXnXlqD+wOSeD4a80d7iIif7v6rZ5c646TTr8151x7fm0ttCnv54I1Gf
 PE+UDAA==
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201524_807049_EE278588 
X-CRM114-Status: GOOD (  10.09  )
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
[fustini: rebased on riscv/for-next]
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
