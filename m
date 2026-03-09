Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04EE0EFCD9D
	for <linux-riscv@archiver.kernel.org>; Mon,  9 Mar 2026 11:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=TYRSoltKcZu7Jl1kgOEZK7HWOFLrQ9yZ2guXTz+BOZ4=; b=3i0VitHoYcV++Z
	JfCYiT6P4k+2zsoRDZyj06aBDZMmDCjaEBQ5OJz0Wj64BoffICmhCNdrb92pSOyqMy1LsfEnqwBv+
	IbgdN9DQ/LQRUgSpDxmhvdYuz6YTrRG/KAGRfwagxSkbN1Puz6T63fZipEdxUohieRsHvT1IJwJef
	rUNo9YVnZ3bd7Sblmb9Gixej4ka6en2Auo97xL7ptp3zl6yemc4YkcsfT2kjUTNqAko5fXYtR0oUX
	6Qmo9yJhRdTh80DdZa3CRGDmtjWr6U8yRnJspuvk3O8Ju5uPudTLDhGDVUNXLLTvEni0T5O8OsR+u
	dNHjOuUOtGi9o1WzKv+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyY-00000007CvU-2ckO;
	Mon, 09 Mar 2026 11:40:42 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzYyW-00000007CuE-3ymM
	for linux-riscv@lists.infradead.org;
	Mon, 09 Mar 2026 11:40:42 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-439c9eb5d36so4589085f8f.2
        for <linux-riscv@lists.infradead.org>; Mon, 09 Mar 2026 04:40:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773056439; x=1773661239; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=eqgUhY/0cxpGFiteQB5JEtLBBqkG3GjmgExtuPlzRH1Q4sJf57TiAZJZdyHb4GO6Ic
         yUePCziXazax4XhYwgOHQKIcVRrwOStAHKSL18qdIKEJJqPpXZujfP6Xbw7jZJy90O+d
         1iwS3AXP1cjLGtx/kr7eH9RDiDRDVW3A6noaauHZeIZ0F11BLj+f8fL6gMpIZnf7ZnNN
         3Ab9On2Mn3jvJe6ZwPOY8o7sChY9VC0VpcRvCu5pZ5HuwXYoBfkXW52O3blwf5mGO9hU
         ORqD9spbpzQHzwHx/j/G5+C7W2tbU4evlNjxPa2XenareZFUjVlt49v+ileEsY5nxUop
         A7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773056439; x=1773661239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fiI3b1wOWntFX27ERmDlj5qmTKTz44jgUTrCNSLGaQE=;
        b=sFRcdj0tTrsyyqqAP8SGdroTw2glWoS3085cq9yt1yVPB47z6zbkWqD+UEFFznbR9Y
         3PkDQHFeGbLBlkU3vPkVkfth6UYdZCKmVPVL6nJVPaxW957EN2HNsjjIe3DLo+gEt7Bh
         Mic1ix0SbmJptPOillKfoy8Y4vKgUwPWXAc+EBxwTRtw37IXU2AQh05aiTf00IYg9oxE
         nwWfE8BA5IQ3SECDUehWvoaasNduvna4phOp+5zccsq+x4t8DhX7QCibUgMUDj5zZmnp
         2qqv+KCM7ujzAA0krt+x/lXw6C28gltyepyOznsuUTZhfVoimzjJee2hH6Yykk7Ek1+H
         sUNg==
X-Forwarded-Encrypted: i=1; AJvYcCWAOFe3bMVZtFMaN71/bQ2V3rb/uDsoMoOFT4eQKU+2VvG9fkWYInpIXtoi5JkyiTXCIMz+T3sCk8o37g==@lists.infradead.org
X-Gm-Message-State: AOJu0YyfMhyzDxFGddbUiZsOfg0s0Kq8w7KKEo2W7K6//5BjxehRCNDn
	iwX90qN+meEVQ2m7tfP1WAJ/y1RniqhErbypvOZecm8Hcqg1yu9Z50fi
X-Gm-Gg: ATEYQzzZlxcCjo6NvGBIh5hH5kcmYNV0AeYUNU4u+iub7QrszmDWOxdSZjp36j4G02B
	cdXG4Yt2SOCWfYo1ophxiaCePA1Db0sedmpPMabH3nWKnoJoQPgHPp6bd6arMls0q1xRY6JcCYt
	gApM5ad1p3/+R6ezFDi2qOhgVJTjwPPflFpP4cSO54Um6sku2AbJqAncdaBK1WpDO6Zmj9jjuhU
	zsimEFTttMAsnRCzOKkG3p7vnH7KgeNlWtQasCvL2CMwA4SqyBcwS08+cupsOECWQ7cmVz9WLDK
	Gx2Y3jFYkmNs5PjH6v7JY+Q8W6kyLQJPjfQAJO0qSYwm/M356QS1aEykCkJjM1KSban0NtYwIMB
	vRu2jgvVW8uimJoCxQNW6NY3aUYz64JnozyILLow37AlRcNycVhOfmKfB/0DGZjuYGdIMBIrD/k
	Dwya0LqMibBTNuxj+NI8xkloXH05Zmtt7CPnxUkvAHB92mzFnySX6ax40VlkV1qSnB
X-Received: by 2002:a5d:5d84:0:b0:439:bc0a:4164 with SMTP id ffacd0b85a97d-439da330b92mr19644526f8f.19.1773056439050;
        Mon, 09 Mar 2026 04:40:39 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.236.52])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439dad8ec97sm28471699f8f.5.2026.03.09.04.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 04:40:38 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 09 Mar 2026 12:40:16 +0100
Subject: [PATCH v2 6/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260309-orangepi-sd-card-uhs-v2-6-5bb2b574df5d@gmail.com>
References: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
In-Reply-To: <20260309-orangepi-sd-card-uhs-v2-0-5bb2b574df5d@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260309_044041_099598_96EC4049 
X-CRM114-Status: UNSURE (   9.21  )
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

- Add board power regulators (12V input, 4V rail)
- Enable I2C8 for PMIC communication
- Configure PMIC with buck4 (vmmc) and aldo1 (vqmmc) regulators
- Set up regulator constraints for SD card operation

Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..414b03f5e6480f05f5d7eeaaa0afb4e86425ae36 100644
--- a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
@@ -19,6 +19,25 @@ aliases {
 		ethernet1 = &eth1;
 	};
 
+	reg_dc_in: dc-in-12v {
+		compatible = "regulator-fixed";
+		regulator-name = "dc_in_12v";
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
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
+			sd_vmmc: buck4 {
+				regulator-min-microvolt = <500000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <5000>;
+				regulator-always-on;
+			};
+
+			sd_vqmmc: aldo1 {
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
