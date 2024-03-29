Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29E3AC6FD1F
	for <linux-riscv@archiver.kernel.org>; Fri, 29 Mar 2024 06:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8NYFaIoQNPGu7z4J7GI1lDxBjyNpW2UzMeNNOnPiTh8=; b=urze2DbRnAQFZT
	i+B7iPmue+xydKJqQhQYbjpF96V5edFL9XaDXyZTzL9LJg82L7+UbMwPqKCO0LXIoTo22gS/+Li91
	YupejeDDDzeYA9b3XPq58l/ku7UcpbhUUsxJCT0xHaoNOfH2u4u2OqVFLnVd4e1F4xRtZXZdn34D8
	LXsoCv6CDxCWg8w1E4rjv36JBwb7gV0kliyfLlfjDcmxCVooSVixYlHlmINgYlSDE9xwrKYf7iyAW
	fuOtODlxDYhKUsNGZGXxVnbipbD0NOyLn+FdEj2COzGxKilg6kKK9xpkpmFOh2xnVpfUmzvnMqS9k
	PhLfP7lXNAt21dg4Lpwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5be-0000000H1O0-2qA2;
	Fri, 29 Mar 2024 06:20:50 +0000
Received: from mail-ot1-x32f.google.com ([2607:f8b0:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq5bb-0000000H1NE-2xa5
	for linux-riscv@lists.infradead.org;
	Fri, 29 Mar 2024 06:20:49 +0000
Received: by mail-ot1-x32f.google.com with SMTP id 46e09a7af769-6e68d358974so788178a34.3
        for <linux-riscv@lists.infradead.org>; Thu, 28 Mar 2024 23:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1711693243; x=1712298043; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=SCrB26nCQfR6aPUD3kDAg0uM9sVJQuUHQSLPSk2veRCZFzupSJKQVoWC1WMgTE6Jvb
         FmTZx3MbxeqY9JpMUrxm+hfglEiRm1fq2m3tc6eLXH/ms7PTrcbgkFqocen0xpsUZ18P
         Lwu/uE97notQQ4xdd+RDFubsJ+NGYWqlv3fNTt+3zGsrS4Grrzzh/Fnik3alQo60LPHe
         goJ/7XZncnn3XAk7L6qwVIHirrtlkcBQhe1IiHrhVyqzQS/lq8u8mpl2Q+tDQ4jK7xmM
         PipUTzv7L/3F6FXCk3MKHUlooaLhQC6D9TkrfFLpsm+S7t4MMP7OcqE0Hf57a5SaK/P4
         2H6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711693243; x=1712298043;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FvyDKytI3LByIiwfwmYUFkoNWJX9ByqcE9gyEaLOuuM=;
        b=TQfAtv7fWZ509vIGq8csBRlxrpW2spi8aMeaevYaAvnivjDbZjZLqpeoGfMjrf5Gui
         LasbR1Q/Z4mU+j3rl0dVmA3DOcQb92IJA1ScpANYB4IysSsDwnXbgzQ6yBDwYWyPv9io
         CL1vs5r5hiikP8qihBiJpxrCB1zB5jikYHNuFDiW9n8mwCqubxvNH1yIE+pp8VI7on7x
         W0FlXF2/wIKFnJJ8/EdLCQ9/K0EKGqyaKZekupcskbxwRAmmdtbLzeUMfWg+A4MYmlrz
         +olec/93fsJmebqLlnkhJy7tkw+LETjxBNhgD6kXaUI/64g0oXYlYKhtiEyASOYHcP3C
         loHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUlj6g6r+0/LJMkz6kjMg/YxGN9nJfQqhUlq29T2NqnebUBmj5K5XVxOvdKC5MRLRmd+9buFOdVS6CJ8LYncV9csNyAW4+5SGj7hj0hiLcu
X-Gm-Message-State: AOJu0YzQG9YSuRIABxur6AI76MWlejn+kJogZEA3HnhSRcooxDr+i/Cu
	aBs8fbqVXVoNVFjI3RrSmdvdSoCiWEaQalkxSMalSstjiruLaNFv
X-Google-Smtp-Source: AGHT+IE1O+Nt490ZqxJttSBxwo/ASQDA0kTVqGNr//Q2tt5IAtxYLP8wY2qulVH41yTGI3nnoq2+3A==
X-Received: by 2002:a05:6830:12ca:b0:6e6:c3f3:a9a9 with SMTP id a10-20020a05683012ca00b006e6c3f3a9a9mr1441289otq.11.1711693243275;
        Thu, 28 Mar 2024 23:20:43 -0700 (PDT)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id a12-20020a056830008c00b006e739aea9dfsm173130oto.29.2024.03.28.23.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 28 Mar 2024 23:20:42 -0700 (PDT)
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
Subject: [PATCH v13 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Fri, 29 Mar 2024 14:20:35 +0800
Message-Id: <ea7c845ef81a933a4f927f76b69dc6f7a71942c0.1711692169.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1711692169.git.unicorn_wang@outlook.com>
References: <cover.1711692169.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_232047_791507_5EECEEE6 
X-CRM114-Status: GOOD (  13.44  )
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
