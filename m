Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6385D0BB4E
	for <linux-riscv@archiver.kernel.org>; Thu, 24 Oct 2024 01:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=lvo337FEG1SKaD4BVfu7hWBdo/Nrp7nq28iIhwGsKAA=; b=g3c58XrAIM4hdV
	xjCGqn39jCqAdKr1+pSUueeYcG6Utatp70tiEZFWC+6lTOm8Qw2Gl+xXhwVCNBds2+nK+PpdL3gsf
	H+u+8rJlAcIV22ROL8MiC73j/yD12Manj1Thv9w+vcrr8G547aN8mbgdan10n7KgSu3wUGs7kwy6B
	VXkA0xy752Ywlk0DN3lXjnCkCrJYrAEgocBEJlu4KRlCS5Sl4xlLkfhReeXeMRLrmznnNHduZeP45
	acccIFczetiJSkukCgXOcsCnsswTY+J1D0jcFZJSQE1QVKE+eCqIKyBA03uixb4rnjLR43nnI37/d
	WzR4zP+iPj6x/eyVxxvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n5f-0000000GTEZ-1aVq;
	Thu, 24 Oct 2024 01:56:43 +0000
Received: from szxga04-in.huawei.com ([45.249.212.190])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3n5c-0000000GTCV-30N5
	for linux-riscv@lists.infradead.org;
	Thu, 24 Oct 2024 01:56:42 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4XYprl5ljjz2FbTk;
	Thu, 24 Oct 2024 09:55:03 +0800 (CST)
Received: from kwepemg200008.china.huawei.com (unknown [7.202.181.35])
	by mail.maildlp.com (Postfix) with ESMTPS id C1C841A0188;
	Thu, 24 Oct 2024 09:56:27 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemg200008.china.huawei.com
 (7.202.181.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Thu, 24 Oct
 2024 09:56:27 +0800
From: Jinjie Ruan <ruanjinjie@huawei.com>
To: <jic23@kernel.org>, <lars@metafoo.de>, <paul.walmsley@sifive.com>,
	<palmer@dabbelt.com>, <aou@eecs.berkeley.edu>, <nuno.sa@analog.com>,
	<javier.carrasco.cruz@gmail.com>, <sunke@kylinos.cn>,
	<conor.dooley@microchip.com>, <anshulusr@gmail.com>, <ruanjinjie@huawei.com>,
	<kimseer.paller@analog.com>, <michael.hennerich@analog.com>,
	<linux-iio@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>, <noname.nuno@gmail.com>
Subject: [PATCH v2] iio: dac: Kconfig: Fix build error for ltc2664
Date: Thu, 24 Oct 2024 09:55:53 +0800
Message-ID: <20241024015553.1111253-1-ruanjinjie@huawei.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 kwepemg200008.china.huawei.com (7.202.181.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_185640_922414_531DCE8E 
X-CRM114-Status: GOOD (  10.03  )
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

Select REGMAP_SPI instead of REGMAP for LTC2664 to fix it.

Fixes: 4cc2fc445d2e ("iio: dac: ltc2664: Add driver for LTC2664 and LTC2672")
Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
---
v2:
- Select REGMAP_SPI instead of REGMAP.
- Update the commit subject.
- Add Reviewed-by.
---
 drivers/iio/dac/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/Kconfig b/drivers/iio/dac/Kconfig
index 45e337c6d256..9f5d5ebb8653 100644
--- a/drivers/iio/dac/Kconfig
+++ b/drivers/iio/dac/Kconfig
@@ -380,7 +380,7 @@ config LTC2632
 config LTC2664
 	tristate "Analog Devices LTC2664 and LTC2672 DAC SPI driver"
 	depends on SPI
-	select REGMAP
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
