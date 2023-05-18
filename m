Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56406C7EE24
	for <linux-riscv@archiver.kernel.org>; Thu, 18 May 2023 12:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=96Fl+OAlJ6j3cTyPv/ngkUlS2r00pX9M1twvaCgzEGw=; b=0SftHX2vtfpOJ1
	gCcqIfqj7msTXxMmAaS6ywd7uO/fpBi/ee7ErTBYfQFRIdnHUbl1KphAzD5jdgWjDHtyFeXP9G+g8
	9N6defBII4bTkwqOleDfTi1OYiDevtSmFM/gSWJwgRXiyKFFKLJx7ZcyxPBWHQ1W2c4lHLgw22QMv
	F2NRATPkF3UrK3yISQZCSVBHldvRID+N8VkXoK2HZ+viL6n1BeJ10Zvc+ppOVfonHYj0L9ERj0C2O
	nQ3RsC78FZczSnXseVNaCtDw4AvBcoKy9U6Md9h+s6WzQbulFHT0jG4F+MmkF25FjAjZ18/73BD/N
	AVS9iL9L0riabKMYxAEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcrF-00CyDI-36;
	Thu, 18 May 2023 12:35:49 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pzcrC-00CyBN-2D
	for linux-riscv@lists.infradead.org;
	Thu, 18 May 2023 12:35:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1684413347; x=1715949347;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=IIWuJtF5YeJRCRhlmAxLua4lTEc3oMoMEkkaQsN/f3M=;
  b=o9k+Lg4nnjOtykD466GJaEzuWYZVbTn/3vqI+VAVtw2h54rw/ocM/oM+
   HmIa4vEr8MZTH3q+qD8RWH1+ueyluifnOV+vWJn6JX8sUu4+2iwstPUKc
   6BMqBfdjHm8Y2/jMos0jj5OwTx/HpoQ6p5Sl94ptPZN9ipWyEiKQKt1EA
   W03A+IHgF+9gMcUlSuymdxZSPjIcDj1qWK1h9pfSvxg51I2zCXhBCpwZN
   /km5oWmOY6KUvHfZ1ZoV01r9OUaD5g1FBndtku+55ivhm0XV9WykbbCa+
   gyu1lp1XVZRnped0wYY0aieT4kHh0DknZlaUavFYOXSmDcMddecE19YFa
   Q==;
X-IronPort-AV: E=Sophos;i="5.99,285,1677567600"; 
   d="scan'208";a="214432189"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 18 May 2023 05:35:47 -0700
Received: from chn-vm-ex01.mchp-main.com (10.10.85.143) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Thu, 18 May 2023 05:35:42 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex01.mchp-main.com
 (10.10.85.143) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Thu, 18 May 2023 05:35:41 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v18 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Thu, 18 May 2023 13:29:21 +0100
Message-ID: <20230518-headrest-puppet-d6cf2e11e340@wendy>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230518-reactive-nursing-23b7fe093048@wendy>
References: <20230518-reactive-nursing-23b7fe093048@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=669; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=IIWuJtF5YeJRCRhlmAxLua4lTEc3oMoMEkkaQsN/f3M=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDClpUgplf64fduuUD4mfOCF81dw5xbz1c4+Jpbp9uNzrnlIV tv5kRykLgxgHg6yYIkvi7b4WqfV/XHY497yFmcPKBDKEgYtTACZyfA/D/+r/KaU3H79cwZP8K49d3K RN6t2PM472DhvOlf4wl9l1fDHDPz2e4u8nTWXFDVr1CyJKu9/WvX0Ts0PcL/ink7nq9Km2DAA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230518_053546_729321_EB89E777 
X-CRM114-Status: UNSURE (   7.88  )
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
index 7e0b87d5aa2e..4ef20257cae4 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18138,6 +18138,7 @@ F:	drivers/clk/microchip/clk-mpfs*.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
+F:	drivers/pwm/pwm-microchip-core.c
 F:	drivers/reset/reset-mpfs.c
 F:	drivers/rtc/rtc-mpfs.c
 F:	drivers/soc/microchip/mpfs-sys-controller.c
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
