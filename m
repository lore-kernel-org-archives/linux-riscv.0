Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE9B7C433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 21 Dec 2021 17:05:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=OjaoBjFcmq32dxq0wNgLsdgngS//uov3Tg1QS8DUIH0=; b=ieYzNbEChHKfTz
	ADVRUnp7rTcpB1ISyxFZPo5673eR21RoEpLNAQJmrEg8Awb0CRk7zlObCIr6O2yRS2IVd2WN7ZLxK
	JEHNcCnZw4umiVjhGcCTcFrViz4Zx0FlZs/1Zs2cWr/Ht/zfqiKM6LQURYQMVz+Cz+iNTmr0N8gcX
	FwzOg6Bo7DnknqXAT+jNYfiBTIzxzLOvPfDxuftA93kBaCcrwqyqgQyrb3MeXtMmrwgWDLAI7oViX
	IULwUEmGD1KZZyNyueNFlyfGaElZUVKxV+OeG9NgjMXAxXQbNdFO3bppkPzs/m3pu2YFu1yBJ9TOn
	uIJoNhILcyCa9uFKrWQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1mziZR-007gcn-G3; Tue, 21 Dec 2021 17:05:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1mziVn-007est-EV; Tue, 21 Dec 2021 17:01:16 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 01EACCE1759;
 Tue, 21 Dec 2021 17:01:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E02DBC36AF1;
 Tue, 21 Dec 2021 17:01:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640106071;
 bh=Oy/NR31/F+xIHSgTDjx6GQ7Gg7r+DRliyRChxoAHfB4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t+2SY3ctNJy2loFboEsO1g1VwFMmfV1vqCzgFiBIAs+nQOxvy14mfPk6ozxvJiD0B
 eg90VAmLXNGCPOo9oB6vWiAiXtJiBS3aQw6asEkpwbbZRLsh0QbyPMz/5HiCv1MTpd
 IPAajqWSbzXDNhuf5QsWfR4GKqaHvQGOOX8oAUUCadtRsuEsG81hDYcWSXE0SDJfUS
 f3zeqKgVzuacH2+clEiw3G/1gOfpdBu8YvQjO8L5lIRyoAdFqjvTUmDM13Onb0pWlO
 yWXPjHR3GYyfgiGta4BbY4xbA66cojMLT2j8WuuzRs5FsgX8G01zNHESnkL4troWbC
 JU9hzS/5ry9ag==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH 1/8] sched: Remove unused TASK_SIZE_OF
Date: Wed, 22 Dec 2021 01:00:50 +0800
Message-Id: <20211221170057.2637763-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211221170057.2637763-1-guoren@kernel.org>
References: <20211221170057.2637763-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211221_090115_707855_2268C58F 
X-CRM114-Status: UNSURE (   9.12  )
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

Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
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
