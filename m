Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD909C7618D
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 00:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=WhM7dE/8lucGisjalwjYNSARHmd7O8LRmXU+ssi0GrU=; b=JsjrWbKcZ0o9hg
	4B5toQd9WpgG86lUurOVD4JIhW7OVc7Z9/FGntnIXD45TC7QaEs2bjT+Vuc+0ejb6lwaT1cIEOWj2
	WRSmjSci811OL0L7QxCln2FZ0Ne/wNrsqmr21JuiO1/5aMITb9X2CXj64KFodsgjqVZVFxtt1Sbqd
	+cUB3OF4jXkVfoxsrCLHIPix8gysoXLxNGWA9ev3sM0anTH/SVcoWFwZqipEqVcq0dAX/FoAgAAp0
	m18VnrMuw7+vWQlkW/aM6/WQAzRjkDlW0nDlJI9SfRjHqDseh+NDolVO4A7kuUVH6N3bKz5I8IF/l
	2vaGtUbQ35qmukK+9ruw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkDDj-005xRj-2d;
	Thu, 06 Apr 2023 00:11:19 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.25])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkDDg-005xR3-3B
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 00:11:18 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680739871; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=Uzcq4RicHDYCddFmkGyygmGsgCgpHUNZoIaU4YOtq/Vf937nJoLDB+Kh2Qa5Jecf5E
    U7CxnZ3e9GGsx0HGufh0SbqUX3SwM76IelUkNNLlTaEMR9l9L0dlcEKPp6oSIbhMcSHB
    1h/6uZa5JXXO0V+tZEpCy7DaNsjrZTyebnRg+Sj7+Nbtbmqo3xOBbCdRRyllp2QtewcI
    aexTflceFKSfM6FV75a+srecsY8fnhG9Vx0RNOfxa4BV5uEib6PlSEDyANC5EADWKrA8
    bwAhQNIHvLTWQphuTKpfE7xQJQbQkftzrqCLV7g1RDmiQgEBdqcfAyFIUJf/XUkIaOoU
    DlHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1680739871;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=xQAqmH5j/wK2gNhh2P61TwPJkaIwOsShgtjUTTv9s2o=;
    b=LV22J/Y5x95a5wUL2Iq2U1fhtHzmGIjkMZbfLXFcnpXUdc4MRDqw5bkha4uTjbAVk7
    1dAwW8RtK66YKwCwZlCRbEKCgr31QP0IvBqQMzKbTN0bT/lUh59h45KzoqjQ2A8CcudV
    EtWp/Waob1+pn8cHQDjjs1K1DfrIe/2idWq3coVyxKiWQTsGH5lIokclPtZyLtjuZfJk
    Sy43xj9ubflqckQeL3YqlbXMW1jpH5COYYNLZ/eDJyLnjWqO5Op7u4zTUc8oSWh4glWO
    1KjHeVetg1gFlYMGunCD2ONKVI7ZOPqlmzamKSg8kZyas6SD4f85vvcP12dGOj4CMo38
    +3ow==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1680739871;
    s=strato-dkim-0002; d=matsal.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=xQAqmH5j/wK2gNhh2P61TwPJkaIwOsShgtjUTTv9s2o=;
    b=Vo0LMA3m3R8REEaRetDoP+tZjWnKMsD906PnQ0KeQHuJX0EgJr7RB+hC8GfOP2vXAk
    K15209jsHwgQEJI1cmfday2ZNdUNGF53hq/PJp/lzBFZpwsaT39ROwq7rDM03oXQkcIw
    0qxuZhDAyGEjVThK0jFPIf4O+1CNYznMgC/tR6kuvIhFLIIhR3NtSfrEu4GhAYzAwGT3
    XY0OZsaagnFwqtwto5HfmJ9XDIZVbXfkP9SzSE8eB558QPU6dyM2BMKHRlG7Dwpk09u6
    crjgqdUwJIluMY3+u0NmNxiZmGJE/4Fl4n3tCsCT1DLBcfcEaAnuEH/Imj2NL7sOc7r4
    PQng==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1680739871;
    s=strato-dkim-0003; d=matsal.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=xQAqmH5j/wK2gNhh2P61TwPJkaIwOsShgtjUTTv9s2o=;
    b=moUu+dqJDSOXyqiVZMLEnGtcM/Y3BUYWRp0wMrhCpM7iFoG1lIJj0OxWwSam88pRHW
    zIaoRxnFCExgCUOoJNAQ==
X-RZG-AUTH: ":IW0QfUm7NezzNQ5osAhLM1umwWvsEbiUz2EFIybcN0GbouAcRcs36+XQ+PXmbrHj0IHceHHJihaxy8GlOKeM+n1nTMe0OswSsTIcZomt"
Received: from device2.fritz.box
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id 6644bcz360BA9xw
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 6 Apr 2023 02:11:10 +0200 (CEST)
From: Mathis Salmen <mathis.salmen@matsal.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Mathis Salmen <mathis.salmen@matsal.de>
Subject: [PATCH] riscv: add icache flush for nommu sigreturn trampoline
Date: Thu,  6 Apr 2023 02:11:04 +0200
Message-Id: <20230406001104.3361877-1-mathis.salmen@matsal.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230405_171117_461644_802929E8 
X-CRM114-Status: GOOD (  10.47  )
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

In a NOMMU kernel, sigreturn trampolines are generated on the user
stack by setup_rt_frame. Currently, these trampolines are not instruction
fenced, thus their visibility to ifetch is not guaranteed.

This patch adds a flush_icache_range in setup_rt_frame to fix this
problem.

Signed-off-by: Mathis Salmen <mathis.salmen@matsal.de>
---
 arch/riscv/kernel/signal.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bfb2afa41..548703230 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -19,6 +19,7 @@
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
 #include <asm/csr.h>
+#include <asm/cacheflush.h>
 
 extern u32 __user_rt_sigreturn[2];
 
@@ -209,6 +210,10 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	if (copy_to_user(&frame->sigreturn_code, __user_rt_sigreturn,
 			 sizeof(frame->sigreturn_code)))
 		return -EFAULT;
+	/* Make sure the two instructions are pushed to icache. */
+	flush_icache_range((uintptr_t)&frame->sigreturn_code,
+			(uintptr_t)&frame->sigreturn_code + sizeof(frame->sigreturn_code));
+
 	regs->ra = (unsigned long)&frame->sigreturn_code;
 #endif /* CONFIG_MMU */
 
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
