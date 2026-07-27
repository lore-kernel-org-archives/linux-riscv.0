Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A338C53209
	for <linux-riscv@archiver.kernel.org>; Mon, 27 Jul 2026 23:23:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+cuEk2TwQ0TvOSj4spFhC7iNGLt0BFMpsYAZGzb0UKg=; b=328/RqxOjKJ8LM
	th5JiUC8xBgf5OAQn2KLE5wonM0KxnC9AYMIOTS6mcyM9x0OkL2LH+0h8/abEgyqZFXuXoeskOjdG
	GzvptXoOTzTEG9PHDW/IM39QrjebIqp65oYdBVMeLSlTRD6sBSJoGYpZsBn85dkd+nHZrz28ixRyk
	obxDD4ZNXH8zthIH8I9GRTJZlEYkqFu2fq6hKgDCh+5uQfnELH4vMctpSfyp+Qs1/i66LQCrkgvdt
	85DLlNWlo7h2+KPBLU6irNA9P16RLtaBPWNj9nmlwHDcRwRQf+HhnuRWJAmbEgakBRhu4agI1JWSP
	ypuI9pF/YWiMmhI/O74A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUef-000000044WT-0Ucz;
	Mon, 27 Jul 2026 23:22:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woUee-000000044WM-0BeP
	for linux-riscv@lists.infradead.org;
	Mon, 27 Jul 2026 23:22:40 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F9A76013A;
	Mon, 27 Jul 2026 23:22:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBCA1F000E9;
	Mon, 27 Jul 2026 23:22:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785194558;
	bh=CpSwG5Ys9tkgTGeHbMtpzIYROuVRaYNK2EhvdQM5134=;
	h=Date:From:To:Cc:Subject;
	b=WTx9qPTT/ELd7WXtd8K0yP1Q+3b0YJL3RZsSW1IrpPi+LFd43DEFEtXC8uvOdN+BV
	 qtciR0uxYEk99zliLwJMu94YInfkzfl410YFRFCqJcb7azM2Tvj/0ulUeUf3f4TwDp
	 oWtWMzrkx2t8u8Ksl7GLtdBEq+haXc0ZT+wmpbbs/PqVr2trbJj12Bj1I2RC7ARJfp
	 6oQGgHb5QQ8S0bkzoYiBywP4LiKQhr/VMU/F3H7dn2C1cBDf01hpsKt3UyqWgzNt/3
	 NM/ljAQzGuKGqLqDuVMNSaqfo5FU/zMOyJ75DuhCGoQbR0zCemczjQlOYx1jubZxgo
	 A2WYvdB3yhlzg==
Date: Mon, 27 Jul 2026 16:22:36 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.3
Message-ID: <amfoPMED/cB4zinU@x1>
MIME-Version: 1.0
Content-Disposition: inline
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

The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.3

for you to fetch changes up to 15d32aaf6300b832814a9930fdbd20efdbc9adcf:

  riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions (2026-07-22 16:09:00 -0700)

----------------------------------------------------------------
T-HEAD device tree changes for v7.3

There is just one set of changes that adds the remaining IO expansion
chips on the TH1520-based LicheePi 4a board.

----------------------------------------------------------------
Emil Renner Berthing (2):
      riscv: dts: thead: Add IO labels for the IO expansion on I2C1
      riscv: dts: thead: Add remaining Lichee Pi 4A IO expansions

Icenowy Zheng (2):
      riscv: dts: thead: th1520: remove pclk for I2C1
      riscv: dts: thead: lpi4a: sort nodes

Thomas Bonnefille (1):
      riscv: dts: thead: Add TH1520 I2C nodes

 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 141 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++---------------------
 arch/riscv/boot/dts/thead/th1520.dtsi             |  53 +++++++++++++++++++++++++++++--
 2 files changed, 157 insertions(+), 37 deletions(-)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
