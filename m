Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB823D116F3
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 03:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=k/nbE2ACEbea+/U/OX+GjxoR/j+iJtk1tgRiTmzce1g=; b=UgOTSEUUAQksAX
	T3CHiqHhrrlr3XK1U+RrK8R66eFihwGX6/PfOMsfu0W3Gky5mXc+ahC1WpQII7aPgrhwTwerRnFyO
	nz4dzXNJLBzPXnlDQ/WWqjhdgxgE9+4AZk1uOr6RUtToXWVGi22fqRSyUgtZGqLd2qEr7FkvEC3mC
	MMCUH6vXp90TbkIbRPPZa1VfmWEiMm/7+Q+suF8W+PlyjLswVKalueNKZNbNWcBo+5xJkoVngJyxe
	nmVNOL4LOrkuyD6IJmED33+QeDfsSb+rwyiHflEFrOZ0/PkGKca2eRvq7ATcY04g5bRtGa8jlalAo
	lCJ4cEEqVw6nu0Faqw/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdR8-000000064OX-1LmI;
	Wed, 03 Dec 2025 03:21:50 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQdR5-000000064Nx-2l0u
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 03:21:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=zG
	BGq2OtLr/Tw+dOoyB+U8Aa2Y5bi5NGEkZsJSUoqR4=; b=ismz0VN6S1IQx6cpWG
	yq39uCK6PiH/Df++6voqJqSpfCJbjEi25Clh2mpgJYwelfS1p6qkbPz+e0eCMfsr
	SygSHyIiCXskBbnyMGcsT2aAI6pnenkvymcG/MuBdfQasmsE7N7DrAel9WToB79x
	6pi+zAwN4/4FZcDvmolp+mIos=
Received: from duge-virtual-machine (unknown [])
	by gzga-smtp-mtada-g0-2 (Coremail) with SMTP id _____wDnR4amrC9pKWlQDg--.349S2;
	Wed, 03 Dec 2025 11:21:14 +0800 (CST)
From: q691800735@163.com
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Alexandre Ghiti <alex@ghiti.fr>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	jybruceupup <q691800735@163.com>
Subject: [PATCH] dt-bindings: soc: canaan: Add K230 power domain bindings
Date: Wed,  3 Dec 2025 11:21:07 +0800
Message-ID: <20251203032107.31388-1-q691800735@163.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: _____wDnR4amrC9pKWlQDg--.349S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uF1fJr47WFWDWrW8Zw47Jwb_yoW8Cw4kpF
	yrCr95Gr4UJr1Skw4Sga4Y9343u3ykCr12y3sxWr1qyF4DWr1jqwnagF9Fvr9rArsa9r4I
	vF9IkFnI93y7ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRHv3UUUUUU=
X-Originating-IP: [223.160.207.238]
X-CM-SenderInfo: jtwzimyqqxjki6rwjhhfrp/1tbiFA4ZMGkvpbKuvQAAsx
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_192148_236338_77E53023 
X-CRM114-Status: GOOD (  11.61  )
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

From: jybruceupup <q691800735@163.com>

Add device tree bindings for the Kendryte K230 power management domains
(PM domains), which control power gating of core peripherals (I2C, SPI,
MMC, AI2D).

Key properties:
- compatible: "canaan,k230-pm-domains"

This binding follows the Devicetree Specification v0.4 and upstream
PM domain framework requirements. It is a prerequisite for peripheral
drivers requiring power gating control.

Signed-off-by: jybruceupup <q691800735@163.com>
---
 MAINTAINERS                                      |  1 +
 include/dt-bindings/soc/canaan,k230_pm_domains.h | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/soc/canaan,k230_pm_domains.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 4d456982a..13cdbf647 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22106,6 +22106,7 @@ P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
 F:	arch/riscv/configs/k230_defconfig
+F:	include/dt-bindings/soc/canaan,k230_pm_domains.h
 N:	riscv
 K:	riscv
 
diff --git a/include/dt-bindings/soc/canaan,k230_pm_domains.h b/include/dt-bindings/soc/canaan,k230_pm_domains.h
new file mode 100644
index 000000000..e212126e4
--- /dev/null
+++ b/include/dt-bindings/soc/canaan,k230_pm_domains.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+
+#ifndef _DT_BINDINGS_SOC_K230_PM_DOMAINS_H
+#define _DT_BINDINGS_SOC_K230_PM_DOMAINS_H
+
+#define K230_PM_DOMAIN_CPU1       0       /* CPU1 subsystem */
+#define K230_PM_DOMAIN_AI         1       /* AI Subsystem */
+#define K230_PM_DOMAIN_DISP       2       /* Display, 2.5D Engine */
+#define K230_PM_DOMAIN_VPU        3       /* Video subsystem */
+#define K230_PM_DOMAIN_DPU        4       /* 3D-struct Engine */
+#define K230_PM_DOMAIN_MAX        5
+
+#endif /* _DT_BINDINGS_SOC_K230_PM_DOMAINS_H */
-- 
2.52.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
