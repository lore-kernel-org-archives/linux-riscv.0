Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C68A4C43334
	for <linux-riscv@archiver.kernel.org>; Fri, 17 Jun 2022 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=QpV5eye+fJZwrmLbEUsRp5PdH+lMmo9ffmdAEpjzTuw=; b=EjUS/QOMlkQQB5
	1dCXGyOtqUc5/4jTrUv0RProodf2hpcUA4Dku6j/8R2eUC/Jw4UW9HlcjeOhd1mL9WkyXh709Gbv9
	YE3dqcbjENgty61nAO56POtyqb5Ln/Rz6xGhh/jfPjL1bjZzaEfLRLJFIGvuh3QkeIiAfH/B2vGns
	UHlX0a5rJrpuylwMAEOoQzRu0+SlZC3NoW/cQUFPA+vMZkhnwMDltnaCEY13whf2fSRpwGCVeuhT6
	VZBi3fOZhw0uSrxMl46PF4IDw0dTs8CD10ixqYqzYsBoDivuExbjn5cpJAgY61i4Ngj2m2+vojOIp
	961T7+j8UpWKCEU2tO9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2ARC-007Pyv-4m; Fri, 17 Jun 2022 11:46:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2ARB-007Pxy-8A
	for linux-riscv@bombadil.infradead.org; Fri, 17 Jun 2022 11:46:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=k9pMgCDinWv3YVf0tRqlYS8090aZX5h4t+diDZK9Vq0=; b=bVD4dwHi3LZRp2i6bvkTzKsj2g
	0U/K7n0oEFAfG1nHldRJ/KPvs2p2aPMOntM07qGh9AdyjmB2Le9AIsZZBmmJJgw+XW/YiaFGP3D25
	VB9N7J4vFcq0ImoRKziYrUcIjde4mfVwA2pX85p9em4ctkeJ27hsmWdGHDMfznZGVHdREgHpm7K+1
	FC+S/KqBxejvMMIhDPpokxtaMWkRu9Zu7lTKkRR7Aip9cR3xMdjSnhkTdt7+ugSX0g54WuQLknUrA
	+nqYMxZM47TBDNlLN8vQDu62/hesgCd5z6SPqRfvPg2R5AN1CiRu9/jAUo0FhE2XANwA5NX4fz68B
	khI2GUJQ==;
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by desiato.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o2AR4-008fpp-Iv
	for linux-riscv@lists.infradead.org; Fri, 17 Jun 2022 11:46:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655466406; x=1687002406;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Py8zRXdzOiFvbMocJpc5Z5DwAynLOWkd9TOuzKCbQu8=;
  b=NcL4ZJFHNfogt6gneP7ZmIEyptvscFKneBYj7UaAxUjC6l/4sZWFP1o4
   7rev3mv6CJH/gbqt7ANLj7gsCHMur/fBR/IOkembFg9saluj+upW+30XJ
   FBUjYzA9n7q0FdiHgdVyr/E0nx09Mm6BuMOLGD81qaB6EddbMy1itvvSN
   JqJAJLoqC8siwAPXTfuBrJtZTbL75Jr9bcAyzpcXQMM0+7E2de0D+LNd9
   ySJn2fr8nR/ITs3iLbKLGC+skgwlKcsoPcuvU/mB4CRBqxQVtH7faYyx9
   fElwsgXsuibMu3epfT1zBUMDDgSITzMrPZgJs/fbLhmLttoT4NuhAo6da
   w==;
X-IronPort-AV: E=Sophos;i="5.92,306,1650956400"; 
   d="scan'208";a="163847732"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jun 2022 04:46:31 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.87.72) by
 chn-vm-ex02.mchp-main.com (10.10.87.72) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Fri, 17 Jun 2022 04:46:30 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex02.mchp-main.com
 (10.10.85.144) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Fri, 17 Jun 2022 04:46:28 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Lee
 Jones" <lee.jones@linaro.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Fri, 17 Jun 2022 12:44:43 +0100
Message-ID: <20220617114442.998357-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220617114442.998357-1-conor.dooley@microchip.com>
References: <20220617114442.998357-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220617_124649_232822_489A5D7A 
X-CRM114-Status: UNSURE (   6.49  )
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

Add the newly introduced pwm driver to the existing PolarFire SoC entry.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index f1b4b77daa5f..d0b39fa4f309 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17091,6 +17091,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
