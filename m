Return-Path: <SRS0=UnsP=HJ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D041EC433E6
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:18 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 514BD64E31
	for <linux-riscv@archiver.kernel.org>; Sun,  7 Feb 2021 23:13:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 514BD64E31
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TAiGY+Yusu2VXndGzKJnwPBCwOLROgrrXSF/XF0sykQ=; b=N/d+eQuVA20fx5VpiL1+ZBeSm
	+tpDshXFR9gJiQ4q2/Jjwnum9wjbtfXlrqC59P+KmJj9WAL2gYNUnV9AWpIoXkXjVxVP6U7UVSRhs
	kw6LKwkz0+hmAQH7inPxzT5aGhrkPja94eY0a15F919EzdYfAveagcnFRjZOHxBZU2lbNJPzrk+FZ
	PVVwqfVLhfSnB3JXKLkBWEjtrCSUjBueps1bHtFGvIR294swG3EWX3c2vMqE6z6JonKJidFIFxgSg
	+5Hyf/VFSkV9C+XotqapQEEC7APfwstwDglYg1CMw8zAoWcmryKgibD1zboFncnR8qvWSXoTHOuAb
	+2ijKyp7g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l8tEq-0006NF-TI; Sun, 07 Feb 2021 23:13:08 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l8tEn-0006M1-P5
 for linux-riscv@lists.infradead.org; Sun, 07 Feb 2021 23:13:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612739585; x=1644275585;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5RPnx9naL44L8pODbHMwPFT+udQFeaq9RcnNssxEXo=;
 b=khA6l4nSGMWJITk75/bhpmDrj2DSFs1WlpsfY7OEP44M6l1rTLgBA1BQ
 ec0MGrLMMk5N7I5ekf/zUq+KjAUF/FC2iWpCDk5JVI8k/7hTPcVtudSFz
 QBOyZ+sOUIC2Be9PwBbFUvyV3T44R78KZ3XCyEKPquf43MfZkwOP351kj
 ZcrmhNGVp38ak+2Q/74OzERtKvBOILK0uiuPRR4CUPTV+/2qaGpfoJVOz
 rSE76pJk8OVOyDzoQw0w04lA06IqdTWaf9FqseKqSCw5muN4fvBiYM0Xo
 hFr9TcCjItK8vaG8GtJ2VTKD5Tms+fYhYolu7QuLGRADrV7qWVIcyNMEN w==;
IronPort-SDR: oLEuMChgLUNfad2uW8RyBBqHw4/a53ZATW8y7NMiy7gWzsLXpbMtaSew6pmHMOnZb7dFaNhiGe
 PZtkyJgP6RKnLY8RTnLxF6Pl9pP2H7BVtwjKKS+5XSX1WmtHmH83yTj72hz8O+UlAfffhJUWbk
 KvhfJSH6ZGPQwddaf34K7xrnkfkz6KM7At6DEkgkw0SzeS+dL5jpkRJLGKf0wCS1Aaxo1tp/3o
 7TaYnVjnO1MGZLCyTao2YTD6VeAnir57yWUZpWg09bVM6L2NL3HpknAH86fEpKbVhUfv+q01bX
 +W8=
X-IronPort-AV: E=Sophos;i="5.81,160,1610380800"; d="scan'208";a="163861249"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 08 Feb 2021 07:13:04 +0800
IronPort-SDR: Gt5hFlo3Okkx3VAvaB8r7RawS5BQ0BpoNr/lAHE4CkDkcW5ANYyQlFFnQDE0dnGgQ9WoS2cJgT
 8H4um0IqrJVOIUk18suL9U5UK/eeBBRspIn8paL69vrs5yhJbAbCA+QiyC0CYmBQQfrUgTpssf
 tEojIgBynkxE924yEwWPWn7QSf3hP+IhGf+rts9PVJAqv1COWISMTamFf4Qnki+4YawNf+VOUE
 CzWX89/H5/qFzZpp376M0pv5uI+0xmnKAMIqvTixxWOABNlEU5+XVRc9sGp0gm1EOnjKGP0ptP
 AmZav+nwOs+LTyvFUj+ucf1l
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Feb 2021 14:55:00 -0800
IronPort-SDR: VK66jiKZ0AydLoNU9tF39WZx9m9H4S8LruBDNXtjmeANlMHBw7+IuyTrczsSLJ6aA78lXT+GAq
 182m6Yl8M0TrUGIBqfYEqKK5iw9VtgGELM/ajQUcz0StMcqQn0NKV/wMyx6cmKOXsTIN6Htpdo
 vve5/wngjNBcvtAHyz5Mj4djjl5vJTrTZFT9eMjzivtL3yfQ2tjur5efvJLcvbLq4cfLGky7t0
 DmcgJBfpjXvICQQWQWy3L1Aqn0pYqrKstk/8CTWPM8q4/jU9MW7SH6d4KbddgkgnaasxToSyh0
 p/E=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip02.wdc.com with ESMTP; 07 Feb 2021 15:13:04 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v17 02/16] dt-bindings: add Canaan boards compatible strings
Date: Mon,  8 Feb 2021 08:12:42 +0900
Message-Id: <20210207231256.115130-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210207231256.115130-1-damien.lemoal@wdc.com>
References: <20210207231256.115130-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210207_181305_953536_BA93A467 
X-CRM114-Status: GOOD (  11.84  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Atish Patra <atish.patra@wdc.com>, devicetree@vger.kernel.org,
 Anup Patel <anup.patel@wdc.com>, Rob Herring <robh@kernel.org>,
 Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Introduce the file riscv/canaan.yaml to document compatible strings
related to the Canaan Kendryte K210 SoC. The compatible string
"canaan,kendryte-k210" used to indicate the use of this SoC to the
early SoC init code is added. This new file also defines the compatible
strings of all supported boards based on this SoC.

Cc: Rob Herring <robh@kernel.org>
Cc: devicetree@vger.kernel.org
Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
Reviewed-by: Atish Patra <atish.patra@wdc.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../devicetree/bindings/riscv/canaan.yaml     | 47 +++++++++++++++++++
 1 file changed, 47 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/canaan.yaml

diff --git a/Documentation/devicetree/bindings/riscv/canaan.yaml b/Documentation/devicetree/bindings/riscv/canaan.yaml
new file mode 100644
index 000000000000..f8f3f286bd55
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/canaan.yaml
@@ -0,0 +1,47 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/canaan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Canaan SoC-based boards
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description:
+  Canaan Kendryte K210 SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - items:
+          - const: sipeed,maix-bit
+          - const: sipeed,maix-bitm
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: sipeed,maix-go
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: sipeed,maix-dock-m1
+          - const: sipeed,maix-dock-m1w
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: sipeed,maixduino
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: canaan,kendryte-kd233
+          - const: canaan,kendryte-k210
+
+      - items:
+          - const: canaan,kendryte-k210
+
+additionalProperties: true
+
+...
-- 
2.29.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
