Return-Path: <SRS0=Q8j1=OA=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98876C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 19:28:55 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 65D28610C7
	for <linux-riscv@archiver.kernel.org>; Fri, 10 Sep 2021 19:28:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 65D28610C7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iDXcEqjGmT066ohyOTqzY9/gWGAFxv2HVI49OTrDNS4=; b=I9UniWVu8f+RsI
	O6QTCePuPMbfJ2mJ9dRfy9wf1HAiRdq1JrZC0jFNi+8xHU/tirOPM+utGxc+2TSTCygklKtjg4q8b
	f2ykszO/Z6mU+80i2iDpjmOl6KE+cvFg83wTpY81fpm08ijnpwa0HWX8PkP08STT88fpgo0onXBTO
	M9vBctY1xz/x4WqaSCgEp5VfoC7GORTB0dU/nFOXtYilSGSKakvfxhKrA++IGKNVIQ59/mub+ZPgc
	0uyInqZEJ91ckVF7yAE9N2OBXT6yfTXFgoH09qRgqOn8cDa/CP/wMhHGklyhhRiZZYCLeEYcMuWM+
	vFUWBZRmnZLiYrg+RVOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mOmCS-00DZoT-Ez; Fri, 10 Sep 2021 19:28:36 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mOmCH-00DZfj-Pg
 for linux-riscv@lists.infradead.org; Fri, 10 Sep 2021 19:28:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1631302105; x=1662838105;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=x9rut2p2cIJl+gOrMDwXO7QvojhOGcINHMZCJqud62c=;
 b=N2pUQ3srNq6xt0r+vC++cwhkTxsbmcMpTe2n+pZZ41dm4oUaMUeQG13o
 CkGyeRRSysxs7QydtkJgofiukUl5YL5AyBSKkJ4QyRl9duw3Ab8CGfc7T
 hj+2S0aq/oCysXV9QvUwf1w8KkWH1VVUGxekpxIlJ0AeV/2RhEY1t88Ym
 iJ6ic27ep9pkDNAg8xsMUFC8IswlAwnJXf+25VkNGE1PdmZDlk5y2D8eR
 KaGGvQgsEjXHmhTBHiuITLMqxtLVW84sG3TbM4YpYHsbNee38ZcpQWkQ8
 5tkdLvPV91CiBHBebqaH4I4YhNTaMkrhsbvCIw2+f5VmQOM8P4g/Z0uLE Q==;
X-IronPort-AV: E=Sophos;i="5.85,283,1624291200"; d="scan'208";a="283504180"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 11 Sep 2021 03:28:23 +0800
IronPort-SDR: FhwqvE4WyAtaSBehrQu61f1+z+C7/LjXLM6lNfk0N9GOMaQIRhmXztO0E3piTYdMm1zwL3N1V8
 Q/1mZ/9stFcX3vKKvzvzX74nM//PoGUVZ9L2XoXrBnbn0uKCk5hDQySC1flRKJE6p7ybY9Zrpm
 WiJ6f6LmykwJocje6OGVxcB9EFdd6PyQ7zKGsMsrSXycNONh77q4zlH0y/exA0+SBmXPpv9Zlf
 eJAxkfR7isUid3TVEuh0Pnes4q6ZAr01oo/kdThtfMQLMREdgDqUEYkZVEXbX4FThn4L+2QYsD
 R0UR+qOMJCIZw17oPpcRHcLZ
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Sep 2021 12:04:52 -0700
IronPort-SDR: SllFO2XYLXRp7dP6K2yczVZza3pYVg3Q1IWrDiHd2rH/A2Xe+SCVxsIrXeBwO0bIqBNWpyeXS+
 j8ZDWXZ6eAmZBacGZxQHywh9FAwb0qkjCKIgUJMGMSJrZyGWDH7poiJ5YRxRy2ee7k5aXJuSJf
 c7RBmNx0CzIsq7fiM/SwUrTZlX6d26vN/FtosvVv03Rq8mE35vo3cu+ueZj4BQJ2V4QkL4w5AH
 +TQB5S2xN03lcLhUqo2uAbyQTEH0A+RPeWpSJI1TEAOUtYx1n0J92dIBvMcDfKM6wTN5Lv+zSc
 mOQ=
WDCIronportException: Internal
Received: from unknown (HELO hulk.wdc.com) ([10.225.167.73])
 by uls-op-cesaip01.wdc.com with ESMTP; 10 Sep 2021 12:28:23 -0700
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Cc: Atish Patra <atish.patra@wdc.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Anup Patel <anup.patel@wdc.com>, Ard Biesheuvel <ardb@kernel.org>,
 "Darrick J. Wong" <djwong@kernel.org>, devicetree@vger.kernel.org,
 Guo Ren <guoren@linux.alibaba.com>,
 Heinrich Schuchardt <xypron.glpk@gmx.de>, Jiri Olsa <jolsa@redhat.com>,
 John Garry <john.garry@huawei.com>, Jonathan Corbet <corbet@lwn.net>,
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org,
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Rob Herring <robh+dt@kernel.org>,
 Vincent Chen <vincent.chen@sifive.com>
Subject: [v3 06/10] dt-binding: pmu: Add RISC-V PMU DT bindings
Date: Fri, 10 Sep 2021 12:27:53 -0700
Message-Id: <20210910192757.2309100-7-atish.patra@wdc.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210910192757.2309100-1-atish.patra@wdc.com>
References: <20210910192757.2309100-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210910_122825_920422_F1E1104A 
X-CRM114-Status: GOOD (  13.50  )
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
