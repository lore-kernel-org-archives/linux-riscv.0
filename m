Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE58FC433EF
	for <linux-riscv@archiver.kernel.org>; Fri, 15 Apr 2022 12:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=DIbw0FauEFE3i+U27viJwdRMbnGzaL8QDmwLAn8XnsM=; b=cqQxkX2RlC0Aar
	Udq1wwng2joJZf+jY+I5N1jYWPYAUoUkGszglQ4Kk3QTkLdHQetUUjoold3jizsNUKrCWO5QTimx0
	yeoHNDhAHVoX/PheEVJ/CYjPUoB1oooxqM8Pl9CdnyGQk3hRxcnSRJdvLO0ViZg4XC5UB5GcpoQjG
	JMlsnw7EL3tcwIWuS75+etFTGr3jzBPTfgi7YRbNYy8cp71CoiB5d6fXZ2+gLHk5F9BS1mEnpTgg6
	/ReXZbtO2eWRgbL8zXcy0Isn9uV4G8jPEjatwkBJ88x7F3yRkByWWoq332B/eAzNOxCyCUchJAcsq
	obofpLhZxRnJtfgbvjlw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nfLSl-00A9Uz-LQ; Fri, 15 Apr 2022 12:54:11 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nfLSX-00A9OM-8l
 for linux-riscv@lists.infradead.org; Fri, 15 Apr 2022 12:53:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1650027237; x=1681563237;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=xD0I5xV7kWeZLBUmPepIj83tk4qE1jeszPPagX3C5ew=;
 b=Bl2PLZ3OO6qbRWqWMPIhKlAnM/M1gXXqEGqjkHQbSYoXAk94sNhN2SPQ
 faU6IqNBlJf12he+moQ1idxzb2HSJL5AS3bKPWWsh0kJ49fRsBGCpEuDi
 iSOWaY1tFD+EjAUGXaHN44SK99SVh3ngQMzCKsTusYLE4pXuqJmaRkGdd
 0LBXsBRh4cR/tkQfGXxPywIsas+vHJm+KVcjtkNwr69c1/W2/gNDdgdL8
 E8AKC4OxhNgdQ6uvoqahWJgksacdsLHPSWU82KF0qN/0lH9y4o7qYi+nl
 ZfDRghVaCs473PhJEyYyqtWJeaOqiryqh09xCvLFL8XM198AWsX4hP3fq A==;
X-IronPort-AV: E=Sophos;i="5.90,262,1643698800"; d="scan'208";a="169769320"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa1.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 15 Apr 2022 05:53:56 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 15 Apr 2022 05:53:56 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Fri, 15 Apr 2022 05:53:55 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Palmer Dabbelt <palmer@dabbelt.com>
CC: Paul Walmsley <paul.walmsley@sifive.com>, Albert Ou
 <aou@eecs.berkeley.edu>, <linux-kernel@vger.kernel.org>,
 <linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v1 2/4] riscv: config: enable the mailbox framework
Date: Fri, 15 Apr 2022 13:52:20 +0100
Message-ID: <20220415125221.2871991-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.35.2
In-Reply-To: <20220415125221.2871991-1-conor.dooley@microchip.com>
References: <20220415125221.2871991-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220415_055357_342165_7E95268B 
X-CRM114-Status: UNSURE (   6.05  )
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
