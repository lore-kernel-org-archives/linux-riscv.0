Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E66C4332F
	for <linux-riscv@archiver.kernel.org>; Mon, 11 Dec 2023 22:07:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=fKQkMT1W0YXBaKUrfH/May86hpJgWrlwDShFrpMyAWg=; b=iMZHKTvlQwBbz4
	m55sgztRRCgDtqBhnx+jmMWkZenFKAxvbOsMawUo4KXFfErW2zR/IO+MJRLsdUrk061AsZ7KEv/ET
	3G9JL/nzIiMmAIBilz0pZ7DjzQvOzm6HaY4LdyqsqwNYpn73vqmF3RBuZIJAcHr3L+kBEBEohzu9a
	ugaCG8h2ve4OT6H2VLypYyHpYVKiIvTzS1n2cazQ+FmJh6mkSjpEd34x7bjYcjDu4r79ISpJe3Fu/
	5D1Pu07zlfzV7UQq3TIOMtDf9K4OfhZ3T7z+CTZkTk4DfHAeRHpxndr4XL1/j7cpy2pti71Bphokj
	7vAi+kGldJlUDyCezwQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rCoQW-008yUo-1P;
	Mon, 11 Dec 2023 22:07:00 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rCoQT-008yS6-1Q
	for linux-riscv@lists.infradead.org;
	Mon, 11 Dec 2023 22:06:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id E6AEEB81097;
	Mon, 11 Dec 2023 22:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E1BCC433C7;
	Mon, 11 Dec 2023 22:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1702332415;
	bh=GJIc4lcmbnE1QNCXgfA52Krp47pye0PnIUxJw5mQkV0=;
	h=From:To:Cc:Subject:Date:From;
	b=SjoP21CtsyjRX/8L/C9NP2DGApb80nFM3iwiEe07Hd5Klq1nOOWjh4xrzXMbUK7b+
	 vrwfsu6sZ3PjzOBMug0mPszLIth6elZoHiPnAueSpvBBDx84+RczDfkzUktL28RVX6
	 DQocX8a3Wm+NX9jHFzNoBivFvtOEOIFABAXJrlKGipBKxLXKmKbkjWIqcvDrqxNYdm
	 H3ljXrIuRxfFqgUc/H17di/S+0yfi7DGWStIXYZ8cibdk6Jd0CyTG7wP8IUY3PiVbQ
	 RbZ5V/hHLmTrAXXv2CI+N0bTRFTSnuquLRs52r4uv/ecnjIEK3kBuGhSd9JRObgO5u
	 BOpT77Gj8zMNg==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: conor@kernel.org,
	Conor Dooley <conor.dooley@microchip.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	linux-renesas-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1] soc: renesas: make ARCH_R9A07G043 depend on !DMA_DIRECT_REMAP
Date: Mon, 11 Dec 2023 22:06:36 +0000
Message-Id: <20231211-primate-arbitrate-fbcd307a0b00@spud>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1934; i=conor.dooley@microchip.com; h=from:subject:message-id; bh=QZakA2jngPjyPv1mx6ddYU3DUAgBXMmCEkYM0tqgkJ0=; b=owGbwMvMwCFWscWwfUFT0iXG02pJDKnl7a82avC45SVsOHSnMmD9kqi39+oOv/E4eGLKiSyF7 VN/TtBY21HKwiDGwSArpsiSeLuvRWr9H5cdzj1vYeawMoEMYeDiFICJPNRk+KfM9DVladJpqQ75 m0teZL07tsT4/tX4e0/S9Rbr6P7c0VjI8D/TrVIzd+K13GU5e46oLdrQJREb+yKi8eFNtiuPHyq XpTMDAA==
X-Developer-Key: i=conor.dooley@microchip.com; a=openpgp; fpr=F9ECA03CF54F12CD01F1655722E2C55B37CF380C
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231211_140657_617952_D23C68E2 
X-CRM114-Status: UNSURE (   9.06  )
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

From: Conor Dooley <conor.dooley@microchip.com>

Randy reported yet another build issue with randconfigs on rv32:
WARNING: unmet direct dependencies detected for DMA_GLOBAL_POOL
  Depends on [n]: !ARCH_HAS_DMA_SET_UNCACHED [=n] && !DMA_DIRECT_REMAP [=y]
  Selected by [y]:
  - ARCH_R9A07G043 [=y] && SOC_RENESAS [=y] && RISCV [=y] && NONPORTABLE [=y] && RISCV_ALTERNATIVE [=y] && !RISCV_ISA_ZICBOM [=n] && RISCV_SBI [=y]

This happens when DMA_DIRECT_REMAP is selected by the T-Head CMO erratum
option and DMA_GLOBAL_POOL is selected by the Andes CMO erratum. Block
selecting the RZ/Five config option, and by extension DMA_GLOBAL_POOL,
if DMA_DIRECT_REMAP has already been enabled.

Fixes: 484861e09f3e ("soc: renesas: Kconfig: Select the required configs for RZ/Five SoC")
Reported-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org> # build-tested
Closes: https://lore.kernel.org/all/24942b4d-d16a-463f-b39a-f9dfcb89d742@infradead.org/
Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I don't know what the exact fixes tag here is as I did not bisect with
the randconfig, so I blamed the one that added DMA_GLOBAL_POOL.

CC: Geert Uytterhoeven <geert+renesas@glider.be>
CC: Magnus Damm <magnus.damm@gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>
CC: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
CC: linux-renesas-soc@vger.kernel.org
CC: linux-kernel@vger.kernel.org
---
 drivers/soc/renesas/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/soc/renesas/Kconfig b/drivers/soc/renesas/Kconfig
index 0071864c2111..0986672f6375 100644
--- a/drivers/soc/renesas/Kconfig
+++ b/drivers/soc/renesas/Kconfig
@@ -340,6 +340,7 @@ if RISCV
 config ARCH_R9A07G043
 	bool "RISC-V Platform support for RZ/Five"
 	depends on NONPORTABLE
+	depends on !DMA_DIRECT_REMAP
 	depends on RISCV_ALTERNATIVE
 	depends on !RISCV_ISA_ZICBOM
 	depends on RISCV_SBI
-- 
2.39.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
