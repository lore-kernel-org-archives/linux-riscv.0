Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EF33EB64D7
	for <linux-riscv@archiver.kernel.org>; Fri, 23 Jun 2023 15:09:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=6BWKoM38+uMKN+H4o6zwwD7/9JZXmEMP+6EKbpp6WzQ=; b=W3e3ZVIpIkz6Fu
	dwVPqa+yvhaUWkOtyENWo5mabW2V70UeVPOZZgzhja/WO22RYgBLn+/XTgW5R4+BpmtSd8u2GM2ev
	pw/rIOhS9hiMZtdzNMy8QcUzj2YDBAk8RJRjFsgDolQjecQWbyZGyYNuGsXoBr3ZKbruYFRcdkDls
	kwqqgWxnkT5FQHgz+iAqeWQp3h6WpI1XVI5BvxUbGYV40l2iAJ5CaSEmjHlzmajPnQSxRQpy+1qJn
	fnw2vOdUvZ6a1VPw5vXdcS2KCTzLcTMAQ3UQvntisECuLuojRvD9pqHNUeuTjWwoGJSoiYD+Uw72H
	dMhpxZx/q2I3ZcpBIdrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiPp-003t3I-2c;
	Fri, 23 Jun 2023 15:09:37 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiPn-003t1v-18;
	Fri, 23 Jun 2023 15:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=JmK+X4w2JDt7glvIU2n/9UBwkvorFsOPkeHF1PBbMl8=; b=esSfcH+qse+wZL5Z5FdPygCCOO
	5NMC9M1E+ivF8DH4YxqUs90XONuA0NrDqQS2C/hRAbgrUtpzOuEtnjlTb9gLUuhfuXxikEJZPzVRl
	fNuxqhCokY05kSY7kur1sVx76bZgcDG2BfpOsVWr7q8t+p6gigERCtJsE2EuFxqyrVyhjw9GOh9LR
	y2y6Y7Lr/5MHguJPiH0M9J+n51ujW2uQGck/hf0Lv74AttwBkPDcsEpam86PpQT7ry+ygBtuJOWbs
	E4mVes2Sm8BLCuOa4oQyeBnH+xMU9AmT6vh6yuQIDaWE5hBSKrkTfM8GpFac2UrxEk8cVYyjE8gF8
	+VVfjolw==;
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qCiPj-002G3U-1x;
	Fri, 23 Jun 2023 15:09:33 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-4f7677a94d1so1011884e87.0;
        Fri, 23 Jun 2023 08:09:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687532967; x=1690124967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JmK+X4w2JDt7glvIU2n/9UBwkvorFsOPkeHF1PBbMl8=;
        b=IvRKddzWyRQyw+xwk6MbNTRvVVi6IFdH2WsOzX+v3ReY4ucJBb4bLNrbjUhLcD2bda
         5f/r9BDmvzWagtNO5tiXRcvFWZh48Yj+Gt7YKGwB808wB2FXIWpSylNrLR4Gq3/GmWEY
         VtdQXQaS/TbbvpRjBv878UBY4h4Ac0+OF997CbjGLi+iCwFxhzYXrTbugiIglF5Cj8Qc
         QR+Sb262sKTcY8bUWBZwePGJ7WleW8EzJqQDoAq6lrUYusjpGQDCHVCXzEpjAgJgGfLR
         17ylwWzxLL6KrEfnh6JqARk14YqWkARMEd09K0fvqZQG1qjgebcssghv4/D/WLRIBP3r
         yBKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687532967; x=1690124967;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JmK+X4w2JDt7glvIU2n/9UBwkvorFsOPkeHF1PBbMl8=;
        b=U92PNwwOpSfv1f51zCgYAedzGffx4u2h3wn2XluYb8r4bogIad9FHctkMx8RZ4JbMI
         dC6UXUxh8PYmY6ocPwzer93FRLLLBuq3iycDaFxX3QfJylPB/ILW9zAGuvKD+PyOlUU6
         KKriESqJvrfXTE3QTRs+lHYqEKEj3w98JxutEjbjYCus0nxzNBgw83tp3a1g7tefAOeX
         QvrPEGmcvQxrH2lPeK0aV22zLmBOp8dNuBFawFCxiPxtkQJJAfrORVHftYZue0fryiAm
         hBVExT6iCJO01ThIh42YOfUDI5Izcppj4FpQ5uGAYGAxxHrk0cWtPtj9M5DV3goSsYlK
         IJdg==
X-Gm-Message-State: AC+VfDw1SeLNBiqNcHLEuhlhayd0NE5OIn9YKxDBA2h5uh2ZaXplSBef
	NEfkrIjKoyAHk5+GYnQJCQ==
X-Google-Smtp-Source: ACHHUZ4LoRzy+5sPqE6JMcDN0cDwn0H/zfZeH27FdWAx8idJttRwTlF340WczYLJbLH4AGq9ZAjRmQ==
X-Received: by 2002:a19:384a:0:b0:4f8:5637:2cd0 with SMTP id d10-20020a19384a000000b004f856372cd0mr12315046lfj.26.1687532966416;
        Fri, 23 Jun 2023 08:09:26 -0700 (PDT)
Received: from localhost.localdomain (mail.pulsar-telecom.ru. [94.181.180.60])
        by smtp.gmail.com with ESMTPSA id w25-20020a19c519000000b004f842e58d08sm1465686lfe.84.2023.06.23.08.09.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 08:09:26 -0700 (PDT)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Andre Przywara <andre.przywara@arm.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v2 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Fri, 23 Jun 2023 17:59:59 +0300
Message-Id: <20230623150012.1201552-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230623150012.1201552-1-privatesub2@gmail.com>
References: <20230623150012.1201552-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230623_160931_712032_416702AA 
X-CRM114-Status: GOOD (  15.19  )
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

Allwinner's D1, T113-S3 and R329 SoCs have a new pwm
controller witch is different from the previous pwm-sun4i.

The D1 and T113 are identical in terms of peripherals,
they differ only in the architecture of the CPU core, and
even share the majority of their DT. Because of that,
using the same compatible makes sense.
The R329 is a different SoC though, and should have
a different compatible string added, especially as there
is a difference in the number of channels.

D1 and T113s SoCs have one PWM controller with 8 channels.
R329 SoC has two PWM controllers in both power domains, one of
them has 9 channels (CPUX one) and the other has 6 (CPUS one).

Add a device tree binding for them.

Signed-off-by: Aleksandr Shubin <privatesub2@gmail.com>
---
 .../bindings/pwm/allwinner,sun20i-pwm.yaml    | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
new file mode 100644
index 000000000000..eec9d1dd67c2
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-pwm.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun20i-r329-pwm
+          - const: allwinner,sun20i-d1-pwm
+
+  reg:
+    maxItems: 1
+
+  "#pwm-cells":
+    const: 3
+
+  clocks:
+    items:
+      - description: 24 MHz oscillator
+      - description: Bus Clock
+
+  clock-names:
+    items:
+      - const: hosc
+      - const: bus
+
+  resets:
+    maxItems: 1
+    description: module reset
+
+allOf:
+  - $ref: pwm.yaml#
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: allwinner,sun20i-r329-pwm
+
+    then:
+      properties:
+        allwinner,pwm-channels:
+          $ref: /schemas/types.yaml#/definitions/uint32
+          description: The number of PWM channels configured for this instance
+          enum: [6, 9]
+
+      required:
+        - allwinner,pwm-channels
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&dcxo>, <&ccu CLK_BUS_PWM>;
+      clock-names = "hosc", "bus";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+    };
+
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
