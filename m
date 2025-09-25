Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D806ACAC5A7
	for <linux-riscv@archiver.kernel.org>; Thu, 25 Sep 2025 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=06LQVumJcvXMAt3jRj+hk+dcqlDAAEmZEG7VRm79ewI=; b=IFmhVbJIma82qC
	mjouY0Cg9gBpDoiJf3n/wEvRA/XJ0/6Xtg46Z7AMmrs6o/SI+ZlrV55Rrvp9tRFQEQwEnm4b26XUd
	XpMNN4/1bE0bphEl5U4CGX8kqxdkY84YKZKjmFmC2xQj+krvjdrNhbic8A6YsmoqE8n19RmSjm6Q4
	dYHEsZYeEYaloejQxksfw0WmqGoP8PFW/HA2WMiUPsoyaT2qReQ4B36HNEkmdjM1rdEUNhiolQqLZ
	HCj9K/QR9y6+4RQzOwNdA46OPpaL8NRXyPrmvKZxz9uGZ6ojW2TuFG5S3yokW7WgMlCkjKHD/LQ8o
	HOrt2AsToVj9Ib0MzydA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1o4P-0000000AirB-2sGB;
	Thu, 25 Sep 2025 15:39:47 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1o4H-0000000Aim7-0WCO
	for linux-riscv@lists.infradead.org;
	Thu, 25 Sep 2025 15:39:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id BEAEC60566;
	Thu, 25 Sep 2025 15:39:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 763C6C4CEF5;
	Thu, 25 Sep 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758814775;
	bh=dZRhNHNxNFhtpbWp27QAdHENoATT6mL3CMP8c8FltM4=;
	h=From:To:Cc:Subject:Date:From;
	b=PWWSpMr5f/w1Si3kRyJGrnAS1F94otpxN5JkOgDwfcJEjZ14yqlCL5QEqE6PQX5Sd
	 irinU06/6m2qvZcXjXsfJtog9CsC8E6S+n2rBU2tLFHJW9J4lEZcBEN5YV77kWF0bM
	 Gegy6dv1L5I++2QstJXXooBRRSnARlbub6fN6nHmbxrntciHb8TWI6TUQbHvEmeKAK
	 E1kKud+hXxiQ7tVGiOV9KlQ3Bw408NFj9K2KymKzNArRwpNg+liwan/K7COwZn5MpY
	 vfiYoEdwOLF2BKTqYwTCsvuLJRLqTQoL2hgKYPGvssWAHGjF8fOwuNa/cqnLBCLZv3
	 czb7P2LpgjRxA==
From: Conor Dooley <conor@kernel.org>
To: linux-gpio@vger.kernel.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	stable@vger.kernel.org,
	Daire McNamara <daire.mcnamara@microchip.com>,
	Cyril.Jean@microchip.com,
	Linus Walleij <linus.walleij@linaro.org>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] gpio: mpfs: fix setting gpio direction to output
Date: Thu, 25 Sep 2025 16:39:18 +0100
Message-ID: <20250925-boogieman-carrot-82989ff75d10@spud>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1792; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=Uk9/PSe0f1tFDhEpYhJcambrnl6TtSKeGC2KKf0Zjeo=; b=owGbwMvMwCVWscWwfUFT0iXG02pJDBlXk1TFu1vZ79hunrCn7EZX1YFinvVXk3lNZws+YVefs tZhX3FZRykLgxgXg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACYyYQbD//LUXapT2mSO/pk7 M/7w3hfbdjCWtUmFbWQMS3I3+3TtRTojwxWe5YELFL49bXthGmWwUrZLKvCVuwX/NiNpFlG5yRt YmAE=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
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

mpfs_gpio_direction_output() actually sets the line to input mode.
Use the correct register settings for output mode so that this function
actually works as intended.

This was a copy-paste mistake made when converting to regmap during the
driver submission process. It went unnoticed because my test for output
mode is toggling LEDs on an Icicle kit which functions with the
incorrect code. The internal reporter has yet to test the patch, but on
their system the incorrect setting may be the reason for failures to
drive the GPIO lines on the BeagleV-fire board.

CC: stable@vger.kernel.org
Fixes: a987b78f3615e ("gpio: mpfs: add polarfire soc gpio support")
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Daire McNamara <daire.mcnamara@microchip.com>
CC: Cyril.Jean@microchip.com
CC: Linus Walleij <linus.walleij@linaro.org>
CC: Bartosz Golaszewski <brgl@bgdev.pl>
CC: linux-riscv@lists.infradead.org
CC: linux-gpio@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/gpio/gpio-mpfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/gpio-mpfs.c b/drivers/gpio/gpio-mpfs.c
index 82d557a7e5d8d..9468795b96348 100644
--- a/drivers/gpio/gpio-mpfs.c
+++ b/drivers/gpio/gpio-mpfs.c
@@ -69,7 +69,7 @@ static int mpfs_gpio_direction_output(struct gpio_chip *gc, unsigned int gpio_in
 	struct mpfs_gpio_chip *mpfs_gpio = gpiochip_get_data(gc);
 
 	regmap_update_bits(mpfs_gpio->regs, MPFS_GPIO_CTRL(gpio_index),
-			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_IN);
+			   MPFS_GPIO_DIR_MASK, MPFS_GPIO_EN_OUT | MPFS_GPIO_EN_OUT_BUF);
 	regmap_update_bits(mpfs_gpio->regs, mpfs_gpio->offsets->outp, BIT(gpio_index),
 			   value << gpio_index);
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
