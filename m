Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7038C04A6A
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 17:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=69hWkX+9zYSJpuyjmibk+wnmFSXCmp+GnNLBJxi+5AA=; b=wGF4ndvBuv3+hS
	FDK4l1uTtHIskDY9rcllo5W0MoemV8PBVirK/BWW7yLTzwNA98reuGRWQnOwKTXfLfgNdIrK/UM3D
	nuZbjxGL2GH+r9zUfOZ2gOioMbSxz92Lqb8g4ZWeQmzXzc8X99a9fh416Pa1MzvhmUKKb5g9HCpQX
	kWMNODWVrrmpNwo+iiQn1Kkq8VkGMMuoODupcnHB4tGVJ4UJIwIE6laL4L0YsS26062Xj8+DA53UG
	B/TeY6wS5NenO2GHYNjR8HxYk6vlyUO+P6h5AUMIUYwfoaI4XQ7WtQPWYvyNDAha/v/d6A9dmouu9
	jhbZSNVV1rKpVUtRLfBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEz-004zi6-2o;
	Mon, 24 Jul 2023 17:21:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qNzEs-004zdv-0D
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 17:20:55 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1bb8e45185bso8002555ad.1
        for <linux-riscv@lists.infradead.org>; Mon, 24 Jul 2023 10:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1690219249; x=1690824049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KCtuYQ7QNaClooE6G3dSGVE9TtXBtLYo71yRUwS5dPU=;
        b=CdFex2+MhZGnnx4IEmAkL/3GdExG9WMVZWJ0l4Y838oscSKF5+QY/R8Vy1wksakwtf
         blXYkbGiKYpLrsP8JMJf9Xl1gS3g+fbfl9NNblSrnWb1FEneg+QaM0vE01JvMTwxT9wv
         ToHXLlFS+aBb8qUthqFUogb9Q6QZz3YdulgIO+zjh4M0/H9ZbwE9eWVPXw53oizRb7UK
         zDcTKAvHWgQI6T7qW7XDfxTPTaHEQZvrZWqW1mqc5C1zs8XOTOh06XStK0XboGn5U+mc
         CIzXX0p7OVSfoqEaaebznXgXxKV0NfqL39I5RTys1WEeartsTgDsWtanKNTgTDEbBD5j
         rkAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690219249; x=1690824049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KCtuYQ7QNaClooE6G3dSGVE9TtXBtLYo71yRUwS5dPU=;
        b=NBsdUoxe4Zp3OUp3KeJ+uOJhYJKUS9fzVDeLTZTsly/mp/gD/kg5nUSbhXqd4Pnrmz
         pPEQaHpJFwH0ksHOdIdeGuFBWQdT49QQCVF3z9DQ0iAAbSNlGl65GmfPz3av2CUMoRRt
         yqpXeqYl5R+t+f3VJ8vXs3BC/0DOQuYcmeJvmrKY1cpT5XsXdAbyPSJerQrq4JSEp+Ry
         ZiTtc05VFBZmOXUi89UxCqyRkjotWjnrH6qFlWj12inByu/dDK0eRix1ICI9nu1+x39E
         t5hyk5cDUEmqfOsd45rQkXqggME+kMc7iZLa8Rg81lwdRiDyT4r/GynKxoeG0oJwBoHs
         PhFw==
X-Gm-Message-State: ABy/qLZQ/KVjSl8TIL+3q7kWGyLkjFzZEp0zojLskbxNISDryU4RPrm2
	F793oQ0cUx86bqPUtWNSapHJpg==
X-Google-Smtp-Source: APBJJlErZJ/pO6LUMbtKWF6aJ/wJgkXH0mY9ke7gTP/verUwLEal93A8XCBUwvhe3p3ZXRPc3kPKKg==
X-Received: by 2002:a17:902:eccb:b0:1b9:e9b2:124b with SMTP id a11-20020a170902eccb00b001b9e9b2124bmr8839585plh.64.1690219249500;
        Mon, 24 Jul 2023 10:20:49 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1800:f680:b55a:eeb0:a3a8:248e])
        by smtp.gmail.com with ESMTPSA id ij15-20020a170902ab4f00b001b9cf522c0esm146456plb.97.2023.07.24.10.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Jul 2023 10:20:49 -0700 (PDT)
From: Drew Fustini <dfustini@baylibre.com>
Date: Mon, 24 Jul 2023 10:20:39 -0700
Subject: [PATCH v2 2/3] riscv: dts: thead: add BeagleV Ahead board device
 tree
MIME-Version: 1.0
Message-Id: <20230722-upstream-beaglev-ahead-dts-v2-2-a470ab8fe806@baylibre.com>
References: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
In-Reply-To: <20230722-upstream-beaglev-ahead-dts-v2-0-a470ab8fe806@baylibre.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Robert Nelson <robertcnelson@beagleboard.org>, 
 Jason Kridner <jkridner@beagleboard.org>, 
 Drew Fustini <dfustini@baylibre.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1690219247; l=2200;
 i=dfustini@baylibre.com; s=20230430; h=from:subject:message-id;
 bh=3iMcyn8F5vpX974FPuD2Mj1EgiREUCjkTVViNu8E2AM=;
 b=3oDsab7sLaNAsKvQX0kUdFfcMgCsTHxeSLNNt3TDah9xg2X5fXvKSG07APOmDzMhMUs7KfyAP
 1FNp8Odz+iWCnuoETKPL/BKxhhtWecRQRILe6zi5m1BY8bI+dVEwL/b
X-Developer-Key: i=dfustini@baylibre.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_102054_105289_8ECCAE90 
X-CRM114-Status: GOOD (  13.39  )
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

The BeagleV Ahead single board computer uses the T-Head TH1520 SoC.
Add a minimal device tree to support basic uart/gpio/dmac drivers so
that a user can boot to a basic shell.

Link: https://beagleboard.org/beaglev-ahead
Reviewed-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Drew Fustini <dfustini@baylibre.com>
---
 arch/riscv/boot/dts/thead/Makefile                 |  2 +-
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts | 61 ++++++++++++++++++++++
 2 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/boot/dts/thead/Makefile b/arch/riscv/boot/dts/thead/Makefile
index e311fc9a5939..b55a17127c2b 100644
--- a/arch/riscv/boot/dts/thead/Makefile
+++ b/arch/riscv/boot/dts/thead/Makefile
@@ -1,2 +1,2 @@
 # SPDX-License-Identifier: GPL-2.0
-dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb
+dtb-$(CONFIG_ARCH_THEAD) += th1520-lichee-pi-4a.dtb th1520-beaglev-ahead.dtb
diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
new file mode 100644
index 000000000000..70e8042c8304
--- /dev/null
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/*
+ * Copyright (C) 2023 Jisheng Zhang <jszhang@kernel.org>
+ * Copyright (C) 2023 Drew Fustini <dfustini@baylibre.com>
+ */
+
+/dts-v1/;
+
+#include "th1520.dtsi"
+
+/ {
+	model = "BeagleV Ahead";
+	compatible = "beagle,beaglev-ahead", "thead,th1520";
+
+	aliases {
+		gpio0 = &gpio0;
+		gpio1 = &gpio1;
+		gpio2 = &gpio2;
+		gpio3 = &gpio3;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+		serial4 = &uart4;
+		serial5 = &uart5;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0  0x00000000  0x1 0x00000000>;
+
+	};
+};
+
+&osc {
+	clock-frequency = <24000000>;
+};
+
+&osc_32k {
+	clock-frequency = <32768>;
+};
+
+&apb_clk {
+	clock-frequency = <62500000>;
+};
+
+&uart_sclk {
+	clock-frequency = <100000000>;
+};
+
+&dmac0 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
