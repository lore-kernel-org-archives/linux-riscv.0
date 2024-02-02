Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B95C0C47258
	for <linux-riscv@archiver.kernel.org>; Fri,  2 Feb 2024 06:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=l6jdJtjg22VrXyGu+2R+CbVOFoMmy1ViLVjJhCaRB5c=; b=Wx9T2vrsZLD/Kg
	h6CA9QcBbcyYuftUSd9EjXiVF/4Rnqzr1RbvhR7xBQHxFWB//Rsa2QnO89FJSYdBqCzsWEPFEu2MG
	sz1G0p1VUbPdA5pAhfj/IwYXhaNFN3BqZaaC06Yl5hzR2lOZLHeBplwpFmahMuwSplosziwnY+iWz
	wx+CI8caEJUAl/vCUnz01q2vEpJW0HWx9VcRWF8ZYxfRIaSHOOcGsBSbPAYzRcOWD/aa/0HeqsTkx
	+wPDj3SdDc4famWVdxMFWZd/qEGp1I68mCvk3cU8jPzrnOTJ4Ayh3zzA4NQgrOvP0dxAnqtWMOF+9
	lZbV/YtHAsR1gksCTF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnF7-0000000ASEi-0aFZ;
	Fri, 02 Feb 2024 06:41:41 +0000
Received: from mail-oa1-x29.google.com ([2001:4860:4864:20::29])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVnF4-0000000ASCA-0XA2
	for linux-riscv@lists.infradead.org;
	Fri, 02 Feb 2024 06:41:39 +0000
Received: by mail-oa1-x29.google.com with SMTP id 586e51a60fabf-2143a96d185so918165fac.3
        for <linux-riscv@lists.infradead.org>; Thu, 01 Feb 2024 22:41:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1706856096; x=1707460896; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=H/7Ihe4vPnqb+El0TxxOCHRxUyQil8HxVU+vhaaiIU4=;
        b=Wyh4TThWZqgknRTDEDMtQg9ArCgyHm6C7uJ0QUUr8b9xk2Y2tEA9uXoGwUG5uqfn73
         5objarhhSvZ+kxdwFCxzOiq9KpUj9EGmPeoxv3lUuAOD1ioC6Z/eq+bFYobZbjBgJ+F+
         NgINLVXgXDkRqBFIldOvwZGaQ0UltHcAPvrIZy7c1ti3iO/jQkrHfyM4NFO69RIRufSm
         C5bkColbuzsGbcOJJDmYOxcYj3FQtV+RK/AdzYgEfh0nfdz7TfvC8vn4tbCzFY08g3xt
         J4xtOhD+rYNn8OHzXZ7OdBD+sUeKiA+eUC0o974mfNWB6iCleJHo6LVeVPQizoKgoi8D
         GDzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706856096; x=1707460896;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H/7Ihe4vPnqb+El0TxxOCHRxUyQil8HxVU+vhaaiIU4=;
        b=YDeZdyDocmckwihCjRrvGEKJY3jYqs4CF0xPElDMxbXqhOu/ivm9aF4LK8l5+qHIm7
         Jf5MOKbegQxpFCu85nMxJ0dmO9fuoLPL+3tDV1V8tMA+dfL2KOsHdoY7+ELsmAoew4SP
         i4CWl/xIXvb+OLQqa8FnjmFpZN2O05A3gi2C3cya+07MzaWS1RDarMo32e5axq0V32dK
         9eGE7iptv0JNt1w9w5v/S63GELu0snMYe9m+Z8p52Y3fXFcfeJBLSQn7Vz/4yJfdZCBh
         70GSg8/fX6anCilNED9PBkIFV40hPrB8VPTlJjpU1TSMhI2JFWrgxdg/YuqpoqmBFydU
         GAIw==
X-Gm-Message-State: AOJu0YzdFlJsYsYNv2HSQq+CuFVhO8quCJ4ZlYHgawmzYgmomK7Ww8+2
	3wqKFXfPnhx3TVirB3yCsHOXZeZG/aWsw3+t+UP8/Q+wHXTFnPAl
X-Google-Smtp-Source: AGHT+IHSiFTmHke13wN1SxKcd66FM+K2StullT3LYnHJcbR7rpQ5ZFrlEClwc0zT0kIMT5IkxBOkrQ==
X-Received: by 2002:a05:6870:a119:b0:218:dec1:8330 with SMTP id m25-20020a056870a11900b00218dec18330mr1063507oae.8.1706856096067;
        Thu, 01 Feb 2024 22:41:36 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCX9fyP97T4LGPWcPjGEhvjLc+c58XmBo0/gXNEC1NZHfGLci4RzYqgMSvCkP8r6WWKeQ7rFoFtGpwnKpMbt0wCIrhZoIgV1ULFXJqV+EMaX9Xxbids+QPLJ90x0WP7Te/hJovSp9zxHKtUQwuz5Dfm8+98FhhJEJy09Rl8NfghF3w9XRO6mtxdq1Df1JXZ0UWkQtg1+2nCjVv0wIO2DFtGj53Fy9pi3TihN8uPmOGJadRFlUTavMeHu403+hY57YoDLcDbeqrSNXke3rUlt+GzxjjAGnYZ7O0mXmLdp6TG7Q/H7L5iVxUqaDWa0jDEBx18ac77BmzWKfbSDhCvo+rqVxeMOuvgh4mImSKrpVl7D9WcIQMePJDi5G/LYutDX6l/3yGSmrGLcZVxaouXDXVaXNmshRMLPsNZQCaYmw2Xpld5+UFbBThgBBXYqsVsAAtwKa04Nay28Vu9UYdoixkdkOLW3cQYoL+GGjVvhPMWyzSnJg9wx92qqCInTah3uPV5/uKnZ8aycVNNEyjNfuPSIVdvZuP566bNINTOQv07bBKymsvDHBTBQAE7gxqACz0WwDy/2wP3GykpZkXQkKSBMatCXahwyF5NNlgiBceV6ws1EElGHJi9GoF58aR50ERZWFtGyFdghkkBU/RBUSRqmFff7hSYS/0F/vmJ5XmOJxfw=
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id sc23-20020a056871221700b00205d664c127sm335381oab.16.2024.02.01.22.41.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Feb 2024 22:41:35 -0800 (PST)
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
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v9 1/5] dt-bindings: clock: sophgo: add pll clocks for SG2042
Date: Fri,  2 Feb 2024 14:41:27 +0800
Message-Id: <bf3b8178a013004f259cd9254b13279254505852.1706854074.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1706854074.git.unicorn_wang@outlook.com>
References: <cover.1706854074.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240201_224138_206841_46F8F32D 
X-CRM114-Status: GOOD (  13.88  )
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
