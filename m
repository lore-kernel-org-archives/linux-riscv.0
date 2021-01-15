Return-Path: <SRS0=UwrA=GS=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F246AC433E6
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:08 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B6C20223E0
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Jan 2021 14:05:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org B6C20223E0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=uO1ZhrW3kyGlfEoBIZuvsLgq8Wph9021hyjAumaugoQ=; b=rqSlI24nelkvSyj39QomvVyUJ
	jzMHUfeZiQ9Cz25UO9znyPYlKpbug2BceqMnYOqOUwACDHhPXxg30gsMFOUh0nIlwCohOY0Nl+JD2
	4fUovxP8yeuQ+K8Rid5uVASADHsW3rUK3fx5bFM9LrOOqpQ8y2QT+/M818YI2fgCgAo4zyMqsOowS
	uxSh9FtYHfJC5nYoJsz9Kfqrb/ZgpZTxBXrBbze70TNaZYqs80s912av5VLaQuwXQLwsxQlTVI7H4
	i4bi2xPBUWRzjcJ0AQtBeU6W+3ipvqq/L7U0gcU07ddpS0zp6/2OJ6dn6lTGji6LO3K8r+b5fkG62
	lmyKtQn/w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l0Pid-0002uW-Td; Fri, 15 Jan 2021 14:04:51 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l0PiV-0002qA-BD
 for linux-riscv@lists.infradead.org; Fri, 15 Jan 2021 14:04:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1610719483; x=1642255483;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=OxZeZALk6A0U48gWNj8ztjhQy+hUu803QWSi9piqU7E=;
 b=dI3eN17bZSRC2pgziOs+8gWlEJ5k0V8opybOYrK8uYuE34Ea6SMSaAeQ
 EfCmEiimkCGF+LkTKNOJ91abyU+IjVvEEXNYlmttnsvlcoyqSMt6C7y/t
 llXsOpxpPrdJhD6KpbDiOwTiEq7pQg6nr5y3AubRiZ2eilX9dp/r7jTqK
 ZABjCdJ5mPPjARLgux60Tysd/MI59CA6GH4Avc+VZ5MEjBORXX5WdlhpG
 r6s05qiA2WGBysLpOTqXLSwHvoWKfE7D3av/cSI5zSKGM+Nl3aedCvFbw
 eroc9xku8UA3D1RXBr9pwM5aV1MFCccKiC9/fHBZVreOjbd6QL+PK3u3D A==;
IronPort-SDR: TjH3/AHzIj58TOwdW+z1I/ZczJKISwPhoIsC1YNzE1dvW1tDl3Ls7AJ6rnS/C32qZ5p/Xd5HVz
 0BJOPGODZmGopMs4g1gAMiNFQVI/j/vBf8tgLVVHHTmnbIAAA8IY49cWCBoSlCF4bVhKSH+++X
 QnVEb0K3tFiUJlvf8ZngZqczkg55Unjv3qwTgaVvggSHaaxVaC4SO0NoZeUyn0yupAP9NKHA0i
 dx8jwJg4V2jBM3wAHDWp4tsGKU2B9a1zJUAIY+Nbezw9AJWJcALM084WCdc5Qf7x/j3qXTQS5H
 uMc=
X-IronPort-AV: E=Sophos;i="5.79,349,1602518400"; d="scan'208";a="161955751"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 15 Jan 2021 22:04:42 +0800
IronPort-SDR: EK3WN/+noNzUcchQMZo4ctRqjMiIHdgjxBwAx899ubCZLD1mK8tQ1QySONf9Fks6Dbq/yN0IYj
 V49atKeRPdLIy9Vu8hk7IHKYV8Aw9Riiau5IvOYxkAj7JEkiSbB0kfVfTEQ+ER0Qk0ETQKbmYy
 h3BdHq8+yrWaK7+I9jRylmBopdfHCiLqW/sPcNJYnqN2okPH/lsLecikJjZ3BUsZ0H3pj8u+Ve
 jyqnQh5jyme9kuDnoDgoMGNFCc2g3kixnJUH/teNN9nlp7yMf1Aq8Z3HxRHDUKqyGc8ZDR3e7l
 3iynLIGf2iO6u32cyNkyC5qC
Received: from uls-op-cesaip02.wdc.com ([10.248.3.37])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Jan 2021 05:49:24 -0800
IronPort-SDR: l5J3/oDhmOFXQL3kYZhfM7YjSkgUHpSU17bD4wa0ySIJ6lWExxCVF/fQ0oHX8sEBHaBP29JV7+
 LTDxO8VnABLUTh1lT+/gCwurJYVGnUh9O+z3+N+VjpSU/lWUggEUgu75Bxc1yetWg/Sq0oa46z
 Ukx7HLotgyTfdUeMA+nmS8ByZMwbYMQiji14P8ujcAhUfT2sgAqCtBYaYWuimVgpO4kd7Pdj5P
 bt+RVR4BF3TqKw7fbsdeooJdkGBWx0so0SCUy2qK/alOq/FCkQ23s8pqCZ1oDGo8/cWAZOScvG
 ldo=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.70.177])
 by uls-op-cesaip02.wdc.com with ESMTP; 15 Jan 2021 06:04:41 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v12 04/17] dt-bindings: add Canaan boards compatible strings
Date: Fri, 15 Jan 2021 23:03:39 +0900
Message-Id: <20210115140352.146941-5-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210115140352.146941-1-damien.lemoal@wdc.com>
References: <20210115140352.146941-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210115_090443_676418_C606B764 
X-CRM114-Status: GOOD (  11.91  )
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
