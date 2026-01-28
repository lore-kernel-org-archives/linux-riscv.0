Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0C7D46BFA
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Jan 2026 20:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WcrDG2IIo9zTYuGhAZI4dlGmLM+c40ufboWqc6DoEc=; b=st9o5QU0CMEvSV
	qbvd3q0tU1pTSMVHyncmVmhSp7pd3qNmqE/cWN2GT0IOs8yiR4zwc2dApWf6wsO0DeKOYgYIZV5Ve
	FESEBjqjx/R94yKgJowmwM57Q/GjlOcr8IM8o6Zg7kHX0dRHaB8yB7LZDhiuPUSV2J/Yu6Msc/6i3
	PuYzjTLHqHULMdJvObmZ/z7quwD4UKdgN1xt6Y6QrzMC0jdDXTWQiz2Ca42DFoz7epJ3Baf0W004X
	xFcDJheCPvD8G+b3eqnTbkwAWCeYmwoyn39cxbGZ4FVthJlGqoUfPgUIerWpCWGbx8XjVQt4HVauX
	p9sd5XCN/vk45gvJmI4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC9L-0000000GkGD-3WCQ;
	Wed, 28 Jan 2026 20:28:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlC93-0000000Gk3G-1Ubr
	for linux-riscv@lists.infradead.org;
	Wed, 28 Jan 2026 20:28:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6B244455A;
	Wed, 28 Jan 2026 20:28:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B83C16AAE;
	Wed, 28 Jan 2026 20:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769632088;
	bh=jw+AW2ohMGVwE01frppRYwsxi/H3/LBPifNRE5CWvac=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PFEyCSFY9buxPwA/UYfJ9y6TzNhi5d7Mf6yymH4zM5ftIqAxhd1mF4xPxnGghHzhn
	 wVGMsgsb4yUrKbkbpI+5juyIXr2R4W2x0YmNhly8WM/cqyQJc6hvE7b0fQEYN8AR3y
	 Di/wJ+Zuj1HCiTCTrlhcodoqTVkKv+tFGNa17wxeALUAzDSeX6fKk9NKtpJ8Aggmp0
	 PeLCIOKP+Z3m9OdCjPGIk5OMnC/GWqilwJHyt9zs8u3apVLhdEATe7N9OPz9t/zM3i
	 lAZx3dNodfFAy350LNxRgFjbn34XG+sijz9MRiyIArDCul9XidFcPasnQGQ6CPi/Cx
	 MepzuFjh+aGUg==
From: Drew Fustini <fustini@kernel.org>
Date: Wed, 28 Jan 2026 12:27:31 -0800
Subject: [PATCH RFC v2 10/17] RISC-V: QoS: add late_initcall to setup
 resctrl interface
MIME-Version: 1.0
Message-Id: <20260128-ssqosid-cbqri-v2-10-dca586b091b9@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=fustini@kernel.org;
 h=from:subject:message-id; bh=jw+AW2ohMGVwE01frppRYwsxi/H3/LBPifNRE5CWvac=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWRWFQbkXNyQ4ne0/N2Myrrrzzb82uG803Fee4CQVrjJ5
 PURjJKzOkpZGMS4GGTFFFk2fci7sMQr9OuC+S+2wcxhZQIZwsDFKQATifnOyDBdaNvy9TZJU7fN
 cne4bfFXNnyS2tGelI9iyy8+8vf+OzGL4X9e5UnDRbFBxsbK4pN3Osyqf3m/y7RColuJ64Bh0sl
 tW3kB
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_122809_463940_C07A0A63 
X-CRM114-Status: UNSURE (   9.42  )
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

Add late_initcall which checks if the Ssqosid extension is present, and
if so, calls resctrl setup and sets cpu hotplug state to "qos:online".

Co-developed-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Adrien Ricciardi <aricciardi@baylibre.com>
Signed-off-by: Drew Fustini <fustini@kernel.org>
---
 arch/riscv/kernel/qos/qos.c | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/qos/qos.c b/arch/riscv/kernel/qos/qos.c
index 7b06f7ae9056..2cd5d7be1d10 100644
--- a/arch/riscv/kernel/qos/qos.c
+++ b/arch/riscv/kernel/qos/qos.c
@@ -1,5 +1,32 @@
 // SPDX-License-Identifier: GPL-2.0-only
+#include <linux/slab.h>
+#include <linux/err.h>
+#include <linux/cpu.h>
+#include <linux/cpumask.h>
+#include <linux/riscv_qos.h>
+
+#include <asm/csr.h>
 #include <asm/qos.h>
 
+#include "internal.h"
+
 /* cached value of sqoscfg csr for each cpu */
 DEFINE_PER_CPU(u32, cpu_srmcfg);
+
+static int __init qos_arch_late_init(void)
+{
+	int err;
+
+	if (!riscv_isa_extension_available(NULL, SSQOSID))
+		return -ENODEV;
+
+	err = qos_resctrl_setup();
+	if (err != 0)
+		return err;
+
+	cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "qos:online", qos_resctrl_online_cpu,
+			  qos_resctrl_offline_cpu);
+
+	return err;
+}
+late_initcall(qos_arch_late_init);

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
