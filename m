Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C00C2C43217
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 10:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=ELo/f8U/7O2Ry0V3txmrqfEbWQT8iIgiIF4gbuDsLEA=; b=TyW5CrbS3Z7tHi
	fLdqbqv9yhpTBnedCmCYxOzkM12lTNTRcHTIEYroV9ikIkonIge5TarXd0l3uEBvpB5ZEisWg5ah5
	oPwHhjrdqC1ARc43MU2bmsGx4Cj3Pzj3jSDHLJfMkQR1XUvU8deYfYHcF/3haemBUxcNkiuw5WeJ8
	xoGQZ+uO9MtpC+mlZQ4YMk80BzcWSIjiu4akfWl6/UDQd1E+Pw5wv5ZjENtWlseIbp9I1JwO2y0FK
	LwvaEj4XPeWgEkqRpcetfILm/xkNMmJTVUO4UxYDB0MWz9a7jCLwv/CC3aTTtz7Pem6xUnLbk35qt
	Od/WKwtDCtdLUBw7in5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyrY-003Rvo-0P; Fri, 18 Nov 2022 10:44:48 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyrU-003RtD-ME
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 10:44:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ams.source.kernel.org (Postfix) with ESMTPS id 5B5DCB82301;
	Fri, 18 Nov 2022 10:44:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2D930C433C1;
	Fri, 18 Nov 2022 10:44:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668768282;
	bh=Zsivvvk2gpJhrY509GmGOEwieY9oWQM8lDocUkP/2WY=;
	h=From:To:Cc:Subject:Date:From;
	b=g6exTW6ru7T3Sfj15Q+RujKe7pFAl5kXHnNkTwImEVhEN1SZ3LevD0ynzCibr16ye
	 t5vsPUl0vmigv0Aw0HYAWm5/hI6LSS0O41OMQctBXQi2OGOea7A58yoDb5rgPjbSn1
	 x9JgSWTbcUrGXhAxbTB5F7hU4BEL0TMr2zMq8gc8mtBpKQMUR9np1b7lfTd3IpI/Hy
	 eX6SElZXYmzaGKeberzF7A/TsZ8YrfA9RfFV2LmhKprOcAJsgGk4yqbVLZ/7nF404G
	 bojFIYTR7xn4QQ2O28bh1edjtunSNcJRmPFuz1BxsvinNYorJq50TrI9LVxwC3aEMb
	 ubt006J7kNhTg==
From: Conor Dooley <conor@kernel.org>
To: Marc Zyngier <maz@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v2 0/3] RISC-V interrupt controller select cleanup
Date: Fri, 18 Nov 2022 10:42:58 +0000
Message-Id: <20221118104300.85016-1-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_024444_900116_58DF89B0 
X-CRM114-Status: GOOD (  10.96  )
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

Hey Marc, Anup, Palmer,

Submitted a patch yesterday defaulting the SiFive PLIC driver to
enabled [0], and in the ensuing conversation Marc suggested just doing a
select at the arch level and dropping the user selectability completely.

Since we're already selecting SIFIVE_PLIC in Kconfig.socs for all of the
supported SoCs & selecting RISCV_INTC in the arch Kconfig itself,
patches 1 & 2 can go via the irqchip tree without any impact.

@Anup, by the same logic - I think we can also enable the AIA stuff via
selects at the arch level? Dumping as much from Kconfig.socs as possible
is the plan, so adding them there for SOC_VIRT kinda goes contrary to
that.

I spoke with Palmer today about putting my various bits of Kconfig.socs
cleanup on a branch, so I'll take patch 3. It's only in this series as
it is related work, rather due to any sort of dependency between the
patches.

Thanks,
Conor.

[0] https://lore.kernel.org/linux-riscv/86wn7tnx9a.wl-maz@kernel.org/

Conor Dooley (3):
  irqchip/sifive-plic: remove user selectability of SIFIVE_PLIC
  irqchip/riscv-intc: remove user selectability of RISCV_INTC
  RISC-V: stop selecting SIFIVE_PLIC at the SoC level

 arch/riscv/Kconfig      |  1 +
 arch/riscv/Kconfig.socs |  5 -----
 drivers/irqchip/Kconfig | 21 ++-------------------
 3 files changed, 3 insertions(+), 24 deletions(-)

-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
