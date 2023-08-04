Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69773EB64DD
	for <linux-riscv@archiver.kernel.org>; Fri,  4 Aug 2023 02:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=/ZXCZ0x/nLCdWI/F3a8yE8L/wZDl+/F4dQu1vabEDCQ=; b=ARCki/g9KOwL9j
	dbVJTsciTm704fdzglWYlnbstd9xqHkqevygd6sFA7aSFHZapaYnobtP/CPJHI4FziYNnFA14EAVv
	xunz9Ws5wf0EkoA70ITpa32FpUEdLCXc4tcNqZT3VLH9zI9/i2m2nrj3qyvB6chmv3f/UOw43SoRb
	YbpkmM2kCjWth1SN8NvSnhqG/VeXhv75082N32ZLvYrqVTO4b4F4AmXcbT6pCdbmIxnXv8KzpaZDF
	olGA5haUAXHgAS9BsiH2pK90fxD3ZkByTA3sZlgwKhRWklLiUOY/lX2tQnJZzMsE/j+gd8YZz5QlA
	FlX5p3uL2spIvCZKngxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkAS-00BK3L-0Y;
	Fri, 04 Aug 2023 02:03:52 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRkAP-00BJxF-0J
	for linux-riscv@lists.infradead.org;
	Fri, 04 Aug 2023 02:03:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 112398067;
	Fri,  4 Aug 2023 10:02:56 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 4 Aug
 2023 10:02:56 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Fri, 4 Aug 2023 10:02:55 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Ziv Xu
	<ziv.xu@starfivetech.com>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v6 0/3] Add initialization of clock for StarFive JH7110 SoC
Date: Fri, 4 Aug 2023 10:02:51 +0800
Message-ID: <20230804020254.291239-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230803_190349_483429_3D8575A8 
X-CRM114-Status: GOOD (  12.20  )
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

Hi,

This patchset adds initial rudimentary support for the StarFive
Quad SPI controller driver. And this driver will be used in
StarFive's VisionFive 2 board. In 6.4, the QSPI_AHB and QSPI_APB
clocks changed from the default ON state to the default OFF state,
so these clocks need to be enabled in the driver.At the same time,
dts patch is added to this series.

Changes v5->v4:
- Rebased to v6.4rc4.
- Dropped the Reported-by tags.

Changes v4->v5:
- Rebased to v6.5rc2.
- Changed the way to initialization the clocks.
- Changed the layout for the SPI flash.

Changes v3->v4:
- Added minItems for clocks.
- Added clock names property.
- Fixed formatting issues.

Changes v2->v3:
- Rebased to v6.4rc6.
- Renamed the clock names.
- Changed the variable definition type.

Changes v1->v2:
- Renamed the clock names.
- Specified a different array of clocks.
- Used clk_bulk_ APIs.

The patch series is based on v6.5rc4.

William Qiu (3):
  dt-bindings: qspi: cdns,qspi-nor: Add clocks for StarFive JH7110 SoC
  spi: cadence-quadspi: Add clock configuration for StarFive JH7110 QSPI
  riscv: dts: starfive: Add QSPI controller node for StarFive JH7110 SoC

 .../bindings/spi/cdns,qspi-nor.yaml           | 12 +++-
 .../jh7110-starfive-visionfive-2.dtsi         | 36 ++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 19 ++++++
 drivers/spi/spi-cadence-quadspi.c             | 67 +++++++++++++++++++
 4 files changed, 133 insertions(+), 1 deletion(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
