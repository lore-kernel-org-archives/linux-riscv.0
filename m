Return-Path: <SRS0=HRg9=H7=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75C82C433E0
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:19 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 38E5864DFB
	for <linux-riscv@archiver.kernel.org>; Mon,  1 Mar 2021 14:30:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 38E5864DFB
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xWYI2YPnWE1kBEL1laaVx7oGtstyqmY8+cLyQp5LATE=; b=iMOGg3NlbSOA0NBcWc6w/EqCCK
	HFxBgVFAtlMuTL3i0Heu9OBNNxSOHH+/jEb2rSZtt5f37WOo8yJomV0uhAGD4YmQ+/8UBSQ9FYFzC
	hJVECRFKCSf9QtkEee5Sd3aDCr+qIdGs5TyP9Yfu4+kzQjI6OiRlUbbSwjIlNQy3ZeQ/HmHTvcm3k
	TzAT0nOtEpBFmdMqkp0OoutcfKpsuithLt23NoJ4+GqHvAQSysv6We7OYpQ6JDJbZul+8sQFy331A
	U+lZHprECosmlPxc+vyhcl0WocVZnEtWE3ODBP4d1YSDcOuj3E3ttUCVZaHi6o2f3C6z9qGez59mh
	Y4LCjX5w==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1lGjYj-0000cL-K4; Mon, 01 Mar 2021 14:30:05 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1lGjYg-0000af-SF
 for linux-riscv@lists.infradead.org; Mon, 01 Mar 2021 14:30:03 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 5331D64DF5;
 Mon,  1 Mar 2021 14:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614609001;
 bh=yJODrusALU+6lGK3sTBTBJlwkQywsg5kKkp+JdY5FlY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=GT4Zb990BBV21L5216of6GW7Ifg/KewOZqZ9YV3HlxJ91EG1P2uadJ68FjQf+nMnD
 2GLHjGQMPDubUtQqe2x3Rd0B5zWnys94b5cc2dwQ6cYEGDxSDIV4krPFuwM9ypW8Gr
 uBisMEypw1sy19olWb4jIqD1bvR9Rd8V5ucmvLnVKBkIrzLrPX0pd8mwaQn3StSjWU
 YQzjDC50XFYq9j5Qqmb9/xFiwxYS75+nR8df/9OnsSdO1jv6rrGaz8fB1lnkEIR+hI
 aj1Y+f3pwrcDNzmaS3BRR3r4zhkX3i1quWyPVPrsqXHZBVs/htwPyO+9w5hnPjZmiR
 G7CUfzABALFjQ==
From: guoren@kernel.org
To: guoren@kernel.org
Subject: [PATCH 3/4] clocksource: csky: Using CPUHP_AP_ONLINE_DYN
Date: Mon,  1 Mar 2021 14:28:21 +0000
Message-Id: <1614608902-85038-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1614608902-85038-1-git-send-email-guoren@kernel.org>
References: <1614608902-85038-1-git-send-email-guoren@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20210301_093003_071591_DE013C54 
X-CRM114-Status: GOOD (  12.57  )
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
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org,
 linux-riscv@lists.infradead.org,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Guo Ren <guoren@linux.alibaba.com>

Remove C-SKY clocksource custom definitions in hotplug.h:
 - CPUHP_AP_CSKY_TIMER_STARTING

For coding convention.

Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Tested-by: Guo Ren <guoren@linux.alibaba.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Link: https://lore.kernel.org/lkml/CAHk-=wjM+kCsKqNdb=c0hKsv=J7-3Q1zmM15vp6_=8S5XfGMtA@mail.gmail.com/
---
 drivers/clocksource/timer-mp-csky.c | 4 ++--
 include/linux/cpuhotplug.h          | 1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/clocksource/timer-mp-csky.c b/drivers/clocksource/timer-mp-csky.c
index 183a995..fc17d77 100644
--- a/drivers/clocksource/timer-mp-csky.c
+++ b/drivers/clocksource/timer-mp-csky.c
@@ -151,11 +151,11 @@ static int __init csky_mptimer_init(struct device_node *np)
 	clocksource_register_hz(&csky_clocksource, timer_of_rate(to));
 	sched_clock_register(sched_clock_read, 32, timer_of_rate(to));
 
-	ret = cpuhp_setup_state(CPUHP_AP_CSKY_TIMER_STARTING,
+	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN,
 				"clockevents/csky/timer:starting",
 				csky_mptimer_starting_cpu,
 				csky_mptimer_dying_cpu);
-	if (ret)
+	if (ret < 0)
 		return -EINVAL;
 
 	return 0;
diff --git a/include/linux/cpuhotplug.h b/include/linux/cpuhotplug.h
index f60538b..7f25b44 100644
--- a/include/linux/cpuhotplug.h
+++ b/include/linux/cpuhotplug.h
@@ -131,7 +131,6 @@ enum cpuhp_state {
 	CPUHP_AP_MIPS_GIC_TIMER_STARTING,
 	CPUHP_AP_ARC_TIMER_STARTING,
 	CPUHP_AP_CLINT_TIMER_STARTING,
-	CPUHP_AP_CSKY_TIMER_STARTING,
 	CPUHP_AP_HYPERV_TIMER_STARTING,
 	CPUHP_AP_KVM_STARTING,
 	CPUHP_AP_KVM_ARM_VGIC_INIT_STARTING,
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
