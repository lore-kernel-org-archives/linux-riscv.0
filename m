Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED0EC433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  4 May 2022 20:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XQkJMW8/LYUwYJ5s2Ex014EF6QWPcOrY2z/iM9K+orU=; b=hyXkk+RmnVmz4x
	261TpUcBwvTvW0zgt7/U6rmlHeZcZYHoUT2NZ6gcsCJJ2C+79SQSR50Fgpj3ixPPCTmHkT3amCHOc
	Av+2y1hrjcpjWy/n3OP9MYfzG+1YjKCDN9TKWTtxN2b/fVTivNhzFdu/ZCpxf9ACR/IT1WXpl1Tkm
	3po9+/g+Mj+IelmkqmRA8/B/glY5O6BV9YXyhuxte1+CMYVSo5GcAx1L88u4ttY+rDfOcTfFUiRlU
	D/eqrBoFSkszIS2Ril6jBbSOg8rqltnsdA0YsM0A74UZ86IGMjODQZucF/VHZzxikEws+6un74ow0
	2LkolAQa+C/jb8sJGoOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nmLig-00CaEo-Qo; Wed, 04 May 2022 20:35:34 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nmLiY-00Ca6W-BB
 for linux-riscv@lists.infradead.org; Wed, 04 May 2022 20:35:28 +0000
Received: by mail-wm1-x32c.google.com with SMTP id
 ay11-20020a05600c1e0b00b0038eb92fa965so3911485wmb.4
 for <linux-riscv@lists.infradead.org>; Wed, 04 May 2022 13:35:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=conchuod.ie; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=fsh4pbs3Reo8M+2WhELoDR9Jgw5waXtKp+zOH5sp9UY=;
 b=BVwVA9Mihadsw+0aZxp3gkgbyCJ+Dg52FAHNdNppEqfjL91z9zMOjvJwUsz7TtzE9o
 bLajepeEas5+xQlj67PBRX07sXnY5tkzCXadRDHg+LO7lXwkI3kSJt1qTUfbKNZx9ZqD
 EjDUg3YXP3yq5wG/qpj4wrbVtoeF/0P/PLIlq3t1kEuEgwYglnpwSKgKeUYxgPOaHKMy
 wVzLEHX3D7ADUTMrsXbrhFdz1MvvG03zKypEg4SEq5b+2MJNwmOCQuOG8PT53ykhjSTt
 PzC74e7eqwqrWqNJEAofERfKaHOU5YhAco7aY9P5j7G64a6sDZXZxE5j+3K/DE7rbLsQ
 dz3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=fsh4pbs3Reo8M+2WhELoDR9Jgw5waXtKp+zOH5sp9UY=;
 b=2TSVZ/hC6j+t8tSgHBXTcD1Lu0Xzt2IMM9NZxNow4DfCxK5/V2NtC5/PIOp+GyDHji
 VPtoCym/pQthizxKON8v3x1liU6/IwitpHhuZPY8MhvRV40Xpa6jn08m80KokmuBLdqH
 ohLaqMb0EqQw3jgEyPJS9dnIB0Ky2cCtF08ZkZLDcZ9WwTFfsA4kEvfdWTCJcC+jav+z
 uwdXX8xW4gA1AgYxmwlHZzVSXh/BQoB8h2XPaIQo4H/Y5kXxFxvmCzuKSQLNW5rSzbIC
 PmMO5DVw64JCL92xvqPDRp60LdVKx6oDmbYiZE9L9ulkvjhDp1vjLkZ9WOTsft7AC29T
 Qvzw==
X-Gm-Message-State: AOAM531L4XMDz+wOVvsrwzqhEAZgO84vzm+mCwKeaXH5VYBkbbxMk9DD
 HsN32vAQ65pVXoD21nP4avH5QA==
X-Google-Smtp-Source: ABdhPJzBd2X1g1vv5U4f2un+q/En59yasOly1MTqtmipkBqEI+cZhShIPdGKAXebzJkRSYAqxPMV1g==
X-Received: by 2002:a05:600c:9:b0:393:ea67:1c68 with SMTP id
 g9-20020a05600c000900b00393ea671c68mr1127451wmc.92.1651696522583; 
 Wed, 04 May 2022 13:35:22 -0700 (PDT)
Received: from henark71.. ([109.77.36.132]) by smtp.gmail.com with ESMTPSA id
 l20-20020adfc794000000b0020c5253d8dfsm13330101wrg.43.2022.05.04.13.35.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 May 2022 13:35:22 -0700 (PDT)
From: Conor Dooley <mail@conchuod.ie>
To: krzk+dt@kernel.org,
	palmer@dabbelt.com,
	robh+dt@kernel.org
Cc: conor.dooley@microchip.com, Cyril.Jean@microchip.com,
 daire.mcnamara@microchip.com, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, palmer@rivosinc.com, arnd@arndb.de, heiko@sntech.de,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: [PATCH v4 8/8] riscv: dts: microchip: add the sundance polarberry
Date: Wed,  4 May 2022 21:30:52 +0100
Message-Id: <20220504203051.1210355-9-mail@conchuod.ie>
X-Mailer: git-send-email 2.36.0
In-Reply-To: <20220504203051.1210355-1-mail@conchuod.ie>
References: <20220504203051.1210355-1-mail@conchuod.ie>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220504_133526_447213_73AF5048 
X-CRM114-Status: GOOD (  16.60  )
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
---
 arch/riscv/boot/dts/microchip/Makefile        |  1 +
 .../dts/microchip/mpfs-polarberry-fabric.dtsi | 16 +++
 .../boot/dts/microchip/mpfs-polarberry.dts    | 97 +++++++++++++++++++
 3 files changed, 114 insertions(+)
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
index 000000000000..1cad5b0d42e1
--- /dev/null
+++ b/arch/riscv/boot/dts/microchip/mpfs-polarberry.dts
@@ -0,0 +1,97 @@
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
+		ethernet0 = &mac1;
+		serial0 = &mmuart0;
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
+	};
+
+	ddrc_cache_hi: memory@1000000000 {
+		device_type = "memory";
+		reg = <0x10 0x00000000 0x0 0xC0000000>;
+	};
+};
+
+/*
+ * phy0 is connected to mac0, but the port itself is on the (optional) carrier
+ * board.
+ */
+&mac0 {
+	status = "disabled";
+	phy-mode = "sgmii";
+	phy-handle = <&phy0>;
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
+&mbox {
+	status = "okay";
+};
+
+&mmc {
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
+	status = "okay";
+};
+
+&mmuart0 {
+	status = "okay";
+};
+
+&refclk {
+	clock-frequency = <125000000>;
+};
+
+&rtc {
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
