Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B7C4C433F5
	for <linux-riscv@archiver.kernel.org>; Wed,  1 Jun 2022 12:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brBtSKTtjMn7z1ArhF33ewArpQGhXSLdo55Yb5c3e20=; b=pBKGdVtKR2UIH0
	fTHKQ5VLyLrl7bbqR6QtfsRnBw9F2vfaSNxk+q9ENi31LWEKSwxXh+zaIXmH/yJfASQaDzgVfRJSR
	o98XgC/axv4KDks8+ThUAmPsqUWnYtajA4cCcg77Tg+LBBjK4Zw3V4H1Ze0LHlkxmepx1qIBeLexU
	n9qmbau6oG0Bl8zpvkAqqBhe1VzleEAaqEOM45Q5uvigae5ZYREqjhewxWZe9AWJsAQJc83AZrqCd
	p0NyJKsAD3lGCtqVsrz8VKwPCqs6OT4YbjsxshxAFax7JhpfBMkJvrnmV7CSDwU2I6p8GyCJxNwBa
	gVcR32x69H1JUwTJw4wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNZJ-00G3dz-PO; Wed, 01 Jun 2022 12:35:21 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nwNZG-00G3cr-1F
	for linux-riscv@lists.infradead.org; Wed, 01 Jun 2022 12:35:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654086917; x=1685622917;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8pp90tvf8kTP0zWhyfPDbb/zxfLJMKZ53ILcrsvHuto=;
  b=xLDTq4gdmzmdtsGYzxbCzQXZax4y2y1lSkDecXqScysWZIOVipe5hdKy
   ubxA8L+oTcsFwhuOw+kC+IgplDwGxDUe2CnmW6sGEIfeN+NReT5Q8vE/d
   1a6eGig0N3WiS5bvR8MDr3Jj+i+zj2ucUO6bAqW4WmYC2+CE+qXMamY88
   qbAT4Xx+wbVrO9aI0BkyFG6xQ1r/uOHdLMJT/N72OCnakapJCTBV48c5R
   XySgdDqwIy4kHjXaPLfBLSxExuHF4Is/11r4EXr+ASR3ypH05J98H7G/5
   cRKbkKdHkmctyv/wzD/FkpWq4ayCCeeIcufPDGoON9BdYjBM9JwekIaS4
   g==;
X-IronPort-AV: E=Sophos;i="5.91,268,1647327600"; 
   d="scan'208";a="166611118"
Received: from smtpout.microchip.com (HELO email.microchip.com) ([198.175.253.82])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 01 Jun 2022 05:35:17 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 1 Jun 2022 05:35:17 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 1 Jun 2022 05:35:15 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
	<conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
	<linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 2/2] MAINTAINERS: add PolarFire SoC's RTC
Date: Wed, 1 Jun 2022 13:33:21 +0100
Message-ID: <20220601123320.2861043-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220601123320.2861043-1-conor.dooley@microchip.com>
References: <20220601123320.2861043-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220601_053518_122318_2858D668 
X-CRM114-Status: UNSURE (   7.75  )
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

Add an entry for PolarFire SoC's RTC drver to the existing support
for PolarFire SoC.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index e8c52d0192a6..625d735f6a24 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16952,6 +16952,7 @@ L:	linux-riscv@lists.infradead.org
 S:	Supported
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/
 F:	include/soc/microchip/mpfs.h
 
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
