Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E711BEC01C0
	for <linux-riscv@archiver.kernel.org>; Mon, 23 Mar 2026 10:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/ivNAHJkm8x69ZuBEf2Pnx8cLMqCIwW0qN7Y30YGVhQ=; b=ptMs6a7LXg239n
	FAxfs2M+5iUfNhJpeZYSfrobkxHf1KUQxqLiud/BPlYD1iwvGvxEinH3IUJYWi3zM5NSoyf9ix7rQ
	V+sfuFWlzUGuq/fbouRt7ko9Ucu8/cnLA8p8gik4gvlsLWdgcjw48eXplJrraXZR4+FSESJ6xqlf7
	jFOFyPSIXvry9LgsIHrFIwPbyg100GsH6nxi71FNYOiuX+HuLxkH+Qk7C3SCrOxrqSmrS+XfNB8qN
	i3riz7fR+BXHmBjhcSbx/igoTkUD5j19yfNth42JggGO607bZ70YPhDP3iHg5aWDUM5C4kbsV+Ntp
	ypNQNmTuqccxbmReS82g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNy-0000000GU95-1vns;
	Mon, 23 Mar 2026 10:19:50 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4cNv-0000000GU6m-2rmt
	for linux-riscv@lists.infradead.org;
	Mon, 23 Mar 2026 10:19:48 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-486fe655187so35267485e9.2
        for <linux-riscv@lists.infradead.org>; Mon, 23 Mar 2026 03:19:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774261186; x=1774865986; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=W4O8VldANEqcI6pDWkO6xYoMTCqOonfd6JYAkTZH/7VlUanR/ZWBABjedOae60mGpP
         CESpzbvYHfzlDyGwls0l6dtWLh5vMLcmzQHtHJOZTg+9ZIeuo8ujNzEXlrTKnK9AFDEb
         S3QOiiAzWdvFbAHCwgVFaBFFIvmj9EUc/Yb4YFOczPMI4EY0Eg/lQUZK5y+nqH+PKFaM
         t8+6yVwpBjBuVHwXhHehpu5vnvJXnoJUkyFaoVJAnw8yfA98R0MTVRHwApujSk7K0/vZ
         CyqkSsnmVO8aK0/ECrWCFshyra7+GcPMbW79SJmJJZeXmh2U9FUx1RmfjbvrYk40ouUl
         nJaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774261186; x=1774865986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=s2b3A5VlJa4lpM7E2GeEDRbbHgTsaHKFUASwgrv7Rf4=;
        b=FHOUkYU4T3gWhxLfgWsEYrZIIGok+1Fo/LOq9KJUtw6INv70hYPrNimBTCCZMHsNiZ
         SGy7Nzp7XiKMsF5AGBAlZJSJ4suVegxxK19bdmYV9FRM56AvizX/w9JOz3Psdy/Q8lqg
         KGR/LEJAKQX7WZ168MfJZWGsqelvADMqiz2Kkt+EKWQ9fsLlkmcB9nYwkPElP84rBM/O
         ZWJqBas7XtH7UKcMgqtswKkfPXza/FmWE+jvapU4B2ru1gs2TBN/YHNKGuoXd4WL/Xs8
         s8zILRJApW1tWYKy0sHjsBA8NB+8O7f2zHLp0t4aq0G61ltR+i7HlugXftisAt5iiZFt
         7sqA==
X-Forwarded-Encrypted: i=1; AJvYcCVk4proTaSHZRCYKDGb7txCQE1BFIwg/EMArbP05GoShIJXFBbjif6HApZA5swZ6yqI/hRvcglaTOWGLQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzA/y6bOfZpJegje3+RGuEge33Amwe+wg/LE1ejQVn/Df+kAK3G
	tAKDTstqUutQepzCD+L4Tys9rMnworLDsyJ9plbnT0WDIAHssvspd7R0
X-Gm-Gg: ATEYQzznij73dkt2qEh2M9kTK5qBlt+DMaU/Cuy69tevaWxBOfVsV60z1I9LuCmLeLr
	ul1yw074o6Vi9CjjFZsNdS0twQq8TT1VsPHvdis17VoTWNB7nPBhi8NgE5biB1BL2rraVfb4A2J
	4/QdqJUo6+3Ws9Jf0nqpLRfqsfH+sZfPvaI67cbhzkgYhjaB9P8iZP3OzotdFNg+0NUUd3KpuqV
	8lfAuYWxQU5YnaVVz2hQsnjGfogMUszWaYzTy8yc7Is1t9+mfqIXMXAnlmZwsGePAL0x66RcCu6
	C91ZWX9oXFLBh8BIHKS4yKikwRi/u030XpJZc/e3LTBBMREIKb0yCg8vydurHm79mjClehQcdRj
	jBtmFEHxDZY9Xj7qx55dKN4Uj2nX8T4Ga4FY7alBdc5ukCyfTuij+Ur5nYEAnBJDFKXRBTKx5aH
	0LE2c+U5y4rPdtLJvZWnpVXSjYadwpxT7TtPeRKO+Mp3BMzaDBYoiSjr9WXInsAukx
X-Received: by 2002:a05:600c:530f:b0:485:2ce2:4c87 with SMTP id 5b1f17b1804b1-486febb455dmr171394665e9.4.1774261185644;
        Mon, 23 Mar 2026 03:19:45 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.232.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-486fe86acb0sm78755445e9.6.2026.03.23.03.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 03:19:44 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 23 Mar 2026 11:19:11 +0100
Subject: [PATCH v4 8/8] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260323-orangepi-sd-card-uhs-v4-8-567c9775fd0e@gmail.com>
References: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
In-Reply-To: <20260323-orangepi-sd-card-uhs-v4-0-567c9775fd0e@gmail.com>
To: Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260323_031947_744069_6983FB26 
X-CRM114-Status: UNSURE (   9.79  )
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
index 29e333b670cf0a5c4ed852668460db475b9c44cb..b63723978a4b5317c506c6df6ad410d23b0f0ea0 100644
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
+	pinctrl-names = "default", "state_uhs";
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
