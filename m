Return-Path: <SRS0=cxKJ=EN=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21000C8300C
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:50 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD37021707
	for <linux-riscv@archiver.kernel.org>; Sat,  7 Nov 2020 08:15:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="rAm1/dRm";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="ryPlr/Vn"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD37021707
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=SNlFM+YkJQptvtmjGsH7J7gbHddGrdabS6zrpcYmHp4=; b=rAm1/dRmAZV48gnz1V1dfWxEB
	yc5VsIiMytnz9VKaS6R9YlPow1ZJJlog0QXhmGEyR3zXri9n8JaUdoCGl1JTVv5VbfX8E1NE7Msoc
	0c/bUESMEtjNv4FoTDRHM589ktT3+VRWENiEAxbuRzEPlr38tQbco9E8ZziS0d/9nGFNSOiMQcKEv
	DtYOxCBmZhoH1gYVPAZ12HN1i7jCCnBFY3kfspJGfVp3KsdyxGHpJzRt7j+iM9IPI5ZY2tuzRnCCu
	zurU58Df9tvUqLLdqD3SfgQArfYSOraFoujhHeZWU2Gb+/5AAisiC9z14vH/ppd019rJNLCRrtdEm
	UGDciUR+A==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kbJNm-00013x-53; Sat, 07 Nov 2020 08:15:34 +0000
Received: from esa1.hgst.iphmx.com ([68.232.141.245])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kbJNb-0000w4-Lc
 for linux-riscv@lists.infradead.org; Sat, 07 Nov 2020 08:15:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1604736923; x=1636272923;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=6hQFOpsBQqm+ohKs0w/Ib6ThhS/q66nb5zcwWEvGTPw=;
 b=ryPlr/VnF942JeLGVbGKuqGVAMWSGk1kuL1TQhSOnmFieYfvUSKy24cS
 MuB8WZf2pGVxoClMwb9CBSinimkkLXOWK3VW99yUhfk9oFV8D3G/KkeFu
 GBRWPrQbTh7Mb/Z7erV92B+ODZFsvcw06T+s6Ljt/0/oSLm5uRK7SQejw
 nbshF59wd5lRUB5eJNT4N55+jZL0FbFTBWicNjuyaSKnam6RosspzegfS
 I/o3F/VcQiGMfIYbd37vhbsr66ukKEY2uKvIL9Che4ydHEYAGYP/+Xkhs
 fCL02idPtHNf4LypBpxQQo9LPD8GXZC11x4iI0K3fIXB3LbmAoNcmNMYB A==;
IronPort-SDR: qJzlnILBafxGixJDGcubAgwAZBTtLWGTVj2qwndZLkbm2AAmTuboNZ/asZo+jZUI7QHqymIQe1
 RU3V+Xo4qaN073ddr6im4KZdOeDmUpf9CU6tbItsTg2TueFRNvR0N42TgV0Bou9ouiznNeomcI
 ZMlKjRSXmqA5x8ciNZMBrRH+/yepCIZ5MX7hhtY3or40bXOTt1tX4V8/B5yf440lGLb1cVTR98
 UEeDVokF7ofN6scBK5z+4xN+8PgREjiGBmgilkTYsWreTSmrn9oTIcEosgJvpEm9njMV/p/a6T
 XDE=
X-IronPort-AV: E=Sophos;i="5.77,459,1596470400"; d="scan'208";a="262079333"
Received: from h199-255-45-14.hgst.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 07 Nov 2020 16:15:22 +0800
IronPort-SDR: zeD7caAAlhvSEyWboRRlRVhma/+ob6x6nS91EIQYCBxW+NHzgSi2JIIlB9Mn2pafwM2xa8O3zl
 w2aTxfbafvTsac8js+cTDDCAERXjUK/pyXVevTd0xujuGhV7sCJQ8qLUwpxPg0NcyZGx3JCYca
 fqUsQff7imqfslL07mI7U542mxz0PEYTxjn3xDxj2CqYQgSQ6D9lEaEUwMU5Op5iDb129gCA/Q
 ZMww4C7GmDOAV1ZQrmNBXc6Qx0eH/GcWqPi2iZn6NYN8ekoO88DqINfypAlD9/tHEQn65dna7I
 BakSuqeKiOzBiRFwDoBc6pmk
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Nov 2020 00:01:26 -0800
IronPort-SDR: BXlHUw/HDcF1F7ONaRWXXDTETsH6nr1+NpS8wIP/O/H9VAx/bcEfmJtb+W1CFGgZIE6Q+Dpecu
 W3rToKZcr96OLjkNsggtSMp75Le/onPmWlBJoE3YlGT1vpsNb5+X3V0mZ3R7j0Ek3gARGpo0wV
 zQtKI+OpzjxC8nTt21mnSH0dzmrwNuPruMdgrkmsSEJImr+NjmyVEAjBMYsoIM98GIOkoLSUE6
 aEdVse9g1XVwgAiMF4C8EJa4mUadQH1/Elmv15IgrfAyhgUSj5DD3bw0eOhImxLZo7zAcfOFrE
 fLk=
WDCIronportException: Internal
Received: from hdrdzf2.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.85])
 by uls-op-cesaip01.wdc.com with ESMTP; 07 Nov 2020 00:15:20 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>, linux-riscv@lists.infradead.org,
 Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>,
 devicetree@vger.kernel.org, Serge Semin <fancer.lancer@gmail.com>,
 Mark Brown <broonie@kernel.org>, linux-spi@vger.kernel.org,
 Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
 Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org,
 Philipp Zabel <p.zabel@pengutronix.de>
Subject: [PATCH 22/32] dt-binding: Document kendryte,k210-sysctl bindings
Date: Sat,  7 Nov 2020 17:14:10 +0900
Message-Id: <20201107081420.60325-23-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201107081420.60325-1-damien.lemoal@wdc.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201107_031523_936955_27513C99 
X-CRM114-Status: GOOD (  13.81  )
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
Cc: Sean Anderson <seanga2@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

Document the device tree bindings of the Kendryte K210 SoC system
controller driver in
Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml.

Signed-off-by: Damien Le Moal <damien.lemoal@wdc.com>
---
 .../bindings/mfd/kendryte,k210-sysctl.yaml    | 65 +++++++++++++++++++
 1 file changed, 65 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml

diff --git a/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml b/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml
new file mode 100644
index 000000000000..8c002d2078f4
--- /dev/null
+++ b/Documentation/devicetree/bindings/mfd/kendryte,k210-sysctl.yaml
@@ -0,0 +1,65 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/mfd/kendryte,k210-sysctl.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Kendryte K210 System Controller Device Tree Bindings
+
+maintainers:
+  - Damien Le Moal <damien.lemoal@wdc.com>
+
+description: |
+  Kendryte K210 system controller driver which provides a register map for
+  clocks and peripherals within the SoC.
+
+  See also:
+  - dt-bindings/mfd/kendryte,k210-sysctl.h
+
+properties:
+  compatible:
+    allOf:
+      - items:
+        - const: kendryte,k210-sysctl
+        - const: syscon
+        - const: simple-mfd
+
+  clocks:
+    minItems: 1
+    maxItems: 1
+    items:
+      - description: APB interface clock source
+
+  clock-names:
+    minItems: 1
+    items:
+      - const: pclk
+
+  reg:
+    items:
+      - description: system controller register space base address and size
+
+  reg-io-width:
+    const: 4
+
+required:
+  - compatible
+  - clocks
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/mfd/k210-sysctl.h>
+
+    sysctl: system-controller@50440000 {
+      #address-cells = <1>;
+      #size-cells = <1>;
+      compatible = "kendryte,k210-sysctl",
+                   "syscon", "simple-mfd";
+      reg = <0x50440000 0x1000>;
+      reg-io-width = <4>;
+      /* ... */
+    };
+
-- 
2.28.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
