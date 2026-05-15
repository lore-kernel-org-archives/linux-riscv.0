Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A4E8BCD343F
	for <linux-riscv@archiver.kernel.org>; Fri, 15 May 2026 10:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=evfLkWLFLJJdIM3aravFjIxDX642OxOwWPQzeo+fN0k=; b=NHDoe5ngqTiY14
	wHn1pzLBFyj/PP8f4HWuM1BD4xGLPF+hUyIwRoQy2sDwxHcAOb7P2DgRj5jnUoq/TDcwgRo1i12mK
	z2tvjmzGdkXT6iGeyBqy1O+PBnVPufdH9DyuA/Ts9afmyGepwAQNKt7j5hcFAc3FT9wjNqMx590u4
	DfmqQeKfcoONjvymh9j0qtY8/4ZPW3wbU+L3gRCy9GhCFzIgS6obN95O2T2/dCkPou3Mf8PnV6KUf
	e79QU6Vc1QnSYQUR4A8CKGT8M4F8SqC0EhgYNHxQnYEY1aUC7lkHDGfrMO5huzIkT1Iazhrv4tyDg
	VfdfIwTWHx0DKnvLsRgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6k-000000085ol-2IzD;
	Fri, 15 May 2026 10:49:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6j-000000085nn-1JrK
	for linux-riscv@bombadil.infradead.org;
	Fri, 15 May 2026 10:49:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iB8eoQBD1gDe3NlGs/goqrqIf498nPGYBfRez10qXig=; b=rHGRoGZFin55gpN/idpTIl/7SQ
	PMcUtP5+lLbt/xbAWJ/gT2RKKynl3EEUb2XZnkCRfufNeQWingmSXklH+oznQZdFtmSUbdZWFkk3V
	NMp9bcCdHzsTVszY19R+678EE6z2STYWxro00pwHN4lShcHoiVf4Bns5FQZqRcI1CK12RmzlPcnki
	UbuOFirqyY0FV7JjLQYeg/Vn6CtPuHidvIBMEVIR58ZEzh000oUXbtvYLYOiQZmz1XPLL7WMtVibh
	p+bTBnhOTfISW+6diScblKeDeNTNiE/87Pp6jSrhL/OxP0djCwo0ht41rjWvNQRMRW7An/nC4VhtB
	1fuvgmRA==;
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNq6c-00000004woA-2xd4
	for linux-riscv@lists.infradead.org;
	Fri, 15 May 2026 10:49:25 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-448528f4e69so5153027f8f.3
        for <linux-riscv@lists.infradead.org>; Fri, 15 May 2026 03:49:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778842161; x=1779446961; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iB8eoQBD1gDe3NlGs/goqrqIf498nPGYBfRez10qXig=;
        b=kt2X4TA4hheKPIR84p6SbUKe0z7LG+RylnVyz4BApbJWrEQsTqtJp495hw+RfpELq2
         xbs/8HGmpO+mbHtV5aWXVqrrzFQ/ggZBcXGzLEEv2Ntk6J+t9ojvKGilg/aMs2PcZiF1
         f3AV4UG3IJKrcA9x9wvfiyf19biUyXTvqrtLLAelXtKg8u8zKjwE3qUCPX6RakH2zpw0
         QUk+XoSYs9HJTHRYBzvyZsdl7tM5tGOuG3IwMY3WiwaUhWYtVs/wY2dpaPZ16n/73YEx
         H8LfCr2DMAAQKA23zhuWNEU/J+U675EwOzTDnRynVnFb6AO0jjltezsmPMkmQLNJbz1e
         +zxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778842161; x=1779446961;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iB8eoQBD1gDe3NlGs/goqrqIf498nPGYBfRez10qXig=;
        b=oxuy8VJexCHtBucl8JklBdzzxrPjE7zzId0nPuYaiuTbompDXKR02ViwA2f2RbZxJ9
         4aKch2w85lEEFkqffL8eF9E1s+So0B1ogr7PCFHfR29eLYpi5EyWmC47ZVaBIUfApLUg
         vMXk/MBi54nGwNvSqodqp47wKEMk3YKq0fRF7zJKJyU1fyUz3J48R+xoHrPI/An0N8jn
         o60z26SVBc92IYrSqZlfLQqCBg4a4CQIfZwTK+Q0/WONUpzqLqf1zHCFlwvPxJBQk0gk
         GX4MiMpq+HTr973DFe230Sp24zeYlde7I++BqY0eC7txm0DSeSFkJNEvsczbGP/X85Bq
         l/Fg==
X-Forwarded-Encrypted: i=1; AFNElJ+1SHbsAhjG5/IEa8HQvgQXVDXtxJetCZMAi3TkuRbJdS2cRM2C1CYzL/sWME+8hJb8XdgQxJsn9YZzuA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwYMLcx3r+yvGj2u8e7p6je86NvGhvvrrbeBrI1x+2h7XuKvYVd
	H0rLC7+u2Hf+I1vXUmtCFnI4FXFOIiDtsZN3YFV3itZTCTH2psYt/qz+ewiD8w==
X-Gm-Gg: Acq92OFw7R+kzs8dMZfz4/L8oWFM8V7vBhVSOjCzrp502qQ1tC6E93lhrtRQHE3NOzz
	MeTqjdvIWVKVyP8eT+BCcGH6fX9Po2xbNBHROw+BktzGYqTRoU2dIOj4jiJr7lZoH5DswLuXaYf
	opRyP/VhWNQJXPIbF2NPjMi79hwwPiPaY9fQZYdXsbH69v19JEQAaMWO5Rk5INBOPwN/kRCajA0
	H4tV2jBq283yKH3HGT5OBVLZ62xyGyHya+UAAIRdY+Zvq+3dKifN1crPTeBRN1RvnsnRJJ/90Ut
	pvNVPS4s+pxI1d9DCZtVRgxz06UD6PhXvhRR7AdGvOHgln+OYeGCQlhML1eepbgG9EmMhaps/pj
	4MeeiQ47S2YE7Es9lOTAQKSozBEvyxQ23hy6O87KBwEc+ICejlcEsJCCm6e2O9ZOv4JFhmbjMOQ
	u//VqNlYC9eSJw/bGTtE2nV6W3PLeL/d9XfuUVsZ05LBzt16x/C+nrC51xJhB6ji4Q/g==
X-Received: by 2002:a05:6000:26cf:b0:43d:7a97:78b5 with SMTP id ffacd0b85a97d-45e5c5ccbe0mr4405213f8f.33.1778842161362;
        Fri, 15 May 2026 03:49:21 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.235.183])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45d9ec3ac86sm13975602f8f.14.2026.05.15.03.49.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 May 2026 03:49:20 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Fri, 15 May 2026 12:49:02 +0200
Subject: [PATCH v10 4/4] riscv: dts: spacemit: k1-musepi-pro: add SD card
 support with UHS modes
MIME-Version: 1.0
Message-Id: <20260515-orangepi-sd-card-uhs-v10-4-094af27e310d@gmail.com>
References: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
In-Reply-To: <20260515-orangepi-sd-card-uhs-v10-0-094af27e310d@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Yixun Lan <dlan@kernel.org>, Ulf Hansson <ulfh@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>, Yixun Lan <dlan@kernel.org>
Cc: Troy Mitchell <troy.mitchell@linux.dev>, 
 Michael Opdenacker <michael.opdenacker@rootcommit.com>, 
 Javier Martinez Canillas <javierm@redhat.com>, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, 
 Trevor Gamblin <tgamblin@baylibre.com>, Andre Heider <a.heider@gmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260515_114923_275088_5E7407D4 
X-CRM114-Status: GOOD (  10.06  )
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
- Configure card detect GPIO with internal pull-up support
- Connect vmmc-supply to buck4 for 3.3V card power
- Connect vqmmc-supply to aldo1 for 1.8V/3.3V I/O switching
- Add dual pinctrl states for voltage-dependent pin configuration
- Support UHS-I SDR25, SDR50, and SDR104 modes
- Add stable MMC device aliases (mmc0 = eMMC, mmc1 = SD card)
- Update PMIC configuration to use per-regulator supply properties

[1] https://lore.kernel.org/linux-riscv/20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com/T/#

Tested-by: Andre Heider <a.heider@gmail.com>
Signed-off-by: Trevor Gamblin <tgamblin@baylibre.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts | 60 ++++++++++++++++++++++++++
 1 file changed, 60 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
index 29e333b670cf..81d3ce85d460 100644
--- a/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-musepi-pro.dts
@@ -17,8 +17,20 @@ / {
 	aliases {
 		ethernet0 = &eth0;
 		serial0 = &uart0;
+		mmc0 = &emmc;
+		mmc1 = &sdhci0;
 	};
 
+	reg_vcc_4v: vcc-4v {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_4v";
+		regulator-min-microvolt = <4000000>;
+		regulator-max-microvolt = <4000000>;
+		regulator-boot-on;
+		regulator-always-on;
+	};
+
+
 	chosen {
 		stdout-path = "serial0";
 	};
@@ -77,3 +89,51 @@ &uart0 {
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
+		vin4-supply = <&reg_vcc_4v>;
+		aldoin-supply = <&reg_vcc_4v>;
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
+	cd-gpios = <&gpio K1_GPIO(80) (GPIO_ACTIVE_HIGH | GPIO_PULL_UP)>;
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
2.54.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
