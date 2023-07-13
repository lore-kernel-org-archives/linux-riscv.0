Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E93BC001DF
	for <linux-riscv@archiver.kernel.org>; Thu, 13 Jul 2023 09:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=A1P0xCtc7hoVnbvTarBsjxz7NIzxSVjZkuhv+SJXjSI=; b=hs/nZunJ8/CSNt
	WtpySf6Cuiz1E4DsL7PHMWyE9dryXLtzFbdL6m6CATrDT2Bnolh3i9NOioDhtWamGcZYtAGlygbhA
	nazHhKFOrFe8SrB8evOu4OZxiSJOmP/m216loIHNifKp/CqchL5ZkCMV2q9QvEPtM1nhZK6QlFYqO
	LiEeeIoRCX2aJBtkqcYDG4D+u0IOTpeO/VGOJjznYeDPVyTJwlwEhKoR+kNtKuIB0rpoTi3JH31sv
	GxvKNEVf80VpwZ8mhbN+V9/nWUus3VG2eow1HAdrFMzt/KOaVmr8EmZRMuv8u4e3Ovghvcx7V2NGL
	Xc1eJWDAVlLyVatj38xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsBv-002Wcy-2Z;
	Thu, 13 Jul 2023 09:00:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qJsBs-002WX2-03
	for linux-riscv@lists.infradead.org;
	Thu, 13 Jul 2023 09:00:50 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id CB51B82CB;
	Thu, 13 Jul 2023 17:00:16 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 13 Jul
 2023 17:00:16 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 13 Jul 2023 17:00:15 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-spi@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
CC: Mark Brown <broonie@kernel.org>, Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley
	<conor+dt@kernel.org>, Emil Renner Berthing <kernel@esmil.dk>, Linus Walleij
	<linus.walleij@linaro.org>, William Qiu <william.qiu@starfivetech.com>
Subject: [PATCH v2 0/3] Add SPI module for StarFive JH7110 SoC
Date: Thu, 13 Jul 2023 17:00:12 +0800
Message-ID: <20230713090015.127541-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230713_020048_240542_FFBE48C3 
X-CRM114-Status: UNSURE (   9.87  )
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

Changes v1->v2:
- Rebaed to v6.5rc1.
- Submitted reference file separately.
- Dropped 'status' node as it was 'okay' by default.
- Dropped Co-developed-by message.

The patch series is based on v6.5rc1.

William Qiu (3):
  dt-bindings: spi: add reference file to YAML
  dt-bindings: spi: constrain minItems of clocks and clock-names
  riscv: dts: starfive: Add spi node for JH7110 SoC

 .../devicetree/bindings/spi/spi-pl022.yaml    | 11 ++-
 .../jh7110-starfive-visionfive-2.dtsi         | 50 ++++++++++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 98 +++++++++++++++++++
 3 files changed, 156 insertions(+), 3 deletions(-)

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
