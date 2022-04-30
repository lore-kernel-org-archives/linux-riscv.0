Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5FD4C433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 30 Apr 2022 13:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YQcb4InWO6QdW34ITWdRUw9uw4I/S4s23I+q0Tj5ce0=; b=DIW6fIng3e+gz2
	yC7CUsaurRPdeSgEenxn6L8YXk3UuVGYTYPIrCE1dj6RQUp29Gtm0Z/D8zTsEruQbst9bBr7XML6+
	tgJ2oMV4ABaSfaEm7rvHmN8xObaSF0YbAlKgd0iG7heLZtMF5NckT+fx4nl7YHggiHkv5bajlRDrR
	YWQLV88/k8l1cRh+yVz0J+HOMaXbhRc1NRJ5irB9s3i1M8bj1S7hqNsALGH3h/SYUZc0eMMY2gZd9
	RHwX86WjGr9SodPiSenjCpTRzpr5rGwsTy7qyXgI1zTttuhvP8Eaodpj0Tb56qajAVATpW73Opbfc
	MWb8FsicuByzOAjr0koA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nkmuM-00EJRj-5P; Sat, 30 Apr 2022 13:13:10 +0000
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nkmuF-00EJNa-CE
 for linux-riscv@lists.infradead.org; Sat, 30 Apr 2022 13:13:06 +0000
Received: by mail-wr1-x435.google.com with SMTP id t6so14065921wra.4
 for <linux-riscv@lists.infradead.org>; Sat, 30 Apr 2022 06:13:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=conchuod-ie.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5BDpWQnhgIgr6un23nDrSpiOtZvz8Bid/I/OR7bUXBg=;
 b=SlG01VQDuxSxdPy8VMdSmhznbCqvszukWiPbnb3FyMJXyipQCen4pPNN94SZggFHBR
 Khv8/STbGnjHar2BvWcMavvK+nWHNx4/vLDyhSmKF1w724sCgNYYjRtvGQEwbJnjRTnI
 SsCBr2A7+YyYPewKZbXskdXlem0Tx0wsiuw0sTypY8DTgT8EJBv4p9x1e8jA5Gfnv02n
 YJkDQH5oaeAP9EjFiV4q4h3/aZgXkSeR+WJ8b1+dsG8AI3hq2n081ke8V2vUU6UX3Evk
 bcIsgmakIN3lF27zSgQVwm4S1yL2dE9uKV+ImcWStQjPfAsY4OfloiF484vCfyGRcmmN
 27hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5BDpWQnhgIgr6un23nDrSpiOtZvz8Bid/I/OR7bUXBg=;
 b=cXblokTo52NqmzmMCcMxbx6LHj184Gyw1AMGfh1DlNb4HdnU5C+IN6TnDwrU2QIaiU
 qGQ7qvzMNUGK6ncGMmJbsiQbo2WOXcgvzc262b/D1/bk5lt7ONAW6HcuO0Yk4l8KKCtS
 StKvQP3Hn+jjOu5ZUyh/60L8GzutsH9ZqwXwempx11Y3lffpTUgqaZGD1gcezi85MhNl
 yUJgrryGRVg9YUzply3xuJ0ESFFwcCcl54F3Pb7QzdZkBi0atz3mSiL+m0gyYw3BiwE3
 PwdgW/FJvwG9vwAEjHhVy4iwoL0ljg+912x86qTjcu+vjmTKiokLEnLpnclsXbxMirQB
 rgGA==
X-Gm-Message-State: AOAM531Wd00vzhOC/5sjz/hdA7aee1x3crDq1l0A6T474o1LgwinLR6w
 ms8KHo/iPCi+eD3aaQ6zDlHWm+emE6gUwQIQ
X-Google-Smtp-Source: ABdhPJzGWomTAcKYy8TjYtr6rv50Fq2fu7zj7OZUjLU0Hb9oHeoK5Z30y35gwYrn24hopjf/OilbsA==
X-Received: by 2002:a05:6000:1689:b0:20c:4fa1:ffb7 with SMTP id
 y9-20020a056000168900b0020c4fa1ffb7mr3111374wrd.48.1651324382219; 
 Sat, 30 Apr 2022 06:13:02 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 p9-20020adfa209000000b0020c5253d8ebsm2004439wra.55.2022.04.30.06.13.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 06:13:01 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org, Conor Dooley <mail@conchuod.ie>
Subject: [PATCH v2 8/8] riscv: dts: microchip: add the sundance polarberry
Date: Sat, 30 Apr 2022 14:09:23 +0100
Message-Id: <20220430130922.3504268-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220430130922.3504268-1-mail@conchuod.ie>
References: <20220430130922.3504268-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220430_061303_461234_BD2A0DFB 
X-CRM114-Status: GOOD (  14.79  )
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

Add a minimal device tree for the PolarFire SoC based Sundance
PolarBerry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Conor Dooley <mail@conchuod.ie>
---
 arch/riscv/boot/dts/microchip/Makefile        |  1 +
 .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 ++++
 .../boot/dts/microchip/mpfs-polarberry.dts    | 95 +++++++++++++++++++
 3 files changed, 112 insertions(+)
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
 create mode 100644 arch/riscv/boot/dts/microchip/mpfs-polarberry.dts

diff --git a/arch/riscv/boot/dts/microchip/Makefile b/arch/riscv/boot/dts/microchip/Makefile
index af3a5059b350..39aae7b04f1c 100644
--- a/arch/riscv/boot/dts/microchip/Makefile
+++ b/arch/riscv/boot/dts/microchip/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-icicle-kit.dtb
+dtb-$(CONFIG_SOC_MICROCHIP_POLARFIRE) += mpfs-polarberry.dtb
 obj-$(CONFIG_BUILTIN_DTB) += $(addsuffix .o, $(dtb-y))
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
new file mode 100644
index 000000000000..49380c428ec9
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry-fabric.dtsi
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2022 Microchip Technology Inc */
+
+/ {
+	fabric_clk3: fabric-clk3 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <62500000>;
+	};
+
+	fabric_clk1: fabric-clk1 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <125000000>;
+	};
+};
diff --git a/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
new file mode 100644
index 000000000000..96ec589d1571
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -0,0 +1,95 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2020-2022 Microchip Technology Inc */
+
+/dts-v1/;
+
+#include "mpfs.dtsi"
+#include "mpfs-polarberry-fabric.dtsi"
+
+/* Clock frequency (in Hz) of the rtcclk */
+#define MTIMER_FREQ	1000000
+
+/ {
+	model = "Sundance PolarBerry";
+	compatible = "sundance,polarberry", "microchip,mpfs";
+
+	aliases {
+		serial0 = &mmuart0;
+		ethernet0 = &mac1;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	cpus {
+		timebase-frequency = <MTIMER_FREQ>;
+	};
+
+	ddrc_cache_lo: memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x0 0x2e000000>;
+		status = "okay";
+	};
+
+	ddrc_cache_hi: memory@1000000000 {
+		device_type = "memory";
+		reg = <0x10 0x00000000 0x0 0xC0000000>;
+		status = "okay";
+	};
+};
+
+&refclk {
+	clock-frequency = <125000000>;
+};
+
+&mmuart0 {
+	status = "okay";
+};
+
+&mmc {
+	status = "okay";
+	bus-width = <4>;
+	disable-wp;
+	cap-sd-highspeed;
+	cap-mmc-highspeed;
+	card-detect-delay = <200>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	sd-uhs-sdr12;
+	sd-uhs-sdr25;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+};
+
+&mac1 {
+	status = "okay";
+	phy-mode = "sgmii";
+	phy-handle = <&phy1>;
+	phy1: ethernet-phy@5 {
+		reg = <5>;
+		ti,fifo-depth = <0x01>;
+	};
+	phy0: ethernet-phy@4 {
+		reg = <4>;
+		ti,fifo-depth = <0x01>;
+	};
+};
+
+&mac0 {
+	status = "disabled";
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
+};
+
+&rtc {
+	status = "okay";
+};
+
+&mbox {
+	status = "okay";
+};
+
+&syscontroller {
+	status = "okay";
+};
-- 
2.36.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
