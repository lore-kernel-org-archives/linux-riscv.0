Return-Path: <linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 435AAC433EF
	for <linux-riscv@archiver.kernel.org>; Tue, 28 Dec 2021 06:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=FdPq69Yz6GL/KYVWDg/2hKfG6lQ3AfpbAXTV51X5NXo=; b=y2BPD5t8NaFF0T
	sV6VatoKnzdnQW870ioGqxz3xROYgSFjwmJ2kEAv9OY9OC2Uf0UtCyj/MS2QG+BONkwSeJI3pTLBr
	aLEkD7G6hGjVimaawED4eDPekrnbmTQvqh3S1Y0L+W6YjEY0rSy26FZWcbRr6C3nO2POSvom6nI26
	U5WL5IXkDBZhnjRCMoSvS7nnkKfilwMqjpY383sw0L2qxAPZkUAP1qN23W423kfI1ojPFAvqz+UWZ
	TLhltfwH2f8lR30nbaqE4mD6mH3MiztBXpKbwsfqA1shWXFyMJzZKJlzUFk/x0u9YExRVUwMKXTmi
	CKfSR3zDu3P1TT2RkwLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n26HF-000Gqk-EH; Tue, 28 Dec 2021 06:48:05 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n26Gy-000Gjl-Mq; Tue, 28 Dec 2021 06:47:50 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 314F7B8037A;
 Tue, 28 Dec 2021 06:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7A1C36AE7;
 Tue, 28 Dec 2021 06:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1640674066;
 bh=ZzI/rT6HKZOmA3Y4x1O+3DsxjIlTfEeyQcm8s1mUUVE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=NokJf9tmUbdIp5UDLg7WM0oBeqP2Nwu/Dym+Hdt3GkgzafDDNY71qx4KtSbtFjyyf
 6HWp1ND24SW0rU05VIU7YtOG3wBfG6xAcSB5fOeFGwkwWeugtjMlOaKoF1UrMVMzTq
 FKf5yCBT8eGWR2D2Zvb+7tsVSRr/dBxRDRmlNf6CXPkL1R/GI2cfDRkSRaqXE+5bu1
 zDKXKWbqeoLBia3uM0A5jv9qJN2XkTQ1JYcxND2saZsSg23kp0mhTHUPsggbJxOn/r
 az4hMwxzy+Db/fMMa27vEJdjDGRnUgICZwcKeBYrMvFSbT9jhHk74r/Hae4FMgYx/H
 OR2yiPXSCC7pw==
From: guoren@kernel.org
To: guoren@kernel.org, will@kernel.org, tglx@linutronix.de,
 benh@kernel.crashing.org, arnd@arndb.de, mingo@redhat.com,
 peterz@infradead.org, juri.lelli@redhat.com, christophe.leroy@csgroup.eu,
 hca@linux.ibm.com
Cc: linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org, sparclinux@vger.kernel.or,
 linuxppc-dev@lists.ozlabs.org, inux-parisc@vger.kernel.org,
 linux-mips@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 x86@kernel.org, Guo Ren <guoren@linux.alibaba.com>
Subject: [PATCH V3 1/8] sched: Remove unused TASK_SIZE_OF
Date: Tue, 28 Dec 2021 14:47:22 +0800
Message-Id: <20211228064730.2882351-2-guoren@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211228064730.2882351-1-guoren@kernel.org>
References: <20211228064730.2882351-1-guoren@kernel.org>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20211227_224748_902733_A691DFBA 
X-CRM114-Status: UNSURE (   9.86  )
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
Signed-off-by: Guo Ren <guoren@kernel.org>
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
