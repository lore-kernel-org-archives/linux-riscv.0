Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9DE49CD1292
	for <linux-riscv@archiver.kernel.org>; Sat,  6 Apr 2024 06:34:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvMoMQwSF09Iu2Koe2W59S9boyMf7VQnSKV4bZYqvI=; b=YhBPp3iDRydV0n
	bITepExlCum+b0kWh3d9sZa5Tyb6XxEaDvkFhNIbGvZxNbV50UoeuyexkZlPKnAISSzjWR4ByEGmD
	utFCISa4teBHQaFveeD1PuE7iUFA8i3NKJFX1gHF9fTm8E2UVRGD385saO/8Z2eKKYQdB17nfpRNT
	//1VzYcedfEZGhiXc/CdsA2CBovSH9coqkLiMCruB6OJUbnuOrriY6Mj/K0/Wax5R4r3VUOv2BdN8
	Uf2s+JLzNWIY7V+nFFUMIeOuo28PdTAETseCGBSaeW5re9KwfJgD+ybYIk3HHT4l3luk/YSO8FftL
	z8Nl5rp2M8fcnVumGixw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rszdQ-00000009oIM-2ykm;
	Sat, 06 Apr 2024 06:34:40 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rszdL-00000009oFY-3sgR
	for linux-riscv@lists.infradead.org;
	Sat, 06 Apr 2024 06:34:37 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-5cdbc4334edso2017990a12.3
        for <linux-riscv@lists.infradead.org>; Fri, 05 Apr 2024 23:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712385273; x=1712990073; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=BtKzWhi8yrUAOjqpa967nSWNzMiYuYlh75suMI+CKoXkk6+HEATUqelIDFduCrid6F
         B068OlGal24aSfqIrPlEt5ze5Sxar7z0rFnc7yf0OpmkadjTcJ/7xM75+XtNDgQTxXYG
         +/TlHYoQ6Slx2MH0lVw3j+nrdG/eo2tV+/n2UUgPuthfib6/QlDCRBBnW3uM7yThnTmg
         D8Jtvgn4Bj/gOh71RyJ97qQewap7tw9dxzc3dLzquU7MKoj3VCp6R4Kbguo4M4zE1SZM
         60jxR5lFAaxCo6G7fUflJgYb31NV14r6/at3t3rUqUGxdTzL6opDiCmQ5PuwAtZDiLFa
         Zszg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712385273; x=1712990073;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=CRs0WAmSFzRnjOQtL3qA35Kl6Dq0qg6OvxaA8Zzz+QYgIm4XE6wdRifCeRc+e0uX37
         esvgs6h2b1ZzukSPChTdNbbbbf4apT7m9yU0BxbA0e9qFhwJNELV63L+Lia4gBsyiwEz
         z/ANEGkM/yspAElSbyqvWLc/wf40faJ2QAtFDqgcL8ugaf6mDRoUcPgaRw15+VDNhGK1
         huJOyWJAqXYkkpru+1gNSprmWLgNEncsibKvytO4rmZDC2xsVzuNZZHT3Owh+bvjpqPU
         DzF5Vb/fKs7MlML/YE09Q/i9I8Si0zjrsiLjV25tNxXMy1y46CyBn9lA51bMTN/Os468
         XhxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXG2mhXNuBJg7JX8RW3RIPB/dJS/YW1xls0UvhFkidF2NCwdVm5/ZYNN0te11cm8vdFEkH60/evd2wLNhUN94Lk4jR6QykTJ++Wkhtp+11R
X-Gm-Message-State: AOJu0Yyu4hLqUoTflIq+LCROqGInDQG2SRZwAwfSV3V98Xbv51hAU5JD
	D+DrTGNuM0oKRVAeZRXI3lcv0C+l8deTpj4eti+crDxqeFPl4fLj
X-Google-Smtp-Source: AGHT+IEkhUnvLKGeF3uP5MmaOYLwHO1IwGsLYRIwjWRy0HclbnrxCQBB9OCSC7tCJac/aWgKMwcjFw==
X-Received: by 2002:a17:90a:df85:b0:2a1:fb5e:6028 with SMTP id p5-20020a17090adf8500b002a1fb5e6028mr3176652pjv.20.1712385273310;
        Fri, 05 Apr 2024 23:34:33 -0700 (PDT)
Received: from localhost ([46.3.240.101])
        by smtp.gmail.com with ESMTPSA id k4-20020a17090a590400b002a09c114d7esm4322673pji.45.2024.04.05.23.34.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Apr 2024 23:34:33 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v6 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
Date: Sat,  6 Apr 2024 14:34:12 +0800
Message-Id: <20240406063413.3334639-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240406063413.3334639-1-qiujingbao.dlmu@gmail.com>
References: <20240406063413.3334639-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240405_233435_998332_7A76597E 
X-CRM114-Status: GOOD (  10.40  )
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

Add devicetree binding to describe the PWM for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
---
 .../bindings/pwm/sophgo,cv1800-pwm.yaml       | 45 +++++++++++++++++++
 1 file changed, 45 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
new file mode 100644
index 000000000000..b5b819d780f1
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/sophgo,cv1800-pwm.yaml
@@ -0,0 +1,45 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/sophgo,cv1800-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Sophgo CV1800 PWM controller
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+description:
+  The chip provides a set of four independent PWM channel outputs.
+
+allOf:
+  - $ref: pwm.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-pwm
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+required:
+  - compatible
+  - reg
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    pwm0: pwm@3060000 {
+        compatible = "sophgo,cv1800-pwm";
+        reg = <0x3060000 0x1000>;
+        clocks = <&clk 60>;
+        #pwm-cells = <3>;
+    };
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
