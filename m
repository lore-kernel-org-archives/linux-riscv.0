Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9100C433F5
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:19 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A0A17600D4
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A0A17600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=E9NKJ4yjUzdO1GaaXqFgT3kjicK0cgVT8Cb/o7+GgnA=; b=1bkMopZylUzWam
	0OIxFS+FaxSsh0MdWs8j/xCl0BFlvc1ArorLT8OJ8tkGsNQTK4NfiOia7Xqt3jMBXpmN9eE+BmqrP
	R8v8NdUdN4GoR9lgtwQEpAABAH+c2l/QrnTogcor4n/vh2ywz5ffot4zATVQ8VilUbYdGrU5SeR9i
	QtQ8ax1c+cC8DXfKIaahhEqsIlnAXUVGgwPqtQSof5nzhBkE6LNPO37Koq8FOeaJY8WjGAKa9dHsF
	YnGIYGJPH+qFukC4YGt9AsvlEqEPrNF5XJ9oFt0zPmK0qBT3hS/xsPNXJ6lSdxr3BxblutmEcDGDI
	hXNeDUIxsdKY9iX6nrCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6Eq-00GmOR-Jj; Mon, 08 Nov 2021 15:07:12 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6Eo-00GmMq-7t
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384030; x=1667920030;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=RnzRJe2j8YUJD/3ju4Zm4B76UxmFkkmN8AGI+FaOFNU=;
 b=q0om1p1V3kq/jjkHmCrMXPBs9zm8L7an7vU2kPTfmWftyWwaqceqKiVd
 v3olxGDNqs4hShKqhvOs0EtAp+EDBrxh1gVPKEBp/kItSSYLMW2xOLGT+
 nqjQKcLbRIPBswaalhr+HsyfNZITHJHgwYCwBLKVHbr1+cuGntmC2OITT
 StfdIBdR0DwXD0ZErB2+7rcx31vlcqQ7iHlYNVQ59fBfBLGWuv+ISR8L4
 Hr4KX38ZwEAulGPHZzPKyQqEn5s4Ne0KjsUjSEA1cDUVGGJIi58YRTXfG
 WdE0iCcxof+s6DN+9sO6MO38JSM7ELPNWsF4OjekS3J4WPqwIA4qTPqtn Q==;
IronPort-SDR: gRM9iGd4Z5kToPIKmNPXQJXDF74gHh3Qo/SQy68lOs7xfksj32OLdrRet39IwAnqbcxVpWSF1x
 Om/cp2zzU/XZeZT32IWIF6eXbpTio0E2wGCnnNZiQD2j1RprcGHR6fQE3QnnYFNc/0+/7GgOIg
 flFvtFBBEmrN2e22JogEyWkClpz//rA0ip/1RYhkteMHHOvSpAQflRaXk3QmZlH/6q4iwPTpHK
 wraOZ/noYzF6L6qkLTvBJch64MSkn4v6UL61drg0xlUuSAkfGJWjOrq1LvuqRldaFOO4IiKETQ
 PcIJ0sR1bKLCGofpRBaG7huf
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="143179818"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:08 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:08 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:07:04 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <bgolaszewski@baylibre.com>,
 <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <paul.walmsley@sifive.com>, 
 <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <a.zummo@towertech.it>,
 <alexandre.belloni@bootlin.com>, <broonie@kernel.org>,
 <gregkh@linuxfoundation.org>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
 <atish.patra@wdc.com>, <ivan.griffin@microchip.com>,
 <linux-gpio@vger.kernel.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-i2c@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <linux-crypto@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-spi@vger.kernel.org>,
 <linux-usb@vger.kernel.org>
CC: <krzysztof.kozlowski@canonical.com>, <geert@linux-m68k.org>,
 <bin.meng@windriver.com>
Subject: [PATCH 06/13] dt-bindings: rng: add bindings for microchip mpfs rng
Date: Mon, 8 Nov 2021 15:05:47 +0000
Message-ID: <20211108150554.4457-7-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070710_339193_7AD2C505 
X-CRM114-Status: UNSURE (   9.85  )
X-CRM114-Notice: Please train this message.
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

From: Conor Dooley <conor.dooley@microchip.com>

Add device tree bindings for the hardware rng device accessed via
the system services on the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../bindings/rng/microchip,mpfs-rng.yaml      | 31 +++++++++++++++++++
 1 file changed, 31 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml

diff --git a/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
new file mode 100644
index 000000000000..e8ecb3538a86
--- /dev/null
+++ b/Documentation/devicetree/bindings/rng/microchip,mpfs-rng.yaml
@@ -0,0 +1,31 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: "http://devicetree.org/schemas/rng/microchip,mpfs-rng.yaml#"
+$schema: "http://devicetree.org/meta-schemas/core.yaml#"
+
+title: Microchip MPFS random number generator
+
+maintainers:
+  - Conor Dooley <conor.dooley@microchip.com>
+
+properties:
+  compatible:
+    const: microchip,polarfire-soc-rng
+
+  syscontroller:
+    maxItems: 1
+    description: name of the system controller device node
+
+required:
+  - compatible
+  - "syscontroller"
+
+additionalProperties: false
+
+examples:
+  - |
+    hwrandom: hwrandom {
+        compatible = "microchip,polarfire-soc-rng";
+        syscontroller = <&syscontroller>;
+    };
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
