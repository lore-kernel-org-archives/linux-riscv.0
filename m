Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F70BC46467
	for <linux-riscv@archiver.kernel.org>; Tue, 17 Jan 2023 01:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=g2xQpD47oQDEB3fSU0TjXJHNK2Canh8zkj7hgdDoW4I=; b=HJuXJHRiFqHJG9
	T0Pi4GpRxpWBdQ2vb7GZiQ6gsbVElgHKl6aqX7dn8ALhE4N2Q5yecvbYX1VWKuEKm2NCduAjisR/F
	+XdBv08VR5X3ilpHLxbRT+ST/nz8mGz/GRFd9CHeJ0t5S5x5BjfB9623HR/BNKN3Zp9WM6rvr+Lz2
	UPkzEB9OzLTsHCtCit20an24DoUudmgCZuljMOIvUAEurFHxzNPAL79dTUYYQDIj4EszdKFTajLZK
	pIFEKj7Zt4KjaFv6gaBKxFlOjmXPW78eq1vx/BK4T/Mf6CItiRU0B/U7bm9WGqkCRfU1z9y71oqFM
	T8M03YUX1s5EgcIqEH6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHbCJ-00CZwT-DE; Tue, 17 Jan 2023 01:55:35 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pHbCG-00CZu0-0u
	for linux-riscv@lists.infradead.org; Tue, 17 Jan 2023 01:55:34 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id ED3CB24E00A;
	Tue, 17 Jan 2023 09:54:55 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 09:54:56 +0800
Received: from ubuntu.localdomain (202.190.108.220) by EXMBX068.cuchost.com
 (172.16.6.68) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Tue, 17 Jan
 2023 09:54:49 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v5 0/3] hwrng: starfive: Add driver for TRNG module
Date: Tue, 17 Jan 2023 09:54:42 +0800
Message-ID: <20230117015445.32500-1-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [202.190.108.220]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230116_175532_241884_0BB590F8 
X-CRM114-Status: GOOD (  13.71  )
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

This patch series adds kernel support for StarFive JH7110 hardware
random number generator. First 2 patches add binding docs and device
driver for this module. Patch 3 adds devicetree entry for VisionFive 2
SoC.

Patch 3 needs to be applied on top of:
https://patchwork.kernel.org/project/linux-riscv/patch/20221220011247.35560-7-hal.feng@starfivetech.com/

Patch 3 also depends on additional clock and reset patches for stg
domain that are yet to be submitted to mailing list.

Changes v4->v5:
- Updated status in MAINTAINERS. (Conor)
- Specified targeted device in Kconfig title and descriptions. (Conor)
- Removed unnecessary goto label in patch 2. (Conor)
- Enable runtime PM before registering hwrng in patch 2. (Conor)

Changes v3->v4:
- Moved init_completion before IRQ registration to be prepared for
  spurious interrupts. (Herbert)
- Added locks to guard concurrent write to the same register. (Herbert)

Changes v2->v3:
- Use constant usecs and convert to jiffies. (Herbert)
- Removed sleep in irq handler. (Herbert)
- Limited wait time to 40us if wait == 0 for trng read. (Herbert)

Changes v1->v2:
- Updated of_match_ptr and added pm_sleep_ptr. (Krzysztof)
- Dropped "status" in dts as module is always on. (Krzysztof)

Jia Jie Ho (3):
  dt-bindings: rng: Add StarFive TRNG module
  hwrng: starfive - Add TRNG driver for StarFive SoC
  riscv: dts: starfive: Add TRNG node for VisionFive 2

 .../bindings/rng/starfive,jh7110-trng.yaml    |  55 +++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  10 +
 drivers/char/hw_random/Kconfig                |  11 +
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/jh7110-trng.c          | 393 ++++++++++++++++++
 6 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
 create mode 100644 drivers/char/hw_random/jh7110-trng.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
