Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C24BCCD193
	for <linux-riscv@archiver.kernel.org>; Mon, 20 Oct 2025 08:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Xw8PAoPBMpO/9eHxWonY4DE3ODoPc7u+xcPksVT4zVc=; b=ZfB86xHj86YD+8
	ZUTpMkb8MbgzGErhpvi6WHOHNpVxoC9MWrDhd4H30f2Pk7Qz2q1Kn4NzgkAFYa006IT2/I2AOZe4D
	L63lERAA8U1+mBjA0NMWKpyW0QMmuOPtQS+1B0Kq+nK5VliwZt+pbi+dafnqmMkwRIh7bertqcpQw
	G788kVH5JakRxh5XUnaLTSo9X3vS0kJljcqqNe5tcKOzDtmxjLTcMS8AeheSY0j9LofLzB/g/9rJJ
	FIJKyvJNHO+atT/jH5u6W6eRNO6/J2fRIlE7snMEpU70rH2nyJr+proG8Htrzz6UczLwR0oegKXOk
	fyUomcL7/mj6aI6gnYMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQL-0000000CQix-2Kj2;
	Mon, 20 Oct 2025 08:39:27 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAlQI-0000000CQi3-20H2
	for linux-riscv@lists.infradead.org;
	Mon, 20 Oct 2025 08:39:23 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-78af3fe5b17so3305952b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 20 Oct 2025 01:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760949561; x=1761554361; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M0wVZ7hOfq1JTjvymKctSVmADp+L2YAB/emY4FxmrCM=;
        b=it3WmW0gYZHsRBoQ8ytW8nmizOQRrtNmt01QLKSO8GECuGJmo8zykYpZRkLDuRKvMK
         8NVCu0Kl/ruhqtzEGNOfI557vpi8zTRp2mUFtc+HL9oMQbb8mTrTYJCN8pZYh632tFwv
         UaBmfGfD+sJe+oDKfSXSV+jioA+CbOWoZ7vJEyKhKkqJR1mmSTBMQHCNSstnB1euhnHa
         zvNuOEQe9pq2p731bIAPFfz8OZ4jCxIX9qAaHPuAD3+x8xR2nQNnwBves88Wwiu5ZfBz
         batYSSu8PGyPOLc9/zx1B23+5c+gNrMZ/+GPdBd0ymXzEzO0JE7T2qPy6fovnkGjgCeN
         2SEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760949561; x=1761554361;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M0wVZ7hOfq1JTjvymKctSVmADp+L2YAB/emY4FxmrCM=;
        b=vUBmWOLJ31aQanvNu5W4bP+Mv4wSzCSiSpvpeqEyIuMy65Wb4lAi1YQQa6Yji57LMV
         /vMBVtAzn83nA8f22pbFWszycQt4o8XJuiA7ig23AA828GzwrS3GG97UdrDMKodw1FUE
         PnSdcLsIr26+C2mKfAGdIOyjmMR4ln1+cwz0wTrfoL+D73dRe0Z4ScRRN5sochGoqyOi
         /Sc2swPKz6dj6V6VvOOdbjwKhTzHeUrOz379k19I8dhWC8jLrkodlHl7DW6QjzpgRO2p
         9ZRI2EQ6fcqSaJ6LrJUNOPab+z2oFedREqU/ZJCFXO5kGaF5ww+A1x7A8CLj4aPuG7qk
         Bwmw==
X-Forwarded-Encrypted: i=1; AJvYcCXR8zkpzUdAoiDUYTa4+GdoRVSsexlRQJgnhPzwHAg79ylp7RONehI2eTVMCFRhhx94DA4B/qavCyCjXQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzEONlq7A/LC7u5nyRyK3x7D0caXreSQqgScw7d32J6+sgmnB7R
	bbWeFTiJ0N+fWXswECQxkoCfG7jQ56muvLGw0YI+xn52+Y0M7XIlpgUI
X-Gm-Gg: ASbGncshVQ4fEZWeoZ/KKL/0cK/1jJndzTjWhX+7heto9r9FPZgtqmWqKX3vu6paEVA
	L1G/CaDPYs1aetPG3TEBEOisfEX0WWiYps6JKsRvsu4zoNNXKtR/v0aLM+eQETKnN7GROXzgb9s
	6jBj8+WWXl9ia8+7vxarbVROBbT4VPckdVKKgGgx7xWBkmgin5HxvwH1OXD7RYmad++TEmxUgyc
	HFjQ9cqhKJkQ+LgLql25TXOJJOLeCle5YWzz+mppyAPS1uXpl0Nropv/XdkUud7+Jgn0Srr5V/u
	mf0BTKt00oeGQnfDOXKuMKCOCTw2rXQvNI1SgCfEbHEO3gING1G6zhDO2e5npMjQtjYGYr9hR8M
	nCBijSeciNDrLK9eNRbnvOz7PyMQgrnQBQ7MewIaigbndMc6QEBishdnCR++KBXwa/mZAzhbiex
	OsN8QDsz/dKZhYhQAl
X-Google-Smtp-Source: AGHT+IFa8iFYE1mHZNLZZAoIBMPVdnAa15DTVssEZvzZFMtBAOg9AsW1j5BAqmNh19zqSPqBIE1AmA==
X-Received: by 2002:a05:6a20:9144:b0:334:7e45:e6b1 with SMTP id adf61e73a8af0-334a8546501mr16610469637.14.1760949561425;
        Mon, 20 Oct 2025 01:39:21 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a76b5d0b4sm7062386a12.29.2025.10.20.01.39.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 01:39:20 -0700 (PDT)
From: Longbin Li <looong.bin@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Thomas Bonnefille <thomas.bonnefille@bootlin.com>,
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Mon, 20 Oct 2025 16:38:31 +0800
Message-ID: <20251020083838.67522-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251020083838.67522-1-looong.bin@gmail.com>
References: <20251020083838.67522-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_013922_541033_CAB632CD 
X-CRM114-Status: GOOD (  12.81  )
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

The Sophgo CV1800/SG2000 SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Co-authored-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 81 +++++++++++++++++++
 1 file changed, 81 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..d044ca661fa2
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,81 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/soc/sophgo/sophgo,cv1800b-top-syscon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV18XX/SG200X SoC top system controller
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The Sophgo CV18XX/SG200X SoC top misc system controller provides
+  register access to configure related modules.
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - const: sophgo,cv1800b-top-syscon
+          - const: syscon
+          - const: simple-mfd
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 1
+
+  ranges: true
+
+patternProperties:
+  "dma-router@[0-9a-f]+$":
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  "phy@[0-9a-f]+$":
+    $ref: /schemas/phy/sophgo,cv1800b-usb2-phy.yaml#
+    unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sophgo,cv1800.h>
+
+    syscon@3000000 {
+      compatible = "sophgo,cv1800b-top-syscon", "syscon", "simple-mfd";
+      reg = <0x03000000 0x1000>;
+      #address-cells = <1>;
+      #size-cells = <1>;
+
+      usbphy: phy@48 {
+        compatible = "sophgo,cv1800b-usb2-phy";
+        reg = <0x48 0x4>;
+        #phy-cells = <0>;
+        clocks = <&clk CLK_USB_125M>,
+                 <&clk CLK_USB_33K>,
+                 <&clk CLK_USB_12M>;
+        clock-names = "app", "stb", "lpm";
+        resets = <&rst 58>;
+      };
+
+      dmamux: dma-router@154 {
+        compatible = "sophgo,cv1800b-dmamux";
+        reg = <0x154 0x8>, <0x298 0x4>;
+        #dma-cells = <2>;
+        dma-masters = <&dmac>;
+      };
+    };
+
+...
--
2.51.0

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
