Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47CDC43334
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Jun 2022 11:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=7DUqwLMtfIu2x0adRFkFD1l3bQr+exFrADA8TgXc2TM=; b=0KS4TosiSbhdeX
	/gxarqnqFkEzF4oHSnbqo1CJYAMIX80hPlp/TfD2/yfB/dul6qNeHu55D55MSSDM39LeK5t1vBi68
	2MN2cUOdznVHglRFtuMZ3f+s9GabTJDOld6qd2qyDy51GqMAviRG48SEPkYRafAemyQiLz2uIi24q
	yC7sJG7g5U0XKHg8zb2oq/rBoog9bUd6qy9ef+0zzLgVUdNHNtwhQa4ZAXVcmhwXM184JAY6lCjwY
	B3T+i8/J1GImU9iG2w934i0nSpq5++iPui76z/0e88y08SrxOoNPAUF9i1+oetALF7mxJ60nuV15c
	j9BVZQm0EWAGtnCNyRVQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RGm-00EC7q-5A; Wed, 15 Jun 2022 11:33:08 +0000
Received: from esa.microchip.iphmx.com ([68.232.153.233])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1o1RGj-00EC6j-G4
	for linux-riscv@lists.infradead.org; Wed, 15 Jun 2022 11:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1655292785; x=1686828785;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=J2xeVFHRhS32YajK2SQJsuNx2FZegiEhlRercXHKr34=;
  b=pPksHNOvxVQktD+GcAmcawkCYt9qVp5vG8s1gtFbOyz5o4CKPEdSeH5n
   dHeHBNCCqikkWjd6XXlqLBCiPBe8pDddFe3Pi0bLUib1MJFk0O3mjkZAA
   Ixmjwsfagq6R0aP902UB0TSQQ2bc8wHqLJtwr3sWDblFXOYMxB5wN0pM1
   iy//o/C0eH6EazuB0Vs3wLbgHTPTPej3vP7ODasx0mmdwDKdnRPhKttRE
   ysbnBBbK4Rly8+QIK/sPPbr1H1inxUI0XvPIcNjCk629mmrCs/ij5cP85
   7NZsH7SXE/E2TXOheHtnLKCQwPgd8tkEK3WpWG1Ivc4ThBH3iuduhGiGb
   g==;
X-IronPort-AV: E=Sophos;i="5.91,302,1647327600"; 
   d="scan'208";a="168507967"
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa3.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 15 Jun 2022 04:33:04 -0700
Received: from chn-vm-ex04.mchp-main.com (10.10.85.152) by
 chn-vm-ex02.mchp-main.com (10.10.85.144) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Wed, 15 Jun 2022 04:33:04 -0700
Received: from wendy.microchip.com (10.10.115.15) by chn-vm-ex04.mchp-main.com
 (10.10.85.152) with Microsoft SMTP Server id 15.1.2375.17 via Frontend
 Transport; Wed, 15 Jun 2022 04:33:02 -0700
From: Conor Dooley <conor.dooley@microchip.com>
To: Mark Brown <broonie@kernel.org>
CC: Daire McNamara <daire.mcnamara@microchip.com>, Lewis Hanly
	<lewis.hanly@microchip.com>, Conor Dooley <conor.dooley@microchip.com>,
	<linux-riscv@lists.infradead.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH] spi: microchip-core: fix passing zero to PTR_ERR warning
Date: Wed, 15 Jun 2022 12:30:22 +0100
Message-ID: <20220615113021.2493586-1-conor.dooley@microchip.com>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220615_043305_585597_34D714F4 
X-CRM114-Status: GOOD (  11.55  )
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

It is possible that the error case for devm_clk_get() returns NULL,
in which case zero will be passed to PTR_ERR() as shown by the Smatch
static checker warning:
drivers/spi/spi-microchip-core.c:557 mchp_corespi_probe()
warn: passing zero to 'PTR_ERR'

Fix the warning by explicitly returning an error if devm_clk_get()
returns NULL.

Fixes: 9ac8d17694b6 ("spi: add support for microchip fpga spi controllers")
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
Link: https://lore.kernel.org/linux-spi/20220615091633.GI2168@kadam/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
 drivers/spi/spi-microchip-core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/spi/spi-microchip-core.c b/drivers/spi/spi-microchip-core.c
index 5b2aee30fa04..d44663cca071 100644
--- a/drivers/spi/spi-microchip-core.c
+++ b/drivers/spi/spi-microchip-core.c
@@ -554,7 +554,7 @@ static int mchp_corespi_probe(struct platform_device *pdev)
 
 	spi->clk = devm_clk_get(&pdev->dev, NULL);
 	if (!spi->clk || IS_ERR(spi->clk)) {
-		ret = PTR_ERR(spi->clk);
+		ret = !spi->clk ? -ENXIO : PTR_ERR(spi->clk);
 		dev_err(&pdev->dev, "could not get clk: %d\n", ret);
 		goto error_release_master;
 	}
-- 
2.36.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
