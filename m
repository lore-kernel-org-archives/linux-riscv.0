Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07690D3C920
	for <linux-riscv@archiver.kernel.org>; Sat, 19 Oct 2024 16:28:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ZL2mC5/Kp2yxdguzaGPKGZP9DN+DGi7JoM/XMn+GX/g=; b=3brXd7yha1LNXJ
	OftHxgYlY8X5AcdzxSEn0XCLRW8u1yyPIS9mzZPtDzXVbW51QT1QBB4PUcEIvKcDWCVvf6UFGfKtJ
	qLW9O/Scp1bWUW3ZiA4W036YKeYUNyJH+op4sy34Y8N42eDGypLNaKvhzTmQWULdwtiqoy8bxiA6O
	0SqOq/nxYXTbh5UPMvQPps7ixNewqADl/F5XvdnizBe9kV7avFMyqgfhFxtbHnuqTZIn/gqLy8aJC
	2TG6rNjDw4JozREpl+C/tSygjNkCM09cSgMEzF3aBpRapsls0Pf9KjRcn4r2ebkJCZqwSsmpZRGIw
	cRiCrt2K0nNx3IKrOijg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CJJ-00000003bRv-3WQe;
	Sat, 19 Oct 2024 16:28:13 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2CJH-00000003bR3-23Yr
	for linux-riscv@lists.infradead.org;
	Sat, 19 Oct 2024 16:28:12 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c693b68f5so34269165ad.1
        for <linux-riscv@lists.infradead.org>; Sat, 19 Oct 2024 09:28:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729355290; x=1729960090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OsH0cNinQslXDyIRyfl/9O7pxc4UGpoe6shl8RLD0+8=;
        b=SSHf3Fp6+rycBdcmXU11JO9mKn7ltPl4/zBzbYxkiTI3OyBIax+dIoeuo2cb2XwyRp
         r6Cigz72w91rJyJL9zDYdxND2oBRy8gsN3Odwku90ab6nhhSCudEVzaZXmWvTSd0V2D2
         o2zwllJTZF2rGaZglz3yZNuD/nVinB42IcKrKl2DYZGqcMhiEDFyu32L/TMxG9/eMNVR
         T+UwzYSkCFvnaVbZexYLzeV/CB52LqetpTcOsilzpHjIVpLdHoE05HepzEAmGVWV6E+b
         IQm7spVZkE+dKec439Na0kBxIzjvsJuQ1W4+Bk/YA7dCaq3DwQ07Zhe0diRetiGlM16i
         LRfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729355290; x=1729960090;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OsH0cNinQslXDyIRyfl/9O7pxc4UGpoe6shl8RLD0+8=;
        b=jkcgtv9/eEva9RjWRKJWW2CGntnNuguG7kPgj5RmQhjgKBue3EQxvx42ojVXhR2YmG
         rkCHCxwCodoaQZyWPyuwz30Gu3lZnxil8NmTbkCp7YrLhjCIrwYV8vKGPMt1IUOdMTle
         KK63CoH+YBzNWO2kwczzTXiQijzvk8A1Kyoxa+pzuwUv3InCIDuZbxSGV7NRrtfCmnbA
         mG8bxkJxv5pqYyYaNG6Xmi/HMVyPbQJvXwdsoEoxIDMZR+PwusW6Hy5Z5dcS2fVYoSpH
         hMbk+XS22yt5TRPySXNXVPoLvjuPntZeSh5QDIVYM3xESUZT7G/ydNY/s0TPR13dNMU+
         u0uw==
X-Forwarded-Encrypted: i=1; AJvYcCVN7Sl9yiuOki/oadOTD83S7todxFqLgIxWesw20y0vQkoHpuY/uLydvONhrpL9so7x0qsGrNCL3PLBTA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwyrAt8Z1nmgYfRuLPLUm4EohujhsnnTYKWXk8tiG14VzLx8+JR
	nrAgztuHLUgjcwUIFzdoh95R/IDSqxGwW78Kvnf6msqjHfmYo0yJKJ+STAtaokc=
X-Google-Smtp-Source: AGHT+IGYR5eUJwXGMxy7HdyPRDQKE3DHw/4XPlT1k5OHVZitlhHw/yWOFKmVSy270AIpQ0J0HATvDg==
X-Received: by 2002:a17:902:e892:b0:20b:bac2:88f3 with SMTP id d9443c01a7336-20e5a93ab46mr65799075ad.53.1729355290154;
        Sat, 19 Oct 2024 09:28:10 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::30df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e5a8de4bdsm29567625ad.180.2024.10.19.09.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Oct 2024 09:28:09 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v4 3/3] riscv: dts: starfive: add DeepComputing FML13V01 board device tree
Date: Sun, 20 Oct 2024 00:26:05 +0800
Message-Id: <20241019162605.308475-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241019162605.308475-1-guodong@riscstar.com>
References: <20241019162605.308475-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241019_092811_560210_5D199FCC 
X-CRM114-Status: GOOD (  14.53  )
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

From: Sandie Cao <sandie.cao@deepcomputing.io>

The FML13V01 board from DeepComputing incorporates a StarFive JH7110 SoC.
It is a mainboard designed for the Framework Laptop 13 Chassis, which has
(Framework) SKU FRANHQ0001.

The FML13V01 board features:
- StarFive JH7110 SoC
- LPDDR4 8GB
- eMMC 32GB or 128GB
- QSPI Flash
- MicroSD Slot
- PCIe-based Wi-Fi
- 4 USB-C Ports
 - Port 1: PD 3.0 (60W Max), USB 3.2 Gen 1, DP 1.4 (4K@30Hz/2.5K@60Hz)
 - Port 2: PD 3.0 (60W Max), USB 3.2 Gen 1
 - Port 3 & 4: USB 3.2 Gen 1

Create the DTS file for the DeepComputing FML13V01 board. Seven device
nodes have been verified functional and remain enabled: i2c2, i2c5, i2c6
qspi, mmc0, mmc1 and usb0.  All others remain disabled, or are disabled
by nodes in "jh7110-deepcomputing-fml13v01.dts".

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
[elder@riscstar.com: revised the description, updated some nodes]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v4: Changed model string to "DeepComputing FML13V01"
    Changed dts filename and Makefile accordingly to reflect the change
    Updated device nodes status, and verified functional
    Revised the commit message
v3: Updated the commit message
v2: Changed the model and copmatible strings
    Updated the commit message with board features

 arch/riscv/boot/dts/starfive/Makefile         |  1 +
 .../jh7110-deepcomputing-fml13v01.dts         | 44 +++++++++++++++++++
 2 files changed, 45 insertions(+)
 create mode 100644 arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts

diff --git a/arch/riscv/boot/dts/starfive/Makefile b/arch/riscv/boot/dts/starfive/Makefile
index 7a163a7d6ba3..b3bb12f78e7d 100644
--- a/arch/riscv/boot/dts/starfive/Makefile
+++ b/arch/riscv/boot/dts/starfive/Makefile
@@ -8,6 +8,7 @@ DTC_FLAGS_jh7110-starfive-visionfive-2-v1.3b := -@
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-beaglev-starlight.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7100-starfive-visionfive-v1.dtb
 
+dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-deepcomputing-fml13v01.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-milkv-mars.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-pine64-star64.dtb
 dtb-$(CONFIG_ARCH_STARFIVE) += jh7110-starfive-visionfive-2-v1.2a.dtb
diff --git a/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
new file mode 100644
index 000000000000..b515b7d04c37
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -0,0 +1,44 @@
+// SPDX-License-Identifier: GPL-2.0 OR MIT
+/*
+ * Copyright (C) 2024 DeepComputing (HK) Limited
+ */
+
+/dts-v1/;
+#include "jh7110-common.dtsi"
+
+/ {
+	model = "DeepComputing FML13V01";
+	compatible = "deepcomputing,fml13v01", "starfive,jh7110";
+};
+
+&camss {
+	status = "disabled";
+};
+
+&csi2rx {
+	status = "disabled";
+};
+
+&gmac0 {
+	status = "disabled";
+};
+
+&i2c0 {
+	status = "disabled";
+};
+
+&pwm {
+	status = "disabled";
+};
+
+&pwmdac {
+	status = "disabled";
+};
+
+&spi0 {
+	status = "disabled";
+};
+
+&usb0 {
+	dr_mode = "host";
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
