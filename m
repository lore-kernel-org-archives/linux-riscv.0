Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFD2CD3B7E0
	for <linux-riscv@archiver.kernel.org>; Mon, 25 Nov 2024 06:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/tQMJ2aTvANLX41Vn2PbOtNEnthRjAOvVHKIT82aBKY=; b=L7BYbqA1tXRrHx
	s74KLBhmRJbxMSKs2EVXUNd8S9frF3T8Fs75H3iJesegbEs+gxJActBWP6/UbmSWW+xlFIxiJgQY4
	1mmxG7clHFxkSH+voMDukqGQiK3vA+SHiT2WVH1seeoFZeRMU3ml1I1YJaIh0Y4ZmSZ2T3WxfLfTb
	GFkDHqq+4DPv6PA9QpSLTRt4r9ZVLFVvQ3WTSaSXvnXFQntmpVozA03NMllAZtuxC1dz5Qro+aPVe
	ZW1NTaMy4bL8HISnB4lMNBdkoKCemgRFcqhQ6eHrWcnmVX7AI+tP5vB0kR1HjTz+F9sBIgn0tY5e3
	zliIVJw1DyY1xdN1GkzA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFSvT-00000007BlE-3X7j;
	Mon, 25 Nov 2024 06:50:27 +0000
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFSvR-00000007Bkk-0bcD
	for linux-riscv@lists.infradead.org;
	Mon, 25 Nov 2024 06:50:26 +0000
Received: by mail-oi1-x244.google.com with SMTP id 5614622812f47-3ea369fdb0cso630291b6e.3
        for <linux-riscv@lists.infradead.org>; Sun, 24 Nov 2024 22:50:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1732517424; x=1733122224; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J+kiw5et6X3OJrqRuFrC/N/QNK9E82D2UCKkpTvQsZc=;
        b=a5VmP799By+aYdLroTxbzJW3bPyLS3ZSo3Wu1efpq2Iqx1QR8x14rRjokX1gEbZB5p
         /B04jjZCeFXZdVlN3T/rGpiBl5kuvQ22h0KyrQ6veVFJGGlZAWvRwdD95qHJyVzuxnoF
         35HrSJGD/cHK+FeqVtnA529N+V1aSfkEC7NOfWgZ4YdKISSyF5SlcGT6t71v4oZVCMcf
         QGVojY8K6OXrMz9oZR4ivjuGPiam18Kc8P4rKk8+cR7KVGATBbhf9subfbuZ0w0LwZfa
         SKjvL29VeX9KxH82xvQwaRNLTGZ4UtrCjW085ZBkeFWDXveglbjCXHQu43l3mjL++z47
         E7XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732517424; x=1733122224;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J+kiw5et6X3OJrqRuFrC/N/QNK9E82D2UCKkpTvQsZc=;
        b=dUSO6PT1qsp0hZ5j7pIXHnWpwhLNIihANBxLI78Zk5t78pwE5siAeEAJ/XLdwvT06b
         X5w9da8GYwNgzArqAlYrLF2YN8qKrOzFXEL4jUd55nFuqW9auINSGMZR7/xEIfOsqQkw
         ryqErPkjZXlptx483VrLrA9eCLO1wRDdCmISfBwK1sjY7BnOQle9ktiMU6712A9nOiVc
         AaH+SPY3xL21UH/623IT8D0kxp1uOsDhllOjG1I1/ccC1Z6xNkPpBd8UuiHPbPEceigX
         7+0owRReCz0rhRU9i1/Pu7wG5qnbZ8QTcPA+6h5AMshy5w7Eo/rN5F0LgqkKLvo7f5SO
         AmLQ==
X-Gm-Message-State: AOJu0YxI6ECmL+JlEOT02gYxajWX6c4H9HJWqJx2LUAOMHjZMronPnyd
	NNFsLcVHgwgZIlpCqLeq8uKa9/vi4UaGUHIS+iBRlQBThZ0+LMN2
X-Gm-Gg: ASbGncui3ScZVnvnirZJ2+Qu0eIGu3qT5j7DHQvdx7DexNycuApSQaLDVLXW8lGBHMb
	EgdXKTvgFNlw7m/sQt35fEIWVp1ZH1rgPUp1bCvBb/OsEJVkpV1YL+F+w1bd4eQzL6s9Rnmiqz4
	2D3W85VpoS75p3Tr59oGBSdVS0Tbs0a0CwdT/DH9Q6tSxiQZlIw+J/JKXcrX1MNmU7DVm5EAwbX
	3oFfcruel3Qk9TW9ELc12zTolA+shO3M8/k6MsXR/vyiDkKJpjgKcMsdg==
X-Google-Smtp-Source: AGHT+IFEVtYNWuGd73SybeJmq8dEfY7cG1hR4q8ftrrbW4Zpz8Yz3pGDaUpXl7xQMBltjnN+vKhpVg==
X-Received: by 2002:a05:6808:2286:b0:3e5:c7dc:ac60 with SMTP id 5614622812f47-3e915a58bcfmr10516155b6e.43.1732517424045;
        Sun, 24 Nov 2024 22:50:24 -0800 (PST)
Received: from [127.0.1.1] ([106.114.39.219])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724de454b41sm5649602b3a.32.2024.11.24.22.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 24 Nov 2024 22:50:23 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
Date: Mon, 25 Nov 2024 14:49:53 +0800
Subject: [PATCH v4 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20241125-k1-i2c-master-v4-1-0f3d5886336b@gmail.com>
References: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
In-Reply-To: <20241125-k1-i2c-master-v4-0-0f3d5886336b@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Troy Mitchell <TroyMitchell988@gmail.com>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1732517408; l=1763;
 i=TroyMitchell988@gmail.com; h=from:subject:message-id;
 bh=JIuSz4oWKf67hQAMbb92x53roAkcEc4sGNGVD/6wgRE=;
 b=7AKnC3n/NXKIor0CDHlsIleNql0hJw+/Ns+b9KSuHQuK1+3QSdyJGtBWAtWi30moAUJUmYYl4
 7nGMO7/GdFfALIGz4PeEVqHmek19UCldsvMHBl2RjRCXS+lSJrwhJXe
X-Developer-Key: i=TroyMitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241124_225025_191045_B87272BF 
X-CRM114-Status: GOOD (  10.54  )
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

From: Troy Mitchell <troymitchell988@gmail.com>

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 53 ++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..e7cc62f39e28
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,53 @@
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
+    maxItems: 1
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
+        clocks = <&ccu 90>;
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
