Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40C80C4345F
	for <linux-riscv@archiver.kernel.org>; Sun, 28 Apr 2024 06:09:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=23r/Pe1RLavPFlpcHh0HSD14B+SY4zuBJRTlrwQDQMo=; b=IEzYEjtfHPgpw/
	Rs9R4R33rk3b6ZsR0okcBEjDngHGbJ9PzTMI6uK89la7NRlQW7ssxrAh4MqxGOd+7bglb/LTadm+M
	XulCJ9CXvMg2ColpMyVTfrMzngygkpPMtUgcvc9nuCHmYMqM6xiw0/N9bhzwNacbQi3+rGAt02kw0
	BnTmjpp99+ja7e9gXAsZmwUJ3ymYv2LdPMsCQ6u23RHViP1WTbqWFbPtsGhl+l5t5o7jOrdjkHgto
	imgSgT/RCEqHiZ+cQcIQPGyxHS92WRDbFeZGNUcsRGmgUSUka82mPjR203ktLXFqcnd3QUz7Nmyfz
	B4TzCEtQ+N74U2LWnEGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0xij-0000000GwTh-1QRl;
	Sun, 28 Apr 2024 06:09:05 +0000
Received: from mail-pg1-x52d.google.com ([2607:f8b0:4864:20::52d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0xif-0000000GwRw-2JHF
	for linux-riscv@lists.infradead.org;
	Sun, 28 Apr 2024 06:09:03 +0000
Received: by mail-pg1-x52d.google.com with SMTP id 41be03b00d2f7-5d4d15ec7c5so2784914a12.1
        for <linux-riscv@lists.infradead.org>; Sat, 27 Apr 2024 23:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714284540; x=1714889340; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3ifjH6savS/1chV5K8K3CSmBN/c/aBjrReSIKeDHfF4=;
        b=ViMPT9GZCTKquAjn0AEp731SIWT3NwEs2fbItNgQ+kDi1czzubTJZawQAjEw5SsTGT
         m70PIwWJxAwYGEUbtDhe/b0NIFQtO3OVwB8x++CHoS8QwAzXyOepKFHdltNZ1M6UPHRL
         W73/a/TnzWGr6xmnyzTvZ6lt8fsU2mAw6u2azSs6/KPn9Tcq2AZntpKGcAQYiZRbENZZ
         5JmZR6gKgU51SR+EABO+SD69rD9d6rggNCRPX0AfxlCXP9Pd/092yqYSjRwQQt7Lfaa5
         fKg7n2RwY/rj+FKTMi1gn/KDoqGZscW/sRFvaQgMOUc50Ge8atxPiUfAl1PYL3qL3Rao
         LwJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714284540; x=1714889340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3ifjH6savS/1chV5K8K3CSmBN/c/aBjrReSIKeDHfF4=;
        b=vvOz4o5u+PQ1L/HzhgiFQpG8NVUxrTBRSke6Ecn2aPwUZlB6K3O8tW/J/TtDGGVLsb
         ch7wet4a+ylsnAv4tlSTGva4vZ+8Sx5IRpLRziZC9RCwVeXO0goQ8DCQSynD7QxeEUAi
         gKGIlB2LzXxnLZItZ6k4Y8Nm+oBPXlM44e3IVxDXvaNWIZhsAnmT3jEBarDcE/Jm6AhN
         w4/4lVkJOCsilNRHmGbTyQvOqfLkfFd5lvEoci+t8+R+ChP3TPi9zM71VqYreBlsX5cy
         w8/rRoAZnQQMHMrffJSMbhoqiNoORh9QmxuW/KGN4TwXPPn6MN4wwyX1BFp+CmsgZNcW
         09gg==
X-Forwarded-Encrypted: i=1; AJvYcCXXyAE92T0soy9OLGu13EzaX5fQpZbpUZtV8fsAnxulZgG2OBhOLihPM2WY/+HYev3NvvVYdVYbPttyhIb3dQ1094MLnVkdryTPnqcgz+Qa
X-Gm-Message-State: AOJu0Yw1PJ06AOWwB315wqDF5sSe5z1kUghobwAAjlmk3FShk1iOKk0D
	P69DBHyyr4BZOIjAGUdaDUSo/Z8xvsEAyBrujbEU2aw6SRYFZ70N
X-Google-Smtp-Source: AGHT+IErYchcDyS/zzQK2mtLftKKhBou/yAJ6ABnnaa73CNUu4Ycb+zpwd3mrTiKR8YysLDapQdOtw==
X-Received: by 2002:a05:6a20:9147:b0:1aa:2285:2cd0 with SMTP id x7-20020a056a20914700b001aa22852cd0mr10992578pzc.23.1714284540114;
        Sat, 27 Apr 2024 23:09:00 -0700 (PDT)
Received: from localhost ([46.3.240.103])
        by smtp.gmail.com with ESMTPSA id gu27-20020a056a004e5b00b006ee25097c2csm14608325pfb.103.2024.04.27.23.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Apr 2024 23:08:59 -0700 (PDT)
From: Jingbao Qiu <qiujingbao.dlmu@gmail.com>
To: alexandre.belloni@bootlin.com,
	robh@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@outlook.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu
Cc: dlan@gentoo.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-rtc@vger.kernel.org,
	Jingbao Qiu <qiujingbao.dlmu@gmail.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v9 1/2] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Sun, 28 Apr 2024 14:08:47 +0800
Message-Id: <20240428060848.706573-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
References: <20240428060848.706573-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_230901_619170_B3D9B467 
X-CRM114-Status: GOOD (  12.00  )
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
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
