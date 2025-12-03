Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA20DD1266D
	for <linux-riscv@archiver.kernel.org>; Wed,  3 Dec 2025 09:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=CGCykBZyIRxn/gwSORDQ1BBiByH01PuWxVvINrijH1Y=; b=CG9uPiHa9lHvah
	HtSDy/hYUue6XejdzvzFMe7TSGycikTfyDFdRre5aV7Lm3F0boMIM63Ap/pBBjU7jl3+V6aON4s87
	KC3YM/XwtNopmRTMfTUVEgOIDBFMH45yC8savB/Si+MnEb9LCNNQFijd64Nb7Hkqt+Ea+nee6P6gw
	5ScY27jvmRCEce/oOU/EJiw/Tp0iU7gvA2fmJGXu1kCZafaDqm7dpgsJsMuh6vmziPvFSMp04M4Ag
	XNs+jNy0kCcySO8Iexd4zdC+CSTkT72UF8Y3HA0dPKLwBB23SndWQGcJjqEu+8/ZSBI1ZBqCHtCnX
	Eai5qC5ITbQebKwKQlIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj8u-00000006Nrc-1dDl;
	Wed, 03 Dec 2025 09:27:24 +0000
Received: from m16.mail.163.com ([117.135.210.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQj8r-00000006NrE-0m3N
	for linux-riscv@lists.infradead.org;
	Wed, 03 Dec 2025 09:27:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=cC
	riXEwSkN9xvdxEwxwspYlZeXn4Z8eoTNrLXs4V20s=; b=AYQu2abeSgrN2N6eqp
	tft9tG36HedDodduzPMPkpUJz3zs3DUrcUseBnkcgY5w+cxF652ZGeNyv9Hsbd4j
	HtfKv6ZVK0DTG89eY4esn4IuLYjXEXdcQHtQohozo8mgplVFnQwRWA3ssZGIlQGX
	YMaYaDXwxlYYmMUvhQQH506DQ=
Received: from duge-virtual-machine (unknown [])
	by gzga-smtp-mtada-g1-0 (Coremail) with SMTP id _____wDH7UVCAjBp7GVBEQ--.10032S2;
	Wed, 03 Dec 2025 17:26:27 +0800 (CST)
From: q691800735@163.com
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Cc: pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-kernel@vger.kernel.org,
	jybruceupup <q691800735@163.com>
Subject: [PATCH] dt-bindings: soc: Add Kendryte K230 power domain bindings
Date: Wed,  3 Dec 2025 17:26:24 +0800
Message-ID: <20251203092624.219460-1-q691800735@163.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-CM-TRANSID: _____wDH7UVCAjBp7GVBEQ--.10032S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7Zw1DJryDXryxGFWUJF15twb_yoW8AF4rpF
	98CFyfGr4UJr1fAw4Sga4Yvw13Cw4kCr12y3sxXr1qyF1Utr1jqrnagF9Fvr9xArsakr4I
	9F9xCrnI9347XaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pRmjgrUUUUU=
X-Originating-IP: [220.196.194.129]
X-CM-SenderInfo: jtwzimyqqxjki6rwjhhfrp/1tbiFB4ZMGkwAQgaLgABsG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_012721_653731_7E46A5A4 
X-CRM114-Status: GOOD (  10.78  )
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

Add canaan,k230_pm_domains.h to define power domain IDs for Kendryte K230
RISC-V SoC (CPU1, AI, display, VPU, 3D-struct engine).

Update MAINTAINERS RISC-V entry to include the new binding header for
proper maintenance tracking.

Signed-off-by: jybruceupup <q691800735@163.com>
---
 MAINTAINERS                                      |  1 +
 include/dt-bindings/soc/canaan,k230_pm_domains.h | 13 +++++++++++++
 2 files changed, 14 insertions(+)
 create mode 100644 include/dt-bindings/soc/canaan,k230_pm_domains.h

diff --git a/MAINTAINERS b/MAINTAINERS
index 980a3d5d6..d83920cbc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -22105,6 +22105,7 @@ C:	irc://irc.libera.chat/riscv
 P:	Documentation/arch/riscv/patch-acceptance.rst
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git
 F:	arch/riscv/
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
