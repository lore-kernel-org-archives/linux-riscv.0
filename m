Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 457E7D3C92A
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=mqD4gjq9EtfuWfMKrqbD+ligcOZAE1ZVSILHqKX+Ues=; b=DXMsH6RKm6MQpZ
	jdQGt2+cG6HiRN7Fmyf4UaFpN9cv05NMQkR/OH0KisMTJr1SSBGTH13zlPuliqxBCHI/TxWZvFCEH
	rzLQWL9W66leBhGLrPRzBqiSrHnQ0yDVREpoC3cghL/HuLAvDjWyzR3YN/A1WUjicmzuGUAQYA/js
	RHuIiz6rLqpHQACtorkuBloPpv/a6rqkq2YbGfocLfgTT+HWFyd66NDGpU82wI/y45nwEa+gBMuWf
	qfand4j1jxW77oUsxl7d80J5KALakw2YqF8qyEbr1ludjCKeKhj8tKozWZG+iTB2Nf9UHafvZsveb
	UN5fvJmdACAsL+tND6sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ulr-00000004rAT-0uIi;
	Sun, 20 Oct 2024 12:10:55 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2Ulo-00000004r9A-0wed
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 12:10:53 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-71e72db7bb1so2649401b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 05:10:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729426251; x=1730031051; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESpVDdqvWArJZ/zn9KV45HICoQoUKaqzB0C6fhXH0e8=;
        b=ZWvtzw3MtVL61RQZJ0qmiIHAsgrDDpzxsz7vYLaUR1xZxRQzM3CHkHqWHbSxLWT1tb
         xCJuEwlYMddkQwMbpnjMitDm7fBZ/0v/Y6X6mmBdFig+0AGzQzrDl+kf3hrXuvIFNhum
         TxQ7jLP67sY0FYDHuzBRoiOL7FMfO8tUKDMajxhx8QfXldFr9Q0XRKn1QDZ6dlcMsdB/
         tEz0yG8zK7TfcDo7awS3FeH3oOoLNVlOTrLq0DfJhexxlTwlED+kUwpaPb/jhUw1aCJM
         H0tUBjoFi1C0FEg95YOghWYzLmcEIfbDtMVUuBkrShzbIS+9v7mWVSmWXBG9MATLqGIW
         q+Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729426251; x=1730031051;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ESpVDdqvWArJZ/zn9KV45HICoQoUKaqzB0C6fhXH0e8=;
        b=NNr/e/gBTMUt/K03CC0EN0z6hfPUmr4sfrWNcAbsVNfqukpAumngWuATBIUvSR3ArY
         lBOy2VCE+wExmZFXpdi5Xw2s2DWBTJqUKzr7Sa7jVeTgv2uKryqw7nKuAGQVXF7jKTVl
         8t16rPvvFTVo+/hIGRBobIZFFwn0NgioG8Jf0+bMXhHQNk4kiFwTrtthOsQ4cQKsfl6U
         b9D16cN3xPRzlcWZk0UdD+LkqcvpvXtEqLLzUL0BEhgFvbb6TEJAY5j9gxZEz+tkpbKm
         lRYohQHwVfFMjd7+XbsqDg+RYtpvPa0aQ2UHAH7X/RwuaRAgzFscY8AgFa+5nYAfNh6G
         PVdg==
X-Forwarded-Encrypted: i=1; AJvYcCX8w++LNPfY2uy9iRCaHHVqPg2hGZNbjt+wQXroNgff4gxa+Vv6zEM0YVJf3jVQ4K2tK/gi1zuMjcmqcQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxlQM01g9kpBOeo50K4onxjBddIRlAbkS0GsXNINRaCE7KoZ0rI
	jOMWXoGF9mLYOIVHPvrYXAPjXNYkbAN09cSCOMbEkffHnVPOPjgj
X-Google-Smtp-Source: AGHT+IFxdNKHpEyAEhs+OtgWVnS/3mbcUWbugIHe2isaXwnze/x4LhRIbxctqs3KZKUSftj8na/ugw==
X-Received: by 2002:a05:6a00:21ce:b0:71e:8023:c718 with SMTP id d2e1a72fcca58-71ea31f627bmr10972565b3a.8.1729426251183;
        Sun, 20 Oct 2024 05:10:51 -0700 (PDT)
Received: from localhost ([121.250.214.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71ec13eb08asm1097140b3a.173.2024.10.20.05.10.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 05:10:50 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Chen Wang <unicorn_wang@outlook.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Peter Zijlstra <peterz@infradead.org>,
	Inochi Amaoto <inochiama@outlook.com>,
	Guo Ren <guoren@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Yangyu Chen <cyy@cyyself.name>,
	Hal Feng <hal.feng@starfivetech.com>
Cc: Yixun Lan <dlan@gentoo.org>,
	Inochi Amaoto <inochiama@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: interrupt-controller: Add Sophgo SG2044 ACLINT SSWI
Date: Sun, 20 Oct 2024 20:10:28 +0800
Message-ID: <20241020121030.1012572-2-inochiama@gmail.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241020121030.1012572-1-inochiama@gmail.com>
References: <20241020121030.1012572-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_051052_291246_485E70F5 
X-CRM114-Status: GOOD (  14.42  )
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

Sophgo SG2044 has a new version of T-HEAD C920, which implement
a fully featured ACLINT device. This ACLINT has an extra SSWI
field to support fast S-mode IPI.

Add necessary compatible string for the T-HEAD ACLINT sswi device.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../thead,c900-aclint-sswi.yaml               | 58 +++++++++++++++++++
 1 file changed, 58 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml

diff --git a/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
new file mode 100644
index 000000000000..0106fbf3ea1f
--- /dev/null
+++ b/Documentation/devicetree/bindings/interrupt-controller/thead,c900-aclint-sswi.yaml
@@ -0,0 +1,58 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/interrupt-controller/thead,c900-aclint-sswi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo sg2044 ACLINT Supervisor-level Software Interrupt Device
+
+maintainers:
+  - Inochi Amaoto <inochiama@outlook.com>
+
+description:
+  The SSWI device is a part of the riscv ACLINT device. It provides
+  supervisor-level IPI functionality for a set of HARTs on a RISC-V
+  platform. It provides a register to set an IPI (SETSSIP) for each
+  HART connected to the SSWI device.
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - sophgo,sg2044-aclint-sswi
+      - const: thead,c900-aclint-sswi
+
+  reg:
+    maxItems: 1
+
+  "#interrupt-cells":
+    const: 0
+
+  interrupt-controller: true
+
+  interrupts-extended:
+    minItems: 1
+    maxItems: 4095
+
+additionalProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#interrupt-cells"
+  - interrupt-controller
+  - interrupts-extended
+
+examples:
+  - |
+    interrupt-controller@94000000 {
+      compatible = "sophgo,sg2044-aclint-sswi", "thead,c900-aclint-sswi";
+      reg = <0x94000000 0x00004000>;
+      #interrupt-cells = <0>;
+      interrupt-controller;
+      interrupts-extended = <&cpu1intc 1>,
+                            <&cpu2intc 1>,
+                            <&cpu3intc 1>,
+                            <&cpu4intc 1>;
+    };
+...
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
