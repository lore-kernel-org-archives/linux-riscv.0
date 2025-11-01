Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66D22CCF9FE
	for <linux-riscv@archiver.kernel.org>; Sat,  1 Nov 2025 01:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=dlx+kNYT8VOD/FOf63/nBgT8/pIushXMAYG9UFKt9Gw=; b=iJCv8FKd6q4W4B
	q/YIXkQVzRCSfPiCaPa8TDFJsIRYO2hh069vHhNnhvtaYuTz+3SSqF+PCxODtKx1xQYcTPlLPETnq
	yxe6sPPg5Jzl5cGXTkZm4RZZM/MqbBLeJ2Ves3IKKbq0FOxSVsi6n6ujJitac+8wn43MLgDKpGhgH
	ZUqDLBPGxRc1taVV4Fcwuu4JxtJpBki3siUJGEMaXcB+qjLJPHyQD7kK9rHU4J50v707HwPY12UIS
	48U5rc65SL+8SqwhMLeuBosNCDSet9jTcU2qhgzxh8x3YxgbXTrJHdz8POZkMKb+zrlruczG8Nz5v
	LVyEyVe7B4AwatOzBfuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fd-00000006yL9-0JhM;
	Sat, 01 Nov 2025 01:44:45 +0000
Received: from mail-pf1-x431.google.com ([2607:f8b0:4864:20::431])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vF0fa-00000006yKj-3pBR
	for linux-riscv@lists.infradead.org;
	Sat, 01 Nov 2025 01:44:44 +0000
Received: by mail-pf1-x431.google.com with SMTP id d2e1a72fcca58-7811a02316bso2300398b3a.3
        for <linux-riscv@lists.infradead.org>; Fri, 31 Oct 2025 18:44:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761961482; x=1762566282; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qGEyWBftW5DrlPcZTKmzDkZi1ol5FQ6mGvv5tC6kJvQ=;
        b=VMCds+3k9pvZeFiFCafybg8R6Nmye3nX/QeRg8A6Ys58pyLQkFjoMh1V9jxw3cCKbZ
         4PA+TnwMiI7TABw7YfTCEsLOUcBZm4Le14GOrs2+jZnEXBBspe/XLZlhcGFJ3F5dcibT
         FQTX58hDSZsT5/GJelqcVorA2l8PvHvz/0/l7u+A/ELMC6SB00y5KtObw18ckb6hDcc4
         6u0TA4w8WrLNdGiSMKP513W7ylDIUuYaW1Q09EXIZQTkU5jFHx18yjrhDRLWLu0zOBLX
         BuQhdIvkxpUFpamFYHmWhJr/P3rNzh8C3GTEa9Br8L2NTeKRvzOqcnFRoiTAKsT/94zc
         NkBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761961482; x=1762566282;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qGEyWBftW5DrlPcZTKmzDkZi1ol5FQ6mGvv5tC6kJvQ=;
        b=t64xyKxSWwl5/79hApNxgVTv54sJm16d+bi8MTMCXb/B8rc8f9vAOFXEU9G0+ZRRGs
         PN8FwOW7e7ENriuMI47U4AOncA+siTlWTDd18EZ6RzEopNkEcvdfX8LgGv2qZ5MA8+vG
         XQ2r7oepAHaIs4cQQE/QLzGYbFFMgvpsq9ikuhUWQ1i88oozRSRbFlWkKQkXQBDYHN8D
         6dymxncGnH8Rc+DJEM8rMY3bx98Oi3T9f6YD+rmhdxlNwSxN1VGdNHn6T7VWLrQUUf8g
         IO8zQxdzKg5McEaxfPkdlM9jjreUGeX7K5AnHgXLDZ2I7uTmqHaMN2HRGprVekCWHx4o
         ypsA==
X-Forwarded-Encrypted: i=1; AJvYcCXLqLuc5I7pcyR0KZndcgzLqqHGs9C1Xg85RGDa/R5FgdPwZtkEncibc1OJgeU+yoNxfBkI0AY7kfjZYw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyW2AmuiwtrS+Xs3Ae/ykt9XEg5/IPaQoc06BYv3w0mt6KVy6yT
	p6Xq7FKYNeE2aLaYvuU7ltsOTIPEe4KpdWOkJEq0RMqEqMll2mZuGlXR
X-Gm-Gg: ASbGncsEWxVaAsLBmdLVCdfI0SzZPaGKH1DR9nRWgpKiWQD3zKuvXthyl99FF5dNIy4
	fDarN918lkbPTW0SQHC7kSKbRQxwXMtHNvvj5BD2M4EUTVYP93P3/dOZXfN8iBh24Ou5rbA8rX0
	K/G1jKgaiRTJGeZKDYmluqH5up/8QZOqeQH4SVTWwHrVW3jnB2ip0CCqY9Ateq1H9iPfNajET1C
	Z5bVpFDXijHT7CE+QsVWOhsgTZkG5zza5P6EZcphYsnHnG7PSoDfbSvZWb6D/KEFEL19zdEjfRJ
	oxMvcg+BXNUnyj0x3jzmH58/0xTPl6I0E//xrKFqABsI0R7CXUgVt+ZgxqufL19DvAxdBLecm5e
	wzE9VnNM4E0TD4mGhvYLoVCrU4WoAStB/6O5JV+vDoIsDXeT6FcN1OcFfownOGrnp0NI49g76g0
	hxFKOve9ajRRKJ9EDKcY5CF6vTDbQ=
X-Google-Smtp-Source: AGHT+IGVnAhHQAPVSq5nCa6R8Hw5ech9EsY2fmArvbREf6/D1ElN1DGY94J4rKSbFr6PkzPXCQCBhw==
X-Received: by 2002:a05:6a20:6a08:b0:334:8d0b:6640 with SMTP id adf61e73a8af0-348c9f667d4mr7669733637.8.1761961481971;
        Fri, 31 Oct 2025 18:44:41 -0700 (PDT)
Received: from localhost.localdomain ([2001:19f0:ac00:4eb8:5400:5ff:fe30:7df3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b93bf078924sm3350585a12.32.2025.10.31.18.44.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 18:44:40 -0700 (PDT)
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
	Ze Huang <huangze@whut.edu.cn>
Cc: Longbin Li <looong.bin@gmail.com>,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH v5 1/3] dt-bindings: soc: sophgo: add TOP syscon for CV18XX/SG200X series SoC
Date: Sat,  1 Nov 2025 09:43:21 +0800
Message-ID: <20251101014329.18439-2-looong.bin@gmail.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251101014329.18439-1-looong.bin@gmail.com>
References: <20251101014329.18439-1-looong.bin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_184442_957056_DB514DDD 
X-CRM114-Status: GOOD (  12.31  )
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

The Sophgo CV18XX/SG200X SoC top misc system controller provides register
access to configure related modules. It includes a usb2 phy and a dma
multiplexer.

Co-developed-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
Signed-off-by: Longbin Li <looong.bin@gmail.com>
---
 .../soc/sophgo/sophgo,cv1800b-top-syscon.yaml | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml

diff --git a/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
new file mode 100644
index 000000000000..b2e8e0cb4ea6
--- /dev/null
+++ b/Documentation/devicetree/bindings/soc/sophgo/sophgo,cv1800b-top-syscon.yaml
@@ -0,0 +1,80 @@
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
+  dma-router@154:
+    $ref: /schemas/dma/sophgo,cv1800b-dmamux.yaml#
+    unevaluatedProperties: false
+
+  phy@48:
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
+      phy@48 {
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
+      dma-router@154 {
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
