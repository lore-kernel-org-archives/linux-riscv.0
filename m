Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E82C28B23
	for <linux-riscv@archiver.kernel.org>; Fri,  7 Mar 2025 13:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bQ7kQ02c78vvvOp3kZyQfpybnPj1VuiWTeUFP9AllG4=; b=gUMnRVzHjB138e
	3jwU7ZHqhqGWAWbMmjmCWEc3VA9vuXFyw2hlFyv8nPaSSuCulVlOqA6hv9Ero1V8rNckhu7nNfZHl
	4B+BlT4dB6Ie4mTFyOnwfyny0Hey8ZukwLFbHw2XoYmOEibubsooAbpFXDEjP6YgpNSrLoPtrE11y
	Fg4PcOal1fcfdLf+2jCMK4I8/aPCdfBqCNUHtTE74ZZWOuouezAsd0ZJRS0w1YM4/c1v45vjEV5Nx
	/4/eMAJ4E8DRh0/wBkxDULw+Z5fREp425+sXOnaNXz9IxwDNZ3zQ/zIbhKy9B1i8QcqIMDTx9xzdM
	R0BplLweVYqf9chsApRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXZH-0000000EIUr-0CCX;
	Fri, 07 Mar 2025 13:16:47 +0000
Received: from mail-pj1-x1043.google.com ([2607:f8b0:4864:20::1043])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqXZE-0000000EIU6-2eny
	for linux-riscv@lists.infradead.org;
	Fri, 07 Mar 2025 13:16:45 +0000
Received: by mail-pj1-x1043.google.com with SMTP id 98e67ed59e1d1-2ff799d99dcso2343550a91.1
        for <linux-riscv@lists.infradead.org>; Fri, 07 Mar 2025 05:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741353403; x=1741958203; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=efgQjhR4aCabfgdF2FkohcAA8CG2VfCPk8HHcJhIIXs=;
        b=LflpjYOSRFyKScXZcJoi7NxwtDLOeiG+coXy8OhE/Myj8tbNI6y8vebMyDN87ahyoP
         m4x8BI7uRa006Cj2ppD0MtRmxUf774i2jdOACknHNSjvA/A9DOezYOcfMQvu8Wl402ee
         x/5x7HqAYK2qgs6pN6202H5fOCXCK/D7DKMhe52SQKVUhdzw7PO1Mq1iAKqFijVafKou
         7Ku8ENPgSA6cfgvN/mgy53EJ5qeoEGD2LsLo0pjzJFL1RWMxLpq6pbORUx5YRV9jiR0l
         IsYveoVZa5JhVPd23UBucJZG2upt2/sgqOizvWt4ogMW9sPsJ5FILm90AnzzPCdtSFRl
         JLNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741353403; x=1741958203;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=efgQjhR4aCabfgdF2FkohcAA8CG2VfCPk8HHcJhIIXs=;
        b=YI1OWoWtY1uNAEXOFXwH0Wi/mEuiAoX2zLtBXOvXnSLPzdaaL7wh3hVSXMUB+LrVf2
         nnwGJskEuXDco+WOvL/ggm4V4nd87js6TOOTbQB2wFL6Qy+ymYNV3rmHVNwt2IfL1G95
         Crvxoqk0YZFLJi2MFawOs7ichOv+zBMbXww57CxtrGRHYgx4II4NDWKM3X43dpkDXrl6
         aPwkTgbq9D7j0xOL93RAQruqpPXzWcgkpz8pdZ4tcsb5nWGkzQaPigCrf4UuyQPsPD2T
         O76br3Dk7ZboY/2IUhVw3KxM9u2Fc8ap3wW2jyze0G173MnAmm1AHVQ0NOPm41oVsNp9
         bA4Q==
X-Gm-Message-State: AOJu0Yxns/pYFIuTzAYUnCROYph7qtMHjsWsIMJz713pGp3NehBkIzCD
	Db6ccVyiF8RWpWEJ50EfkSlTK4ek/+6rFB9gsztD6iO0G5MoRDYk
X-Gm-Gg: ASbGnctFFGck6Trv7jGV4joTvxiyKCX6gC7/phntGsdywTYEFf96/GSkujx3q2mMy8U
	XukfL6PSFgvrfS6vN93Ivz4vuCnjXLHhLMDGmfX1B4hgZ3U5E+1rUnRi7F2q26YFlBNWgDN2MU9
	YtUNP2RFrFlxzfsw0sErpT+UJNMma8Puo37buLYd+/4lyI5j3c52JtFlr6NlYp5BYMeaKf9I1R8
	SKX27/hQ9CrBY8UqI0VEjl2g45R7I/vefSjaQ8p2+UvQku97DHMDzoIIjQy60I9quDB9KPB6e5J
	g9TPNAGvzHc2QTzaQ8gtXYifjZfz
X-Google-Smtp-Source: AGHT+IGOn8DDBRvJaqYmjHkVKOo2YGgRckoyLCbOPcvQyE/WHG4r5RQgaVBafk+cqrlqSRAtImzL2Q==
X-Received: by 2002:a17:90b:17c3:b0:2fe:6942:3710 with SMTP id 98e67ed59e1d1-2ff7ce59681mr4835480a91.3.1741353403442;
        Fri, 07 Mar 2025 05:16:43 -0800 (PST)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff693f7cebsm2984589a91.45.2025.03.07.05.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Mar 2025 05:16:43 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Fri, 07 Mar 2025 21:13:46 +0800
Subject: [PATCH v6 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250307-k1-i2c-master-v6-1-34f17d2dae1c@gmail.com>
References: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
In-Reply-To: <20250307-k1-i2c-master-v6-0-34f17d2dae1c@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741353244; l=2076;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=Gc270i/DQwjrh9iRRxvjY11dqiqcfQ99KjBuKm1O9Sc=;
 b=uHKb/n5KV0CgdPyA2JMTLZC0UbC95R96oPXM6/QfwaU6OD4o25nhIjtQFExpRt0uPI+m7mVOi
 JNP0g1UOrxkCMLczzmrt8b1hgMxVQflzUKmt59MiHLLTi8unxpBBpEk
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_051644_679779_2635FCAF 
X-CRM114-Status: GOOD (  10.11  )
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

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 61 ++++++++++++++++++++++
 1 file changed, 61 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..3d6aefb0d0f185ba64e414ac7f5b96cd18659fd3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,61 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: I2C Functional Clock
+      - description: APB Bus Clock
+
+  clock-names:
+    items:
+      - const: func
+      - const: bus
+
+  clock-frequency:
+    description: |
+      K1 support three different modes which running different frequencies
+      standard speed mode: up to 100000 (100Hz)
+      fast speed mode    : up to 400000 (400Hz)
+      high speed mode    : up to 3300000 (3.3Mhz)
+    default: 400000
+    maximum: 3300000
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks =<&ccu 32>, <&ccu 84>;
+        clock-names = "func", "bus";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
