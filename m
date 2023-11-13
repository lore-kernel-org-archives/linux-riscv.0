Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 166F2C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Nov 2023 13:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Df0SKGJ5pwia6WHLclcnQoNSGBqX8tUxwfc++lES2vc=; b=WjmzzwMgEU3Ede
	Yl9Saf3LLhzBisd6JMceUn1NFhOwg7/JItsItB5Aoa8wa8s/OEjpurvWtyJhR9fZTGTwyuj6pnFEP
	mu43YfyVX4iF28q530HgPxuTSqVqvMxID6FGFnN7dnvBmlKiAePvs8bQ9tgB0vLFkBUDFK8PULU2d
	sHM6BD+LDPkkYR4BxG3AQZxBPMe7MMifnS18LOHnKCFIsCT3qd/uKDY5jlWh8M4A9U3Hg4p+mY26B
	FABB2yyhdxiCA6XzBKxJiMx2sN8yoaBHNoL6D8M0Q4RLl5o1YP+VDtWS8B12+2/75Lq2bkyqZQLd9
	LoEt9W+wM51kFQjlma3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wqu-00E2Y8-2M;
	Mon, 13 Nov 2023 13:19:44 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r2Wqs-00E2XA-1P
	for linux-riscv@lists.infradead.org;
	Mon, 13 Nov 2023 13:19:43 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-1ea48ef2cbfso2904478fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 13 Nov 2023 05:19:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699881580; x=1700486380; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LZcJHL1uyIZmEMFpfa9bF4kSIpnfRgaXoeVhjEt/aAo=;
        b=LUgnHo090bIj3R/KsP/Javn57iZ8GKkq9RV2Kd3M+PXTBJoXXnRHpoXz2HNzHqcEv1
         EsLhkUh94Ew3rt5pOLPZP18lNm53E0u9ynd+D25V/Mmd9tfAAJq+Xv3erGaxz/AFiHJJ
         K+wcfa6bEpszKIjYbQUsnB+KR/LqIihoMBa97tgqWr8CXAQW4ej8YUahRo7dHf8lXsAY
         ElC+PFxLtI8/OA7i9IN16/HijagaC2wsDcwzc3yZDN/Oo2XvSX0jCMrVRzY4a+dsHgJ1
         whGI48l3SLSiZRnRI+jBgVrX6p0NNpk9nNW3neI4fgLzhiFWyxRfWV80mEJtzFQ8l+rk
         8xZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699881580; x=1700486380;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LZcJHL1uyIZmEMFpfa9bF4kSIpnfRgaXoeVhjEt/aAo=;
        b=BN1+5ld7JCMIh41TzPyZUQqmGGzbbobIxWpKgY7m9MiStVUu2QtYpgqFfu54Xv7y/q
         TuTFn2hGgGtDWcnZq88O9SSGfw+06Aq7YUSWGxC/8XtL5t50CRPIeGj9efMpr7Au3LZK
         EpvW3fygEg0bg6wDPRbI42fcAqtLT6vudP9/6OcSZ1BJT0AIjccG/NET1b2KqALhjNRu
         YOH0SJ0L5xdS7HXwJUdp37nxkQhEkl4pD0zAjS031a3x3YMzdbbJWlO84qY6RwzkgJEU
         uWxsajHuWRLcZXyIrESQ0eaNMOYeITyE1fzn7oEC+PU1ehBlpShEwexACP3sz5caVz1/
         dccw==
X-Gm-Message-State: AOJu0YwEAndcn6zKPDXY+kBV6zXihs7xS8TdFk4NEQHXEKfnsA3tS8zO
	GxqApItb7bVL5bEoxPs1cdU=
X-Google-Smtp-Source: AGHT+IFJFjOdYJAttPy6vP0qnKr2YMChB+ivUxeTNAVbV9hmhX5ZXpCziZydh1yIrQkprZApewnJfw==
X-Received: by 2002:a05:6870:7d8c:b0:1ea:7bd1:c491 with SMTP id oq12-20020a0568707d8c00b001ea7bd1c491mr9129141oab.41.1699881579945;
        Mon, 13 Nov 2023 05:19:39 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id zf30-20020a0568716a9e00b001f224cbbde1sm1015375oab.41.2023.11.13.05.19.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Nov 2023 05:19:39 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH 3/5] dt-bindings: clock: sophgo: Add SG2042 bindings
Date: Mon, 13 Nov 2023 21:19:31 +0800
Message-Id: <1e5836360485b63e15bdf58da59e83139666b290.1699879741.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1699879741.git.unicorn_wang@outlook.com>
References: <cover.1699879741.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231113_051942_469410_08952356 
X-CRM114-Status: GOOD (  12.45  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add bindings for the clock generator on the SG2042 RISC-V SoC.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../clock/sophgo/sophgo,sg2042-clkgen.yaml    | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml

diff --git a/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
new file mode 100644
index 000000000000..e372d5dca5b9
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo/sophgo,sg2042-clkgen.yaml
@@ -0,0 +1,48 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo/sophgo,sg2042-clkgen.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 Clock Generator
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-clkgen
+
+  system-ctrl:
+    $ref: /schemas/types.yaml#/definitions/phandle-array
+    items:
+      - items:
+          - description: phandle to System Register Controller syscon node.
+    description:
+      The phandle to System Register Controller syscon node.
+
+  clocks:
+    items:
+      - description: Clock Generation IC (25 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo-sg2042-clk.h> for valid indices.
+
+required:
+  - compatible
+  - system-ctrl
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller {
+            compatible = "sophgo,sg2042-clkgen";
+            clocks = <&cgi>;
+            system-ctrl = <&sys_ctrl>;
+            #clock-cells = <1>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
