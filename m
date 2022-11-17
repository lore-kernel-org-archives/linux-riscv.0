Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 949B6C433FE
	for <linux-riscv@archiver.kernel.org>; Thu, 17 Nov 2022 21:49:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Subject:Cc:To:From:Date:Message-Id:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ED1aDmWX+L1LdbzYibBrbN1fh5Cw2wehBNelPNJxXnw=; b=1x40PkPWClOHQJ
	NmvoCTmtzw2O9q4KaxfpDKpn6XUuMMdKumJfL5fWvDuSVQ2xkqWJl4/u8jL3y8Y6LtSZO9tH5MiMX
	K/kFku1jQ2z6uMsEK2fAlEvMh94aNfDxDsgPZ9GM5iZVDZlyO7vnI231VVdwLPoO2aNg1kBdVhpgr
	hDPB0SKXpu5rbN0yfZER9BwNV56fqKNZV1bVM+TjhjASdSBdOangbZaSCHCdIdSqW35QXT0YDry4E
	PMoE/Dzqod0jH9OXzJ3N+zXLecrf4xMhL+1IMWcJEO8SIql7zytYVQ4W4qZQllXXL29fxpUHAG4uA
	ef/rGj+WYuRCNKC6DD9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmkr-00077P-Pc; Thu, 17 Nov 2022 21:49:05 +0000
Received: from out3-smtp.messagingengine.com ([66.111.4.27])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovmkf-00072H-NO; Thu, 17 Nov 2022 21:48:56 +0000
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
	by mailout.nyi.internal (Postfix) with ESMTP id 929CB5C0307;
	Thu, 17 Nov 2022 16:48:48 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute3.internal (MEProxy); Thu, 17 Nov 2022 16:48:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:date:date:from:from:in-reply-to:message-id
	:mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
	1668721728; x=1668808128; bh=k7r8Nm8QPmd+lIGNswt/8URC6igmM5DGG+M
	PZtrb/VE=; b=CQt5us1rkzcO5LloPfBKBgKmkSfuYH8E+NiQfqGML6khTboa00w
	BMB83B72xgLqmaMEK+6hwvI8uZF3A4+rUCKGWp6KLim3Qtm5rYVbGF5KHTDjVsdR
	NeQtDoFiWt7CmnyL72kPgDGXt3Y8U1gCnLSgTpx2cbPWJ3faloRU/fLxaQetG5Lt
	d0xrAePF5gmaG1I4wEfY+OK78tgecUAiNZRjx/+p17N6ah3+yMjPibrvtdXxdRBX
	YbXdvo0BOBX5SwKLT0zU0gzo2ivBPY4ZT2Ez5bLqoAYi/U/o2lQmwbjeYmNxi7Av
	k7r4xiKFnVdDBJYtmhYeGwEn94CkCe395nA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
	:feedback-id:from:from:in-reply-to:message-id:mime-version
	:reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=1668721728; x=
	1668808128; bh=k7r8Nm8QPmd+lIGNswt/8URC6igmM5DGG+MPZtrb/VE=; b=V
	OGvwBGOfrxtgfUCybhrigA0XgcviGFC3iS0emJa4QNzUOqXMjFvLWNSiKaDiTcWf
	+C6+DHhrZx6tvvMBv+WzVSWk/HIS5a1Dc2AX7wj94wr4rZCFvcAQ1MEeIh/Ux/Kv
	Ob4rz/kYDgiiU1c9doH+SsY4wqXPvN1CFRJNESv4wjNpKZ5rCFKMy4aUMll2Rso2
	qUegrTOJVbv3hAp9XfkYhOVfpFESgwEsrKM41OUIOPq+DVB07WQjuTrQKZdYMj+R
	un2POxVzV48DTzYr8jWargfmJjigQGmfLPY0WTQh3y51+OIautVDQD8ZcG7FjKoc
	7uC0alRm5uaJaU9c0ZVRA==
X-ME-Sender: <xms:QKx2Y-cmxdAYxAk89o25H2QSqOyL2tZFoQEmN4hHsuLFLHAn9wQNzA>
    <xme:QKx2Y4M2z3tmdlaL1fcUPNuRWRBGY-kUiwGru0cAa1v7DRq8s-CytQKt1HafAvaPH
    BiQfJQcPudoyf5X1sY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvgedrgeekgdduhedvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepofgfggfkfffhvfevufgtsehttdertderredtnecuhfhrohhmpedftehrnhgu
    uceuvghrghhmrghnnhdfuceorghrnhgusegrrhhnuggsrdguvgeqnecuggftrfgrthhtvg
    hrnhepvdeifedukedugeetfeejuefhhfdvudfflefhjefhhfektdeiiefggeeggeekgfeh
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdgtohhmnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhn
    uggsrdguvg
X-ME-Proxy: <xmx:QKx2Y_g_WLQlf_T9jcRkO40WIGnpgq2dejHluLl0C1swX5ue0thNOg>
    <xmx:QKx2Y794j2D9tGJlDraAlMJ82dvN6eojoJ_0CQoSurlq6yjiGJT94w>
    <xmx:QKx2Y6vH6TFA3VcpLVkpq5_aWdLXyOhjsKa9lQLwybk070G513Tr_Q>
    <xmx:QKx2Y8W98Dgqn544Idw_hVOFJDK6I-k8_60s9f2fExLjspeLbGGf7w>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 252D7B60086; Thu, 17 Nov 2022 16:48:48 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.7.0-alpha0-1115-g8b801eadce-fm-20221102.001-g8b801ead
Mime-Version: 1.0
Message-Id: <f376fae3-fb50-4a79-9a90-1ee19cafe1ad@app.fastmail.com>
Date: Thu, 17 Nov 2022 22:48:26 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Cc: soc@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-riscv@lists.infradead.org, "Conor Dooley" <conor@kernel.org>,
 "Shawn Guo" <shawnguo@kernel.org>, "Bjorn Andersson" <andersson@kernel.org>,
 linux-kernel@vger.kernel.org
Subject: [GIT PULL] ARM: SoC fixes for 6.1, part 3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221117_134854_224881_325F8337 
X-CRM114-Status: GOOD (  11.78  )
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

The following changes since commit 5449cabd95bbf141e2b7471e8d3cedb6f3b92492:

  Merge tag 'juno-fix-6.1' of git://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux into arm/fixes (2022-11-02 21:58:46 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/soc/soc.git tags/soc-fixes-6.1-3

for you to fetch changes up to 0d6a10dc2b971cc3a192b47721ee8270afc2d104:

  Merge tag 'imx-fixes-6.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes (2022-11-16 22:08:11 +0100)

----------------------------------------------------------------
ARM: SoC fixes for 6.1, part 3

Another set of devicetree and code changes for SoC platforms,
notably:

 - DT schema warning fixes for i.MX

 - Functional fixes for i.MX tqma8mqml-mba8mx USB and
   i.MX8M OCOTP

 - MAINTAINERS updates for Hisilicon and RISC-V, documenting
   which RISC-V SoC specific patches will now get merged through
   the SoC tree in the future.

 - A code fix for at91 suspend, to work around broken hardware

 - A devicetree fix for lan966x/pcb8291 LED support

 - Lots of DT fixes for Qualcomm SoCs, mostly fixing minor
   problems like incorrect register sizes and schema warnings.
   One fix makes the UFS controller work on sc8280xp, and
   six fixes address the same regulator problem in a variety
   of platforms.

----------------------------------------------------------------
Alexander Stein (1):
      arm64: dts: imx8mm-tqma8mqml-mba8mx: Fix USB DR

Arnd Bergmann (4):
      Merge tag 'qcom-arm64-fixes-for-6.1' of https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux into arm/fixes
      Merge tag 'at91-fixes-6.1' of https://git.kernel.org/pub/scm/linux/kernel/git/at91/linux into arm/fixes
      Merge tag 'hisi-maintainer-fix' of https://github.com/hisilicon/linux-hisi into arm/fixes
      Merge tag 'imx-fixes-6.1-2' of git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux into arm/fixes

Brian Masney (1):
      arm64: dts: qcom: sc8280xp: correct ref clock for ufs_mem_phy

Claudiu Beznea (1):
      ARM: at91: pm: avoid soft resetting AC DLL

Conor Dooley (4):
      MAINTAINERS: add entries for misc. RISC-V SoC drivers and devicetrees
      MAINTAINERS: generify the Microchip RISC-V entry name
      MAINTAINERS: add an entry for StarFive devicetrees
      MAINTAINERS: repair Microchip corei2c driver entry

Dmitry Baryshkov (1):
      Revert "arm64: dts: qcom: msm8996: add missing TCSR syscon compatible"

Douglas Anderson (6):
      arm64: dts: qcom: sa8155p-adp: Specify which LDO modes are allowed
      arm64: dts: qcom: sa8295p-adp: Specify which LDO modes are allowed
      arm64: dts: qcom: sc8280xp-crd: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8150-xperia-kumano: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8250-xperia-edo: Specify which LDO modes are allowed
      arm64: dts: qcom: sm8350-hdk: Specify which LDO modes are allowed

Horatiu Vultur (1):
      ARM: dts: lan966x: Enable sgpio on pcb8291

Johan Hovold (6):
      arm64: dts: qcom: sc8280xp: fix ufs_card_phy ref clock
      arm64: dts: qcom: sc8280xp: fix USB0 PHY PCS_MISC registers
      arm64: dts: qcom: sc8280xp: fix USB1 PHY RX1 registers
      arm64: dts: qcom: sc8280xp: fix USB PHY PCS registers
      arm64: dts: qcom: sc8280xp: drop broken DP PHY nodes
      arm64: dts: qcom: sc8280xp: fix UFS PHY serdes size

Marek Vasut (3):
      ARM: dts: imx7: Fix NAND controller size-cells
      arm64: dts: imx8mm: Fix NAND controller size-cells
      arm64: dts: imx8mn: Fix NAND controller size-cells

Mihai Sain (1):
      ARM: dts: at91: sama7g5: fix signal name of pin PB2

Palmer Dabbelt (1):
      MAINTAINERS: git://github.com -> https://github.com for HiSilicon

Peng Fan (1):
      arm64: dts: imx93-pinfunc: drop execution permission

Robert Marko (1):
      arm64: dts: qcom: ipq8074: correct APCS register space size

Satya Priya (1):
      arm64: dts: qcom: sc7280: Add the reset reg for lpass audiocc on SC7280

Ulf Hansson (1):
      arm64: dts: qcom: sm8250: Disable the not yet supported cluster idle state

Xiaolei Wang (1):
      soc: imx8m: Enable OCOTP clock before reading the register

 MAINTAINERS                                        | 36 +++++++++++++++++++---
 arch/arm/boot/dts/imx7s.dtsi                       |  4 +--
 arch/arm/boot/dts/lan966x-pcb8291.dts              | 20 ++++++++++++
 arch/arm/boot/dts/sama7g5-pinfunc.h                |  2 +-
 arch/arm/mach-at91/pm_suspend.S                    |  7 ++++-
 .../boot/dts/freescale/imx8mm-tqma8mqml-mba8mx.dts | 32 +++++++++++++++----
 arch/arm64/boot/dts/freescale/imx8mm.dtsi          |  4 +--
 arch/arm64/boot/dts/freescale/imx8mn.dtsi          |  2 +-
 arch/arm64/boot/dts/freescale/imx93-pinfunc.h      |  0
 arch/arm64/boot/dts/qcom/ipq8074.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/msm8996.dtsi              |  2 +-
 arch/arm64/boot/dts/qcom/sa8155p-adp.dts           | 13 +++++++-
 arch/arm64/boot/dts/qcom/sa8295p-adp.dts           | 12 ++++++++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |  3 +-
 arch/arm64/boot/dts/qcom/sc8280xp-crd.dts          |  6 ++++
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 36 +++++-----------------
 .../boot/dts/qcom/sm8150-sony-xperia-kumano.dtsi   |  6 ++++
 .../boot/dts/qcom/sm8250-sony-xperia-edo.dtsi      |  6 ++++
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  1 +
 arch/arm64/boot/dts/qcom/sm8350-hdk.dts            | 12 ++++++++
 drivers/soc/imx/soc-imx8m.c                        | 11 +++++++
 include/soc/at91/sama7-ddr.h                       |  5 ++-
 22 files changed, 171 insertions(+), 51 deletions(-)
 mode change 100755 => 100644 arch/arm64/boot/dts/freescale/imx93-pinfunc.h

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
