Return-Path: <SRS0=u9qy=P3=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E96C3C4332F
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:26 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BC67F61027
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Nov 2021 15:07:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BC67F61027
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=3nj5TdaKVR0WAe4XtWLyYXIdeKzpOlOzECZTvYBOlww=; b=02FsA1zNb06eMv
	Ob2g1mnGVW2VBN2FKK53Y3OUsFMTT58kwrNxP0jD1nm3j5suXVUe353YzEgQvlr91zwZLj9a3Cn4p
	3Iy5nFx1kIJdG+E+CRIEe+vzCB1ahRku04Zg1jTn3JmAwRh36GN7ln2eM9Ac9fKfsj3ZOFOLcSQfU
	ukm4s3dHBrFpy78krlEmfHN5Qdjb+/jm8Hwrmf5FDlPKLqMY0X6Er8XRVQdCmRHDaYJin39v0Ez6t
	JNnYnwbgvvBDVydxqPH++hsyefXTs5ZRjazx67Dvce0M0I3GcNwvRSDIUWBMVHiVykyOgruqc/Zqy
	ZJtTtz+mcLANJHtNk5bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mk6Ex-00GmRe-Mi; Mon, 08 Nov 2021 15:07:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mk6Eu-00GmQJ-LB
 for linux-riscv@lists.infradead.org; Mon, 08 Nov 2021 15:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1636384036; x=1667920036;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=2bunDyf7QdoO97mJxTZcNYPQXz2FP977/gYahndmmno=;
 b=s9Y2LfChTje/zvt0SStTGRBC8E1NGyQTWKbhedh9j1kwax/ZjJA+4EWG
 X1ZUddQ3SnEXpPw+93bsFvagnG3PcADWJ9jAQN2949ovgVVSZEvMq5vVe
 rvAf5hJQ8c7IYFdseMeN1cQsTaz0PsOAQ/F1LnF+rdW5zRMMxk6gRb1B7
 XVFYUsX/X5ScBGrHKV/hnlvIuR3NhaAlrsIbV8mvw3hyGDehy/orh3G3C
 W0U2r7QKGgYNgtWfCy+v+7zFZX47XfozB0AAUEznAC9LuA6zlAuzend07
 YQUEBv620DmYXvDFoSBQ5+JEa6/4gvIAP5N+FuP+zTYHz9XW1UzMobOjt Q==;
IronPort-SDR: J/W+WCXDkghFIAGAt5mOOrNV0DnRs7aFzNyIDg3V/oa+LvgnNE+h5CPqNTLdb7A6YoTZ6mIEp7
 ipxyL3AlrNVwdKccME4qlf7pvp26kpglWgNh0okRmn3SHI1/aWYjjQ+Tl9xnH/k4cUqzmm7Ibc
 KGzpx1N8EKxjss94+Ns1LRhIkrmGJ4l0oHWIcWS9kB2U+59mEjUomaZP4HyjRYBxxhBPtq/bp2
 NszeqTvHA1NTbFRe9qlGUdN4tnFHjiCsWNIYiKX2bpqfzgbjWMLQSwF92UmOWEMWS71ztartWo
 om3KGbOZbiW8yci3tXjX9PJA
X-IronPort-AV: E=Sophos;i="5.87,218,1631602800"; d="scan'208";a="75727263"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 08 Nov 2021 08:07:14 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.14; Mon, 8 Nov 2021 08:07:14 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2176.14 via
 Frontend Transport; Mon, 8 Nov 2021 08:07:10 -0700
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
Subject: [PATCH 07/13] dt-bindings: rtc: add bindings for microchip mpfs rtc
Date: Mon, 8 Nov 2021 15:05:48 +0000
Message-ID: <20211108150554.4457-8-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211108150554.4457-1-conor.dooley@microchip.com>
References: <20211108150554.4457-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211108_070716_779271_83593BD0 
X-CRM114-Status: GOOD (  10.25  )
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

Add device tree bindings for the real time clock on
the Microchip PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
---
 .../bindings/rtc/microchip,mfps-rtc.yaml      | 61 +++++++++++++++++++
 1 file changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
new file mode 100644
index 000000000000..c82b3e7351e0
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/microchip,mfps-rtc.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/microchip,mfps-rtc.yaml#
+
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip PolarFire Soc (MPFS) RTC Device Tree Bindings
+
+allOf:
+  - $ref: "rtc.yaml#"
+
+maintainers:
+  - Daire McNamara <daire.mcnamara@microchip.com>
+  - Lewis Hanly <lewis.hanly@microchip.com>
+
+properties:
+  compatible:
+    enum:
+      - microchip,mpfs-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  prescaler:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-names:
+    items:
+      - const: rtc
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/microchip,mpfs-clock.h>
+    soc {
+        #address-cells = <2>;
+        #size-cells = <2>;
+        rtc@20124000 {
+            compatible = "microchip,mpfs-rtc";
+            reg = <0 0x20124000 0 0x1000>;
+            clocks = <&clkcfg CLK_RTC>;
+            clock-names = "rtc";
+            interrupts = <80>;
+        };
+    };
+...
-- 
2.33.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
