Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5A97C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 15:54:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=nEXZwuuZq+O4s3qmZmM2g/U08l5LnEaiI+NvUGPHfPw=; b=OS7iwm5MJwqpM+
	SoxVOLI6/gkPgsa/PWmzMMKD9mMIm66+zU2nnnGKJRC4QTKYt60mRUKwuTicUPgY0Im7cnDS6m3j+
	f4x4W2ogCs68902vMIAG8F+WIbS/aATkvzMrMNdsf+zQQIeOWZbTzKVud1btWUBKddtjdEkNoXfPJ
	1L1NpjcjoBzJtOtD/fFKdLWpRASdKEWblk8ze6hzcCVenjPSG1cWScwMUHz2eTxoR8y1IQ434BYn8
	gY5Du8PGNzpV0Nrwk+DtL6R5J4y76bebPrQhI/D4iLmA6lduPbSmKl1alr56MMv45FCpWytNTdUl1
	/mMvOHIDXC7wLTV1BaiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK09J-003Sxh-Dv; Tue, 15 Feb 2022 15:53:53 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzmy-003Hqy-0g
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 15:30:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 7D81BB81AF2;
 Tue, 15 Feb 2022 15:30:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCD90C340F1;
 Tue, 15 Feb 2022 15:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939045;
 bh=D+Ib7wkm+pUgHIFpFkgZMNVJA3CmXTMDtP5x7u0Q6fc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=owPH6hmPWgvIdleQTPHeC+UH3qazJQhmAMW0/iHVsMrNXy6srvK6bNgPucWwa8P/h
 7SPgL3FJvp+riQ28IRFTOuC/jW5ikNphqQ3wM3Zluh3ocx4iD7uRJ3lejB5Etk9qTZ
 9t4lJ2NagG2ivfdy6ElShWKv3khXkeccOmqBfwQ3JkwpH6pEuooRKrHkpv8QElJQjo
 JXABGCdDPwIijvOOGNNu6S/SZAlA/euuNZr32qmazsMoCAxuFXgMVBlVfqw8KxnEFt
 zP1LAKG826EQJV8V3Uf9eYQ9jGpmR9g3OFkIHQYkOglLhNDOPKz001AG/Y6YuCUASn
 x4r+s1H0r/NMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sasha Levin <sashal@kernel.org>, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.4 04/17] irqchip/sifive-plic: Add missing thead,
 c900-plic match string
Date: Tue, 15 Feb 2022 10:30:24 -0500
Message-Id: <20220215153037.581579-4-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215153037.581579-1-sashal@kernel.org>
References: <20220215153037.581579-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073048_280394_AE4F3E6C 
X-CRM114-Status: GOOD (  12.65  )
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

[ Upstream commit 1d4df649cbb4b26d19bea38ecff4b65b10a1bbca ]

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
Tested-by: Samuel Holland <samuel@sholland.org>
Signed-off-by: Marc Zyngier <maz@kernel.org>
Link: https://lore.kernel.org/r/20220130135634.1213301-3-guoren@kernel.org
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 drivers/irqchip/irq-sifive-plic.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/irqchip/irq-sifive-plic.c b/drivers/irqchip/irq-sifive-plic.c
index 7cd7b140dfe97..9dad45d928bfe 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -313,3 +313,4 @@ static int __init plic_init(struct device_node *node,
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
