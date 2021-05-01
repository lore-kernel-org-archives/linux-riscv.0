Return-Path: <SRS0=1eEn=J4=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1E171C433ED
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 18:54:49 +0000 (UTC)
Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1C2A461449
	for <linux-riscv@archiver.kernel.org>; Sat,  1 May 2021 18:54:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 1C2A461449
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=czerwinskis.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=desiato.20200630; h=Sender:Content-Transfer-Encoding
	:Content-Type:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LEgFbONFX+xO+nNoWrWdBtlC/4iN8xsh+pif53dr0GU=; b=GzWU756KiJc5MjP3i2SefZOc4a
	8HaLzxtjV9LUBLTNByaxEhCUcigA/RPobNgHVHIvap878je95W7Vfx8rM4XeUvEQeBRbrNua6e89s
	OjyGXBdNVDAQIelqXoQfXnF+AoXhdYckB97X0FfnPmWQPDxsQwxM5BctHLY5DXYoPqtPLK4Un5IXD
	tWrb8Rwk7tIKkTXbOVftCfrZ0+gQHlXmVMaJVa0a8t7qbweOb7m8caHpBgRURs9CpAC3L+KucJVGs
	AuBe7xr3ZLIAoIaXpXZ50U4rOVLMgYN0yFn5qMQ0cy7wytF+MdNmO/VQu2FiRU9xlRcMJaFsEMQ84
	s8HVchzQ==;
Received: from localhost ([::1] helo=desiato.infradead.org)
	by desiato.infradead.org with esmtp (Exim 4.94 #2 (Red Hat Linux))
	id 1lcul8-00ATsF-IZ; Sat, 01 May 2021 18:54:34 +0000
Received: from bombadil.infradead.org ([2607:7c80:54:e::133])
 by desiato.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcul6-00ATs1-Sv
 for linux-riscv@desiato.infradead.org; Sat, 01 May 2021 18:54:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=Hd+/GMAf0E8g7s3LvqH+7bwCHtpGRzX8EOfR3h4HV/o=; b=SGkJojxmHbaspI5yaMKG8Y/Foq
 1iY4/aMpHET/Ia/qqcNjOckuXfZQHAgFg6uUGGYOGwsztw6TkjKZUKoaIc7GeViQUMDR4zr7RxGB3
 EHQCYczx9KpaQLGtWwwREuyiaRZDY3RAWhZFUV4RlBxwJiE2av59EkanF4dKZnzGos1bMe1VaUD+d
 qpMdD1N6ML0E6iNmTFYrKIWz5BBiku/8bee94iDYshCv/w82GbAFyTGwQBTLVJw7R4ESZSTZ2/ezT
 zDVYq14HSNwpnMMUIaTBrSUHPDGYHqciGxQqbwLkQXyWPO+1fj2IjcYLI1jmuTNEDQbwmQuJjBvWN
 ADKdW4xw==;
Received: from magratgarlick.emantor.de ([2a01:4f8:c17:c88::2])
 by bombadil.infradead.org with esmtps (Exim 4.94 #2 (Red Hat Linux))
 id 1lcul3-0026mI-W6
 for linux-riscv@lists.infradead.org; Sat, 01 May 2021 18:54:31 +0000
Received: by magratgarlick.emantor.de (Postfix, from userid 114)
 id 65769120F47; Sat,  1 May 2021 20:54:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1619895263;
 bh=e7rCh90rZZgFeh4gn5fNCjabN3K7lSFpJBuAcnBXwxE=;
 h=From:To:Cc:Subject:Date:From;
 b=PPT7UJKnXoUo0klTkbmp0o5qPS9FtLiMOyDmLXA7sR19JGM+qnFnBLtVTFUDgPDRF
 1YLkzljGz3rKOxCjhKnDqC/mEgMNzCrrf5nG3Kcj3oRQgx2n5Sz84OadK2++fm8CW/
 emPTyVuVacMi56Umlq77nM4GgUfr9e6HVNGon7NY=
Received: from localhost (unknown [IPv6:2001:9e8:7b:7102:c0d3:dbff:fefe:ff70])
 by magratgarlick.emantor.de (Postfix) with ESMTPSA id 659FE120F46;
 Sat,  1 May 2021 20:54:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=czerwinskis.de;
 s=mail; t=1619895259;
 bh=e7rCh90rZZgFeh4gn5fNCjabN3K7lSFpJBuAcnBXwxE=;
 h=From:To:Cc:Subject:Date:From;
 b=WZX3eEW73571WxDiJLWDZwCw+fe11/NmWMmXfwLv637dJ0LIidE67rvc/+2kvnNQ4
 r6+XugjIlilc9TlY482wJbvxcHuKhOZg3ykgDu8nFv0/+tf+I+0lp+9Y5StMuHwmLw
 LtB+GeTpFq0amdzteJD5HuBepmIpzQG4+gUy4MKM=
From: Rouven Czerwinski <rouven@czerwinskis.de>
To: Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>
Cc: kernel@pengutronix.de, Rouven Czerwinski <rouven@czerwinskis.de>,
 linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [PATCH] riscv: remove unused handle_exception symbol
Date: Sat,  1 May 2021 20:53:58 +0200
Message-Id: <20210501185359.64043-1-rouven@czerwinskis.de>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210501_115430_303925_6BD23BA9 
X-CRM114-Status: UNSURE (   6.35  )
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

Since commit 79b1feba5455 ("RISC-V: Setup exception vector early")
exception vectors are setup early and the handle_exception symbol from
the asm files is no longer referenced in traps.c. Remove it.

Signed-off-by: Rouven Czerwinski <rouven@czerwinskis.de>
---
 arch/riscv/kernel/traps.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 1357abf79570..6810fc9c775d 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -25,8 +25,6 @@
 
 int show_unhandled_signals = 1;
 
-extern asmlinkage void handle_exception(void);
-
 static DEFINE_SPINLOCK(die_lock);
 
 void die(struct pt_regs *regs, const char *str)
-- 
2.31.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
