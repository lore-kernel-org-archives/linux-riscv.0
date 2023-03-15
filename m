Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E555C61DA4
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 10:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=IJEqCmrp0OTOdN95wMHV0zPhk4bbViwY+zoFaeT0GYE=; b=naAPcUJ2kpXD9P
	jRMtm97PqcvlSYN2nQb0N7txaFbP7lLhnQSjeSrawMzlt7AwEclNF7pLKkWC40hif+9r0kahuUoR5
	1ABE3+ZAJhwHPfzf+h8FxjQZ6QymlBSVqdL98fS/sHjVODS3nSKlKWHl8xyetasGoPPZJcCxVWFia
	ncJfcgRqm8LTZ3tTcbApLwxxWF9/Scwm6nOkKwd84oSCs/kIFFCga8Yq+vJT4yRlntD99xwC8vKzu
	0gqqQDFutgyhDkljJOoO9s4dcp45NMJl0OYIVd+rw7k6K9So+RnBVudsaofSbu05RCuWOF7001G5T
	9WiEi3xNm3sXZRey51vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO0G-00D0l8-2C;
	Wed, 15 Mar 2023 10:05:04 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcO0B-00D0iG-2m;
	Wed, 15 Mar 2023 10:05:02 +0000
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 90D8824E392;
	Wed, 15 Mar 2023 18:04:25 +0800 (CST)
Received: from EXMBX162.cuchost.com (172.16.6.72) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 18:04:25 +0800
Received: from ubuntu.localdomain (113.72.145.194) by EXMBX162.cuchost.com
 (172.16.6.72) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 18:04:24 +0800
From: Changhuang Liang <changhuang.liang@starfivetech.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Emil Renner Berthing <kernel@esmil.dk>,
	Conor Dooley <conor@kernel.org>, Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
	Philipp Zabel <p.zabel@pengutronix.de>
CC: Jack Zhu <jack.zhu@starfivetech.com>, Changhuang Liang
	<changhuang.liang@starfivetech.com>, <linux-phy@lists.infradead.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-riscv@lists.infradead.org>
Subject: [PATCH v3 0/3] Add JH7110 MIPI DPHY RX support
Date: Wed, 15 Mar 2023 03:04:18 -0700
Message-ID: <20230315100421.133428-1-changhuang.liang@starfivetech.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [113.72.145.194]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX162.cuchost.com
 (172.16.6.72)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230315_030500_212597_EF371C9B 
X-CRM114-Status: GOOD (  12.97  )
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

This patchset adds mipi dphy rx driver for the StarFive JH7110 SoC.
It is used to transfer CSI camera data. The series has been tested on
the VisionFive 2 board.

This patchset should be applied after the patchset [1] [2]:
[1] https://lore.kernel.org/all/20230314124404.117592-1-xingyu.wu@starfivetech.com/
[2] https://lore.kernel.org/all/20230315055813.94740-1-william.qiu@starfivetech.com/

changes since v2:
- Rebased on tag v6.3-rc1.

patch 1:
- Changed the 'Starfive' to 'StarFive'.
- Changed the "items" to "- items".
- Add description to clocks.

patch 2:
- Changed the 'Starfive' to 'StarFive'.
- Updated the driver order in MAINTAINERS.

patch 3:
- Changed the 'Starfive' to 'StarFive'.
- Update clocks&resets macros follow patchset [1].

v2: https://lore.kernel.org/all/20230223015952.201841-1-changhuang.liang@starfivetech.com/

changes since v1:
- Rebased on tag v6.2.
- Dropped patch 1, it will be added by the patch [2].

patch 1:
- Changed the node name 'dphy' to 'phy'.
- Changed the "starfive,aon-syscon" description.
- Changed the MIPI DPHY RX IP description.
- Add description to resets.
- Update devicetree binding examples.

patch 2:
- Changed the commit message.

patch 3:
- Changed the commit message.
- Changed the node name 'dphy' to 'phy'.
- Sorted the node by address.

v1: https://lore.kernel.org/all/20230210061713.6449-1-changhuang.liang@starfivetech.com/

Changhuang Liang (3):
  dt-bindings: phy: Add starfive,jh7110-dphy-rx
  phy: starfive: Add mipi dphy rx support
  riscv: dts: starfive: Add dphy rx node

 .../bindings/phy/starfive,jh7110-dphy-rx.yaml |  77 ++++
 MAINTAINERS                                   |   7 +
 arch/riscv/boot/dts/starfive/jh7110.dtsi      |  13 +
 drivers/phy/Kconfig                           |   1 +
 drivers/phy/Makefile                          |   1 +
 drivers/phy/starfive/Kconfig                  |  13 +
 drivers/phy/starfive/Makefile                 |   2 +
 drivers/phy/starfive/phy-starfive-dphy-rx.c   | 362 ++++++++++++++++++
 8 files changed, 476 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/phy/starfive,jh7110-dphy-rx.yaml
 create mode 100644 drivers/phy/starfive/Kconfig
 create mode 100644 drivers/phy/starfive/Makefile
 create mode 100644 drivers/phy/starfive/phy-starfive-dphy-rx.c


base-commit: fe15c26ee26efa11741a7b632e9f23b01aca4cc6
prerequisite-patch-id: c3a6b87df79b338fc97766406d010fedb79ab428
prerequisite-patch-id: 761b5c9adb87cbf1abc3bc113a24bd505961efbe
prerequisite-patch-id: ebaead89601acf604e83224f4df8d57a7f4331b8
prerequisite-patch-id: 609d5d7c55b0b8e2967966673dab8f62a6fceab9
prerequisite-patch-id: ac150a8c622e858e088df8121093d448df49c245
prerequisite-patch-id: a4255724d4698f1238663443024de56de38d717b
prerequisite-patch-id: 89f049f951e5acf75aab92541992f816fd0acc0d
prerequisite-patch-id: dfb8d5a1fb262127d7a8e1ef3e97f455aaa19509
prerequisite-patch-id: 11b0f5746bbfbf8aa5c5746dcd7b0dce62e7f922
prerequisite-patch-id: 315303931e4b6499de7127a88113763f86e97e16
prerequisite-patch-id: 40cb8212ddb024c20593f73d8b87d9894877e172
prerequisite-patch-id: a1673a9e9f19d6fab5a51abb721e54e36636f067
prerequisite-patch-id: 189a0f41ba4eecd4f3f35c503baac8aed8ccd7de
prerequisite-patch-id: 1117ecaa40a353c667b71802ab34ecf9568d8bb2
prerequisite-patch-id: 25923a0c77e92631ed3cd8a163d789daad35f0f8
prerequisite-patch-id: 6a6f6215f09932e68fdfd294df2e813ec9d2481f
prerequisite-patch-id: 2cc95b47cad25fd9b875d27f4e8e3d84eb70274b
prerequisite-patch-id: 258ea5f9b8bf41b6981345dcc81795f25865d38f
prerequisite-patch-id: 8b6f2c9660c0ac0ee4e73e4c21aca8e6b75e81b9
prerequisite-patch-id: dbb0c0151b8bdf093e6ce79fd2fe3f60791a6e0b
prerequisite-patch-id: e7773c977a7b37692e9792b21cc4f17fa58f9215
prerequisite-patch-id: d57e95d31686772abc4c4d5aa1cadc344dc293cd
prerequisite-patch-id: 0a0ac5a8a90655b415f6b62e324f3db083cdaaee
prerequisite-patch-id: 2ddada18ab6ea5cd1da14212aaf59632f5203d40
prerequisite-patch-id: 8c735dffc6d5388a35a76b16e914a2f9722ad979
prerequisite-patch-id: be3d7a6a13098884ec26cd5e543cc95c39045e35
prerequisite-patch-id: 94259179ed334d305ae364288bb6f0d67d8e4f9f
prerequisite-patch-id: cd96f85fbc377fc68139b77755bb880db6794bd0
prerequisite-patch-id: 9da71dcd3af4c68da9d855b43aab6927103e7525
prerequisite-patch-id: 7a42f7bdd55d73ba0a4c15b1150335a9c33dfc58
prerequisite-patch-id: 81f7c65712c4901a7a178ddcd98ffc55f3b473ff
prerequisite-patch-id: cd0b464336aabfbfad96c1a3595c0f9ce9401638
prerequisite-patch-id: 3a86c55eb713c5453650ed851a588360be87971f
prerequisite-patch-id: d5abfba63fc07ff97b5023911513c260bb7a53e1
prerequisite-patch-id: b37ac15032973e1fcd918f157c82a0606775c9e9
prerequisite-patch-id: 2ffbced093555055b5796c0c0572b3b0216f8938
prerequisite-patch-id: ca653566085079839fb3dc1e722effafbc8109a4
--
2.25.1

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
