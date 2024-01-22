Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98AF8C47DAF
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Jan 2024 08:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+oeHsPb4lG+0kbM6PrccuFIbZYnWVbzPw6ub7DL+EeI=; b=Y+iTUuAaRVk4G3
	glyQMzbCu5aINlgdXPLE0eKCTDNnoazM+d+8u00F6+0jnXC50EHLNwnEEW0Ege6TeLLWk/7cnXS27
	RGB/1xtY2WCfbGCUg8h/8VFa2EXQzcmww7IbZe7DrNa0JUu0fU1S4gGkXq0vd1e5FSwB0PZqMJ1P8
	UpcNCwzLQMswq40k+17FHK6IEZx7D5x9gaoyZXqhpDcoLbv+lFF42L2GaZkbnaSfFmayhDSfH5O/Z
	8uc2WA4uXCXRk74ZvF9Z2H8W4PUs4X1QX/WnqctSrzguZEEd6yhmZJCzkPBrW/eyRflE0tZ1YJlr7
	xuvccyImplPjNMqzD2Og==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpIw-00AyP1-0T;
	Mon, 22 Jan 2024 08:05:14 +0000
Received: from mail-pf1-x430.google.com ([2607:f8b0:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rRpIr-00AyNX-2C
	for linux-riscv@lists.infradead.org;
	Mon, 22 Jan 2024 08:05:13 +0000
Received: by mail-pf1-x430.google.com with SMTP id d2e1a72fcca58-6dbb26ec1deso2987751b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Jan 2024 00:05:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705910708; x=1706515508; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+VzQb+78mErpWHlkUlL4Km28JBu20sjS8OQqy5uchPM=;
        b=J1ti9nv6CiiCKsZ6LmGJqQusy5t6Vl5/Du7M3MVl3MAONwfl/zUb/jhesBmgj9FmZ4
         5hAzd3zTspqBSi6PCy4DZFhHeOBJzJaH4bl9nwUrKRbYXmC+d9SWgM2S1bQC4quUkgjr
         CVBwndtdmBKANGj3jpHjYjzna40LrWw139cFB6xLb0uv8w8Accn/nw8Fe3WZyZ01+cCl
         kU9G9jGqUWZWoUhvMPislI+H35fTClPReR7Dm9DSEkWpPewCkSVlgJ7VOVG04XFAVSNG
         dbDCGlVASfRcrSRQakDdRQ/w2H2i0520EE8JKjN5imjJ+EPt3fD8BgTVE1bysGArvszI
         gE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705910708; x=1706515508;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+VzQb+78mErpWHlkUlL4Km28JBu20sjS8OQqy5uchPM=;
        b=fdSQ3gRv6GxqT81RT6zQLsfnML8mo6mRiWnDpGGKJTQ+ALaJPcMp6gb3PoFZdIVw3q
         d0WPmA6b+ML2EBWAsIG/+22yWTvBYt7WuhgNV7YwyanC5SoJcZbQL1IJP4nfk5Jdm6yY
         obwnodZbXn65DEYWj6mYdH96AlZsEZNbxGNgceC8aBkWROGCHXcBrgMdS9T+FoHr5lLn
         8HLCLWFjS8bziLgTm/TaQZn40zyZuuYRvCOLyj59S+0pcvlSc9iR1ykt/qatMMgVbSWC
         dcEqChJ9Ee8gGiTKb7HfnSxU4sZtGmFEI7FL/WNjuuj04s39vToK5d7bGb2q2wpNKD2n
         yL8A==
X-Gm-Message-State: AOJu0Yxr1bbFrl45iyhvd0DYql5P8D8ZlW3O8eVgiWYNfbHfZmNqddGZ
	M6LJTqPNAq7k5rHMF07ewud2RSNRt+V1e1IYYSdwrsgXzKFD14If
X-Google-Smtp-Source: AGHT+IFPmqfjE+LH1PjRwOedBBf9rGpKNqOBP361A/qQuNG31+HVCNCkO6XVUJn1u/MZxSl83p34fQ==
X-Received: by 2002:a05:6a20:2d25:b0:199:b9ad:5ccb with SMTP id g37-20020a056a202d2500b00199b9ad5ccbmr5940597pzl.113.1705910707528;
        Mon, 22 Jan 2024 00:05:07 -0800 (PST)
Received: from localhost ([46.3.240.108])
        by smtp.gmail.com with ESMTPSA id k9-20020aa792c9000000b006d9bf45436asm9137895pfa.48.2024.01.22.00.05.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jan 2024 00:05:07 -0800 (PST)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	chao.wei@sophgo.com,
	unicorn_wang@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	dlan@gentoo.org
Subject: [PATCH v7 1/3] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Mon, 22 Jan 2024 16:04:58 +0800
Message-ID: <20240122080500.2621-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240122080500.2621-1-qiujingbao.dlmu@gmail.com>
References: <20240122080500.2621-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240122_000509_719588_5A53EDA2 
X-CRM114-Status: GOOD (  12.63  )
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

Add RTC devicetree binding for Sophgo CV1800 SoC.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
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
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
