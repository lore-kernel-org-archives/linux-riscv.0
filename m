Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D69CCA5FDD
	for <linux-riscv@archiver.kernel.org>; Sat,  3 Oct 2026 07:22:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4bdyfnIWLjXNoVa/QkqQ9H3WeIAwyRPrv+VDQBOAlpE=; b=Ss1gH7rLT4f+YB
	Bl/n2jPs8vPFqCFnB6fGcKW9ZL4U0Djf3YyHgVWOBLxGCKArd96InR8skYiulYz0jff1BH/ahS71O
	rzP4qpRMToPa/82EWg7aaW9JUBnUszfkK7rqB9kP4nKE8Wf/Fxy/FbM9o3vlMitNNH/fgq7AQ5wNb
	xj2ZvfSyqa5v+LyeRANbOVSv07Cg/sG4Yp/qEH0SYxb7RZbe3E5vBxShO8aEIjHqinbYwd7d5k9zu
	EHA8j+7hxgkvSxyeknPdstaA3v2qcWoSb9Cgs4BmUoSEaf/3VSrgnYrDbCTPLXuEybhv6okN8sery
	2ATrV3GvCE3oWGTjL8dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCu4B-0000000D7jO-3XeY;
	Sat, 03 Oct 2026 07:21:55 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCu4A-0000000D7jH-1qUV
	for linux-riscv@lists.infradead.org;
	Sat, 03 Oct 2026 07:21:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DAD8A414D7;
	Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A3991F0089B;
	Sat,  3 Oct 2026 07:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791012113;
	bh=Xoc2jJkqxh0W1JpflqN0cFCgG8i+IFymj+idMxZoelg=;
	h=Date:From:To:Cc:Subject;
	b=boqFFFpYrdheYDq+BAfBc47tcGIE56gKYmwaUXjqUzJa3whInDoUwlhJVChsCamqi
	 5CyFRVEV3w0BZGCqlUEVrcqZD0FU0MGIVHIT4bGVUPj7G0NMZ2LlVBIkBZNrigl2Oe
	 D5wV3/KgXlHANqgpjMkOI4tGv1dHs8l0TyDafQqQD03/DFyJbAUkDW/jpow6Qha6XD
	 JJxEPySjnF+FVlirMq2BclTauHUD11jVqit8mkWxRY2kozqP6XO/R85X3ea1MrueGk
	 ejVheY/yyjlOqkIZR/kxcD1J0FFco+7BGxg7ATVxZHDWinJ696/RlWtXIQyLRTDa0e
	 srdaOM1W+UmKg==
Date: Sat, 3 Oct 2026 00:21:52 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Linus Walleij <linusw@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>, Han Gao <gaohan@iscas.ac.cn>,
	Han Gao <rabenda.cn@gmail.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [GIT PULL] RISC-V T-HEAD devicetree changes for v7.4
Message-ID: <asCtEGcXwUoOHyMA@x1gen8.tail89d63.ts.net>
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

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.4

for you to fetch changes up to 2414ca8f5a0cafdfdb2b5899fd173adc09b5adf1:

  MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org (2026-10-01 23:34:22 -0700)

----------------------------------------------------------------
T-HEAD device tree changes for v7.4

Add the Milk-V Meles, a single board computer with the TH1520 SoC:
- Document the board compatible alongside the BeagleV Ahead
- Add the base device tree with UART0, eMMC, microSD, Gigabit Ethernet
  and the PWM fan
- Enable the AP6256 Wi-Fi module on SDIO1
- Enable HDMI output through the DC8200 display controller and the
  DW-HDMI transmitter

Also update MAINTAINERS: move the T-Head SoC tree T: entry to kernel.org

----------------------------------------------------------------
Drew Fustini (1):
      MAINTAINERS: Move RISC-V T-Head SoC tree to kernel.org

Han Gao (4):
      dt-bindings: riscv: thead: add Milk-V Meles
      riscv: dts: thead: add Milk-V Meles
      riscv: dts: thead: enable AP6256 Wi-Fi on Milk-V Meles
      riscv: dts: thead: enable HDMI on Milk-V Meles

 Documentation/devicetree/bindings/riscv/thead.yaml |   6 +-
 MAINTAINERS                                        |   2 +-
 arch/riscv/boot/dts/thead/Makefile                 |   1 +
 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts   | 346 +++++++++++++++++++++
 4 files changed, 352 insertions(+), 3 deletions(-)
 create mode 100644 arch/riscv/boot/dts/thead/th1520-milkv-meles.dts

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
