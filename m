Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7796EC5DF6D
	for <linux-riscv@archiver.kernel.org>; Sun, 16 Aug 2026 07:01:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=Q8+PyCHCssnrd6rwWmXOZs251il8Nq96niOgRB4xtQE=; b=IKYA4k+Q5OdNmA
	1aoSoyLo3XE9TkFOxZeS/bBLg5xjXs+/miXiSu1QC7U6djqLAap00+C2W65x3ZZAnidF7aLHYcsY8
	9Ouausl3Scdjkuyyv31dAzwi5D17DqJka6k9qrhIe2Idy/Ud8f/+kHXrhAAu5CiEVMemRh2UhO7bx
	wMqNiMHJrDOE00hpQypfp+0BJl1TbV/NHMqaEc7NK4ab0gC0T6Kmpn4RpBSV+zIyIr3ZwitLKS3nP
	bpiR8izpf24X0YUfru33DfPRARCqbQlkfpT4C8oiCk12nLbbbfPYMqwjZaE/xgJuE1+hHMcitX137
	/uTd5Fwg7wqC4KEDTOKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUri-00000004Xbe-0BmN;
	Sun, 16 Aug 2026 07:01:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvUrg-00000004XbU-3k3Z
	for linux-riscv@lists.infradead.org;
	Sun, 16 Aug 2026 07:01:04 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E9E0760055;
	Sun, 16 Aug 2026 07:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F7261F000E9;
	Sun, 16 Aug 2026 07:00:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786863663;
	bh=eKRkUJfCj88qVdlkI4awKV1gPZoWAVIlpCpTPjok5ko=;
	h=From:To:Cc:Subject:Date;
	b=SsV2V/j9ikUBTGVa5FVEE+2D35Imm4RGevTg2+T4nCFdF+eHXkNw5DSeSaTQae7La
	 4CK7qZDLGRyRqs9mRXsJxjwVeK6ajGwufH8cmIOpxgT/xiQcW05tSolebKlsec7Lup
	 OdX3rSP9ECzOuvCvSmzZn3bM9PamuI+Xc8X/e17c7VYIaROGFWN84calzBf2ODniTr
	 kbXvbKnepucdta34pmGw3H5tksiFQnMflS4QJM1eU6LmMSNW/M39v3LsZcKMb2qIpM
	 UCpj7EYlEN4lDMHAGTN2NM2JAILxUfd07kRHsDoZRQ/h1LKCNmB5xIgWqr0ecY5w8u
	 /EyU7KCznV+/w==
From: Guo Ren <guoren@kernel.org>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: palmer@dabbelt.com,
	pjw@kernel.org,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	daniel.lezcano@kernel.org,
	anup@brainfault.org,
	hui.wang@canonical.com,
	samuel.holland@sifive.com,
	"GUO Ren (XuanTie)" <guoren@kernel.org>
Subject: [PATCH 0/5] riscv: Make IPI_MAX visible and use it consistently
Date: Sun, 16 Aug 2026 07:00:44 +0000
Message-ID: <20260816070049.2097442-1-guoren@kernel.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
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

From: "GUO Ren (XuanTie)" <guoren@kernel.org>

This series removes the implicit assumption that RISC-V supports exactly
eight IPI message types.

Currently, the SBI, CLINT and ACLINT SSWI IPI providers use
BITS_PER_BYTE when sizing the generic IPI mux, while IMSIC carries a
separate IMSIC_NR_IPI definition set to 8. These values happen to match
IPI_MAX today, but neither is the proper source of truth for the number
of RISC-V IPI message types.

Move enum ipi_message_type to asm/smp.h so IPI providers can use IPI_MAX
directly, then replace the BITS_PER_BYTE and IMSIC_NR_IPI uses with
IPI_MAX.

This also makes adding future RISC-V IPI message types independent of
the current eight-entry assumption.

GUO Ren (XuanTie) (5):
  riscv: smp: Move enum ipi_message_type to asm/smp.h
  riscv: sbi: Use IPI_MAX for SBI IPI muxing
  clocksource: clint: Use IPI_MAX for IPI muxing
  irqchip/aclint-sswi: Use IPI_MAX for IPI muxing
  irqchip/imsic: Use IPI_MAX instead of IMSIC_NR_IPI

 arch/riscv/include/asm/smp.h            | 12 ++++++++++++
 arch/riscv/kernel/sbi-ipi.c             |  4 ++--
 arch/riscv/kernel/smp.c                 | 12 ------------
 drivers/clocksource/timer-clint.c       |  4 ++--
 drivers/irqchip/irq-aclint-sswi.c       |  4 ++--
 drivers/irqchip/irq-riscv-imsic-early.c |  4 ++--
 drivers/irqchip/irq-riscv-imsic-state.h |  1 -
 7 files changed, 20 insertions(+), 21 deletions(-)

-- 
2.43.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
