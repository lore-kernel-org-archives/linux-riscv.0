Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5118AD277CE
	for <linux-riscv@archiver.kernel.org>; Sat, 10 Jan 2026 05:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fMXbJfKAclaWL7Ka7WYoU1sYLA/IVHIjqls8/S4AZo=; b=3mW6u7uk/yqeR7
	qsm7ePmAjGcps5Hpvz3EChU1wncoLKPGPrvzLQYwJ0LcpWl0nkylQqo9cH4vvQ1NC1AIbQQ7YE9t+
	bWBk35ZVROyRLx3J+tnHfLbvub3ad/AmDybu2/4nZlVHIIAeDFWIicl0FgN3iCOFhYufPKoKFemRA
	CBOkcxJY676m45Yy3FWrPFphN61FnSbbGnq7FMPa2NdiM8pizwZw5wnTVc6U+OdTIvap+ZqpETtGC
	eZye2rnRTCk4qy1nOABdpcHbu2VN7zsmRta6EEnbn4vG3FWHwTi30z18d59mpSWU3sAWahQ1aY92+
	1OBkbS82UjEKyA9Eh3/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRPC-00000003GS1-2xue;
	Sat, 10 Jan 2026 05:20:55 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veRP7-00000003GOt-2oth
	for linux-riscv@lists.infradead.org;
	Sat, 10 Jan 2026 05:20:53 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-29f0f875bc5so41264175ad.3
        for <linux-riscv@lists.infradead.org>; Fri, 09 Jan 2026 21:20:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1768022449; x=1768627249; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=31DgMKkz4Cjgbg70+PADLl7ySardk8pduReCpk77D9U=;
        b=Gk4I2j8lbGmEkW3Wfj29Rj8QuhC8yljwzkOULL91pCUXeSHmnaB0W8fDrrAyXoccVE
         XKdMtnYGaZ3VuyL1VCrKb1cSTs+ohn/GQ+6+fQX/9/8e1PYTEDLY6j8UagS5P0PlIewS
         cEIgMsuelTKFGOkwGq0XyMicu+uL4nmYTe/yrd+rvO7tqaEmKXtrHMNsJRqjXXXVWYrd
         U7+L3qyQGeD1KzsBMY1E+QIrDXTxSEJMOCG6P8nfzn4089dTgtQv/eiXF6Z13+zhrChX
         /UVrCL1B/tBmwMNXwjoMKfiTN71+gMEZUZ+KeIBO0kjxUQD6lZonsEuZe+8OiPPXNR/n
         QoJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768022449; x=1768627249;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=31DgMKkz4Cjgbg70+PADLl7ySardk8pduReCpk77D9U=;
        b=qM5efGcMuvQ9cAHUTfmDjphFWJ/4Bxdi+Pakk2umz9xE6gR+0EYt4T5wUAvJrJ78oq
         80hgYj2FSpy5pXBE0CrMpmHIiqy65r68EKtrcOFnA6WpifwjSyp22LscNDn/bMMwkKar
         pVWFhVg1fUicLLrQMZ6p1YZt1pI1JnDMi5HwTH1cR227POzzSD48i0efwlyVqZoePbfw
         UTNtD1WQzwDI6yFU+Gtk7zcjcDr/Rpi43Vp6wuq5oYvlsGr0AyuzltXbY0QeUnviXVkn
         6pyHCu9aEA3wjXakM7M9NIhvRdW+mzkc+a98wFuLtzthZwKc3YBOI3RmFcPiwFxKpWZG
         dJWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXPY8j/cvSvQ0R1Yvp91UlJ9rICVrVjI99yMSdnVF7kQKVWU+ttekqxqpeUofxrArPdx+cwKCGmOSRE/g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyBsPBUgMgH7L+Jar7qQ+mE+d2/hMbqN6JEt3B+cAew8fWetGSd
	wJCRpsZFnhlsJ46Zdk48WHw/hA28UcwypvBPouYOwcZsVI26QfJL8eyg+zSpdXfYA1g=
X-Gm-Gg: AY/fxX6u3PGclcYWocQs9iAckoZE95KfNtTmjeFMacb4F8Jhl2pOSJ10n1ZSwe9UyEj
	TKHMJVdnNbIZD9rSNG5wwk1XSI79fTTUo1ZtwlV3qSiPS1AS5HoBCZVhC0HHXaV0w94gdPO63YH
	d4+2ke5HyfTjHE5Vuuqka0MYiKEsfoPlzWpK/QaCLQ55Up9+AWS/YTOyNUWtWZK22eDvfeqgx6F
	NzQiCgvMbmQk9iRWWMu422FUMPZPfwNOlDUCMbxLFeVK2V8aBg+TaOi6axzrKSEUhc3H9Gv/Fpq
	qujrUwXnxV7Ur6jufeUUcYh8OUK+wVKXNZmGLgnQAY5pVwLQi4chNsHRPxThPNzVGcMqkvQ87nF
	Dl6PAU2ouaDuhWl2U1KZsi3vmtX9y4NVGV5ISz8ShR5GUEAPZbbEZxRjhwNkJZ/cz0Gft/et6tV
	1EJAs/yC29sm+tbR47r4SpmxpwfbbXHQitKU2wmFGhcn6jofEZGQgCCw==
X-Google-Smtp-Source: AGHT+IHYGojnyw/X9+Sa4CxlCr/3Vn3pURVbolq+Xy03kMkgcsYibAap3C0WizH8w95DkH1bsHgxGQ==
X-Received: by 2002:a17:903:2309:b0:2a0:d46d:f990 with SMTP id d9443c01a7336-2a3ee4e81c6mr120164655ad.31.1768022448640;
        Fri, 09 Jan 2026 21:20:48 -0800 (PST)
Received: from [127.0.1.1] ([45.8.220.108])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3cc88cdsm118208265ad.73.2026.01.09.21.20.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 21:20:48 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Sat, 10 Jan 2026 13:18:23 +0800
Subject: [PATCH v4 11/11] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX
 board device tree
MIME-Version: 1.0
Message-Id: <20260110-k3-basic-dt-v4-11-d492f3a30ffa@riscstar.com>
References: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
In-Reply-To: <20260110-k3-basic-dt-v4-0-d492f3a30ffa@riscstar.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@gentoo.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Anup Patel <anup@brainfault.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Lubomir Rintel <lkundrak@v3.sk>, 
 Yangyu Chen <cyy@cyyself.name>
Cc: Paul Walmsley <paul.walmsley@sifive.com>, 
 Conor Dooley <conor@kernel.org>, Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 Anup Patel <anup@brainfault.org>, Andrew Jones <ajones@ventanamicro.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_212050_101703_122CA499 
X-CRM114-Status: GOOD (  12.86  )
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

K3 Pico-ITX is a 2.5-inch single-board computer equipted with a SpacemiT
K3 SoC.

This minimal device tree enables booting into a serial console with UART
output.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: No change.
v3: No change.
v2: Add aliases node in this board DT.
    Update the memory node to reflect the hardware truth. Address
     starts at 0x100000000 (4G) boundary.
---
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 38 ++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1..7e2b87702571 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 000000000000..037ce757e5bc
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,38 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (c) 2025 SpacemiT (Hangzhou) Technology Co. Ltd
+ * Copyright (c) 2025 Guodong Xu <guodong@riscstar.com>
+ */
+
+#include "k3.dtsi"
+
+/ {
+	model = "SpacemiT K3 Pico-ITX";
+	compatible = "spacemit,k3-pico-itx", "spacemit,k3";
+
+	aliases {
+		serial0 = &uart0;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+		serial6 = &uart6;
+		serial7 = &uart7;
+		serial8 = &uart8;
+		serial9 = &uart9;
+		serial10 = &uart10;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100000000 {
+		device_type = "memory";
+		reg = <0x1 0x00000000 0x4 0x00000000>;
+	};
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
