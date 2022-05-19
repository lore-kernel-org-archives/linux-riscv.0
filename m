Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A9AFC433EF
	for <linux-riscv@archiver.kernel.org>; Thu, 19 May 2022 15:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=brBtSKTtjMn7z1ArhF33ewArpQGhXSLdo55Yb5c3e20=; b=ygEMjPD+rs5tdR
	jUeF3eKX4D5Nhf+ZrSt0Xo79lLYXdDUIRdArdbwGeZ5njQRZyHbYdUE8oNrZd5Rm2xWoNMUqucRUl
	N/oIr+B0XSefz7/2J0pN/+TCp8KWev1JEkVC8SlIBccJXzRWw/ly+rFFIDkx10k53aJ+f+Ymk4M2u
	XFyRxGoz40N97az3+ptFchIwPR4WgN/2h1PqySb6rWzPW6P/kK9W2p5gX4Lf6xomPdm0wpRL+UOmQ
	PoNgs2RnAO5xO3pwjNvB6C48rFWdJ4FnCJ+/1y9065mLM5UmPzfPgPS0KZYZqFjSvUfG0h0Mxi/fW
	Lb7DCbBghvA7DD8RrsxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nrhg9-007gwa-88; Thu, 19 May 2022 15:03:05 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nrgeH-007BbB-Eu
 for linux-riscv@lists.infradead.org; Thu, 19 May 2022 13:57:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
 d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
 t=1652968625; x=1684504625;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:mime-version:content-transfer-encoding;
 bh=8pp90tvf8kTP0zWhyfPDbb/zxfLJMKZ53ILcrsvHuto=;
 b=NfxHeXUXX5KQRYvjyR6p7Z+qwrU9S1TeoYYJk3F2QmAm3OzfCoqPC40Y
 SBcJrrRIMf2htmDiWt5BGwH61K0FJryAj+5XkifbXu8ca/R01zWjsm31s
 m/1gSmAT8IAbEQrDDviKfOJ1thCTrIEqto0agMcesdb1AvBEsOVsaRCTv
 9d1t8K0z1UjNHSXuGn+7wpyQeU7ILvrtqE6alGwtaTvuexE8TjO1+k9eZ
 Dub4O5NlxL8RUXVodORIKK7RC+ygKwiMx9E+6okR48cZcLaJ5X+9wdYUa
 DkUppPF7YKLEV/PQK8RHUGz2pkQIvlcA/J0+AoIHfzyv39og8jvsDpj8x w==;
X-IronPort-AV: E=Sophos;i="5.91,237,1647327600"; d="scan'208";a="156730473"
Received: from smtpout.microchip.com (HELO email.microchip.com)
 ([198.175.253.82])
 by esa4.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256;
 19 May 2022 06:57:02 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 19 May 2022 06:57:01 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2375.17 via
 Frontend Transport; Thu, 19 May 2022 06:56:59 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: <a.zummo@towertech.it>, <alexandre.belloni@bootlin.com>
CC: <daire.mcnamara@microchip.com>, <lewis.hanly@microchip.com>,
 <conor.dooley@microchip.com>, <linux-kernel@vger.kernel.org>,
 <linux-rtc@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 2/2] MAINTAINERS: add PolarFire SoC's RTC
Date: Thu, 19 May 2022 14:55:23 +0100
Message-ID: <20220519135523.594347-3-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220519135523.594347-1-conor.dooley@microchip.com>
References: <20220519135523.594347-1-conor.dooley@microchip.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220519_065705_672423_8E615802 
X-CRM114-Status: UNSURE (   7.40  )
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
