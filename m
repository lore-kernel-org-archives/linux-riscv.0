Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09F00C4345F
	for <linux-riscv@archiver.kernel.org>; Fri, 26 Apr 2024 03:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=unfjNS3DeHTTr1PrAbuJEz1hK+ExcmVATvZx4u1WkmI=; b=E1dY8iRq/DLABc
	CXg0Pj1HhjeZdemRJxEoPjaOoXB93JJJuXtvxq/BIalrHi8EvIgKdm7jaCjWc7FrVdlT43qy82Xsb
	4Jn4njNu0v9UXThxbJStM3llECJagJnfSWjK/OMaMGmxs99c4iZGk5KYr2B70lUh0fqDkwXoEDir1
	CM0D5pDKLtWvhtUNG4oBYV5RCvk/VqhKKNBQ/ubZIwcrPINkeiXOx0gnqcAynBJo1OWOeriSpmBs4
	VCgexA57laeZbQcg+0htDXWQldlxUujY8J1NlpqT3QjMa92j+lDc2MKK+ln+M3MFX50qQwG4t2fA+
	Fpc3Z9VksXI005Phzk8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0CKv-0000000AyZ0-3lPE;
	Fri, 26 Apr 2024 03:33:21 +0000
Received: from mail-oa1-x2d.google.com ([2001:4860:4864:20::2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0CKs-0000000AyYM-46VF
	for linux-riscv@lists.infradead.org;
	Fri, 26 Apr 2024 03:33:20 +0000
Received: by mail-oa1-x2d.google.com with SMTP id 586e51a60fabf-23935d89261so869872fac.1
        for <linux-riscv@lists.infradead.org>; Thu, 25 Apr 2024 20:33:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714102397; x=1714707197; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PN8Ys2aOQntChQ4GtaoxJ/3s2pQju6kNm6fRZuDzLwA=;
        b=eqcFZi14koRWADghGnEzghmax+5gjZmA2cJUnr9CmpxMr1RuHfxMMCvPgZLDDpBUuq
         L6Ym9wM5hb0qvu0zdu+HQcNc185J8xsHCIBM40OVQM75ybZbsVU1UA+wlbgRixrqx1zy
         IIkXlJAr5F77wbOeappP6ChZpilJ6MxHRw8MXi3V3Okbc6giY5y47e9t7mpLWOJ0lTbX
         vBaUUu5whI0Tu4pKFW4uAhLSqY1Iicc1F/9L0V1spyJUpTlgmqsJmmXO8jEMt6CqxPaX
         Cc6oVdIF/67q0fm/NaEinmxRFF9hFONYWampHa1ZbQjuAnIF7jU3mGKL3SPR3WVNP0jd
         HA4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714102397; x=1714707197;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PN8Ys2aOQntChQ4GtaoxJ/3s2pQju6kNm6fRZuDzLwA=;
        b=nOZIOdi6v+bs7y1kExLFrKK+TARvKMnNb44Ns3qntJ4s+JMGtl4IUGMX6YoplwH1qd
         wDMO1xEtwdkQxGHQczfyoG2jF/qXPOj2+RJYVhZhWbbc5DNCQkzVBgzrFPsDuO3kJ/c0
         Ui61t28Kt50SlOWBdAlbRQcjMbBQW7Sqg4XYS3oDz0qbUziHkyJvtHwZZLM51EeAbEBC
         YfyFYHRLBkl6P0tRrCc2KPwCuPVVIvAlQoSQCmLoO9zFFax5Q8UcTZHDDrJSowls/Sf9
         jYOYHNW/e3vAYi6aalvHxBV7dGfp9OAopQe8o7dQNEimQa194r+D2BWw54mGBwK/KV9e
         SLfg==
X-Forwarded-Encrypted: i=1; AJvYcCUmLfWzLjdRCCug8cnJ+1VHykkH14SC/uHf5BfzYy1wVd39r5b2scVOiEXKAvKzmYDb30mOsBj5O6kA2DdLr6AdmsoIt1Fo6T3q8ehr2ewP
X-Gm-Message-State: AOJu0YygYffTWGhOpyRdfWTvtUJrno1g+NfU4u8L6B8QL+AhhLkIom4O
	9Gv7FY2sY8mdVDCFpyRL1HDjN2OcLoDxxH0hPvI/L9beRSPOBoVy
X-Google-Smtp-Source: AGHT+IGBhit2AMdMRrXI/PnnkD3xX1lE60E5/6w+cjz/3uPdBCQBPalq6Nvk2aFERnyXDO1SztWVog==
X-Received: by 2002:a05:6870:ec88:b0:233:2541:d7b6 with SMTP id eo8-20020a056870ec8800b002332541d7b6mr1547598oab.45.1714102397458;
        Thu, 25 Apr 2024 20:33:17 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id sl3-20020a056871808300b002399c0f9d5bsm2584161oab.26.2024.04.25.20.33.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 20:33:17 -0700 (PDT)
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
Subject: [PATCH v15 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Fri, 26 Apr 2024 11:33:10 +0800
Message-Id: <6916e570d25a18be28ff47a0c038e8272de89542.1714101547.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1714101547.git.unicorn_wang@outlook.com>
References: <cover.1714101547.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_203319_049864_7BEDAE81 
X-CRM114-Status: GOOD (  13.40  )
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
