Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD12C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 01:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ZII+AZljTjcaB0zH1PhMGkXvXUqtiMy/O2on1PjIklM=; b=GXKkgKEYa6oqQ/
	xbA6QR65Coz2Tz7jTYHyqmYKfCOjNkPPf/CmBMliP8ZnUan2KiYt7vX0lDI2bx0eTqHzrCytaD3en
	8v1jAnrhWBHGJ1EoTwQQeoz12bvbG0hlN9AA1EYdZJ0dp0/riiBMyGXQdpqktAvDei+s5d7M+GRoc
	At1oOlyaJwReisIdWAfW5tG4Sl8MNaXLqeqrph+dTDYpYMqP/1lfhlf3fxqVziTbnZKSV1wBYMhHP
	MeKgsHvX8GOffZ4CLcqiAx6esvp6BmjvF0Cs8qS4bI697sMRJNPKacYq/W6Khjk9RExyY1lTW0L58
	+V7XPyp00qHFDaejacAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpuh-0018q2-LK; Fri, 18 Nov 2022 01:11:27 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovpud-0018ob-Am
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 01:11:25 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 5301224E1D3;
	Fri, 18 Nov 2022 09:11:11 +0800 (CST)
Received: from EXMBX072.cuchost.com (172.16.6.82) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:11:11 +0800
Received: from ubuntu.localdomain (183.27.96.116) by EXMBX072.cuchost.com
 (172.16.6.82) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Fri, 18 Nov
 2022 09:11:10 +0800
From: Hal Feng <hal.feng@starfivetech.com>
To: <linux-riscv@lists.infradead.org>, <devicetree@vger.kernel.org>,
	<linux-gpio@vger.kernel.org>
CC: Conor Dooley <conor@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, "Rob
 Herring" <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Linus Walleij
	<linus.walleij@linaro.org>, Emil Renner Berthing
	<emil.renner.berthing@canonical.com>, Hal Feng <hal.feng@starfivetech.com>,
	Jianlong Huang <jianlong.huang@starfivetech.com>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH v2 0/5] Basic pinctrl support for StarFive JH7110 RISC-V SoC
Date: Fri, 18 Nov 2022 09:11:03 +0800
Message-ID: <20221118011108.70715-1-hal.feng@starfivetech.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Originating-IP: [183.27.96.116]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX072.cuchost.com
 (172.16.6.82)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_171123_700941_CCC740E3 
X-CRM114-Status: GOOD (  14.22  )
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

The original patch series "Basic StarFive JH7110 RISC-V SoC support" [1]
is split into 3 patch series. They respectively add basic clock&reset,
pinctrl and device tree support for StarFive JH7110 SoC. These patch
series are independent, but the Visionfive2 board can boot up successfully
only if all these patches series applied. This one adds basic pinctrl
support. This patch series is pulled out from the patch 22~26 of v1 [1].
You can simply get or review the patches at the link [2].

[1]: https://lore.kernel.org/all/20220929143225.17907-1-hal.feng@linux.starfivetech.com/
[2]: https://github.com/hal-feng/linux/commits/visionfive2-minimal

Changes since v1:
- Rebased on tag v6.1-rc5.
- Dropped patch 22 and 23 since they were merged in v6.1-rc1.
- Removed some unused macros and register values which do not belong to
  bindings. Simplified pinctrl definitions in patch 24. (by Krzysztof)
- Split the bindings into sys pinctrl bindings and aon pinctrl bindings,
  and split patch 25 into two patches.
- Made the bindings follow generic pinctrl bindings. (by Krzysztof)
- Fixed some wrong indentation in bindings, and checked it with
  `make dt_binding_check`.
- Split the patch 26 into two patches which added sys and aon pinctrl
  driver respectively.
- Restructured the pinctrl drivers so made them follow generic pinctrl
  bindings. Rewrote `dt_node_to_map` and extracted the public code to make
  it clearer.

  v1: https://lore.kernel.org/all/20220929143225.17907-1-hal.feng@linux.starfivetech.com/

Jianlong Huang (5):
  dt-bindings: pinctrl: Add StarFive JH7110 pinctrl definitions
  dt-bindings: pinctrl: Add StarFive JH7110 sys pinctrl
  dt-bindings: pinctrl: Add StarFive JH7110 aon pinctrl
  pinctrl: starfive: Add StarFive JH7110 sys controller driver
  pinctrl: starfive: Add StarFive JH7110 aon controller driver

 .../pinctrl/starfive,jh7110-aon-pinctrl.yaml  | 134 +++
 .../pinctrl/starfive,jh7110-sys-pinctrl.yaml  | 165 +++
 MAINTAINERS                                   |   7 +-
 drivers/pinctrl/starfive/Kconfig              |  21 +
 drivers/pinctrl/starfive/Makefile             |   5 +
 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c | 192 ++++
 drivers/pinctrl/starfive/pinctrl-jh7110-sys.c | 464 +++++++++
 drivers/pinctrl/starfive/pinctrl-starfive.c   | 972 ++++++++++++++++++
 drivers/pinctrl/starfive/pinctrl-starfive.h   |  72 ++
 .../pinctrl/pinctrl-starfive-jh7110.h         | 427 ++++++++
 10 files changed, 2456 insertions(+), 3 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-aon-pinctrl.yaml
 create mode 100644 Documentation/devicetree/bindings/pinctrl/starfive,jh7110-sys-pinctrl.yaml
 create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-aon.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-jh7110-sys.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive.c
 create mode 100644 drivers/pinctrl/starfive/pinctrl-starfive.h
 create mode 100644 include/dt-bindings/pinctrl/pinctrl-starfive-jh7110.h


base-commit: 094226ad94f471a9f19e8f8e7140a09c2625abaa
prerequisite-patch-id: 6b1b43a55b9773bec61ab6c1bbaa54dccbac0837
prerequisite-patch-id: 09c98554df52d17ba5fd604125f8cdd62cbe80d1
prerequisite-patch-id: 29fe0b0c19b6f0cd31114ee9fe17fe9732047f33
prerequisite-patch-id: c59d9908de90e09ba2b9a81aadbf9fb9f00c8f04
prerequisite-patch-id: 94ac03d518993921bcfc9cc9f58d7da0c3528b51
prerequisite-patch-id: 694f7400375f5b85581fc1821e427334507826f2
prerequisite-patch-id: 699d49c4439dadb4b7cf900857f027d050cd6093
prerequisite-patch-id: 40d773f5a19912f731ee5fd4739ed2e3c2157b07
prerequisite-patch-id: 2bc3fd6df5dda116efe882045863d6c88aa81b3a
prerequisite-patch-id: 735e62255c75801bdc4c0b4107850bce821ff7f5
prerequisite-patch-id: b2a923b922e661fa6085185f33c1f1e733db9110
prerequisite-patch-id: b2bbc28354075432f059344eba5a127a653475cf
prerequisite-patch-id: 70eab7b7eee728afcd90e40f6743d1356f6d81ab
prerequisite-patch-id: 6276b2a23818c65ff2ad3d65b562615690cffee9
-- 
2.38.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
