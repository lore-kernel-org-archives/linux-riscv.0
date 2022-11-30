Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 803DAC433FE
	for <linux-riscv@archiver.kernel.org>; Wed, 30 Nov 2022 05:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WtHJmJbC7u1+LCy3ylfHOM0LusHKxVbf7swblCeMmkU=; b=weZu/Ubii6N4u9
	3C6+ax9EYFUAKXwc5QRFOP3x3RzsBr2bRz7QpR3mN9JCLZSiKuxrRLUT0vDgLNbo+PVNjxntf9zuc
	LIEZ0fBcr+mWNt6y1C7YSAv6U6PeVLesyNhoh1jbuUWHhjqHj9GRHz+qW+vUiIb+KiNw2Ep2GOxxJ
	CyvGw6FRVHUyRrhOU1lyTPqrZUDTbcLQZYRwh19/Ly3YibAD8cTzeL8fSenM3qFB69pN8NHnJyokE
	fGOyeGw0JibTqrT7E8w8mvkWpi3yS9IIfaEJ8TZO8aqm/950y9giinUMAcjf3GVqph7RwCSlP88PD
	Qt1ask2riEiZWP4vX0YA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0G1v-00DaYn-8J; Wed, 30 Nov 2022 05:53:11 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p0G1r-00DaG7-Cq
	for linux-riscv@lists.infradead.org; Wed, 30 Nov 2022 05:53:09 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 1CEE524E0AC;
	Wed, 30 Nov 2022 13:52:21 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 13:52:21 +0800
Received: from ubuntu.localdomain (202.188.176.82) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 30 Nov
 2022 13:52:17 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Herbert Xu <herbert@gondor.apana.org.au>, "David S . Miller"
	<davem@davemloft.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>, Jia Jie Ho
	<jiajie.ho@starfivetech.com>
Subject: [PATCH 0/6] crypto: starfive: Add driver for cryptographic engine
Date: Wed, 30 Nov 2022 13:52:08 +0800
Message-ID: <20221130055214.2416888-1-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221129_215307_754689_0B07123F 
X-CRM114-Status: GOOD (  12.91  )
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

This patch series adds kernel driver support for Starfive crypto engine.
The engine supports hardware acceleration for HMAC/hash functions,
AES block cipher operations and RSA. The first patch adds basic driver
for device probe and DMA init. The subsequent patches adds supported
crypto primitives to the driver which include hash functions, AES and
RSA. Patch 5 adds documentation to describe device tree bindings and the
last patch adds device node to VisionFive 2 dts.

The driver has been tested with crypto selftest and additional test.

This patch series depends on the following patches:
https://patchwork.kernel.org/project/linux-riscv/cover/20221118010627.70576-1-hal.feng@starfivetech.com/
https://patchwork.kernel.org/project/linux-riscv/cover/20221118011714.70877-1-hal.feng@starfivetech.com/

Jia Jie Ho (6):
  crypto: starfive - Add StarFive crypto engine support
  crypto: starfive - Add hash and HMAC support
  crypto: starfive - Add AES skcipher and aead support
  crypto: starfive - Add Public Key algo support
  dt-bindings: crypto: Add bindings for Starfive crypto driver
  riscv: dts: starfive: Add crypto and DMA node for VisionFive 2

 .../bindings/crypto/starfive-crypto.yaml      |  109 ++
 MAINTAINERS                                   |    7 +
 .../jh7110-starfive-visionfive-v2.dts         |    8 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |   36 +
 drivers/crypto/Kconfig                        |    1 +
 drivers/crypto/Makefile                       |    1 +
 drivers/crypto/starfive/Kconfig               |   20 +
 drivers/crypto/starfive/Makefile              |    4 +
 drivers/crypto/starfive/starfive-aes.c        | 1723 +++++++++++++++++
 drivers/crypto/starfive/starfive-cryp.c       |  324 ++++
 drivers/crypto/starfive/starfive-hash.c       | 1152 +++++++++++
 drivers/crypto/starfive/starfive-pka.c        |  683 +++++++
 drivers/crypto/starfive/starfive-regs.h       |  200 ++
 drivers/crypto/starfive/starfive-str.h        |  194 ++
 14 files changed, 4462 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/crypto/starfive-crypto.yaml
 create mode 100644 drivers/crypto/starfive/Kconfig
 create mode 100644 drivers/crypto/starfive/Makefile
 create mode 100644 drivers/crypto/starfive/starfive-aes.c
 create mode 100644 drivers/crypto/starfive/starfive-cryp.c
 create mode 100644 drivers/crypto/starfive/starfive-hash.c
 create mode 100644 drivers/crypto/starfive/starfive-pka.c
 create mode 100644 drivers/crypto/starfive/starfive-regs.h
 create mode 100644 drivers/crypto/starfive/starfive-str.h

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
