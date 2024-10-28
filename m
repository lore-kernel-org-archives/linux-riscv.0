Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD6BCD13588
	for <linux-riscv@archiver.kernel.org>; Mon, 28 Oct 2024 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MZl+fsTgZ9g1VTL8l2SuohqjhiALWauX8PCc3ngivwA=; b=b2YZF3biqibo6f
	/ciAbVXHttUOf2EyrBVI7ktYOzLfaGM73vrIqDwr9GqmFEQGN8fNMLLLYyPZYILcdC3O4cZdqUjA6
	OFEGpG7BWQXehtqqyyjDFUqvxrD6PV2WdBzOT2bG3eXYKZZXTfOxG1Wk4ivhzRXr1uDl4dSzPFzD5
	LLqb3dDLfZ+lQVH7D67OwHOY6kOEBjWNnMcAyYOe9NNhpqWD5gpJEYhQHHhduMXk0Y2zIoeF8FNF3
	STdyDoIQ8lzOlSJb37tw3+I0Dhfj6EuRhyGwMnEp/hjDe+2/5QRgZxNVGOwlxZwlWKmpdBGi+rNFr
	KW+p0nnNN7/0qkm0FoBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7S-0000000A5m3-0Vdl;
	Mon, 28 Oct 2024 08:28:58 +0000
Received: from mail-oa1-x31.google.com ([2001:4860:4864:20::31])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5L7O-0000000A5jR-3cW3
	for linux-riscv@lists.infradead.org;
	Mon, 28 Oct 2024 08:28:56 +0000
Received: by mail-oa1-x31.google.com with SMTP id 586e51a60fabf-28896d9d9deso1868433fac.2
        for <linux-riscv@lists.infradead.org>; Mon, 28 Oct 2024 01:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1730104133; x=1730708933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XPIoC8cm6uQmcS2LwQbVyPpi1k+6eJrUrv1pvZL63WU=;
        b=QAqObGOHbwelRZb3C+5o+jIyOt+L6tvylHiTB5fPUo3tWBsJajKsuhYHTWbV7Arsbh
         qFEyS2YhSfeolTzAaxnLiXx6Lu5wg+Uln7HEUmZL2JMWyVz5sVAmF8/UaVMCLGZA9zVn
         6oLwWeJIl/Fu68CCP7fPrjAR9TsT7/+0V8s5lbnc1grKWX6/z3lRMyeG6eW4H6SFA0cy
         122x8tp6SHK4BuOj4eObOkjevd+Bs1JWPnY2OCJxBVHJ14P7QHjIPaN1G6GusIpOwZLM
         gd0aZLEGoStvxEKupxIP0s+IZplytisQ0SCLeQwaFpocP9xYMdO5R2JhWd0chanQdRb4
         FrSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730104133; x=1730708933;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XPIoC8cm6uQmcS2LwQbVyPpi1k+6eJrUrv1pvZL63WU=;
        b=IyQExRLKFK809kTrMCvAyOPTM2LlreFNj/4utDNDJUrrGNF+FD7uYGnSarouunB3fe
         1Nm70/4yC3x+FcqsyQx8N++Y8rDhe7GcQLZ/YNQAR7dPgTxYfynZ23QXiLuwlWGDh9Qw
         ULPy4UwxqVQUu96Z+si7nAsdFBDvN1OSV8bgXVgjh3/Uxnqe3IZE7xbdCnDomo3uBIJJ
         4Uuh/RuPzjKf9Gfvm+S+LFkcNxzhrVuDkUvX0ADEXOfDJlLqDZcQPbPxZhvNXNdAWIDE
         TlX1mm4FyKud+UHVkOC0xxR047uqCtFUO+Fz3Gbza77u1SEPGawqSpI2h10KBqIAa/ud
         2DQA==
X-Forwarded-Encrypted: i=1; AJvYcCUvknN4J4t5B3tye3uiV7hPN3CBJ7z0z34h3ImjRQ8/Lmc3TfU2x1x/D8sYqSzrscsovBRP2bXLA+0qVQ==@lists.infradead.org
X-Gm-Message-State: AOJu0YwVC/hq84rvvICqZ5zSxJS7BCn4Pza5WBPDgWB3PxI29wQ6kTX4
	tSw0DfY6tQbD6HYYLjxSqvRJI+Ho/2yaD7I9RLf4Rc0ukYNe0f85onI1kuOtzMo=
X-Google-Smtp-Source: AGHT+IFglaKlZzp2+ZqUwtxvszDFbByiWZoddmsO7mJ9JCqUIjf+BiPq4PQzRQTscfdjRCxE1I0szQ==
X-Received: by 2002:a05:6870:169b:b0:284:ff51:58ad with SMTP id 586e51a60fabf-29051c03edbmr5720685fac.27.1730104133502;
        Mon, 28 Oct 2024 01:28:53 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::401b])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e451sm5195419b3a.24.2024.10.28.01.28.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 01:28:53 -0700 (PDT)
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
	Guodong Xu <guodong@riscstar.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>
Subject: [PATCH v7 5/5] riscv: dts: starfive: add DeepComputing FML13V01 board device tree
Date: Mon, 28 Oct 2024 16:25:53 +0800
Message-Id: <20241028082553.1989797-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028082553.1989797-1-guodong@riscstar.com>
References: <20241028082553.1989797-1-guodong@riscstar.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_012854_942607_0FFE21E1 
X-CRM114-Status: GOOD (  14.48  )
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
Reviewed-by: Emil Renner Berthing <emil.renner.berthing@canonical.com>
---
v7: Add Emil's Reviewed-by
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
