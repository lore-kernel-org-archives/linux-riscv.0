Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62F85C77B71
	for <linux-riscv@archiver.kernel.org>; Thu,  6 Apr 2023 10:13:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-Id:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=0lzW/dZF32KDmFE1nRUsEtYLtUbJaOXxSblM5cqGZ8I=; b=ICdFAjMReYC1eC
	OPi4RGuI0MZiasPk4buMQxduSTLzay8SXtbt1w4gzR/8zXXBcXwGaPkU02XYf1IifqVgEBNxsO6XQ
	cuxOxzyW3SbTTu9PV2iEdQFJxp9d6bbbYZy7BfVA9E1IUIhxfyvrmMJ5ipEEuT8NGW4rz5kC6IPTF
	HGIdxx3zbcrlb0tU0+4BXuh7O5mqljp+c2eFHWN39MgcrA1vkiNbFOwKE95HWmwa8zk7jmsEYyyOj
	ovyHqoMGHQaav/Efp8kKr7ChQgzjVI4n1VOEjcwGUHp1TLJF30gTx0KY7pRinLvS4DfqO/JeT+cUx
	UvYn1UdGNr5ZDTslva0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMc2-006yep-2S;
	Thu, 06 Apr 2023 10:13:02 +0000
Received: from mo4-p00-ob.smtp.rzone.de ([81.169.146.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pkMbz-006yeG-2R
	for linux-riscv@lists.infradead.org;
	Thu, 06 Apr 2023 10:13:01 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1680775974; cv=none;
    d=strato.com; s=strato-dkim-0002;
    b=nBc+R0hdOQGq4o1N2EDXL8N32BDzEeIr1xELOp5sF9E04anXR/IKXr4FiQKX+xCzH1
    +E5ku4okT75UTeswhJTOiYo3+GlG4kRZQtxPbRefZD8oeFWNJxHY5uOYwpz0MZ92aIUd
    lCYXLbwsKg6G52+4I6y34ghzy6pggiP+2siscOt5oTr49215j7LjH4RRGV31dg61ZBwD
    J7FkQtsKamIXd+2CXA7kix1WsWoEe1MubEeIDKg2R1dTg7NIXK9eEweddj6LUZRM8+04
    Q6FzX9zlJ+OHyvLH4fCEchCgDlhN5x3aSNmrP5TRIKTyTQwhp9FHSD2+tDlGSfHnWoJu
    IUog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; t=1680775974;
    s=strato-dkim-0002; d=strato.com;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=D/j+aw/W3shOmQv0C2duhOHmlQQqdbsfbNfrQfsXH5c=;
    b=ndLpgkiJ3IC2ri4uZzB768ybvWedQ7eIAOQusf65q2sJRNIvGyr0ksnrSNIUKXc3ra
    R88n+cMiiX8ATXfXTH6hvtOjX0r7DQznLK4X4P/tbO/0SYg4gCzgCh4icMYRKeAApd0s
    yzWxjLxgXWsWlLxmGyI6vgNq/FaOzWvZe7sZdWnvph6z05lj9OFGAqYwzfwfhA/9sOZ7
    ZiZSpkaMvqATeCspz8ZahcIjbVY99m2yt4hzT1VLmh3RZTfQYWZFW+uWxda5nNYLCi9B
    V6Pm7chIJ5JMZ1qIQhLmkozDSoS7/U/aEx7xlMi7mGaftRW7wMKl26M0p0TJJApkjUhZ
    NuSg==
ARC-Authentication-Results: i=1; strato.com;
    arc=none;
    dkim=none
X-RZG-CLASS-ID: mo00
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1680775974;
    s=strato-dkim-0002; d=matsal.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=D/j+aw/W3shOmQv0C2duhOHmlQQqdbsfbNfrQfsXH5c=;
    b=Pqg7JqBh6tHK7OjLLXjG+AZPxHXuS7QdORyzBNBBahYdyQVm7dDuxqYfxCBT5Pgv/N
    /bHL/hZ0P+bJyY/FUT38JcoFgYAiQFL4KX9TL2TRnx34R7B1DdjFhKWnq51gxTg05+0w
    TPxktVRL1QGjB/GXwVmCQMMIcohnKWhTe7uM0oTfySXaotvNPk8IHiHyHLIGrMvBQOhw
    Vv3EIahtLRFhOiUDO9SyoqbdRv86D70XpcLO7jYDPMtoTiybnPbNp97OKt6MM6KLV5Xd
    7rS85oj4t1mpZnHsIz3vHfR+xr6hfJVOBrMMEXvOEazChbPM7l+IqwuoJp5G+LraVs4A
    UAwA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; t=1680775974;
    s=strato-dkim-0003; d=matsal.de;
    h=Message-Id:Date:Subject:Cc:To:From:Cc:Date:From:Subject:Sender;
    bh=D/j+aw/W3shOmQv0C2duhOHmlQQqdbsfbNfrQfsXH5c=;
    b=Mgj/tVr2ytJfwNr/SV8bqjj+Kv48u4EyBS3nf5QF7aXcYgwVSnogL2pmAMXe5CbE1K
    Yru4oSTvRAsMSO1b4tBA==
X-RZG-AUTH: ":IW0QfUm7NezzNQ5osAhLM1umwWvsEbiUz2EFIybcN0GbouAcRcs36+XQ+PXmbrHj0IHceHHJihaxy8GlOKeM+n1nTMe0OswSsTIcZomt"
Received: from device2.fritz.box
    by smtp.strato.de (RZmta 49.4.0 AUTH)
    with ESMTPSA id 6644bcz36ACsCN7
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
	(Client did not present a certificate);
    Thu, 6 Apr 2023 12:12:54 +0200 (CEST)
From: Mathis Salmen <mathis.salmen@matsal.de>
To: linux-riscv@lists.infradead.org,
	palmer@dabbelt.com
Cc: Mathis Salmen <mathis.salmen@matsal.de>
Subject: [PATCH v2] riscv: add icache flush for nommu sigreturn trampoline
Date: Thu,  6 Apr 2023 12:11:31 +0200
Message-Id: <20230406101130.82304-1-mathis.salmen@matsal.de>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230406_031300_101782_4FC8F6AD 
X-CRM114-Status: GOOD (  12.04  )
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
V1 -> V2: Added local variable for readability.

 arch/riscv/kernel/signal.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/signal.c b/arch/riscv/kernel/signal.c
index bfb2afa41..dee66c929 100644
--- a/arch/riscv/kernel/signal.c
+++ b/arch/riscv/kernel/signal.c
@@ -19,6 +19,7 @@
 #include <asm/signal32.h>
 #include <asm/switch_to.h>
 #include <asm/csr.h>
+#include <asm/cacheflush.h>
 
 extern u32 __user_rt_sigreturn[2];
 
@@ -181,6 +182,7 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 {
 	struct rt_sigframe __user *frame;
 	long err = 0;
+	unsigned long __maybe_unused addr;
 
 	frame = get_sigframe(ksig, regs, sizeof(*frame));
 	if (!access_ok(frame, sizeof(*frame)))
@@ -209,7 +211,12 @@ static int setup_rt_frame(struct ksignal *ksig, sigset_t *set,
 	if (copy_to_user(&frame->sigreturn_code, __user_rt_sigreturn,
 			 sizeof(frame->sigreturn_code)))
 		return -EFAULT;
-	regs->ra = (unsigned long)&frame->sigreturn_code;
+
+	addr = (unsigned long)&frame->sigreturn_code;
+	/* Make sure the two instructions are pushed to icache. */
+	flush_icache_range(addr, addr + sizeof(frame->sigreturn_code));
+
+	regs->ra = addr;
 #endif /* CONFIG_MMU */
 
 	/*
-- 
2.40.0


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
