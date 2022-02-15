Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42169C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 15:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Wm+Sw3fk0v5wnM43KkMVtIJt0kQo2Nkh1DrkczIijP8=; b=Ku58g0zTGA0tVQ
	RRPw+HS6VAMi4bACxYxDuyjFmwIsUwBumau/Rx6CO/+lwlYBjQLoM/z1nuqAlu7NMJkNfcDItA0NH
	OEII+Cqd+fFwIaX6mZq1sQK5X/2Rw51sBk4KFkwtn3/j0dBo3oJqNIJ2PuxG4AOimPdPt6OoZlORd
	TdNLNMFtlZwlp7kD5xnr/ccNfBfskPgW6VvpJiLDaiSBJTtaYVlxU54eOpTOL5a5hGK/DTvkI1SXP
	anRm0aueAeZfhi76cQLF5Wsh2dHXVG8A2HxrevswYZL0H9RAyR23ml+lDzTODxTO6X22nGZS6ULFn
	TI5HERjWG4oo84hyuqiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK0Dp-003V8P-Jt; Tue, 15 Feb 2022 15:58:33 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJznO-003I0O-2u
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 15:31:20 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id EE0D0B81AEA;
 Tue, 15 Feb 2022 15:31:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F732C340EB;
 Tue, 15 Feb 2022 15:31:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939070;
 bh=mkpPlGw8hV9sNXnauUZO4avIHLUkgLetqvwpAsmGNJQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ehO/QHXSL+AeY0CZCTFVcgdhoyPosutynvSwIB7oiELtJVzYomBngu1ib/Dysazyu
 NMcT5I6PoTsmFZp5ynlLHmkOkcRpgazI7727cvBRhUHVSfYrB1V9VhPEyf5xwKvENe
 ZHqiOGaBjpvxg5Jz2pjJh7swlgzvBbbHeVI4R6aHSRyOtjQZnSb+xxJdzDsTb0ucjz
 Hq/lkEi9wIcdTZZPok3Vf1fOvazG+KihcE/5oNtl6hNHBAqd5Zd72HMT65icoFnTW+
 eoYPEfPMICy6yt/kxjIWr8AE06trqn6QR32RUIa8ssf1ToQ2T7bRUe3AiBlGqX5+/m
 RyDg7bbtS+I9w==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sasha Levin <sashal@kernel.org>, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 4.19 03/11] irqchip/sifive-plic: Add missing thead,
 c900-plic match string
Date: Tue, 15 Feb 2022 10:30:56 -0500
Message-Id: <20220215153104.581786-3-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215153104.581786-1-sashal@kernel.org>
References: <20220215153104.581786-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073114_573146_3DAD000F 
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
index 532e9d68c7042..767cdd3f773bb 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -258,3 +258,4 @@ static int __init plic_init(struct device_node *node,
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
