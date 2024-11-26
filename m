Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DEDC5D3B995
	for <linux-riscv@archiver.kernel.org>; Tue, 26 Nov 2024 14:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LYzlUIFFfO/NLGFZQneNBO9sRsKYcJKCYUIninqYEdk=; b=2iTMa4yLedp/bj
	Yt2Z43hTXdShaLI/p9ypDCDSM0sdmErTFFfombVbxel2HLGFWVmhKPFgcW3nLF7QPxEh8eXWHe3z6
	ekTWrjyIal2Cn/LD0Y/BWtTAjjD04jnl0QhY2jAfb7/F8gkMfNRUYsHjA/oiWCwLyi7H+O2WkH8y4
	DUBphyQlBcmFqLEUw7sjKnpX8TekolAgxPFLhwOGyAi6eruMW7QRtUGCiB1yaJHMvjoFvwc785wdb
	lO+uSxxT+LwBHNGO8mUW7FKfCjmpsIw+dy7YgRnrmeT1R+T+oPorK/8GKjBYl401/rqChNzpyXvd8
	aujDpHhFthmGQ/1IrJPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwbs-0000000As1r-2nys;
	Tue, 26 Nov 2024 14:32:12 +0000
Received: from bayard.4d2.org ([5.78.89.93])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tFwbp-0000000As1V-1Bll
	for linux-riscv@lists.infradead.org;
	Tue, 26 Nov 2024 14:32:10 +0000
Received: from bayard.4d2.org (bayard.4d2.org [127.0.0.1])
	by bayard.4d2.org (Postfix) with ESMTP id B96E7122FE26;
	Tue, 26 Nov 2024 06:32:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732631524; bh=ufwLq/hepWd8Zhi0T5Z2rKCIOMMzX59F6ACCSuFg6Tk=;
	h=From:To:Cc:Subject:Date:From;
	b=LqOIXcsxLuQzPlvURJwIGw2l9ZVHof1hoiav6amj7EfC3z9IeH/L/O1KYlo2cTwoZ
	 1TW9VBPq4IDf9kOiMlsXb1XmZxTestIonui53VH0GkyduYDg1SU4CWkxDQHmSyqNah
	 JRUL/t6N+JqSk+omcghnN/QzdZpBxnZE8yu6hSL1cDhqREPsXmzhpD3ICzY3zjOBh+
	 B1urE+kxq2lpJgjiO+uvD1JsyxdvzitiiOrNWhmdEQ3PPSuQb8/oHN/hUbVOLW+DFX
	 3GQL6WybLX4lQBmtCLwODkFDzCy23QEot/nhqTw1BT39QrRrxuWPdZbcpZcjUxCN7G
	 BvkF/TIgwGljA==
X-Virus-Scanned: amavisd-new at 4d2.org
Authentication-Results: bayard.4d2.org (amavisd-new); dkim=pass (2048-bit key)
 header.d=4d2.org
Received: from bayard.4d2.org ([127.0.0.1])
 by bayard.4d2.org (bayard.4d2.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1K28dH7PxUPH; Tue, 26 Nov 2024 06:31:59 -0800 (PST)
Received: from localhost.localdomain (unknown [119.39.112.187])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: heylenay@4d2.org)
	by bayard.4d2.org (Postfix) with ESMTPSA id 20610122FE1A;
	Tue, 26 Nov 2024 06:31:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=4d2.org; s=mail;
	t=1732631519; bh=ufwLq/hepWd8Zhi0T5Z2rKCIOMMzX59F6ACCSuFg6Tk=;
	h=From:To:Cc:Subject:Date:From;
	b=JLb0ZdQ2sbAxuzHfsd4408ZeCj8kDWn0aXxXxL5Xz01HXKbhHMGg/uXmzC7IvO4JI
	 k1KbBhLo+7Tryn3PgeRArgnpWQ+bk/G0XaaZAApcQlK0vcDT16FycfXmVLiofKH0Dh
	 jLo6QF0trfZrjWouK9MqGa8/a2pinB0hNT+lOnpG9k+bHE4oA1O1xiUAXbtpbQweyg
	 zkiEgf+n2T0WzGfrtIs6FtB4xLrYzBX19VVEqeMnlHTU87wj0s99BOxpihRK9zdGZB
	 pAL1SAu1b75fQgvVkPn6h5JYV3oyzKUwFz7QcSTC0nygXQpIqNNAkxjA1Z2ZxF7XvG
	 Og17MlFdEH/Zg==
From: Haylen Chu <heylenay@4d2.org>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Haylen Chu <heylenay@outlook.com>
Cc: linux-riscv@lists.infradead.org,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Inochi Amaoto <inochiama@outlook.com>,
	Chen Wang <unicornxdotw@foxmail.com>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@4d2.org>
Subject: [PATCH v3 0/3] Add clock controller support for Spacemit K1
Date: Tue, 26 Nov 2024 14:31:23 +0000
Message-ID: <20241126143125.9980-2-heylenay@4d2.org>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241126_063209_655169_6C101F54 
X-CRM114-Status: GOOD (  12.31  )
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

The clock tree of Spacemit K1 is managed by several independent
controllers in different SoC parts. In this series, all clock hardwares
in APBS, MPMU, APBC and APMU, are implemented. With some changes to UART
driver, CPU cores and UARTs could be brought up (see below). More clocks
will be implemented later soon.

No device tree changes are included since Spacemit K1 UART needs two
clocks to operate, but for now the driver gets only one. I would like to
defer the changes until this is resolved.

This driver has been tested on BananaPi-F3 board and successfully
brought up I2C, RTC, mmc and ethernet controllers. A clock tree dump
could be obtained here[1].

[1]: https://gist.github.com/heylenayy/ebc6316692dd3aff56575dbf0eb4f1a9

Link: https://developer.spacemit.com/documentation?token=LCrKwWDasiJuROkVNusc2pWTnEb

Changed from v2
- dt-binding fixes
- misc improvements in code
- drop unnecessary spinlock in the driver
- implement missing bus clocks
- Link to v2: https://lore.kernel.org/all/SEYPR01MB4221829A2CD4D4C1704BABD7D7602@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Changed from v1
- add SoC prefix (k1)
- relicense dt-binding header
- misc fixes and style improvements for dt-binding
- document spacemit,k1-syscon
- implement all APBS, MPMU, APBC and APMU clocks
- code cleanup
- Link to v1: https://lore.kernel.org/all/SEYPR01MB4221B3178F5233EAB5149E41D7902@SEYPR01MB4221.apcprd01.prod.exchangelabs.com/

Haylen Chu (3):
  dt-bindings: clock: spacemit: Add clock controllers of Spacemit K1 SoC
  dt-bindings: soc: spacemit: Add spacemit,k1-syscon
  clk: spacemit: Add clock support for Spacemit K1 SoC

 .../bindings/clock/spacemit,k1-ccu.yaml       |   57 +
 .../soc/spacemit/spacemit,k1-syscon.yaml      |   86 +
 drivers/clk/Kconfig                           |    1 +
 drivers/clk/Makefile                          |    1 +
 drivers/clk/spacemit/Kconfig                  |   20 +
 drivers/clk/spacemit/Makefile                 |    5 +
 drivers/clk/spacemit/ccu-k1.c                 | 1747 +++++++++++++++++
 drivers/clk/spacemit/ccu_common.h             |   62 +
 drivers/clk/spacemit/ccu_ddn.c                |  146 ++
 drivers/clk/spacemit/ccu_ddn.h                |   85 +
 drivers/clk/spacemit/ccu_mix.c                |  296 +++
 drivers/clk/spacemit/ccu_mix.h                |  336 ++++
 drivers/clk/spacemit/ccu_pll.c                |  198 ++
 drivers/clk/spacemit/ccu_pll.h                |   80 +
 include/dt-bindings/clock/spacemit,k1-ccu.h   |  246 +++
 15 files changed, 3366 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/clock/spacemit,k1-ccu.yaml
 create mode 100644 Documentation/devicetree/bindings/soc/spacemit/spacemit,k1-syscon.yaml
 create mode 100644 drivers/clk/spacemit/Kconfig
 create mode 100644 drivers/clk/spacemit/Makefile
 create mode 100644 drivers/clk/spacemit/ccu-k1.c
 create mode 100644 drivers/clk/spacemit/ccu_common.h
 create mode 100644 drivers/clk/spacemit/ccu_ddn.c
 create mode 100644 drivers/clk/spacemit/ccu_ddn.h
 create mode 100644 drivers/clk/spacemit/ccu_mix.c
 create mode 100644 drivers/clk/spacemit/ccu_mix.h
 create mode 100644 drivers/clk/spacemit/ccu_pll.c
 create mode 100644 drivers/clk/spacemit/ccu_pll.h
 create mode 100644 include/dt-bindings/clock/spacemit,k1-ccu.h


base-commit: 2d5404caa8c7bb5c4e0435f94b28834ae5456623
prerequisite-patch-id: 47dcf6861f7d434d25855b379e6d7ef4ce369c9c
prerequisite-patch-id: 77787fe82911923aff15ccf565e8fa451538c3a6
prerequisite-patch-id: b0bdb1742d96c5738f05262c3b0059102761390b
prerequisite-patch-id: 3927d39d8d77e35d5bfe53d9950da574ff8f2054
prerequisite-patch-id: a98039136a4796252a6029e474f03906f2541643
prerequisite-patch-id: c95f6dc0547a2a63a76e3cba0cf5c623b212b4e6
prerequisite-patch-id: 66e750e438ee959ddc2a6f0650814a2d8c989139
prerequisite-patch-id: 29a0fd8c36c1a4340f0d0b68a4c34d2b8abfb1ab
prerequisite-patch-id: 0bdfff661c33c380d1cf00a6c68688e05f88c0b3
prerequisite-patch-id: 99f15718e0bfbb7ed1a96dfa19f35841b004dae9
-- 
2.47.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
