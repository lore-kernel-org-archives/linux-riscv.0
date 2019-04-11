Return-Path: <SRS0=Og1w=SN=lists.infradead.org=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3492AC282CE
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:54 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0528E21841
	for <infradead-linux-riscv@archiver.kernel.org>; Thu, 11 Apr 2019 08:43:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="Hjnrv9Ja";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=sifive.com header.i=@sifive.com header.b="CLRlNpcJ"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 0528E21841
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=sifive.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ClcBB+rpfZJHd95R5E4sB0HY/KRxAZe2xUcno7V7dFo=; b=Hjnrv9JaoiLiTF
	StXvyj7guWq6HsikHnv+pirkOFSCXKmuB7VucIuqt1/8RK7qAmltdO3JIpEj8tMdqiBekM9GJhRVM
	LWp9EK9BxPeiCDQxLumVQWFrDsagwpKkQ2yLSPITNTHo4wr93aaiNJoiPqE2wzNr+VkRHW2GxDaNr
	utDO3plUuqMYmHVWKfzfv6xMfuTRN+AsC9HOYXqJpVjWzCmaNG7UFByBI0SvBYC+FKcLK3wC/ErhI
	fDVz1n4rVLhN+gui5VdpUqSahRu7ENaNkQ5aRseNxrxXVirLoeF9ldHtpApRHqcP+Ug7uVgc5c0kg
	+Say3KMLr/lTEYLSp51Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.90_1 #2 (Red Hat Linux))
	id 1hEVJH-0000zD-E0; Thu, 11 Apr 2019 08:43:51 +0000
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1hEVJE-0000y2-Ul
 for linux-riscv@lists.infradead.org; Thu, 11 Apr 2019 08:43:50 +0000
Received: by mail-pg1-x544.google.com with SMTP id 85so3194488pgc.3
 for <linux-riscv@lists.infradead.org>; Thu, 11 Apr 2019 01:43:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=sifive.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V7iT3ZB4whlJ7SaEMLeDA/+Cc985ijuEksdJYrKjTpo=;
 b=CLRlNpcJJbab4Iw8f/mERFQkjxdFOzFwrtqG1jfj0qkFSLLPNduyh/67TxTfm3E4rM
 xlBm7uMwRkmPu0oidetWo0OtkZ6Qg/Zrfk7N6JW8m+Y56R0EUYMaUwdVJ9nYdKg14R+j
 cHFKt7cgIR9FFCWsxUcVm6Lp4EAml7pUsocuqfU5/W9bTtz5F+keGJ1OX4/8zOKnSeg7
 knh0d0iVWdvIjgSsfeD9fZ7DVWqFNGPEzkAKTZLSTh57POI+kDBC5eyF+ArohmqEzlJ1
 JUaHGPrKgLFQdvhPBX7NZxC1H2iBupCjedpOPdIyF5QB+rum00bxu6bLNihYWDkyCHuq
 fsxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V7iT3ZB4whlJ7SaEMLeDA/+Cc985ijuEksdJYrKjTpo=;
 b=n2f0eqgKQTFX/SkBqoVyAjbznb9nLwtY3gvEvtcsJz4IGLyODV94SCcW4QHVweH8Bi
 anI1bZEzunDyWWv/jRzzaX4eyidbwdPdmb+kO9NIBhn4U0Bq4lRVLVdYx40Aqy1JCnz1
 2WGlAWYkX/OyIvWfYoRyoHiA1vcInEj8md5i3Dj/iRja9ns5XzQe80+TQl6mw64S2KLk
 IDlmgE5hbhQG1J+jhlvszc1gBATXgCQwk5Okdfnzq2j2mUtiWpM/ceW58Mjl6dU1YuNq
 DPtjhxaMOnJdsv/n2YJxClJ5U3A1FvrzUFQhQ9AC9raNhk0HinZOgehf0NVi4fSIX2zG
 g5Ow==
X-Gm-Message-State: APjAAAVg3PvvySr4oD8ZGKjGNoqEw4xb62yZljC7ZpdIGac4QgmmRiiq
 bpB4WFSzDsOUqvS9ILAeWAjoWQ==
X-Google-Smtp-Source: APXvYqye6k8PBckeC3MlXT5CqlZpgGSMhiXHEShG1oez7V70W9vgoDKcQYLFbBEM/CVb4g2nbAqN/w==
X-Received: by 2002:aa7:9193:: with SMTP id x19mr49302325pfa.108.1554972228269; 
 Thu, 11 Apr 2019 01:43:48 -0700 (PDT)
Received: from viisi.sifive.com ([12.206.222.5])
 by smtp.gmail.com with ESMTPSA id a3sm61699456pfn.182.2019.04.11.01.43.47
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 11 Apr 2019 01:43:47 -0700 (PDT)
From: Paul Walmsley <paul.walmsley@sifive.com>
To: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org
Subject: [PATCH 5/6] riscv: dts: add initial board data for the SiFive HiFive
 Unleashed
Date: Thu, 11 Apr 2019 01:43:03 -0700
Message-Id: <20190411084304.5072-6-paul.walmsley@sifive.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190411084304.5072-2-paul.walmsley@sifive.com>
References: <20190411084304.5072-2-paul.walmsley@sifive.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20190411_014348_992314_14212C67 
X-CRM114-Status: GOOD (  14.00  )
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
Cc: Mark Rutland <mark.rutland@arm.com>, Paul Walmsley <paul@pwsan.com>,
 Albert Ou <aou@eecs.berkeley.edu>, Palmer Dabbelt <palmer@sifive.com>,
 Rob Herring <robh+dt@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+infradead-linux-riscv=archiver.kernel.org@lists.infradead.org

Add initial board data for the SiFive HiFive Unleashed A00.

Currently the data populated in this DT file describes the board
DRAM configuration and the external clock sources that supply the
PRCI.

This second version adds onboard SPI device data, fixes the board's
memory size, and adds changes based on comments from Rob Herring
<robh+dt@kernel.org>.

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
 .../dts/sifive/hifive-unleashed-a00-fu540.dts | 69 +++++++++++++++++++
 2 files changed, 71 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sifive/Makefile
 create mode 100644 arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts

diff --git a/arch/riscv/boot/dts/sifive/Makefile b/arch/riscv/boot/dts/sifive/Makefile
new file mode 100644
index 000000000000..fb825db888df
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0
+dtb-$(CONFIG_ARCH_SIFIVE) += hifive-unleashed-a00-fu540.dtb
diff --git a/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
new file mode 100644
index 000000000000..9d35e811a3aa
--- /dev/null
+++ b/arch/riscv/boot/dts/sifive/hifive-unleashed-a00-fu540.dts
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (Apache-2.0 OR GPL-2.0+)
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
+	model = "SiFive HiFive Unleashed A00 (FU540-C000)";
+	compatible = "sifive,hifive-unleashed-a00-fu540",
+		"sifive,hifive-unleashed-fu540",
+		"sifive,fu540-c000", "sifive-fu540";
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
+		compatible = "issi,is25wp256d", "jedec,spi-nor";
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
