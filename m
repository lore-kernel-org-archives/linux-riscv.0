Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BC8FC433FE
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 13:57:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=PkIPXy9csmgdc9u0uCImL8nTPHM/z+RuDTzutYjNuAQ=; b=uwMCD0DjkNFJ8l
	g/5TS0Q6VZt3I2NYf+8FNfpqnngS8SX/ujfrI+0clTj1pcL9HYbkrwlHwztB0bFJkxbndRNPsXXda
	j3biPZs3hnqU/16U7KTILcZhoI1/E6c/Pqa9uvckrsMrhnUWt3pYxPIAonQdF2wk5eaDHxNHQ5Nuu
	iRdj148TCay8pdICmo+Ef/3E0VS6ZmOBm+mtH6TUyEYbzwf9a1KWsf7VvI9TsT/IrZS1whFa2r5/Z
	pUuc8K1jqEVl2qIyIShPAYzWKAptOYXlXMehH0Z/IVaQ3d7nSdsRrhPLsP579Y2EJUe+h3NZTqQuP
	SmDsxikFR4OF1XjK4qnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEAhM-006cIi-Ez; Sun, 30 Jan 2022 13:56:56 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEAhI-006cHl-PK
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 13:56:54 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 71969B8290F;
 Sun, 30 Jan 2022 13:56:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 740B9C340E4;
 Sun, 30 Jan 2022 13:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643551010;
 bh=1sPl3NSM08VjPi9+rS/IUYV3N8w8NQxRz2BnPpJHYRc=;
 h=From:To:Cc:Subject:Date:From;
 b=Fa19yYcmL2D6j0iZ1MqkcwSu6GVV8dCMFIjWd1467v45ZZiL5vnTB1YOY2BP43lkb
 MTxpLJe9h4JNpzMa7NXZg/BmHitqI9tE7hXQlncpnCbUfWi0lsS/AxPhP8tw7QC2hM
 x4AlaWTk1cBjaryuJ/iydpBOrNtQwqwr40Yzyhsleq1bkIJIhCRREsCoItQDrmW1Ff
 cCLOXTmyHhfZZs7/qb2ZePatuHCgzyYgZHuTBCAmRDRRAhF1rp83N136qSUtzVxntr
 bhVqbyIiISGCr70/rdLa3oa7s7R66f4k/HW2DOQK3MjYkHwT4wMG9oq+DLl10yHYD4
 7EtatdJupPAYw==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V7 0/2] Add thead,c900-plic support
Date: Sun, 30 Jan 2022 21:56:32 +0800
Message-Id: <20220130135634.1213301-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_055652_991394_629BD82C 
X-CRM114-Status: GOOD (  10.09  )
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

Changes since V7:
 - Remove /proc/interrupts display part modification

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
  irqchip/sifive-plic: Fixup thead,c900-plic DT parse missing

 .../sifive,plic-1.0.0.yaml                    | 21 +++++++++++++------
 drivers/irqchip/irq-sifive-plic.c             |  1 +
 2 files changed, 16 insertions(+), 6 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
