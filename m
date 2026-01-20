Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1EC8D2ED0F
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Jan 2026 04:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:In-Reply-To:References:Message-Id:
	MIME-Version:Subject:Date:From:Reply-To:Cc:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0WcrDG2IIo9zTYuGhAZI4dlGmLM+c40ufboWqc6DoEc=; b=OCWucEHvs3aCJS
	/906Tb9U16/wEhiAKXd8YzTPI50Y7WGPaGBioZdsgk5YewQIrWdBcBE2rjkAjIqu5qM+ksI0D3cti
	N+vDbRQ6w1oGvBnSiIn23WJak8/JDDMjirtc3z7FYVQjCwftxjZuDTk/n5WarzilgnnLJ8C0YdZZl
	lQWHUb9Mi9q6ZYm4U2vBSN+oifRzJd8fiASK7hE8rekWJpnrTGjB/zdorYcSr9hBi4PnUkSAma/H8
	Rq59FTIB5cEuBsuwaX4+wdGDGItK0d1mABaNSc4dNR3ushAFfX3DUvaknPGc8qe7zvtrKcAHvb7nw
	ZBUeHGA2mvfEHLybBDGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39u-000000039Wh-1U6t;
	Tue, 20 Jan 2026 04:16:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi39b-000000039O2-154W
	for linux-riscv@lists.infradead.org;
	Tue, 20 Jan 2026 04:15:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5786344561;
	Tue, 20 Jan 2026 04:15:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42B5C2BC87;
	Tue, 20 Jan 2026 04:15:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768882523;
	bh=jw+AW2ohMGVwE01frppRYwsxi/H3/LBPifNRE5CWvac=;
	h=From:Date:Subject:References:In-Reply-To:To:From;
	b=tzHYKw8w0WWEHMf/ggC0mFgB6cU2ZV861rE5FmdcrE46pVUB/XCmIRYTNdMixY04b
	 85M6AqX5o5XEONNJ6yBsr4+2pJzacEqw1wIno0QTIdX6DIW09pHQ4ww/gi6MkcrAYS
	 S+YP0bEzazZfcmDoNkx22MYjtsyoeAH66jnQeU0lxvhzQ8uhVISwqr38pDFePqlflM
	 5hpR4vta4fjkIYJsVTx3JiaTxL9LhalxXFMzAkTYxvG637Xmf/L74RyGoyUXYouwWL
	 iVZCa3y93s0BEcpfUr9uK/lix93lw4SXzcLqj+e5ofYtdk9g9aJK0dCoc3UNMZX8s8
	 wXuVHKv6fGkEA==
From: Drew Fustini <fustini@kernel.org>
Date: Mon, 19 Jan 2026 20:14:47 -0800
Subject: [PATCH RFC 10/19] RISC-V: QoS: add late_initcall to setup resctrl
 interface
MIME-Version: 1.0
Message-Id: <20260119-ssqosid-cbqri-v1-10-aa2a75153832@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1362; i=fustini@kernel.org;
 h=from:subject:message-id; bh=jw+AW2ohMGVwE01frppRYwsxi/H3/LBPifNRE5CWvac=;
 b=owGbwMvMwCV2+43O4ZsaG3kYT6slMWTmMwbt1VgdKl0yuWPu/DSXozJXF/UK/H63O/t0Wr/xp
 iI5S+6AjlIWBjEuBlkxRZZNH/IuLPEK/bpg/ottMHNYmUCGMHBxCsBEVJcwMvz9s/up6g6nC4/W
 PWj9JvVAO+bjwya3LPWJfxQuLcmw7zzOyHAqtC9qwum584T99q85axFpJJOmsijkzLOkaYrfbGp
 8azkA
X-Developer-Key: i=fustini@kernel.org; a=openpgp;
 fpr=1B6F948213EA489734F3997035D5CD577C1E6010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_201544_100040_E454485C 
X-CRM114-Status: UNSURE (   9.91  )
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
