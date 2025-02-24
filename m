Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C30EC021A4
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Feb 2025 10:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=R84bui6NoD0Ofwl5PQRV1Q3V4YlVx02a0VIUHseIx0E=; b=qKd6ksj+3tqClf
	uGJ+goWZb6fq83242O/QyOLt/E5vQWnHybhA0x66x8IJ48uyGIx3CgT4D/6P4XuaGXtdZYxyS/Ysu
	wFC1cLHIUp85gTxXRxlq/qiqyUgi9Pqole5Lu1M4/LpsTr7fnRc/98c+4Z32t+GqylrcUP4B1oIfq
	8UwKIdUSWAAjbsw4OZQSMMx0ykmofnUdVTgQpB0d6XOQb2TnYIeGBZZuNWZ0RS2VmPFxKhI5ul9i4
	2nGWstP8H5ZwiIXy8HQN60TOT2HgtY1UrcVJY/rH76SmyW/d1uz3+cv9dK5G1UuPKtM7TKbsA0/4d
	EQ7/9BtkrbD7PUEsUvmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVbS-0000000D6TF-3vMu;
	Mon, 24 Feb 2025 10:22:22 +0000
Received: from mail-pl1-x62a.google.com ([2607:f8b0:4864:20::62a])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tmVSL-0000000D4Xg-3NII
	for linux-riscv@lists.infradead.org;
	Mon, 24 Feb 2025 10:12:59 +0000
Received: by mail-pl1-x62a.google.com with SMTP id d9443c01a7336-220d28c215eso62106885ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Feb 2025 02:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740391977; x=1740996777; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfgdDU3dHCgHvLuyG46NLXGA1z+1QvVU4idXkiLTeYg=;
        b=DCwKIyX//xr8iK2qghZM7db/mqVGkO0qxUSEXhTmd3JyjfxcCkKakWQQJWDTg8mD24
         +ArGrvHohWa1cp61458HoNoMTl18hZoOQe+f/5sAq8+237/u6rMftfRq6fDRqPuQ3537
         m4leYrdpLCAadsy2ipO3abr0K+iOxtwqLrM7vVLWbqzH18CzxYmFAUiCBIDhYWU/Bzuk
         ERfBl+URT8M2YbHvnj9Y2jbiErHddjriSrGQoHAgN9ehd6/p9KpiKZn71syO4dlSMakP
         95t2Azo8VvQJiGv1sihovX+Kw0/2frk1Kn72xFHjrfYpM85wNsT+tyH/D8VMC6xUNCTs
         eTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740391977; x=1740996777;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfgdDU3dHCgHvLuyG46NLXGA1z+1QvVU4idXkiLTeYg=;
        b=L3fhYC4mn2owCfeYh3KnBBkRWeHpS8+vnLS6n5Jn9/xAWoItRYaFJI53SJXYcsQywv
         XS0ilSHtrjqxtbt/okPZWSkRA2i655oYqNgQN1ay9HrUhuADgPz2WxbuKMN38vqkIQvN
         5JRCq76QWOK9vAGkcyy/UQKsKJcdZXWA/HOn8S4OvMbZw8GQX76Kw9PsF+VNkh63Mqlc
         vzBx1gAk5mNffT1mLoQiUM2dtrHlqj04NJhOqFQ4PWFirpOKYfOJVCwFTv49ynQJkEDR
         GQ9wk3A2N4RzbXODSY1sVELP5DnfNmArUrf2tA/WeKwDL7uwxfm6vwHyLtjtvC0RkBVu
         WXeg==
X-Forwarded-Encrypted: i=1; AJvYcCW1vddOQfxRiKk59f1AK2bO4q/fgHDNYi1QzXN1L1FOXwbVNPJK0yoEAkbtAK6RmPSkKSkgIjnaVD1Jgw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzaJ3HW81owK0q+Kb8Mkqh7wdI3TJbW+XXMrQiuvIsQ+yPjfR4Q
	ectvyPlGXEdv54CmTooFseoRDWZBrpEsLnYJmH0S0LdIj3QVkZNu
X-Gm-Gg: ASbGncuA9DX8P9b/CE4l3rH8lQghOGD56L+7dwsDL0yK01wJAI9mShLlD9EVGaKXGAI
	MN2MtA1Z3AwxlCDgEvNSqQUgfFo68VGTRD4wI9OdDSJ7Nws5SXCcoh0xtqD+dKpK+A1sU3n6uiY
	UyAYqAeT56XLyt/1RssG828uTq0U8ug7r52oKNAgxRIuZZsfxRmE93IyEIJ+cOk6BUhVzC9OI45
	8C7+/cpyLJKgyK3DtIhqIbni2SibbtbDdDQR9i5N81q8/lBGe6t+NxQUE8WTHaBokzpCwUPjqni
	zev/WMvDxib18oiYBZ98
X-Google-Smtp-Source: AGHT+IF04L64yddkAFq03o8LvF25Xq5MWdPj2nGFRbtcPd0hUWOcQ6Di7Lct9JFSZGV4Unfn5iL97Q==
X-Received: by 2002:a17:902:fc4e:b0:21f:7964:e989 with SMTP id d9443c01a7336-2219fffb650mr207806035ad.52.1740391977163;
        Mon, 24 Feb 2025 02:12:57 -0800 (PST)
Received: from cu.. ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d7a464f1sm173274365ad.206.2025.02.24.02.12.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Feb 2025 02:12:56 -0800 (PST)
From: Longbin Li <looong.bin@gmail.com>
To: Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>
Cc: Longbin Li <looong.bin@gmail.com>,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 1/3] dt-bindings: spi: add Sophgo SPI NOR controller driver
Date: Mon, 24 Feb 2025 18:12:00 +0800
Message-ID: <20250224101213.26003-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250224101213.26003-1-looong.bin@gmail.com>
References: <20250224101213.26003-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_021257_853116_B2047B9F 
X-CRM114-Status: GOOD (  11.63  )
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

Add SPI NOR driver for Sophgo, including read, write operations.

Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../bindings/spi/spi-sophgo-nor.yaml          | 52 +++++++++++++++++++
 1 file changed, 52 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml

diff --git a/Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml b/Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
new file mode 100644
index 000000000000..0b54946c649f
--- /dev/null
+++ b/Documentation/devicetree/bindings/spi/spi-sophgo-nor.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/spi/spi-sophgo-nor.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SPI NOR controller
+
+maintainers:
+  - Longbin Li <looong.bin@gmail.com>
+
+allOf:
+  - $ref: spi-controller.yaml#
+
+properties:
+  compatible:
+    const: sophgo,sg2044-spifmc-nor
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - interrupts
+  - resets
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi@1000000 {
+      compatible = "sophgo,sg2044-spifmc-nor";
+      reg = <0x1000000 0x4000000>;
+      #address-cells = <1>;
+      #size-cells = <0>;
+      clocks = <&clk 0>;
+      interrupts = <37 IRQ_TYPE_LEVEL_HIGH>;
+      resets = <&rst 0>;
+    };
--
2.48.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
