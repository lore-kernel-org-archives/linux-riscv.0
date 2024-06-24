Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85B47C30658
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jun 2024 02:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DLFbpuKXvUaw7RC6tvx+Wc+Zbx+SU7tFFZBFxsdzi/s=; b=RZ1KWe+N/hFeLr
	RWGWlPO6yPAGxj5UlgPEQmg2EKP6FeQ/8Y9znzdZ1qo0EXjplVG5RHIIMAehGLOSsrQKq6eMFdIKX
	8zlqv0g1zJ3GWzeLh3qwk3x326NmmJ93dnBQZuZQkXgLp0bwtiL5pUy6T83fqiT6OfWjS851f4oLD
	m3yaNbqac1jZgkD8C7LBSwT0z7w+FltFNfkRaJfLmsJ6z3OoqXUNx5c5rEMSVhN43wWAP79B6jags
	+t3Z70xUxAgDlrgUiBb8HalKPY5BOBYeAAfIB90VcNNMY+gxcJ1ehGZpDx6+v05gKi5IkCWn5N9QO
	Fi1rwkWzY7l/NFAtjMsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFR-0000000FGLs-0Rc4;
	Mon, 24 Jun 2024 02:16:01 +0000
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sLZFG-0000000FGHs-2NBt
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jun 2024 02:15:52 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-7066c9741b7so706339b3a.1
        for <linux-riscv@lists.infradead.org>; Sun, 23 Jun 2024 19:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1719195350; x=1719800150; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0tH6rWt87YBXaBxQCAVQ+Z5WC/hDEvaUvyKWsHR45ns=;
        b=IVJTshYadIF7sFym4H9+ZNLc20KBzGtx+URMKTykdKwnhSMTyecKIRqavDZdMcB8sr
         fAfY5JdstgQoH0GIMOF+cdJdQqgVNAPjMdvJ0jwQtB4O7Y5tPazdhQ62enu8IK4P145z
         xF9oX9ryvgc60PjV7apBjQtS5+vpkbDbFrReKIjpTG+cP+rms9+4DkF8u8jmXdwmSeZe
         bS9o5eihbe7wGOSRdPKVSY/bD5aJCaoFJpba809gCONkoEM1odIjApW2pFassHkBUZN1
         YDvk7wAz/qbAkhXukZpNGuPYJsoegvXeSbvVjKGqQ22Uz/eGZ9KIGCisirWokA1eX6RL
         Rmqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719195350; x=1719800150;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0tH6rWt87YBXaBxQCAVQ+Z5WC/hDEvaUvyKWsHR45ns=;
        b=wjCJIroCP0Mw5cO2fFEIZSKy4baTnDgb3P0rlpYj8F/9vOUmqU4S9hC670AwEZHYbL
         NTu83f7o+b+sFhQqt9hCEteTW0Mn1nnOtRuGHwB/nbmLnUHcrcBnKqWKwdf3nmmC/OWK
         COmd1IixaCUn1JK8dal4a0JEsa6zobEe+zkLrTVqat9MnjbTtfoFqFAyBn66PUWgWQOt
         0ycVfrEqTlhHntoyuPvUZr+yC8YChh9DUy7LY2AwO9iAEWw9CPUzF75M1kU/s4EbdfdN
         I6oewikp04t06wLK1Av4b35mYzxBKZZKUD1Z1eMC2bT8dDCVeFwnunmId9uvagQUh1K5
         0Ztg==
X-Gm-Message-State: AOJu0YzK3ZmVjP8As5S9fAHk69s95fr8ZdvhRp0/LyZvCx8vrGaBV+Yg
	JRIi8CL/FCLdYChJJb3JRY4nQaac2Ah4LOru1aIXm643dg7xcSQ/BcPFp62eQUw=
X-Google-Smtp-Source: AGHT+IEUJLdlkhMcqrUxWGpGRoomP5WHV8JsDb9iG6LQ+cz+fofSU7fQMeosaMpMZ24408AuC/xRzQ==
X-Received: by 2002:aa7:8a10:0:b0:706:6af8:e081 with SMTP id d2e1a72fcca58-70674548c80mr3226939b3a.1.1719195349715;
        Sun, 23 Jun 2024 19:15:49 -0700 (PDT)
Received: from [127.0.1.1] ([2601:1c2:1802:170:1584:936e:5eb0:fab])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-706511b137csm5071770b3a.86.2024.06.23.19.15.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Jun 2024 19:15:49 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Sun, 23 Jun 2024 19:12:36 -0700
Subject: [PATCH v2 6/7] riscv: dts: thead: update TH1520 dma and timer
 nodes to use clock controller
MIME-Version: 1.0
Message-Id: <20240623-th1520-clk-v2-6-ad8d6432d9fb@tenstorrent.com>
References: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
In-Reply-To: <20240623-th1520-clk-v2-0-ad8d6432d9fb@tenstorrent.com>
To: Jisheng Zhang <jszhang@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Yangtao Li <frank.li@vivo.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719195343; l=4851;
 i=dfustini@tenstorrent.com; s=20230430; h=from:subject:message-id;
 bh=CJyRU2euk+h8MQ3uF4akWb8lHgrUYTVPRvEJzPNHbOU=;
 b=mNsn8JF4kFtRIlgga/Xmq9+3MshgDGyu9OUR6HpWzEdWNOwPQV05o7B8GmUXs3Dk7ZQ2mNxJi
 2BPyOgkY7t/CJRA4WBk2A5H8jQn9JkuBsh1SoYfj6/gWb5uq9Mn+hF0
X-Developer-Key: i=dfustini@tenstorrent.com; a=ed25519;
 pk=p3GKE9XFmjhwAayAHG4U108yag7V8xQVd4zJLdW0g7g=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240623_191550_766402_6ACDB956 
X-CRM114-Status: UNSURE (   9.31  )
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

Change the dma-controller and timer nodes to use the APB clock provided
by the AP_SUBSYS clock controller.

Remove apb_clk reference from BeagleV Ahead and LPI4a dts.

Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ----
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ----
 arch/riscv/boot/dts/thead/th1520.dtsi              | 24 ++++++++--------------
 3 files changed, 9 insertions(+), 23 deletions(-)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 55f1ed0cb433..1180e41c7b07 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -44,10 +44,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&apb_clk {
-	clock-frequency = <62500000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 762eceb415f8..78977bdbbe3d 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,10 +25,6 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
-&apb_clk {
-	clock-frequency = <62500000>;
-};
-
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index ce3a0847aa9c..d05002ad7c96 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -135,12 +135,6 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
-	apb_clk: apb-clk-clock {
-		compatible = "fixed-clock";
-		clock-output-names = "apb_clk";
-		#clock-cells = <0>;
-	};
-
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -325,7 +319,7 @@ dmac0: dma-controller@ffefc00000 {
 			compatible = "snps,axi-dma-1.01a";
 			reg = <0xff 0xefc00000 0x0 0x1000>;
 			interrupts = <27 IRQ_TYPE_LEVEL_HIGH>;
-			clocks = <&apb_clk>, <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>, <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "core-clk", "cfgr-clk";
 			#dma-cells = <1>;
 			dma-channels = <4>;
@@ -340,7 +334,7 @@ dmac0: dma-controller@ffefc00000 {
 		timer0: timer@ffefc32000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <16 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -349,7 +343,7 @@ timer0: timer@ffefc32000 {
 		timer1: timer@ffefc32014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <17 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -358,7 +352,7 @@ timer1: timer@ffefc32014 {
 		timer2: timer@ffefc32028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc32028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <18 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -367,7 +361,7 @@ timer2: timer@ffefc32028 {
 		timer3: timer@ffefc3203c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xefc3203c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <19 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -398,7 +392,7 @@ uart5: serial@fff7f0c000 {
 		timer4: timer@ffffc33000 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33000 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <20 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -407,7 +401,7 @@ timer4: timer@ffffc33000 {
 		timer5: timer@ffffc33014 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33014 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <21 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -416,7 +410,7 @@ timer5: timer@ffffc33014 {
 		timer6: timer@ffffc33028 {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc33028 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <22 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
@@ -425,7 +419,7 @@ timer6: timer@ffffc33028 {
 		timer7: timer@ffffc3303c {
 			compatible = "snps,dw-apb-timer";
 			reg = <0xff 0xffc3303c 0x0 0x14>;
-			clocks = <&apb_clk>;
+			clocks = <&clk CLK_PERI_APB_PCLK>;
 			clock-names = "timer";
 			interrupts = <23 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
