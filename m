Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7972CC3DA6E
	for <linux-riscv@archiver.kernel.org>; Mon,  8 Jan 2024 06:50:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=bnK+yvThvnIDXdllgptuTGADE/uBf/OE8YpPXwvfOk0=; b=XGu5AEi4NaJyCr
	N7pAWfVz1eOjgrFAZcMcTuQ/8Kol0pqntYJxjxuMwpo3nMkVpkchYh+Vs1Y8jUOMw27yDt7nk5jzs
	cl+o03vE/mgMf3iEgvKJeKlri4W8VU2degSkK7U1eiT6eFk1e7DEspZ+LJAGg0mJZbh4zxGxc/Qgq
	8ZMfwJ2M5NMWHtQ5sOxDdnG6bUO3gqtQ6EGFcM5N0YPROwxCy07mbwBJ9IkfQ238vjit1xv3SEI+o
	MJZ4KM2MX0FHFY2JBAVxbghgsDLEt0T3kwZBLmn5SQzMi12KjYo8NxALRUF4IrMS5F1Oocrtn/uCt
	xFu5Kv/FDv1LFZTAkbsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMjSb-0046qx-2C;
	Mon, 08 Jan 2024 06:50:09 +0000
Received: from mail-oa1-x32.google.com ([2001:4860:4864:20::32])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMjSZ-0046oM-0B
	for linux-riscv@lists.infradead.org;
	Mon, 08 Jan 2024 06:50:08 +0000
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-2043e721daaso1361509fac.2
        for <linux-riscv@lists.infradead.org>; Sun, 07 Jan 2024 22:50:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1704696602; x=1705301402; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PK7rFBBfXgKkr6a1SrOgShSCoWN7R3rCy+5wKL2xaF0=;
        b=FX9e8Wqt/ptxe/HOk54Agc+2AU4eC/XroJiF2MJpZMdW6vYxIBDgVL+vYP/walHdW7
         X9fleawZXlzW1qtw7aIK5DlMioMxIoVnDHaHcgTfzbzsBIPeckcDjnnxPXzHQ6uoNHj6
         h3M3JEeEAjvGSEECNJlkiB/U2ZYsEdkfDxSXHSS4GJKfv8yEYZnfxPB0JkY1LYlPSD9K
         VNNIeCv5BdvGYxKgrgDSn8054dbSB7woXaXbels2B4UCVcsHfOwP3RwovpDQDdUmdnVO
         A2CqfJCzRAx1W7qjhigpk0/yPFUekKHzv9u5ih6oFps4k4M0mxU1vu7eln65NMlizl89
         xwnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704696602; x=1705301402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK7rFBBfXgKkr6a1SrOgShSCoWN7R3rCy+5wKL2xaF0=;
        b=jbzntI8j/vMcZnL35oOhAurOFHtneyixllFnORNSl+Hakd8BZXaQFtjNJzwwjwUP2d
         5pcxc2igUbZE2bjh/Hx3L6GYpeozSYT+Qyc1LMnBvvqBOaBEoIGPVhFP+YFB+aT91e4Y
         BQQsCI770S8TsfhH9wJuC4rWQvzhgzsAS8g7cZxeCGlYTfmb84R01337YmDcqFpgZTo5
         Cje/POVj0k+jzFwqYP6A3wtTVnWIkfHUiM885+Tq/5XTq1yHpQ3m3lfKnIuoxuMZP3/g
         40IU6NgslxmyHhO7GxQPjdpGjIod76WXYU1Ghu/KpUlxmM/UPXxV1dFoqbknjQ8W4x4n
         NJGQ==
X-Gm-Message-State: AOJu0YzBZ881dYBQqmku1LMO2izlB+P8divcm0mtW+HDzX4VYvNXcv53
	HimN+wqNU6YuRuYvE2fkV3E=
X-Google-Smtp-Source: AGHT+IFTdFMRuz/SQJG/sod7IGjWs8IgoYHcIo0BMp9OVvd7RzaZctPz1Ug/WzRhWHrcnlTk97fofw==
X-Received: by 2002:a05:6870:3d8c:b0:205:c5c3:7a5d with SMTP id lm12-20020a0568703d8c00b00205c5c37a5dmr4937937oab.31.1704696601858;
        Sun, 07 Jan 2024 22:50:01 -0800 (PST)
Received: from localhost.localdomain ([122.8.183.87])
        by smtp.gmail.com with ESMTPSA id s19-20020a05683004d300b006dbf6784271sm1282994otd.75.2024.01.07.22.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jan 2024 22:50:01 -0800 (PST)
From: Chen Wang <unicornxw@gmail.com>
To: aou@eecs.berkeley.edu,
	chao.wei@sophgo.com,
	conor@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	palmer@dabbelt.com,
	paul.walmsley@sifive.com,
	richardcochran@gmail.com,
	robh+dt@kernel.org,
	sboyd@kernel.org,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	haijiao.liu@sophgo.com,
	xiaoguang.xing@sophgo.com,
	guoren@kernel.org,
	jszhang@kernel.org,
	inochiama@outlook.com,
	samuel.holland@sifive.com
Cc: Chen Wang <unicorn_wang@outlook.com>
Subject: [PATCH v7 4/4] riscv: dts: add clock generator for Sophgo SG2042 SoC
Date: Mon,  8 Jan 2024 14:49:53 +0800
Message-Id: <25650372c373b15309cd9f3822306838e556d3c7.1704694903.git.unicorn_wang@outlook.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1704694903.git.unicorn_wang@outlook.com>
References: <cover.1704694903.git.unicorn_wang@outlook.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240107_225007_115601_FDA8D813 
X-CRM114-Status: UNSURE (   9.82  )
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

From: Chen Wang <unicorn_wang@outlook.com>

Add clock generator node to device tree for SG2042, and enable clock for
uart.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
---
 .../boot/dts/sophgo/sg2042-milkv-pioneer.dts  |  4 ++++
 arch/riscv/boot/dts/sophgo/sg2042.dtsi        | 23 +++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
index 49b4b9c2c101..0b3b3b2b0c64 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
+++ b/arch/riscv/boot/dts/sophgo/sg2042-milkv-pioneer.dts
@@ -14,6 +14,10 @@ chosen {
 	};
 };
 
+&cgi {
+	clock-frequency = <25000000>;
+};
+
 &uart0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/sophgo/sg2042.dtsi b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
index 93256540d078..c9616d111905 100644
--- a/arch/riscv/boot/dts/sophgo/sg2042.dtsi
+++ b/arch/riscv/boot/dts/sophgo/sg2042.dtsi
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/sophgo,sg2042-clkgen.h>
 
 #include "sg2042-cpus.dtsi"
 
@@ -18,6 +19,12 @@ aliases {
 		serial0 = &uart0;
 	};
 
+	cgi: oscillator {
+		compatible = "fixed-clock";
+		clock-output-names = "cgi";
+		#clock-cells = <0>;
+	};
+
 	soc: soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -311,12 +318,28 @@ intc: interrupt-controller@7090000000 {
 			riscv,ndev = <224>;
 		};
 
+		sys_ctrl: system-controller@7030010000 {
+			compatible = "sophgo,sg2042-sysctrl";
+			reg = <0x70 0x30010000 0x0 0x1000>;
+		};
+
+		clkgen: clock-controller@7030012000 {
+			compatible = "sophgo,sg2042-clkgen";
+			reg = <0x70 0x30012000 0x0 0x1000>;
+			sophgo,system-ctrl = <&sys_ctrl>;
+			#clock-cells = <1>;
+			clocks = <&cgi>;
+		};
+
 		uart0: serial@7040000000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0x00000070 0x40000000 0x00000000 0x00001000>;
 			interrupt-parent = <&intc>;
 			interrupts = <112 IRQ_TYPE_LEVEL_HIGH>;
 			clock-frequency = <500000000>;
+			clocks = <&clkgen GATE_CLK_UART_500M>,
+				 <&clkgen GATE_CLK_APB_UART>;
+			clock-names = "baudclk", "apb_pclk";
 			reg-shift = <2>;
 			reg-io-width = <4>;
 			status = "disabled";
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
