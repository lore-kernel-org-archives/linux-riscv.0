Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B03AFC433EF
	for <linux-riscv@archiver.kernel.org>; Sat, 25 Dec 2021 04:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=u6fnV2HNOo2mlPFDEBp1mf1/UerB6cnkTDb1GpB+HKs=; b=0qr1G3YFYwjY9/
	rvcLTwpjz/l52E5DfRnqmmTZpyrVMmK582e3eMRqJEAttz3tcUPzs+eoLoOurZIq00uvsas3JFjf+
	bcQXeVxCd+upyJTkP6Gf2smSqLXvKuVBMGxhjHByR1gFJLUwHoZV69ssgKBAdGHbju5azClnS5Pzz
	TR4yOs4CmrnXEgQytgzh4lpQoNbqO2Ke9HZmXWy3gCaRlLkXbKsKkm/cQiByj52i67+nEk/nHT3OY
	5Drh5AKc2PLMP54kbbW0MOjfYITrHi3DOWKeNj1zeW8JZyQAAEzx51O7Og5Py9j1fyz8dK9oaRVee
	6rqjK9HltofrGwNENTiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n0z5V-00EdBG-8e; Sat, 25 Dec 2021 04:55:21 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n0z57-00Ed1y-Lo; Sat, 25 Dec 2021 04:54:59 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0849460A6C;
 Sat, 25 Dec 2021 04:54:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7AA4C36AE5;
 Sat, 25 Dec 2021 04:54:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640408096;
 bh=jpwlZy74jLxlc+3k0tEIOwESvdOFLV/hmaQv6rvtTf8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=cTiTOAE/i8mYfhq5M2YknTISehplcyImD+5pTyLaWy6f88ZA8IjjqNZEc+cBp+OqA
 K7Ri9LpvxrcGeRL6lbMnDweGduUWtwQII/NjRuY0iHc/SUgkQWS1V9S1YkDqmCiAdh
 69ylv6NGIaZb2sqKJrUzzJSiV3J5CfMiv8IbFdOozK+K8WdX0HaT1LUlDLt/c2Kssg
 yC+33xAKliaqHiqrrBzUhvQMeEXonINn4OnpDwUGmy9EtKYt3HO1JXBEMK/9FXHhzp
 zfLF4zR/4SS3LV8d868AhDEuqzieDZsjLRJVBvswgJ3Cq7+NuXFB7M/v/nS5ACxqvW
 ToIZu1sCn/CvQ==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V2 1/8] sched: Remove unused TASK_SIZE_OF
Date: Sat, 25 Dec 2021 12:54:23 +0800
Message-Id: <20211225045430.2868608-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211225045430.2868608-1-guoren@kernel.org>
References: <20211225045430.2868608-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211224_205457_935889_7BED49C6 
X-CRM114-Status: UNSURE (   9.51  )
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

From: Guo Ren <guoren@linux.alibaba.com>

This macro isn't used in Linux, now. Delete in include/linux/sched.h
and arch's include/asm. This would confuse people who are
implementing the COMPAT feature for architecture.

Here is the comment by Arnd:
Looking through the git history, I see commit a06db751c321 ("pagemap:
check permissions and capabilities at open time") removing the last
user.

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
Reviewed-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/sched.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index 78c351e35fec..8e5689d06ac8 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -2166,10 +2166,6 @@ static inline bool vcpu_is_preempted(int cpu)
 extern long sched_setaffinity(pid_t pid, const struct cpumask *new_mask);
 extern long sched_getaffinity(pid_t pid, struct cpumask *mask);
 
-#ifndef TASK_SIZE_OF
-#define TASK_SIZE_OF(tsk)	TASK_SIZE
-#endif
-
 #ifdef CONFIG_SMP
 /* Returns effective CPU energy utilization, as seen by the scheduler */
 unsigned long sched_cpu_util(int cpu, unsigned long max);
-- 
2.25.1


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
