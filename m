Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2AFCF506D5
	for <linux-riscv@archiver.kernel.org>; Mon, 16 Mar 2026 14:29:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References:Message-Id
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+TjhC9KXMCIlS+2yR1KiO40jVCrNsuk1wKOWk+d1mbw=; b=HiddkTc+g3/iqU
	tJYFIf9IcE0l7rLKijUWZSHVdRbKz5RL5r9vcwEFyU5vqIYf/2QDxlw2mm10W9r2GQaa2PXXDtbUY
	FeJSi7C9ZxF6amXjLkIff3liFsEuB8INYM8pXMgtp/xkDOhg7ScQ613wdhk0UvLTUqx68Hz4O5Vyg
	w+p3JQ54gO06jSOcLgJjdNAFnwUrGkWeJ85T76adLv5eqOCwcv/W8h+S718aZBMfb1Qdxwj/obEg/
	x/q2xfx8R/VqYWkqYzVYEQBjfqpFqXAcWAd9rHQrNbAJghcLoTtAwS+wiZgIZsN9ZM8xDtV8C00/L
	euCg6BQunN7R/qJQ3iog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wl-00000004BLw-2aZG;
	Mon, 16 Mar 2026 14:29:31 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28wj-00000004BL5-3fs7
	for linux-riscv@bombadil.infradead.org;
	Mon, 16 Mar 2026 14:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=bzdLQZF+g4qVulg9JsUgV+5Hi9wiigjRN7QwVdQTPwc=; b=EEla60EGulujqO4SqRyXEuLcTg
	zdO/6yd8a0wheI44ik1gbxiUa7xNwo1gEX/L2SbFe6EqXBoTu/laUlYUqPfM73ehGhXlhRyy019i/
	IPdbBvsyS0X+2ztjioxHggSse0FrM3m+VZIVBkmLngdhAjza/zY/NV6j4Ph2TJJ+F3/E96V4Eprkq
	s2OQTUwwjvJzPQWHQMd2kHykBi+OfBO44tWZznr72+TVprqkxfwRDQsAu3YfnpQZFAUcqSkXAydeM
	gUh9j9K98AoDNgK4Ji3Htgy7VDs5MxE+bJzbRh2yEpfffytxpv9K7+81QabD6IoqsxwzSL0zESwcH
	HddtuIDw==;
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w28Yf-00000006tfN-3V73
	for linux-riscv@lists.infradead.org;
	Mon, 16 Mar 2026 14:04:40 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so4553337f8f.1
        for <linux-riscv@lists.infradead.org>; Mon, 16 Mar 2026 07:04:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773669876; x=1774274676; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bzdLQZF+g4qVulg9JsUgV+5Hi9wiigjRN7QwVdQTPwc=;
        b=ZeEBowfh2uc5BANPEQItej8XgEwnVNmHs6+++ZmwfQPXKuVYPHmxo1/AmWIMqJQ6jP
         fZP4avlXPrtFngC+vgHCO18ZBxnNtdmBSAtcm12LuS82qh4avNd+6VkXCyGdhPCKzoHw
         2yETKraoVEwSAU6rxBRBf5/tgPy+gnr/aFP+/0Al6f+J3VkwPfqtNwm+nwwaaWRr2xUP
         3iLF6kX7wPlea7wAMR5SUDydmLHczG/zbwCfA3bxnYfWJBQftnEPA1UM+ipI9L2Lc0/c
         EeyN4/sUUiUzOSvGIQcKqXkIyGzseVRPeialzjRlRD5VuImDeZW6rCIL/Gx3MHCAisZ1
         UcJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773669876; x=1774274676;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bzdLQZF+g4qVulg9JsUgV+5Hi9wiigjRN7QwVdQTPwc=;
        b=d0RVxPVKNY7RwZQ5MyCiKhTXvPlA6WfWNbPmj3zELg6skszS4GU1+M7GBkBNjJsX+o
         arjTR/W9vo30g+EsNQiwJP8cuXio3RWzf1IeVuZCON95amdTfVy3Az5iQ6qU2PZmsMJ8
         bb1VgdCl3zDYWuZchddrQ+j1RUacDptjXncH6FCgCiNBv00SM+DW6iwj3hHUArB7dCnB
         Q7/FXm4Frs7RWETezQ80aQEUhZUnuWCEHJ4Ew/qGgjZAvpnpUYJk8D2//ZyGcIMeyB+G
         lTFfsJtncSMOTqJGnFielRG/1rXPHNv8yPrxbnhVDc6wur0W1ZzjpJ3yqo9t6oUXLj2E
         fWSw==
X-Forwarded-Encrypted: i=1; AJvYcCUND6j7s0WGvwJYx8IDSgxNgnOrYpC1XZCDsWQiv/MP5KaJBqEAqV81LPaOt+6oH+sAB1HjQglCPgMiCQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YxgrwwmGQj5QOVS6fJgvhN2LakV73Ga6cGP5PVxqpvDtJ5mv2FO
	/76k9oa9fa+iQ+CdVv7tnhrQgF1QfzVa0Vbn56LUxGqaDLkKI4frxqnG
X-Gm-Gg: ATEYQzycrMW8SlF3nEbgdVlJ8W4XWM8tGPJS1Cmj4tuSFgofzwq3w1vufrpZkoIEHoy
	f5rYEkFIu5+jCH5NNjBoV5Kjpl6A8jWuSBup6lr6H68+6NXSOvBxAkGyXBx6DTHMOhb1hGLv4Ge
	eR0biV2yhXXA1DIPzCuMjOCL+Tvi0hPCF7j7Jh+7QZVw1pwKFdv/NXH6p/QZTKlgV+EEDPJpY/N
	vR31ANxRGKYOgSQ0VpzBtZZzyShV4K4K0cvdmsSyURLHW0oM6DLP+McNgaBmCRgFQebtKNj5PjR
	DEVwghL4gLSJWDsWOC8XE/gLJxbpSLd0NaH/SGSQt1JhVt8zH0BHUHkFES9q2J/7qxszVEFvNTA
	wUMWdsEiNU7PJG2j2tBTAjG2Ud5O9MltCBOFwcBeMpICaWB2GHSSRlMVH/nwMxJoxfVKgFKo7BX
	15TVoYuB7zZvG6cr2wsYxC5gz9JmofKLTGIBSQESOCscAEWDHVpPnbGqy1scm4UFIr0BA4TvOvy
	MM=
X-Received: by 2002:a05:6000:250c:b0:439:cbcb:5723 with SMTP id ffacd0b85a97d-43a04dc083emr24515986f8f.42.1773669875968;
        Mon, 16 Mar 2026 07:04:35 -0700 (PDT)
Received: from ipedrosa-thinkpadx1carbongen12.rmtes.csb ([67.218.234.31])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43b3a09e453sm20698725f8f.0.2026.03.16.07.04.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 07:04:35 -0700 (PDT)
From: Iker Pedrosa <ikerpedrosam@gmail.com>
Date: Mon, 16 Mar 2026 15:03:33 +0100
Subject: [PATCH v3 5/7] riscv: dts: spacemit: k1-orangepi-rv2: add PMIC and
 power infrastructure
MIME-Version: 1.0
Message-Id: <20260316-orangepi-sd-card-uhs-v3-5-aefd3b7832df@gmail.com>
References: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
In-Reply-To: <20260316-orangepi-sd-card-uhs-v3-0-aefd3b7832df@gmail.com>
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
 Iker Pedrosa <ikerpedrosam@gmail.com>, Anand Moon <linux.amoon@gmail.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_140437_960719_3414E8C8 
X-CRM114-Status: UNSURE (   8.82  )
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

Tested-by: Anand Moon <linux.amoon@gmail.com>
Signed-off-by: Iker Pedrosa <ikerpedrosam@gmail.com>
---
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts | 48 ++++++++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts b/arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts
index 7b7331cb3c726f11d597f81917f3a3f5fc21e1b9..f1533c99881dbf38e16cff5e91e33253cfa7a56d 100644
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
