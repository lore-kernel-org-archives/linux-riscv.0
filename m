Return-Path: <SRS0=XTRi=GV=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6FD7C433E6
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:13 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7B18D224DF
	for <linux-riscv@archiver.kernel.org>; Mon, 18 Jan 2021 02:03:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7B18D224DF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uO1ZhrW3kyGlfEoBIZuvsLgq8Wph9021hyjAumaugoQ=; b=c/vQyMHXm6MSf7lwQC6TZw5ln
	aI+/HZhnaSCREBJLU6SXDm8KmRVvXUHCcWGvc+eqhM19PpC8gdGL858vDGK952xkbrQDkOzPdUzSP
	K7UgDuwoEL0uuwtXTZngqWeBQdqTv+gHyNXMenTxirWT+95Gb3iKPO9gzS2Sq+Uf3EtwqN7lyj7mJ
	2Tl/X1g75isungJVb910+W+Zycnc2TstOXyP60YFtyi43wncH2OfJ6H5db2R+48Q/LtmLJS8OipT6
	oRtFMyBD325C2TczwL2L8iIHkDemhP00z9Ej/6I8lbV37IxCBKwOxpJ5Bog1ZkmHtQT2dim5FsADq
	J1G4id6GQ==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l1Jsm-0003Yg-Bb; Mon, 18 Jan 2021 02:03:04 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l1Jsj-0003X9-Ly
 for linux-riscv@lists.infradead.org; Mon, 18 Jan 2021 02:03:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610935381; x=1642471381;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OxZeZALk6A0U48gWNj8ztjhQy+hUu803QWSi9piqU7E=;
 b=Z8XywfayTJW7fj7e+sTD7sMS7QJ/cUoreC5KVAlOikp9AYPGe3nfusJk
 FbODgNqNjonqyaSeHbCXCkvGqF+A/n3vCbNCezRe3wZY1EAQOQMQjKwZy
 /yOQeW/noj35mO3rrNPp4rKtAFXN4JLJIl0fUn1s9DvJXafwILLeUirE9
 8nsTszgmE9O0b0zVTaqUFYCPNLDif+yTYDoW8rHhK9erk/GuMHKrkUlXm
 OhovrjALWjqAT3nFRGBThncsrsziFpj5Hq83gvExZ5VHhq8Zd514t4lMw
 DJ0qzFC4Zr4Aj3WqvX4JSfi1pNBEqwq6wfcDphcywtKSBkkYpEcWKq2lS A==;
IronPort-SDR: w/lZIb+Ryd4E7WVM2UQhThMFcH+dWIQzAPhm5WiZ3ZkHSndCIrZn82VoQhPbE0AzAYuGLtoIEM
 fEG+KHcSGFYqS48/3IHL0bO5WDzNZcY6CeXyxme12In8pm/+e+MPmcH5tYyvtXwVZbiOVBxbY2
 G/z/9fDyqMe22y+R7ma65twqVKuvznaEWyvF0+qRkavV18gq4bRbm+9XpW/rkUFn98uT/Ohqe0
 dmcNbXkQLH8zI4+BlfkJSOaqh1pmrobTi2IdmDb0H0Btn1wp60UCzGonZb+KtrfGAl0XUUqX/m
 qU8=
X-IronPort-AV: E=Sophos;i="5.79,355,1602518400"; d="scan'208";a="267979889"
Received: from h199-255-45-15.hgst.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 18 Jan 2021 10:03:01 +0800
IronPort-SDR: yZjjNeMLA1jzSxIpjBFrbfWWzerQwfgBZ0gNEk/H4MRQ2yQ3VU+MeuM7ylDTqJ0YxmtZmrk3ka
 ieMt+1PUG36ms892Wqai+XL8G7pH+jF/XwmBHJpQcu/rlaz18FhIfXOwk87vCCtLAD/EnOdgmm
 RLEsOyLXUwznqX0edg9zcx2/OlMX1MnCqBaRSeENhZCtpX4/C5npSUoIHgy72FGFk7/at6QHGP
 dR+7qCifD802/VuSpK7W8hsqbV6q4xOO0V+ePWWJv7/vs5+SQcqwd2SQ3kjqzcal4ecLZ+PtQL
 nqamoEJszTXISgj3gdD7mzfX
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Jan 2021 17:45:37 -0800
IronPort-SDR: 5aRbhHDdZ8s4MmZwWXcSTYSctnmetJ2hzXvG3owDgvgnj3nkl7xbHMrUlSYuRIMXjxYQmbi/cd
 NPIzHkfAjnqoRWf0/ldZosMwZ7JpxyaiokiXoBJX8QGNq589VLRcPxxOvOTBUx8j2a8LvL1atw
 cqiuhnDBlLHC87DBkBdLDG6OPYSaILwvll9Wpej6udFLuFH8AUNaZjaec6A3heFZKftW5i6XiP
 sQ5OzrS8pd15SJnlwbURJATKm6YfsX3+g82oOO4H90pJDP6rQ1TRRx7TY8BbI+ZxB6VxFkmC9K
 cb8=
WDCIronportException: Internal
Received: from cnf011319.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.208])
 by uls-op-cesaip02.wdc.com with ESMTP; 17 Jan 2021 18:03:00 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 03/17] dt-bindings: add Canaan boards compatible strings
Date: Mon, 18 Jan 2021 11:02:30 +0900
Message-Id: <20210118020244.103451-4-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210118020244.103451-1-damien.lemoal@wdc.com>
References: <20210118020244.103451-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210117_210301_864442_7F291D01 
X-CRM114-Status: GOOD (  11.29  )
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
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
