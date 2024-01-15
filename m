Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 889F9C47258
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Jan 2024 16:06:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JEHXSQ/qa4nIKXaiIXofTzNFizKu9u9woR7/ApMTGc4=; b=fuzFS0L0SF083A
	2rl8YqPsypNUUI3mmVLC42PjnwAUyxORupNOJjwob9f9yqP4pa/pwPY5TT4Gz63Yfyzi/8e/7K/DU
	wTc/ab1MDcWDzjwnChouZd24AYCMD1Quq8Bl8MBRCIH5Ea2rYLHlcKDI8yWMEi9hZhN1x/xBibKvJ
	rd/RU4sL2bTkjsfkuHGRoLIQtn81ALAvQrIuUD6RX5wadyfIM8U7u0kAfDSqeSGT7632wQE9auC18
	SNfFlvlVbVy5ftRTJFVYD7FHsFxIc55XHAbxQUh+RXAU5FhvBgcVBmlxvpCiX72SBAlcvlHN9k0fX
	pUcGOv4fcq8ARRCbR7tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTc-009Y0y-2w;
	Mon, 15 Jan 2024 16:06:16 +0000
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPPTZ-009XzL-0M
	for linux-riscv@lists.infradead.org;
	Mon, 15 Jan 2024 16:06:15 +0000
Received: by mail-pf1-x42d.google.com with SMTP id d2e1a72fcca58-6dac8955af0so5146728b3a.0
        for <linux-riscv@lists.infradead.org>; Mon, 15 Jan 2024 08:06:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1705334771; x=1705939571; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ixPkXzb9IeR/hF0U1QATiBKY+/dWLZ8JkGr38j+7Zxk=;
        b=i3FTih+AvdOAVXWoEqsCnO07rXESN4Z5tV7X3fK9ZBx91fIP81vxR64FPh1cE/WVFo
         LEW1g+9bxnti02v8ANgMM42QNjcF4jx5ocYrsZpHxtgIvn+1gkTvcZM/dTNYZzQSyVf9
         CwrUMogAZRuEMXSCQtsLKa1mZ22QKtmdfdHzL5xF1xFcXf2hPCQQT4NZp5Dts2DiDtvK
         29lAItKdNibCnZYlSECDWWy/aoP7T1ALg7WvJMNxS7kVMK/LGxs3jOIwFzWHWBIhBJWc
         NqN96qTSfF6B+V3oSR2GCwmbwPgxdzbw3HoganH7niFyCcIifgCKP0imUi9wmeYKuyYf
         CpoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705334771; x=1705939571;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ixPkXzb9IeR/hF0U1QATiBKY+/dWLZ8JkGr38j+7Zxk=;
        b=fbZX9rgF5amN4d++Pqu+PDL70TvDilV+SxNVEFYo4gSIwkk4Ea4pX3X7ibdTMAJLo3
         6RxcNPWxDiwjIAIvsVzCUdumg8x/7idmb3QQ9yL9Fwt2+h/G/vLcg7GrsJUeBecNuEwy
         q4xyYlwmQNZ4Nu0QvdigYyXQAlWtBwyZU6QUN5uTEiVsG4RrD6R8DQj+/nB44hbzyHiB
         1cSSI8JGUD3ah9OtBFBUubDnrCkw1X0V5XyocEYYtrlTklyf2xw0mTaGlJudTafC4gbd
         EJtENPJAX/5rdS2VFMPFQzgzcAMI2p7W4brY3dsfdvHFa/aaUjI1FEw6aa6GzkhTPY2C
         SrTw==
X-Gm-Message-State: AOJu0YwSt5geeI3IuJtFFrkqVeJzJzu/WQnXVTzzKiANg8augnaJEE/2
	Az9FZvXG98jqgFXU7S6WAWo=
X-Google-Smtp-Source: AGHT+IH0W4dSfXX9ssa/rcWuTJ0eDaTBQ1lZ27m+dBLNlKjQeBamp8WPXApwM06MMIgXGOwRZw4JtQ==
X-Received: by 2002:a05:6a20:2d29:b0:19a:bbd0:a314 with SMTP id g41-20020a056a202d2900b0019abbd0a314mr1679742pzl.23.1705334771009;
        Mon, 15 Jan 2024 08:06:11 -0800 (PST)
Received: from localhost ([124.131.233.112])
        by smtp.gmail.com with ESMTPSA id fb10-20020a056a002d8a00b006d9bb4400f0sm7755351pfb.88.2024.01.15.08.06.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jan 2024 08:06:10 -0800 (PST)
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
	dlan@gentoo.org,
	inochiama@outlook.com
Subject: [PATCH v6 1/3] dt-bindings: rtc: sophgo: add RTC support for Sophgo CV1800 series SoC
Date: Tue, 16 Jan 2024 00:05:58 +0800
Message-ID: <20240115160600.5444-2-qiujingbao.dlmu@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
References: <20240115160600.5444-1-qiujingbao.dlmu@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_080613_147407_398E2E4B 
X-CRM114-Status: GOOD (  12.71  )
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
 .../bindings/rtc/sophgo,cv1800-rtc.yaml       | 55 +++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml

diff --git a/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
new file mode 100644
index 000000000000..e54abd59c193
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/sophgo,cv1800-rtc.yaml
@@ -0,0 +1,55 @@
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
+    items:
+      - const: sophgo,cv1800-rtc
+      - const: syscon
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
+        compatible = "sophgo,cv1800-rtc", "syscon";
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
