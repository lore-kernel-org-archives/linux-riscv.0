Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BA5FC7618D
	for <linux-riscv@archiver.kernel.org>; Wed, 15 Mar 2023 05:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=YGMrvNTk0joXToBGE+u9/26i6q7Wc6iQ4fQZMcZIoZ0=; b=sy05LEYbYj6pYK
	9zW6rPdApg5aVxxdhgbkMZxb3wxNSLs5RNlIk1PBNPvLgK/OD/Zc220sAoz+KOt9oH3oSu2x9sFAL
	RfUoV9rAVe3HfTscuaHKYuhWUXuri8O5CgnuZ1AtJG1x2Q53aIpaLvayxzFLpRAnzhpoNF9GjmkZd
	CzkLB7TKB6A/2Pzz5thoslQ2qyOfQMYTsnGEC8rCxVVcaCZCYczoI65eGUz35F68+gByu1vqGbYWa
	X1gMU7FNqrnT+g5Vr6yp3q6skaLrGGTJYDyOHJTD+rdAM8w5K1D6oRu8Or30/ILZVs9Ul3BCl3BEx
	sxjCZQody260L8Zbn8Cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcKA3-00CTEC-2L;
	Wed, 15 Mar 2023 05:58:55 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pcK9x-00CT8j-0R
	for linux-riscv@lists.infradead.org;
	Wed, 15 Mar 2023 05:58:53 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id EC1C124E0B4;
	Wed, 15 Mar 2023 13:58:14 +0800 (CST)
Received: from EXMBX068.cuchost.com (172.16.6.68) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 15 Mar
 2023 13:58:14 +0800
Received: from williamqiu-virtual-machine.starfivetech.com (171.223.208.138)
 by EXMBX068.cuchost.com (172.16.6.68) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 15 Mar 2023 13:58:13 +0800
From: William Qiu <william.qiu@starfivetech.com>
To: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>
CC: Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
	<krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor@kernel.org>, "Emil
 Renner Berthing" <kernel@esmil.dk>, William Qiu
	<william.qiu@starfivetech.com>
Subject: [RESEND v6 0/2] StarFive's SDIO/eMMC driver support
Date: Wed, 15 Mar 2023 13:58:11 +0800
Message-ID: <20230315055813.94740-1-william.qiu@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [171.223.208.138]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX068.cuchost.com
 (172.16.6.68)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230314_225849_496657_9D8D5EA8 
X-CRM114-Status: GOOD (  12.66  )
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
[1] https://lore.kernel.org/all/20221118011714.70877-1-hal.feng@starfivetech.com/

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
  riscv: dts: starfive: Add syscon node

 .../soc/starfive/starfive,jh7110-syscon.yaml  | 41 +++++++++++++++++++
 MAINTAINERS                                   |  5 +++
 arch/riscv/boot/dts/starfive/jh7110.dtsi      | 15 +++++++
 3 files changed, 61 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-syscon.yaml

--
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
