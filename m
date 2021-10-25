Return-Path: <SRS0=nFT5=PN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6657AC433F5
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:21 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 33E2160C41
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Oct 2021 19:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 33E2160C41
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDXcEqjGmT066ohyOTqzY9/gWGAFxv2HVI49OTrDNS4=; b=DnucqyAfpBlbUH
	X8uk+LqGTuI6CartAaseTNV44iOi+2HtY49emeFcyMGAt2FVel+hfiQghcU7FTd+qHrz5TzNpxK7Z
	H+hGlQ8vVSaw0cJzWSCYru2uzgLzuGfs+/cFf1TIVr2zP0iiADzc+jGBSd1ALjph19ghexyXafUZl
	B3CA/gfm1V+bufTu9kEwG7mzwYpNG3QQKd4NukgReYm2+ZGDl62+rSv3T/YKLo9Dc4gWj9VAmceJR
	MGa4bwf3OywkEYBV3WE+8aj3yoMuG8N4xcx2azWtELRo1eNBUisTEYQ5EIS3LpSPuoKvdNaVB/HJ+
	spbsqXUpNpDMblClNiwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mf62v-00HVMe-97; Mon, 25 Oct 2021 19:54:13 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mf62j-00HVBN-07
 for linux-riscv@lists.infradead.org; Mon, 25 Oct 2021 19:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1635191640; x=1666727640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x9rut2p2cIJl+gOrMDwXO7QvojhOGcINHMZCJqud62c=;
 b=jT6FerKcnCLvr+rOtChbBnTptrVEce4xeDhd7qag8849ZFRl1HxRkXlU
 6XJWUw5YPJdiovr6a0KNmPmrlvLGIZ7Ah+uDFHPkBMQ7MbueRubeX/EWF
 apNZJXq8uuuQmZ9FLeQaLbpf/cZagqCG0iLISH07EzBpmewiOQOmk7Xb9
 1lQamY04c6bUkAKQYi2YuoWCVu3Uo8+xggcgF8wPasD3Ygi1aUjs3b9c2
 sEOd/ZdbPMBWgDEIA+omL8xwBlY1PRTr9VjaNJ7uz5+oBgGRMma97N17f
 kzFzr5yQUYQ6j9ENNGqluKljbxI2DhctFFCIgUsRu0htmM0paCcxgRJj2 A==;
X-IronPort-AV: E=Sophos;i="5.87,181,1631548800"; d="scan'208";a="287682869"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 26 Oct 2021 03:53:57 +0800
IronPort-SDR: tJSxOdigV4usDfPx7+eajB+aSLgMgqOHN1PhBm7H385MZ9G+UtCm51LHQIJK0eK5SMJMHJ6II5
 gpqfT8sRXBA/jGmJP8L+mybm7mscQ8+t9g9sI1D/s6Gb0rIklGPPoCFRhyDYFt0WoL2fJRGQie
 RwTNqTOTaOgP0tUe8g4Rocjblb3J7+sE6n/Y7qF3PIRG+UQl/bpTpjMVuayTbmR0DIqriwHKIe
 LqktNpxtQ4+Nc9a1ktto4EV6IGkulbbHCa5BVq72da3UvraJujRa2ZBODmeGrcMzm8czNA1a2B
 Uo+VCo0dfbz6ApVU4clgzP3F
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Oct 2021 12:29:28 -0700
IronPort-SDR: jLN67SRVfQ+M8+lWYHBkvJyusCdkYeJWN08Daox/eGpo/VDrAkxVzvwHTwfCybR8nuR/tZYPp4
 JmJgABWCz0xAZOxey6qHU60t+vG1WzHC0+21yiIs/mAmmYDnjpmSpez70Ut0VqG1uQ8yImW6bb
 YKLAHOzXWu5cxqZ46dXPImaNjoKNoKf5AKz7P1w0+ybJ1/Ym9X6xcEh+BSI1Ho42yBcGUwTw6u
 psiG/vsL370mzCaA9PsABoDg/AbKi+IYRi3OlnRCsp4jupTcQcNdMMqEDFJBbM/28MXbT3dJfv
 zFM=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.27])
 by uls-op-cesaip01.wdc.com with ESMTP; 25 Oct 2021 12:53:58 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>, Anup Patel <anup.patel@wdc.com>,
 David Abdurachmanov <david.abdurachmanov@sifive.com>,
 devicetree@vger.kernel.org, Greentime Hu <greentime.hu@sifive.com>,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v4 06/11] dt-binding: pmu: Add RISC-V PMU DT bindings
Date: Mon, 25 Oct 2021 12:53:45 -0700
Message-Id: <20211025195350.242914-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20211025195350.242914-1-atish.patra@wdc.com>
References: <20211025195350.242914-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211025_125401_179757_989A2709 
X-CRM114-Status: GOOD (  13.69  )
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

This patch adds the DT bindings for RISC-V PMU driver. It also defines
the interrupt related properties to allow counter overflow interrupt.

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/perf/riscv,pmu.yaml   | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/perf/riscv,pmu.yaml

diff --git a/Documentation/devicetree/bindings/perf/riscv,pmu.yaml b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
new file mode 100644
index 000000000000..497caad63f16
--- /dev/null
+++ b/Documentation/devicetree/bindings/perf/riscv,pmu.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pmu/riscv,pmu.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: RISC-V PMU
+
+maintainers:
+  - Atish Patra <atish.patra@wdc.com>
+
+description:
+  The "Sscofpmf" extension allows the RISC-V PMU counters to overflow and
+  generate a local interrupt so that event sampling can be done from user-space.
+  The above said ISA extension is an optional extension to maintain backward
+  compatibility and will be included in privilege specification v1.12 . That's
+  why the interrupt property is marked as optional. The platforms with sscofpmf
+  extension should add this property to enable event sampling.
+  The device tree node with the compatible string is mandatory for any platform
+  that wants to use pmu counter start/stop methods using SBI PMU extension.
+
+properties:
+  compatible:
+    enum:
+      - riscv,pmu
+
+    description:
+      Should be "riscv,pmu".
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - None
+optional:
+  - compatible
+  - interrupts-extended
+
+examples:
+  - |
+    pmu {
+      compatible = "riscv,pmu";
+      interrupts-extended = <&cpu0intc 13>,
+                            <&cpu1intc 13>,
+                            <&cpu2intc 13>,
+                            <&cpu3intc 13>;
+    };
+...
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
