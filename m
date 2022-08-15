Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6179EC25B0E
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 07:06:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lPidOTeC/m43Wge7Lj/gSWXbp2wPZKrEgWHFFoiIVqk=; b=EyvpG4WmLXWV+P
	GBUWGg0g9SoJxO8UdL9S/5Frop+9KIXdDY98FzeWD/XGVkSQL26L49+ZTLy+qWYJ8CTR6aEOGFS4+
	tUIbwQ4w2agMhZqfG5UXlrkjd2bSaVIKtf83WlfjTvVkvHs7RBNdpYErHdOCzF84uaBwOFm2zymfh
	s5fYRi/+LFcI476br8tsaR6o/nBj6Ep1fKRZJs/TXJPZY0l+XuDMkLjfRge3MHl7p4tXIPfjgTlbj
	P0Xon7jZgGFx9fmxk4ALJKz2SlYe9WtRbX/UWuixo1rCGmprschHmGV7kdY7xoMdoN6V2JfQ/PKFU
	piClSz8x36Xc7hSKo+Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUB1-00CJFj-OH; Mon, 15 Aug 2022 07:06:19 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNUAw-00CJDC-LT
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 07:06:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660547174; x=1692083174;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=HzdfhF2vvfRvRGRdUuhLHsxJf9Ap6uG8/K381pIKVxc=;
  b=1hDEaJK2R573KOlCpvGkOIQ2+xEJ8muocPHdobLznYDPkjquaALC9Sif
   4IyoXhqICatW2a81u7GgiTLMCK2B1M2JwPcJiMChk7Px1Od5vyVTLuZ1X
   8G4IPWimhfz1bnte8SvxeMp60Tw8u8EVxdX0jOdMhq3RPjtCKYluZJe9N
   D94n4IrwS5E+O6hucrXfUJCZDBKEgdA9HxKG68THAdpUMXGB+FAEcGSZ1
   heTX/gYU10Ilr8enJ43nMbMwq89GoNEe+FdJIIJxfk/5lwdNUKySVKK/C
   bxI0PtdEiv1qYReF3J0ScRjGZPW5HR25YHOpfUTHwHVhJ8c0ahCTCLxHS
   g==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="169265719"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Aug 2022 00:06:14 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Mon, 15 Aug 2022 00:06:13 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Mon, 15 Aug 2022 00:06:11 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<lewis.hanly@microchip.com>
Subject: [PATCH v5 0/1] Add Polarfire SoC GPIO support
Date: Mon, 15 Aug 2022 08:06:05 +0100
Message-ID: <20220815070606.1298421-1-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220815_000614_808433_CAD9E8A5 
X-CRM114-Status: UNSURE (   9.03  )
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
Tested with latest 5.19 kernel.

MPFS gpio interrupts are connected to IOMUX configured by system 
register GPIO_INTERRUPT_FAB_CR(31:0). Interrupt connection for
some GPIO's to the PLIC (Platform Level Interrupt Controller) can be 
shared (not directly connected) or direct if connection is available.

previously upstreamed dt-bindings: gpio: microchip,mpfs-gpio.yaml

Changes in v5
Added the const for the irqchip, removed in error from v2.

Changes in v4
Changed the interrupt handling from Hierarchical flow to chained interrupt
flow. The reason for the change was with hierarchical flow we requried
a interrupt number mapping array to work with our HW and this was not acceptable.
On reviewing the architecture the chained interrupt flow works better
for our hardware and configurations which are not fixed in Silicon.
Added support to read the optional DT property ngpios.

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

 drivers/gpio/Kconfig     |   7 +
 drivers/gpio/Makefile    |   1 +
 drivers/gpio/gpio-mpfs.c | 318 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 326 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
