Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40167C77B61
	for <linux-riscv@archiver.kernel.org>; Mon, 10 Apr 2023 07:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ANqjkxSH2OFhYcqMf3pDlwYb/4s2VKcZD2jhPgTpmHo=; b=1MwAlAaJUpiJAt
	hLDHjeC9FHZCMAscf1pRaGl7AeZG3oZ2m9rFjyaBgSf26M73JUCrhf+f/FNgnFkrGn1GHe58FEIwS
	zXzce92KwWMyXga6FzExDrjv/QlPAae97agGflftooHk8OKTuB7k5IUYakOfhRkkIyOxS/Rm9HL5/
	QjCKRrbgo/d7jBkyRlrGjKdlpGAGO/IPOXGkyw1mkXjf/giLv5RU5uyma2dHi9tKk6vGQEB4TU7Cp
	JWZot9DqQzvdHegG3NNuYk2kLSHMKz2X+x8SgDduIqqPOFG7nceQ4RzhMyhGiTjEGbt57tdNkOhRq
	mDG/afln1+lOvXPf1mbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plm72-00EjiL-20;
	Mon, 10 Apr 2023 07:38:52 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1plm6z-00EjeJ-2U
	for linux-riscv@lists.infradead.org;
	Mon, 10 Apr 2023 07:38:51 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id B04C924E17E;
	Mon, 10 Apr 2023 15:37:58 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 15:37:58 +0800
Received: from ubuntu.localdomain (202.188.176.82) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 10 Apr
 2023 15:37:54 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Emil Renner Berthing <kernel@esmil.dk>, Conor Dooley
	<conor.dooley@microchip.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v4 0/4] crypto: starfive - Add drivers for crypto engine
Date: Mon, 10 Apr 2023 15:37:48 +0800
Message-ID: <20230410073752.39506-1-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230410_003850_147274_6D538A3A 
X-CRM114-Status: GOOD (  15.26  )
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
engine. The first patch adds Documentations for the device and Patch 2
adds device probe and DMA init for the module. Patch 3 adds crypto and
DMA dts node for VisionFive 2 board. Patch 4 adds hash/hmac support to
the module.

Patch 3 needs to be applied on top of:
https://patchwork.kernel.org/project/linux-riscv/cover/20230120024445.244345-1-xingyu.wu@starfivetech.com/

Changes v3->v4:
- Use fallback for non-aligned cases as hardware doesn't support
  hashing piece-meal (Herbert)
- Use ahash_request_set_* helpers to update members of ahash_request
  (Herbert)
- Set callbacks for async fallback (Herbert)
- Remove completion variable and use dma_callback to do the rest of
  processing instead. (Herbert)

Changes v2->v3:
- Only implement digest and use fallback for other ops (Herbert)
- Use interrupt instead of polling for hash complete (Herbert)
- Remove manual data copy from out-of-bound memory location as it will
  be handled by DMA API. (Christoph & Herbert)

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

 .../crypto/starfive,jh7110-crypto.yaml        |  70 ++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  28 +
 drivers/crypto/Kconfig                        |   1 +
 drivers/crypto/Makefile                       |   1 +
 drivers/crypto/starfive/Kconfig               |  21 +
 drivers/crypto/starfive/Makefile              |   4 +
 drivers/crypto/starfive/jh7110-cryp.c         | 234 +++++
 drivers/crypto/starfive/jh7110-cryp.h         | 127 +++
 drivers/crypto/starfive/jh7110-hash.c         | 990 ++++++++++++++++++
 10 files changed, 1483 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/starfive,jh7110-crypto.yaml
 create mode 100644 drivers/crypto/starfive/Kconfig
 create mode 100644 drivers/crypto/starfive/Makefile
 create mode 100644 drivers/crypto/starfive/jh7110-cryp.c
 create mode 100644 drivers/crypto/starfive/jh7110-cryp.h
 create mode 100644 drivers/crypto/starfive/jh7110-hash.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
