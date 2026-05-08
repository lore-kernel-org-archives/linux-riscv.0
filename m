Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68E13CD3436
	for <linux-riscv@archiver.kernel.org>; Fri,  8 May 2026 11:44:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=U5DcfApWzWa1jAx8T0WxdyF92ZFtzj+/7oisx92pVVg=; b=ocpSdbd4FSlHP/
	AQ94+W4jLceLTmILuBvJN8tKF+iCXTpoIDXuVTx7rRZDWiHlHRkRJYuVmyLkOVCRiIbneHgAILi7K
	Cq79ZJB1YEa470OQZ98GVZ7qydaNyjFd4q9nxJ/UjcMrTQFyaF2FDUXIMTaEbvxl/t1v5ddQ0HZyH
	tAn/ToGoZMOqIV3uV4FUsKOKPaghi7GgKl8VbPzZSUXuzNhHPGVm+WHAyx3aTuCdtQdM/efjWa0DY
	dLSd6GWkjdAEU9aEGK0AErYAqOiyJpNaZUNNnRkKeLmjWIMS9vHP1yQpLzYSaiqUkoVhWFCGmdEL3
	FDMK5+iCOtOAGgy6Ay/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdI-00000006Nj8-0ajl;
	Fri, 08 May 2026 11:44:40 +0000
Received: from mail-dl1-f67.google.com ([74.125.82.67])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wLJdF-00000006Ni9-3iym
	for linux-riscv@lists.infradead.org;
	Fri, 08 May 2026 11:44:38 +0000
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-130b2295ed0so5601757c88.0
        for <linux-riscv@lists.infradead.org>; Fri, 08 May 2026 04:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778240677; x=1778845477;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=w3QTpGGqX4AyMp5PIUh+gEtcvVB1vqrLPaWjuq2hLAc=;
        b=ABoxIbMOGSAMbVhQWSCTQtlTwo6LTAEDe/Xmu0ztW+Cj/nQCgy0n8t7iB3jIkPqxqk
         RS8xjdOLow2VkC0+EwBbUC7gS2rW552bzdiqXuDnnltVduchfxe9Ncm/cXLC/UWn9T+6
         GA+IOuGAan0iSiCv6NmVundBGKNqGh8EqQpn8bmFpRq06sNKKyE3NRaqMJ+QX0F4arMr
         C0wn1CBbieYWcP/SwKCj5bk/KVXNkA+xEcESzMR9V5Zjyav7pv7dIfmU+6wwcHbr9yRg
         bH4yBhrzd0Jf0GhGuE6QUU2pa8WS+bXdZ3FnO390a+wHKN8xAsqosOp3dwHcG4XvoDZR
         4FXQ==
X-Forwarded-Encrypted: i=1; AFNElJ+nythFLNkGpU6fA2kJgL80kS9lI/3dLGX4oZf5TTzBC/U95fZl9kJGxWllfIuxmD5eMkG8o9IFQV1gQA==@lists.infradead.org
X-Gm-Message-State: AOJu0YzUnpecx3G3ElF+BFxocivUMFovhXT+nX/OTiyMkBPSGp/PtM22
	IwEf8rCChMiBWc+wg5gwW7cfarQFqILBxpgF6yc1oWOO1JPnb2+kumUS
X-Gm-Gg: AeBDiesk70UyaVk7eUAKYLlAtUI9jOC3w2PKtvtb6Hizr42YzAtpSdZ7l9QUf9Rnuy5
	66CtqZB+AQC6hBXLdIq5+v9MlHvmlggYdqH9UztKpPx6Juo6rLVOJVh1XhLrWATxwBelxRTDX4H
	pRzzvY18JJMWRrqp1Qs982p3DlvboHc6O06kwhss8n/RcF6hcDVY2Iz4tPcdnZ2zrxvBD4f8W2t
	Q5A/4ZaFsMQnrkO3FTYsY3jp+cFv8LkR42uFQEILCw6asgyxk2hkG53M+PPfo12jFGwz2MMDdGo
	9SVbQrywlvg9VyKWD9y0ZNdvik+YvRmew5P468KPMrcia/h8qNrqWKUnCqSnItUqt02mRYolIni
	JHzLNqDNIt/3ze1uSjkgXlTL8B4R625nw+ovgczBfJ1/b6oTmhAe66egtArYRGou6zj7Veu1jFT
	mTVjBvUIcXUw==
X-Received: by 2002:a05:7022:6712:b0:12a:949b:b9b with SMTP id a92af1059eb24-1318e9173d4mr5838723c88.23.1778240676971;
        Fri, 08 May 2026 04:44:36 -0700 (PDT)
Received: from [127.0.0.2] ([154.17.237.246])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13278210f55sm1979131c88.5.2026.05.08.04.44.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 04:44:36 -0700 (PDT)
From: MoeLeak <i@leak.moe>
Date: Fri, 08 May 2026 19:44:14 +0800
Subject: [PATCH v2 2/2] riscv: dts: thead: Enable WiFi on Lichee Pi 4A
MIME-Version: 1.0
Message-Id: <20260508-lichee-pi-4a-wifi-v2-2-7acf63559e62@leak.moe>
References: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
In-Reply-To: <20260508-lichee-pi-4a-wifi-v2-0-7acf63559e62@leak.moe>
To: Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>, 
 Fu Wei <wefu@redhat.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 MoeLeak <i@leak.moe>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2167; i=i@leak.moe;
 h=from:subject:message-id; bh=yE7UXydnGV+TCsvBA4xH/TqHmFApYe6F012/0U1LjEI=;
 b=owEBbQGS/pANAwAKAdIQkqz3TgiQAcsmYgBp/cyYGIFrfNNvNUNKznNnMhIryykYfUSNoAv5V
 6PfXcZZhtaJATMEAAEKAB0WIQR9GaDYhgIayZrpu/3SEJKs904IkAUCaf3MmAAKCRDSEJKs904I
 kD6CB/4jEXm4AG/cQ4Tn1MTjwxG+UXZxKpKJ0R8THM0lfooLHcPJTHw8EMJBHKQ78zfSjjpR33n
 poOrSREmAT8np7hZKzS6m2nuRAgy1lMML1g1plhj9T/GVG+nAQje7ks13wghR9BaGVfAKR9iy24
 Y1pxSEEMyU2gFWVhghCNu2XBL2lJeSrjRHdrT6w4+UiunNW3FsaSMnYfRIFgo7b0St1WulSr57E
 zMAd27sXRQXUak686RMizW76zksnRbxvP6NBpDyWr3kfXaLLCWlkom42v/1fdVs7DJhZkVa3i8D
 J7dnm0LozTcTI1Qlt21dozwq9RASC0CC2586Dgh4n/97D9cr
X-Developer-Key: i=i@leak.moe; a=openpgp;
 fpr=7D19A0D886021AC99AE9BBFDD21092ACF74E0890
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260508_044438_011362_546087B9 
X-CRM114-Status: UNSURE (   9.77  )
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

The Lichee Pi 4A has an RTL8723DS WiFi module connected to the TH1520
SDIO1 controller. The module reset line is driven through a PCA9557 GPIO
expander on the I2C1 bus.

Enable I2C1 for the GPIO expander and configure SDIO1 as a non-removable
4-bit SDIO bus using an mmc-pwrseq-simple reset sequence so the WiFi
device can be powered and enumerated.

Signed-off-by: MoeLeak <i@leak.moe>
---
 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 47 +++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
index 7cb7d28683bc..af6f25ebbf60 100644
--- a/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
+++ b/arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts
@@ -4,6 +4,7 @@
  */
 
 #include "th1520-lichee-module-4a.dtsi"
+#include <dt-bindings/gpio/gpio.h>
 
 / {
 	model = "Sipeed Lichee Pi 4A";
@@ -40,6 +41,12 @@ hdmi_con_in: endpoint {
 		};
 	};
 
+	wifi_pwrseq: wifi-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&ioexp2 4 GPIO_ACTIVE_LOW>;
+		post-power-on-delay-ms = <200>;
+	};
+
 	thermal-zones {
 		cpu-thermal {
 			polling-delay = <1000>;
@@ -96,6 +103,20 @@ fan: pwm-fan {
 
 };
 
+&padctrl1_apsys {
+	i2c1_pins: i2c1-0 {
+		i2c-pins {
+			pins = "I2C1_SCL", "I2C1_SDA";
+			function = "i2c";
+			bias-pull-up = <2100>;
+			drive-strength = <7>;
+			input-enable;
+			input-schmitt-enable;
+			slew-rate = <0>;
+		};
+	};
+};
+
 &padctrl0_apsys {
 	fan_pins: fan-0 {
 		pwm1-pins {
@@ -132,6 +153,32 @@ rx-pins {
 	};
 };
 
+&i2c1 {
+	clock-frequency = <400000>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins>;
+	status = "okay";
+
+	ioexp2: gpio@18 {
+		compatible = "nxp,pca9557";
+		reg = <0x18>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&sdio1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	max-frequency = <198000000>;
+	cap-sdio-irq;
+	keep-power-in-suspend;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	status = "okay";
+};
+
 &dpu {
 	status = "okay";
 };

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
