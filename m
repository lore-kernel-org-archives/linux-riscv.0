Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7778C433EF
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 13:26:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=c8fRM7h8A7fc9p5GnrT0hOlBVcDVDx1wMFbWuVDArNE=; b=oUHyX46iMqeUn5
	QEsRzc8LCxx5K0fuN3y+m2prCB/gPCtxjtAJYMLMWBORSGuZQ/vnShVG6gPG37Kg+yCXWKx9mHcuV
	Jdkom8SMthb4i53zbE8iK5dtrD+ISsHKhI/G3OmXGKSfw5IwXge7iQwBOQ83OBrY63804RPz0ZdWm
	4c1Y650xpmtsU0SJQxiGylL6WmLZUaFiMxUmlIm1kOT81rmE6HJcE6qxq+wqMAKfPW1PiPfQaWu5M
	96hPjhqy6VBtjPEtgR3z0I0MQgxgBP29GrrFuKyfx9HVn7fAbPzyQqTq7LFlWAujOcs46tgPi1X0x
	VMQMzYKLU6QNzQs/GlIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZDm-007i9R-7Q; Tue, 07 Jun 2022 13:26:10 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyZCn-007hFd-6K
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 13:25:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654608309; x=1686144309;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=MOFAIB4idNl1d6FFDW2qmFiKFnGtOntEzXMoocV2Urs=;
  b=EyYmobZG7MILs/ozzyIbrfh1SP9uI1I8mhO7/erJi15wHQUwIv6iWsv5
   FL7e4x8vrcl9q3TgNCDXRv0OqYnduROfyPbMGqH5rzBuU4m0UXFu1CS+9
   xywU60PgYlfYJOlaMh9lBOx2BPfwhAJ5zRrwzqnqXaHSnRgihYjvPyIHP
   EG+7KjjCwGA1u5z+4MDh5uHVwPXLuneJW5NbfwoUVClaXJGZEjHrm9Qzd
   D6ZbsRfVsGpR6ChdG14YDEG4GwbnWlHPuJs8H4cNjdURjaC/d3aOUYZOr
   GhLZEM5AwwGvCNB5BhHSP2JxyCNJvLRAc25sFoJs0yPgtjrHwNwmXOdew
   w==;
X-IronPort-AV: E=Sophos;i="5.91,284,1647327600"; 
   d="scan'208";a="98929239"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 06:25:00 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 06:25:00 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 06:24:58 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Bin Liu <b-liu@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Valentina Fernandez
	<valentina.fernandezalanis@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-usb@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH 0/3] Add support for PolarFire SoC's musb controller
Date: Tue, 7 Jun 2022 14:22:01 +0100
Message-ID: <20220607132204.746180-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_062509_393074_5641ED89 
X-CRM114-Status: UNSURE (   7.72  )
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

Hey Bin, Greg,
Short series here adding support for USB on Microchip PolarFire SoC FPGAs.
The kconfig dependancy for INVENTRA_DMA has become a bit of a mouthful,
is there a better way of dealing with that?
Thanks,
Conor.

Conor Dooley (3):
  usb: musb: Add support for PolarFire SoC's musb controller
  MAINTAINERS: add musb to PolarFire SoC entry
  riscv: dts: microchip: fix icicle kit's dr_mode

 MAINTAINERS                                   |   1 +
 .../boot/dts/microchip/mpfs-icicle-kit.dts    |   2 +-
 drivers/usb/musb/Kconfig                      |  13 +-
 drivers/usb/musb/Makefile                     |   1 +
 drivers/usb/musb/mpfs.c                       | 285 ++++++++++++++++++
 5 files changed, 300 insertions(+), 2 deletions(-)
 create mode 100644 drivers/usb/musb/mpfs.c

-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
