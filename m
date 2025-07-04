Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8FCAC83F05
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Jul 2025 09:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lJ9bOrrXxjPSkIYnIiucPzWD8EBzo68dP/dtnzU/h2M=; b=P3ICcJLRbt+Edj
	Yw7Lf6piDP6yeiOo8Vbb3QnBTAoABax5HQOWegQbiejVu0wVOXZ6Oqd92z5WkZRNw1FZsaZnFqhVV
	e3IcTpxxCv54xMHHJyrHzZvzqOm7K6tzzAsE8Ctvhtgdy9z738lgMdWfMCYbEqsVBPY15M42//TxO
	PHhurapvrKBFyAd32nC1yNjPeILi8XoKfj/dxJcOHdq7Q9Yxi3Av0CZsiR5Ab6Hmg6RUPCkVmGZkm
	f6iOR53FsF9mgZOQTLowTsk1TX4RtO+Kdb9I2+2mqdTY6XBR055HT30zmFyWaFokambx6P5Zrr6yg
	1hbIdzHRK5gG0RO0UFvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXcIC-0000000Dqjm-1SPC;
	Fri, 04 Jul 2025 09:01:12 +0000
Received: from 60-248-80-70.hinet-ip.hinet.net ([60.248.80.70] helo=Atcsqr.andestech.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXbaQ-0000000Dh1K-2VIz
	for linux-riscv@lists.infradead.org;
	Fri, 04 Jul 2025 08:16:02 +0000
Received: from mail.andestech.com (ATCPCS31.andestech.com [10.0.1.89])
	by Atcsqr.andestech.com with ESMTPS id 5648EwqC091878
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 4 Jul 2025 16:14:58 +0800 (+08)
	(envelope-from ben717@andestech.com)
Received: from swlinux02.andestech.com (10.0.15.183) by ATCPCS31.andestech.com
 (10.0.1.89) with Microsoft SMTP Server id 14.3.498.0; Fri, 4 Jul 2025
 16:14:57 +0800
From: Ben Zong-You Xie <ben717@andestech.com>
To: 
CC: <arnd@arndb.de>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
        <aou@eecs.berkeley.edu>, <alex@ghiti.fr>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>, <tglx@linutronix.de>,
        <daniel.lezcano@linaro.org>, <prabhakar.mahadev-lad.rj@bp.renesas.com>,
        <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <soc@lists.linux.dev>,
        <tim609@andestech.com>, Ben Zong-You Xie <ben717@andestech.com>
Subject: [PATCH 2/8] dt-bindings: riscv: add Andes QiLai SoC and the Voyager board bindings
Date: Fri, 4 Jul 2025 16:14:45 +0800
Message-ID: <20250704081451.2011407-3-ben717@andestech.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250704081451.2011407-1-ben717@andestech.com>
References: <20250704081451.2011407-1-ben717@andestech.com>
MIME-Version: 1.0
X-Originating-IP: [10.0.15.183]
X-DKIM-Results: atcpcs31.andestech.com; dkim=none;
X-DNSRBL: 
X-MAIL: Atcsqr.andestech.com 5648EwqC091878
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_011559_195842_54C473B2 
X-CRM114-Status: GOOD (  11.85  )
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

Add DT binding documentation for the Andes QiLai SoC and the
Voyager development board.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Ben Zong-You Xie <ben717@andestech.com>
---
 .../devicetree/bindings/riscv/andes.yaml      | 25 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++++
 2 files changed, 30 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/andes.yaml

diff --git a/Documentation/devicetree/bindings/riscv/andes.yaml b/Documentation/devicetree/bindings/riscv/andes.yaml
new file mode 100644
index 000000000000..aa1edf1fdec7
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/andes.yaml
@@ -0,0 +1,25 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/andes.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Andes SoC-based boards
+
+maintainers:
+  - Ben Zong-You Xie <ben717@andestech.com>
+
+description:
+  Andes SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - andestech,voyager
+          - const: andestech,qilai
+
+additionalProperties: true
diff --git a/MAINTAINERS b/MAINTAINERS
index 6135a36a54a8..f4b4261d3c44 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -21285,6 +21285,11 @@ F:	drivers/irqchip/irq-riscv-intc.c
 F:	include/linux/irqchip/riscv-aplic.h
 F:	include/linux/irqchip/riscv-imsic.h
 
+RISC-V ANDES SoC Support
+M:	Ben Zong-You Xie <ben717@andestech.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/riscv/andes.yaml
+
 RISC-V ARCHITECTURE
 M:	Paul Walmsley <paul.walmsley@sifive.com>
 M:	Palmer Dabbelt <palmer@dabbelt.com>
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
