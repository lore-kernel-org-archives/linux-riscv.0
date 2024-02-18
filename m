Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0595BC48BC3
	for <linux-riscv@archiver.kernel.org>; Sun, 18 Feb 2024 02:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=1fpTfyzVh//DnbiD+NL9Yxfn/krQ/OYU0+QLHBlwSHo=; b=5A4RCa/njNcf34
	Y1KxjjXre3nYKQXMuRqKnaiBIJOxk1aKhHpwAV3ydslKvqRLw3hfN86rQLVnvJ8RLdDiBTHQ9CSR8
	tUKnAjAPyIg44SDlEiNYABe0L8LGtilasTvR3q2yg0Y8EJ6u98Q005Lz/DPIVXCEF+d28fHn0XXGl
	zTaMEAo3JVXeHhC82mvCIdXshVL+P9JVGAkpH9Jbkpl04hYxeipHCujWXZhCyn/1pRCnd+hs681UD
	IdNGMn670Gk2QJBhOkf2GnOId+FbBWFM0numhgsnlguD2S1eTOwLLLXCmoxUUAUr8I+8/2MN0JX5n
	PGtCGVNAjunoBfqRkV2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXGm-00000006qdS-1gR5;
	Sun, 18 Feb 2024 02:51:08 +0000
Received: from mail-oo1-xc2d.google.com ([2607:f8b0:4864:20::c2d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rbXGj-00000006qcx-3u3M
	for linux-riscv@lists.infradead.org;
	Sun, 18 Feb 2024 02:51:07 +0000
Received: by mail-oo1-xc2d.google.com with SMTP id 006d021491bc7-59502aa878aso1527868eaf.1
        for <linux-riscv@lists.infradead.org>; Sat, 17 Feb 2024 18:51:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708224664; x=1708829464; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OJhvWCiuAiLMQCwCkgsdnNryPVW/71LDFA8iR1YzrEM=;
        b=g/Y37oN/cmw4AQU2uMHJOThvRJkl8+PcOF4RxGszYsHPsp19RwcyQoVulGlg3+Kdk5
         JaP3jcfLCdfY0rl/XwT+Ww/97620tQtgsmWyYgcSiA881kp5T75putjDB1JlE9bReW3q
         lxNLC45Qf1hJ9NP4tr5SbZDvsnZJVtTzEKNW6a12CFQ03iV/p07PsXHBlBY3/8pvc14g
         EDsignG3tlrJMIaKLkYozHXmr5ahLcJsgTl1XV/JnFr7tD4lcSrFQqYjttE70nEol9Os
         kK4OgXv5zsybf8NHra2aos+7Pt73vyLMpVJYuoQoc0kdV78PfsGdcooEM4bDDP+ADxdP
         +PZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708224664; x=1708829464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OJhvWCiuAiLMQCwCkgsdnNryPVW/71LDFA8iR1YzrEM=;
        b=aL4r3vJycTqLiTGsxk2ojLkZ6WShHakB3XkSQhPgbivHbsLwGesdobMCCTjXT8b7Ev
         Wh9jkV2xJs1AzR5K6D+Qz9/39HbbqiPgUE2HN2qRF4O0oRFUcnMo1WXeQkFDkZj4tDrM
         i6ylgkKFhfSD1C2aisEh8QH0E5JXUji4zAWD7DqBeV+gci12QuSO3dwilIHouN6hG1AJ
         FRHXNHPYVuMLzIQz28qSArTU0fY6cNuTER1yKLymBpWmbY1plRavnYD8TpOa9y0jEGHq
         mPWiNasFAUP7K0rK5qQE3hdVcQN5zPxTVQTSOCe9WIFK3oHzbceKwc+mU5zAP6wOaerb
         Sqcw==
X-Forwarded-Encrypted: i=1; AJvYcCUGcfnOFMPbV/wqz8YA8tt5B2oozNcn9cmNj7dOV3y9LkFS3DUtSfHKsV3xnoHl7r1kQKrpqhT1Anx+b6lKNLGfD9M+cqGhD7WYELmJto7H
X-Gm-Message-State: AOJu0Ywa61gn6k5vRbk/pMMFugBuGGu3WriKM/QPRpsrOmbr6lbD/vbG
	vua+jyLrU6xjov3fc439+Cm5Yab8IAxQUwDDoSzr79TcIEAbEVOC
X-Google-Smtp-Source: AGHT+IEiYNzDXEQXqHIf5Bob3BZZiHADsLv+HRhoLak/eB89MmVLfHVQYczKxLEVNI0n4ewD2zaOUA==
X-Received: by 2002:a4a:241d:0:b0:59f:91de:26c8 with SMTP id m29-20020a4a241d000000b0059f91de26c8mr7420030oof.5.1708224664382;
        Sat, 17 Feb 2024 18:51:04 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id br21-20020a0568201a5500b0059fae4c8100sm510680oob.0.2024.02.17.18.51.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 Feb 2024 18:51:04 -0800 (PST)
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
Subject: [PATCH v10 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Sun, 18 Feb 2024 10:50:56 +0800
Message-Id: <aaad6e257a44e312cfbeb5a8ce84b8975cdc461e.1708223519.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1708223519.git.unicorn_wang@outlook.com>
References: <cover.1708223519.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240217_185105_997284_A812C19C 
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
