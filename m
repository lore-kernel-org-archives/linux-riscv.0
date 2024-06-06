Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73333C25B75
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Jun 2024 08:36:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unfjNS3DeHTTr1PrAbuJEz1hK+ExcmVATvZx4u1WkmI=; b=jm2rBmL1MdypR1
	e93HPu/9Biqn1kuvGqnKo38x0UGv5Ct+1ws2l8HIHFjdgfCWX7KL91wVNu24XhlBPfS4gqzYcnWkR
	ilNH67rc8czriKUcCwLZD47fvzhqphr8wHYGDRMGtZj1yAkIjXHDc/YCnyS1f22T7bTtVvjUSRaK1
	ToFDUly1AGDQ5b2pmCr2eUklN033MflmiuzByo7NuLr+uHgkqNxgo3RpkEU4DcmpvODLQQah5qXKT
	TtYAo6AJOI2vmUMKvGAYOtL7vqCPuonLAMIadbTytSn70PRY+9Iwfw7C6nLBMZvy58KsOEmSAFRdi
	JOrWatQpFB+Xc5BPupVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8bu-00000008rSU-2f9T;
	Thu, 06 Jun 2024 08:36:38 +0000
Received: from mail-oi1-x22a.google.com ([2607:f8b0:4864:20::22a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sF8br-00000008rRL-2lFY
	for linux-riscv@lists.infradead.org;
	Thu, 06 Jun 2024 08:36:37 +0000
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3c9cc66c649so326045b6e.1
        for <linux-riscv@lists.infradead.org>; Thu, 06 Jun 2024 01:36:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1717662994; x=1718267794; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN8Ys2aOQntChQ4GtaoxJ/3s2pQju6kNm6fRZuDzLwA=;
        b=cc2Fvss30QtZc96iQip4msYMuToiu6aR1jcHXaz+4zj3sbr2oZcAT4aIyXznaG9BMq
         cFU140I53yzevN/D+egOXBPA1a5ufowgY64h5ZOyKMa2xUwRIKtp6r6nvupgWvvJO9Lw
         BtZWSFEz7dN0RXV33DraPeXy2QIPsgm4aFEaigIYv3aIJo/eIR+oWFryNnhEyj4tTUnS
         WPhrbLe4ZLAV3Tinf16k2xb4lcVujyemhr1l1ovQ9Av2drZx6iukerhNu7mR/kEgCW+Q
         pJ7L94SSXUSS9P/oq4jF5Yo29Fe9rmZZv0fGZd6oml/STmgLxbVmfMZTkJdaSYD78w5j
         M5gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717662994; x=1718267794;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN8Ys2aOQntChQ4GtaoxJ/3s2pQju6kNm6fRZuDzLwA=;
        b=u4/sLAj/bd619i6CoHN3Mhmfx5P9UyQsPspKogF5NzvQR1xOxr7dvzwPYhL/ksYmCl
         OMwlLtPSlvU3SBflyKUQ8HpZ9tcvBIDAL+CjsnGU8sErXY1nJIf1iv24fs3JQGUlffWD
         xanXP+R3/ly0JOm8lIB7cCs0jU17m5CjAeStTpOi6OG10R90j9795EUUP+H3jUbDta/r
         qXoRk/iFF0L5Ye1Q2mRLwGIblKvVpNcgv35zE+ZryITExJ8AsYAAwM/jhDXjZjaFYY8x
         EDeSf27xL1IGExZQndCrxcREIIM43+MV6EoanpSDe9na0J3rTPgwlODLSlAoJWMt5C4+
         oa9w==
X-Forwarded-Encrypted: i=1; AJvYcCULb6Tn+w5AfQPrtdF0aUHIOA3J4TYPeVlNfeKF+2cGul56dYBvJGJBCMY0MMRIda85lonFqTyZJxvs5Ic/dvuXVKtBpcGj9PXlwLk84eUN
X-Gm-Message-State: AOJu0YylttyroIvlL2FfpsDXUWwnyZiz1Egynn+tdi+GGW1HOB5yrDO4
	qGY6norf3eOxQVL01I0oe6Jr6vvL7aOtj8V5+kI1WuwMOU0qLKhV
X-Google-Smtp-Source: AGHT+IEaazn1S9xkUFvVPViARh9f1/5t9GAN6zXJn8QWYaTd+YShk3b8NZdU/b53z9QJI/KR+p61mA==
X-Received: by 2002:a05:6808:484:b0:3d1:fdf5:a88e with SMTP id 5614622812f47-3d20429bfb1mr4902099b6e.21.1717662994256;
        Thu, 06 Jun 2024 01:36:34 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3d20b69f240sm176572b6e.31.2024.06.06.01.36.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 01:36:33 -0700 (PDT)
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
Subject: [PATCH v16 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Thu,  6 Jun 2024 16:36:25 +0800
Message-Id: <a8da4870e3a966df01e1ac78d76005e42dd45ef2.1717661798.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1717661798.git.unicorn_wang@outlook.com>
References: <cover.1717661798.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240606_013635_729652_ADCC0E9C 
X-CRM114-Status: GOOD (  13.62  )
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
 .../bindings/clock/sophgo,sg2042-pll.yaml     | 53 +++++++++++++++++++
 include/dt-bindings/clock/sophgo,sg2042-pll.h | 14 +++++
 2 files changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
 create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h

diff --git a/Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml b/Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
new file mode 100644
index 000000000000..1a417a627dd2
--- /dev/null
+++ b/Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
@@ -0,0 +1,53 @@
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
+  clock-names:
+    items:
+      - const: cgi_main
+      - const: cgi_dpll0
+      - const: cgi_dpll1
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
+  - clock-names
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
+      clock-names = "cgi_main", "cgi_dpll0", "cgi_dpll1";
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
