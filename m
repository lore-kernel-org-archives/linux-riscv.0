Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3281EB64D9
	for <linux-riscv@archiver.kernel.org>; Tue,  4 Jul 2023 09:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=B193Ymu6qw8SIyVelNC+DHtywYYc5nQ2BO1JRuyWpus=; b=jejJY/xoG/e1xl
	+kMzNNpKF9V6hqgDP1EQPNmxdI2mD8t7mqBA6s1l+Bx0rstF29bs/e/yHBNb4DVFMv0SCw+aqJXK9
	T4a1jzCO8l90mTewYZD/Uc4aIJJlFoXzTPsyyIVRGmFCf8A+GCqxk5HgZMiz2wEUpruWZI574srwy
	G71mvk55LFRa8aMU2WYITjyKT3DHcqmvFXPX6NlqSRTChoG0gqIA00vP7a8naKgiHESybPjLRbZyR
	rph6+DCrTOWPXCaHMBLwjMWgkJHFQLghL8F0gICMhi0iZZ+E2GL6mHliWn8IGmgR1+p/gUFRfqYZO
	B9S2ASP5SiTO1QkOSf4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcEt-00ChQH-2D;
	Tue, 04 Jul 2023 09:22:27 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qGcEq-00ChMO-31
	for linux-riscv@lists.infradead.org;
	Tue, 04 Jul 2023 09:22:26 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 10D45814B;
	Tue,  4 Jul 2023 17:22:02 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 4 Jul
 2023 17:22:02 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Tue, 4 Jul 2023 17:22:01 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>, William Qiu <william.qiu@starfivetech.com>
Subject: [RESEND v1 0/2] Add SPI module for StarFive JH7110 SoC
Date: Tue, 4 Jul 2023 17:21:58 +0800
Message-ID: <20230704092200.85401-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230704_022225_163450_207DFE2C 
X-CRM114-Status: UNSURE (   9.72  )
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

Hi,

This patchset adds initial rudimentary support for the StarFive
SPI controller. And this driver will be used in StarFive's
VisionFive 2 board. The first patch constrain minItems of clocks
for JH7110 SPI and Patch 2 adds support for StarFive JH7110 SPI.

The patch series is based on v6.4rc7.

William Qiu (2):
  dt-binding: spi: constrain minItems of clocks and clock-names
  riscv: dts: starfive: Add spi node for JH7110 SoC

 .../devicetree/bindings/spi/spi-pl022.yaml    | 11 ++-
 .../jh7110-starfive-visionfive-2.dtsi         | 52 ++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 98 +++++++++++++++++++
 3 files changed, 158 insertions(+), 3 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
