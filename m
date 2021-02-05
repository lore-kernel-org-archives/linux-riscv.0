Return-Path: <SRS0=lacq=HH=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8E7FC433E6
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:49 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 56BF164FA3
	for <linux-riscv@archiver.kernel.org>; Fri,  5 Feb 2021 06:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 56BF164FA3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TAiGY+Yusu2VXndGzKJnwPBCwOLROgrrXSF/XF0sykQ=; b=w7zy75ZkbUFRYVe4RG07ydj4J
	rqoMFdClGC11Hu2z3cdw8knlrjrTK2hNeWzNBV77DrtOZTSbL6iG+lAX+VDTHMe/mwbEUbOaCI/NX
	8DSwd+fwYYEfejQn63zmWc3Vdg4KcfV2PbX5S+Hi6ehsazS9kzv4HqPIEyNXisL9vYeVA8n3B6an4
	FUaoOaVgRUeQ29eMnEpK5Xl4LGIV1u1BduMSRg0QR/5PN99sJArSehdI5NaoZXu3QSLJVU1FTZ5JB
	0U15yK9JTzn7R9EtkFuPDLBZpgZL0Uvx8kkH6R3UtG48c0v2Vl6Sgmekh1iOKGSb7aD2khbrNuO6x
	tJ4po+EMg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l7v4j-0004cA-62; Fri, 05 Feb 2021 06:58:41 +0000
Received: from esa3.hgst.iphmx.com ([216.71.153.141])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l7v4g-0004bA-5Z
 for linux-riscv@lists.infradead.org; Fri, 05 Feb 2021 06:58:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612508318; x=1644044318;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5RPnx9naL44L8pODbHMwPFT+udQFeaq9RcnNssxEXo=;
 b=mJZePAFH5N5rwWoouXGshCUM83FUolSfEzjHdd65kMUMVYqkNAzCJj3v
 nKa5LAkYSuahwVhsJU7ss7S7xI0ICHEEfncTxNGHv9dU8BQZ3OqaLZtNb
 kcANUbWrkjOYH7b+5PY1oG1ZsfSIBZkIrS6uXz7/LSAdh1+s2x7xqfch8
 XsujTaCLZIwSKHcVuRwsP7DuSaBidvqOkKxGCPPhx6VHsshaSvuE5qLXF
 k8gJ18GJY2NJBAQqReYRbB5Gpx5h4vulApNSP85WUqDrJwsu8ns0d4Nbn
 6AfciXFOOO/KHFk53frUwPiHKilVsTTLMT2iXmSyKalKW92L+tF9HSMEu A==;
IronPort-SDR: ppXQj35EN6M4HIbDYWn+wYOqecohfquis/2XATiQaQJ42/WgGb8eYvSahN9N90X/NVH7EwdrjH
 w/uzK8pHoaFLwSkRowrVSuRPs65I3RhTo0yr/kducNiKI5brI1+CjZE1D+yuUXecjiwiNroFJk
 p/drNogfQPFB1ApSlFGnn5akBdFXIU1GaOv82Vu44cQGvwDfA4oS+AFLYlMHvzr7yK/gFW9sPh
 h1tGXOhHiFA/kbycrqAuQLbvT+F9NjPMZ30QFAPDbPwQ3fziOAYwCxpabkZXnoaPk0yxbu0fw2
 2/o=
X-IronPort-AV: E=Sophos;i="5.81,154,1610380800"; d="scan'208";a="163655818"
Received: from uls-op-cesaip02.wdc.com (HELO uls-op-cesaep02.wdc.com)
 ([199.255.45.15])
 by ob1.hgst.iphmx.com with ESMTP; 05 Feb 2021 14:58:37 +0800
IronPort-SDR: cxbYrqHQBqDmuTEl/QOw+8GshBZOfLG/7Ut8jai3Sx5oYE/ibIjePdBBhy62fnv15Heu0GLPvd
 LKCMP4F4A9SBlWiGaH12BUTNEhd1Dc5XOvQUJOL/amSUzJHM7CCabKdrqCnoLvAKZk9bXiUQUv
 +zeMqa9yDOotX0+wWpbLvqXfX62UPB3WFsNGDnHNxDBh8bubEZHnDaO6g4iy6IHhipSqRl4ukK
 kGonmy+8e+fs8C7iDWYh+f9SeLlWqZkPuFrD+xECs/PmRagbdZ7HegwzBeS8t520ygmqMp2H+5
 P+AkXQyCjGUoTdRZrQWMHxO+
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep02.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Feb 2021 22:40:39 -0800
IronPort-SDR: YIiF6BDlSAeIMG4U+C7LrTDsAsNhjRYGcoiIbpcdLEPEH+gclLXLKOLWSrjGnfYt47uFLDauJh
 7qyzW1u1hJ0yT4Sq8JzZpz7Tagq7Ref3AzT6vT4P7ARLW4iL+kc2wfdeOhfX8Ojc6G4VNqpgtA
 L+lxDUgLx5FcC/EZcAWU5iZ6hWgPoL4PWunjR33hQJfz4ELb0ew4JYuuEk6qt7nKc2ed7Z4MEI
 J1ZwUjV2mkLxYUBWK+OP6uJSOjZtyGgXoB+MG9ZqLxYAxSXwZL4MNki8NPeZyultNsUvXcFTwD
 iaw=
WDCIronportException: Internal
Received: from wdapacbjl0003.my.asia.wdc.com (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.58])
 by uls-op-cesaip01.wdc.com with ESMTP; 04 Feb 2021 22:58:36 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v16 02/16] dt-bindings: add Canaan boards compatible strings
Date: Fri,  5 Feb 2021 15:58:13 +0900
Message-Id: <20210205065827.577285-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210205065827.577285-1-damien.lemoal@wdc.com>
References: <20210205065827.577285-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210205_015838_367610_1A00B12F 
X-CRM114-Status: GOOD (  11.78  )
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
