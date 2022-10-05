Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B720C433FE
	for <linux-riscv@archiver.kernel.org>; Wed,  5 Oct 2022 17:14:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=qbpB61ElzA8lAXWbWz44RyAHOR73IPPpvMO9RWG2TwE=; b=KoYAd0DP0HU/s6
	Eqab2h3p0cVxsjdSAuxIzEOPtS7zUuf6klQYcWBItMS2fCqs7SRFzfgq3RBZNQVVmsdHuJRBgHc0L
	X6gAUzceZgmrXqTLV/H0cg4a64IF2Y0COtLijglVqz0rg8IDldIHRQDFt1Jgg/eTGWmeAm37mVu7B
	iZPRqKJ3WASitvGqUydqWYrZjjBvlGb9cAxkc6uEsgrYCRJxtmi71UfuDaQF+KwKXdZkEUB91uNlA
	yWGGveykiXAdhIYWv0wJLSL0Rvf7o0fuZyy5H2IK9D9RzttsqW3XTxSLpDG4zTpGQA3pG1YPIqTv9
	/sQFDfeEhXHmmy1m2TOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yV-00FNZs-5q; Wed, 05 Oct 2022 17:14:27 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1og7yR-00FNZ9-VJ
	for linux-riscv@lists.infradead.org; Wed, 05 Oct 2022 17:14:25 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id A6DE8B81DEE;
	Wed,  5 Oct 2022 17:14:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3FDEC433D6;
	Wed,  5 Oct 2022 17:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1664990060;
	bh=S7lanKefy2QFD+FZGym2xa09dQhswcpvM+aMfQCBD6A=;
	h=From:To:Cc:Subject:Date:From;
	b=JNhRka/j3w5RiAe4UWem3JUqCcvreXsTgbls5sa7bj7BFK7gBZMI3GnGJ9bA3tuzB
	 DDvZGrE3lkmRD7DrenlFaoRYiZzZJUXW0VV+Baov/O+AH58A0E3WHmvdtLl3Asjs9X
	 fGhngqpQqZDBYeBIE7RUfByNqkW8RTceirUQ6We5Rk0GLuU3yoCgPsPFt1S19XT3VF
	 +DPt1rIp7ntRvypF0MPnGrCl203m5onaelnqwZe0YByskynOZpEfSDvTzGjTe1BpdC
	 J3r+gcGaeNbpxkd6OnncazOf085GrXIakFtgNu292aeHKSW5MdzNQpIHWRT4fDWUCq
	 cvnKVGMZbZqDQ==
From: Conor Dooley <conor@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Conor Dooley <conor.dooley@microchip.com>
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-serial@vger.kernel.org
Subject: [PATCH 0/6] RISC-V: stop selecting device drivers in Kconfig.socs
Date: Wed,  5 Oct 2022 18:13:43 +0100
Message-Id: <20221005171348.167476-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.3
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221005_101424_195103_D68C4DEB 
X-CRM114-Status: GOOD (  11.66  )
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

As my RFC [0] series doing the symbol name changes has not yet reached
consensus, I've split out the removal of device driver selects into a
new series. I kept the plic as a direct select - although given how Maz
is treating the SiFive plic driver as the RISC-V plic driver, maybe that
should just be selected by default at an arch level...

I assume the individual patches can go via their subsystems & I'll
resubmit the arch/riscv patches a cycle later? I'm not in any rush.

Thanks,
Conor.

0 - https://lore.kernel.org/linux-riscv/20220923185605.1900083-1-conor@kernel.org/

Conor Dooley (6):
  clk: sifive: select by default if SOC_SIFIVE
  serial: sifive: select by default if SOC_SIFIVE
  serial: sifive: select by default if SOC_CANAAN
  riscv: stop selecting the PolarFire SoC clock driver
  riscv: stop selecting SiFive clock and serial drivers directly
  riscv: stop directly selecting drivers for SOC_CANAAN

 arch/riscv/Kconfig.socs    | 8 --------
 drivers/clk/sifive/Kconfig | 4 +++-
 drivers/tty/serial/Kconfig | 2 ++
 3 files changed, 5 insertions(+), 9 deletions(-)

-- 
2.37.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
