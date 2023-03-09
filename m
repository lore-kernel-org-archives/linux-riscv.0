Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD0D8C6FD19
	for <linux-riscv@archiver.kernel.org>; Thu,  9 Mar 2023 20:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=gb+myZjQxhDt1Mn9eEZDbyxONmV/6fRfiHl+dWiLrto=; b=KlXHB3zqZBBJJs
	MXSRtk383rx7ww7HvN7B+BCA+AXQH64SJfWh8wqTw4tPZhUjcWKkc+41ydHa9sIkr6ZY+MtRtN0xj
	U0fLBYymD9EPdngiMJAT621DoneiB0wzEVOX+qW0hvphxdO2ewh/7RnTcnXLAY2UuqsySbwCFZ6ky
	6Pqc8xwc/MDyFpqvKhlMPGbkYsXDdAi0vc5nUvkhYJPtnzuC48PC4JQVtXuw+U+OBru8L/Ubre143
	KoUIy9/oU4If7koQKMN6ZrfXNTwdtibL1JvQiJjn5dGhckBln7KfWbJ0z+F5CrKfTGaR0OkFm0KMO
	X7I2JEnzurhX7c3L5c9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8g-00Bnz5-TM; Thu, 09 Mar 2023 20:45:26 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1paN8d-00Bnwy-Tb
	for linux-riscv@lists.infradead.org; Thu, 09 Mar 2023 20:45:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 98408B82084;
	Thu,  9 Mar 2023 20:45:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E694CC4339B;
	Thu,  9 Mar 2023 20:45:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1678394721;
	bh=69cMqall9ySx9R5xXzMB2/T+YDWmm6o9YXNbjv3RYmQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=doG+ooEVvhghSuy3xmfVYkqGfZsYRIZmobvE6daPQDekROCM/vdBLNWB53oOyxq8v
	 uLp4Hunt6kZ2ikvm/vNbxA+j8ApIUnZmaGI9rmSirLCplLPKo7eDP2FDscSLGKk1aj
	 rIiiCJSEHF5zKia+z+Db4oASRNLRZuYt0h6AHs9yaIpwVZv+hBkiz38seuTHfmPa2Z
	 FKIw5xcfEb8IyJCq8HCnt6s7hcRmlN2jnB6G3JiXeh8bUtorsUm9rsYfaS7lIig5xz
	 y5Edku6QuBInyWAMVL++zfXQQ3FYr95SHSvx4jz5pkulYH3TZFQbyTG5THlxECaL8h
	 crb9NdE/9QWBQ==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Claudiu Beznea <claudiu.beznea@microchip.com>,
	linux-clk@vger.kernel.org,
	Jassi Brar <jassisinghbrar@gmail.com>,
	linux-kernel@vger.kernel.org,
	Alessandro Zummo <a.zummo@towertech.it>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org,
	Bin Liu <b-liu@ti.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Wolfram Sang <wsa@kernel.org>,
	linux-i2c@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>
Subject: [PATCH v1 5/5] usb: musb: mpfs: convert SOC_MICROCHIP_POLARFIRE to ARCH_MICROCHIP_POLARFIRE
Date: Thu,  9 Mar 2023 20:44:52 +0000
Message-Id: <20230309204452.969574-6-conor@kernel.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230309204452.969574-1-conor@kernel.org>
References: <20230309204452.969574-1-conor@kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=825; i=conor.dooley@microchip.com; h=from:subject; bh=ul3OSqO/d4GMmYQrlW57NLjBDlDK4kMBe+YtWdntPBE=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClcri4Tg0KdO75ernl0V2oP577eig86pm6uk0uz1mV1l lSoeD/vKGVhEONgkBVTZEm83dcitf6Pyw7nnrcwc1iZQIYwcHEKwEROX2Fk6L6ywa+rfynbhi5t g79SvndjfvT9W6AQF790ycVnHj3vshn+V091U3+3NuX2Ej5V6Ru8Fid5Oy9OqDp62Ewm64pm/DU 7LgA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230309_124524_124508_C26B1814 
X-CRM114-Status: GOOD (  13.51  )
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

As part of converting RISC-V SOC_FOO symbols to ARCH_FOO to match the
use of such symbols on other architectures, convert the Microchip FPGA
usb glue layer driver to use the new symbol.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/usb/musb/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/usb/musb/Kconfig b/drivers/usb/musb/Kconfig
index 3a1f4bcea80c..9a8cf3de0617 100644
--- a/drivers/usb/musb/Kconfig
+++ b/drivers/usb/musb/Kconfig
@@ -113,7 +113,7 @@ config USB_MUSB_MEDIATEK
 
 config USB_MUSB_POLARFIRE_SOC
 	tristate "Microchip PolarFire SoC platforms"
-	depends on SOC_MICROCHIP_POLARFIRE || COMPILE_TEST
+	depends on ARCH_MICROCHIP_POLARFIRE || COMPILE_TEST
 	depends on NOP_USB_XCEIV
 	select USB_MUSB_DUAL_ROLE
 	help
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
