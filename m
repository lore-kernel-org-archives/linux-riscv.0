Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100F4C43334
	for <linux-riscv@archiver.kernel.org>; Wed, 13 Jul 2022 11:00:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=vC7vys1mgWPdVm3Eo4dFDIv+gzC/g6jB5pQvBF0BsuA=; b=YGyhCT1bAfJwL8
	w+vFWLKq91gsip269GdDsfGjcD2X+r+/jp7XgaCF5ThPNPMfjey+l4k8jGK1iLrMEjIQXD7ZNaECg
	r5fTxLGuObOkBZY7LRHY4SeEWMvy1HIGraiEN/KFYeLriFbdKHsq7TuTap124h/bhX5FPr/0cVhwW
	Bop/hWrLXU/yGcQJkfK9wQ1+N0T1EV9xU6alY4sB0UlCVFmbsKaiOOCCCfY5ZzMVSbyxOoVrU0A46
	e8R6fu23dyGS+GbIR30WUYDxFRNOhUCzLeJHGhgJ0Th9+7FlCH7U+JtZjLEhIAZDI+zdcOB7xmTXi
	XpLHQAC6wPU+VNht35+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBa67-002se9-R6; Wed, 13 Jul 2022 11:00:03 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oBa5g-002sL2-8Z
	for linux-riscv@lists.infradead.org; Wed, 13 Jul 2022 10:59:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1657709976; x=1689245976;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=rHJ8pfgSYGoRDUoZjLb9byAvTc/xy4lLBNG8ZQycNYM=;
  b=M7du7Un4WbrjeB+akaO/6f8aXl/OaRQv4zZAYjRH7tKEY/lTrHnvr5UC
   Uv+FzORJDm2GUB2oQQyI/4OM+NPLl47NQG4DJCk3Eb9LJzf74fHg0zh06
   N++wi8bqtlY7V4FGqNlyM5soVoyEoQQrPUGUzldzpflT1n8YcyQtfXclD
   qLMb3XQ+20cbyH5JaFeDLBB9jv1cuou2VuHrw9k9Ps0NgqyVpxjGBlw9b
   a49I5QMOejv0oiBLAFFTHcRoQxBpuZjkL7c0ILUoyBkKlfenllsZi9ujd
   xnK73GhXtT+d/eP/NHb8nabJZdfpx2O1trCZMJBSGcEzm7BAG6EFjSLJS
   w==;
X-IronPort-AV: E=Sophos;i="5.92,267,1650956400"; 
   d="scan'208";a="181936814"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 13 Jul 2022 03:59:31 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 13 Jul 2022 03:59:30 -0700
Received: from dev-powerhorse.microchip.com (10.10.115.15) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server id
 15.1.2375.17 via Frontend Transport; Wed, 13 Jul 2022 03:59:28 -0700
From: <lewis.hanly@microchip.com>
To: <linux-gpio@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linus.walleij@linaro.org>, <brgl@bgdev.pl>, <linux-kernel@vger.kernel.org>,
	<palmer@dabbelt.com>, <maz@kernel.org>
CC: <conor.dooley@microchip.com>, <daire.mcnamara@microchip.com>,
	<lewis.hanly@microchip.com>
Subject: [PATCH v2 0/1] Add Polarfire SoC GPIO support
Date: Wed, 13 Jul 2022 11:59:09 +0100
Message-ID: <20220713105910.931983-1-lewis.hanly@microchip.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220713_035936_387953_ED4E0E93 
X-CRM114-Status: UNSURE (   8.08  )
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
 drivers/gpio/gpio-mpfs.c | 379 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 389 insertions(+)
 create mode 100644 drivers/gpio/gpio-mpfs.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
