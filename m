Return-Path: <SRS0=3nDB=HL=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D28F6C433E6
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:38 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5374B64E88
	for <linux-riscv@archiver.kernel.org>; Tue,  9 Feb 2021 12:30:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5374B64E88
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=wdc.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:Message-Id:Date:
	Subject:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=TAiGY+Yusu2VXndGzKJnwPBCwOLROgrrXSF/XF0sykQ=; b=GVbceh1f4ofX61eZMPC1Ev9Ia
	3SIACV+qLt9N+svYen3XeO2VpL8QizZsmgjnvm04jzplbd0UbUMgdX11gSvMp6OJuzaDqhlJmQpg1
	GYRLr6OdnUBFiPq/NU1LuH2xZkZPJ6RAYq8UKJ8+daxei3mWWccvqAIYKi0gpDU0/L/f6L/T3s04Y
	F5MpGHehLUFKI0gPoMHpKCcfZYXTqwO+W7Sk5kmLwYjAwUQmglyjVbTI0gjshsKsRCiK4L0DY8oJa
	+dhAxsWVItawYXvSrrqXxfB0zP2GXGqtL4/7M7CIZYm3gjrmysIVsISIoToRglzvy8FnGP4VO/jlt
	ecClaVKAg==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1l9SA1-00087l-SW; Tue, 09 Feb 2021 12:30:29 +0000
Received: from esa2.hgst.iphmx.com ([68.232.143.124])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1l9S9v-00083p-4v
 for linux-riscv@lists.infradead.org; Tue, 09 Feb 2021 12:30:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
 t=1612874192; x=1644410192;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=U5RPnx9naL44L8pODbHMwPFT+udQFeaq9RcnNssxEXo=;
 b=OeVarnLaxC4rDO7F2tVZV55rVrs7ITzZReWmV6khcMgbQOsHOHsGERHG
 1XV4v7yVeYRitCg6WZESaiZsuP0P2RluuDJuuDGB9fL2H3rOWOQkPnt29
 x4prk7E28wBRI44XXAAwZe4c2skK9ou1wgiU9RSnmnJrwaSfX9bR/q8cl
 XXi1Ejt9BasuhvzN/8SGJ+LMfT1gjcFDdKwwuTlM7D4cg3FV+ZW1UANuS
 PnJBpWLyZboERcL9aFmYIYD6xI6QE7/9qhiPx1CFtsbCIFpZSUpfvlzlG
 QZvIOS/BNFHlSS2meN8vd0sLCM4DcvDE4ohT8hQcABVwAdl2uvAp4dTWm g==;
IronPort-SDR: I5V0fpLLcOVr54OqIJQQNgWKYK9ysVOM1NaRLxTRzdCUlWNV6FwBiDj2OBtEOgUTsTEp1rFZe/
 6nMJIOuA2re5U0szw7vlycNlsTOcPEQVMPgI/XOI1JIi7b4DwQmEnZd9IHWNPXKF8p8Hhm9xIh
 tmsEudLv54d6cF+A8ycpVY2VWcPFsu3a8R6UhCSXnlbrbItlsqdklBHDrCswbmc3l1HH6bswIh
 rtoO0R7AmuQUpWNMv+CvHFJgsd7X9s9Eicy8TA93Z3fhpfuqFHbBVVb01egVybNPi5V8uLILM/
 cps=
X-IronPort-AV: E=Sophos;i="5.81,164,1610380800"; d="scan'208";a="263648820"
Received: from uls-op-cesaip01.wdc.com (HELO uls-op-cesaep01.wdc.com)
 ([199.255.45.14])
 by ob1.hgst.iphmx.com with ESMTP; 09 Feb 2021 20:36:32 +0800
IronPort-SDR: l60qf/RRcalKzyp/Hwk7zr0OBZEd8HFz/xgXLCObzqRXyQgdda5xQ3ztgLDb7TeEgNO0y2A9h3
 xpydNvokrCAzOuZ1Y90I2MKuxN4cvS5jUR/HILaLXLQsdyiWO5NbAcr43zXavtZGhsn+nfO9mw
 R/bdGQ19vSn+CULrZ/LcMJoYayNDes5xCluJZlRT2c/vM56e7oM98Ruepu9RFKkGfWSKavFEGK
 m07nU0k0k3oSbPL5ArnuOhiPIc7aHX31wQkTQtaf26olU6WTOrHEVfBBC1lSy0iEdOoTCvs0E9
 4Cjo0HvizcOOMrKao+jpDPIN
Received: from uls-op-cesaip01.wdc.com ([10.248.3.36])
 by uls-op-cesaep01.wdc.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Feb 2021 04:14:05 -0800
IronPort-SDR: r9hEnmBu4wIfPTdBYSA76Z/ywFdhj6ON6RjGc0GOcZSRSI1kK+JTgPaI0w/KSHucAh3pQSD3/C
 hP+4DvttaT2Pa32wnT8XO8eV8T5vO9rmmoF7OgsGNGNQsrGF2dKgtsF0q2feRCY6mlHLyzbz4R
 xHQIPb0v0SLWAq/DQ4ojO3WEBSMWnyaqo8CzPMLM4DQkDH+7oWtVtMvsOEibMO8/PCrquAsrDr
 OeAcErzjWlWu5Gjb+9EVketDTTJheHSEX1AV8FPoc4mxCnZQohdJFq2HDkS1KaJ7MFrhUy396h
 j4E=
WDCIronportException: Internal
Received: from phd004806.ad.shared (HELO twashi.fujisawa.hgst.com)
 ([10.84.71.69])
 by uls-op-cesaip01.wdc.com with ESMTP; 09 Feb 2021 04:30:20 -0800
From: Damien Le Moal <damien.lemoal@wdc.com>
To: Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org
Subject: [PATCH v18 02/16] dt-bindings: add Canaan boards compatible strings
Date: Tue,  9 Feb 2021 21:30:00 +0900
Message-Id: <20210209123014.165928-3-damien.lemoal@wdc.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210209123014.165928-1-damien.lemoal@wdc.com>
References: <20210209123014.165928-1-damien.lemoal@wdc.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210209_073023_361629_767DFC3F 
X-CRM114-Status: GOOD (  12.09  )
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
