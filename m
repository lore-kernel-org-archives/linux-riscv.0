Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A70D3D5E154
	for <linux-riscv@archiver.kernel.org>; Tue, 16 Dec 2025 13:34:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ESD9D2NA011P9066tfCgV2DmCEFSBHW8VlEZZ3kHUDY=; b=IzYK6gfazkO8qq
	1OLVKdnko5XnyvVZ13GLMQZ5euXtnAASUmU5kmQ8yuIn5Jsg4YBywTYrI5xSJU3Z+nw6sZc5a/tCE
	GGV8wXLLUJ6Je2dZ/RaB+McndSxJIfOBvyiS6Gfju74myS2Dg+F3c3jRm6ZTfqOMBrm3kYaWaOrHI
	OOxy2fFz1TyTZYnY5wuMY/B4QYg8FVxA/dgV1f30DK901fYekbc8D937y4oUr5P21/uj2IVjzs/iM
	FQ2vfdqGnQJfbaHe6zk/tNIfZzEKfSpHaXfnmeZZ4/Ado60wMZg+EvNLF9jLkeElg0qWnL4qQXm5d
	ELKeqyHoNvrWvBDUBL7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVC8-00000005H3Q-3KRP;
	Tue, 16 Dec 2025 13:34:28 +0000
Received: from mail-pl1-x62f.google.com ([2607:f8b0:4864:20::62f])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVVC6-00000005H1i-2ral
	for linux-riscv@lists.infradead.org;
	Tue, 16 Dec 2025 13:34:28 +0000
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-2a0d52768ccso28565435ad.1
        for <linux-riscv@lists.infradead.org>; Tue, 16 Dec 2025 05:34:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1765892066; x=1766496866; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IjtsZDFBVTJEjQk/WUDeFopXVBua3qA0F4qJMc77ff0=;
        b=xbRJJcFG/bvPRU5ZwFnFgx0m81At62TpkEeiVKyRZqcf10VQtaRjBXsFSg1d8ZsQEz
         jed68FcS4BoRchGVb2j/hn6ulwk6jDArFPuraRKf7l5RjL5Kj9O0q/rxAEDuhphpI7VD
         we5x4EAJYOUz2uMkLQO5KHc4dMfcYvnUwb2km+JKxirgBKITLvGt69c6My+pTtqDvzZo
         JtsiUydECwHr8b/uRAHBK4jD2AC+SuTlahizyXkuQnswKrcDdcT02Gauluz/5YjnsnAx
         Jk7TyEkDRrMGyqC29VJF1/3s2r0NA6/gDV089PUOCtRQkhNjUlcfh7iHot5o76eNoi4i
         V/3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765892066; x=1766496866;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=IjtsZDFBVTJEjQk/WUDeFopXVBua3qA0F4qJMc77ff0=;
        b=M1I6lB6c/jdJeqSUBNw3jO6KfUqoJSzfqjTPBbwaWjdaHaDJPRWmcdxGxE3W17CK8a
         51A/WtOE2upcJoIrhwTo68iUYs0r7qx2yl1pFxrW8ortHuvNFxLrZ8aYeHglz0lItIX4
         hwl950o2ZbJJTbtg7Vd52Hh0R3A0Xcmcnkrek2SxzlrWsB41isrpTUbZjC/xrKHQ5yzy
         b6jeU6Umm8EXGQ2him4mDieaFnSKwsAOsRYFNBC8DmR+i04dK/OhkCrPl2MKAoj/li4N
         GfS1La+mQNZsHgYko8QXbVtxtvfem82PfCKsWQb/pRc7mS6jWvTgYNPUfd5eWWsz9nD/
         ueqQ==
X-Forwarded-Encrypted: i=1; AJvYcCVFm+7BcWibuTnmyO1OoJt5WdPRdkCkBV7rntW6GZuoyRCBKGy0bzlUAG8fPZg8okgpdRpQMmjYuevqnQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxwLCm4x5wKwUjgG8TfnOy/03aNmJIIhRCUPpyJK0QcUcgHTP07
	wzoB7eysWbVauekoPXIHPYVvtH2J8Q3AX0naOFMbnfj7YQ3PaACayBgqVT3/ogFPHag=
X-Gm-Gg: AY/fxX5WIrTgQH/wytSx1nyN9xsbxgI8Pc91HwEfMr8JGzMdoxJmimc58RU7hwIH2fR
	V98jTqxGK5Az0SjOJypfsn+JOgUC4v9RCbm+JelSMcAQVE3vQTTiIzyE+BQ4653WpbhlVLJ0fvm
	038QHQkSK+ak19MuIyAB/hiFswSGByYvrReA0MnbJWVL+tT+zhE3i1MYkrwW8p2e3d/6i+GEttx
	ihfNKNg8olwEZ1qarUUDMC5J3utFuM9K2vCcFgPkREtF9JC5Xm1zqnTj7eyyFOhpcxvlocVoJrg
	2o4R9rXcvWZqnNIK/4+qEOxH7jR3+tQ3lCWq94NJQihtNs6AmSOq/nax0Va+f6cz8TlVfg321/M
	7rGHIWkLVbek0Ky8XuOFcftWHaYaJhYlnxnlZkn0RhUKtitGUF2KNqFJQgw01/p2QpmlofKV33/
	w+k27HuOf0UXkPdx0q0bNl2HA/sYr67xRo/45CIC5wLA==
X-Google-Smtp-Source: AGHT+IGVOxm+/QKyxHcc5Grjn3kteFx1uRcmQu8o0lO93tndrJa8YJKE/y22hloJlPWLdYElnvZGNQ==
X-Received: by 2002:a17:902:ef44:b0:2a0:a9f8:48f7 with SMTP id d9443c01a7336-2a0a9f849f9mr99550055ad.55.1765892065830;
        Tue, 16 Dec 2025 05:34:25 -0800 (PST)
Received: from [127.0.1.1] ([2a12:a305:4::4029])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a14625add8sm15829525ad.61.2025.12.16.05.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Dec 2025 05:34:25 -0800 (PST)
From: Guodong Xu <guodong@riscstar.com>
Date: Tue, 16 Dec 2025 21:32:32 +0800
Subject: [PATCH 8/8] riscv: dts: spacemit: add SpacemiT K3 Pico-ITX board
 device tree
MIME-Version: 1.0
Message-Id: <20251216-k3-basic-dt-v1-8-a0d256c9dc92@riscstar.com>
References: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
In-Reply-To: <20251216-k3-basic-dt-v1-0-a0d256c9dc92@riscstar.com>
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
 Palmer Dabbelt <palmer@sifive.com>, Conor Dooley <conor@kernel.org>, 
 Heinrich Schuchardt <xypron.glpk@gmx.de>, 
 Kevin Meng Zhang <zhangmeng.kevin@linux.spacemit.com>, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 linux-kernel@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-serial@vger.kernel.org, Guodong Xu <guodong@riscstar.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251216_053426_803818_AEFB4DD5 
X-CRM114-Status: GOOD (  11.88  )
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
 arch/riscv/boot/dts/spacemit/Makefile        |  1 +
 arch/riscv/boot/dts/spacemit/k3-pico-itx.dts | 25 +++++++++++++++++++++++++
 2 files changed, 26 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/Makefile b/arch/riscv/boot/dts/spacemit/Makefile
index 95889e7269d1bae679b28cd053e1b0a23ae6de68..7e2b877025718113a0e31917eadf7562f488d825 100644
--- a/arch/riscv/boot/dts/spacemit/Makefile
+++ b/arch/riscv/boot/dts/spacemit/Makefile
@@ -4,3 +4,4 @@ dtb-$(CONFIG_ARCH_SPACEMIT) += k1-milkv-jupiter.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-musepi-pro.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-r2s.dtb
 dtb-$(CONFIG_ARCH_SPACEMIT) += k1-orangepi-rv2.dtb
+dtb-$(CONFIG_ARCH_SPACEMIT) += k3-pico-itx.dtb
diff --git a/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
new file mode 100644
index 0000000000000000000000000000000000000000..0f9d04dd352f5331e82599285113b86af5b09ebe
--- /dev/null
+++ b/arch/riscv/boot/dts/spacemit/k3-pico-itx.dts
@@ -0,0 +1,25 @@
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
+	chosen {
+		stdout-path = "serial0";
+	};
+
+	memory@100200000 {
+		device_type = "memory";
+		reg = <0x1 0x00200000 0x3 0xffe00000>;
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
