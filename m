Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8FDFEBFD10
	for <linux-riscv@archiver.kernel.org>; Mon, 13 Apr 2026 08:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=/3KmEHV+iQvPfnF7MVnfrS49+Y8iRMBWvP+Pr5uDOOU=; b=O7tPOYaJteofaj
	cpGtg52JNpSJSOC/D3HVBZ8ktiR6HOgwoZR5ZpRSXTuVj+wodAADQy5+PABzrvxcrJg47CRGb8e5p
	SwQ7A3bQDtN3QuKH65WyJOgnvqd+c7vG7qJfkqRyJ66S4jQ+oaFce02KlihKT0dK4jtOVIDALaor6
	gSaM/W9serYtpl0IW2vknazIH09y7ytQvce2PP8stGpz0a+HrtpO6fC4rXUZKc8HCsG+DO3AyxIk4
	hhF3p04jJFwZllVKROpPWnWeOaz1qdpzTJmWcVe24QWnKVHcaRSZCW2OPz9wSgwZwJcbmeDLxp8kN
	NAbTEXHdGNq5YObRF4Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFv-0000000FDEu-2TBH;
	Mon, 13 Apr 2026 08:02:51 +0000
Received: from mail-wr1-f52.google.com ([209.85.221.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCCFt-0000000FDCc-0s7n
	for linux-riscv@lists.infradead.org;
	Mon, 13 Apr 2026 08:02:50 +0000
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-43d01d6b50cso4157393f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 13 Apr 2026 01:02:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776067367; x=1776672167; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=fagmyfAzuvoHj5oWDKNzGi/zIdf0brgWQYfR913fwLzYnpcZcyzxf9puo1/6pNbDmw
         wv804EuxPvGkMT/PNzxsZBFuJskqPd6MePCR9t6zli/1VZjtU30T6X1SHHIskpfsIRX4
         Jc/RDrMFnXJQ5G6LYViwroK1SQVgpxtUEByt+Pf5ZLq5hK6W1go5QnSWVWUgrRtHba0Q
         AEKMFJUIafmSdm67E215k8340JhKI4FYm5yhlfr/EHWsehbFr7yRFqjE7GtnBS4AJ9Ig
         xJiaJ5CzXSHWy3ZEf1+eZ6Vo62+srv0SysWs5o0aeCveTcr7PUc0jmhCEtJFySUzxXYI
         qnIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776067367; x=1776672167;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1Bt7k0zpH6EPz3nKG6vw5G/jzVLlNuWcFiRyZwuaAKY=;
        b=UIDhJjmvySdXiJb3nifMuRHPFpSJRSPPoEDlOd4vAsnlf+Uz6/vyv4wDevgCnfWmK9
         s1Wm/YvszE0TT1axjCsYp9Gjfw4jEpuzcc+bevOsm9q4fkrAP0ROpb3rfrLB3tRM7ZSj
         OPM9KMPEHXNbVnOsiGWgRYDcuRH3NluhdUi3g9zfztJv/nec0xXAH5siZ+gxj25urF1I
         wPzZMZZPNLfxr1thf0VqIpf0JG50TTTv/dIp6+b4T+Q3NK1wH1SR8+SPbSk9Oas+ayqY
         ii3YgadMKUUfA+OB1Da7bIL/sJEF+hlXy6wO3Wor/faXzG9fb7fODx4AAocdFqabwWcT
         fW9w==
X-Forwarded-Encrypted: i=1; AFNElJ9KiviSNJhBA4lJvyz+i1hiLKSf4C2RLJMGEBsYxBsz7M2CsaE3sL6qJIzguiutL00zQJPMSHx+U+i7Pw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwPkcGYc4tcdLH15hG3rOtaBNUSyj5ROq8ea9/wbiRoLksCElkA
	eqoerTg8ZfMlkrNGVrMtJ+v6ds+wC/V95TMtr90XnQsxfF5o50u0XIbf
X-Gm-Gg: AeBDiesanFNIWnLEOJyCFt9KRIrgB0h23KVxjfhd4BTA5gez7phQporeILguGeXrVZS
	V4YV23XlUEpiZHURrvgeWAg3Eb2OoChayw/DAPiaSvJQWKhCRmkBZ0eOKmRj5F63zqya6FYazdc
	QizBmwPVTWLDF0FF01+FWUO8o9OsfI0ZCAU+AUkzAW0/5H7QUcFKZBQN48uHacp3S1gKxznF3Rl
	zshikioAlbZbrZTQ1Nr7b2t0f7kyss6EmKOhZA1buV9LznJHPjiVnnS5pZgUjKoGFM8joDhTfhW
	6mc1KFG0TkmvhheSPY7fwdHQWhqnguYEqoOHbF2VBsZRXqrO7KjTacq+KUgBVFVHKvN+0fEu/6U
	Ta6rRcmL/2zOQ6N8pYR4otV2sGl0dIt8yYCkzhua4BEeyRlxo/TwdmFMvGVs6jExFWTEVREXb8D
	5YdLpD5wMW2m1vvHm7LWW9L41YQXzTz5ABkgfhC5BUHETQeK5VtU3v3ggLlWW0bpGR
X-Received: by 2002:a05:6000:4021:b0:43d:7854:32ec with SMTP id ffacd0b85a97d-43d785433bcmr4066398f8f.17.1776067366337;
        Mon, 13 Apr 2026 01:02:46 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.239.37])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63e5c981sm32155932f8f.33.2026.04.13.01.02.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 01:02:45 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 13 Apr 2026 10:02:15 +0200
Subject: [PATCH v8 6/9] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260413-orangepi-sd-card-uhs-v8-6-c21c40ec16d0@gmail.com>
References: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
In-Reply-To: <20260413-orangepi-sd-card-uhs-v8-0-c21c40ec16d0@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Vincent Legoll <legoll@online.fr>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_010249_262765_00D4C35F 
X-CRM114-Status: UNSURE (   8.76  )
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

Add Spacemit P1 PMIC configuration and board power infrastructure for
voltage regulation support.

- Add board power regulators (5V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Tested-by: Anand Moon <linux.amoon@gmail.com>
Tested-by: Trevor Gamblin <tgamblin@baylibre.com>
Tested-by: Vincent Legoll <legoll@online.fr>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c72..9c417a483f6b 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
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
+		vin-supply = <&reg_dc_in>;
+	};
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -92,3 +111,32 @@ &uart0 {
 	pinctrl-0 = <&uart0_2_cfg>;
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

-- 
2.53.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
