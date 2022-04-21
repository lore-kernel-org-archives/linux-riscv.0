Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C60EBC433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 21 Apr 2022 08:59:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIbw0FauEFE3i+U27viJwdRMbnGzaL8QDmwLAn8XnsM=; b=l+d7hQg+F6Gpa6
	ogDOl9Kq/dJqGBINNc0cTJb1pJYR4f/zleeOXeku9yFilWjJyTdUkQg82opHZ1ZxwBbaYYJKJ4bY2
	/kyREXfr5NPX22S5en2OHJdkVOdDmxmmhUqdBqr1MVtoushdNhlYQYqdB7AGwbStE4GM1/RyaU8T+
	cB/BocXnCyj6lf6bV49Nm7Wz1nUGR9+6v7/adrv9Cm4aI7N87QATWmbRkHziKZU2DJoBA3osgpZNh
	/Fou449Z9qNvBpux+V0VfHAZrWGfDCpoDDy91di9eB27tgyuZdjT2Dxc1L7wKiUN2lw/Cmd014JAr
	FJnYyVLW5xiGqUAG+kbQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nhSeW-00CYa3-Mc; Thu, 21 Apr 2022 08:59:04 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nhSeT-00CYYG-3j
 for linux-riscv@lists.infradead.org; Thu, 21 Apr 2022 08:59:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650531541; x=1682067541;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xD0I5xV7kWeZLBUmPepIj83tk4qE1jeszPPagX3C5ew=;
 b=kPDXouwbDP1N8t0PJODdIjflePS2Lxibyk322M9WM3pOa85vJDtDB5gE
 HfjyS3WkiDPXqC/VL7sJxGKk9/xM1bgyNrUSg/qix7+RMbYhfnYy45+Mk
 oqpcpqBTiYAbLEN7JWxGCSadVgTrr1S7x52ZqcZuNHAiMf0+7trwwEahb
 VtzvS2mj12p6bWYdSCkPc9e9fdvJe3HQQ/oomReujdrffgge/VBtKViE1
 lOmi9amlsQo7fRs0wECuBkExYPdXmSV0L0yAozFnZU0Djll45mPvtf2Vo
 EzrYwZZpqoWH8Ind1K0dBQm5j9h5PIAwi2AVXNh6sV5BTILbH8BaFSxoe Q==;
X-IronPort-AV: E=Sophos;i="5.90,278,1643698800"; d="scan'208";a="156280896"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 21 Apr 2022 01:58:59 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 21 Apr 2022 01:58:59 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 21 Apr 2022 01:58:57 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, <daire.mcnamara@microchip.com>,
 <lewis.hanly@microchip.com>, <cyril.jean@microchip.com>, Conor Dooley
 <conor.dooley@microchip.com>
Subject: [PATCH v2 2/4] riscv: config: enable the mailbox framework
Date: Thu, 21 Apr 2022 09:58:04 +0100
Message-ID: <20220421085805.1220195-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220421085805.1220195-1-conor.dooley@microchip.com>
References: <20220421085805.1220195-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220421_015901_258712_5546C532 
X-CRM114-Status: UNSURE (   6.78  )
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

Add the mailbox framework so that the system controller drivers get
compiled for PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 arch/riscv/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/configs/defconfig b/arch/riscv/configs/defconfig
index 30e3017f22bc..e8472ffbb4dc 100644
--- a/arch/riscv/configs/defconfig
+++ b/arch/riscv/configs/defconfig
@@ -100,6 +100,7 @@ CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_BALLOON=y
 CONFIG_VIRTIO_INPUT=y
 CONFIG_VIRTIO_MMIO=y
+CONFIG_MAILBOX=y
 CONFIG_RPMSG_CHAR=y
 CONFIG_RPMSG_VIRTIO=y
 CONFIG_EXT4_FS=y
-- 
2.35.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
