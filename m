Return-Path: <SRS0=WjcT=PM=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38154C433F5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:42 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D167C60ED5
	for <linux-riscv@archiver.kernel.org>; Sun, 24 Oct 2021 01:33:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D167C60ED5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=wDSgw6/RnMY6TxZWHQUfjwo7uTeKTt5AeOtTihq6bdU=; b=sywy3Y1lPm+yH0
	SrKcmKEEnYmF1ir2oG+AOEwCWN2VU9dbp+0u4YRpm1e9JIBfAlmUgghmhR2Nw/Wg+lWKQTnoW3Sce
	xyMTSSaa6o0C1goU9pAoS9JyyDH07h0+pZG4cedy7EyleCszHLz01knMeN595worskh+g6/kcLhrG
	uhMU6/ae1XdZ+u6xxHqMGSCHc62qNNLmI8hUXjlT6D0XQ4jYBrTeZxZm8oxXbuwEMf/ngeECemheR
	wi0rthhkymVa66MZB1VpmtqnwLKTFdPFpzwO6hKPJ0hCkj1hXLLAfpa5nR1+Ro1rsTrgRW9yFkPbh
	FXiqXYy5nircrLogtxZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1meSNy-00DbYP-Ef; Sun, 24 Oct 2021 01:33:18 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1meSNv-00DbXf-Fn
 for linux-riscv@lists.infradead.org; Sun, 24 Oct 2021 01:33:16 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 64E0A60F35;
 Sun, 24 Oct 2021 01:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1635039192;
 bh=pqe+fXRh/XNopuZBdqpoDaHgTvQEXnDDcjVSXlxVQQ8=;
 h=From:To:Cc:Subject:Date:From;
 b=NyK9Wv9R2p/ve/oETQXlcRHf2PGgEIn3Py1K1blfGOX9dNHaqjRy2yY9efYWjZ2vO
 9NCRZPbnt9HNeArN2m/aCgBGokMqYql/sfVRKi9QQKlHo5KedD3S47ZqfurGwEVGq2
 jpFQonD6VqGdx7M/h26+LE4Dh78s3azD1jk/R/uJRQ31qyEb0CtfOICe1d5MYObpKp
 YwrS0G5fzaAfXdvE6DK6jPOfVSK5UlYcVt9iyjqGf8HwxRCedLBsr5aK1XbPirOSvN
 vDE172b4O+zPYqTW4LJAZT/dU7r6uvKoyAIXuBudMsyMACK2AzQX5e9bG4sZev6i0V
 7WqIrn2dBopZA==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, atish.patra@wdc.com,
 maz@kernel.org, tglx@linutronix.de, palmer@dabbelt.com, heiko@sntech.de,
 robh@kernel.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V5 0/3] Add thead,c900-plic support
Date: Sun, 24 Oct 2021 09:33:00 +0800
Message-Id: <20211024013303.3499461-1-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211023_183315_599597_F4BEEE57 
X-CRM114-Status: UNSURE (   6.57  )
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

Guo Ren (3):
  dt-bindings: vendor-prefixes: add T-Head Semiconductor
  dt-bindings: update riscv plic compatible string
  irqchip/sifive-plic: Fixup thead,c900-plic request_threaded_irq with
    ONESHOT

 .../sifive,plic-1.0.0.yaml                    | 15 +++++--
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 drivers/irqchip/irq-sifive-plic.c             | 44 ++++++++++++++++++-
 3 files changed, 56 insertions(+), 5 deletions(-)

-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
