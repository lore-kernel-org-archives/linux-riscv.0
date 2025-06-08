Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 262A2C5AD49
	for <linux-riscv@archiver.kernel.org>; Sun,  8 Jun 2025 23:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Su9S7h21D/IS6XrrIVgXXG2v3p+W/JwTvUj5+k/EYxM=; b=NuvzxLebRvcMum
	TFf5BvAjFCR+3fkpXGEL9E+sxWOt41q9T2oJ7/1hvIBOAYSxLHpp/N0MJEH/He4fexHexML9GJukI
	SI9Wp589NiUB1wAg7LwG4Y6TzDpcpE/+rIx7fSjTW5DxZ3XsodNHRfugICNGSd09sMpto/SZVTfcp
	PtdpTOzL+PMwUYqnffY0W938wu/byFnwyYk2Nx23lvkf4hIotHhPoAVcC336DfPVdX5jZm9MkfP5a
	fQNu+o8a/O4s42VOJWisOZb/BLKsvw9qvzcxIFA+NIW6z7HeqkmInrhmabJGPTN9mMsn840/1ycDw
	Pepi3U0QIkRgnRffLjIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSd-000000037Fp-0zum;
	Sun, 08 Jun 2025 23:29:55 +0000
Received: from mail-qv1-xf33.google.com ([2607:f8b0:4864:20::f33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOPSb-000000037EF-1zSm
	for linux-riscv@lists.infradead.org;
	Sun, 08 Jun 2025 23:29:54 +0000
Received: by mail-qv1-xf33.google.com with SMTP id 6a1803df08f44-6fb01566184so31326996d6.1
        for <linux-riscv@lists.infradead.org>; Sun, 08 Jun 2025 16:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749425392; x=1750030192; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e01iukVTtzr1W38d9A787H6idtfIXQJY27IM4e3no+o=;
        b=B69bYciK/5f0tTTKYCZCpVchOHspUR1DA/R0XJi11RssrqNMZLz/xXVSAnFXlrYbZY
         aIHirq5tQYiIJk2nXUN8d+OWh2c2G4TZQ6FPOIEU/WDmrxzjyi7ZuG4r8RbznLlc8+ka
         JRXC8M/PmcgOFNLVmWdvrrwtBwdFpTHdM3/FE+lrUTLn5sPPERNF4mUMKH9zu4D2TcBF
         qUhFg9QYZ66hEC9IfuHAIhexGzx6nLvyRZMr60KsjNfKrFPFl8l13D0YRz2Lwq4oqJLY
         iLTsJib25V+UN6pRn+YvfGG5zraAm3JCxa+6GQ9z5wWynlGx+QwommiUOGEgJRJZeDkK
         85HQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749425392; x=1750030192;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=e01iukVTtzr1W38d9A787H6idtfIXQJY27IM4e3no+o=;
        b=Q0IzrRQIrgGsnjQStDMMCw01+U/icmdlMWUkcVplMNNxdzytZFZLQVWsbklNQXpysY
         Zu4gGagyz9RL93twFpxXoY9vF+Uy1X0pQlLdXyC/URrBlvC6yVWklsuF+NCqoZdMPNNj
         AQvYxwo9uaeaNT5ULuAAkqDbCWCjgxpmiDtipNLz1RSxPGLRwQZdbPBPQkGLZa2UpmN9
         OadS08BORWqGDarxTXlWEgmIBCJDEdUCIK1swKLc0YW4Tawg6+iPi11+Zh4WA3bdJPtT
         985arRb5sS9tSs3h6p6P1dARn9a9AzcgFATyScNfJsAFRv6z7T/CZkY6RuByU4MBhrel
         oO5w==
X-Forwarded-Encrypted: i=1; AJvYcCXRekxI88+Gg4qeCiu44ZldoeIFQFySKSN7nQBt5ckTHUwd7BWclcD+L/TOJspj8gByLfeVUX8dS5A2XA==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyg+0BDrbd2zSCdW97lbxri/fgq5nqv3a+b0U/5sxrEWLHb8DyT
	bUlpAZC/3e15mUHuAsNDRfybc8G247VcIIDB6Be0v1gviqCHrpnliyyj
X-Gm-Gg: ASbGncsouvF3uPXQvtnHQeJW00R4xKY0owQDmZ7E0hiVlk8Kb41DBOAge5e7UHg5i5B
	QGHagYYJSFND5WoFhWFce39ZlJ27R8mYJwnJoDsk08YfrfOID6YaCht9o0j/e19i5iwidW54nqX
	xR5xFzjSGcXH5GWJOS82juTvzZfHZAV6fW676ETDk6/Xcoc4nROVfVDptECt4uDDVHyNrNAFoN5
	rKzmGLbFlv/36S+SjKfJRYexIx6nPWF3efuiEJjRop4P9PFWRDZQlh51Unu9m/6VrN4ittn8stz
	/6WCwGOC5dMwveGxUOBrID9ccMhfGTNGwymUjA==
X-Google-Smtp-Source: AGHT+IHI4CDrPXFr0/NZvPWIdM0m0CmSVQ7zO1EJkq9vwOjsqhwAlmzwrnYunhr2lKOAZxXLpMJWNQ==
X-Received: by 2002:ad4:5ced:0:b0:6e8:fe16:4d44 with SMTP id 6a1803df08f44-6fb08fcc15bmr200667496d6.31.1749425392442;
        Sun, 08 Jun 2025 16:29:52 -0700 (PDT)
Received: from localhost ([2001:da8:7001:11::cb])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-6fb09aba066sm44196886d6.17.2025.06.08.16.29.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Jun 2025 16:29:52 -0700 (PDT)
From: Inochi Amaoto <inochiama@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Richard Cochran <richardcochran@gmail.com>,
	Longbin Li <looong.bin@gmail.com>
Cc: Han Gao <rabenda.cn@gmail.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	sophgo@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	Yixun Lan <dlan@gentoo.org>
Subject: [PATCH 03/11] riscv: dts: sophgo: sg2044: Add GPIO device
Date: Mon,  9 Jun 2025 07:28:27 +0800
Message-ID: <20250608232836.784737-4-inochiama@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250608232836.784737-1-inochiama@gmail.com>
References: <20250608232836.784737-1-inochiama@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250608_162953_515965_2E35D47F 
X-CRM114-Status: UNSURE (   9.41  )
X-CRM114-Notice: Please train this message.
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

The GPIO controller is a standard Synopsys IP, which is already
supported by the kernel.

Add GPIO DT node for SG2044 SoC.

Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
---
 arch/riscv/boot/dts/sophgo/sg2044.dtsi | 70 ++++++++++++++++++++++++++
 1 file changed, 70 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2044.dtsi b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
index d21a59948186..70d1096f959f 100644
--- a/arch/riscv/boot/dts/sophgo/sg2044.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2044.dtsi
@@ -6,6 +6,7 @@
 #include <dt-bindings/clock/sophgo,sg2044-pll.h>
 #include <dt-bindings/clock/sophgo,sg2044-clk.h>
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/gpio/gpio.h>
 
 #include "sg2044-cpus.dtsi"
 #include "sg2044-reset.h"
@@ -90,6 +91,75 @@ uart3: serial@7030003000 {
 			status = "disabled";
 		};
 
+		gpio0: gpio@7040009000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x40009000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_APB_GPIO>,
+				 <&clk CLK_GATE_GPIO_DB>;
+			clock-names = "bus", "db";
+			resets = <&rst RST_GPIO0>;
+
+			porta: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <26 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio1: gpio@704000a000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x4000a000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_APB_GPIO>,
+				 <&clk CLK_GATE_GPIO_DB>;
+			clock-names = "bus", "db";
+			resets = <&rst RST_GPIO1>;
+
+			portb: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+		gpio2: gpio@704000b000 {
+			compatible = "snps,dw-apb-gpio";
+			reg = <0x70 0x4000b000 0x0 0x1000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			clocks = <&clk CLK_GATE_APB_GPIO>,
+				 <&clk CLK_GATE_GPIO_DB>;
+			clock-names = "bus", "db";
+			resets = <&rst RST_GPIO2>;
+
+			portc: gpio-controller@0 {
+				compatible = "snps,dw-apb-gpio-port";
+				reg = <0>;
+				gpio-controller;
+				#gpio-cells = <2>;
+				ngpios = <32>;
+				interrupt-controller;
+				#interrupt-cells = <2>;
+				interrupt-parent = <&intc>;
+				interrupts = <28 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
 		syscon: syscon@7050000000 {
 			compatible = "sophgo,sg2044-top-syscon", "syscon";
 			reg = <0x70 0x50000000 0x0 0x1000>;
-- 
2.49.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
