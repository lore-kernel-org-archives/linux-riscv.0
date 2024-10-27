Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6327D13564
	for <linux-riscv@archiver.kernel.org>; Sun, 27 Oct 2024 14:47:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XfCPEDuJYawhPC272h5BsXRA8OeiFRqY5Fsr4PveCu8=; b=fMm/sztHzEykEJ
	5lyKdvwZl8bbvvSBJFlIB3/LiYaScxdRfGdSTdtyMq8gmzRCGxCuPOpiJ13AIGM7r7rGzdyYhxvDY
	R8KYhPgWun3hEVuZdu+gFGVqTyXgOxsTSuWLZTFeObf0zXUcZS2eSqbrRC7NjOodLkxH3oXlev0Ba
	qVXv29HwIqtKfEhaCF9XFY69B2wHnnK0/RaP/yIFdGjiI5nZ4xL4r25ojrWpUvWbt9YrmxvWd8VVe
	sWLOGR3aFroecq/zxrVyaM4B3CMTUZwcAlLyIAILH7KG1d32vbpOf4YVyKc8XG8JaCn3XhGtjxGmP
	x9GBjl/Xif8RBgg7B1bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t54YA-00000008RHk-1Q1A;
	Sun, 27 Oct 2024 14:47:26 +0000
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t54Y6-00000008RGK-2lg9
	for linux-riscv@lists.infradead.org;
	Sun, 27 Oct 2024 14:47:24 +0000
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-7205646f9ebso1627173b3a.0
        for <linux-riscv@lists.infradead.org>; Sun, 27 Oct 2024 07:47:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730040441; x=1730645241; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+wvAtnVKug+duYdZaolG15HbB51AquCXywvQfcB1XNM=;
        b=oHvWUcrM4qYyOnKz7tuM3lhgOgjnWULB9jsY2SKoi0/HOB3DOFqP0Ubw/zUGaM1f9v
         BRHgVU/5eWwNlxTTQo21iFky0lttPqajz0e7yDt0AuEmXhhvQIFx4q0DjEekzIRecVq+
         9VM35h9df2WC/9rnoiGwT4XFoK77i31ow6OJfYOcbsw3Ect2+iXQoD16zhHPLLUzmQlP
         QmH4FiHVuYxGshr1UD90D04dSKCb9OdvRDFyGkAp0/nTJfs/R3tugyRApGJqOU/DEg+D
         sQgeO5/WHxX2yxIXEx0IHfEkJgQN5MV6lQAfcBtOSWV+qLbOV7WzazuuV2Lw8eNoFhH1
         kukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730040441; x=1730645241;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+wvAtnVKug+duYdZaolG15HbB51AquCXywvQfcB1XNM=;
        b=eJ2+u3nRjnnp02fBjjq5yzjnoJYThXWMhhSGo6G/iSktyrIiseB785OwHMvxfJPyBr
         onJOhlZ5RJM3Ktr2aAI05Al3p0RCBRb3NKce3duDC7QFDwD3FtqqGBdpJNEN4ffWHPZu
         e+K8lCk6GNuMSkxBKao19VmnWMJHDTw+6ENvNFLjdunyoV06/Y5/LPa/G10ify4sw0h1
         YsG9T5z9VtKHnXIClE3Bxa7zHmAv0LQzC6qKFOQAyoEbkySxwynTWLBYz7RivTEgfukQ
         Ud9Tk6ETvGU9CKhR8O62LSn2ApmGGxqnWeCnpumvhA3c+rodpQ5L+DXe98cZhtl/051f
         hOzw==
X-Forwarded-Encrypted: i=1; AJvYcCXEE7Iirjc2fcU0/vvBOitngQozDwaRi2zkdCDzRhFDCCSsmlXW36gqaGpeJDIChZmfVW4A93QknaA/xQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YzyNTwZwcP5mNk+jqTu0icsCRIUKlDI+aOHF2VPRQc9OJnYsSTk
	yfRyD3tFbeF3I7LiNcAoEd9cwq4NVwpAB3x1DTbxZKMfwRPPB51DXHsJDLYPf98=
X-Google-Smtp-Source: AGHT+IFZ8JfzRKLnF0QcT9iry3r3kCh6zjZywop0HCotG7xPZgCeXWFldiFXMJMj7ItUcYcarU72Bw==
X-Received: by 2002:a05:6a00:2d84:b0:71e:693c:107c with SMTP id d2e1a72fcca58-72062fb8107mr8106494b3a.11.1730040441113;
        Sun, 27 Oct 2024 07:47:21 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72057a0cb06sm4065110b3a.115.2024.10.27.07.47.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 27 Oct 2024 07:47:20 -0700 (PDT)
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
Subject: [PATCH v6 5/5] riscv: dts: starfive: add DeepComputing FML13V01 board device tree
Date: Sun, 27 Oct 2024 22:44:48 +0800
Message-Id: <20241027144448.1813611-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027144448.1813611-1-guodong@riscstar.com>
References: <20241027144448.1813611-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_074722_750524_C958DEBB 
X-CRM114-Status: GOOD (  14.82  )
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

Create the DTS file for the DeepComputing FML13V01 board. Based on
'jh7110-common.dtsi', usb0 is enabled and is set to operate as a "host".

Signed-off-by: Sandie Cao <sandie.cao@deepcomputing.io>
[elder@riscstar.com: revised the description, updated some nodes]
Signed-off-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v6: Dropped all node status disabled code
    Enabled usb0 and set its operation mode to "host"
v5: No change
v4: Changed model string to "DeepComputing FML13V01"
    Changed dts filename and Makefile accordingly to reflect the change
    Updated device nodes status, and verified functional
    Revised the commit message
v3: Updated the commit message
v2: Changed the model and copmatible strings
    Updated the commit message with board features

 arch/riscv/boot/dts/starfive/Makefile           |  1 +
 .../starfive/jh7110-deepcomputing-fml13v01.dts  | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)
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
index 000000000000..30b0715196b6
--- /dev/null
+++ b/arch/riscv/boot/dts/starfive/jh7110-deepcomputing-fml13v01.dts
@@ -0,0 +1,17 @@
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
+&usb0 {
+	dr_mode = "host";
+	status = "okay";
+};
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
