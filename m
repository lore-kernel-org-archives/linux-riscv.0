Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E761FC07CB1
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Nov 2023 01:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wL66w8Jntn3TKE0cEnwlX7ZlJAQHz65TCUB+qWiXOV0=; b=RwKFaIZQzccv37
	HLEFyY6wRvFNjKcL0z4MrHSa0tW6bvSuaf8JIcPgpcL7aj2sMdvfD9d7A/T87TPtQqUVce58iWnGj
	kh7D+wdFUvDeqb9pBPoz9O4+hIe66KcE0LbVaCaRHzKDQYks+Y19G4JjZA2pdJS8Ty6nLgcpSF+lQ
	Q6RkYcq5IMrwdp1JEzegLMroYPS9yzPZFSK6RiD4kcMXtjUtFqDvwH1T/rxMkSd3BQUfd3DQdMOyW
	lLQpTO3fUNvSH0Mekjyp1XpOhZtjV4rwIFm3DL7HwPJ51FvRmrJ8CBfcgYy9GkAyaz2qnojUIpwLw
	08IP3LHTnSJ9N+39ukqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QYe-000Ijl-1S;
	Mon, 27 Nov 2023 01:37:08 +0000
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r7QYZ-000IHh-2f
	for linux-riscv@lists.infradead.org;
	Mon, 27 Nov 2023 01:37:05 +0000
Received: from EXMBX165.cuchost.com (unknown [175.102.18.54])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(Client CN "EXMBX165", Issuer "EXMBX165" (not verified))
	by fd01.gateway.ufhost.com (Postfix) with ESMTP id 06E9624DBF3;
	Mon, 27 Nov 2023 09:36:11 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX165.cuchost.com
 (172.16.6.75) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Mon, 27 Nov
 2023 09:36:10 +0800
Received: from jsia-virtual-machine.localdomain (202.188.176.82) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Mon, 27 Nov 2023 09:36:06 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <paul.walmsley@sifive.com>, <palmer@dabbelt.com>, <aou@eecs.berkeley.edu>,
	<conor@kernel.org>, <kernel@esmil.dk>, <robh+dt@kernel.org>,
	<emil.renner.berthing@canonical.com>
CC: <linux-riscv@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<jeeheng.sia@starfivetech.com>, <leyfoon.tan@starfivetech.com>
Subject: [PATCH 0/7] Initial device tree support for StarFive JH8100 SoC
Date: Mon, 27 Nov 2023 09:35:55 +0800
Message-ID: <20231127013602.253835-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [202.188.176.82]
X-ClientProxiedBy: EXCAS066.cuchost.com (172.16.6.26) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231126_173704_034497_B185BB96 
X-CRM114-Status: GOOD (  12.12  )
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

Sia Jee Heng (7):
  dt-bindings: riscv: Add StarFive Dubhe compatibles
  dt-bindings: riscv: Add StarFive JH8100 SoC
  dt-bindings: timer: Add StarFive JH8100 clint
  dt-bindings: interrupt-controller: Add StarFive JH8100 plic
  dt-bindings: xilinx: Add StarFive compatible string
  serial: xilinx_uartps: Add new compatible string for StarFive
  riscv: dts: starfive: Add initial StarFive JH8100 device tree

 .../sifive,plic-1.0.0.yaml                    |   1 +
 .../devicetree/bindings/riscv/cpus.yaml       |   2 +
 .../devicetree/bindings/riscv/starfive.yaml   |   5 +-
 .../devicetree/bindings/serial/cdns,uart.yaml |   3 +
 .../bindings/timer/sifive,clint.yaml          |   1 +
 arch/riscv/boot/dts/starfive/Makefile         |   1 +
 arch/riscv/boot/dts/starfive/jh8100-evb.dts   |  42 ++
 arch/riscv/boot/dts/starfive/jh8100.dtsi      | 365 ++++++++++++++++++
 drivers/tty/serial/xilinx_uartps.c            |   3 +-
 9 files changed, 421 insertions(+), 2 deletions(-)
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100-evb.dts
 create mode 100644 arch/riscv/boot/dts/starfive/jh8100.dtsi


base-commit: d2da77f431ac49b5763b88751a75f70daa46296c
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
