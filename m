Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43386CCD187
	for <linux-riscv@archiver.kernel.org>; Sat, 11 Oct 2025 01:48:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=UwgWBcVz/ojbPr5Db8lnRHq1IpKvNDztKZBuEKaO67E=; b=ZoSXh66waXasgO
	ikXVOYuDccL1XzSoPfxlfQrBs+uHFbzH4UKokQHNuvT3l3OsOS+XsEW0rhbKi0vGg1CK6cD0dDbUk
	Qu0zE8yFaTLXqo/h5rYvRlGeVPBc98MprtB5gfEEeBO8JNXDqe483bJavv+Q/kXnIAb6oFZBvUrJq
	xZZylCSJr0TZHXnTEpKazAcD4+Dph3e6qP6Od52XUU51XcVAVCmSoCXL5eqxGW7AM4NgLssKAd9P1
	fZK8ogIa4RDWs9rgFjFyCi2gnl0ziE+ETAEna3w+O/rafC1vu8nMSzwBVQxgH8XVcpBRWuACZ9j14
	lO+nnJCI7sFy2HgZiGNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oiw-00000009fO1-0W9L;
	Sat, 11 Oct 2025 01:48:42 +0000
Received: from mail-qv1-xf34.google.com ([2607:f8b0:4864:20::f34])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7Oit-00000009fMs-2QVG
	for linux-riscv@lists.infradead.org;
	Sat, 11 Oct 2025 01:48:40 +0000
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-7900f7f4ba9so27978056d6.0
        for <linux-riscv@lists.infradead.org>; Fri, 10 Oct 2025 18:48:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760147318; x=1760752118; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RIx1itjFNeOuO9y5R/ZOGp9p0NGiRIG2Jwe8FwimfPU=;
        b=awVuDEmXl+nKH3jARAq2cZOj/3dpOrlpt6TgrUneqY0yrkxIimC4YcCIzP7d5t6EU8
         sudfLG1Imk+XL8KAylaga+NPoOOO3NZFMCeLk2KAB50gJDBkbCAD1YSw+2l2aSSHP33p
         a8j7V7zAYgsYgnmMkRXVE1Lc8BQU8IRCzJP3GpIUpdWmH/QSruVQaTGJf0+aRqfbeE5C
         Fu8aWm33yhO6rQAprCg6uF/45Vp4YW6fzFo5IOAch3hFu0Y6TlN31T2HJSbnd7OQXmaI
         euDMEL2VWe9x66lG9bf7phPayhYTIiHT2lL8Cyx/etVPSkzKt49erg8wEjdHBjHQfom+
         wMaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760147318; x=1760752118;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RIx1itjFNeOuO9y5R/ZOGp9p0NGiRIG2Jwe8FwimfPU=;
        b=L3t8QaNd4gk/X4haIBK3cSmsJ3BlfFQpvWTplrfBbMUbYAaGK6VxsOtkv0/vqnxcfq
         SKqKEi68JtRfjBPItIKftheStgR3w5aa+wTKm2ALnotznJTz2kT43dOIRI8O2eNmGkXE
         WB1nufTCOQzAFPOg9qmC6l9hfatZKp1/hZmFK836dq3oDG5nIprNXgNCqXCXi1TweDAN
         Rh8MD4iZXVM3i9aZ3zZE9JgIZ9Jfo5aIdEatLyOZMkPk8qVy/yLuan8nq+XOrUr0G8Sq
         lTCbX1Oo+zt6G6lOYyZtJdLZvljJm5GNZqvxtITGdPA+77qLXajQcogDP87etagetkz3
         iFWA==
X-Forwarded-Encrypted: i=1; AJvYcCUv22xBF1/M6dxn+mvcDyTeWd0SAioJTlRP05lgIyyjYyHOsRyR+dyH3hOhRngE1o4C812CbR5sXVwSWQ==@lists.infradead.org
X-Gm-Message-State: AOJu0Yyq8xjqG/AALkOVParYbqHbe45Olr7Vlx1Pu1FixxMq5v8K5lsc
	KrlF2CwkhNTclvuA85OcRMIDenBkqZ9Wj1OMzpBf2uJl9KDb7mSBc7fx
X-Gm-Gg: ASbGncvA9JtzXTEHg6NcGKdzl/Hkv7by2NblT/fsZ2xfG27gMO05k+LkMKKxP0W4Sms
	1DJ115TtlBss6u2hbZdvrdkDDncks+IKX0DRtJPlchQAtYEO9Zu8mM3Z2Y4Bn8PFWB3zVyvdPGf
	S0dek7A2POBetTbXGM2Z/pBaaNIibADZohIE0xOIaCQL7SC1rpQpZhjq9i8eYHmSef69xJLnyZn
	sxje3fIw5DAijknkPnqtlMiZ47svW/5azE6I3LkVQxGyarHJTfDkY0CopA8babrphWB2Wts4prE
	AW/zZOWAQm46ziX0YYK0InMumfQGtVvpXRUU04xLjnFARCPBHhCwhUPuFpIDEYW18WDiypnB246
	X5RbxrB/N+QicLn5bIymyI7Y1a9+WsaUfNINdM6K4mQSW0ee66twprXTx974BI/z4UskAk0kcU0
	DjJIpoTfY+JQ==
X-Google-Smtp-Source: AGHT+IHsJX5xKPE9NIlN342PbeK4r3FqiE68JLAtPVlnnBojsMsq6v3jWNk3iQRbqde8hfvSUe7K1Q==
X-Received: by 2002:a05:6214:4114:b0:78f:145b:56cc with SMTP id 6a1803df08f44-87b2ef4e9admr185883456d6.51.1760147318377;
        Fri, 10 Oct 2025 18:48:38 -0700 (PDT)
Received: from sleek (d-23-244-200-70.nh.cpe.atlanticbb.net. [23.244.200.70])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc3574e71sm25978806d6.36.2025.10.10.18.48.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Oct 2025 18:48:38 -0700 (PDT)
From: Joshua Milas <josh.milas@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	unicorn_wang@outlook.com,
	inochiama@gmail.com,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	alexander.sverdlin@gmail.com,
	rabenda.cn@gmail.com,
	thomas.bonnefille@bootlin.com,
	chao.wei@sophgo.com,
	liujingqi@lanxincomputing.com
Cc: josh.milas@gmail.com,
	devicetree@vger.kernel.org,
	sophgo@lists.linux.dev,
	linux-riscv@lists.infradead.org
Subject: [PATCH 3/3] riscv64: dts: sophgo: add initial Milk-V Duo S board support
Date: Fri, 10 Oct 2025 21:48:11 -0400
Message-ID: <20251011014811.28521-4-josh.milas@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251011014811.28521-1-josh.milas@gmail.com>
References: <20251011014811.28521-1-josh.milas@gmail.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251010_184839_632375_DACE8753 
X-CRM114-Status: GOOD (  12.66  )
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

This adds initial riscv support for the Milk-V Duo S board
[1] making it possible to boot Linux to the command line.

Link: https://milkv.io/duo-s [1]

Signed-off-by: Joshua Milas <josh.milas@gmail.com>
---
 arch/riscv/boot/dts/sophgo/Makefile           |   1 +
 .../boot/dts/sophgo/cv1812h-milkv-duo-s.dts   | 110 ++++++++++++++++++
 2 files changed, 111 insertions(+)
 create mode 100644 arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts

diff --git a/arch/riscv/boot/dts/sophgo/Makefile b/arch/riscv/boot/dts/sophgo/Makefile
index 6f65526d4193..49d6ae4724ea 100644
--- a/arch/riscv/boot/dts/sophgo/Makefile
+++ b/arch/riscv/boot/dts/sophgo/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1800b-milkv-duo.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-huashan-pi.dtb
+dtb-$(CONFIG_ARCH_SOPHGO) += cv1812h-milkv-duo-s.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2002-licheerv-nano-b.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-milkv-pioneer.dtb
 dtb-$(CONFIG_ARCH_SOPHGO) += sg2042-evb-v1.dtb
diff --git a/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
new file mode 100644
index 000000000000..2ab46ec1fc0e
--- /dev/null
+++ b/arch/riscv/boot/dts/sophgo/cv1812h-milkv-duo-s.dts
@@ -0,0 +1,110 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/pinctrl/pinctrl-cv1812h.h>
+#include "cv1812h.dtsi"
+
+/ {
+	model = "Milk-V Duo S";
+	compatible = "milkv,duo-s", "sophgo,cv1812h";
+
+	aliases {
+		mmc0 = &sdhci0;
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+		serial3 = &uart3;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&osc {
+	clock-frequency = <25000000>;
+};
+
+&dmac {
+	status = "okay";
+};
+
+&emmc {
+	bus-width = <4>;
+	no-1-8-v;
+	cap-mmc-hw-reset;
+	no-sd;
+	no-sdio;
+	non-removable;
+	status = "okay";
+};
+
+&gmac0 {
+	status = "okay";
+};
+
+&i2c1 {
+	status = "okay";
+};
+
+&i2c2 {
+	status = "okay";
+};
+
+&i2c3 {
+	status = "okay";
+};
+
+&i2c4 {
+	status = "okay";
+};
+
+&mdio {
+	status = "okay";
+};
+
+&saradc {
+	status = "okay";
+};
+
+&sdhci0 {
+	bus-width = <4>;
+	no-1-8-v;
+	disable-wp;
+	status = "okay";
+};
+
+&sdhci1 {
+	bus-width = <4>;
+	cap-sdio-irq;
+	no-mmc;
+	no-sd;
+	non-removable;
+	status = "okay";
+};
+
+&spi0 {
+	status = "okay";
+};
+
+&spi3 {
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
+
+&uart1 {
+	status = "okay";
+};
+
+&uart2 {
+	status = "okay";
+};
+
+&uart3 {
+	status = "okay";
+};
+
-- 
2.51.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
