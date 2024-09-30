Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87041CDD1D6
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Sep 2024 19:52:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=04+x4o5Y37gNWFJJqEc0MnK4RWHsCLL+3eye33WoVaA=; b=3PRhRAi+fI7xhA
	W8+UaCS18CEKr6+DI3+ghccSoKkn9OnEPyRg0HsZT0Zrvs8/AFqRrl8SFSJekTRoY7d7XRCXbYHw3
	biILw1RPa3j82BDt4M1P0pwyQtLShtOAefoFCp0L6w9yJ/4sXYtMrzW5V+vSDKaZSKYZl6eSEQnyw
	eP+iFbB6AFmcVU9NROuFbW7Y0dWK6AcVVwp2GfRl3OSt3pYoTMAb22l6xqeu7n/HshSzRD+dKTRzH
	NQcIltzmb2oTW4rMlUFOvVqECxDuJ443dyc6bKXOgRjNPTi35IWxOj9jEmzvTveZ/RLJSHyfQJcul
	Ia4DD7qBxn70MDTX8zBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1svMRG-00000000gAX-3Hhe;
	Mon, 30 Sep 2024 19:52:10 +0000
Received: from mail-pf1-x429.google.com ([2607:f8b0:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1svMQJ-00000000g3X-2jKu
	for linux-riscv@lists.infradead.org;
	Mon, 30 Sep 2024 19:52:10 +0000
Received: by mail-pf1-x429.google.com with SMTP id d2e1a72fcca58-7178df70f28so3736254b3a.2
        for <linux-riscv@lists.infradead.org>; Mon, 30 Sep 2024 12:51:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1727725870; x=1728330670; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FOENnbNZqVpEixBn4r5uT9yCBf3nvHWmxb3PiDsNikI=;
        b=dMDVRtPqpRQ+hQ64XUdedv62yOTQPSSJd8jDQyG0qEVYE5EsB13l6JYVvuCfqjJSHk
         V0gEmsW3ER0ok5mHBT9O3ytTHbhT8f93jbFDHirIR2dD05AFYL1lhwBBGEcPaju/0ZR2
         BRanODCqlttXQFuOgFIau/MWvQv8ZQnP4gxozL2yKa5bFQfeuXvLFQNhGeVJRPzKrozl
         AlZrzI/Q6nzUzClnrBwimoMQUxMxZney2SJiFc3VyzkZR4EX+cdZu61CHaNtYsqSaA8i
         hPsVcNq/kmLT3+oK+zRVYZ5RacBIYDG6MRHFwr2v6fv3YDOM4WI0q2wnl+qxLMFknkeE
         9umw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727725870; x=1728330670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FOENnbNZqVpEixBn4r5uT9yCBf3nvHWmxb3PiDsNikI=;
        b=F6QBLAMxNsl7l+p9oB3C3aiBw8e3gPtZSfqlRKUfkoXqRo/W2D+4M5oD8yrhrzRKob
         CDR/gK9YjfEMh59UEOhVX2+bYnrM4ENbaT0lIwWSBDXiQqXJh/eo5unORCUH/Hc7KdKM
         xqXd+8p/nccB1XiN59GZvZA/xmG7AKspUB0UmkA6FZH5TBMaEcKSyv1nQf0BCjo3mtRD
         I2Sj6XSCWa51Gy1sNkn++VCGeuVBFp9Kq6Qvp3Tu7H7LOuExlstfSfYqgYdfYzjaqqzn
         Cu0AO1jsLYVJmX1RJQzwtbWav7O+0hJlc2m2MU80RkFl3uiDuWNBTxC/8hzZTRg4wEg+
         qxUg==
X-Gm-Message-State: AOJu0YwhwULamKlpNfbewttfYMg3xhQ3fI7IlUYDVSw4J0y0Hc7ptz26
	RkndPR4B9lbvQ2klTX3sVp0C/3eyqZQQrxY2XwsVVRhSfzR9OGpHEMZqqHHKPDw=
X-Google-Smtp-Source: AGHT+IE9wVO7c8Ywho+AqEJCOVbrSywl/1iA5AQOkKx/691Hbnt4288WiAeavD6A4I7Z24WVnR/k6Q==
X-Received: by 2002:a05:6a00:3cce:b0:718:cabe:aa8 with SMTP id d2e1a72fcca58-71b26059666mr21143692b3a.18.1727725870528;
        Mon, 30 Sep 2024 12:51:10 -0700 (PDT)
Received: from [127.0.1.1] (71-34-69-82.ptld.qwest.net. [71.34.69.82])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-71b26529d4bsm6630213b3a.158.2024.09.30.12.51.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Sep 2024 12:51:10 -0700 (PDT)
From: Drew Fustini <dfustini@tenstorrent.com>
Date: Mon, 30 Sep 2024 12:50:53 -0700
Subject: [PATCH v3 3/8] riscv: dts: thead: Add TH1520 pin control nodes
MIME-Version: 1.0
Message-Id: <20240930-th1520-pinctrl-v3-3-32cea2bdbecb@tenstorrent.com>
References: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
In-Reply-To: <20240930-th1520-pinctrl-v3-0-32cea2bdbecb@tenstorrent.com>
To: Drew Fustini <drew@pdp7.com>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>, Linus Walleij <linus.walleij@linaro.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Emil Renner Berthing <emil.renner.berthing@canonical.com>, 
 Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Cc: linux-riscv@lists.infradead.org, linux-gpio@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Drew Fustini <dfustini@tenstorrent.com>
X-Mailer: b4 0.14.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240930_125111_733325_99500EBD 
X-CRM114-Status: UNSURE (   9.85  )
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

From: Emil Renner Berthing <emil.renner.berthing@canonical.com>

Add nodes for pin controllers on the T-Head TH1520 RISC-V SoC.

Tested-by: Thomas Bonnefille <thomas.bonnefille@bootlin.com>
Signed-off-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
---
 arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts |  4 ++++
 .../boot/dts/thead/th1520-lichee-module-4a.dtsi    |  4 ++++
 arch/riscv/boot/dts/thead/th1520.dtsi              | 27 ++++++++++++++++++++++
 3 files changed, 35 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
index 497d961456f3..e88b4fce755e 100644
--- a/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
+++ b/arch/riscv/boot/dts/thead/th1520-beaglev-ahead.dts
@@ -45,6 +45,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
index 78977bdbbe3d..bf1c639072b8 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-module-4a.dtsi
@@ -25,6 +25,10 @@ &osc_32k {
 	clock-frequency = <32768>;
 };
 
+&aonsys_clk {
+	clock-frequency = <73728000>;
+};
+
 &dmac0 {
 	status = "okay";
 };
diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
index 6992060e6a54..e4eda2a76595 100644
--- a/arch/riscv/boot/dts/thead/th1520.dtsi
+++ b/arch/riscv/boot/dts/thead/th1520.dtsi
@@ -216,6 +216,12 @@ osc_32k: 32k-oscillator {
 		#clock-cells = <0>;
 	};
 
+	aonsys_clk: aonsys-clk {
+		compatible = "fixed-clock";
+		clock-output-names = "aonsys_clk";
+		#clock-cells = <0>;
+	};
+
 	soc {
 		compatible = "simple-bus";
 		interrupt-parent = <&plic>;
@@ -354,6 +360,13 @@ portd: gpio-controller@0 {
 			};
 		};
 
+		padctrl1_apsys: pinctrl@ffe7f3c000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xe7f3c000 0x0 0x1000>;
+			clocks = <&clk CLK_PADCTRL1>;
+			thead,pad-group = <2>;
+		};
+
 		gpio0: gpio@ffec005000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xec005000 0x0 0x1000>;
@@ -392,6 +405,13 @@ portb: gpio-controller@0 {
 			};
 		};
 
+		padctrl0_apsys: pinctrl@ffec007000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xec007000 0x0 0x1000>;
+			clocks = <&clk CLK_PADCTRL0>;
+			thead,pad-group = <3>;
+		};
+
 		uart2: serial@ffec010000 {
 			compatible = "snps,dw-apb-uart";
 			reg = <0xff 0xec010000 0x0 0x4000>;
@@ -538,6 +558,13 @@ porte: gpio-controller@0 {
 			};
 		};
 
+		padctrl_aosys: pinctrl@fffff4a000 {
+			compatible = "thead,th1520-pinctrl";
+			reg = <0xff 0xfff4a000 0x0 0x2000>;
+			thead,pad-group = <1>;
+			clocks = <&aonsys_clk>;
+		};
+
 		ao_gpio1: gpio@fffff52000 {
 			compatible = "snps,dw-apb-gpio";
 			reg = <0xff 0xfff52000 0x0 0x1000>;

-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
