Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B62C282DE
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Mar 2025 07:46:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vj1n0e8T8QO41hmPrsgbGd98YTyaQzdd1eIhAjFvqrk=; b=cJc4gKVGrXP/v2
	Fri76U/Agu0m/MBUX1mobmvHfKaGGBoSVUdTuGBz8Ay/UEMb0JCSPtegxD09Jrx6f4kHcrrp4BRHq
	WSwUn+Y2h9WAAxZZPB4Q9C0XzRqUwptTfyF3WNm0iSRU0PDgr7vGIa/8hcscPXKQdb37m/IA04Bd/
	QSc26ilKfcFnKiNun3GftPdOsin41rpRSZbQbTW66we+YCSJA1PxATAhDY8Ndo06aGgo8b1ao3TLQ
	nWxfgHx10cKV+lensntYk10sozkqBCz6szbmeZmZxB5o2gPX2f4ePSjMXy/QnUYvVZMa1Ve2X+xOK
	NaILwJHhwA9C1ZKVCXyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ttihO-0000000HSMk-1a0X;
	Sun, 16 Mar 2025 07:46:18 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ttihL-0000000HSLS-1TLW
	for linux-riscv@lists.infradead.org;
	Sun, 16 Mar 2025 07:46:17 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-225a28a511eso55543395ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 16 Mar 2025 00:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742111174; x=1742715974; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=LYa4aAXKAUjzNAB+Ycwh+0QkMG0+YQDFAjhXO/w60/69DfxJ4TkZKH0yCX9GCMqdY+
         Jiff0Kk/cFC6G/Lz8px/OpzlMraneWy7K343P70LITY5Tlwv+3xD4fRr7EaNUPc7O/Qi
         5GIZq+bgZi9JnpVCqQXbRIgIrDaI34HyVCZFn2z62hsWAeIbQVBHmLANLRzJg9lfkh0R
         whztXVJx81FB21Rtbhsp727+gLWglPIsK29dvGyL2jLwju7YFlAlgsSjiEIP3OJDpOTh
         FBnmtRdoSEf3KbDKXvkQ3uI9jFywCSHyTvXEfyBFsoTCJnhZOynPV3IU8OTqEVWwOVFW
         7xYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742111174; x=1742715974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=FSzP2sj0sSGElxnrTKKv/+xrEKnbsjpJ+xw3RmSjY5LvGRqkXD6cSMl0Q5StqlQx/1
         fiYsk6JhJvtvMxO/RsiE01WrmoUmeVEtMrLFM+q13nS7sfrvTXjf+X5EZ2jmFnun7pVe
         atx9qbZ2tPeyWksvjJRD8XZ518lKsbolcI2pTmbJp0cOmCWTYOdRL3aXzcyASUokDrbx
         EW1DD2SbDCXckC6UOpmNKM4BtjaIszCNRLvvyU2HZ9KFkQEQt1lUIKYF8R93GeJc5rPR
         2uTAhpCyaLifyGrrfo254ZSGSGF/L+ftPmOo7gZVuTdKiWYO2rjX88uhw3v4l1mn/uXx
         hRtg==
X-Gm-Message-State: AOJu0YxAoHIz1WiwTY+qc+qVFWSqLT6C9jqJUv224ZHHpL8Fj8oLL15W
	dL1lCkRbRTORZkfQpGzoKstolx4EOFiO7djSX57mxULPi1AX9DxXnpuN5R+D14QI/dHD
X-Gm-Gg: ASbGncvwVISiQMuk34duL4w3DBw6PjZArVUtSrm0B1nLMabCCJVZ7tLxLOo8SHlnls5
	Jr1I/lb7UEcv3QhEXPQJx+9OlOCO6RQRvuZAElNmTCNWPXRPuDXntiZDnxqAmlPFfF9NLInGhao
	Z8Y4GQ4Y6DVE6x1y5FX3x4eWDxyq2mQvYl1t5eJpTNL5pTr68+m/8h2bx//SPiOzimtp//gy6va
	Yd/ls5+NcFZQSC8HMCxtunDfN5hf+73WLUqDIPvtjc1cY/hYVOsxzNIOMXompvgLgBh1/SlpJKY
	hAISoX9W5PuO4MdIg74VClAguJ6s09qi/yOkddk=
X-Google-Smtp-Source: AGHT+IHnoTX4HvYj6GA+XsaeR/Z5lsvK9bYDQeHmDp9+70ZV3nun+eVO850kkAELvfo3/3lwtE3oqA==
X-Received: by 2002:a05:6a00:4b05:b0:736:ff65:3fcc with SMTP id d2e1a72fcca58-737223ed33bmr8204799b3a.16.1742111173585;
        Sun, 16 Mar 2025 00:46:13 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73711694e56sm5575907b3a.130.2025.03.16.00.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Mar 2025 00:46:13 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Sun, 16 Mar 2025 15:43:21 +0800
Subject: [PATCH v7 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250316-k1-i2c-master-v7-1-f2d5c43e2f40@gmail.com>
References: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
In-Reply-To: <20250316-k1-i2c-master-v7-0-f2d5c43e2f40@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742111004; l=2169;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
 b=QN7vDkWymm9DXNpwH7BLID5XKsUCIqAc8T69dLCpf51XfHi9rFbn0wEu2xY3I4LyEJhNDsdQz
 kaS++L6eUuDBi3HmNLXanwqZeQUZHTc52mLBYrp++RilH5LSBEKkPkO
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250316_004615_939550_488673CE 
X-CRM114-Status: UNSURE (   9.81  )
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

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Link: https://lore.kernel.org/all/20250128-k1-maintainer-1-v1-1-e5dec4f379eb@gentoo.org [1]
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
