Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09AA6C43334
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Jun 2022 07:41:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=mr4Ng5YuuyOtW7synbpUrN7EALmxRjfMhuw/4EFqzwk=; b=jLL9jQf2AwDhyM
	6fmGKCPul6Di1gc+SQn/gQIY/pQ+WWhd1JRtQ5CFsarUwDoveaZWSVMMjdukTnpFhikQF564lGbFI
	MDslFapMV5Y6HYrxn0FufpfHHS1pS9JBG4eE4kXa+7e1TKHjX3QSuUNtY05ib6o8gL67QakmpL2jK
	P8xRBWizlHPK/a1x3Oi+FGjZtnyuH2kzs5A8EgGJcztLjJm2n79gCLnI6m6fjlo8N+hKuNAYOsROr
	wcyWw+hvGauwBzE3myjhzLuAfsNEfeGGdFcNqK0BtPMCzadSYY4QlUoOt9xmYYqYU2Eu5C372zK5/
	KC+K6Gduy2KeFtBJ7r3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTq0-005WgY-5k; Tue, 07 Jun 2022 07:41:16 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nyTpP-005WNN-TQ
	for linux-riscv@lists.infradead.org; Tue, 07 Jun 2022 07:40:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1654587641; x=1686123641;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=L+pWQiKVFTUk9f3rrp9Qu421lTiVrGXO1VHPp8ZzXIY=;
  b=St6dMEFc1VMQLc7Upx4/rPPITY+Fb4kDrfodlL/pRUuRerK+IIPM/7Mc
   ppaafPb5aOZVQql7b5vQZtXAI6nR/zTZiCqziaNQ8ps78l+u6N1oD+oSO
   /8Ajzweavo1y6qEPivT15EQvw9cGLMxwn7xbvvI+LMOP3zLVM0r4PMYrC
   Q1ZU5Tts5w8XnXxeYCXO0y/VkNABVNpG7ST0XQ350bVIrIsopqd2vDawx
   /JZSbe8otOAH9IoNChP87Shhsez79hPT94KRJarXBWinN53ZNKLtDzz1B
   T1JrdJK1q65bGEF73Pv5vmKKdiCUaXnMEUg3BFGMZ0pzaN52ZuwZbCwPL
   Q==;
X-IronPort-AV: E=Sophos;i="5.91,283,1647327600"; 
   d="scan'208";a="167043052"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa5.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 07 Jun 2022 00:40:39 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Tue, 7 Jun 2022 00:40:34 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Tue, 7 Jun 2022 00:40:32 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>,
	<linux-kernel@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH 0/2] Add support for PolarFire SoC's spi controllers
Date: Tue, 7 Jun 2022 08:38:32 +0100
Message-ID: <20220607073833.2331539-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220607_004040_025226_FC16B304 
X-CRM114-Status: UNSURE (   7.84  )
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

Hey Mark,

As it says on the tin, here's a patch adding support for the spi
controllers on PolarFire SoC. The binding for them was already
added in 5.18.

Thanks,
Conor.

Conor Dooley (2):
  spi: add support for microchip fpga spi controllers
  MAINTAINERS: add spi to PolarFire SoC entry

 MAINTAINERS                      |   1 +
 drivers/spi/Kconfig              |   9 +
 drivers/spi/Makefile             |   1 +
 drivers/spi/spi-microchip-core.c | 632 +++++++++++++++++++++++++++++++
 4 files changed, 643 insertions(+)
 create mode 100644 drivers/spi/spi-microchip-core.c


base-commit: 4b0986a3613c92f4ec1bdc7f60ec66fea135991f
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
