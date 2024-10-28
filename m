Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D581D13570
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 05:37:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=0YsuvgL9bmvykfXzNptnq9fRs4o4l9+a88snte5MzKA=; b=BOd6PRdGIDsZNY
	XZgNjJUUfVrhTkNLKkTfo9vWficaNH6/LDxvJL/IxntuwBzKCjiU8H9pUgrj6J1Qv9vshePpdgC1H
	pDLbTkvOqdNpWhT4YWU+X6jsaa350dOU++ZbhjwyPYVhQK8bgeRLqKXbk1MgiNB8KfJYjmvWi53Y1
	qxtUwP07oVVzttA9f7wpLG15jE1CWRfz0AhJvCkJV/Vi2zYZDVP7efJoL6jUYTRawQDgpIsZq25iP
	5YBwmXYjrYGLOHLgOmzHjDKwBa1dN3kkz2hGhwfcM21+Z7Re4xHIdDh3uOt7+U7sCa9+rFFYESsJ7
	UmzZozxTJscYcyRe/1iw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IR3-00000009c7z-0l0h;
	Mon, 28 Oct 2024 05:37:01 +0000
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5IMo-00000009b95-3f4Y
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 05:32:40 +0000
Received: by mail-pl1-x641.google.com with SMTP id d9443c01a7336-207115e3056so31616485ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 22:32:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730093558; x=1730698358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2Rxzu8/nDrEhPkjYLwk7/lZitCFsLtWr9y8ItsfrPD0=;
        b=VHz5Yw/ek2s0LsM+eRtNqFsvHTPkMQAJ2Yjhjqn3wMEGSBZtIamRjsuIZbenF6z/AY
         M7RCs4oDkoy/+ey78XGbAywN7gH5qV98w0JOO4q0UCp7L6ynMKM1kUn8IYrZZf0aieEW
         Bx3tXfk2de/1fNioLvWpWZrpt0Bbz2PFmweCfzZn+navWD46HiyIswDqNlLR7rzElOt6
         ekW7Dxti2stwd3YLR9M/atfca3SotlAiWOgzj+m4pj/2/Z5nqgtpNyRvhfqvcKG5m7I/
         98KooZ87jxYG5VJss79XLYisgCJEB792n5nan3Xd3KTXYxznhOWbKvFrdt1NvcH3VVBl
         yiUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730093558; x=1730698358;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2Rxzu8/nDrEhPkjYLwk7/lZitCFsLtWr9y8ItsfrPD0=;
        b=MNGZEkXDqKIK4pO6n/xhsqXSyxAKFKV1o9ABaBU2wCCGHXagnFpPITG7ewXtZFgEuE
         9seQa3x3QBhkzhqdNN1qP3zRA7Vmw5+nELL4meRXyr39gpHGjtd1jQFIqnfc72pm/qBv
         m/YwobV3a5Nv0Bnf+k2LposrDVWiZOBGkavHCf84S1UKXpg0FsIi5turwQq3y/M7UZR4
         cZANPy8YymC/WV9DQ14cR7GnY9bD61zBuseE/eIwC9dzNQwhmL4NG8JyH/GkqO9vkyJ0
         h3MBGZkvrz9jZXzI3GpMK8waVnhuzkDO7zc4JZdy4WYZuqZuR1xfHhg1YYD8bSkuSWFv
         r08Q==
X-Forwarded-Encrypted: i=1; AJvYcCXKhLNUQ6DD4cOZX4mAxThnJdZixzvZTCPgvAr2CiwuN9hEgW0sGS6WySRlsDZTDVCuyOxkmgMLwaNkhw==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy2T/OgHsSjJPEAIv6AOa+Lrlz/ld0PGTSaJvxHb66dj2Mx+tmC
	PdwGfSkO3BGpeL2HPW5p+Yew+nU1Kof0DPNeN+wXJUatMG8+c9eP
X-Google-Smtp-Source: AGHT+IE617UFyReq24qO6TxPn5hfQbe0B4rWfputWH0r22erL33CcMpWVuxE+z7NOwutSFUjIDEE5A==
X-Received: by 2002:a17:903:11cd:b0:20c:f0dd:c408 with SMTP id d9443c01a7336-210c6897f24mr90859605ad.20.1730093557918;
        Sun, 27 Oct 2024 22:32:37 -0700 (PDT)
Received: from troy-WUJIE14-PRO.tailc1d423.ts.net ([120.211.145.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-210bc02e941sm43216475ad.204.2024.10.27.22.32.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 22:32:37 -0700 (PDT)
From: Troy Mitchell <troymitchell988@gmail.com>
X-Google-Original-From: Troy Mitchell <TroyMitchell988@gmail.com>
To: andi.shyti@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: troymitchell988@gmail.com,
	linux-i2c@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/2] dt-bindings: i2c: spacemit: add support for K1 SoC
Date: Mon, 28 Oct 2024 13:32:19 +0800
Message-Id: <20241028053220.346283-2-TroyMitchell988@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028053220.346283-1-TroyMitchell988@gmail.com>
References: <20241028053220.346283-1-TroyMitchell988@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_223238_933571_3891D763 
X-CRM114-Status: GOOD (  11.36  )
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

Signed-off-by: Troy Mitchell <TroyMitchell988@gmail.com>
---
 .../bindings/i2c/spacemit,k1-i2c.yaml         | 51 +++++++++++++++++++
 1 file changed, 51 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 000000000000..57af66f494e7
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,51 @@
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
+    maxItems: 2
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  clock-frequency:
+    description:
+      Desired I2C bus clock frequency in Hz. As only fast and high-speed
+      modes are supported by hardware, possible values are 100000 and 400000.
+    enum: [100000, 400000]
+    default: 100000
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
+        reg = <0x0 0xd4010800 0x0 0x38>;
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
