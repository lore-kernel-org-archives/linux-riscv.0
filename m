Return-Path: <SRS0=/MXx=UB=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,T_DKIMWL_WL_HIGH,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B6FAC28CC5
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  2 Jun 2019 08:01:47 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 548852787C
	for <infradead-linux-riscv@archiver.kernel.org>; Sun,  2 Jun 2019 08:01:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Y1h3TY9U";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="KnMJLtBs"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 548852787C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=xpNk2OBndVn7pqpWQ80y4cXEw/45bkWFJLxeVA99Ado=; b=Y1h3TY9UGzx1LS
	ILlVtbTQ4HoCZduTlHM3+GXnHCWT3rFwMAVx6jMg34zRoOIWFvp4Jty70RG002x8wyqNIp63nr8D7
	jfdwRH4BVDPGD/sHGNrS/1jNqpS7dc86NzgYiZ1maDsGpMdJcZpRFp5WF2NZx04+VEPneZZRaH+n/
	fCZmDRDL7e6JvctPQXckGE0g4ZN/zmoEp2FPP/SjWJerHa0DO7wWMu3bURJkW0g04Lh4WOlslvzkX
	yoAnyfe5AxrtwEG//VXW58xCir4lL5dCEUPeEMGvEIGlau4rB/7Bs7stnbOoFa27P7Fu30PYlCMWD
	M4fl1Jc0T8NzW4aycZpg==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hXLR3-0003SV-OG; Sun, 02 Jun 2019 08:01:45 +0000
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hXLQx-0003Hc-CY
 for linux-riscv@lists.infradead.org; Sun, 02 Jun 2019 08:01:42 +0000
Received: by mail-wm1-x343.google.com with SMTP id c6so5458204wml.0
 for <linux-riscv@lists.infradead.org>; Sun, 02 Jun 2019 01:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=QmaqjHAcXNQW/qmNDVGvURxfu0pBpsioEB7U9HBButg=;
 b=KnMJLtBsseT1bxIDzuc1GshNCeheeDB9wYClyyns9MbVkCybtiy2J0a0RNmM3mdc3W
 D/7uBtIjzz1fNraYryAaUaP4zSqwZOuSgDMDicUDJau+mFTVNnb8ZZNEg/+tTwBdIJ3N
 2upGBHuzAR7XhNRngSEr24PS9VivSIld/8cW/yJ23NyFilUeGz7X581Urh7PJCfluDsy
 E/w4NjIa2lHJEMCjF5Nvt3xX3AEV0QPmjcEpAQxNmm7tndSl2Im5R2T3bgfEeCGOqdc8
 nVlh6Ww0ci+9iaP/cTyCyi5ny2lsITh8YI4pomOaOaIkVyocy0bmzmcq47a6MYiuMQTX
 AY9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=QmaqjHAcXNQW/qmNDVGvURxfu0pBpsioEB7U9HBButg=;
 b=mywVksewMRo3+SlROIdu2q+296flb52reNY39RdC//GAkofHbagjXpUaOuqa76MBxm
 CMMtirtN/DT4WZ0Usl9zeGHHXUmFrY5RYxkGq9/pCPJh8iU5kEAQnqxzYcQvJy8Fs3EA
 VfPG74boBGjPUAlEke3JvA1PP5DsVCT8RNv2DjXwx8Qqr3G69ntKkttRBgC6LeQPd0IL
 4bgzsXqhuUZ6+kxydVSzW/9joUwboztIjP5cKFshiPxEJXXVKmMtaNbZ6uEwFXrEWVBN
 Cx5dhon56RfRsmmUjeHVItkXm4FLo1hBSP/L0Ktsnx9A1ubFA3sPjwC/j05sHvOZ4AZE
 4JHQ==
X-Gm-Message-State: APjAAAUZMlB6clmBNCB+eMRxvdqjZceYBf+vMrkGztI5Y/0lik9ihACl
 qsTgkH973rbwtDCh3K6BLEog/fLl72c=
X-Google-Smtp-Source: APXvYqyggDZuulV0HbBw/YlqrgIXUoR9PW2bG61t21dH3kwKrBuNkRZall/GUJyHL7C4aF3TiEsDJA==
X-Received: by 2002:a1c:2c41:: with SMTP id s62mr715294wms.8.1559462498010;
 Sun, 02 Jun 2019 01:01:38 -0700 (PDT)
Received: from viisi.fritz.box (217-76-161-89.static.highway.a1.net.
 [217.76.161.89])
 by smtp.gmail.com with ESMTPSA id y133sm4868583wmg.5.2019.06.02.01.01.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 02 Jun 2019 01:01:37 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org
Subject: [PATCH 5/5] riscv: dts: add initial board data for the SiFive HiFive
 Unleashed
Date: Sun,  2 Jun 2019 01:01:26 -0700
Message-Id: <20190602080126.31075-6-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190602080126.31075-1-paul.walmsley@sifive.com>
References: <20190602080126.31075-1-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190602_010139_652021_22ADEAAE 
X-CRM114-Status: GOOD (  12.53  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org,
 Paul Walmsley <paul@pwsan.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Palmer Dabbelt <palmer@sifive.com>, Rob Herring <robh+dt@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial board data for the SiFive HiFive Unleashed A00.

Currently the data populated in this DT file describes the board
DRAM configuration and the external clock sources that supply the
PRCI.

This third version incorporates changes based on more comments from
Rob Herring <robh+dt@kernel.org>.

Signed-off-by: Paul Walmsley <paul.walmsley@sifive.com>
Signed-off-by: Paul Walmsley <paul@pwsan.com>
Cc: Rob Herring <robh+dt@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: devicetree@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/riscv/boot/dts/sifive/Makefile           |  2 +
 .../boot/dts/sifive/hifive-unleashed-a00.dts  | 67 +++++++++++++++++++
 2 files changed, 69 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts

diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
new file mode 100644
index 000000000000..baaeef9efdcb
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-y += hifive-unleashed-a00.dtb
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
new file mode 100644
index 000000000000..1de4ea1577d5
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00.dts
@@ -0,0 +1,67 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+/* Copyright (c) 2018-2019 SiFive, Inc */
+
+/dts-v1/;
+
+#include "fu540-c000.dtsi"
+
+/* Clock frequency (in Hz) of the PCB crystal for rtcclk */
+#define RTCCLK_FREQ		1000000
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+	model = "SiFive HiFive Unleashed A00";
+	compatible = "sifive,hifive-unleashed-a00", "sifive,fu540-c000";
+
+	chosen {
+	};
+
+	cpus {
+		timebase-frequency = <RTCCLK_FREQ>;
+	};
+
+	memory@80000000 {
+		device_type = "memory";
+		reg = <0x0 0x80000000 0x2 0x00000000>;
+	};
+
+	soc {
+	};
+
+	hfclk: hfclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <33333333>;
+		clock-output-names = "hfclk";
+	};
+
+	rtcclk: rtcclk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <RTCCLK_FREQ>;
+		clock-output-names = "rtcclk";
+	};
+};
+
+&qspi0 {
+	flash@0 {
+		compatible = "issi,is25wp256", "jedec,spi-nor";
+		reg = <0>;
+		spi-max-frequency = <50000000>;
+		m25p,fast-read;
+		spi-tx-bus-width = <4>;
+		spi-rx-bus-width = <4>;
+	};
+};
+
+&qspi2 {
+	status = "okay";
+	mmc@0 {
+		compatible = "mmc-spi-slot";
+		reg = <0>;
+		spi-max-frequency = <20000000>;
+		voltage-ranges = <3300 3300>;
+		disable-wp;
+	};
+};
-- 
2.20.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
