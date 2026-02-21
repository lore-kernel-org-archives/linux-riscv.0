Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26808C61DFB
	for <linux-riscv@archiver.kernel.org>; Sat, 21 Feb 2026 18:36:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=lcSNp4RZhTsHgzzQbNNXbCMNETLiwf4Snfasf9YqfNA=; b=tLHjPJGKdBPPi0
	p8ADAsJ4llnln2gtsiXQlQJ7go/XojP0uhS0VodArRNTGOuZYptUzNVoQ4IHG/0gr3yfmiXYilhA3
	sz0RYm624rcMU7XRjpF7m10zXylFkR9qiu4T4dsbE1/Ucie6g7M7kgc30TuWdx6j7oA5Rilx5rks9
	tT6R4FwPxTavd3AlyCi0BGfx/WPiKqifK4EI4qa/cNCHcGD/f/0AgB/EkLVjp3VmGawqUV4lTjs2h
	BHO3N+nyC5mksA88aflVaOA3+WcHJToWda/cZCmlB3auZ/MQVhbeSrSSnNalj4IPTRC8LCO84syzh
	alqHynrTfHfkDAdzLRwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqQ-0000000GFW3-0ZLl;
	Sat, 21 Feb 2026 18:36:46 +0000
Received: from mail-lj1-x22b.google.com ([2a00:1450:4864:20::22b])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtrqN-0000000GFUt-0Qiw
	for linux-riscv@lists.infradead.org;
	Sat, 21 Feb 2026 18:36:44 +0000
Received: by mail-lj1-x22b.google.com with SMTP id 38308e7fff4ca-38707d4c8b9so39189521fa.2
        for <linux-riscv@lists.infradead.org>; Sat, 21 Feb 2026 10:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771699001; x=1772303801; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=;
        b=jH+iLAdwE+d4XXiv4mOq81H9PbqaohdD3MZsO1V3Gg/xym6VfcZX/GinmZXVNL9h/O
         WAv4e8+yTOiRLqMgtttwVNOS19d5YqOOeX9MWaUAV5dyieIXWlCRVpcdwk35H5U+HiCI
         ebU6QX39/sBz3SuEoqo4jQ+R94nPRlTevdioNVzUblJlSHEpaw+jKlef09Q1AJv9pgDG
         ncRTftCgcygrWgrR6XZwdMwNzxZRalA/Cvy3VlNhfqIqqdaTqtGuK1ctrY8X0HqSH9zH
         LZ3Vgr0ymxg3e3vc76u9WfpPNaxWC/+b/Ubap8dXlxKt/B+KHdu77eMbLc0oe0FQiBFD
         4KGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771699001; x=1772303801;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tuboJBenXywBLFqud7lu9/BOWrHh+KcmgCOX5jvamjk=;
        b=gCNJdhzod2dCzW1Dx7WHUjK9G2ZqeKxhTRYu1Y89XfHxyxKrAVmFiYhamIg4yuv3lb
         TzOikzZoB81v/VjgxDmHRZ1rBCt/cqu0jIHySJKP0PTuaoYuy6ccpli1U2/E31Mq3Wnx
         9ZuHId1fMwjT6a22VzQh+7UVjT5eL1I1ScMB1lIhYAcokN9uOp+gr8Cq0y1ck8RwbMsv
         Mwbcj2mEGPtIVeI4iOAyK+LXNVy7YgUEUH1S4CW1N/w9jJF7ln8R8ERQaHZTJGHGeQNa
         k/T6td6VyqdywbtYmwrc6XEi+U0721iDnctgy23qI1JTqwngxX4NeX4BFYS1E0g6H6x8
         W9ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXpwOamLdsLQNoaubjD18MrJo9BDwYwEp/vSH5SnXRHx93w7IYKMIOnmADUJtBwDBJBonwvUdUg3Qcurw==@lists.infradead.org
X-Gm-Message-State: AOJu0YyFoi+ygxSjyCLJj85BrdfOXZ1Ac0G8PozuewCTTtUsNgcJSyW2
	72COI3bGkIryA5aa1wHO++JHwTRP4GzINrifRF5RyTJQpbQMGOi2qO8=
X-Gm-Gg: AZuq6aLZc6TAFt4ygjy4jSjJBxPe8g+XSvfqWxVphJjvdYaFkcH51XHLDk039wDbGmz
	Z43rPpwydxWmsdezu8irKXj51N1m1jrlc0CClUHPaE+kHeQOIUbAU4bD6Q18iv8cdw365JqfVJr
	yeXuMB/m7hL7R9OIBm5hVI8Oi8bvl3E1/Fr0UBhtRQDKjPibFOYEZQcr+JOMrIwwXrK7V+Q/9uH
	sJWMj4T6ZTS4qYXcmcqwHQfleeSLJNXcEafwxFVVdoqIRLneJU5babL9Y9Wuj+Tw0/8wmGd9PjZ
	G5I3BpbWd9TgUIU2XUboApWRjlQwNOYik3gWj4hUaRpeu512XRc0AJ9t4U5PxbJdY5+xoLsYA4+
	Fji9a0JvEhf7524RLxIH4rzixblAvsw76q+yOVKSAlbwVcF06kN4Vjivv5j4fbwFXKrSc9uI4n3
	JFjonK7k80eX2jtdnyTGl6mo7mMYaBbuI+BqQj
X-Received: by 2002:a2e:be94:0:b0:386:eadd:9ddf with SMTP id 38308e7fff4ca-389a5cdd595mr8800811fa.12.1771699000922;
        Sat, 21 Feb 2026 10:36:40 -0800 (PST)
Received: from localhost.localdomain ([178.176.177.46])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-389a7af19d4sm5006841fa.42.2026.02.21.10.36.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Feb 2026 10:36:40 -0800 (PST)
From: Aleksandr Shubin <privatesub2@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Aleksandr Shubin <privatesub2@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Lukas Schmid <lukas.schmid@netcube.li>,
	Cheo Fusi <fusibrandon13@gmail.com>,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH v13 1/3] dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM controller
Date: Sat, 21 Feb 2026 21:35:51 +0300
Message-Id: <20260221183609.95403-2-privatesub2@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20260221183609.95403-1-privatesub2@gmail.com>
References: <20260221183609.95403-1-privatesub2@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_103643_163124_7B4942AA 
X-CRM114-Status: GOOD (  14.98  )
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
controller which is different from the previous pwm-sun4i.

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
 .../bindings/pwm/allwinner,sun20i-d1-pwm.yaml | 74 +++++++++++++++++++
 1 file changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml

diff --git a/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
new file mode 100644
index 000000000000..306e14a9c4d5
--- /dev/null
+++ b/Documentation/devicetree/bindings/pwm/allwinner,sun20i-d1-pwm.yaml
@@ -0,0 +1,74 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/pwm/allwinner,sun20i-d1-pwm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Allwinner D1, T113-S3 and R329 PWM
+
+maintainers:
+  - Aleksandr Shubin <privatesub2@gmail.com>
+  - Brandon Cheo Fusi <fusibrandon13@gmail.com>
+
+properties:
+  compatible:
+    oneOf:
+      - const: allwinner,sun20i-d1-pwm
+      - items:
+          - const: allwinner,sun50i-r329-pwm
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
+      - description: Bus clock
+      - description: 24 MHz oscillator
+      - description: APB clock
+
+  clock-names:
+    items:
+      - const: bus
+      - const: hosc
+      - const: apb
+
+  resets:
+    maxItems: 1
+
+  allwinner,npwms:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description: The number of PWM channels configured for this instance
+    minimum: 1
+    maximum: 16
+
+unevaluatedProperties: false
+
+required:
+  - compatible
+  - reg
+  - "#pwm-cells"
+  - clocks
+  - clock-names
+  - resets
+  - allwinner,npwms
+
+examples:
+  - |
+    #include <dt-bindings/clock/sun20i-d1-ccu.h>
+    #include <dt-bindings/reset/sun20i-d1-ccu.h>
+
+    pwm: pwm@2000c00 {
+      compatible = "allwinner,sun20i-d1-pwm";
+      reg = <0x02000c00 0x400>;
+      clocks = <&ccu CLK_BUS_PWM>, <&dcxo>, <&ccu CLK_APB0>;
+      clock-names = "bus", "hosc", "apb";
+      resets = <&ccu RST_BUS_PWM>;
+      #pwm-cells = <0x3>;
+      allwinner,npwms = <8>;
+    };
+
+...
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
