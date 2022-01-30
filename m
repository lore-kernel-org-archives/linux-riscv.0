Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BED23C433EF
	for <linux-riscv@archiver.kernel.org>; Sun, 30 Jan 2022 13:57:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=MMdw03yKOQ1h3y+ogqPVopFzeNX0qIji7ivrFb8gGtA=; b=J81kBuTIjnmZNo
	zSbEDtKo4XfBXILMrCatfdWe13rIGHS4tOcsgg+YiCtSdd6xeApN0MaXTsMbTPHV4BMQGL69/TCuF
	ZFfiQO07iXP2D2Miv8vWBmnEKy7F8ZrdC5OdVn00pJo5aQ7FKhHvlWcASMNQSxs3EBqypEuvRx8bI
	TULjir3A71wkPurKrxo7+GZxfRcyEjNKzZBHO2Ctixxo7AqP3eEi9wROdD1Zb/ToTTGGxtbyiyjgc
	Xtbq5J19dfZoVJwhjq6AgrphZfwiRPhKZQb5E/UFVjV3CX+4/oI1HdF6sIgyaUACf52aBy1/wAWRp
	lb5dxLUEQ3oDu6L47+9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nEAhV-006cLa-3e; Sun, 30 Jan 2022 13:57:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nEAhR-006cKL-M8
 for linux-riscv@lists.infradead.org; Sun, 30 Jan 2022 13:57:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id DF3FDB8290F;
 Sun, 30 Jan 2022 13:56:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED348C340F1;
 Sun, 30 Jan 2022 13:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643551017;
 bh=d2YKiYzP01A3mCNJHUZ74cocdKYQgHlJs70hqz+NyK0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=RPfx8A43HO5Np1lZuZnuLPq4FCXdBUZQb23c26v5DJbWOcuusw2mR+LTjUuZTGPYO
 7pbjmL57V8uGn7o1HZjAFImDlAOxZeEeDfBPXCjv7GQ43pgiecsjcpFaHJBMDRtW0h
 sfoC6Np5LVCuZBeU8NNAYzQQGgtqoM2JkUjNl2WGCxJdlpAMQQM/+fqMjQL9sdGPdm
 2hwYbafbVYQbbkOsgzx6ot2Yv5MV2P7LJmDpug6D1pjR3D/+JmcAC+W13DeWitpmKX
 EQgnvajcUUZuGjsXVPvIrDkKDyz2q1G7HWMpwSCQ5oS5iDrTq9FJgCWxx4QTk0W1EB
 uqY1M2Okquq4w==
From: guoren@kernel.org
To: guoren@kernel.org, anup@brainfault.org, maz@kernel.org, tglx@linutronix.de,
 palmer@dabbelt.com, samuel@sholland.org
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 devicetree@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V7 2/2] irqchip/sifive-plic: Fixup thead,
 c900-plic DT parse missing
Date: Sun, 30 Jan 2022 21:56:34 +0800
Message-Id: <20220130135634.1213301-3-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220130135634.1213301-1-guoren@kernel.org>
References: <20220130135634.1213301-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220130_055701_885630_92128770 
X-CRM114-Status: GOOD (  11.89  )
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

The thead,c900-plic has been used in opensbi to distinguish
PLIC [1]. Although PLICs have the same behaviors in Linux,
they are different hardware with some custom initializing in
firmware(opensbi).

Qute opensbi patch commit-msg by Samuel:

  The T-HEAD PLIC implementation requires setting a delegation bit
  to allow access from S-mode. Now that the T-HEAD PLIC has its own
  compatible string, set this bit automatically from the PLIC driver,
  instead of reaching into the PLIC's MMIO space from another driver.

[1]: https://github.com/riscv-software-src/opensbi/commit/78c2b19218bd62653b9fb31623a42ced45f38ea6

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Cc: Anup Patel <anup@brainfault.org>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
---
 drivers/irqchip/irq-sifive-plic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 259065d271ef..09cc98266d30 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -398,3 +398,4 @@ static int __init plic_init(struct device_node *node,
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
