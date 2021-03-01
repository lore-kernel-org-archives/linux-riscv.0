Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8159C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:03 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 80D3564E01
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 80D3564E01
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEKlEqhx6VyqZVzFQQwVTjjtD0wnI3Q2Em6RoO1gLN0=; b=jSmGo/9q9F2R0u3qDTnay6nKRg
	2wizraCowuoYrXyllVgQdJjz9mio3XEkDOrNq9kMrvQoID9yFsEkDMbC/Lla27juYNEabXQi/32lT
	SgaQEuaydQoNlJoUjImkQPeeQIXP/PkXPyH4YKza4/w6uJVt9IaotxM30P73VkoaVWR2mUjXb3ims
	D6vMLG8pGiOXnUjKCrW1iy9MsWk5ycuuOLADW7mufrYXaiajxaP23NyNeKI9tVO/YbnqGWxugkqgx
	b6xmj2s4cN6IH6sb/Jzw0pOwYhk4COaNWCprPMnaUhXRCBFf0TSHjWAqFTjDqZWmAcXE2RMIHVSh/
	kGGlKK5Q==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjYR-0000WG-TE; Mon, 01 Mar 2021 14:29:47 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjYL-0000Ts-JO
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 14:29:45 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 4874164DA3;
 Mon,  1 Mar 2021 14:29:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614608980;
 bh=OArrRIuC6qn8rHGJqrdoBqnUGJ5tnNzIJ9KKzMe2piE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Hu91S+8zTjYMGojrOYDPV5ZNI3asCKh/MSTSyMNzUKh4vy4hwLNcdt49KpGgVh2Ca
 OBE8dcgLFkgW6xVO2cL5N+IvQB4zUsZNzoATofycfRe4/eMqNi+G2PXv2pKa2Z9T9r
 2OU8R6nNttlvksUmWuKwUx0i40u+lcjZQot85JTuYim9QhK+dVMzqK+1/9vvwxNkTJ
 V1MD+HO+V8BPs85pLyKHxDkncBO40y0yrVq77LdiIObDQuksCfHnI2STLzFYbffNgz
 0euFHxT3oOgNlyVX3DjHNAPKoY6TBEUTqf21oYO0CxDSTDUNJ2gwvE9cCu9WnD7s4/
 eUhDtb7ND4lFA==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH 2/4] clocksource: riscv: Using CPUHP_AP_ONLINE_DYN
Date: Mon,  1 Mar 2021 14:28:20 +0000
Message-Id: <1614608902-85038-2-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614608902-85038-1-git-send-email-guoren@kernel.org>
References: <1614608902-85038-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_092941_798984_321003C6 
X-CRM114-Status: GOOD (  13.91  )
X-BeenThere: linux-riscv@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <linux-riscv.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-riscv/>
List-Post: <mailto:linux-riscv@lists.infradead.org>
List-Help: <mailto:linux-riscv-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-riscv>,
 <mailto:linux-riscv-request@lists.infradead.org?subject=subscribe>
Cc: linux-arch@vger.kernel.org, Guo Ren <guoren@linux.alibaba.com>,
 Arnd Bergmann <arnd@arndb.de>, Peter Zijlstra <peterz@infradead.org>,
 Anup Patel <anup.patel@wdc.com>, linux-kernel@vger.kernel.org,
 linux-csky@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Palmer Dabbelt <palmerdabbelt@google.com>, linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Remove RISC-V clocksource custom definitions in hotplug.h:
 - CPUHP_AP_RISCV_TIMER_STARTING

For coding convention.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Anup Patel <anup.patel@wdc.com>
Cc: Christoph Hellwig <hch@lst.de>
Cc: Palmer Dabbelt <palmerdabbelt@google.com>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/lkml/CAHk-=wjM+kCsKqNdb=c0hKsv=J7-3Q1zmM15vp6_=8S5XfGMtA@mail.gmail.com/
---
 drivers/clocksource/timer-riscv.c | 4 ++--
 include/linux/cpuhotplug.h        | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-riscv.c b/drivers/clocksource/timer-riscv.c
index c51c5ed..43aee27 100644
--- a/drivers/clocksource/timer-riscv.c
+++ b/drivers/clocksource/timer-riscv.c
@@ -150,10 +150,10 @@ static int __init riscv_timer_init_dt(struct device_node *n)
 		return error;
 	}
 
-	error = cpuhp_setup_state(CPUHP_AP_RISCV_TIMER_STARTING,
+	error = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 			 "clockevents/riscv/timer:starting",
 			 riscv_timer_starting_cpu, riscv_timer_dying_cpu);
-	if (error)
+	if (error < 0)
 		pr_err("cpu hp setup state failed for RISCV timer [%d]\n",
 		       error);
 	return error;
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index 14f49fd..f60538b 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -130,7 +130,6 @@ enum cpuhp_state {
 	CPUHP_AP_MARCO_TIMER_STARTING,
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
-	CPUHP_AP_RISCV_TIMER_STARTING,
 	CPUHP_AP_CLINT_TIMER_STARTING,
 	CPUHP_AP_CSKY_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
