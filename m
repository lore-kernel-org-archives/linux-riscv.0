Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14186C43334
	for <linux-riscv@archiver.kernel.org>; Sat, 16 Jul 2022 07:11:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bfytG9Qb8ZEHB3nrABRqF8w+IjuyxgkdRZJ7j82sJYQ=; b=hT3jMOXrK65hCu
	OXzAqeJFGTTX4FWwN6lZqsgNYnZ2bYKCq4RFS/jt7QvGxHxybakcjOLLZ8HLFe/2H164IY0g+1lXW
	nLpArmmpZkCXj7JskEA8jo4L+wHETNndwwg0ZA493wYtEROWDO06yc4t1T5XufezZzkGKMPt9y+/s
	sDllhz1MAfCnoRk1Vqaw5vp47AgIsXm4VAbvWIgtb40UBXwHFOfhjGcgYfZKA83oi6zebaPQqKlGp
	DVEN6PEI4mN98+hoI7o+rHavhT7SGTiaV8W3lC25ClLLw94w3Ikyvw3c7jx/0Snc7bwIgczoxyEY2
	54ECsgQGF4eQSS0cTayA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCbxd-00EMup-T7; Sat, 16 Jul 2022 07:11:33 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oCbxa-00EMso-Tm
	for linux-riscv@lists.infradead.org; Sat, 16 Jul 2022 07:11:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657955490; x=1689491490;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=YVU5qJLCsSc6SFHbZNFSgBEov8vHAhENYn8Xttvn/x8=;
  b=pwPWEUH9+GnTAECiaGLjRC5EYUbZ/i/dsZwqOcLWpc+Rr0eqmmfcrrux
   E94Hf6B7ktdFTOBOGc/yhXacmKT0YxtW0qvKKFFnxlgvJ7uutaPa6dQ0Q
   +8VeDP3eIFyKzecZX6y+dYRqdrqjpBwHCiunpQEfPj0GhTSwOGMJ4k2Nn
   4ZNyTnSu1U0OTNdAD9WgwmuHmW2/qOQTvqW+ftJE0iB6fcL7u/F3NWWcn
   RomTdEoGfN09wGgcjaXvuDG3gcC1K0/zhb8Brhjo3TMQkP8lLVi/hvMUx
   HEzaRANRpnJYtUqJvRdttx/u7d1D/UogEV+ufnKQ2bfC1ShNGyfzbejdt
   w==;
X-IronPort-AV: E=Sophos;i="5.92,276,1650956400"; 
   d="scan'208";a="104740574"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 16 Jul 2022 00:11:20 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Sat, 16 Jul 2022 00:11:19 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Sat, 16 Jul 2022 00:11:17 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<lewis.hanly@microchip.com>
Subject: [PATCH v3 0/1] Add Polarfire SoC GPIO support
Date: Sat, 16 Jul 2022 08:11:12 +0100
Message-ID: <20220716071113.1646887-1-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220716_001131_094155_F170EDCE 
X-CRM114-Status: UNSURE (   8.02  )
X-CRM114-Notice: Please train this message.
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

From: Lewis Hanly <lewis.hanly@microchip.com>

Add a driver to support the Polarfire SoC gpio controller.
Tested with 5.19-rc5

MPFS gpio interrupts can be configured as direct or
non direct connections to the PLIC (Platform Level Interrupt Controller).
GPIO_INTERRUPT_FAB_CR(31:0) system register will enable GPIO2(31:0)
corresponding interrupt on PLIC. e.g. If GPIO_INTERRUPT_FAB_CR bit0 is set
then GPIO2 bit0 interrupt is available on the direct input pin on the PLIC.

Changes in v3:
Changed order in kconfig.
Removed blank lines in driver header/source file.
Removed BYTE_BOUNDARY variable and use macro to do *4.
mpfs_gpio_assign_bit parameter uses macro instead of (i * BYTE_BOUNDARY).
Add correct definitions for direction.
Change order of variables in mpfs_gpio_irq_set_type function.
Return dev_err_probe instead of dev_err.
Remove noise of dev_inf.
Avoid using of_match_ptr.
use devm_gpiochip_add_data(..)
Update mpfs_gpio_remove. 

Changes in v2:
Use raw_spinlock.
Use __assign_bit() to assign bit, added a bool variable for value.
Remove unnecessary checking gpio_index.
Remove default from switch statement.
Use const for irq_chip, name updated and use mask/unmask.
Use latest kernel api irq set_chip.
Implemented hierarchical interrupt chip support, although
suggested to use chained interrupt flow I believe this fits better.

Lewis Hanly (1):
  gpio: mpfs: add polarfire soc gpio support

 drivers/gpio/Kconfig     |   9 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 361 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 371 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
