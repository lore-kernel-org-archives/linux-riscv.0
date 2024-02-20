Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C289C48BC3
	for <linux-riscv@archiver.kernel.org>; Tue, 20 Feb 2024 03:08:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NYFaIoQNPGu7z4J7GI1lDxBjyNpW2UzMeNNOnPiTh8=; b=3GmCPMPEuzrhp9
	kKQXmqiKmIFvISwUbdwygNXcUM4tudavrwQbeG9pef7XBEQRwARu6EK1dClTCIDsQDLpFFHYMioKK
	ehnSBPzsno6RNES/OyLjho0SE3ivprqsQuG/VDyBs0bdyU9EeBq8p0gKyYuYPK6fGYMHDskvjZmfm
	kKvuDdvp655VUOwGOjeuEU8TrmEqeC+Ulrgs5haG+iaO4mg8ngKaq5kPl0KwPfxbl77ENDnKOzAZM
	CVnKpGgdE+XQAvYaf3DuH+m0coqc6em3wi+QypqM0/Jsg+W/ooEYXPue5rcoiguWX9rgTdR1cYsdk
	ItByGTUl1Dxn4m1wQFsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGV0-0000000CwPy-2Z7M;
	Tue, 20 Feb 2024 03:08:50 +0000
Received: from mail-ot1-x32b.google.com ([2607:f8b0:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rcGUx-0000000CwPA-3BMv
	for linux-riscv@lists.infradead.org;
	Tue, 20 Feb 2024 03:08:49 +0000
Received: by mail-ot1-x32b.google.com with SMTP id 46e09a7af769-6e2f12059f4so2521192a34.0
        for <linux-riscv@lists.infradead.org>; Mon, 19 Feb 2024 19:08:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708398526; x=1709003326; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=DyaknjbMVRsbxHHldYPCkR7MyGkBtvyGBXYnr4h2EMXzzc8w58MLXxK/cahTVUcv2/
         pMelmemhFegm2JrTw/oXXPgnzU1UZ4vamPxGOpBac4RO8t1dR/Dunu6gymzCM4ggjo2j
         314Fm9Q/hBP5R1UpYNyoFBsX0ITNoXEMhMDo4v63cCw75VrnlADSIWjwRFoiXEEBNAoB
         PFS1r9n51wZqVKKMB34fwB+lW9r8GVVcNXZu30mn8/aDO8ZMK8x87uI26gfW6V3yCmRY
         L+Huq01D8bpoOzumBU5LPIQBeiVhEXQeNgtect/pPmYuiFnzls3aFd0F+wydxhzCpJjN
         CTHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708398526; x=1709003326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=dF6wzq+B3z4yNibJNGQlh/YS+x4T/NO9tT9j2tcXA6wfVlgwDeL+LrD3awAUpZ3OFH
         R8D/vD82zL8pxQ9e1Fn0tNe8vG9o5yE8esYJzukTlmK9JyyTxYY2VQ3ZP6nTpP2B/HfU
         AfB1qJ7IlZmCyl3wlz8JtkikmY56Xj+Nou4hOp+yf0FxXdQpP6VB32DUjaKkm2yojQBL
         VzMy+Gs4TF1ECyuALrUYm4aCVJb0VztmhAt8v1ym1+oEgM44VcWEp3ALiwteb0WP/4j1
         +S/fcsL+V1pqJDXbPJeqyqtbXYOcutRX9rWO8o9DFgGm1IGmt1AD/+dCcj1tmFTvSWoh
         WivQ==
X-Forwarded-Encrypted: i=1; AJvYcCWXxC9WUWl1/CKF36w3ikOcwR6Fi8dWkuwV+/YfVLXpRMlDaxhTe7hV7MKmWUS1bFCI4N7dsYkX4v9JhZUQubiX+bspPa0H6RH22UGsUqBR
X-Gm-Message-State: AOJu0YxwCAXrIxwHXB1A2A0DDf82DTEEqz7wZrnYnOlhWoTKdxavN04i
	95zKFtuEE1ANl+zFfU/rOKAeU7BQslfyBXJs6cxshH4frnMSMQvC
X-Google-Smtp-Source: AGHT+IHZPHDxduRznjnFT9HJ9VF/En0gTBhG8lGkybmmExK+w12IUjEuvgusnbsbKQfOQT1nK12MVQ==
X-Received: by 2002:a9d:66c9:0:b0:6e2:f24d:697c with SMTP id t9-20020a9d66c9000000b006e2f24d697cmr16288749otm.11.1708398526492;
        Mon, 19 Feb 2024 19:08:46 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id dq20-20020a0568300ed400b006e2e8cb4da6sm1160483otb.16.2024.02.19.19.08.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Feb 2024 19:08:46 -0800 (PST)
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
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>,
	Rob Herring <robh@kernel.org>
Subject: [PATCH v11 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Tue, 20 Feb 2024 11:08:39 +0800
Message-Id: <92448a1ca9ad8f713dbdbf3453f1a5db0ca47d9b.1708397315.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708397315.git.unicorn_wang@outlook.com>
References: <cover.1708397315.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240219_190847_826110_95920783 
X-CRM114-Status: GOOD (  13.45  )
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

Add bindings for the pll clocks for Sophgo SG2042.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Reviewed-by: Rob Herring <robh@kernel.org>
Reviewed-by: Guo Ren <guoren@kernel.org>
---
 .../bindings/clock/sophgo,sg2042-pll.yaml     | 45 +++++++++++++++++++
 include/dt-bindings/clock/sophgo,sg2042-pll.h | 14 ++++++
 2 files changed, 59 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
new file mode 100644
index 000000000000..b9af733e8a73
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/clock/sophgo,sg2042-pll.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo SG2042 PLL Clock Generator
+
+maintainers:
+  - Chen Wang <unicorn_wang@outlook.com>
+
+properties:
+  compatible:
+    const: sophgo,sg2042-pll
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: Oscillator(Clock Generation IC) for Main/Fixed PLL (25 MHz)
+      - description: Oscillator(Clock Generation IC) for DDR PLL 0 (25 MHz)
+      - description: Oscillator(Clock Generation IC) for DDR PLL 1 (25 MHz)
+
+  '#clock-cells':
+    const: 1
+    description:
+      See <dt-bindings/clock/sophgo,sg2042-pll.h> for valid indices.
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#clock-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    clock-controller@10000000 {
+      compatible = "sophgo,sg2042-pll";
+      reg = <0x10000000 0x10000>;
+      clocks = <&cgi_main>, <&cgi_dpll0>, <&cgi_dpll1>;
+      #clock-cells = <1>;
+    };
diff --git a/include/dt-bindings/clock/sophgo,sg2042-pll.h b/include/dt-bindings/clock/sophgo,sg2042-pll.h
new file mode 100644
index 000000000000..2d519b3bf51c
--- /dev/null
+++ b/include/dt-bindings/clock/sophgo,sg2042-pll.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause */
+/*
+ * Copyright (C) 2023 Sophgo Technology Inc. All rights reserved.
+ */
+
+#ifndef __DT_BINDINGS_SOPHGO_SG2042_PLL_H__
+#define __DT_BINDINGS_SOPHGO_SG2042_PLL_H__
+
+#define MPLL_CLK			0
+#define FPLL_CLK			1
+#define DPLL0_CLK			2
+#define DPLL1_CLK			3
+
+#endif /* __DT_BINDINGS_SOPHGO_SG2042_PLL_H__ */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
