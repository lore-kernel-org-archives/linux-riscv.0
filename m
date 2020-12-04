Return-Path: <SRS0=IlQS=FI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F61BC4361B
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:58:55 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3063A222B6
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Dec 2020 08:58:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3063A222B6
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=FPQ5/HN1OPBe/35VI7ppclX2rYPfFWLxXTEHRAGFanM=; b=L0i55ZF8G0ygw+ELo6U0Qrkks
	2Aw0q9tMkvl2WrMR3n5NeQINoPys4fC2PKXGWH0nLCZM6kgQczlahCUHMbRG0LF2PFd9/qbTrs+HD
	+mYLjIIpUv98s8BtRADmDfAcvuTg60+B0PWK2+6X0swZg0VBYkBDd77G0/PetTiCsbiWe9ouyjJIT
	FlYK1I7vp5lm3nAD1JRSfLQBx+axcukISqtQ6L2vOlVRG19kZrf58b/aUwDBLPg9IIKY/Pd5GNiuG
	BKpw36fQbnqC8r1Q6vOqeAi6l7r34fO1K+d72Yuru3RlaItPpFNHWBFS8QJgvHvxy3+g4Nxsl61DR
	SalW2Ly6g==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kl6vO-0002fj-Mv; Fri, 04 Dec 2020 08:58:46 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kl6vK-0002d2-Hs
 for linux-riscv@lists.infradead.org; Fri, 04 Dec 2020 08:58:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1607073487; x=1638609487;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=juXAMaoC0LaiudGimn3JVw/cJS6l1iw8NO9uF2NFJUs=;
 b=TyIGv35hkFmi/jyjk5ceib1s7IZ5/qxb/QN4lxNa642k1Xr0D+qvnszr
 oZ7yyZM5epQHDdEo/h2JhmFXfzH1HEWejm04Fam4wLYF0BWmsYAvBbk0j
 bvIgWApbodMWWcuJBYfTWndH4Y1+cJ/5FlIyLGqr3VIRk750GeME16/B3
 mIS6oOucB8K9n+yjszcmuVuCLwsQsbjFoAZLKJ9PeibVBG4+Cr+jGFOXZ
 YBB0QZy08X6CSzyh11kaYz9hG25sLEB+9OnY9jQBTp9rH9VsYuw7Us0QT
 Rnx4M/ajL8T/yCcEIQROV4n5dNAUK5iG9aYItD3CAkCp895M3v7LBhDR8 Q==;
IronPort-SDR: GQ9zQZXbx+/xsWuzhJ3UVEL7ZxRRNWpF6NxiIQ8IxLzOwTJnGN8ppGJaRA2R6rC7LzxTPIqq94
 3+vXPDlxdmgndk11bxrZB7RzEgQt7rqfz+sEz2rulBdG9Z0d15xSJjAl7gDEbVtuU/tYbfOy4c
 LDvN6UqY65t9f7ChoZBC9R5thEx2beLtCFgxoISnf/mgEW9LcXKLs5Rf5vkEBmtOTIdEbyHpVa
 EDs8B6lEpZhIs74VlDh41UHT9RnhvcOyzoO5aeLtFdPba5qk9l5BN/f4IHBVPObD6lJ16SUwOz
 uJE=
X-IronPort-AV: E=Sophos;i="5.78,392,1599494400"; d="scan'208";a="258129845"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 04 Dec 2020 17:18:04 +0800
IronPort-SDR: dZjKShKxR4VeZGpj5QNdZmoCSEXO8QI/qrKU1V1TYVVJoe8DKR9UeqF4uJb86KB9QJVdwZTfMc
 5YIUd9LHi1aIiHcWNeDzIdR88xxXphGFg=
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2020 00:44:12 -0800
IronPort-SDR: 8+0WEGg+RGWJLmk6pntYWJW4OHU6PJa0AI68Dwjs2t23s7srBgV2EXcnLi5wtAGR+N5j6xBtoK
 o8yaK7wQpvFA==
WDCIronportException: Internal
Received: from cnf010505.ad.shared (HELO jedi-01.hgst.com) ([10.86.61.200])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Dec 2020 00:58:39 -0800
From: Atish Patra <atish.patra@wdc.com>
To: linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/5] dt-bindings: riscv: microchip: Add YAML documentation
 for the PolarFire SoC
Date: Fri,  4 Dec 2020 00:58:32 -0800
Message-Id: <20201204085835.2406541-3-atish.patra@wdc.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201204085835.2406541-1-atish.patra@wdc.com>
References: <20201204085835.2406541-1-atish.patra@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201204_035842_784503_D406D4CB 
X-CRM114-Status: GOOD (  11.32  )
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
Cc: devicetree@vger.kernel.org, Anup Patel <anup.patel@wdc.com>,
 Cyril.Jean@microchip.com, Daire McNamara <daire.mcnamara@microchip.com>,
 Bin Meng <bin.meng@windriver.com>, Conor.Dooley@microchip.com,
 Rob Herring <robh+dt@kernel.org>, Atish Patra <atish.patra@wdc.com>,
 Ivan.Griffin@microchip.com, Albert Ou <aou@eecs.berkeley.edu>,
 Alistair Francis <alistair.francis@wdc.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Add YAML DT binding documentation for the Microchip PolarFire SoC.
It is documented at:

https://www.microsemi.com/products/fpga-soc/polarfire-soc-icicle-quick-start-guide

Signed-off-by: Atish Patra <atish.patra@wdc.com>
---
 .../devicetree/bindings/riscv/microchip.yaml  | 28 +++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/riscv/microchip.yaml

diff --git a/Documentation/devicetree/bindings/riscv/microchip.yaml b/Documentation/devicetree/bindings/riscv/microchip.yaml
new file mode 100644
index 000000000000..66e63c2bf359
--- /dev/null
+++ b/Documentation/devicetree/bindings/riscv/microchip.yaml
@@ -0,0 +1,28 @@
+# SPDX-License-Identifier: (GPL-2.0 OR MIT)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/riscv/microchip.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire SoC-based boards device tree bindings
+
+maintainers:
+  - Cyril Jean <Cyril.Jean@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+description:
+  Microchip PolarFire SoC-based boards
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    items:
+      - enum:
+          - microchip,mpfs-icicle-kit
+      - const: microchip,polarfire-soc
+      - const: microchip,mpfs
+
+additionalProperties: true
+
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
