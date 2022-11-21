Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13032C433FE
	for <linux-riscv@archiver.kernel.org>; Mon, 21 Nov 2022 22:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=17o9D5ugowsxoTPOQ4HvD+xUx42rFeFsbdoQiEZfriE=; b=4AmAO4OtL+S0nX
	4Kp9k0bd7/Y2rcmjgViOfvLSxSEzx/8k/asGoRs8H9KnRCZhTpcIzCNLF2ZU3WQ3brTekFKRIjJ2N
	OQrd1aEIgfvPQR9jWYNsfpe1zQC/RGZ/6kFLP16D/K616Go+eejB+lRxK4Ros5I1WyX2c4C5aU4AM
	iBQgSSAV496eMO+3UHQHzHLrLXoFqwH6yPq1wQdglFaL5R3fjPFkuN7muXSWnBinROX2T24DsmxZu
	9EXtFSOiRqFdChiDsgYn++RV9JczAF96kpj3Yxcz+euH4+LZMYCMlWrQNQUATcF3w+bPIBLt4RpC9
	ZuNrFxTpoRmMt+Zg+l5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7M-000mL0-M7; Mon, 21 Nov 2022 22:18:20 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oxF7I-000mIq-LX
	for linux-riscv@lists.infradead.org; Mon, 21 Nov 2022 22:18:19 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 1A9C6B810DB;
	Mon, 21 Nov 2022 22:18:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF741C433D7;
	Mon, 21 Nov 2022 22:18:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1669069093;
	bh=5AHIT3dqGPWeb6DjvBPZBK5b5M0C+l6KZsICArNBZLk=;
	h=From:To:Cc:Subject:Date:From;
	b=d1YPvqFDAZsC4lc9Cj/jobGOoph1G7axE4uiibVn2ngSHxT0GXxFznIc+08QReDb3
	 ou0IhrSAPLdYsF5rzozNCsBqZvtYcUBZHpJIrww2O8j98lQ19VFM/yQkBERnbc9PtN
	 0oIN2EBl8tyHSk0/gNiG6Ht//8c7FJfhhCp1bL3ce8V863cm58+ViaWBjky4HYywJ6
	 /eyrr68/lT2IGpeFcRZaBYp4m1XiMIHtjlBdNHaLTX3gjP94kjNU/g0Z3eoL6qbc7o
	 Fc2V6bJYdn1XqTtFc7XtDoezQ3Da5LD3/unEa0SOovAzunEvcJbfujn9cJOTiSamS3
	 /I99t89sgs5aw==
From: Conor Dooley <conor@kernel.org>
To: linux-riscv@lists.infradead.org
Cc: Conor Dooley <conor.dooley@microchip.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@infradead.org>,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>,
	Emil Renner Berthing <emil.renner.berthing@canonical.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Samuel Holland <samuel@sholland.org>
Subject: [PATCH v1 0/7] RISC-V: kconfig.socs cleanup, part 1
Date: Mon, 21 Nov 2022 22:14:08 +0000
Message-Id: <20221121221414.109965-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221121_141816_994313_5E0F1061 
X-CRM114-Status: GOOD (  15.68  )
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

Hey all,

Following on from my RFC series a little bit ago, I'm back again with an
attempted conversion of our SOC_FOO symbols to a more uniform ARCH_FOO.
Last time around, I had about 30 patches [0], but here I have a more
modest offering.

Patch 1 adds stubs, that ideally would be applied for v6.2-rc1 (but
after week 1, see the note in that patch for more), which would allow
for converting drivers etc over a release cycle (or more) while allowing
everything else to keep working in the meantime.

Christoph Hellwig & Damien voiced some objections in the original thread,
hopefully the gradual conversion assuages Damien's concerns about
breaking defconfigs - but I am not sure what to do about Christoph's
dislike of the ARCH_FOO stuff. A change the world approach is unlikely
to be well received & introducing "duplicate" symbols for cross-arch
vendors would surely be similarly well received? I don't mind doing it,
but my instinct is that that is a futile use of time.

The rest of this series contains v6.3 material, converting SOC_FOO
usages in arch/riscv to ARCH_FOO.

Thanks,
Conor.

[0] - https://lore.kernel.org/linux-riscv/20220923185605.1900083-1-conor@kernel.org/

CC: Arnd Bergmann <arnd@arndb.de>
CC: Christoph Hellwig <hch@infradead.org>
CC: Conor.Dooley <conor.dooley@microchip.com>
CC: Damien Le Moal <damien.lemoal@opensource.wdc.com>
CC: Emil Renner Berthing <emil.renner.berthing@canonical.com>
CC: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Heiko Stuebner <heiko@sntech.de>
CC: Palmer Dabbelt <palmer@dabbelt.com>
CC: Samuel Holland <samuel@sholland.org>
CC: linux-riscv@lists.infradead.org

Conor Dooley (7):
  RISC-V: introduce ARCH_FOO kconfig aliases for SOC_FOO symbols
  RISC-V: kconfig.socs: convert usage of SOC_CANAAN to ARCH_CANAAN
  RISC-V: kbuild: convert all use of SOC_FOO to ARCH_FOO
  RISC-V: stop selecting SIFIVE_PLIC at the SoC level
  RISC-V: stop selecting the PolarFire SoC clock driver
  RISC-V: stop selecting SiFive clock and serial drivers directly
  RISC-V: stop directly selecting drivers for SOC_CANAAN

 arch/riscv/Kconfig                     |  1 +
 arch/riscv/Kconfig.socs                | 44 +++++++++++++++-----------
 arch/riscv/Makefile                    |  2 +-
 arch/riscv/boot/dts/Makefile           |  2 +-
 arch/riscv/boot/dts/canaan/Makefile    | 14 ++++----
 arch/riscv/boot/dts/microchip/Makefile |  8 ++---
 arch/riscv/boot/dts/sifive/Makefile    |  4 +--
 arch/riscv/boot/dts/starfive/Makefile  |  2 +-
 8 files changed, 43 insertions(+), 34 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
