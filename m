Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47638C54E68
	for <linux-riscv@archiver.kernel.org>; Thu, 14 Mar 2024 10:01:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=iqvMoMQwSF09Iu2Koe2W59S9boyMf7VQnSKV4bZYqvI=; b=azvtnF/c5ehunr
	UhGZHm7x0D4pdZe4PNq3/E50A4SO+mjtcMTKSpV4iNknOf2beXOYkpQRrJ0u6WYc1MldTuO1HSVa3
	gf3hGpk+XumPJg3FZsXvi6gOXG+RaCeoz9TkO1dPREEA/Kxr0Op+qLlU1opVhUKeZw0TFq+/vQ+qp
	Y/QTX08MPT+ce0qdg5rHJB7DqckgPPvmkoDeIwVFw1xGagXposQnACwmomo1e1zfgBYbEcuvU7wfi
	B2159FimDkodanAPwOp5y6J3sU5eo2/WCF2ynNXkDp//4gebNnUJII/YLxy9bqT2ju3beEvTD+74O
	oA1utWxEg7o98AWou1UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhuM-0000000Dopv-40c4;
	Thu, 14 Mar 2024 10:01:54 +0000
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkhuJ-0000000Don7-0zz9
	for linux-riscv@lists.infradead.org;
	Thu, 14 Mar 2024 10:01:53 +0000
Received: by mail-pj1-x102c.google.com with SMTP id 98e67ed59e1d1-29bbff1505dso696633a91.0
        for <linux-riscv@lists.infradead.org>; Thu, 14 Mar 2024 03:01:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710410510; x=1711015310; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=T5trga4qdI2tTdXY7Tk2BTNyLshiWdxDWTrVMD4ZmVsuV2X7iUeGg6ZdGgydfFHZGz
         YY7nANdiIk5408U9AMviuBsVll3wmddajdUZ+uzySrCR9/6QPTsoYDTpQty5nPs2FG5y
         hb1zk2GPQAZwN1T1Ya1Fi1OqsuFnoAhfzO8C3s67YJVHDH/LbNzlOWsYJuHe2V3dbFPC
         mFMuFJO7P049rehHE5nwQs1a4Ogfy1F241uzZiENX8s8g4mSdwKN2mauyJYqf55a0KXm
         csMHgqm1IPTDROXP5GC+k26lgEJeT4N+GVsOlIxyhKOdZU8Qg7Bn9rdRTuBuOfClNYpa
         Nqag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710410510; x=1711015310;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8RfbJF1AHvLx68TbsWfPK5aQiL25UBSnWB8Job9Vv4g=;
        b=Ocse7QAfrJLiHBf7ijALK0HBrXgHHTKmA3CxDFZqbQWRdpHMYTueC8UEwBa+Nm6/mn
         4uLnpFxyt2WsDKjcKz8n57SBGAnpWM/vnF1ZNI64Kv+fUsob4nv63jITdvChuqCQeC9k
         4XzBhTREc3QCL4uWtKyHxT+roAn4F6Q3sk7w69iUkJLKLOQw689pnRuRXAKq0s+Cur+9
         ohFKetvUmtpCGceEHpRqq3ln1UrXK3Z9xSoyQG5oM+cD9VRia1fOL80DwB0ebUeFXAC3
         Ee0KiZPBTJX9P07XJ3KmtE6NKD1lR05s/BwixfsGmhGwxPXBIZq75tPkZL5CYVXBAEG8
         YM+w==
X-Forwarded-Encrypted: i=1; AJvYcCXrV2+esElG70m/ztfgjzKEZmkQKk4zSNNq+Dxxu8nqdRX8idCOHrJ7yhJDlcYOT8cHrHnkzYMcLEScGFGfHlV3Yt0LYLXw+peEGzbQNPVq
X-Gm-Message-State: AOJu0YxReKQuAXwsAymhB0vLJ5m2wphIrvom5UQKzfeI8qJ33GNkzjH5
	TdeOjQzqDJ8YlM4ETasOqs2oPFqq+ZDQwL9KiuFibKD/nMO+aMaH
X-Google-Smtp-Source: AGHT+IFOug+prJyXuRGFeVODmozS4fHIyHcN5UlA0KXkTsIv7Ms3lGTNvz7tnZ/bHi5vnYPctGNhqw==
X-Received: by 2002:a17:90b:c12:b0:29b:b736:71b8 with SMTP id bp18-20020a17090b0c1200b0029bb73671b8mr1166414pjb.28.1710410509361;
        Thu, 14 Mar 2024 03:01:49 -0700 (PDT)
Received: from localhost ([2001:da8:a801:69b2:6cee:23f3:5da6:de15])
        by smtp.gmail.com with ESMTPSA id bo9-20020a17090b090900b0029bfac322aasm483186pjb.30.2024.03.14.03.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 14 Mar 2024 03:01:49 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: u.kleine-koenig@pengutronix.de,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org,
	inochiama@outlook.com,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v5 1/2] dt-bindings: pwm: sophgo: add pwm for Sophgo CV1800 series SoC
Date: Thu, 14 Mar 2024 18:01:30 +0800
Message-Id: <20240314100131.323540-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240314100131.323540-1-qiujingbao.dlmu@gmail.com>
References: <20240314100131.323540-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240314_030151_457705_A961ED79 
X-CRM114-Status: GOOD (  10.61  )
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
