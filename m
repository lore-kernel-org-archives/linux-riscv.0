Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F23AED2E01E
	for <linux-riscv@archiver.kernel.org>; Wed, 23 Oct 2024 08:30:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=W6gtekcQSgA3zOcH7XliZ0lArFmf+FwwIx5UrnkqpKU=; b=gntNL4tyHoagLu
	Knysu8CA38mTFsYtNQ8NbdL5leKuoNECbSKV3gWveKMflMzila/WvjSpwgANFNRYy17Fx7WfLOpEB
	PSdS2fhte4Pdr3X9y5f780Qlfipi1HrjEuj518MID/Kgz1ypQ4/HWlpdjwuz6Z8af/aV9HOB6OOB/
	wZn1XQOg750m/GwhN0yB40pOze6KphsVVzISDkNgJ2syarK7W35leVeZItFciA2gd/od3j3uJtOtR
	cKlzBxKtRqtbuktbx8CroKy33kry5dIMGhjbi20LK+OvRDpmX5k2KRexaNHA/efCzDefLPQ5H5ZUT
	ap0MwVFVK+MD6hxagZmg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3WlK-0000000DZVU-01kr;
	Wed, 23 Oct 2024 08:30:38 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Wem-0000000DYBo-3XzK
	for linux-riscv@lists.infradead.org;
	Wed, 23 Oct 2024 08:23:55 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4XYMTw4jRXzyTb0;
	Wed, 23 Oct 2024 16:22:12 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id 1090A140360;
	Wed, 23 Oct 2024 16:23:44 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 23 Oct
 2024 16:23:43 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<javier.carrasco.cruz@gmail.com>, <nuno.sa@analog.com>,
	<conor.dooley@microchip.com>, <michael.hennerich@analog.com>,
	<anshulusr@gmail.com>, <sunke@kylinos.cn>, <kimseer.paller@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
CC: <ruanjinjie@huawei.com>
Subject: [PATCH] iio: Fix build error for ltc2664
Date: Wed, 23 Oct 2024 16:23:09 +0800
Message-ID: <20241023082309.1002917-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_012353_157551_51291BEF 
X-CRM114-Status: UNSURE (   8.04  )
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

If REGMAP_SPI is n and LTC2664 is y, the following build error occurs:

	riscv64-unknown-linux-gnu-ld: drivers/iio/dac/ltc2664.o: in function `ltc2664_probe':
	ltc2664.c:(.text+0x714): undefined reference to `__devm_regmap_init_spi'

Select REGMAP_SPI for LTC2664 to fix it.

Fixes: 4cc2fc445d2e ("iio: dac: ltc2664: Add driver for LTC2664 and LTC2672")
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
 drivers/iio/dac/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 45e337c6d256..ae6d04c758d1 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -381,6 +381,7 @@ config LTC2664
 	tristate "Analog Devices LTC2664 and LTC2672 DAC SPI driver"
 	depends on SPI
 	select REGMAP
+	select REGMAP_SPI
 	help
 	  Say yes here to build support for Analog Devices
 	  LTC2664 and LTC2672 converters (DAC).
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
