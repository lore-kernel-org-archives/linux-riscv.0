Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA0EC433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 31 Jan 2022 11:46:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ph859vS4g9CqeigkFIxfEpwlfrloyrU1Mg8HAB4fqAs=; b=DVaImEOfh2uKSH
	MKfZiEl8b0FfYXYDh66u32qQYrRpMTFw6emMhHWiBtBRzSczlNPVdO58QyEK7nN1HQSpQxtiB5bJp
	937L7cts+UvZH/fiP2PU28SvlnWYcjMm+CwVcQocojkIpkPcaYaWtPLyLQbf1M+r1BACEMFsiCPcs
	6eUGH2R6t7ui4aEm61gRqqypafnZa8GRIYTzhi2CwD5Q/jFd9fifZ6hXe9tX0zWWJK3JtU3+OYWQd
	0U6jIX9js2QMJhJcPxhBbcaTt25GE9FCNAj5U4OsIaQj9YoSvyZA5KmRowmD0NltwdTjHfszmxSzV
	Z15gtb2FdLq6HnYJeVKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEV8f-009C40-QI; Mon, 31 Jan 2022 11:46:29 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEV8S-009Bw7-Ob
 for linux-riscv@lists.infradead.org; Mon, 31 Jan 2022 11:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1643629576; x=1675165576;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=+fJlPFSSN0ii63iRUJ15zIuZHHuLMnPjBm4GFoBf9rM=;
 b=DRtGmG0Hib/iiQGLkiDVVPVWoCI4LKxcSU9bfTAexzVkUwYMh5fqwRGf
 Fwpwqaf8LH04LVToDj0s3D7x3QDHxDkgiJ5/L7xx2svWUK998yKoDMOUX
 P+T1UFdSIX3YyPIt5EV8o60g/hzcYgCXQJkrY+rvOCSqAKDlHAOnQQMl3
 CAern01KQ3VXEOlErVG/94iQubcfrCYr5Zu0ANJtADyNlGHXGYPzTh4n/
 NPhrhaJ7AD7bVR9BpvX2JVFrpkuCPPrzM2kebqvhwE/IeJtL0MgF7dVid
 sMsui9nk2n1YX31A7TZX1C/yYLVSJeRVKeXaD8lJj6Mus4MlqlpRY6m02 A==;
IronPort-SDR: toC4+UTyAC9LERMulsE8dX0vIbta+3e/2sJSeagC6Nrx+scaESRj6ROe+t+gP14QrhWoRDCwCp
 WfyKRGQ74mF4M5KZSZKTtKIofmiI+5s/gAmsCcqduqkvTwzHfNF49wrxz8llE1aEejkijSbfRh
 hUxJvs8CeEj9HcZBDX9bIc0JMYlrsM/Y0hYXi8uJfyQ/m9adkoVg9OjiPcgweJjg7NRhnMJ4oo
 wR9+LwxEwAV6bLUZzNOlrZqUgpTQcfJt8HuvUk9V9mI+SJ5KynQtCy9iINJjlTfy/cz1LCvG3k
 eTB3cYyGQ0gubSIq2Po05QQ5
X-IronPort-AV: E=Sophos;i="5.88,330,1635231600"; d="scan'208";a="160544999"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 31 Jan 2022 04:46:15 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Mon, 31 Jan 2022 04:46:15 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Mon, 31 Jan 2022 04:46:10 -0700
From: <conor.dooley@microchip.com>
To: <linus.walleij@linaro.org>, <brgl@bgdev.pl>, <robh+dt@kernel.org>,
 <jassisinghbrar@gmail.com>, <thierry.reding@gmail.com>,
 <u.kleine-koenig@pengutronix.de>, <lee.jones@linaro.org>,
 <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>,
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
 <geert@linux-m68k.org>, <linux-gpio@vger.kernel.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-i2c@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: <krzysztof.kozlowski@canonical.com>, <bin.meng@windriver.com>,
 <heiko@sntech.de>, <lewis.hanly@microchip.com>, <conor.dooley@microchip.com>, 
 <daire.mcnamara@microchip.com>, <ivan.griffin@microchip.com>,
 <atishp@rivosinc.com>
Subject: [PATCH v5 08/12] riscv: dts: microchip: add fpga fabric section to
 icicle kit
Date: Mon, 31 Jan 2022 11:47:23 +0000
Message-ID: <20220131114726.973690-9-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131114726.973690-1-conor.dooley@microchip.com>
References: <20220131114726.973690-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220131_034616_861892_A96B281B 
X-CRM114-Status: GOOD (  12.34  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Split the device tree for the Microchip MPFS into two sections by adding
microchip-mpfs-fabric.dtsi, which contains peripherals contained in the
FPGA fabric.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../dts/microchip/microchip-mpfs-fabric.dtsi  | 25 +++++++++++++++++++
 .../microchip/microchip-mpfs-icicle-kit.dts   |  8 ++++++
 .../boot/dts/microchip/microchip-mpfs.dtsi    |  1 +
 3 files changed, 34 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi

diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
new file mode 100644
index 000000000000..c1dcd56b0679
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-fabric.dtsi
@@ -0,0 +1,25 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2021 Microchip Technology Inc */
+
+/ {
+	core_pwm0: pwm@41000000 {
+		compatible = "microchip,corepwm-rtl-v4";
+		reg = <0x0 0x41000000 0x0 0xF0>;
+		microchip,sync-update = /bits/ 16 <0>;
+		#pwm-cells = <2>;
+		clocks = <&clkcfg CLK_FIC3>;
+		status = "disabled";
+	};
+
+	i2c2: i2c@44000000 {
+		compatible = "microchip,corei2c-rtl-v7";
+		reg = <0x0 0x44000000 0x0 0x1000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		clocks = <&clkcfg CLK_FIC3>;
+		interrupt-parent = <&plic>;
+		interrupts = <122>;
+		clock-frequency = <100000>;
+		status = "disabled";
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
index 6d19ba196f12..ab803f71626a 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs-icicle-kit.dts
@@ -68,6 +68,10 @@ &mmc {
 	sd-uhs-sdr104;
 };
 
+&i2c2 {
+	status = "okay";
+};
+
 &emac0 {
 	phy-mode = "sgmii";
 	phy-handle = <&phy0>;
@@ -86,3 +90,7 @@ phy1: ethernet-phy@9 {
 		ti,fifo-depth = <0x01>;
 	};
 };
+
+&core_pwm0 {
+	status = "okay";
+};
diff --git a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
index 717e39b30a15..c7d73756c9b8 100644
--- a/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
+++ b/arch/riscv/boot/dts/microchip/microchip-mpfs.dtsi
@@ -3,6 +3,7 @@
 
 /dts-v1/;
 #include "dt-bindings/clock/microchip,mpfs-clock.h"
+#include "microchip-mpfs-fabric.dtsi"
 
 / {
 	#address-cells = <2>;
-- 
2.35.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
