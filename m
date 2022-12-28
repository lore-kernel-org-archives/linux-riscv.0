Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 146C9C4332F
	for <linux-riscv@archiver.kernel.org>; Wed, 28 Dec 2022 07:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=3+/wUU+TIhnA21YKdJaCsKTahVA8ap/xpUsqrFJkKOk=; b=r2CKgIK0OWrW3y
	icJgLS7gavcYyXxhJJd6Wz3AAoC8AtAYUgMxRvmUG4rll5eXr1nB3T8f4E+biNiO68OmFVBJCOag1
	C7LURHeL/LrcIiYrFcBwPRaQvJRcTWA2RoP+VGRBnJLlaJG3Vs/k8YWrfhasp5eMItFmAl6oTPdUu
	3+plDJPYT3ZhP82dAeyyKV5epOpI8HLQzFwOs5iH3GmaWlaR23huK029e4To147SEvedAfYlXUFtN
	IF3KF6gHCWzk6GUI+qMn026uubLpAb1JlwtZnoftQZINmOTAJ7W5hm+EO0d3LVDbfj7BrpibinNxt
	l3EOewXnAebyYngAKGXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQbg-002e18-BC; Wed, 28 Dec 2022 07:12:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1pAQbY-002dhQ-JG
	for linux-riscv@lists.infradead.org; Wed, 28 Dec 2022 07:12:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 4828E24DF02;
	Wed, 28 Dec 2022 15:11:14 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 15:11:14 +0800
Received: from ubuntu.localdomain (161.142.229.243) by EXMBX168.cuchost.com
 (172.16.6.78) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 28 Dec
 2022 15:11:07 +0800
From: Jia Jie Ho <jiajie.ho@starfivetech.com>
To: Olivia Mackall <olivia@selenic.com>, Herbert Xu
	<herbert@gondor.apana.org.au>, Rob Herring <robh+dt@kernel.org>, "Krzysztof
 Kozlowski" <krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing
	<kernel@esmil.dk>, Conor Dooley <conor.dooley@microchip.com>
CC: <linux-crypto@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-riscv@lists.infradead.org>
Subject: [PATCH v2 0/3] hwrng: starfive - Add driver for TRNG module
Date: Wed, 28 Dec 2022 15:11:00 +0800
Message-ID: <20221228071103.91797-1-jiajie.ho@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [161.142.229.243]
X-ClientProxiedBy: EXCAS061.cuchost.com (172.16.6.21) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221227_231200_848902_9768483B 
X-CRM114-Status: UNSURE (   9.95  )
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

This patch series adds kernel support for StarFive hardware random
number generator. First 2 patches add bindings documentation and driver
for this module. Patch 3 adds devicetree entry for VisionFive v2 SoC.

Patch 3 needs to be applied on top of:
https://patchwork.kernel.org/project/linux-riscv/patch/20221220011247.35560-7-hal.feng@starfivetech.com/

Changes since v1:
- updated of_match_ptr and added pm_sleep_ptr in Patch 2. (by Krzysztof)
- drop "status" in dts as module is always on in Patch 3. (by Krzysztof)

Jia Jie Ho (3):
  dt-bindings: rng: Add StarFive TRNG module
  hwrng: starfive - Add TRNG driver for StarFive SoC
  riscv: dts: starfive: Add TRNG node for VisionFive 2

 .../bindings/rng/starfive,jh7110-trng.yaml    |  55 +++
 MAINTAINERS                                   |   6 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  10 +
 drivers/char/hw_random/Kconfig                |  11 +
 drivers/char/hw_random/Makefile               |   1 +
 drivers/char/hw_random/starfive-trng.c        | 388 ++++++++++++++++++
 6 files changed, 471 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/rng/starfive,jh7110-trng.yaml
 create mode 100644 drivers/char/hw_random/starfive-trng.c

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
