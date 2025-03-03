Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A28C282C5
	for <linux-riscv@archiver.kernel.org>; Mon,  3 Mar 2025 05:33:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=yEKeAAnWIEQ9Cfy9NbuIdcVMPldbT81jqG12rd1ciTI=; b=I9FUJyy91RJ6Ih
	csEq7aVVbyZpwSpJWEdu/wj4t3MNxcmaaPv0T7rYf95VrJmSxj6e1hMVJzpHMTMRNw+pzRgEubOKy
	EPLzkYbmfuG5QQ95bAKfXKmprWbc5XezCRvvVb0nCb3z//do8eDWM/2lYYQNto0D4z6kQjqcUaAWZ
	yUODNkNjMZK7WelcMliNzrbjFlH06Y59XqDWJ2uRgaZSL5EKbLq+gYzXT0fI2GdNsg+jMWTJzafU4
	ioTUqBUvm48RmWPz8vvvR6E03tfDIsEAZhFd8bA+K6tY9cRcTL+GXOi4UsW1/2zpbIbspDJ+kvIdI
	+LqjQmqGVX4i6Sr0+8nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1toyR2-0000000HFlu-0ELy;
	Mon, 03 Mar 2025 05:33:48 +0000
Received: from mail-pl1-x642.google.com ([2607:f8b0:4864:20::642])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1toyR0-0000000HFl4-0hGh
	for linux-riscv@lists.infradead.org;
	Mon, 03 Mar 2025 05:33:47 +0000
Received: by mail-pl1-x642.google.com with SMTP id d9443c01a7336-22382657540so23653515ad.2
        for <linux-riscv@lists.infradead.org>; Sun, 02 Mar 2025 21:33:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740980025; x=1741584825; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G+eXT9z/Rb3KNpQtDwfjs09oHkg6BFqRPNyVa/Q2Gt0=;
        b=i0PLlBLkQEXO9dHa4cTjL8kVpGriTLBpOCu5XlaP+YVtg/xDrehyiO+ln/PF2zZceh
         O+HgaQSwKdcjDtRUoHpqADKDaGs/C+aOwXxJk+9qX/PiakOlyexUUWI9X08Ahkld1enQ
         WjTuu+vAulq8HrNq6/WvSj48s5W6QtwRn0aGUgcfJ9kN5uwTRaSVFwTV6BtOqyqj3YXl
         AHAgvnN7Rni0BmbBcyCVWmdCp4nBHIIM7zHHzfqtwkMltQtPj7ONnCKx0Ny/DRZpZ5cV
         PqINS7V8CEOZED74ZiuRTyoGIOVn3Ux7bVm6HC8u/2urkRQmS7LAmUcTyPC0JtNpv5sr
         Rznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740980025; x=1741584825;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G+eXT9z/Rb3KNpQtDwfjs09oHkg6BFqRPNyVa/Q2Gt0=;
        b=xEiXPSlpHyc+0PTLA3lW4EC0A0txI3V7dhJeDj+vTK65M7YVP2vknh3MoEJbIeRIWy
         5rxen6ffRv55Gqi7uk/eXLTavYSiYeeQtp8S1+zqehLc9s8DEoSu2tsixcP72yv28abW
         q8Kqrl1Vd5rrgOhqFadIkVZURvC7HiKu2XodGYfZWh7omogaQw8Jb5J1FDHnmQbQ7nzG
         0RLE5oxQSfCA6xuvPrCvkuN+MrHvvVAQrgCAy5iSEqbXNcihtI1kroBSrvelGaztaHS2
         1EdERwKKSDzjLU5QbLUowdnOiNAZsJJT7gwbEl4XSZDtzWzqCkrSS0s8XLQCspCGlWsA
         gWNg==
X-Gm-Message-State: AOJu0YzBS0p12itzYVgKts8eH3TGstN6/1Q/giCmRbxTd+Wqh+h2cGuP
	ik7xogwBU8pRn5Z8HKQWm2L9rpP8p5XyYUm4lyVJmfWtH64yEfp6
X-Gm-Gg: ASbGncvbo3+t7Co5pKlCOr3YQV+l8QnJQC4rwOwlYux0w1eiJArLDwI/BU1ZqQTFiMK
	DG8zF4+o6LA1TP+yZRcE/YiZZUtoQJr1NDKzkW9QBy7DL+9iOfZGeiXuQDRFdpwtL7Uul8pGhER
	auoP4rtcbWL1oo2aE7y6/eBTh+f6sihAV79a+lFTaR35xZIECSQNA+XgVXISHGTa89sW24xJekX
	siLBljhSHvtxZX8A0xECsQwGWKtvk0/TKDUF8xoNdmeGJIS28juuK63rGU6uBhiBudUGB7NUGr9
	xtJUfGyGptd6vB92OocJaTurGhTpXa9VilLPP9vHeZQtKA5l+pKG
X-Google-Smtp-Source: AGHT+IEyaUjmgSlTtj+8k2F773pN9r5qnqS5vCYIihiuZJW6fbf014mZKdFIuFfygmkGDpk/z8yWag==
X-Received: by 2002:a05:6a00:2191:b0:736:5504:e8b4 with SMTP id d2e1a72fcca58-7365504e9fdmr3983858b3a.19.1740980025412;
        Sun, 02 Mar 2025 21:33:45 -0800 (PST)
Received: from [127.0.1.1] ([240e:341:e66:ce00:d50e:ead5:2cdd:617b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7364b4eff66sm1856002b3a.83.2025.03.02.21.33.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 21:33:45 -0800 (PST)
From: Troy Mitchell <troymitchell988@gmail.com>
Date: Mon, 03 Mar 2025 13:30:55 +0800
Subject: [PATCH RESEND v5 1/2] dt-bindings: i2c: spacemit: add support for
 K1 SoC
MIME-Version: 1.0
Message-Id: <20250303-k1-i2c-master-v5-1-21dfc7adfe37@gmail.com>
References: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
In-Reply-To: <20250303-k1-i2c-master-v5-0-21dfc7adfe37@gmail.com>
To: Andi Shyti <andi.shyti@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@gentoo.org>, 
 Troy Mitchell <troymitchell988@gmail.com>
Cc: linux-riscv@lists.infradead.org, linux-i2c@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 spacemit@lists.linux.dev, Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1740979868; l=2000;
 i=troymitchell988@gmail.com; h=from:subject:message-id;
 bh=WyvZQZnkegQJcav1opY1yTg+77W2I4l0eYIU9UQKJUM=;
 b=0ubbWNBWTlWWqmCoMVoGa4yBgAQyxEgJ+1WF2YIEEYL79YMfXOo4pMDgR72wGcovLwLiSJ1u2
 Qu2PRZqdELIDEThOa50RkOtck3dt3NFvAOJrN60sWZKm694J8pP/IDm
X-Developer-Key: i=troymitchell988@gmail.com; a=ed25519;
 pk=2spEMGBd/Wkpd36N1aD9KFWOk0aHrhVxZQt+jxLXVC0=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_213346_215504_68C68C87 
X-CRM114-Status: GOOD (  10.29  )
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

The I2C of K1 supports fast-speed-mode and high-speed-mode,
and supports FIFO transmission.

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Troy Mitchell <troymitchell988@gmail.com>
---
 .../devicetree/bindings/i2c/spacemit,k1-i2c.yaml   | 59 ++++++++++++++++++++++
 1 file changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..db49f1f473e6f166f534b276c86b3951d86341c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/i2c/spacemit,k1-i2c.yaml
@@ -0,0 +1,59 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/i2c/spacemit,k1-i2c.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: I2C controller embedded in SpacemiT's K1 SoC
+
+maintainers:
+  - Troy Mitchell <troymitchell988@gmail.com>
+
+properties:
+  compatible:
+    const: spacemit,k1-i2c
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  clocks:
+    minItems: 2
+    maxItems: 2
+
+  clock-names:
+    minItems: 2
+    maxItems: 2
+
+  clock-frequency:
+    description: |
+      K1 support three different modes which running different frequencies
+      standard speed mode: up to 100000 (100Hz)
+      fast speed mode    : up to 400000 (400Hz)
+      high speed mode    : up to 3300000 (3.3Mhz)
+    default: 400000
+    maximum: 3300000
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
+    i2c@d4010800 {
+        compatible = "spacemit,k1-i2c";
+        reg = <0xd4010800 0x38>;
+        interrupt-parent = <&plic>;
+        interrupts = <36>;
+        clocks = <&ccu 176>, <&ccu 90>;
+        clock-names = "apb", "twsi";
+        clock-frequency = <100000>;
+    };
+
+...

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
