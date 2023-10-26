Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D88CEC25B48
	for <linux-riscv@archiver.kernel.org>; Thu, 26 Oct 2023 09:32:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wkSwT/jJ9MeLHece0mn98NneDYo4mlzIP8kFefG6gT4=; b=U1Sux3RH98Sr2G
	GVleq3mJyTbQSFXqSDa5vM4ef8Z8eMoPciF/iFiEAWDwWBJe9C1W8g2qL6dC1PtQHc3LzVZGaAKWa
	mMpxiTMtNNeKYLvhllJlP58sCM/nOf2FGaz3gaFAAsjkBIV2QqomTeVIqf3EAPMXiLQBCBBMzmGNq
	Ft2ucSFDhJrBfat/F43jJOwYyzUrIgBuFV/T+UAMjYdE4+DIdrcVMQLgp5Xn8rQbHFLNBOyS7e1aU
	z1qpqKytSOWFPoV5XZZb88e8MwEq5rru2zwxNYR+/JoqXS4l9eA8UP7H2jYN+7jFrAujNfyMPZKyL
	6omp6rn6PsTbeDIltTyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwiw-00E4jr-08;
	Thu, 26 Oct 2023 09:32:18 +0000
Received: from xavier.telenet-ops.be ([2a02:1800:120:4::f00:14])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvwir-00E4iq-2x
	for linux-riscv@lists.infradead.org;
	Thu, 26 Oct 2023 09:32:16 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed40:32d3:3cb9:edce:43ae])
	by xavier.telenet-ops.be with bizsmtp
	id 2ZY22B00H2XL1Wb01ZY2ML; Thu, 26 Oct 2023 11:32:05 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qvwiY-007YWQ-69;
	Thu, 26 Oct 2023 11:32:02 +0200
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1qvwig-00GTfi-3b;
	Thu, 26 Oct 2023 11:32:02 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Christoph Hellwig <hch@lst.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Conor Dooley <conor@kernel.org>,
	linux-riscv@lists.infradead.org
Subject: [GIT PULL] Renesas fixes for v6.6 (take three)
Date: Thu, 26 Oct 2023 11:31:57 +0200
Message-Id: <cover.1698312384.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231026_023214_094386_E5B4CF66 
X-CRM114-Status: GOOD (  16.38  )
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

	Hi SoC folks,

The following changes since commit 1531309aa2092a96c092fa662863ffa53da3ba93:

  soc: renesas: Make ARCH_R9A07G043 depend on required options (2023-10-12 19:46:49 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-fixes-for-v6.6-tag3

for you to fetch changes up to 9eab43facdadb7d00456c2657001ae2e5353c814:

  soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM (2023-10-26 09:42:38 +0200)

----------------------------------------------------------------
Renesas fixes for v6.6 (take three)

  - Sort out a few Kconfig dependency issues for the rich set of RISC-V
    non-coherent DMA support.

Thanks for pulling!

----------------------------------------------------------------
Christoph Hellwig (3):
      riscv: RISCV_NONSTANDARD_CACHE_OPS shouldn't depend on RISCV_DMA_NONCOHERENT
      riscv: only select DMA_DIRECT_REMAP from RISCV_ISA_ZICBOM and ERRATA_THEAD_PBMT
      soc: renesas: ARCH_R9A07G043 depends on !RISCV_ISA_ZICBOM

 arch/riscv/Kconfig          | 3 +--
 arch/riscv/Kconfig.errata   | 1 +
 drivers/cache/Kconfig       | 2 +-
 drivers/soc/renesas/Kconfig | 1 +
 4 files changed, 4 insertions(+), 3 deletions(-)

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
