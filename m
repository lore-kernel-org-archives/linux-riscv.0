Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 164E8FEEF2E
	for <linux-riscv@archiver.kernel.org>; Tue,  7 Apr 2026 12:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=s81O3y4D8wRz4LHyeeERelfX64FcRLMikCpaee6VUeI=; b=h4dUEgPWZHEL0g
	TBmTBywwwQrzfmnNN5rS/BtoxMSB8A8FHAMFq2bWzwNuOKdnuYoa4fyovUyfVnTZSiUpyxWLx/yas
	RUkXX8y3sFAv/XgEQkhj5/oT4+0ioYAU/AMZ0xKJ79i4FeMhEClqpVIGDEcLgjRa2M2cbpWuz1r9C
	aSzRA4YoxUpliTCgv0Hx4Y4rStZdzbzRzmhjfcXyn2M0zUnriH5/rANuPX87L2LntVQUc2rEFpvRA
	A548rhoLvYjszyGa7kWreIbWTjvdOXN/8U7AAt7BmdQVGqJdlG74LSYhBoiCSN0056M5gPfHDBeRq
	WqzAj9VvH68HjsDix87g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5Co-00000006Pmd-47Ti;
	Tue, 07 Apr 2026 12:06:54 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wA5Cl-00000006Plo-3rvR
	for linux-riscv@lists.infradead.org;
	Tue, 07 Apr 2026 12:06:53 +0000
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775563610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1WxAkflQW4vh1CMmuU2NUC+nDRJPsXiltCCx8JFiEv0=;
	b=JhpQpVsPJY/J9sqDNhr1+thtc1C1kbv6il82BIGmx+3gu0qUGkmvT2b5ziCEjlDjVTzXx1
	U0aXtdvJcVre4xycnlFUMz859Q8F6GsLacYjBFYRfocia7du7M+cFbNfAEBKZ9OwIMLJDx
	+aC2DxBgSZ9iegJ/Dv/uQlNL5gYZecoBIEligsx3VzKdTdZJl8qxXzsPGzBLgeiJbY9aqN
	J8opgfpLqDgBtaA9Ii4e67gctCcCmclc4TE87RIIRLvIu14+W3RR6QKAbg01C5DONzHPEE
	RRwDf0IB5PH0WujCt+tjvOiWqOrZN7HsqXzuxaVy9gBLeWFE6lL4CzK1MiQs6A==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775563610;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1WxAkflQW4vh1CMmuU2NUC+nDRJPsXiltCCx8JFiEv0=;
	b=UCdwypNzX7nOGP/gPUaP3t7JuDndj8WuReA3Or8tk6C2ya10QIVjGpqHLMXoePukRLgZoy
	0Jokv89Yuw9RHcBQ==
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Michael Neuling <mikey@neuling.org>
Subject: [PATCH] riscv: Fix fast_unaligned_access_speed_key not getting initialized
Date: Tue,  7 Apr 2026 14:06:39 +0200
Message-ID: <20260407120639.4006031-1-namcao@linutronix.de>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_050652_102631_690E2F23 
X-CRM114-Status: UNSURE (   9.48  )
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

The static key fast_unaligned_access_speed_key is supposed to be
initialized after check_unaligned_access_all_cpus() has been completed.

However, check_unaligned_access_all_cpus() has been moved to late_initcall
while setting fast_unaligned_access_speed_key still happens at
arch_initcall_sync, thus the static key does not get properly initialized.

fast_unaligned_access_speed_key can still be initialized in CPU hotplug
events, but that cannot be relied on.

Move fast_unaligned_access_speed_key's initialization into
check_unaligned_access_all_cpus() to fix this issue. This also prevent
someone from moving one initcall while forgetting the other in the future.

Fixes: 6455c6c11827 ("riscv: Clean up & optimize unaligned scalar access probe")
Reported-by: Michael Neuling <mikey@neuling.org>
Closes: https://lore.kernel.org/linux-riscv/CAEjGV6y0=bSLp_wrS0uHFj1S2TCRtz4GKzaU5O-L1VV-EL7Nnw@mail.gmail.com/
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 arch/riscv/kernel/unaligned_access_speed.c | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index 485ab1d105d3..11c781a4de73 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -235,17 +235,6 @@ static void set_unaligned_access_static_branches(void)
 	modify_unaligned_access_branches(&fast_and_online, num_online_cpus());
 }
 
-static int __init lock_and_set_unaligned_access_static_branch(void)
-{
-	cpus_read_lock();
-	set_unaligned_access_static_branches();
-	cpus_read_unlock();
-
-	return 0;
-}
-
-arch_initcall_sync(lock_and_set_unaligned_access_static_branch);
-
 static int riscv_online_cpu(unsigned int cpu)
 {
 	int ret = cpu_online_unaligned_access_init(cpu);
@@ -440,6 +429,10 @@ static int __init check_unaligned_access_all_cpus(void)
 	cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN, "riscv:online",
 				  riscv_online_cpu_vec, NULL);
 
+	cpus_read_lock();
+	set_unaligned_access_static_branches();
+	cpus_read_unlock();
+
 	return 0;
 }
 
-- 
2.47.3


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
