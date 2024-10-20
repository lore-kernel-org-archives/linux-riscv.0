Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48420D3C92D
	for <linux-riscv@archiver.kernel.org>; Sun, 20 Oct 2024 13:51:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=GZxYk376t4M3dAOfeN1F+mdJFFxXzMRZaAra21BNnks=; b=1jKIQFXK1rjlvC
	E+EqsgXfV9DUAis6iKUs6557pQjZH55bbKyDyLL84U9aKFLvXH+YHkEeThG9L2gCcq5ChApIeLz4e
	hOLYc8INkTQ/kwONrWQ/QOKhZUkOQ+41uxvNvCdIqLvLTTw886mT+D64SwEJ4n9s9RaogrBjleoaQ
	8hGz4fgGu+SVJ5LtqrTo1U33+1m/DZPYBDcP451ILmgZsKmbv6Bcbt6zgQMrCAZc+Uaem1TWh0ZBY
	JISJJ53V7xctqXBNDUGDSSpA5bx8pY1P1r2OHFk/glboJmVF5khRAsNw+pcJJy3dQYulleQ7+Fzrl
	1Z3M9DNnKXCbNEYjrfGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WLa-00000004xnA-3Dhs;
	Sun, 20 Oct 2024 13:51:54 +0000
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2WLY-00000004xmQ-3u9E
	for linux-riscv@lists.infradead.org;
	Sun, 20 Oct 2024 13:51:54 +0000
Received: by mail-pl1-x635.google.com with SMTP id d9443c01a7336-20c9978a221so41834565ad.1
        for <linux-riscv@lists.infradead.org>; Sun, 20 Oct 2024 06:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1729432312; x=1730037112; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dihnrmjt0Cx1sW6hIV5b9q9IzCAC+S03ZrQpLAf6DXI=;
        b=m0pTdOzMFo/3er2ULobXFRqW+JifUrzJxtOSxUv1NFisUlUeebo6vlEfBCqchbX0KF
         MIvudIbsB+qA3E3TNao9I3bRoIuZv3agUcL19Dw/8En0IiBBo9vgNLeOsX3BY2oZ10QE
         xpGLh+94Fyca2VG8rDX1WM6D/fMzO6W1INonoZEIujm+m9h8XUtTpEUu5ES7aWIEiUpS
         3Bk3QBEqZjwcVbWnNCeYvhYvRfyTlZaSZW4iUoJzpRHsON8pPs3N4XEQG8gxsjIFgbuB
         J37A0Itcwv4BuIJlOBzBqc0EIhN1NhPh0tDzkefT1R053AyV3VMhedLbFGVcE/vCr9st
         rzrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729432312; x=1730037112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Dihnrmjt0Cx1sW6hIV5b9q9IzCAC+S03ZrQpLAf6DXI=;
        b=W3NZ4USU2+N69Pnql+2cCTn28WmZWW7RUbG6zVBHuJjnrK3fGX62VOEyaAcBZQ1j1I
         0e78tuToFt1QYQRubzSYgtNRB1okgSkn4tcnzo86QVJbxHLRRwGXtd9w1RqxIhkW3oTF
         IDoJ3Vmreoi3dHn6SxMF0xmC5HmLxtJCbmLNiP46BzNfobM+hQgywKa0EnILeZqqCoB/
         vV1hHepcTP0pT5bHOANGa6kTB4xrxSUqg++zNr6UgsHiNSoiqDJ6Wf7yKXjHs6kFIohc
         iuF1DDne34glQiq3OYCwTjDj6zGogqkQPtxQFpJCspPqD2ZyYqjDBe/m6La79gnSEfat
         Cw0g==
X-Forwarded-Encrypted: i=1; AJvYcCUh64w2ygx1j8E22jwqIMTvlOxV0zMT1wDRRhMomyYyVD+03jdxSU72kEaVLXBHO+PxZJEsC6WLuXqffw==@lists.infradead.org
X-Gm-Message-State: AOJu0YwBS/tVnQqn53TA4NIViPVkGzmhV4MxkdvOJs2d2jpoZKHAadQc
	b+7vm20H0UPVs+d7YwmsUe4Jhpy9b4WoMeLA0TN8x9uueD24Krn59AtSKN8IXtY=
X-Google-Smtp-Source: AGHT+IE0C8U3ppaL1ZcOhngjMTld2ijPjY1NBwe1b/U8l0HwDFa5HUPH4SIbia5o3FNaHcPCORuA4g==
X-Received: by 2002:a17:902:e845:b0:20b:ab4b:544a with SMTP id d9443c01a7336-20e5a8ee9e6mr114664235ad.43.1729432311986;
        Sun, 20 Oct 2024 06:51:51 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40df])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-20e7eee63f0sm10554935ad.3.2024.10.20.06.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Oct 2024 06:51:51 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: Conor Dooley <conor@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Emil Renner Berthing <kernel@esmil.dk>,
	rafal@milecki.pl,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Heiko Stuebner <heiko.stuebner@cherry.de>,
	Michael Zhu <michael.zhu@starfivetech.com>,
	Drew Fustini <drew@beagleboard.org>,
	Alexandru Stan <ams@frame.work>,
	Daniel Schaefer <dhs@frame.work>,
	Sandie Cao <sandie.cao@deepcomputing.io>,
	Yuning Liang <yuning.liang@deepcomputing.io>,
	Huiming Qiu <huiming.qiu@deepcomputing.io>,
	Alex Elder <elder@riscstar.com>,
	linux@frame.work,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Guodong Xu <guodong@riscstar.com>
Subject: [PATCH v5 3/3] riscv: dts: starfive: add DeepComputing FML13V01 board device tree
Date: Sun, 20 Oct 2024 21:49:59 +0800
Message-Id: <20241020134959.519462-4-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241020134959.519462-1-guodong@riscstar.com>
References: <20241020134959.519462-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241020_065152_997131_AF32A09F 
X-CRM114-Status: GOOD (  13.87  )
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
v5: No change
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
