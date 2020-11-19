Return-Path: <SRS0=5I1x=EZ=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45CD5C56201
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:05:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BDA2121D7F
	for <linux-riscv@archiver.kernel.org>; Thu, 19 Nov 2020 17:05:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="sHrxELHq";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=microchip.com header.i=@microchip.com header.b="MtKXPY2U"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BDA2121D7F
Authentication-Results: mail.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=microchip.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zphRPDzvpQPh2noTHwa0BuV2ttyJizLUvSxW90x1kYw=; b=sHrxELHqU9NDTFexZfivSiaKm5
	RMYEoc6/RUTaCiGUpKZNkvxs7P6QNEZ0JE+ypESRpujb+BtaDDuLQP/oXgjw5iBE/0Ul5N8LIatwS
	g+AvuQoxUgQVlnnppHYor+kBAfUJI+viOozAkqft196ZWxtg/OAtZT/CXpiR8tCKIdvDTfEGCx8pi
	z+MVyzC5jL/Zewd26GR8NMlvDuhL18pREBvO5u+UMONYxvdQ5Nw/9eP80Xp2XNeJvsWKPgRNX4WUe
	F8ZEnnUhMzn0Ob7PxI7NGv0eDjDnTS1Wh3TztWbHPr7QgNDi0wo++Z7SaslRmCu79/t0DC443n3Ue
	Hryf/I1w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1kfnMd-0008V2-Sj; Thu, 19 Nov 2020 17:04:55 +0000
Received: from esa5.microchip.iphmx.com ([216.71.150.166])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1kfnMZ-0008TV-Py
 for linux-riscv@lists.infradead.org; Thu, 19 Nov 2020 17:04:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1605805492; x=1637341492;
 h=from:to:cc:subject:date:message-id:mime-version;
 bh=sA2ID8SjJBtdaCsBr435cqGSWmz9ad2T9JlA0MEQJN0=;
 b=MtKXPY2UTyPKQnDwBzvf/4C5W4ZOMlFAYchHWFEFOtozmGUXQQPqJ61h
 6GDJbWMvLJp3rLM1KZpUjv8DLHwA2upbkpw0sCyyCpZZtmueXLTeJZLiT
 zi9s4Yeax/dFK7KjWXPO6JY+VRyIGzdzN3eKjQLCqLFLw5vOFmkHdP6B0
 VkQPh3SEegOXXM0aNz2+IPG3VC4N5/RH7qEdvApMD41GZx4dLCcH8/oHm
 vlJoAPv75hNjAFLBAWNqamughjqy3T1kjEvh17zfA9LYvXcnHHHHkh74w
 wptpjlmyohE36jjV0TbY5tAUggEDIVmgb5mHFWBC4o+9j0FX3WAMZvcSm w==;
IronPort-SDR: qjePlLxdxiqTeGAXUc0ovbRMvEH7bq8VO1HyDrZOcF5hymtKH5MDlxFkyf4Ei8B2uvFkco1I18
 djWNgGiHO3jXi8K+LeG7hwDOasJ9N63wPOxRoImPMxLJixma5xFwqwku7F6bwEJX4T8soc7DfT
 nJULOnAEmPuqMGAhChTGDjkbzeAYfXtmQdSWpr/plfoFcmDx2QUCo3wepjWTVljY2k786MQRPE
 tZcfKgCszRrFZglfEVWhc28oUR2vXhvxwgoL4bo/Qa0gCZczPFDt1NjGn59wsg+uor8c7cgMqa
 5PU=
X-IronPort-AV: E=Sophos;i="5.78,353,1599548400"; d="scan'208";a="99122009"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 Nov 2020 10:04:50 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.1979.3; Thu, 19 Nov 2020 10:04:48 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.1979.3 via Frontend
 Transport; Thu, 19 Nov 2020 10:04:46 -0700
From: <conor.dooley@microchip.com>
To: <robh+dt@kernel.org>, <jassisinghbrar@gmail.com>, <aou@eecs.berkeley.edu>, 
 <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
 <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH 6/6] MAINTAINERS: add microchip polarfire soc support
Date: Thu, 19 Nov 2020 17:04:45 +0000
Message-ID: <20201119170445.18795-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20201119_120452_018699_763A1AC7 
X-CRM114-Status: UNSURE (   7.38  )
X-CRM114-Notice: Please train this message.
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: cyril.jean@microchip.com, david.abdurachmanov@gmail.com,
 daire.mcnamara@microchip.com, anup.patel@wdc.com, atish.patra@wdc.com,
 Conor Dooley <conor.dooley@microchip.com>, lewis.hanly@microchip.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Conor Dooley <conor.dooley@microchip.com>

Add Cyril Jean and Lewis Hanly as maintainers for the Microchip SoC
directory

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3da6d8c154e4..2965daaa80e9 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15000,6 +15000,15 @@ F:	arch/riscv/
 N:	riscv
 K:	riscv
 
+RISC-V/MICROCHIP POLARFIRE SOC SUPPORT
+M:	Lewis Hanly <lewis.hanly@microchip.com>
+M:	Cyril Jean <cyril.jean@microchip.com>
+L:	linux-riscv@lists.infradead.org
+S:	Supported
+F:	drivers/mailbox/mailbox-mpfs.c
+F:	drivers/soc/microchip/
+F:	include/soc/microchip/mpfs.h
+
 RNBD BLOCK DRIVERS
 M:	Danil Kipnis <danil.kipnis@cloud.ionos.com>
 M:	Jack Wang <jinpu.wang@cloud.ionos.com>
-- 
2.17.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
