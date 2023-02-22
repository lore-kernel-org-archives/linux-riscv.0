Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ABB2C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 22 Feb 2023 12:47:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=moy2YHDFsNwB7sXvhAPvyCFGr4KKzyouFxEJuLQ2sJE=; b=NeMQtdaQgD4o59
	WD2HtzWLgF7YBCJKdYurcJHwHyhsJ+zeTD1uXcGeKn70Ljhbk/dn7X73+CRjgZCBkVNATlykGTjo2
	Gov1vsRq+6e3ziQUDW2OE52L16pkrMbCtlNWy0qekVT5/QzyjkqkFJWrH++qIRzo4hqbPmlXYT8F4
	n44xcCxyOR+GdSVpQ2053XzeFZFIyBzQCSTJW55MC5RFXcwck0/W7srX2wBoVGpD2Ff2u5evnaBDs
	bZShMjmVZqVyFkZU6qx1ih2wzzrG0e/ph1Rd9jkwsD1U2d96T4emjrk4s2uSs4MawEoasBEw0Qipu
	/3PqSK6b9tgQvGbZcuBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUoWs-00CRac-Pc; Wed, 22 Feb 2023 12:47:26 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pUoWp-00CRYg-Ai
	for linux-riscv@lists.infradead.org; Wed, 22 Feb 2023 12:47:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1677070043; x=1708606043;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=bz2YGtVOM/rE8m1sy9aAUJspjtnfkVan+svdZyu3YfQ=;
  b=uterJogJ+xhAOylkqH/72Xiw5jVGtgEatSr8Z8zByrIFE5/kYoaE9VAQ
   qd/IiFPZUDf/JStTInHoMb4GrqMU5Km+4u/KIXAT0dPyFX0D4R5NpsU7r
   iyQ6boD7TRJ9fNlHMJZamXUwbSZbgFH7/3ZA7FICGVBV9fzP9KBHDzpL4
   Tnkb5kiPIFfGCSjPMqHYqdw1ARPBVC2UxlqPr1EeRyerNaRFJw4rWTDRV
   +F2dmpWoFsecarRX1+feSr0nxgkrR6wUCHs4eCUB2ZiGcOWSodIsm2YUU
   XSdZtBcFf4oNs/LdsOJQK/9YxPM7uKIU03T9I/l1foH3j02J/HpAgBX5n
   g==;
X-IronPort-AV: E=Sophos;i="5.97,318,1669100400"; 
   d="scan'208";a="201759967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 22 Feb 2023 05:47:19 -0700
Received: from chn-vm-ex03.mchp-main.com (10.10.85.151) by
 chn-vm-ex01.mchp-main.com (10.10.85.143) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.16; Wed, 22 Feb 2023 05:47:18 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex03.mchp-main.com
 (10.10.85.151) with Microsoft SMTP Server id 15.1.2507.16 via Frontend
 Transport; Wed, 22 Feb 2023 05:47:17 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Conor Dooley <conor@kernel.org>, <sboyd@kernel.org>
CC: Conor Dooley <conor.dooley@microchip.com>, <linux-clk@vger.kernel.org>,
	<daire.mcnamara@microchip.com>, <linux-riscv@lists.infradead.org>
Subject: [PATCH] MAINTAINERS: add missing clock driver coverage for Microchip FPGAs
Date: Wed, 22 Feb 2023 12:46:11 +0000
Message-ID: <20230222124610.257101-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1032; i=conor.dooley@microchip.com; h=from:subject; bh=bz2YGtVOM/rE8m1sy9aAUJspjtnfkVan+svdZyu3YfQ=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDMnf+Cb9NMhzeeVuyHiwd/ey8LjvDp8u6lzVD1e5laPwUuBI tuqJjlIWBjEOBlkxRZbE230tUuv/uOxw7nkLM4eVCWQIAxenAEzk0TeGn4y1/ydmh0hrO809w/C463 rLpQtFbfcSfUJ9ZA0Klp1MV2FkaLJp+nK5YdFyI/3XNhf19SQjY9Mtl0/6waL+cUPCxfd23AA=
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230222_044723_396390_2B835515 
X-CRM114-Status: UNSURE (   8.71  )
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

When the CCC support was added, the clock binding coverage was
converted to a regex in commit 71c8517e004b ("MAINTAINERS: update
polarfire soc clock binding"), but the coverage for the clock drivers
themselves was not updated. Rectify that now.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
Stephen, if you could take this via clk that'd be great, thanks.
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 0abf3589423b..df3d195c1507 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17992,7 +17992,7 @@ F:	Documentation/devicetree/bindings/spi/microchip,mpfs-spi.yaml
 F:	Documentation/devicetree/bindings/usb/microchip,mpfs-musb.yaml
 F:	arch/riscv/boot/dts/microchip/
 F:	drivers/char/hw_random/mpfs-rng.c
-F:	drivers/clk/microchip/clk-mpfs.c
+F:	drivers/clk/microchip/clk-mpfs*.c
 F:	drivers/i2c/busses/i2c-microchip-corei2c.c
 F:	drivers/mailbox/mailbox-mpfs.c
 F:	drivers/pci/controller/pcie-microchip-host.c
-- 
2.39.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
