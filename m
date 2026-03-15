Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29839F30280
	for <linux-riscv@archiver.kernel.org>; Sun, 15 Mar 2026 19:10:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Subject:To:From
	:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=gChaggbBAQvlHB/ipG2MUHhmDg2SNk1Qp/agoSJASDQ=; b=tQWYDuqnUG5qK8
	9iQhgJfr+CxLV7UjG9/YsZJ6ixOtMpM74Bp4qAeWjRG0CnqEspMuRCY/N2LnVOSttnnpi26jS1MgR
	rXI35sezMYeevbpMLz5P/S1QbA+hQ/DKclxWI2o32q9mnIcgpTL2u8y7tKISWcZf4tK5uUMHUCq6k
	23WaV0fQqH3hPSoPc75xj5AOpquKL4xPPZjQuSCiZnrcLEufpm4kb54Rv1XDKhc4RMjXZ8PcZvRY/
	my74qN99zVmi+TPXSYk5rWI76TM/yBLLFDDDgZbRNrNjcdtWvlwyfH+Od1cI0d6PKsBdbnrAkzQVp
	dwDH6ZUYByvJzr8QmOxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qrE-00000002qtH-26Nw;
	Sun, 15 Mar 2026 19:10:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1qrD-00000002qtB-0YtL
	for linux-riscv@lists.infradead.org;
	Sun, 15 Mar 2026 19:10:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5754460008;
	Sun, 15 Mar 2026 19:10:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C7545C4CEF7;
	Sun, 15 Mar 2026 19:10:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773601834;
	bh=IthiWArBSLDgAMO0bvZ9kc3iO/llybx5j9goMv6GKII=;
	h=Date:From:To:Cc:Subject:From;
	b=Nwo7VzHVJgyoCQvU4OxaefNjEGgkRLBJg94h5tYV62b9QvA+AKnYOKQds31SCdr1v
	 YhMsvP7NP3hB/OubbhR4JEisMZT/BC9OMiymAaJM1tIen5gN9fXQbGDan8aca3K78b
	 +4kHHiIv3M4qYCqkIWRkFRxmtKAEvAp5MnKN4cNl6wamBfgSWWex4Ph1H2mL+c9KNm
	 44ZB/82qdCSzUH7lTfY6Vvcu0vsV1jiwwIzUjKxMs2AISAYhwA/e8rL/hOKQZ9IXuR
	 PAnNj1/RdQ6EOc9e5eRcQ+eRdJVT8E3lw7Iult/6fAmjJrOerOJc+QpCIDwHom++uR
	 RrNLZHiT9UzDQ==
Date: Sun, 15 Mar 2026 12:10:32 -0700
From: Drew Fustini <fustini@kernel.org>
To: soc@kernel.org
Subject: [GIT PULL] RISC-V T-HEAD Devicetrees for v7.1
Message-ID: <abcEKCNIA9wDgIcE@x1>
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
Cc: devicetree@vger.kernel.org, Alexandre Belloni <alexandre.belloni@bootlin.com>, Arnd Bergmann <arnd@arndb.de>, Linus Walleij <linusw@kernel.org>, Han Gao <rabenda.cn@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org, Icenowy Zheng <zhengxingda@iscas.ac.cn>, Jisheng Zhang <jszhang@kernel.org>, Michal Wilczynski <m.wilczynski@samsung.com>, Yao Zi <ziyao@disroot.org>, Guo Ren <guoren@kernel.org>, linux-riscv@lists.infradead.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, Fu Wei <wefu@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git tags/thead-dt-for-v7.1

for you to fetch changes up to 9c99a784d9117a192ebf779d4f72ebec435ada97:

  riscv: dts: thead: lichee-pi-4a: enable HDMI (2026-03-14 09:19:26 -0700)

----------------------------------------------------------------
T-HEAD Devicetrees for 7.1

Update the T-Head TH1520 RISC-V SoC device tree to support the
Verisilicon DC8200 display controller (called DPU in manual) and the
Synopsys DesignWare HDMI TX controller. In addition, enable HDMI output
for the LicheePi 4a board.

Signed-off-by: Drew Fustini <fustini@kernel.org>

----------------------------------------------------------------
Icenowy Zheng (2):
      riscv: dts: thead: add DPU and HDMI device tree nodes
      riscv: dts: thead: lichee-pi-4a: enable HDMI

 arch/riscv/boot/dts/thead/th1520-lichee-pi-4a.dts | 25 +++++++++
 arch/riscv/boot/dts/thead/th1520.dtsi             | 66 +++++++++++++++++++++++
 2 files changed, 91 insertions(+)

_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
