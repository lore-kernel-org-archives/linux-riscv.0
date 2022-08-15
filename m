Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFDC1C00140
	for <linux-riscv@archiver.kernel.org>; Mon, 15 Aug 2022 06:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3SHwqXwI/DSnii+DU2IuhkvLvY7BNFoBI8WEdL+xkG8=; b=l/B10SW8s34a/L
	LSuDlKIdECiOkJaEJ9M+h4jgYcVr/IzrVNRTddy59kKSpWLP/sA31FTJ/eY5Aq9Pf9CYk6+PF2okt
	XwG5EzlKUKcAqZ+nVzynqVBiHI1N3KyGpa9ZEBve02p/QTKnt7xLCksLay+TqRUFN7U+Xa9l50n8S
	b+w5v8Lcr8naqiyJcFXU52O1usILoBIuXaXhxcnlBNoy/5HJCrdSF3yPF83bwkzlJnkt7KPlwWF2R
	+y8fixj8bOCZvc6IG3N2qzN+uHQ9vFT04YCZRI3VP4BnCaJt8fb0RrB12w5P/Lrs1JZjDN2953hHG
	fda/vtnY+eRABrU9/Yag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNToZ-00C6oX-MJ; Mon, 15 Aug 2022 06:43:07 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oNToS-00C6hh-0E
	for linux-riscv@lists.infradead.org; Mon, 15 Aug 2022 06:43:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1660545779; x=1692081779;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=nKOegEI9cDvZlwn5DsF2hMbIEDJDgsJHsNaZmOo3K88=;
  b=ifpEUFimwLUX5a5TyCzI8bR05MNLfn+4WIWd7GqQH0VYFXSeH21YB5Mr
   FNkoxwqTCUKAjYS5SNZlWFcvoK6DzMXvzbA0l9e1ttd37GHJvHqgO7A1k
   T+Z8maiqaJnwX6RcVugHDyMfufw5M/zXgrN5eIzJBQyqgJHGnh60k4TC4
   aLj7aR3akkx+f90wpFbfoVutDb+oWfG2hhijieAViMqnRymIxnRqNnZBe
   5GNs9SD/mjYxLCdy/Lw37+L8ZNoovcavI9kNAdCKHuWA/axu9y4PEwWwe
   GB0huF5veimUPqU51HwJGAf5l5CGZSJE+9sZ6sh4F1Fym3AE2MQYxPQSA
   g==;
X-IronPort-AV: E=Sophos;i="5.93,237,1654585200"; 
   d="scan'208";a="176374207"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 14 Aug 2022 23:42:53 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.12; Sun, 14 Aug 2022 23:42:53 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server id
 15.1.2507.12 via Frontend Transport; Sun, 14 Aug 2022 23:42:51 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<lewis.hanly@microchip.com>
Subject: [PATCH v4 0/1] Add Polarfire SoC GPIO support
Date: Mon, 15 Aug 2022 07:42:43 +0100
Message-ID: <20220815064244.1296970-1-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220814_234300_171285_9A33A8BB 
X-CRM114-Status: UNSURE (   9.15  )
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
