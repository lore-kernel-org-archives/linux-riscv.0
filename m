Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD224C433FE
	for <linux-riscv@archiver.kernel.org>; Fri, 18 Nov 2022 10:45:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OTpsg3HRm8nwEjYaAPJEAJCUK01+dR2rv8hZns34Lsc=; b=N0fsvQsIXtc9b2
	lX2BMXtvrraKn3UNQYWU97e64xrXGtCEIpusEjhlFxCPWoeLhCXapwHr7o21htyLgtRqjE4vZFYIn
	PR997tYQDN8kANdqH+AeeYPtdY37tkI/9OKIa56u5mnnYf0sFi2ASbgDRs2bFhISddOxrM7jM58nW
	OB2RRiwW8wIDh6wPOFgRwUCxJK+z4DolQcvlVvCWqEEIEzE4LkVxN9NlYR9rh43aOKUedrp8sltu9
	YcMdDsTrPCr/Oi//nE2GRZZODfpCiYYCG3OxgQVoapp/Akq+mXqEgQeb+GYoDQHynS3lzJwj0TW3P
	5osjarqlDErpXvkl6krQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyre-003S08-L6; Fri, 18 Nov 2022 10:44:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1ovyrX-003RvN-LB
	for linux-riscv@lists.infradead.org; Fri, 18 Nov 2022 10:44:49 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 426436242A;
	Fri, 18 Nov 2022 10:44:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C49D1C433D7;
	Fri, 18 Nov 2022 10:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1668768286;
	bh=qC6743542xIKRAllyvxVqizsE1tEzX1YRdfQ4vU+JYg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YOv+280w2fVSZVzyZ0o2P0ElyXNHGc0WTNYaN6JNcI4R0rr3HXW8KbYMvQ0i+s/mA
	 ds1/4ELX0y2QerpqCqeaRIYDNblXC7I0T0mYn53IYx4p+2TmV8nPRdyzFzp7lozQDS
	 wIkWDLFmvS6g4KvSriEnPWqZ7WncoWBvBEEKkUJt4t5Qpgq4UBVS41h1cAJRofDrRP
	 E3AIFbIqFN9qOyahhlq5vkjmZE5e/iFO1tINE/JVHFeie+zHRMpjDweog7E11xXmOh
	 DYIiKlSW+x5Rebstuosq2Hx8W78XS2Y9ezFyW0hpquWnP44DN/yH0+h2ElQ3yPUZ4b
	 tThL5vYdXbMJg==
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
Subject: [PATCH v2 2/3] irqchip/riscv-intc: remove user selectability of RISCV_INTC
Date: Fri, 18 Nov 2022 10:43:00 +0000
Message-Id: <20221118104300.85016-3-conor@kernel.org>
X-Mailer: git-send-email 2.37.2
In-Reply-To: <20221118104300.85016-1-conor@kernel.org>
References: <20221118104300.85016-1-conor@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221118_024447_766766_112DBFB8 
X-CRM114-Status: GOOD (  12.97  )
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

Since commit e71ee06e3ca3 ("RISC-V: Force select RISCV_INTC for
CONFIG_RISCV") the driver has been enabled at the arch level - and is
mandatory anyway. There's no point exposing this as a choice to users,
so stop bothering.

Signed-off-by: Conor Dooley <conor.dooley@microchip.com>
---
I'd swear I had an interaction with someone a few months ago about the
RISCV_INTC Kconfig options but I cannot for the file of me remember who.
I hope this patch is not be going back on what I said then...
---
 drivers/irqchip/Kconfig | 11 +----------
 1 file changed, 1 insertion(+), 10 deletions(-)

diff --git a/drivers/irqchip/Kconfig b/drivers/irqchip/Kconfig
index ecb3e3119d2e..4633a549ebbf 100644
--- a/drivers/irqchip/Kconfig
+++ b/drivers/irqchip/Kconfig
@@ -538,17 +538,8 @@ config TI_PRUSS_INTC
 	  different processors within the SoC.
 
 config RISCV_INTC
-	bool "RISC-V Local Interrupt Controller"
+	bool
 	depends on RISCV
-	default y
-	help
-	   This enables support for the per-HART local interrupt controller
-	   found in standard RISC-V systems.  The per-HART local interrupt
-	   controller handles timer interrupts, software interrupts, and
-	   hardware interrupts. Without a per-HART local interrupt controller,
-	   a RISC-V system will be unable to handle any interrupts.
-
-	   If you don't know what to do here, say Y.
 
 config SIFIVE_PLIC
 	bool
-- 
2.37.2


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
