Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C8B0C021A7
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Feb 2025 21:57:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FDe0rDSPGDsZG133T1k0Mqn2/zzEFet+9ExLbsUPU14=; b=wiuH/h9WOTFrDY
	Jby73Np5NL7T6O5K2iwhdOQXTH4o1Ggwue4xHbDiNGD0g8GjUKTsWAiQ8XeBOv5/nwWQRGW9gjZjR
	fPlfzzozxfwKXh26iglZG8lxDK835vDeMqv70b6AqW4yMycUa6mGF2b4TtCHTY1/EsibKhhjak9S/
	qfVNJG9o8zPCV57jciUE2SlrMyANHLj6YEYY/va9m1n3rtyDaonkxCi2PELcoWblDVjG6EcyEmq7i
	ZhGbA4rsfq3FafsBj/c4aA2ZBCKF2zQydLAdGvU11029pDmT6vxKL+ipQHhiNhdujpjdH94VlmlK8
	5VfjgXUwLS527Lhm0L6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCl-0000000CkQI-3D8z;
	Thu, 13 Feb 2025 21:57:07 +0000
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tihCj-0000000CkOk-1KDy
	for linux-riscv@lists.infradead.org;
	Thu, 13 Feb 2025 21:57:06 +0000
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-ab7c07e8b9bso248376166b.1
        for <linux-riscv@lists.infradead.org>; Thu, 13 Feb 2025 13:57:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739483823; x=1740088623; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=REFi88fySykhHeawHUEzN1AegE+YIz3tRFBeiaR2lbzBhNcyt2Bjz0RBSyzM6Rz8SW
         HVgWqwwR9IQ2W/uzQWB08d/+BbgAd7JmfHiXYywnJxPtz/d/z1XEemMwTW0Y6VgY0N+Q
         T3W89ZRn+Yr5IRTXoW2O/u59uwHHBjayRJhznSW3pEmyBPvAHT4rDpslozragYqy2Lwp
         RD5CKVkRQ5UJmRXizWp/5oCZrUgYhThYSXvTbzIFWEDodXiwHSFbXKpSE7Oi4YDe96Lh
         foFnhQxtFzZx0mKJk1+mVg4JeSsNsqR5QXmWE10reetB+JOEJYPXs4b/2Ja1V5nrM9wm
         64tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739483823; x=1740088623;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=h9v7NZsx7uvmI0y//U+H5k+9INR1KuR11hKVq6XpN7Q=;
        b=Ay9PA7fR7YejTJgGZzAo51XG2OTie3PeYEbiDhbWo2iNQBJyR2U8EqeC/8WQqBoGaG
         DzgC6qZ67z7L0jQhgKCHYhMG8Bt22wGKcWu1JuwDzo42pjczTL0T/h0pTKFDpXPin1LW
         ec7e2oklVDGiXgwN+z/KJM2tGjPWwn6cpp4sZjgInzb6zB8T1IEEvIOjuDQneGJAv4zF
         mN+vlpYeOLtdE9u93fsU8lHQ3kqfU0guSQQm91x0Gxh8Tox4XXkW/979/JsXQZA2NL1Y
         wmS1NFAfnD5iJPCm+RICpzLX/gJEbjGx0NH5ycMLFcsWelz8VfQwOGoTbQCwXWyK4UVf
         ADXQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9dEwzXrx7BELiBatW338BkH1EVqZrfd437DvUwYqerULrNHIXONRmzK908JvXejlcDiSbnx1NoldAmg==@lists.infradead.org
X-Gm-Message-State: AOJu0Yy3eBDE9U3QJbK9P8Y4pA9H1uYP05FSGuyuTcj4OxFSwVxFQEmp
	+aaItsCB7uhUAzp+qVNYzcyMClN0cbyPNm8SKIW2C8zAx35CVZhS
X-Gm-Gg: ASbGnctw2tzi6R+NeTowzibLczKEE1JdIie3CfDUFaxUYbxeEePU9PRpdwrrnjo5DXc
	YsOObWPp0HivgPU2cTJoqHLClf2V17BYIEWzoVDtNNyeIxZzOCNPYENo99Qf+EwH35HAy5HyRRi
	+L7sWfIzTcgtBphEbc9kPldVUS5JX5pg+7hrKzinxHSCknlNGfyFb3+0UwGbsWZg4j8VT847yJv
	63nG7g6I6DVohVmv2s9PGPxL0L43TZvUixCsrLlSWNdEOkv9mLB28doewM1fcBjDtIILGB3C8Xv
	KaIHwROOzXBqMbazZHqCZwAAU5kk
X-Google-Smtp-Source: AGHT+IHRAtCVWNq8XpVzN2rzWEH+RsMalBJZKuJ/XEshW4YbV21Zyi2VxFzWNvpxpGYTpMRSyYy/gQ==
X-Received: by 2002:a17:907:9451:b0:ab7:b390:5c67 with SMTP id a640c23a62f3a-ab7f33c1715mr947209466b.18.1739483823072;
        Thu, 13 Feb 2025 13:57:03 -0800 (PST)
Received: from giga-mm.. ([2a02:1210:861b:6f00:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532595dfsm209794266b.70.2025.02.13.13.57.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 13:57:02 -0800 (PST)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org
Cc: Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	dlan@gentoo.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexander Sverdlin <alexander.sverdlin@gmail.com>
Subject: [PATCH v11 1/3] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Thu, 13 Feb 2025 22:56:45 +0100
Message-ID: <20250213215655.2311793-2-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
References: <20250213215655.2311793-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_135705_347871_AAD96C13 
X-CRM114-Status: GOOD (  12.35  )
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

From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>

Add RTC devicetree binding for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
Signed-off-by: Alexander Sverdlin <alexander.sverdlin@gmail.com>
---
 .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
new file mode 100644
index 000000000000..b36b51a69166
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/sophgo,cv1800-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Real Time Clock of the Sophgo CV1800 SoC
+
+description:
+  Real Time Clock (RTC) is an independently powered module
+  within the chip, which includes a 32KHz oscillator and a
+  Power On Reset/POR submodule. It can be used for time display
+  and timed alarm generation. In addition, the hardware state
+  machine provides triggering and timing control for chip
+  power on, off, and reset.
+
+maintainers:
+  - Jingbao Qiu <qiujingbao.dlmu@gmail.com>
+
+allOf:
+  - $ref: rtc.yaml#
+
+properties:
+  compatible:
+    const: sophgo,cv1800-rtc
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    rtc@5025000 {
+        compatible = "sophgo,cv1800-rtc";
+        reg = <0x5025000 0x2000>;
+        interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
+        clocks = <&osc>;
+    };
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
