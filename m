Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A45CC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 29 Jan 2022 16:28:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=4uAgm31ATExw0kUiWtO6jmPV44Kezkj0QAzptHe7xRs=; b=gWkV8wHOYuwkjV
	rEEAH+Eegn3XQz7LzPAlxHjh5U11cbVqIMXWWx8vtSOnBb3ageIqXEdd0Z6oIWpZD8isvDb4ooKsP
	kaaiHNeaLtTuLkgDZqe8W53sj5wswXko3mE0oVgrhYvdVL8uF+5+DcR5HY51T354IXiEru+DLc433
	QYpf+tg09PORkFrsQ6L/M50cxtGfzL/q3YoCQ3ILbnZuRHCfKbxlDYlGsXVjFen6jIHDDH0Wg6ONv
	VdWP5mkd4bFhxxiWRkIjdu0UG/RC46z3Y5c3eJEYRw6ls1SXrz4JoTmSS+jIu5guYcZPsWZnoUYEQ
	j2HsmP4Xd1q9TpXa7dBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nDqZp-0055PW-76; Sat, 29 Jan 2022 16:27:49 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nDqZn-0055Ox-9A
 for linux-riscv@lists.infradead.org; Sat, 29 Jan 2022 16:27:48 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id A195A60EEC;
 Sat, 29 Jan 2022 16:27:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7F416C340E5;
 Sat, 29 Jan 2022 16:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643473666;
 bh=2CUI7v17Gn0PeGtAaam7tRsozO1B4m6uZjQPozMQ8TI=;
 h=From:To:Cc:Subject:Date:From;
 b=STYxvf2qohRXhpB8jgGZMqyAa8A/+BsfwZzT7cjiDmMvj0/mnwLfgKV5GSX40SQjR
 /lyZsgsvhjdV3X2Bz75kbpT8dsId+rSAjFuXAAvyNZVL6/xiq8NSHIcvTip4VmXuni
 KcYQB7G5lWbvnyjZb4NRfcuZYY9uZRvLWBXyUSxG5BuLluplhmv78x2pbhn6NIokHH
 DaclL2dqT3KzrK4pIJJMDV61y0CNaN59KL8zP+JqMmVxKsv3NDbONRLUH1TaTdJpfe
 tWMcFZEnY/wl6y5usrJ4UfW/x2xf0I+KxyGSaVWnpgiy9gGNcO9bMtfP6bDLmJrN8L
 m3yK4WGf2afOg==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V6 0/2] Add thead,c900-plic support
Date: Sun, 30 Jan 2022 00:27:24 +0800
Message-Id: <20220129162726.1154501-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220129_082747_410555_641AAD51 
X-CRM114-Status: UNSURE (   9.38  )
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

From: Guo Ren <guoren@linux.alibaba.com>

Add the compatible string "thead,c900-plic" to the riscv plic
bindings to support allwinner d1 SOC which contains c906 core.

Changes since V6:
 - Modify sifive,plic-1.0.0.yaml comment
 - Remove vendor-prefixes patch which has been merged
 - Only put dt naming distinguish in sifive-plic.c

Changes since V5:
 - Move back to mask/unmask
 - Fixup the problem in eoi callback
 - Remove allwinner,sun20i-d1 IRQCHIP_DECLARE
 - Rewrite comment log
 - Add DT list
 - Fixup compatible string
 - Remove allwinner-d1 compatible
 - make dt_binding_check
 - Add T-head vendor-prefixes

Changes since V4:
 - Update description in errata style
 - Update enum suggested by Anup, Heiko, Samuel
 - Update comment by Anup
 - Add cover-letter

Changes since V3:
 - Rename "c9xx" to "c900"
 - Add thead,c900-plic in the description section
 - Add sifive_plic_chip and thead_plic_chip for difference

Changes since V2:
 - Add a separate compatible string "thead,c9xx-plic"
 - set irq_mask/unmask of "plic_chip" to NULL and point
   irq_enable/disable of "plic_chip" to plic_irq_mask/unmask
 - Add a detailed comment block in plic_init() about the
   differences in Claim/Completion process of RISC-V PLIC and C9xx
   PLIC.

Guo Ren (2):
  dt-bindings: update riscv plic compatible string
  irqchip/sifive-plic: Fixup thead,c900-plic dt parse in opensbi

 .../sifive,plic-1.0.0.yaml                    | 21 +++++++++++-----
 drivers/irqchip/irq-sifive-plic.c             | 25 +++++++++++++++++--
 2 files changed, 38 insertions(+), 8 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
