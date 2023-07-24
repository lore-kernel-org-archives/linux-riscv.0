Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D7EDC001DE
	for <linux-riscv@archiver.kernel.org>; Mon, 24 Jul 2023 10:12:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jiJ5bbk6OcMCsTdJoU+WSb423D+C/Wo2OXLvA4qGVf0=; b=bTHvLPWcJVfCDH
	gaKfC82gqtd1isVGTgsjcwhkk0n8soPjTFt4TOCHT1LB/B0WodvMtMH8we3+F8NNjyTsq/DShBMoL
	GC4fw7Tmgl0xSbBKzKL/jsAbETd8aNkTFDGJ7nPqAS6pcPOnz8+OKLNHy79pBB6kxhHdRD3Z1PTaB
	5ktzBBpXGKh8KP85tRX41UYYWmyo6VLla6IOrxdl2ka6k5/oXyrVg+o8K1kwI5FU78Cl6o/+fT588
	XdVFfhsENNh/lXYq5U849a54lUNx1K37kHNebddBV8pv/WG6r86q/sGYPBqqtDlIGdt2+DjCwyjCK
	zqP6psFwbpW+tA102e3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsXx-003c98-1L;
	Mon, 24 Jul 2023 10:12:09 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qNsXs-003bsy-14
	for linux-riscv@lists.infradead.org;
	Mon, 24 Jul 2023 10:12:05 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 3B65024E337;
	Mon, 24 Jul 2023 18:10:56 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 24 Jul
 2023 18:10:56 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 24 Jul 2023 18:10:55 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v3 0/2] Add SPI module for StarFive JH7110 SoC
Date: Mon, 24 Jul 2023 18:10:52 +0800
Message-ID: <20230724101054.25268-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230724_031204_535509_5F5305EC 
X-CRM114-Status: GOOD (  11.53  )
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
SPI controller. And this driver will be used in StarFive's
VisionFive 2 board. The first patch constrain minItems of clocks
for JH7110 SPI and Patch 2 adds support for StarFive JH7110 SPI.

Changes v2->v3:
- Rebaed to v6.5rc3.
- Registered one more clock.
- Dropped commit that changed the number of clocks in YAML.
- Rewrited the commit comment.

Changes v1->v2:
- Rebaed to v6.5rc1.
- Submitted reference file separately.
- Dropped 'status' node as it was 'okay' by default.
- Dropped Co-developed-by message.

The patch series is based on v6.5rc3.

William Qiu (2):
  dt-bindings: spi: add reference file to YAML
  riscv: dts: starfive: Add spi node and pins configuration

 .../devicetree/bindings/spi/spi-pl022.yaml    |   1 +
 .../jh7110-starfive-visionfive-2.dtsi         |  50 +++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 105 ++++++++++++++++++
 3 files changed, 156 insertions(+)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
