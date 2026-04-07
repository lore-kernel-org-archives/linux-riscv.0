Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DD5EDB7D4
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 08:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=LiHeGIyvCscjT+NE3mg+nojFJGzxVpKFA6EO/InRPYU=; b=EBVcVTYo1nKYM1
	qqzO9ewjTZ4c7xn9csjnQIuwV9/s7uqB3NvDSw4/pKnJjjSlZjutRofA6/zIBJmgMYZy7fZ8M8lHz
	JkEPtl2ni0l/YYL1cyb4UacrZDIfN7hjfv3vNwSdLzlnh9L1FzyurZtCciIWSd1Nvr0DeTDbL/CPb
	4h/pBQzUrbUjB/9X3K+za5BH1SGxztVr8+4nnIQoU4DlRsc71EAWX4Ml91FSX3EsC0RbxxZCv0zpF
	WTelIj2KH8M9fIMBNWXvdpXZBnMFkRB5Hnisi7E1WR8GAXdKXTg/cWOC5/1ZG1XyJUTxDWGgrMy9U
	Abc33fSyVcC+GfwwjxQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lM-000000068n4-2k4F;
	Tue, 07 Apr 2026 08:26:20 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA1lK-000000068k3-0jEW
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 08:26:19 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-43cf5fbacc9so2251670f8f.1
        for <linux-riscv@lists.infradead.org>; Tue, 07 Apr 2026 01:26:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775550376; x=1776155176; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kN3bcWaJsQHhIwZ8SKksLHpWgkJwI9t6gAAiBuFLbmI=;
        b=YQAP2SRxBc0ZHWqlykODstvE4vx2ttjOXiB2JKqhMDLpsOAp0KMImKWkb+Kk+cIz0e
         KRgtEgv3H9yUH0sVie8BlYn004N8tVK2zz+58OErUoZIA4jXYglWu3YFKqhyIqiUpl/h
         vsrrWPALTytBcTH3hUvR9wAYVMB4AB1qqjlJFoupCCRCd+FcXgLA0Fr9baUqAarVo2ZN
         O62gp8mSS6ROOtPwiCI3DXRfAmSqdf5HaWUldciTUqtGjXVN6NuyDwJKMsPn0GVpwsEP
         NUaITD6nYrjhdWP3M1tuk01ie6bAERdJ8wUeQzBV4r90xGcBBocluJiOqgRhKvIMeHdk
         91sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775550376; x=1776155176;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kN3bcWaJsQHhIwZ8SKksLHpWgkJwI9t6gAAiBuFLbmI=;
        b=qvigaLcxVJPGkORE/9BgK5Q2rpj742Pfs481qC1N2ttd5yjojGJzl9H/NJE7gWZQzF
         ZPQ1R4R2+KHw8HX9sKnSe5jJvtlF7nzgGgJLVuPIR0Oc65epuP9JIGCZBeyZl5g2c6ca
         nzbGABK2ZZIo7HVEisudRDrUaztTxeDrQuP0DEpPww5ZiD5/hEzB8y8JFzDhxoMV2YS4
         coVhAhNNtcofH/g4tYQN3gWsXsKQIp0R3i/zOqU+OY8ABPngbxP97UkpjdLEfTRGLIBA
         5RMYh0OtAE8tv+zMUzOjQ6oRfbXIKjlozh2eTOi56209rA9EKb3skmeaNqEw6IlvZ1KE
         YXYg==
X-Forwarded-Encrypted: i=1; AJvYcCXf/0wLfbsfgMwQkNMC8LguAdvmsHPffgzpzEUFDwb8tPen+UehfPPax/Bdywp2h75sS92hXhCQqenI3A==@lists.infradead.org
X-Gm-Message-State: AOJu0Ywq2XHKL7wf+G2xYUiSCvyqajje2gAXSq/FKuIkEpMrsCpm5F9d
	vmh+m6al2evk4SbtzRgj/v4ewZmyaMl0vp9xfmxahAYy+jFdgdoZFMMJ
X-Gm-Gg: AeBDievpxVueoQ1z1PQzGY+0I+WSJpFC+4UNuPIaQtp+aWepiaDBBdu/+wp6qG4Udse
	DSzjVav64jsxa/TdU0VSNrVxkVagx1AFB+z7xd/BH2BQB+j1k1AIVHssh6TR6XDibSlbykHm4iX
	6fPRz1RZIr1+nEGxhRBuZ7Ecyn5gBEsjj9rwoom0HYDnEV5rGMLnyo7/LRXfw1EJgGsWIbgKrf/
	SVFfZ6C96CTIwE3IafCBCywy/KpdJUo4jXwBinaO7uCLy68ZQN1jVI6hfm776KcfZm49zLfZVEP
	Xresd5m2kBxU/RvTzJXDyyG5A5qbJJf1AftcRfbO+ibP268kFUbfb6z2fglz9IpJjO0/ecye6qN
	GYcv4QE0WdIILDX1Ycv5XacZcv8n33AfnpiZHZtErCuH4NUfl0xsm0a2FMThaCi4sXkuaL+OgKa
	9z0dREla9444wDoaCLDM/yyUSZwZLg7iNQOS+06uOtx0uiTrfXWAKFW7uNxV/FP6Ju
X-Received: by 2002:a05:6000:2908:b0:43b:9d69:43a with SMTP id ffacd0b85a97d-43d21171c88mr28578084f8f.8.1775550376299;
        Tue, 07 Apr 2026 01:26:16 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm48669958f8f.21.2026.04.07.01.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Apr 2026 01:26:15 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Tue, 07 Apr 2026 10:25:29 +0200
Subject: [PATCH v6 9/9] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260407-orangepi-sd-card-uhs-v6-9-b5b8a1b2bfc8@gmail.com>
References: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
In-Reply-To: <20260407-orangepi-sd-card-uhs-v6-0-b5b8a1b2bfc8@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_012618_276426_7CE8ABF9 
X-CRM114-Status: UNSURE (   9.84  )
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

From: Trevor Gamblin <tgamblin@baylibre.com>

Update the Muse Pi Pro devicetree with SD card support to match what
was done for the OrangePi RV2 in [1]. More precisely:

- Enable sdhci0 controller with 4-bit bus width
- Configure card detect GPIO with inversion
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 66 ++++++++++++++++++++++++++
 1 file changed, 66 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf0a5c4ed852668460db475b9c44cb..774a4640f06562b5632c510e8961e3d8f60a3b81 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -18,6 +18,24 @@ aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
 	};
+	reg_dc_in: dc-in-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
 
 	chosen {
 		stdout-path = "serial0";
@@ -77,3 +95,51 @@ &uart0 {
 	pinctrl-names = "default";
 	status = "okay";
 };
+
+&i2c8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c8_cfg>;
+	status = "okay";
+
+	pmic@41 {
+		compatible = "spacemit,p1";
+		reg = <0x41>;
+		interrupts = <64>;
+		vin-supply = <&reg_vcc_4v>;
+
+		regulators {
+			buck4: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			aldo1: aldo1 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3400000>;
+				regulator-boot-on;
+				regulator-always-on;
+			};
+		};
+	};
+};
+
+&sdhci0 {
+	pinctrl-names = "default", "uhs";
+	pinctrl-0 = <&mmc1_cfg>;
+	pinctrl-1 = <&mmc1_uhs_cfg>;
+	bus-width = <4>;
+	cd-gpios = <&gpio K1_GPIO(80) GPIO_ACTIVE_HIGH>;
+	cd-inverted;
+	no-mmc;
+	no-sdio;
+	disable-wp;
+	cap-sd-highspeed;
+	vmmc-supply = <&buck4>;
+	vqmmc-supply = <&aldo1>;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	status = "okay";
+};

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
