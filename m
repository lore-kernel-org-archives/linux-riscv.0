Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31013C77B6F
	for <linux-riscv@archiver.kernel.org>; Tue, 11 Apr 2023 08:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=zMs54uzWmxfu+9ohxGOYaBNREN/lbqG0LevVG/iJFts=; b=dhlvLypUUAOHn0
	63WltVFs6FK31w7i1oAFy2xnmpp/Lqb17wq9JJzauVXYXQc7hMe+drovY18S8VyPDRlIW/APMmIVf
	cWErqT7GJIZqoO6vJDyjFD1u54UkkuXVfk7kmZo7UCzaBk/iHPkliWAv6JqiuKPi9aLDdm78dhaaN
	A3lBt3BIICmkud9d9G63KoYX1wva6t6Pz1ocbdlmI2uPlU2hhg+/iyvrnxHvLUfHkG0R1nUof0k3V
	K6EirdbujtgKoBnVBQHMAlDvVzViMYG6l4DGELyQS6SDOLs5er0vjjT/NvR+qBDQtbOgBG/NGKiYq
	jsK0ADymMgCtPxypf/aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9og-00GyHl-0h;
	Tue, 11 Apr 2023 08:57:30 +0000
Received: from esa.microchip.iphmx.com ([68.232.154.123])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pm9oc-00GyFg-2R
	for linux-riscv@lists.infradead.org;
	Tue, 11 Apr 2023 08:57:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1681203446; x=1712739446;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=gVYx9+DVF2GF+A4bANXLI3OWUXhLfRnRmzz023oqQG4=;
  b=hSA5Gdv0Lk6DJDDXlUEE1To7i6KrE80hUAXowa7yZjCVvTpRuzJlh0B6
   6wzM8FvRKzqgg4ekUbdlFaq161gpEPQ3J4IyAGp3xd64+Q68ZRXmUPjO7
   sPk43XdoelklHb9KTM9Vq8cxA6jVca2k1K9zbrinYP3vBlWOBfrOhfClB
   BeEfKaOAPCUn67rMDRzteLhnpgXjtJpLEHx7MO1C4Rz4Fo2n0UyR7W97H
   dQeO5tU4uvM5bHn6FJ2NL30aIrnUyxXtBYAwzDcDY5nav7POC78V6XAPo
   dV/q3hRPBl4Hoo8/DOCWGSRJ9pW15oNa9SNwFvEL8Ka4KyFNRAmuzm6QG
   g==;
X-IronPort-AV: E=Sophos;i="5.98,336,1673938800"; 
   d="scan'208";a="146437125"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa6.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 11 Apr 2023 01:57:11 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex03.mchp-main.com (10.10.85.151) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Tue, 11 Apr 2023 01:57:10 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2507.21 via Frontend
 Transport; Tue, 11 Apr 2023 01:57:08 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Thierry Reding <thierry.reding@gmail.com>,
	=?UTF-8?q?Uwe=20Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-pwm@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v16 2/2] MAINTAINERS: add pwm to PolarFire SoC entry
Date: Tue, 11 Apr 2023 09:56:35 +0100
Message-ID: <20230411-dastardly-payable-a74538861513@wendy>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230411-wizard-cautious-3c048db6b4d2@wendy>
References: <20230411-wizard-cautious-3c048db6b4d2@wendy>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=668; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=gVYx9+DVF2GF+A4bANXLI3OWUXhLfRnRmzz023oqQG4=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDCmmCgfntPLVZTkVX2iuvv7xcvgSjYtbAye9ZTnN7SESeLh4 8ZHAjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAExkSg8jw3KX/WsDjyzNTn69+5HK3a Va1jfKFa08XxbMLeneu2bDm7MM/wMnMzzY4lW0X3xPcxrf367vpytvvpXptZi37hRTpeqBd2wA
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230411_015727_176855_2278130B 
X-CRM114-Status: UNSURE (   6.46  )
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
index 8d5bc223f305..128cc89a47d8 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17993,6 +17993,7 @@ F:	drivers/clk/microchip/clk-mpfs.c
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
