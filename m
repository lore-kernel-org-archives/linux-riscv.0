Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3EDEC36001
	for <linux-riscv@archiver.kernel.org>; Wed, 19 Mar 2025 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Vj1n0e8T8QO41hmPrsgbGd98YTyaQzdd1eIhAjFvqrk=; b=ZgGmiS5St2L2Qd
	aSqZ99GaiYy7xVwzqLM4KkbmJXjIQr33M76tt3zzB/d3mH/pEz5+M6QLcyuwr4FysIJWxsoMyZUof
	/WY8AbpDJ24W4Pxm/qiKqi7dz7GevS5aVjXmTTOT3pNjqy9Q30ebDk0kVtoGQay9xON4+Po3kkrBf
	Y9eMVrEWnBoyRxQPs4O9d+oOPvVXT2BILcn58RkWUUmNJnyhR/BD8LP8YwGEUIF3/xKvvZo8BaYNS
	vqW1cq3ZS1JAX42871XNSWSUw48xya0NETi2kSj+QK/4gwVHKb2zz//DQJDqqopxeZKnF/MY/sxVI
	piHRZ+BlVUyFhTFQflrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tupsE-00000008WBb-2Eob;
	Wed, 19 Mar 2025 09:38:06 +0000
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tupmR-00000008UgW-1A4W
	for linux-riscv@lists.infradead.org;
	Wed, 19 Mar 2025 09:32:08 +0000
Received: by mail-pl1-x644.google.com with SMTP id d9443c01a7336-22398e09e39so141698745ad.3
        for <linux-riscv@lists.infradead.org>; Wed, 19 Mar 2025 02:32:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742376726; x=1742981526; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=dm6ml3nnYR2AYwmPJl3GlH3oHExWxJZb/+gL1bRrjP7MPO9KuGrgH1FzIa8UlJKbPZ
         mY4UGl6n3JhIQHKJptku3DnoaNQZs1dfOtmOk7bV0nQHJgGDY8XWltm5OFinXqXi+cny
         ZUgWF2vAvpHUJLtlYrZP3lTq/9oQr5RsDlJx/SltYXwtLZdF5uIWmCsDrRAcPQ2zNMgD
         3mrDd9MMzd2CsS04lpvvZWsYr9u0kE9LPQ5sp7SH5ei5tF9unuoOm46amcOHQ7kQGXcp
         95Xal8S7OVRxsQQcKsq7pD70Ww2oeDxHEwKcCjuM2Zpe5TmHaLjmoo68cMRTOscFMa9G
         fEnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742376726; x=1742981526;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uh4Y53V77ruJXW8QR5flp6pUeWx/bYICn3Mwn1bkPIM=;
        b=ClgDcEFb/cAVKLDGelzO1lXdBeVROr6nw12s9HuUGFbGIHeFSJ2KFBWIR6twxzWor5
         4gVcm5zW1swma7so1Gw5oq3KjqdVIYk+F9IsHG78wIUrARD4OhpHcBN04HWf7p8DegHe
         slYk6akMhiTKFMiubs5NeuLBJSAZv+Q1ir4oT3MKSApvINSDUouVVe+WouOVX8V/xWmY
         Tog8pBQ7hzVfjyCEbkI7DkcIin2Ff/JUCqrto/U1GjmfUHubbzOFiv/lU+5cA2zztcaz
         4IPSVvALJL4Wt8/YaYsVb519p4mbu/5tYjBtsPzsv5ukmhYY7p3Ez2+F8Wj6GCs6/IC5
         9sVQ==
X-Gm-Message-State: AOJu0YzwyCB8oGEu+42rN8H8cAI3m+yJaagSvYP9jvn1DVbALtE0lQkt
	RdbrrjF/DQX6b+EYSMxu37y4YuVRnibCbD1d1aNXJLyGlUOUH640
X-Gm-Gg: ASbGncvRplcP2HdCNXjLC9EYq+Oa5Qrkya+A5U3TN0vCq2oaG4rSyxy8Xyk5qt506px
	P+AqrcDSG5C09uL9Ph5ZQhod8VD8cyUuVBsBJh7mAAwjq6uC47eKp8VMHDpxcVqF3Yt9m8/V2qH
	lyo2OZB/miVnMpCDjRsPiP+9IBlIDnG4JGj90HiBp0oJEHgjhf0E1EsevWEzG1qSmLsHUMIwsA9
	xXC6Ctwff+p/lryxUaUql2Kwp4styVZd7+93USD/Kia2a8yF0gZpAQZRCrAXhItKm5I5JpZ+jQb
	9QVb5iUAyYHNxtwnlVrg9IvEcPEA
X-Google-Smtp-Source: AGHT+IEJ7BbacbEjBca1zxi+l+r4IWpLrgxPdjplfun8EpRskeUbZl5L1DXxfpSILrv8YPi3IzkmNQ==
X-Received: by 2002:a05:6a00:1950:b0:736:4d44:8b77 with SMTP id d2e1a72fcca58-7376d602e89mr4285875b3a.8.1742376726411;
        Wed, 19 Mar 2025 02:32:06 -0700 (PDT)
Received: from [127.0.1.1] ([2602:f919:106::1b8])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-737115294b3sm11124315b3a.5.2025.03.19.02.32.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Mar 2025 02:32:05 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Wed, 19 Mar 2025 17:28:59 +0800
Subject: [PATCH v8 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
MIME-Version: 1.0
Message-Id: <20250319-k1-i2c-master-v8-1-013e2df2b78d@gmail.com>
References: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
In-Reply-To: <20250319-k1-i2c-master-v8-0-013e2df2b78d@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742376553; l=2169;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=XJqQ9vN219kTUQDWWgsn5UwgncFFcAviYm9fDZ7tTqw=;
 b=ZFqrmrmY/RWmGj7gLZCWgUTyAZDH/C6mwYsfTc7zti10F5HuSECxeuGJzGC70nnaguSUYNzC1
 XRwzIOgU+UbBQzELodEkO37GCtbQMP9WNVPJcdR59lFVF2Ap5222r23
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250319_023207_322159_9396791C 
X-CRM114-Status: GOOD (  10.72  )
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
