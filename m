Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A49CAC597
	for <linux-riscv@archiver.kernel.org>; Thu, 18 Sep 2025 21:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=MczYW4DBoRKsl3MK89z9ebSJ0ky6P0gM/azQXJDeMFM=; b=tm4yx9WsfDQk9i
	kMETKDEtB04Zi8BHNPL6SEkFNiIwOi15+Q53cHpdqRfOvyFFp2qsB9L6GHafU3UnS/ThR9QCvSOlL
	JzPyaedDi4q3tRwS6RzPU4PYsffzM8dCw3qMz98MYgxWIhJK1d7G+lTek+SgPM7q9L9EYEIdnWTJA
	2R1PQQedFXxPIXnhkgjgliCjNEa1x7FGfjkrU0UIcl+Ai5U50liKCbtVO5esxGxxeAIAfwAOB4/BY
	+VuyYQ6I39kaRyWODtvlAS+2MV7bBsexzo4HiqWkeucpxZMFcGMsHbkVvVmyEq665zWHlZT6VkP4L
	uZ4FFiNkN8Y3SDEekVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzMeD-00000001IPQ-0E9R;
	Thu, 18 Sep 2025 21:58:37 +0000
Received: from smtp.gentoo.org ([2001:470:ea4a:1:5054:ff:fec7:86e4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzMeA-00000001IP2-1ixp
	for linux-riscv@lists.infradead.org;
	Thu, 18 Sep 2025 21:58:35 +0000
Received: from ofsar (unknown [180.158.240.90])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id CE0463421AD;
	Thu, 18 Sep 2025 21:58:29 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
To: soc@kernel.org
Cc: Yixun Lan <dlan@gentoo.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Alex Elder <elder@riscstar.com>,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org
Subject: [GIT PULL] RISC-V SpacemiT Devicetrees for v6.18
Date: Fri, 19 Sep 2025 05:57:59 +0800
Message-ID: <20250919055525-GYC5766558@gentoo.org>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_145834_487875_B68F702D 
X-CRM114-Status: UNSURE (   8.37  )
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

Hi Arnd,

   Please pull SpacemiT's DeviceTree changes for v6.18

Yixun Lan

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://github.com/spacemit-com/linux tags/spacemit-dt-for-6.18-1

for you to fetch changes up to 0f084b221e2c5ba16eca85b3d2497f9486bd0329:

  riscv: dts: spacemit: uart: remove sec_uart1 device node (2025-09-04 08:50:29 +0800)

----------------------------------------------------------------
RISC-V SpacemiT DT changes for 6.18

- Add OrangePi RV2 board support
- Add reset support to UART driver
- Add PDMA driver support
- Remove sec_uart1 node

----------------------------------------------------------------
Guodong Xu (2):
      riscv: dts: spacemit: Add PDMA node for K1 SoC
      riscv: dts: spacemit: Enable PDMA on Banana Pi F3 and Milkv Jupiter

Hendrik Hamerlinck (3):
      dt-bindings: riscv: spacemit: Add OrangePi RV2 board
      riscv: dts: spacemit: Add OrangePi RV2 board device tree
      riscv: dts: spacemit: add UART resets for Soc K1

Yixun Lan (1):
      riscv: dts: spacemit: uart: remove sec_uart1 device node

 .../devicetree/bindings/riscv/spacemit.yaml        |  1 +
 arch/riscv/boot/dts/spacemit/Makefile              |  1 +
 arch/riscv/boot/dts/spacemit/k1-bananapi-f3.dts    |  4 +++
 arch/riscv/boot/dts/spacemit/k1-milkv-jupiter.dts  |  4 +++
 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts   | 40 ++++++++++++++++++++++
 arch/riscv/boot/dts/spacemit/k1.dtsi               | 31 +++++++++++------
 6 files changed, 71 insertions(+), 10 deletions(-)
 create mode 100644 arch/riscv/boot/dts/spacemit/k1-orangepi-rv2.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
