Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99136C07CB1
	for <linux-riscv@archiver.kernel.org>; Wed, 29 Nov 2023 06:02:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TayMt3l9XSUq+HiNX8d3d38GKlDBw9i15ajDWEivzW4=; b=lkdu1TLDhx4oO7
	ATjLuvYlf2lyWo89D8cKvF2FtrBOzXSaSFIIPfzavAoT8evCDvsHV+vV6EPqjhk2uR06HBGxcxTF+
	ACFh6ZBsek4l8CDeGf6K6uqVa22h9iF3hBdWmrF9QEnDXU/AqWGbn2AflcmaePgPHNBloluGcj20V
	9zJjexXy71UoWdHexl+YWzF0xMSvnw1oFv8XXgOtKbmk1nOvdQctFJW8oq1YbCbGMnhLTVNWbSkFt
	Nci4AtZRYh7rSzDH9cHVRczV8doiynYQFNr/i1UqFv6RfofkMHJgNrUtgA9SpLgx2OXWAG8kUjZsb
	/T/+UVdq0wou5buxoiwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8De0-0078q2-14;
	Wed, 29 Nov 2023 06:01:56 +0000
Received: from ex01.ufhost.com ([61.152.239.75])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8Ddx-0078lU-2O
	for linux-riscv@lists.infradead.org;
	Wed, 29 Nov 2023 06:01:55 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by ex01.ufhost.com (Postfix) with ESMTP id 96CD724E2B0;
	Wed, 29 Nov 2023 14:00:59 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Wed, 29 Nov
 2023 14:00:59 +0800
Received: from jsia-virtual-machine.localdomain (60.54.3.230) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Wed, 29 Nov 2023 14:00:48 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <kernel@esmil.dk>, <robh+dt@kernel.org>,
	<krzysztof.kozlowski+dt@linaro.org>, <krzk@kernel.org>,
	<conor+dt@kernel.org>, <paul.walmsley@sifive.com>, <palmer@dabbelt.com>,
	<aou@eecs.berkeley.edu>, <daniel.lezcano@linaro.org>, <tglx@linutronix.de>,
	<conor@kernel.org>, <anup@brainfault.org>, <gregkh@linuxfoundation.org>,
	<jirislaby@kernel.org>, <michal.simek@amd.com>,
	<michael.zhu@starfivetech.com>, <drew@beagleboard.org>
CC: <devicetree@vger.kernel.org>, <linux-riscv@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <jeeheng.sia@starfivetech.com>,
	<leyfoon.tan@starfivetech.com>
Subject: [PATCH v2 0/6] Initial device tree support for StarFive JH8100 SoC
Date: Wed, 29 Nov 2023 14:00:37 +0800
Message-ID: <20231129060043.368874-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [60.54.3.230]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231128_220153_943129_0A23A04E 
X-CRM114-Status: GOOD (  13.80  )
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

StarFive JH8100 SoC consists of 4 RISC-V performance Cores (Dubhe-90) and
2 RISC-V energy efficient cores (Dubhe-80). It also features various
interfaces such as DDR4, Gbit-Ether, CAN, USB 3.2, SD/MMC, etc., making it
ideal for high-performance computing scenarios.

This patch series introduces initial SoC DTSI support for the StarFive
JH8100 SoC. The relevant dt-binding documentation has been updated
accordingly. Below is the list of IP blocks added in the initial SoC DTSI,
which can be used for booting via initramfs on FPGA:

- StarFive Dubhe-80 CPU
- StarFive Dubhe-90 CPU
- PLIC
- CLINT
- UART

The primary goal is to include foundational patches so that additional
drivers can be built on top of this framework.

Changes since v1:
- Dropped patch 5.
- Moved timebase-frequency from .dts to .dtsi.
- Moved soc node from .dts to .dtsi.
- Revised the title for the dt-binding document by removing Xilinx
  wording.
- Added a full stop to the end of the commit messages.
- Removed extra blank lines.
- Used hyphen for a node name.
- Added more recipients to the mailing list.

Sia Jee Heng (6):
  dt-bindings: riscv: Add StarFive Dubhe compatibles
  dt-bindings: riscv: Add StarFive JH8100 SoC
  dt-bindings: timer: Add StarFive JH8100 clint
  dt-bindings: interrupt-controller: Add StarFive JH8100 plic
  dt-bindings: serial: cdns: Add new compatible string for StarFive
    JH8100 UART
  riscv: dts: starfive: Add initial StarFive JH8100 device tree

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   2 +
 .../devicetree/bindings/riscv/starfive.yaml   |   5 +-
 .../devicetree/bindings/serial/cdns,uart.yaml |   4 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 arch/riscv/boot/dts/starfive/jh8100-evb.dts   |  28 ++
 arch/riscv/boot/dts/starfive/jh8100.dtsi      | 378 ++++++++++++++++++
 8 files changed, 419 insertions(+), 1 deletion(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi


base-commit: 18d46e76d7c2eedd8577fae67e3f1d4db25018b0
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
