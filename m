Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB68AC4345F
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Apr 2024 07:22:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NYFaIoQNPGu7z4J7GI1lDxBjyNpW2UzMeNNOnPiTh8=; b=MIPTIaXoV53VR1
	eneU+ebeF3fsj/uxmi7BaKhDNP+s3mhwk9fFf5c7lzCRitN1PgO5j/CWuoOzpGx9qMitU75ctcB6C
	FP8QrZIi+MrvYohKrCUzAW2UmKuhwnvNsx3FaZMwg+IxMgvNBR68O7iKxizV7aM9ZPzDeeOmiJQ88
	oTjgOL0toCS8UWW89Z+eTsDGUcfKjgFV+j9CU5zXD6OTckJC/1pNYM3+acK1eM0eI079QzaE7csjX
	moaR4786scQIj6xXHGDOKq0LDg/XiZ1JYgXXsZLWGgtfRQmDERRel5iuZx1TKb8KOnU39Uwrad6dU
	kBld4MGMCxXvevG1ViyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGfj-00000007K2O-23f3;
	Mon, 15 Apr 2024 07:22:35 +0000
Received: from mail-oo1-xc2e.google.com ([2607:f8b0:4864:20::c2e])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rwGff-00000007Jzi-2de0
	for linux-riscv@lists.infradead.org;
	Mon, 15 Apr 2024 07:22:34 +0000
Received: by mail-oo1-xc2e.google.com with SMTP id 006d021491bc7-5aa3f0fcd46so1823130eaf.1
        for <linux-riscv@lists.infradead.org>; Mon, 15 Apr 2024 00:22:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713165749; x=1713770549; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=f8tMS/8TFFeI37wFRFc1ysB/QFM4OR3mB+/cEyZWEGv2sbRfoh2uKSqeeJQw3BVVMm
         TO9ByXEwPt6H1i43S2bzhESSZp8Me7yZnLuNWYcoO6yoJq4MwXQT2NqhBGWJpSXdp3Pu
         xiLME01RjRWl+kdjmlqMmj+KmS4eIwJAwCosRtqPM3czWMi8NShhmiJMfIjKv/f07rsd
         ljCuvDCGEJ0SpeH2rtA4riGyXPVBRzulLocUJPD8sUwt2oZWD5d7GFwnC+BdN+1QU1gj
         2ZMJsyGYBSZCfAPeoauM4Bgf+TRzOhIaY3OufZDL/f3KYypHE5w3QO0OzeGprfhX7voc
         t7Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713165749; x=1713770549;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=R/GP+JhainxDYKgXQzf0s3kG0iLEcaSIE8GL0dG8g7u7cjaHVDMJ2XXhiXM8dfPTSj
         l6Rfh4b4FAsknsoFrDSAZBCDuE5r4Rw+4WWIE6TfdvHyeZo7yDqS18QkeYMa8wr4jwYH
         9QaXXT1o8JML0BCqCBlUE4lhN0mVO6BN0bLgqvz8qMB6+z/ZvgGUc/vo262wIYEI2ygU
         CJ9+nRGAd9cf2wFEEN2MGjogi0r2LhDVBHl4hIfF1cRP+t9PYxP8lt/0tCbFoNGwiB/e
         wv/iIbbJiyk2uKuxEZnlHvcxgLM6MbVXCESQknSEFHwICbqzyyZXGH9wWVgBY4asV7F9
         9iuw==
X-Forwarded-Encrypted: i=1; AJvYcCXCM2ZSEXgvMJVixox4UpyAB1nBUy5Wo3U8ZZWE+9EdJU5fhms1UxBvMY8EsJJqWYU+WayjPcvAQsGyuyltRI9HzzACLLTC0VOHCRauci2c
X-Gm-Message-State: AOJu0YyotiWLLa83E/+p7TvPXm1oVnaFsNw4sfSx7t7b4gesmUODxlvJ
	cGpyAbsOvfQ50ReimH7uxKFuX+XRvlTctY/MDqrIYorYeAzjEbSq
X-Google-Smtp-Source: AGHT+IHvpL041wks7+mOr6ziePq05Pg/yOBK9Eo6y8ri2QCWzxBiiD99Wbd6D62vwHtEEj7hjryxSQ==
X-Received: by 2002:a4a:8c0c:0:b0:5ac:bdbf:8a31 with SMTP id u12-20020a4a8c0c000000b005acbdbf8a31mr115405ooj.8.1713165749474;
        Mon, 15 Apr 2024 00:22:29 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id bw16-20020a056820021000b005a588e72c3bsm1967615oob.9.2024.04.15.00.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Apr 2024 00:22:27 -0700 (PDT)
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
Subject: [PATCH v14 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Mon, 15 Apr 2024 15:22:18 +0800
Message-Id: <cb4ccaad1d3637a6ebb0413dbe45bb0fd12ed401.1713164546.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1713164546.git.unicorn_wang@outlook.com>
References: <cover.1713164546.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240415_002231_700834_BE08EB49 
X-CRM114-Status: GOOD (  13.37  )
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
