Return-Path: <SRS0=1V8E=AI=lists.infradead.org=linux-riscv-bounces+linux-riscv=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2FA7CC433E1
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 13:58:30 +0000 (UTC)
Received: from merlin.infradead.org (merlin.infradead.org [205.233.59.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E534A21841
	for <linux-riscv@archiver.kernel.org>; Sat, 27 Jun 2020 13:58:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="YGUCObkR";
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="1U9JIwpN"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org E534A21841
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=merlin.20170209; h=Sender:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Cc:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:References:In-Reply-To:Message-Id:Date:Subject:To:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yaqJbBmf1d1hCHvJ5xTmV94CnjF7UgW7jYjhJReFWo=; b=YGUCObkRBcQbMwvNRMEg1MP13k
	RBFNeSp+W8eIgD8g215rCSsfeqXlSA5KBAVORmQDmRS8RMLbHr7LLWoKzYezxX358f+mKto6B7TsA
	T/I4TQ76bH+RzK/G2NbHf1EHF3HRgXlNK8TXg7dC1wpE49SkoBhIAl6BIUjEZde2s+qJs89ozDJQS
	R/bo6ZJPo6fVzGCG9fqgFGSe4eM/jhDlueWGbqP0Wt6Hw8AjRP53nfTXeMs7Q6BLcAv/njEHpV5+C
	SwEyg58UQDGDJz+rWo3knxJs8yneBnelcQEHkKpWNVHLkXCLb/r/RFbFwUDoAzBvEnv6xIGIFqB3J
	iA7u9eHw==;
Received: from localhost ([::1] helo=merlin.infradead.org)
	by merlin.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jpBLc-0002NO-A6; Sat, 27 Jun 2020 13:58:24 +0000
Received: from mail.kernel.org ([198.145.29.99])
 by merlin.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jpBLa-0002Mv-7g
 for linux-riscv@lists.infradead.org; Sat, 27 Jun 2020 13:58:22 +0000
Received: from localhost.localdomain (unknown [89.208.247.74])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CE7E9217A0;
 Sat, 27 Jun 2020 13:58:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1593266301;
 bh=C4CZ/M9ITZrqQHLFJzKFmKmEbF1OrOch6eNdkBtZKo8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=1U9JIwpNBKNId0ocS+ly2ORX2r31nzZUZ96BVG8/7+8oeNW7uvIJ8o4WJIXNIFha3
 IVLaNnWEyIk7EkpJWdh/FfsGa1GIAjWJI4WgtvTjT5KxVou+SfjgWuezFbxFTh8KxY
 Neqp9iQh4IVGT1wUfU/kky3w1rWg5YOXw4vNCkzA=
From: guoren@kernel.org
To: palmerdabbelt@google.com, paul.walmsley@sifive.com, anup@brainfault.org,
 greentime.hu@sifive.com, zong.li@sifive.com, aou@eecs.berkeley.edu,
 tglx@linutronix.de, tycho@tycho.ws, nickhu@andestech.com
Subject: [PATCH V2 2/3] riscv: Fixup lockdep_assert_held with wrong param
 cpu_running
Date: Sat, 27 Jun 2020 13:57:07 +0000
Message-Id: <1593266228-61125-3-git-send-email-guoren@kernel.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1593266228-61125-1-git-send-email-guoren@kernel.org>
References: <1593266228-61125-1-git-send-email-guoren@kernel.org>
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
Cc: linux-riscv@lists.infradead.org, Guo Ren <guoren@linux.alibaba.com>,
 linux-kernel@vger.kernel.org, linux-csky@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-riscv" <linux-riscv-bounces@lists.infradead.org>
Errors-To: linux-riscv-bounces+linux-riscv=archiver.kernel.org@lists.infradead.org

From: Zong Li <zong.li@sifive.com>

The cpu_running is not a lock-class, it lacks the dep_map member in
completion. It causes the error as follow:

arch/riscv/kernel/smpboot.c: In function '__cpu_up':
./include/linux/lockdep.h:364:52: error: 'struct completion' has no member named 'dep_map'
  364 | #define lockdep_is_held(lock)  lock_is_held(&(lock)->dep_map)
      |                                                    ^~
./include/asm-generic/bug.h:113:25: note: in definition of macro 'WARN_ON'
  113 |  int __ret_warn_on = !!(condition);    \
      |                         ^~~~~~~~~
./include/linux/lockdep.h:390:27: note: in expansion of macro 'lockdep_is_held'
  390 |   WARN_ON(debug_locks && !lockdep_is_held(l)); \
      |                           ^~~~~~~~~~~~~~~
arch/riscv/kernel/smpboot.c:118:2: note: in expansion of macro 'lockdep_assert_held'
  118 |  lockdep_assert_held(&cpu_running);

There are a lot of archs which use cpu_running in smpboot.c (arm,
arm64, openrisc, xtensa, s390, x86, mips), but none of them try
lockdep_assert_held(&cpu_running.wait.lock). So Just remove it.

Signed-off-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Guo Ren <guoren@linux.alibaba.com>
---
 arch/riscv/kernel/smpboot.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index 4e99227..defc4e1 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -121,7 +121,6 @@ int __cpu_up(unsigned int cpu, struct task_struct *tidle)
 
 	ret = start_secondary_cpu(cpu, tidle);
 	if (!ret) {
-		lockdep_assert_held(&cpu_running);
 		wait_for_completion_timeout(&cpu_running,
 					    msecs_to_jiffies(1000));
 
-- 
2.7.4


_______________________________________________
linux-riscv mailing list
linux-riscv@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-riscv
