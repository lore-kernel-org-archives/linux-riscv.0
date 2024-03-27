Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C324DC54E67
	for <linux-riscv@archiver.kernel.org>; Wed, 27 Mar 2024 08:30:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NYFaIoQNPGu7z4J7GI1lDxBjyNpW2UzMeNNOnPiTh8=; b=xPXoWle41rm0nh
	hphlOfctmeFkeemW+f5IGEfjhgVQdTMyyghV5/eabbrSNW68Pi9qnQL8ZYKF+JETEMSLuJ7SaMMUD
	Yw+YmY56kTYGY4+LPJk1Xut75HOmPUNayNOsjeq1yszvIe4A+G4i4yWQdh6tLftb2Q+NAwwMBhOU4
	nUekHQjye88OOEWXl7RXqCzr3IIpJHHo4ne5wcSz0RT/vNrnlKtZFOizL+AYV/IHq9f3ORiZTN/VX
	qbe0hacXFllmZ+x0UyIbz5zapdS9Uvxes1B0Rt3M/6WkjqcpRUGxcI556wQfF5ehtcTd3GBOhlZcc
	5LGechNVf+UNyAfHcS9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOfd-000000083B2-15BO;
	Wed, 27 Mar 2024 08:30:05 +0000
Received: from mail-oo1-xc34.google.com ([2607:f8b0:4864:20::c34])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpOfX-00000008361-0GoW
	for linux-riscv@lists.infradead.org;
	Wed, 27 Mar 2024 08:30:02 +0000
Received: by mail-oo1-xc34.google.com with SMTP id 006d021491bc7-5a467dae51dso2082482eaf.1
        for <linux-riscv@lists.infradead.org>; Wed, 27 Mar 2024 01:29:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711528194; x=1712132994; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=F17EQjC3KIqEq3rryf+JaI7a9H/CkS+B33Xntubf7nGjM399Twz0zLh/VsKTH8Qj6g
         5F23696K4AXBkMfjicuWzZSQ4kzzx7ZikOdJDOyjiVVhIcVf1qrBE68RfsFA2QoEG6As
         jM6eWSUktqepwgZLQYLMzLP7LGVjSmdjAhpm5g///0SE1m9lBQ/dbX1kQOgexmIppiE9
         7IOGpYRuK9qRf0IggPHkodpZDd1gmYVsORN7zCP097VAV6KLYVXF4D2JmbMBCEwIp7XC
         QE2dqA+zo9qGU3Q9bd5gOrJ28R2ijHQQ5Pit2YQwCXDemLFQGtKmSmTmjGBrbU6cadvK
         kpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711528194; x=1712132994;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=bMZx9GankZA0dcuJx8lprkmiW32Nqbu58txm6wnOkqS34lImLx6hSIMsuKhRi1W2kL
         Hdgr5QoDFYvNqEn7IxOhe0sXYuYcXMy6a6qk4p/G8EO+HVY7TYC0hrFuuRoAYI6Zu/PD
         E1ZDuccA5Ybkmb2I/9APRapI/gD2F9V+cFa3FPG8Q9Mo2bIaxZFUfoi6lvn/GyOV+h3n
         h9n1k4KcDQx0ALqItd8KgaFU4vXfOrCIGbok7YWbo4ZAArEjA21zmAIC9iU4Ux9Iuafz
         38MTF24JgeCKcfvPtSqybamg8u4EEJ98E9cVvhKYOI5XQDA6dseC/EpuOc/uytZBq63l
         YcBg==
X-Forwarded-Encrypted: i=1; AJvYcCUGfgYXMJ+ZgD9oEwWHmsx05rDl/oQfLmwBHA4mg/L2A3iXA/IxwioDkO95v0InbvcAT/5VuZhPmIN4HsA5bvZWdfAkfTvwfeMzOywPqX7l
X-Gm-Message-State: AOJu0Yzk3tCGFR0gaJ8KW9YZjAm4rIBuvvwUppznmteqHiNhbbu923qq
	qlA2QW/+G4kzn4J6vToibbShtAB6idhFkCz2/R8M9dy+nlMhQDxm
X-Google-Smtp-Source: AGHT+IEIETJYfm1LeEXZ17gb9zA1z0lN3OnPZ/F9w3Ecsm23rOzisdPobwpL692i6eZcBTxilITALA==
X-Received: by 2002:a05:6820:1a07:b0:5a4:71b3:d090 with SMTP id bq7-20020a0568201a0700b005a471b3d090mr483779oob.5.1711528194636;
        Wed, 27 Mar 2024 01:29:54 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id bp12-20020a056820198c00b005a1bc9b380esm2229466oob.24.2024.03.27.01.29.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 01:29:54 -0700 (PDT)
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
Subject: [PATCH v12 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Wed, 27 Mar 2024 16:29:47 +0800
Message-Id: <ea7c845ef81a933a4f927f76b69dc6f7a71942c0.1711527932.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711527932.git.unicorn_wang@outlook.com>
References: <cover.1711527932.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240327_012959_977564_3E1BEE96 
X-CRM114-Status: GOOD (  13.15  )
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
