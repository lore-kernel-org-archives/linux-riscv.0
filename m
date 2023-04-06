Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E612C76196
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 10:33:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=uhYJgT8BDR1SJYQn7Pv9V9ljltEHdTGNskYiLFyivMI=; b=u2sfvWwd6q2sR3
	IvuEIEiCefEHlG31FCsKtA9DKfljiNpG1+M2zZBJmoVL4O1qYBcz3dzBsQkM7A+/f2BWSJDkQR6+5
	pSjz84YUEDuUToV3CuMN8NFihVn3oZY0m0UJgJ/6ESdfxvRH26lTwMoKcEwODttgG4/IgzK9Kx0lz
	wKwTv51XN2icQT77AdLMZ6Kcj7oB4OsAroCzta/z74T4PEXNKEPInDF67fbWFZyvE55F5Ip2BQfVT
	Pg0tIj1ALXJhzLavb+JYi1GjLFESkGEGN4o0SB/a7lC0G+jz7th1djpLsgNynwcYOuYW77kr0tnzY
	C3uXTJWUm4cmVWcnJWOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMw9-0073Wn-2F;
	Thu, 06 Apr 2023 10:33:49 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMw3-0073IH-2w
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 10:33:46 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id A7D9224E27D;
	Thu,  6 Apr 2023 18:33:14 +0800 (CST)
Received: from EXMBX168.cuchost.com (172.16.6.78) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 6 Apr
 2023 18:33:14 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX168.cuchost.com (172.16.6.78) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 6 Apr 2023 18:33:13 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [PATCH v7 0/2] StarFive's SYSCON support
Date: Thu, 6 Apr 2023 18:33:06 +0800
Message-ID: <20230406103308.1280860-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS064.cuchost.com (172.16.6.24) To EXMBX168.cuchost.com
 (172.16.6.78)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_033344_105058_84B5AC68 
X-CRM114-Status: GOOD (  12.60  )
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
designware mobile storage host controller driver. And this driver will
be used in StarFive's VisionFive 2 board. The main purpose of adding
this driver is to accommodate the ultra-high speed mode of eMMC.

The last patch should be applied after the patchset [1]:
[1] https://lore.kernel.org/all/20230401111934.130844-1-hal.feng@starfivetech.com/

Changes v5->v6:
- Rebased to 6.3-rc3.
- Modified compatible's property.
- Added clock-controller and power-controller node.

Changes v5->v6:
- Rebased to 6.3-rc1.
- Changed file name to starfive,jh7110.yaml.
- Modified commit description.
- Added syscon node dts patch to other dependent modules.

Changes v4->v5:
- Added a incremental updates to fix a bug that prev_err is uninitialized.
- Dropped the merged patches.
- Dropped the dts patch.
- Sorted compatible alphabetically in yaml.

Changes v3->v4:
- Added documentation to describe StarFive System Controller Registers.
- Added aon_syscon and stg_syscon node.
- Fixed some checkpatch errors/warnings.

Changes v2->v3:
- Wraped commit message according to Linux coding style.
- Rephrased the description of the patches.
- Changed the description of syscon regsiter.
- Dropped redundant properties.

Changes v1->v2:
- Renamed the dt-binding 'starfive,jh7110-sdio.yaml' to 'starfive,jh7110-mmc.yaml'.
- Changed the type of 'starfive,syscon' and modify its description.
- Deleted unused head files like '#include <linux/gpio.h>'.
- Added comment for the 'rise_point' and 'fall_point'.
- Changed the API 'num_caps' to 'common_caps'.
- Changed the node name 'sys_syscon' to 'syscon'.
- Changed the node name 'sdio' to 'mmc'.

The patch series is based on v6.3.

William Qiu (2):
  dt-bindings: soc: starfive: Add StarFive syscon doc
  riscv: dts: starfive: jh7110: Add syscon nodes

 .../soc/starfive/starfive,jh7110-syscon.yaml  | 56 +++++++++++++++++++
 MAINTAINERS                                   |  5 ++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 15 +++++
 3 files changed, 76 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
