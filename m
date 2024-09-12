Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76E8EED623
	for <linux-riscv@archiver.kernel.org>; Thu, 12 Sep 2024 16:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mY8B/ORZzPQffko3pZC/tMN3UoWwrWRZEojLGHY0XaQ=; b=PXiK0QMV8E2mAl
	7AOU2lkP4o9bmreR4TzIjw93fuMTIQjHXu5e5x196XYtv4DefwB5Lq9bfUkugGCxfywqRI7awg2yv
	fnqsmuaMymUMLfByFlUrq8jOQtadnbZT+z8LZpycl/k9JHpPcezWF6TURIuHQXt7Q8OENUnPJ13zG
	e0zN3vKwMXKqY8gwQJQZgpevbSBZuwl3o3TgRh/CRQ6iG8/JRA8gzVjb8N8qc+4GXhx/yCJSOUTyK
	fsZMl8zWMwmzTTt/3nsd6dchWa8GYRJnacra5KQLMZ4DiZ1258+lm8ZVdeU5twPTMKqFNFiBNYnZE
	V0nkyEpa4rISqxHpW5HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somzg-0000000DknD-2NIU;
	Thu, 12 Sep 2024 16:48:32 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1somzd-0000000Dkkk-0uKV
	for linux-riscv@lists.infradead.org;
	Thu, 12 Sep 2024 16:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1726159709; x=1757695709;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=x3u05EVznPAGnkceHj/1/uplFGC0eCJkpbZwedr6SL4=;
  b=bq+k0W974ddd8+u0W7yozfYmov/c80cRkOH7BNNKczmRebwToj1YnDTb
   Is6Sf5wilrCoasZfh4xO6QvpCTWN6f00ItVEkwA9EVgrz1t1prmpd+3zt
   Ln8RV+3DgctLlKjNBktackS0jLd/Cl/K8VkucQ/qRSo0t0bg8YkMSVk7M
   FEC5iWCnTq2iP/f1S/XPkbtFnKHZE0dG7PxlGFkkQ9ktvyYI1wXWF3O/p
   9DsmiAfDGPKHi55r9a/moxpMfdxQ76NORxN6W+Co9Q0+AlFEZXBchHnCK
   DmGlYurgHXjPaV3+nlOWg2QcTbK8qKVsvVgY++Uffdsl2X/H38dAacY7c
   Q==;
X-CSE-ConnectionGUID: DQLE4LE3SvKX/JE8rC2tCg==
X-CSE-MsgGUID: nDwqZKPbQEawD14eamXSww==
X-IronPort-AV: E=Sophos;i="6.10,223,1719903600"; 
   d="scan'208";a="32331231"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 12 Sep 2024 09:48:26 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 12 Sep 2024 09:47:57 -0700
Received: from valentina.microchip.com (10.10.85.11) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2507.35 via Frontend Transport; Thu, 12 Sep 2024 09:47:54 -0700
From: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<peterlin@andestech.com>, <dminus@andestech.com>,
	<conor.dooley@microchip.com>, <conor+dt@kernel.org>, <ycliang@andestech.com>,
	<jassisinghbrar@gmail.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
	<andersson@kernel.org>, <mathieu.poirier@linaro.org>,
	<valentina.fernandezalanis@microchip.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH v1 4/5] dt-bindings: remoteproc: add binding for Microchip IPC remoteproc
Date: Thu, 12 Sep 2024 18:00:24 +0100
Message-ID: <20240912170025.455167-5-valentina.fernandezalanis@microchip.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
References: <20240912170025.455167-1-valentina.fernandezalanis@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240912_094829_352456_37BEC216 
X-CRM114-Status: GOOD (  15.74  )
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

Microchip family of RISC-V SoCs typically has or more clusters. These
clusters can be configured to run in Asymmetric Multi Processing (AMP)
mode.

Add a dt-binding for the Microchip IPC Remoteproc platform driver.

Signed-off-by: Valentina Fernandez <valentina.fernandezalanis@microchip.com>
---
 .../remoteproc/microchip,ipc-remoteproc.yaml  | 84 +++++++++++++++++++
 1 file changed, 84 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml

diff --git a/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
new file mode 100644
index 000000000000..1765c68d22cf
--- /dev/null
+++ b/Documentation/devicetree/bindings/remoteproc/microchip,ipc-remoteproc.yaml
@@ -0,0 +1,84 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/remoteproc/microchip,ipc-remoteproc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip IPC Remote Processor
+
+description:
+  Microchip family of RISC-V SoCs typically have one or more
+  clusters. These clusters can be configured to run in an Asymmetric
+  Multi Processing (AMP) mode where clusters are split in independent
+  software contexts.
+
+  This document defines the binding for the remoteproc component that
+  loads and boots firmwares on remote clusters.
+
+  This SBI interface is compatible with the Mi-V Inter-hart
+  Communication (IHC) IP.
+
+maintainers:
+  - Valentina Fernandez <valentina.fernandezalanis@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,ipc-remoteproc
+
+  mboxes:
+    description:
+      This property is required only if the rpmsg/virtio functionality is used.
+      Microchip IPC mailbox specifier. To be used for communication with a
+      remote cluster. The specifier format is as per the bindings,
+      Documentation/devicetree/bindings/mailbox/microchip,sbi-ipc.yaml
+    maxItems: 1
+
+  microchip,auto-boot:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If defined, when remoteproc is probed, it loads the default firmware and
+      starts the remote processor.
+
+  microchip,skip-ready-wait:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description:
+      If defined, the master processor will not expect a ready signal from the
+      remote processor indicating it has booted successfully. This allows the
+      master processor to proceed with its operations without waiting for
+      confirmation from the remote processor.
+
+  memory-region:
+    description:
+      If present, a phandle for a reserved memory area that used for vdev buffer,
+      resource table, vring region and others used by remote cluster.
+
+required:
+  - compatible
+
+additionalProperties: false
+
+examples:
+  - |
+
+    reserved-memory {
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        contextb: contextb_reserved@81000000 {
+          reg = <0x81000000 0x400000>;
+          no-map;
+        };
+    };
+
+    soc {
+      #address-cells = <2>;
+      #size-cells = <2>;
+
+      rproc-contextb {
+          compatible = "microchip,ipc-remoteproc";
+          memory-region = <&contextb>;
+          mboxes= <&ihc 8>;
+      };
+    };
+
+...
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
