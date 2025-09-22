Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D041CAC5AA
	for <linux-riscv@archiver.kernel.org>; Mon, 22 Sep 2025 16:17:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YcEEoJIU9J+llKxqkIJXO87LCRO61tFXzNEJrDaZhXA=; b=NWaRYadm0xMs+D
	u5bZV9XqGuWt7i08O2Q8sdg7sdSVlWLn2i0siIyQYW6ZSu1KO1apkJDMZ5YDYRjOYnOR8thB1C8r6
	sYbgv/5lKdFjzbAX3t8OyBOz/KzrbgxaOPFi9xeuWqZRx+wvdI8DLEazvo5NHzkbmwU+1A6SO29F5
	cHMuAIONlhWnbim8kDOM55MRWpUuaWL/PXLeFmIDPVHaBkRV8PZOxhzS63aA5ErbgiCyRmZCzmmEQ
	nSgZS8+HbCslFAGk5/9j9Jq/Tb+1fQ2RvsEifqdqtvX55uhRLWC+m4N9+r+NOWAQ7BylA18hj5frs
	OvmrR+LqMfekd7dwN1KQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEK-0000000Axf3-2b8B;
	Mon, 22 Sep 2025 16:17:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEJ-0000000Axe9-1EPy
	for linux-riscv@bombadil.infradead.org;
	Mon, 22 Sep 2025 16:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=aoOY7RfK5Srk9OHnvU+owYvzqDNBeS7oAz1E0iurER0=; b=P/CEvrt5zT+yngXP+D3+JPqkEt
	n1nPd+m9ZMoVIw11O3G+9GzZ11ceEL1r0TkPV+nzjleIikcHldy+nKyhI1mYY3/AuVhr4riEiNfJK
	vMo0TjJ+qAuGKyKUiVmZkWOfpqn7Qt5qWTyqhKYYxgdZ0JBO2IQNTYhWM2gImBecbefLIYcwNlThh
	Q8oWGyjb3lDc/AV/76iSmhsl1UYoI8JSuxGBdIC2/6SpxykVgUkRYyzsELy0R+8cVu26IBkeVkjMz
	7RmUONdoXQBVv6OULdSzjICG4D3yS3tcAHILBURJHYZgg2mJglTO5Up5p/of49UIWSr1ob3Q3saad
	HsckxU3Q==;
Received: from mail-il1-x131.google.com ([2607:f8b0:4864:20::131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0jEG-00000008MBj-0rKc
	for linux-riscv@lists.infradead.org;
	Mon, 22 Sep 2025 16:17:30 +0000
Received: by mail-il1-x131.google.com with SMTP id e9e14a558f8ab-42480cb42e9so18962905ab.0
        for <linux-riscv@lists.infradead.org>; Mon, 22 Sep 2025 09:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1758557846; x=1759162646; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=aoOY7RfK5Srk9OHnvU+owYvzqDNBeS7oAz1E0iurER0=;
        b=Nsy6tZgtrbU3SFbvoUjZxA7yk+NFTEAmycocklO9LgeEAGl2a5lMXoNR2Bn5ulJ/ib
         Vr+wAP9UEW5CArtwwGwMok1u7Y3HYXfdyMjeRFX5d0v41ghjNjTW+DNECJY6UQ0V9qm0
         1BnCPX56wILCjdYMCcFIvP4x2/yWbTkOLHdH8LhzbtfXrHWcZICKXSEfwdSlH5gln5Zr
         pQ9504NMV2X8W+SnaX7Bf5T42SPutetc/QYSLIVr8+lntm9LNjk/Hd/NQtstwFP+hssq
         O/1aoLr39wV/fD4OQ4Atkcy80SlHR/PUR4wxSR2C1y3Q55IcOvFzXsXO2ng46PaUklU0
         UE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758557846; x=1759162646;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=aoOY7RfK5Srk9OHnvU+owYvzqDNBeS7oAz1E0iurER0=;
        b=xAq/Wm1xqiGr6pcYX2ibgIuenTl0FVRaaq71kLKiRaAkqdc01XvYz3HZqU8d7eJqcd
         ttjYxaEYaOw2MTrebr/Jf562Dv1Ijxty3wepv6Vzs5+ihw9Vy2V0xjIgyqTXTW5LWuHD
         lz5BxA/4/ywWBtq+F/5TGaMlWnKOZJbl/FpVnaFNSWadcQ5PD0JPrCcKzMdP/2VVMBt1
         MaxMTn+0gpLYk8bsD8YdWXjGF9Q45hLZQrAmlkIk9nYtG7oIuz0wVPoE1uIHDPb0IFWw
         +zx7lNmmCXYBa0EBMRx67vJwMowyc72GhNGVAoVn2ETjCOfcKD99BjDNq4pfDC/mDSCm
         inkg==
X-Forwarded-Encrypted: i=1; AJvYcCWXe0LX5k0KCTjH3+F/mRAii+MK/4yojJDolx22IXtUyE+lwzU2h0NzBWQWdtljuPzQumUt5e6diUG3Rw==@lists.infradead.org
X-Gm-Message-State: AOJu0YzsPBhV6emhp6Dg/laKNS+xBI7Wh/QEN3FiQt5UGjPu5L+uADLs
	xqfp1J9ApAhUKOZxFsA39bGpvrfz9HrINJty810LdiA1QRNk9B0zc5TC0QVLqnAVDEA=
X-Gm-Gg: ASbGnctv6kATk9NuWfBQGKlUXVVESrHdCES6nmKbhwNO/YJ8V1rfXy+fVDS56A5GJXa
	8zr21RndgOTqsobw2vD1iZjHBZBnuKUvE8ehQ6EYUv/8my7GKxRFU191m5eySC8DsVOBl6FuWwp
	h0tVOlX/Y+SdqkthG/Kh+1s2D07keX1K8RvxgrDad0UPgW4oR/BYXbw+GjoQwYvAMHJ9iitKQ5S
	C2ZH4PK5ucRV9oPByiHoDC7nII+1xLmNbsKjgaIIP+Y2Zizw+RWZJGfwBwUcMLLQaeq9QTkhg2n
	KsgmO8+tA9lAvwv0jppLSEwcjM9sNY3L+7vUkbQSJvhgwwOj/HBaDIhvp/etbK0kskRH64oU040
	/gwdxq7qrCZ97sDHuG/fC65dFFiPJ3Ld4ghok+xwQU2MWAdxXBd2OkTvR+mwRBZyXTA==
X-Google-Smtp-Source: AGHT+IGtbLw0Yh8YMxa0k32ja3gy2lmtWw7KYJ5toaZ8D6XiMR5qUSNHvj3Y8EAnz6GgOP6IVLuhZg==
X-Received: by 2002:a05:6e02:164d:b0:402:b8e3:c9f5 with SMTP id e9e14a558f8ab-42481911960mr204709235ab.2.1758557846329;
        Mon, 22 Sep 2025 09:17:26 -0700 (PDT)
Received: from zippy.localdomain (c-75-72-117-212.hsd1.mn.comcast.net. [75.72.117.212])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-425711d9aa0sm25207185ab.48.2025.09.22.09.17.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Sep 2025 09:17:26 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: broonie@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org
Cc: dlan@gentoo.org,
	ziyao@disroot.org,
	linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	p.zabel@pengutronix.de,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 3/3] riscv: dts: spacemit: define a SPI controller node
Date: Mon, 22 Sep 2025 11:17:16 -0500
Message-ID: <20250922161717.1590690-4-elder@riscstar.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250922161717.1590690-1-elder@riscstar.com>
References: <20250922161717.1590690-1-elder@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_171728_508079_C1F8C1DB 
X-CRM114-Status: GOOD (  10.78  )
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

Define a node for the fourth SoC SPI controller (number 3) on
the SpacemiT K1 SoC.

Enable it on the Banana Pi BPI-F3 board, which exposes this feature
via its GPIO block:
  GPIO PIN 19:  MOSI
  GPIO PIN 21:  MISO
  GPIO PIN 23:  SCLK
  GPIO PIN 24:  SS (inverted)

Define pincontrol configurations for the pins as used on that board.

(This was tested using a GigaDevice GD25Q64E SPI NOR chip.)

Signed-off-by: Alex Elder <elder@riscstar.com>
---
v3: - Moved the SPI controller into the dma-bus memory region

 .../boot/dts/spacemit/k1-bananapi-f3.dts      |  7 +++++++
 arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi  | 20 +++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi          | 16 +++++++++++++++
 3 files changed, 43 insertions(+)

diff --git a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
index 2aaaff77831e1..d9d865fbe320e 100644
--- a/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
+++ b/arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts
@@ -14,6 +14,7 @@ aliases {
 		ethernet0 = &eth0;
 		ethernet1 = &eth1;
 		serial0 = &uart0;
+		spi3 = &spi3;
 	};
 
 	chosen {
@@ -92,6 +93,12 @@ &pdma {
 	status = "okay";
 };
 
+&spi3 {
+	pinctrl-0 = <&ssp3_0_cfg>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0_2_cfg>;
diff --git a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
index aff19c86d5ff3..205c201a3005c 100644
--- a/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1-pinctrl.dtsi
@@ -76,4 +76,24 @@ pwm14-1-pins {
 			drive-strength = <32>;
 		};
 	};
+
+	ssp3_0_cfg: ssp3-0-cfg {
+		ssp3-0-no-pull-pins {
+			pinmux = <K1_PADCONF(75, 2)>,	/* SCLK */
+				 <K1_PADCONF(77, 2)>,	/* MOSI  */
+				 <K1_PADCONF(78, 2)>;	/* MISO */
+
+			bias-disable;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+
+		ssp3-0-frm-pins {
+			pinmux = <K1_PADCONF(76, 2)>;	/* FRM (frame) */
+
+			bias-pull-up = <0>;
+			drive-strength = <19>;
+			power-source = <3300>;
+		};
+	};
 };
diff --git a/arch/riscv/boot/dts/spacemit/k1.dtsi b/arch/riscv/boot/dts/spacemit/k1.dtsi
index 6cdcd80a7c83b..eb8a14dd72ea4 100644
--- a/arch/riscv/boot/dts/spacemit/k1.dtsi
+++ b/arch/riscv/boot/dts/spacemit/k1.dtsi
@@ -797,6 +797,22 @@ uart9: serial@d4017800 {
 				status = "disabled";
 			};
 
+			spi3: spi@d401c000 {
+				compatible = "spacemit,k1-spi";
+				reg = <0x0 0xd401c000 0x0 0x30>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				clocks = <&syscon_apbc CLK_SSP3>,
+					 <&syscon_apbc CLK_SSP3_BUS>;
+				clock-names = "core", "bus";
+				resets = <&syscon_apbc RESET_SSP3>;
+				interrupts = <55>;
+				dmas = <&pdma 20>,
+				       <&pdma 19>;
+				dma-names = "rx", "tx";
+				status = "disabled";
+			};
+
 			/* sec_uart1: 0xf0612000, not available from Linux */
 		};
 
-- 
2.48.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
