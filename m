Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14305C433F5
	for <linux-riscv@archiver.kernel.org>; Tue, 15 Feb 2022 15:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=y6bCfP+2Guydd+i4mzbeyxO3z8EI8GUuCFsO0o4pYWY=; b=QEQbAHh59pqKsF
	vqpQOVNoZsyIHQt5A4o7jW4lu4yk+FsRF1Uu5Cgs60ngCzyOszdfOnTXAujNEnb6eqPapaAPlIwhV
	sBkM6X5RE6tdN6nJH5QHtIc8XI43YGkMap0mTFl4QSXLFplWvtj8nRjLyigYPtcsK7TzZ/4UfP8K7
	Hnz1ot5Dz9noveK6oJojbN3535Eh26D3WdSyGSM7fY4pMFnNlWJNJDSFD6SiJyp7oUFamqKz1VNqN
	gpjR3ecWl+PkoQG9lmMPHAQ9/GSQ0K5krmYlLYH1MjJ/pmYH1XSBAoBRdIpzCfbJnWoZp0IWsZOsJ
	bPxaqdi7QPwdhstSVySw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nK03j-003QIL-Gl; Tue, 15 Feb 2022 15:48:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nJzmL-003HUw-Jj
 for linux-riscv@lists.infradead.org; Tue, 15 Feb 2022 15:30:15 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id C0D97B81AEA;
 Tue, 15 Feb 2022 15:30:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 292D6C36AE9;
 Tue, 15 Feb 2022 15:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644939006;
 bh=IN67m1B3ZHGoI5hJjuFTOuQe6kviWvaaiA1kqxlzm1w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dwDQXcMU6eDQgkW0sALoD4AJL7X9JWTtEK0lQEC9jtVuHVWlUWzb5gV8F3YMu6gJI
 etCaLXG1yMZAS5uT801TAmXeDTaTXxHXxFh3sNSYdEc5eiL+egGCUb8vefKuIfkys1
 iYceBNIhXmiwvnMsfvLb+x0KZoxI0a9KbTKjPg/Lisq3UH0P9dKshQKLDsw4OUp9w1
 XrEkT42t1ITV6Po16MQghYCv6zni5QnhXqks76rbjSBA6aXya9bN3gfDcIPafiK378
 LxXkRsSHxliHA8opB00BiOVpPOuLHpnQ70co2IM+RZzIet4kBLMvBv/S1/a1GOIdMT
 M0hVfxj0cr0Cw==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: Guo Ren <guoren@linux.alibaba.com>, Anup Patel <anup@brainfault.org>,
 Marc Zyngier <maz@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Samuel Holland <samuel@sholland.org>, Thomas Gleixner <tglx@linutronix.de>,
 Sasha Levin <sashal@kernel.org>, paul.walmsley@sifive.com,
 aou@eecs.berkeley.edu, linux-riscv@lists.infradead.org
Subject: [PATCH AUTOSEL 5.10 05/23] irqchip/sifive-plic: Add missing thead,
 c900-plic match string
Date: Tue, 15 Feb 2022 10:29:39 -0500
Message-Id: <20220215152957.581303-5-sashal@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215152957.581303-1-sashal@kernel.org>
References: <20220215152957.581303-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220215_073009_875185_E8FF0241 
X-CRM114-Status: GOOD (  12.55  )
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
index 926e55d838cb1..bd99ee0ae433d 100644
--- a/drivers/irqchip/irq-sifive-plic.c
+++ b/drivers/irqchip/irq-sifive-plic.c
@@ -400,3 +400,4 @@ static int __init plic_init(struct device_node *node,
 
 IRQCHIP_DECLARE(sifive_plic, "sifive,plic-1.0.0", plic_init);
 IRQCHIP_DECLARE(riscv_plic0, "riscv,plic0", plic_init); /* for legacy systems */
+IRQCHIP_DECLARE(thead_c900_plic, "thead,c900-plic", plic_init); /* for firmware driver */
-- 
2.34.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
