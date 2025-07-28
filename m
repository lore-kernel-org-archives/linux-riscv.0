Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 754D8C83F17
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Jul 2025 22:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=KJ/VTTfCBk3aEC/BwDDVDyANJwTYg+YId9lo7LArtHo=; b=AbMv2TczGUEur/
	Z7AH7AiT4o++jeZStTgz0zB3TkMI1IRV0/6qrRGJu3Y6BmqStCB02WhniVCQRljVVJkViH9JuTUw0
	8wND6z5ZOFJ3yJXYPYnH0pK+f15/rE+WzX0AcJgJXg74qQhG81X5qkLTRp4ZwChHJZktgO7pCgRTw
	3426G6Ip0j6tuEkSGAAaa2CjPgNZiLEwcE3/y55yNu50A+0baVyHXx38u1fGwMCzgAyuIhL3lr/g2
	qXLI5rfHiK8mZSIxMRE2ultDLdbP+W9gim4b2QV6F3fAIIg9mLJfjTsxS04zNqVLtQ9ImGk4xj2Qj
	8O+biQKLC1+K9pUu1piA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVvc-0000000FUfe-2mlo;
	Mon, 28 Jul 2025 22:02:40 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ugVt8-0000000FUWX-3WCY
	for linux-riscv@lists.infradead.org;
	Mon, 28 Jul 2025 22:00:09 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-3e3d31a9ac7so10401275ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 28 Jul 2025 15:00:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1753740006; x=1754344806; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=HDijcqgIFAmw1XKnQ8hC7cm5Tyltl97TkZgNlmTZmZ7FIOMcZd+sM1qG3kURg7RkGQ
         1vixRNb0qw5/ObHKWjCGOhMNMxT5Eyznjxu+ASD/66XOrRfHDIK8Gkp0xfOlihY5IWKX
         eA4oLTYMmPcSBbnJF2a632QzmC6CDEt4b9Zu0524Ew1pIc/0eVIhzouKs6W1kInphTXa
         O1heLTW8Drjes6mjBo32Xc/JvItgzJFboHFciG6/ZH7hTnTHghCv/FOZ0pgCk6ZYMkbo
         CZyzB8nkTpbm+JIoV7+0J2SUQwwYCpr/FUAQb5X0zHcH21ynszcl+JW9IYuL9+/fEHjD
         EEsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753740006; x=1754344806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SW20ypPIfCwWzDyApEVu137flF7JF7gBm3arCQYvIbI=;
        b=J5TovBhZDHJ04PtQIpyIehKer4SoPOKHbwiAsDC6yEqm7/GZ9HBT1FPWXoMSDM63Ob
         BUZ6saC07bCX1+n5UDk/FU9ZHB+Fw7VoHaqTot3WsDVKj65n4XOwfNTiFzCnFTayoGNb
         NKwPLWCzAdM/PJ4qedKUGxvMndzh70Zq0nTvdLrCbFeCB3syZeRqWk+klXQv+1P0P1af
         RmiSfBkIK6kRwM4e9jrDNNiVoTGjwJ4fMJhMc3beGDtl3qL9eLUnTDV8GSNePYJvQqZ4
         5QRObAwGKbxzULtz2YQnG1YJbWE62b6eUjmujcFq+TuqLVQVHRVMXTW7QMICEez5CN6g
         NYqw==
X-Forwarded-Encrypted: i=1; AJvYcCUmISAod2Q8Phd2gtGcNdAYX8HaCrbhwNKjDajFlISBOqWShSr84+NmgT4qFdSh69vwLSBdiOrANwG1gA==@lists.infradead.org
X-Gm-Message-State: AOJu0YztF3qSOARpYi+hf9N8ex9eXX4EqQBfUbAD+UnMCyVuyOuhgNRm
	OHgSuvdZn/KNXBFNP5lfjtekFsTnti6rj9B97gsgG+XnqMtsCd2/5AiDfGpeT9GGn+Q=
X-Gm-Gg: ASbGncv4eA7Sz8IpxDLXmm9DsnbEeWHeWKU6XH33rdC8+XN+Tq6qsyaFBQrS9O3hi6M
	ekZh8tpi0TTY/Cl56jTwZ3tyuwHT/BOr+4h6uy9JjwxQmx4J9eXif6xpNJjBWitRgfSdA1g36SY
	chJ9JQRcf8fYFajszeJ3AEHQWSA9lLOIqHT0Qg3LT2hXDrHi0+vGQS+hDll0rtBr4+d5JWv4go1
	4Av94h9rC9NYljHVWOjVRcaUJjkHFT4PSpLCMYhXoIOyDY4Z+2L6tXH72P9PqAdA0CqAcRWzA21
	QwAJ7P28b0bbmW2jsJ3C942NhZ0zIOMVlyxq3TBBHWPyZ3+z4VKizPzjdLh1GYpEiP89xNjySOm
	SzER6P0AtzYNgpBb9QzeBQPSdnm8ob9DcIzZuQJbVc6u+ygYqUQnvkqLCKRHvYkVFbg==
X-Google-Smtp-Source: AGHT+IEInGF/Uihao86Df5Hh8l2S/n6kOMKGVWM1LdBNeEbSuGAD9Xt1OLU4ny9gFPGHVpMlKG5tfQ==
X-Received: by 2002:a05:6e02:1d98:b0:3e3:d185:9163 with SMTP id e9e14a558f8ab-3e3d185932fmr133375445ab.20.1753740005684;
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
Received: from zippy.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-508c91c9fdfsm2167331173.4.2025.07.28.15.00.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Jul 2025 15:00:05 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	dlan@gentoo.org,
	matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lkundrak@v3.sk
Cc: devicetree@vger.kernel.org,
	linux-serial@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-mediatek@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] dt-bindings: serial: 8250: allow "main" and "uart" as clock names
Date: Mon, 28 Jul 2025 17:00:01 -0500
Message-ID: <20250728220002.599554-1-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250728_150006_964509_B2AAFD45 
X-CRM114-Status: GOOD (  10.67  )
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

There are two compatible strings defined in "8250.yaml" that require
two clocks to be specified, along with their names:
  - "spacemit,k1-uart", used in "spacemit/k1.dtsi"
  - "nxp,lpc1850-uart", used in "lpc/lpc18xx.dtsi"

When only one clock is used, the name is not required.  However there
are two places that do specify a name:
  - In "mediatek/mt7623.dtsi", the clock for the "mediatek,mtk-btif"
    compatible serial device is named "main"
  - In "qca/ar9132.dtsi", the clock for the "ns8250" compatible
    serial device is named "uart"

In commit d2db0d7815444 ("dt-bindings: serial: 8250: allow clock 'uartclk'
and 'reg' for nxp,lpc1850-uart"), Frank Li added the restriction that two
named clocks be used for the NXP platform mentioned above.  Extend that
so that the two named clocks used by the SpacemiT platform are similarly
restricted.

Add "main" and "uart" as allowed names when a single clock is specified.

Fixes: 2c0594f9f0629 ("dt-bindings: serial: 8250: support an optional second clock")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202507160314.wrC51lXX-lkp@intel.com/
Signed-off-by: Alex Elder <elder@riscstar.com>
---
 .../devicetree/bindings/serial/8250.yaml      | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/serial/8250.yaml b/Documentation/devicetree/bindings/serial/8250.yaml
index e46bee8d25bf0..cef52ebd8f7da 100644
--- a/Documentation/devicetree/bindings/serial/8250.yaml
+++ b/Documentation/devicetree/bindings/serial/8250.yaml
@@ -61,11 +61,17 @@ allOf:
             - const: uartclk
             - const: reg
     else:
-      properties:
-        clock-names:
-          items:
-            - const: core
-            - const: bus
+      if:
+        properties:
+          compatible:
+            contains:
+              const: spacemit,k1-uart
+      then:
+        properties:
+          clock-names:
+            items:
+              - const: core
+              - const: bus
 
 properties:
   compatible:
@@ -162,6 +168,9 @@ properties:
     minItems: 1
     maxItems: 2
     oneOf:
+      - enum:
+          - main
+          - uart
       - items:
           - const: core
           - const: bus

base-commit: 0b90c3b6d76ea512dc3dac8fb30215e175b0019a
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
