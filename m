Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE0CFC54EAA
	for <linux-riscv@archiver.kernel.org>; Mon, 30 Jan 2023 15:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=tsYX+bsG7Ni1FOIUTbBbcVOIq5SqM6ZpTc2oam4H2fI=; b=j1kz3O83A2MfHz
	wO1ll+YHrGZ4nmIFrx4Bn95PrsclM9mGjb9Pg8DyvTbgkqAFrDvYpanKfCkEm9w4JKl8wFBeWHvCf
	Op01yOeB8pArdK7yL2IzHQoWHnwnxTNSPaWtL92ndVfM5hFDiTzZHpR6CVY/7W6XM4YPcCPdH6gxs
	LS3O2Vze6OUSLr7XgLm14V1th8F0CWBooPg7TV8IXUMZtxRdI87el09Ua1cPHNLHis6kpHdN+lbHo
	HZqc7Vpr7Ak62wVzjTlnrToeM9U0cCV62zfOnmfRE2ANZ06vA0kiXWH04/ESrPK+kPfoctedDhtXQ
	JMEXTnjHtzim1GOurGZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWLv-0045cn-Ps; Mon, 30 Jan 2023 15:45:51 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pMWLM-0045Ro-8F
	for linux-riscv@lists.infradead.org; Mon, 30 Jan 2023 15:45:20 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 7455F24E02F;
	Mon, 30 Jan 2023 23:44:35 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 23:44:35 +0800
Received: from ubuntu.localdomain (202.190.105.77) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 30 Jan
 2023 23:43:07 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor.dooley@microchip.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/4] crypto: starfive - Add drivers for crypto engine
Date: Mon, 30 Jan 2023 23:42:38 +0800
Message-ID: <20230130154242.112613-1-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.190.105.77]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230130_074516_613408_52FE4C4A 
X-CRM114-Status: GOOD (  13.23  )
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

This patch series adds kernel driver support for StarFive JH7110 crypto
engine. The first patch add Documentations for the device and Patch 2
adds device probe and DMA init for the module. Patch 3 adds crypto and
DMA dts node for VisionFive 2 board. Patch 4 adds hash/hmac support to
the module.

Patch 3 needs to be applied on top of:
https://patchwork.kernel.org/project/linux-riscv/patch/20221220011247.35560-7-hal.feng@starfivetech.com/
https://patchwork.kernel.org/project/linux-riscv/cover/20230120024445.244345-1-xingyu.wu@starfivetech.com/

Changes v1->v2:
- Fixed yaml filename and format (Krzysztof)
- Removed unnecessary property names in yaml (Krzysztof)
- Moved of_device_id table close to usage (Krzysztof)
- Use dev_err_probe for error returns (Krzysztof)
- Dropped redundant readl and writel wrappers (Krzysztof)
- Updated commit signed offs (Conor)
- Dropped redundant node in dts, module set to on in dtsi (Conor)

Jia Jie Ho (4):
  dt-bindings: crypto: Add StarFive crypto module
  crypto: starfive - Add crypto engine support
  riscv: dts: starfive: Add crypto and DMA node for VisionFive 2
  crypto: starfive - Add hash and HMAC support

 .../crypto/starfive,jh7110-crypto.yaml        |   70 ++
 MAINTAINERS                                   |    7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   27 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/starfive/Kconfig               |   20 +
 drivers/crypto/starfive/Makefile              |    4 +
 drivers/crypto/starfive/starfive-cryp.c       |  238 ++++
 drivers/crypto/starfive/starfive-hash.c       | 1095 +++++++++++++++++
 drivers/crypto/starfive/starfive-regs.h       |   71 ++
 drivers/crypto/starfive/starfive-str.h        |   99 ++
 11 files changed, 1633 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
 create mode 100644 drivers/crypto/starfive/Kconfig
 create mode 100644 drivers/crypto/starfive/Makefile
 create mode 100644 drivers/crypto/starfive/starfive-cryp.c
 create mode 100644 drivers/crypto/starfive/starfive-hash.c
 create mode 100644 drivers/crypto/starfive/starfive-regs.h
 create mode 100644 drivers/crypto/starfive/starfive-str.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
